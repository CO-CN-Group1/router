//------------------------------------------------------------------------------
// File       : eth_mac_block.v
// Author     : Xilinx Inc.
// -----------------------------------------------------------------------------
// (c) Copyright 2004-2013 Xilinx, Inc. All rights reserved.
//
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
//
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
//
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
//
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// -----------------------------------------------------------------------------
// Description: This is the block level Verilog design for the Tri-Mode
//              Ethernet MAC Example Design.
//
//              This block level:
//
//              * instantiates all clock enable logic required to operate the
//                TEMAC and its example design;
//
//              * instantiates appropriate PHY interface module (GMII/MII/RGMII)
//                as required based on the user configuration;
//
//              Please refer to the Datasheet, Getting Started Guide, and
//              the Tri-Mode Ethernet MAC User Gude for further information.
//
//
//              -----------------------------------------|
//              | BLOCK LEVEL WRAPPER                    |
//              |                                        |
//              |    ---------------------               |
//              |    | ETHERNET MAC      |               |
//              |    | CORE              |  ---------    |
//              |    |                   |  |       |    |
//            --|--->| Tx            Tx  |--|       |--->|
//              |    | AXI           PHY |  |       |    |
//              |    | I/F           I/F |  |       |    |
//              |    |                   |  | PHY   |    |
//              |    |                   |  | I/F   |    |
//              |    |                   |  |       |    |
//              |    | Rx            Rx  |  |       |    |
//              |    | AXI           PHY |  |       |    |
//            <-|----| I/F           I/F |<-|       |<---|
//              |    |                   |  ---------    |
//              |    |                   |               |
//              |    ---------------------               |
//              |                                        |
//              |     clock enable logic                 |
//              |                                        |
//              -----------------------------------------|
//

