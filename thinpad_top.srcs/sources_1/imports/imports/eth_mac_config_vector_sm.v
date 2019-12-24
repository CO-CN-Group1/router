//------------------------------------------------------------------------------
// File       : eth_mac_config_vector_sm.v
// Author     : Xilinx Inc.
// -----------------------------------------------------------------------------
// (c) Copyright 2010 Xilinx, Inc. All rights reserved.
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
// Description:  This module is reponsible for bringing up the MAC
// to enable basic packet transfer in both directions.
// Due to the lack of a management interface the PHy cannot be
// accessed and therefore this solution will not work when
// targeted to a demo platform unless some other method of enabing the PHY
// is used.
//
//------------------------------------------------------------------------------

`timescale 1 ps/1 ps

module eth_mac_config_vector_sm (
      input                gtx_clk,
      input                gtx_resetn,

      input       [1:0]    mac_speed,
      input                update_speed,

      output      [79:0]   rx_configuration_vector,
      output      [79:0]   tx_configuration_vector
);

parameter RUN_HALF_DUPLEX        = 0;

// main state machine

parameter  STARTUP               = 0,
           RESET_MAC             = 1,
           CHECK_SPEED           = 2;

//-------------------------------------------------
// Wire/reg declarations
reg      [1:0]    control_status;          // used to keep track of axi transactions
reg               update_speed_reg;
reg               update_speed_reg2;
wire              update_speed_sync;

reg      [20:0]   count_shift = 0;

reg               tx_reset;
wire              tx_enable;
wire              tx_vlan_enable;
wire              tx_fcs_enable;
wire              tx_jumbo_enable;
wire              tx_fc_enable;
wire              tx_hd_enable;
wire              tx_ifg_adjust;
reg      [1:0]    tx_speed = 2'b0;
wire              tx_max_frame_enable;
wire     [14:0]   tx_max_frame_length;
wire     [47:0]   tx_pause_addr;

reg               rx_reset;
wire              rx_enable;
wire              rx_vlan_enable;
wire              rx_fcs_enable;
wire              rx_jumbo_enable;
wire              rx_fc_enable;
wire              rx_hd_enable;
wire              rx_len_type_chk_disable;
wire              rx_control_len_chk_dis;
wire              rx_promiscuous;
reg      [1:0]    rx_speed;
wire              rx_max_frame_enable;
wire     [14:0]   rx_max_frame_length;
wire     [47:0]   rx_pause_addr;

wire              gtx_reset;

assign gtx_reset = !gtx_resetn;

assign rx_configuration_vector =  {rx_pause_addr,
                                   1'b0, rx_max_frame_length,
                                   1'b0, rx_max_frame_enable,
                                   rx_speed,
                                   rx_promiscuous,
                                   1'b0, rx_control_len_chk_dis,
                                   rx_len_type_chk_disable,
                                   1'b0, rx_hd_enable,
                                   rx_fc_enable,
                                   rx_jumbo_enable,
                                   rx_fcs_enable,
                                   rx_vlan_enable,
                                   rx_enable,
                                   rx_reset};

assign tx_configuration_vector =  {tx_pause_addr,
                                   1'b0, tx_max_frame_length,
                                   1'b0, tx_max_frame_enable,
                                   tx_speed,
                                   3'b000, tx_ifg_adjust,
                                   1'b0, tx_hd_enable,
                                   tx_fc_enable,
                                   tx_jumbo_enable,
                                   tx_fcs_enable,
                                   tx_vlan_enable,
                                   tx_enable,
                                   tx_reset};

// don't reset this  - it will always be updated before it is used..
// it does need an init value (zero)
always @(posedge gtx_clk)
begin
    count_shift <= {count_shift[19:0], (gtx_reset || tx_reset)};
end

eth_mac_sync_block rx_stats_sync (
   .clk              (gtx_clk),
   .data_in          (update_speed),
   .data_out         (update_speed_sync)
);

// capture update_spped as only want to react to one edge
always @(posedge gtx_clk)
begin
   if (gtx_reset) begin
      update_speed_reg  <= 0;
      update_speed_reg2 <= 0;
   end
   else  begin
      update_speed_reg  <= update_speed_sync;
      update_speed_reg2 <= update_speed_reg;
   end
end

//----------------------------------------------------------------------------
// Management process. This process sets up the configuration by
// turning off flow control and other functionality
//----------------------------------------------------------------------------

assign tx_enable               = 1'b1;
assign tx_vlan_enable          = 1'b0;
assign tx_fcs_enable           = 1'b0;
assign tx_jumbo_enable         = 1'b0;
assign tx_fc_enable            = 1'b1;
assign tx_hd_enable            = RUN_HALF_DUPLEX;
assign tx_ifg_adjust           = 1'b0;
assign tx_max_frame_enable     = 1'b0;
assign tx_max_frame_length     = 15'b0;
assign tx_pause_addr           = 48'h0605040302DA;

assign rx_enable               = 1'b1;
assign rx_vlan_enable          = 1'b0;
assign rx_fcs_enable           = 1'b0;
assign rx_jumbo_enable         = 1'b0;
assign rx_fc_enable            = 1'b1;
assign rx_hd_enable            = RUN_HALF_DUPLEX;
assign rx_len_type_chk_disable = 1'b0;
assign rx_control_len_chk_dis  = 1'b0;
assign rx_promiscuous          = 1'b0;
assign rx_max_frame_enable     = 1'b0;
assign rx_max_frame_length     = 15'b0;
assign rx_pause_addr           = 48'h0605040302DA;


always @(posedge gtx_clk)
begin
   if (gtx_reset) begin
      tx_reset                <= 0;
      tx_speed                <= mac_speed;
      rx_reset                <= 0;
      rx_speed                <= mac_speed;
      control_status          <= STARTUP;

   end
   // main state machine is kicking off multi cycle accesses in each state so has to
   // stall while they take place
   else  begin
      case (control_status)
         STARTUP : begin
            // this state will be ran after reset to wait for count_shift
            if (count_shift[20] == 1'b0) begin
               control_status <= RESET_MAC;
            end
         end
         RESET_MAC : begin
            $display("** Note: Reseting MAC");
            tx_reset       <= 1;
            rx_reset       <= 1;
            rx_speed       <= mac_speed;
            tx_speed       <= mac_speed;
            control_status <= CHECK_SPEED;
         end
         CHECK_SPEED : begin
            // hold the tx/rx resets for a number of clocks to ensure they are caught
            if (count_shift[20] == 1'b1) begin
               tx_reset       <= 0;
               rx_reset       <= 0;
            end
            if (update_speed_reg && !update_speed_reg2) begin
              control_status <= RESET_MAC;
            end
         end
         default : begin
            control_status  <= STARTUP;
         end
      endcase
   end
end


endmodule

