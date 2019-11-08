//---------------------------------------------------------------------------
// File       : eth_mac_support_resets.v
// Author     : Xilinx Inc.
// -----------------------------------------------------------------------------
// (c) Copyright 2013 Xilinx, Inc. All rights reserved.
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
// Description: This module holds the shared resets for the IDELAYCTRL
//              and the MMCM
//------------------------------------------------------------------------------

`timescale 1ns / 1ps

module eth_mac_support_resets
(
    input           glbl_rstn,
    input           refclk,
    input           idelayctrl_ready,
    output          idelayctrl_reset_out,
    input           gtx_clk,
    input           gtx_dcm_locked,
    output          gtx_mmcm_rst_out           // The reset pulse for the MMCM.
);

   wire             glbl_rst;

   wire             idelayctrl_reset_in;       // Used to trigger reset_sync generation in refclk domain.
   wire             idelayctrl_reset_sync;     // Used to create a reset pulse in the IDELAYCTRL refclk domain.
   reg   [3:0]      idelay_reset_cnt;          // Counter to create a long IDELAYCTRL reset pulse.
   reg              idelayctrl_reset;

   wire             gtx_mmcm_rst_in;
   wire             gtx_dcm_locked_int;
   wire             gtx_dcm_locked_sync;
   reg              gtx_dcm_locked_reg = 1;
   reg              gtx_dcm_locked_edge = 1;


 assign glbl_rst              = !glbl_rstn;

 //----------------------------------------------------------------------------
 // Reset circuitry associated with the IDELAYCTRL
 //----------------------------------------------------------------------------

 assign idelayctrl_reset_out  = idelayctrl_reset;
 assign idelayctrl_reset_in   = glbl_rst || !idelayctrl_ready;

   // Create a synchronous reset in the IDELAYCTRL refclk clock domain.
   eth_mac_block_reset_sync idelayctrl_reset_gen (
      .clk              (refclk),
      .enable           (1'b1),
      .reset_in         (idelayctrl_reset_in),
      .reset_out        (idelayctrl_reset_sync)
   );

   // Reset circuitry for the IDELAYCTRL reset.

   // The IDELAYCTRL must experience a pulse which is at least 50 ns in
   // duration.  This is ten clock cycles of the 200MHz refclk.  Here we
   // drive the reset pulse for 12 clock cycles.
   always @(posedge refclk)
   begin
      if (idelayctrl_reset_sync) begin
         idelay_reset_cnt     <= 4'b0000;
         idelayctrl_reset     <= 1'b1;
      end
      else begin
         case (idelay_reset_cnt)
            4'b0000 : idelay_reset_cnt <= 4'b0001;
            4'b0001 : idelay_reset_cnt <= 4'b0010;
            4'b0010 : idelay_reset_cnt <= 4'b0011;
            4'b0011 : idelay_reset_cnt <= 4'b0100;
            4'b0100 : idelay_reset_cnt <= 4'b0101;
            4'b0101 : idelay_reset_cnt <= 4'b0110;
            4'b0110 : idelay_reset_cnt <= 4'b0111;
            4'b0111 : idelay_reset_cnt <= 4'b1000;
            4'b1000 : idelay_reset_cnt <= 4'b1001;
            4'b1001 : idelay_reset_cnt <= 4'b1010;
            4'b1010 : idelay_reset_cnt <= 4'b1011;
            4'b1011 : idelay_reset_cnt <= 4'b1100;
            default : idelay_reset_cnt <= 4'b1100;
         endcase
         if (idelay_reset_cnt == 4'b1100) begin
            idelayctrl_reset  <= 1'b0;
         end
         else begin
            idelayctrl_reset  <= 1'b1;
         end
      end
   end


  //----------------------------------------------------------------------------
  // Reset circuitry associated with the MMCM
  //----------------------------------------------------------------------------

  assign gtx_mmcm_rst_in = glbl_rst | gtx_dcm_locked_edge;

  // Synchronise the async dcm_locked into the gtx_clk clock domain
   eth_mac_block_sync_block lock_sync (
     .clk                   (gtx_clk),
     .data_in               (gtx_dcm_locked),
     .data_out              (gtx_dcm_locked_sync)
  );

  // for the falling edge detect we want to force this at power on so init the flop to 1
  always @(posedge gtx_clk)
  begin
     gtx_dcm_locked_reg     <= gtx_dcm_locked_sync;
     gtx_dcm_locked_edge    <= gtx_dcm_locked_reg & !gtx_dcm_locked_sync;
  end

  // the MMCM reset should be at least 5ns - that is one cycle of the input clock -
  // since the source of the input reset is unknown (a push switch in board design)
  // this needs to be debounced
   eth_mac_block_reset_sync gtx_mmcm_reset_gen (
      .clk                  (gtx_clk),
      .enable               (1'b1),
      .reset_in             (gtx_mmcm_rst_in),
      .reset_out            (gtx_mmcm_rst_out)
   );


endmodule