`timescale 1 ps/1 ps


//------------------------------------------------------------------------------
// The entity declaration for the block level example design.
//------------------------------------------------------------------------------

module eth_mac_block (
      input                gtx_clk,
      
      
      input                gtx_clk90,
      
      // asynchronous reset
      input                glbl_rstn,
      input                rx_axi_rstn,
      input                tx_axi_rstn,

      // Receiver Interface
      //--------------------------
      output               rx_enable,

      output      [27:0]   rx_statistics_vector,
      output               rx_statistics_valid,

      output               rx_mac_aclk,
      output               rx_reset,
      output      [7:0]    rx_axis_mac_tdata,
      output               rx_axis_mac_tvalid,
      output               rx_axis_mac_tlast,
      output               rx_axis_mac_tuser,


      // Transmitter Interface
      //-----------------------------
      output               tx_enable,

      input       [7:0]    tx_ifg_delay,
      output      [31:0]   tx_statistics_vector,
      output               tx_statistics_valid,

      output               tx_mac_aclk,
      output               tx_reset,
      input       [7:0]    tx_axis_mac_tdata,
      input                tx_axis_mac_tvalid,
      input                tx_axis_mac_tlast,
      input                tx_axis_mac_tuser,
      output               tx_axis_mac_tready,

      // MAC Control Interface
      //----------------------
      input                pause_req,
      input       [15:0]   pause_val,

      // Speed Interface
      //-----------------------
      output               speedis100,
      output               speedis10100,
      // RGMII Interface
      //----------------
      output      [3:0]    rgmii_txd,
      output               rgmii_tx_ctl,
      output               rgmii_txc,
      input       [3:0]    rgmii_rxd,
      input                rgmii_rx_ctl,
      input                rgmii_rxc,
      output               inband_link_status,
      output      [1:0]    inband_clock_speed,
      output               inband_duplex_status,

      // Configuration Vectors
      //---------------------
      input       [79:0]   rx_configuration_vector,
      input       [79:0]   tx_configuration_vector
      );

   wire           tx_reset90;

   //---------------------------------------------------------------------------
   // internal signals used in this block level wrapper.
   //---------------------------------------------------------------------------

   wire           gmii_tx_en_int;            // Internal gmii_tx_en signal.
   wire           gmii_tx_er_int;            // Internal gmii_tx_er signal.
   wire  [7:0]    gmii_txd_int;              // Internal gmii_txd signal.
   wire           gmii_rx_dv_int;            // gmii_rx_dv registered in IOBs.
   wire           gmii_rx_er_int;            // gmii_rx_er registered in IOBs.
   wire  [7:0]    gmii_rxd_int;              // gmii_rxd registered in IOBs.
   reg            rx_enable_int = 0;         // rx_enable signal to throttle data
   wire           tx_enable_int;
   wire           rx_mac_aclk_int;           // Internal receive gmii/mii clock signal.
   wire           tx_mac_aclk_int;           // Internal transmit gmii/mii clock signal.
   wire           speedis100_int;            // Asserted when speed is 100Mb/s.
   wire           speedis10100_int;          // Asserted when speed is 10Mb/s or 100Mb/s.
   wire           rxspeedis10100;            // MAC speed setting resampled on the transmitter clock
   wire           tx_reset_int;             // Synchronous reset in the MAC and gmii Tx domain
   wire           rx_reset_int;             // Synchronous reset in the MAC and gmii Rx domain
   wire           phy_tx_enable;
   wire           phy_tx_enable_falling;
   wire           clk_div5;
   wire           clk_div5_shift;
   wire  [31:0]   rx_statistics_vector_int;
   wire           rx_statistics_valid_int;
   wire  [39:0]   tx_statistics_vector_int;
   wire           tx_statistics_valid_int;
   wire  [4:33]   increment_vector;
   wire [127:0]   tx_axis_mac_tuser_int;

   assign increment_vector = 0;


   //---------------------------------------------------------------------------
   // Assign internal to external connections
   //---------------------------------------------------------------------------

   // assign the internal reset signals to output ports
   assign rx_reset = rx_reset_int;
   assign tx_reset = tx_reset_int;

   // Assign the internal clock signals to output ports.
   assign tx_enable = tx_enable_int;
   assign rx_enable = rx_enable_int;
   assign rx_mac_aclk = rx_mac_aclk_int;
   assign tx_mac_aclk = tx_mac_aclk_int;

   // Other signal assignments
   assign speedis100 = speedis100_int;
   assign speedis10100 = speedis10100_int;
   assign tx_axis_mac_tuser_int[127:1] = 127'b0;
   assign tx_axis_mac_tuser_int[0]     = tx_axis_mac_tuser;

  //----------------------------------------------------------------------------
  // RGMII Transmitter Clock Management :
  //----------------------------------------------------------------------------
  // use a synchroniser to provide the tx_reset90 as the source is already in
  // the correct clock just on the wrong phase (and will always be seen)

     eth_mac_block_sync_block tx_reset90_sync (
     .clk              (gtx_clk90),
     .data_in          (tx_reset_int),
     .data_out         (tx_reset90)
  );
  

   assign tx_mac_aclk_int = gtx_clk;

   //---------------------------------------------------------------------------
   // Transmitter Clock Enable generation circuit. These circuits produce the
   // clock enables for 10/100/1000 operation.
   //---------------------------------------------------------------------------

   eth_mac_clk_en_gen enable_gen (
      .reset            (tx_reset_int),
      .speed_is_10_100  (speedis10100_int),
      .speed_is_100     (speedis100_int),
      .clk              (gtx_clk),
      .clk90            (gtx_clk90),
      .client_tx_enable (tx_enable_int),
      .phy_tx_enable    (phy_tx_enable),
      .phy_tx_enable_falling (phy_tx_enable_falling),
      .clk_div5         (clk_div5),
      .clk_div5_shift   (clk_div5_shift)
   );


   //---------------------------------------------------------------------------
   // Clock Enable circuitry
   //---------------------------------------------------------------------------

   // Resynchronise the speed selection signal in the receiver clock domain
   eth_mac_block_sync_block rxspeedis10100gen (
      .clk              (rx_mac_aclk_int),
      .data_in          (speedis10100_int),
      .data_out         (rxspeedis10100)
   );

   // Create the receiver clock enable
   always @(posedge rx_mac_aclk_int)
   begin
      if (rx_reset_int == 1'b1) begin
         rx_enable_int <= 1'b0;
      end
      else begin
         if (rxspeedis10100 == 1'b1)
            rx_enable_int <= ~(rx_enable_int);
         else
            rx_enable_int <= 1'b1;
      end
   end




   //---------------------------------------------------------------------------
   // Instantiate RGMII Interface
   //---------------------------------------------------------------------------

   // Instantiate the RGMII physical interface logic
   eth_mac_rgmii_v2_0_if rgmii_interface (
      // Synchronous resets
      .tx_reset90       (tx_reset90),

      .tx_reset         (tx_reset_int),
      .rx_reset         (rx_reset_int),

      // Current operating speed is 10/100
      .speedis10100     (speedis10100_int),

      // The following ports are the RGMII physical interface: these will be at
      // pins on the FPGA
      .rgmii_txd        (rgmii_txd),
      .rgmii_tx_ctl     (rgmii_tx_ctl),
      .rgmii_txc        (rgmii_txc),
      .rgmii_rxd        (rgmii_rxd),
      .rgmii_rx_ctl     (rgmii_rx_ctl),
      .rgmii_rxc        (rgmii_rxc),

      // The following signals are in the RGMII in-band status signals
      .link_status      (inband_link_status),
      .clock_speed      (inband_clock_speed),
      .duplex_status    (inband_duplex_status),

      // The following ports are the internal GMII connections from IOB logic
      // to the TEMAC core
      .phy_tx_enable    (phy_tx_enable),
      .phy_tx_enable_falling (phy_tx_enable_falling),
      .txd_from_mac     (gmii_txd_int),
      .tx_en_from_mac   (gmii_tx_en_int),
      .tx_er_from_mac   (gmii_tx_er_int),
      .tx_clk           (tx_mac_aclk_int),
      .tx_clk90         (gtx_clk90),
      .clk_div5         (clk_div5),
      .clk_div5_shift   (clk_div5_shift),
      .rxd_to_mac       (gmii_rxd_int),
      .rx_dv_to_mac     (gmii_rx_dv_int),
      .rx_er_to_mac     (gmii_rx_er_int),

      // Receiver clock for the MAC and Client Logic
      .rx_clk           (rx_mac_aclk_int)
      );



   assign rx_statistics_vector = rx_statistics_vector_int[27:0];
   assign rx_statistics_valid  = rx_statistics_valid_int;
   assign tx_statistics_vector = tx_statistics_vector_int[31:0];
   assign tx_statistics_valid  = tx_statistics_valid_int;


   //---------------------------------------------------------------------------
   // Instantiate the TEMAC encrypted HDL
   // DO NOT MODIFY this instantiation
   //---------------------------------------------------------------------------
   tri_mode_ethernet_mac_v9_0_13 #(
      .C_S_AXI_ADDR_WIDTH        (12),
      .C_PHYSICAL_INTERFACE      ("RGMII"),
      .C_INTERNAL_MODE_TYPE      ("BASEX"),
      .C_HALF_DUPLEX             (0),
      .C_HAS_HOST                (0),
      .C_ADD_FILTER              (0),
      .C_AT_ENTRIES              (0),
      .C_FAMILY                  ("artix7"),
      .C_HAS_2G5                 (0),
      .C_MAC_SPEED               ("TRI_SPEED"),
      .C_HAS_STATS               (0),
      .C_NUM_STATS               (34),
      .C_CNTR_RST                (1),
      .C_STATS_WIDTH             (64),
      .C_AVB                     (0),
      .C_RX_VEC_WIDTH            (79),
      .C_TX_VEC_WIDTH            (79),
      .C_1588                    (0),
      .C_TX_INBAND_CF_ENABLE     (0),
      .C_RX_INBAND_TS_ENABLE     (0),
      .C_PFC                     (0),
      .C_HAS_MDIO                (0),
      .C_DEVICE_FAMILY_US        (0)
    ) eth_mac_core (

      // Reset signals
      .glbl_rstn                 (glbl_rstn),
      .rx_axi_rstn               (rx_axi_rstn),
      .tx_axi_rstn               (tx_axi_rstn),

      // 1588 Timer input (unused)
      .systemtimer_s_field       (48'd0),
      .systemtimer_ns_field      (32'd0),
      .correction_timer          (64'b0),

      // Receiver Interface.
      .rx_axi_clk                (rx_mac_aclk_int),
      .rx_reset_out              (rx_reset_int),
      .rx_axis_mac_tdata         (rx_axis_mac_tdata),
      .rx_axis_mac_tvalid        (rx_axis_mac_tvalid),
      .rx_axis_mac_tlast         (rx_axis_mac_tlast),
      .rx_axis_mac_tuser         (rx_axis_mac_tuser),

      // rx sideband signals
      .rx_statistics_vector      (rx_statistics_vector_int),
      .rx_statistics_valid       (rx_statistics_valid_int),
      .rx_enable                 (rx_enable_int),
      .rx_axis_filter_tuser      (),

      // 1588 Rx timestamping (unused)
      .rx_ts_axis_tvalid         (),
      .rx_ts_axis_tdata          (),
      .rxphy_s_field             (48'd0),
      .rxphy_ns_field            (32'd0),
      .rxphy_correction_timer    (64'b0),

      // Transmitter Interface
      .tx_axi_clk                (tx_mac_aclk_int),
      .tx_reset_out              (tx_reset_int),
      .tx_axis_mac_tdata         (tx_axis_mac_tdata),
      .tx_axis_mac_tvalid        (tx_axis_mac_tvalid),
      .tx_axis_mac_tlast         (tx_axis_mac_tlast),
      .tx_axis_mac_tuser         (tx_axis_mac_tuser_int),
      .tx_axis_mac_tready        (tx_axis_mac_tready),

      // tx sideband signals
      .tx_collision              (),
      .tx_retransmit             (),
      .tx_enable                 (tx_enable_int),
      .tx_ifg_delay              (tx_ifg_delay),
      .tx_statistics_vector      (tx_statistics_vector_int),
      .tx_statistics_valid       (tx_statistics_valid_int),
      .tx_ts_axis_tvalid         (),
      .tx_ts_axis_tdata          (),

      // AVB AV interface (unused)
       .tx_axis_av_tdata          (8'd0),
      .tx_axis_av_tvalid         (1'b0),
      .tx_axis_av_tlast          (1'b0),
      .tx_axis_av_tuser          (1'b0),
      .tx_axis_av_tready         (),
      .rx_axis_av_tdata          (),
      .rx_axis_av_tvalid         (),
      .rx_axis_av_tlast          (),
      .rx_axis_av_tuser          (),
      .rtc_clk                   (1'b0),
      .rtc_nanosec_field         (),
      .rtc_sec_field             (),
      .clk8k                     (),
      .rtc_nanosec_field_1722    (),
      .interrupt_ptp_timer       (),
      .interrupt_ptp_rx          (),
      .interrupt_ptp_tx          (),

      // Statistics Interface (unused)
      .stats_ref_clk             (1'b0),
      .increment_vector          (increment_vector),
      // Flow Control Interface
      .pause_req                 (pause_req),
      .pause_val                 (pause_val),
      .tx_pfc_p0_tvalid          (1'b0),
      .tx_pfc_p1_tvalid          (1'b0),
      .tx_pfc_p2_tvalid          (1'b0),
      .tx_pfc_p3_tvalid          (1'b0),
      .tx_pfc_p4_tvalid          (1'b0),
      .tx_pfc_p5_tvalid          (1'b0),
      .tx_pfc_p6_tvalid          (1'b0),
      .tx_pfc_p7_tvalid          (1'b0),
      .rx_pfc_p0_tvalid          (),
      .rx_pfc_p1_tvalid          (),
      .rx_pfc_p2_tvalid          (),
      .rx_pfc_p3_tvalid          (),
      .rx_pfc_p4_tvalid          (),
      .rx_pfc_p5_tvalid          (),
      .rx_pfc_p6_tvalid          (),
      .rx_pfc_p7_tvalid          (),
      .rx_pfc_p0_tready          (1'b0),
      .rx_pfc_p1_tready          (1'b0),
      .rx_pfc_p2_tready          (1'b0),
      .rx_pfc_p3_tready          (1'b0),
      .rx_pfc_p4_tready          (1'b0),
      .rx_pfc_p5_tready          (1'b0),
      .rx_pfc_p6_tready          (1'b0),
      .rx_pfc_p7_tready          (1'b0),

      // Speed Interface
      .speed_is_100              (speedis100_int),
      .speed_is_10_100           (speedis10100_int),

      // GMII/MII Interface
      .gmii_tx_clken             (phy_tx_enable),
      .gmii_txd                  (gmii_txd_int),
      .gmii_tx_en                (gmii_tx_en_int),
      .gmii_tx_er                (gmii_tx_er_int),
      .gmii_crs                  (1'b0),
      .gmii_col                  (1'b0),
      .gmii_rxd                  (gmii_rxd_int),
      .gmii_rx_dv                (gmii_rx_dv_int),
      .gmii_rx_er                (gmii_rx_er_int),

      // MDIO Interface (unused)
      .mdc_out                   (),
      .mdio_in                   (1'b0),
      .mdio_out                  (),
      .mdio_tri                  (),

      // IPIC Interface (unused)
      .bus2ip_clk                (1'b0),
      .bus2ip_reset              (1'b0),
      .bus2ip_addr               ({12{1'b0}}),
      .bus2ip_cs                 (1'b0),
      .bus2ip_rdce               (1'b0),
      .bus2ip_wrce               (1'b0),
      .bus2ip_data               (32'h0),
      .ip2bus_data               (),
      .ip2bus_wrack              (),
      .ip2bus_rdack              (),
      .ip2bus_error              (),
      .mac_irq                   (),

      // Configuration Vectors
      .rx_mac_config_vector      (rx_configuration_vector),
      .tx_mac_config_vector      (tx_configuration_vector)
    );


endmodule

