//------------------------------------------------------------------------------
// File       : eth_mac.v
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
// Description: This is the wrapper file for the Tri-Mode Ethernet MAC IP.
//
  
// This wrapper instantiates the TEMAC core support level
//------------------------------------------------------------------------------

`timescale 1 ps/1 ps


//------------------------------------------------------------------------------
// The entity declaration for the block level example design.
//------------------------------------------------------------------------------

(* CORE_GENERATION_INFO = "eth_mac,eth_mac_support,{x_ipProduct=Vivado 2018.3,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=tri_mode_ethernet_mac,x_ipVersion=9.0,x_ipCoreRevision=13,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,x_ipLicense=tri_mode_eth_mac@2015.04(design_linking),x_ipLicense=eth_avb_endpoint@2015.04(design_linking),c_component_name=eth_mac,c_physical_interface=RGMII,c_half_duplex=false,c_has_host=false,c_has_mdio=false,c_mdio_external=false,c_axilite_freq=150.00,c_add_filter=false,c_at_entries=0,c_family=artix7,c_mac_speed=TRI_SPEED,c_int_clk_src=User_Clk2,c_int_mode_type=BASEX,c_has_stats=false,c_num_stats=34,c_cntr_rst=true,c_stats_width=64,c_avb=false,c_1588=0,c_tx_inband_cf_enable=false,c_rx_inband_ts_enable=false,c_tx_tuser_width=1,c_rx_vec_width=79,c_tx_vec_width=79,c_addr_width=12,c_pfc=false,c_mii_io=true,c_data_rate=1_Gbps}" *)
(* X_CORE_INFO = "eth_mac_support,Vivado 2018.3" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module eth_mac  (
      input                gtx_clk,
      
      
 
// These output clocks can be connected to input ports gtx_clk and gtx_clk90
// for secondary cores that are generated with the 'Shared logic in example design option'  
      output               gtx_clk_out,
      output               gtx_clk90_out,
      
 
      // Reference clock for IDELAYCTRL's
      input                refclk,
   
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


   //---------------------------------------------------------------------------
   // Instantiate the TEMAC core support level
   //---------------------------------------------------------------------------
   eth_mac_support inst(
      .gtx_clk                             (gtx_clk),
      
      .gtx_clk_out                        (gtx_clk_out), 
      .gtx_clk90_out                      (gtx_clk90_out),    
      // Reference clock for IDELAYCTRL's
      .refclk                             (refclk),

      // asynchronous reset
      .glbl_rstn                          (glbl_rstn),
      .rx_axi_rstn                        (rx_axi_rstn),
      .tx_axi_rstn                        (tx_axi_rstn),

      // Receiver Interface
      //--------------------------
      .rx_enable                          (rx_enable),

      .rx_statistics_vector               (rx_statistics_vector),
      .rx_statistics_valid                (rx_statistics_valid),

      .rx_mac_aclk                        (rx_mac_aclk),
      .rx_reset                           (rx_reset),
      .rx_axis_mac_tdata                  (rx_axis_mac_tdata),
      .rx_axis_mac_tvalid                 (rx_axis_mac_tvalid),
      .rx_axis_mac_tlast                  (rx_axis_mac_tlast),
      .rx_axis_mac_tuser                  (rx_axis_mac_tuser),
      // Transmitter Interface
      //-----------------------------
      .tx_enable                          (tx_enable),

      .tx_ifg_delay                       (tx_ifg_delay),
      .tx_statistics_vector               (tx_statistics_vector),
      .tx_statistics_valid                (tx_statistics_valid),

      .tx_mac_aclk                        (tx_mac_aclk),
      .tx_reset                           (tx_reset),
      .tx_axis_mac_tdata                  (tx_axis_mac_tdata),
      .tx_axis_mac_tvalid                 (tx_axis_mac_tvalid),
      .tx_axis_mac_tlast                  (tx_axis_mac_tlast),
      .tx_axis_mac_tuser                  (tx_axis_mac_tuser),
      .tx_axis_mac_tready                 (tx_axis_mac_tready),

      // MAC Control Interface
      //----------------------
      .pause_req                          (pause_req),
      .pause_val                          (pause_val),

      .speedis100                         (speedis100),
      .speedis10100                       (speedis10100),
      // RGMII Interface
      //----------------
      .rgmii_txd                          (rgmii_txd),
      .rgmii_tx_ctl                       (rgmii_tx_ctl),
      .rgmii_txc                          (rgmii_txc),
      .rgmii_rxd                          (rgmii_rxd),
      .rgmii_rx_ctl                       (rgmii_rx_ctl),
      .rgmii_rxc                          (rgmii_rxc),
      .inband_link_status                 (inband_link_status),
      .inband_clock_speed                 (inband_clock_speed),
      .inband_duplex_status               (inband_duplex_status),

      // Configuration Vectors
      //---------------------
      .rx_configuration_vector            (rx_configuration_vector),
      .tx_configuration_vector            (tx_configuration_vector)
    );


endmodule

