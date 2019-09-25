//------------------------------------------------------------------------------
// Title      : Demo testbench
// Project    : Tri-Mode Ethernet MAC
//------------------------------------------------------------------------------
// File       : demo_tb.v
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
// Description: This testbench will exercise the ports of the MAC core
//              to demonstrate the functionality.
//------------------------------------------------------------------------------
//
// This testbench performs the following operations on the MAC core
// and its design example:


// and its design example:
//  - Four frames are then pushed into the receiver from the PHY
//    interface (GMII/MII or RGMII):
//    The first is of minimum length (Length/Type = Length = 46 bytes).
//    The second frame sets Length/Type to Type = 0x8000.
//    The third frame has an error inserted.
//    The fourth frame only sends 4 bytes of data: the remainder of the
//    data field is padded up to the minimum frame length i.e. 46 bytes.

//  - These frames are then parsed from the MAC into the MAC's design
//    example.  The design example provides a MAC user loopback
//    function so that frames which are received without error will be
//    looped back to the MAC transmitter and transmitted back to the
//    testbench.  The testbench verifies that this data matches that
//    previously injected into the receiver.

//  - The four frames are then re-sent at 100Mb/s, 10Mb/s and finally 1Gb/s again.


//----------------------------------------------------------------------
//                         DEMONSTRATION TESTBENCH                     |
//                                                                     |
//                                                                     |
//     ----------------------------------------------                  |
//     |           TOP LEVEL WRAPPER (DUT)          |                  |
//     |  -------------------    ----------------   |                  |
//     |  | USER LOOPBACK   |    | TRI-MODE     |   |                  |
//     |  | DESIGN EXAMPLE  |    | ETHERNET MAC |   |                  |
//     |  |                 |    | CORE         |   |                  |
//     |  |                 |    |              |   |       Monitor    |
//     |  |         ------->|--->|          Tx  |-------->  Frames     |
//     |  |         |       |    |          PHY |   |                  |
//     |  |         |       |    |          I/F |   |                  |
//     |  |         |       |    |              |   |                  |
//     |  |         |       |    |              |   |                  |
//     |  |         |       |    |              |   |                  |
//     |  |         |       |    |          Rx  |   |                  |
//     |  |         |       |    |          PHY |   |                  |
//     |  |         --------|<---|          I/F |<-------- Generate    |
//     |  |                 |    |              |   |      Frames      |
//     |  -------------------    ----------------   |                  |
//     --------------------------------^-------------                  |
//                                     |                               |
//                                     |                               |
//                                 Stimulate                           |
//                               Management I/F                        |
//                               (if present)                          |
//                                                                     |
//----------------------------------------------------------------------


`timescale 1ps / 1ps

//------------------------------------------------------------------------------
// This module is the demonstration testbench
//------------------------------------------------------------------------------

module demo_tb;

  
  parameter TB_MODE = "DEMO";

  `define FRAME_TYP [8*62+62+62+8*4+4+4+8*4+4+4+1:1]

  //----------------------------------------------------------------------------
  // types to support frame data
  //----------------------------------------------------------------------------

   eth_mac_frame_typ frame0();
   eth_mac_frame_typ frame1();
   eth_mac_frame_typ frame2();
   eth_mac_frame_typ frame3();
   eth_mac_frame_typ rx_stimulus_working_frame();
   eth_mac_frame_typ tx_monitor_working_frame();


  //----------------------------------------------------------------------------
  // Stimulus - Frame data
  //----------------------------------------------------------------------------
  // The following constant holds the stimulus for the testbench. It is
  // an ordered array of frames, with frame 0 the first to be injected
  // into the core transmit interface by the testbench.
  //----------------------------------------------------------------------------
  initial
  begin
    //-----------
    // Frame 0
    //-----------
    frame0.data[0]  = 8'hDA;  frame0.valid[0]  = 1'b1;  frame0.error[0]  = 1'b0; // Destination Address (DA)
    frame0.data[1]  = 8'h02;  frame0.valid[1]  = 1'b1;  frame0.error[1]  = 1'b0;
    frame0.data[2]  = 8'h03;  frame0.valid[2]  = 1'b1;  frame0.error[2]  = 1'b0;
    frame0.data[3]  = 8'h04;  frame0.valid[3]  = 1'b1;  frame0.error[3]  = 1'b0;
    frame0.data[4]  = 8'h05;  frame0.valid[4]  = 1'b1;  frame0.error[4]  = 1'b0;
    frame0.data[5]  = 8'h06;  frame0.valid[5]  = 1'b1;  frame0.error[5]  = 1'b0;
    frame0.data[6]  = 8'h5A;  frame0.valid[6]  = 1'b1;  frame0.error[6]  = 1'b0; // Source Address  (5A)
    frame0.data[7]  = 8'h02;  frame0.valid[7]  = 1'b1;  frame0.error[7]  = 1'b0;
    frame0.data[8]  = 8'h03;  frame0.valid[8]  = 1'b1;  frame0.error[8]  = 1'b0;
    frame0.data[9]  = 8'h04;  frame0.valid[9]  = 1'b1;  frame0.error[9]  = 1'b0;
    frame0.data[10] = 8'h05;  frame0.valid[10] = 1'b1;  frame0.error[10] = 1'b0;
    frame0.data[11] = 8'h06;  frame0.valid[11] = 1'b1;  frame0.error[11] = 1'b0;
    frame0.data[12] = 8'h00;  frame0.valid[12] = 1'b1;  frame0.error[12] = 1'b0;
    frame0.data[13] = 8'h2E;  frame0.valid[13] = 1'b1;  frame0.error[13] = 1'b0; // Length/Type = Length = 46
    frame0.data[14] = 8'h01;  frame0.valid[14] = 1'b1;  frame0.error[14] = 1'b0;
    frame0.data[15] = 8'h02;  frame0.valid[15] = 1'b1;  frame0.error[15] = 1'b0;
    frame0.data[16] = 8'h03;  frame0.valid[16] = 1'b1;  frame0.error[16] = 1'b0;
    frame0.data[17] = 8'h04;  frame0.valid[17] = 1'b1;  frame0.error[17] = 1'b0;
    frame0.data[18] = 8'h05;  frame0.valid[18] = 1'b1;  frame0.error[18] = 1'b0;
    frame0.data[19] = 8'h06;  frame0.valid[19] = 1'b1;  frame0.error[19] = 1'b0;
    frame0.data[20] = 8'h07;  frame0.valid[20] = 1'b1;  frame0.error[20] = 1'b0;
    frame0.data[21] = 8'h08;  frame0.valid[21] = 1'b1;  frame0.error[21] = 1'b0;
    frame0.data[22] = 8'h09;  frame0.valid[22] = 1'b1;  frame0.error[22] = 1'b0;
    frame0.data[23] = 8'h0A;  frame0.valid[23] = 1'b1;  frame0.error[23] = 1'b0;
    frame0.data[24] = 8'h0B;  frame0.valid[24] = 1'b1;  frame0.error[24] = 1'b0;
    frame0.data[25] = 8'h0C;  frame0.valid[25] = 1'b1;  frame0.error[25] = 1'b0;
    frame0.data[26] = 8'h0D;  frame0.valid[26] = 1'b1;  frame0.error[26] = 1'b0;
    frame0.data[27] = 8'h0E;  frame0.valid[27] = 1'b1;  frame0.error[27] = 1'b0;
    frame0.data[28] = 8'h0F;  frame0.valid[28] = 1'b1;  frame0.error[28] = 1'b0;
    frame0.data[29] = 8'h10;  frame0.valid[29] = 1'b1;  frame0.error[29] = 1'b0;
    frame0.data[30] = 8'h11;  frame0.valid[30] = 1'b1;  frame0.error[30] = 1'b0;
    frame0.data[31] = 8'h12;  frame0.valid[31] = 1'b1;  frame0.error[31] = 1'b0;
    frame0.data[32] = 8'h13;  frame0.valid[32] = 1'b1;  frame0.error[32] = 1'b0;
    frame0.data[33] = 8'h14;  frame0.valid[33] = 1'b1;  frame0.error[33] = 1'b0;
    frame0.data[34] = 8'h15;  frame0.valid[34] = 1'b1;  frame0.error[34] = 1'b0;
    frame0.data[35] = 8'h16;  frame0.valid[35] = 1'b1;  frame0.error[35] = 1'b0;
    frame0.data[36] = 8'h17;  frame0.valid[36] = 1'b1;  frame0.error[36] = 1'b0;
    frame0.data[37] = 8'h18;  frame0.valid[37] = 1'b1;  frame0.error[37] = 1'b0;
    frame0.data[38] = 8'h19;  frame0.valid[38] = 1'b1;  frame0.error[38] = 1'b0;
    frame0.data[39] = 8'h1A;  frame0.valid[39] = 1'b1;  frame0.error[39] = 1'b0;
    frame0.data[40] = 8'h1B;  frame0.valid[40] = 1'b1;  frame0.error[40] = 1'b0;
    frame0.data[41] = 8'h1C;  frame0.valid[41] = 1'b1;  frame0.error[41] = 1'b0;
    frame0.data[42] = 8'h1D;  frame0.valid[42] = 1'b1;  frame0.error[42] = 1'b0;
    frame0.data[43] = 8'h1E;  frame0.valid[43] = 1'b1;  frame0.error[43] = 1'b0;
    frame0.data[44] = 8'h1F;  frame0.valid[44] = 1'b1;  frame0.error[44] = 1'b0;
    frame0.data[45] = 8'h20;  frame0.valid[45] = 1'b1;  frame0.error[45] = 1'b0;
    frame0.data[46] = 8'h21;  frame0.valid[46] = 1'b1;  frame0.error[46] = 1'b0;
    frame0.data[47] = 8'h22;  frame0.valid[47] = 1'b1;  frame0.error[47] = 1'b0;
    frame0.data[48] = 8'h23;  frame0.valid[48] = 1'b1;  frame0.error[48] = 1'b0;
    frame0.data[49] = 8'h24;  frame0.valid[49] = 1'b1;  frame0.error[49] = 1'b0;
    frame0.data[50] = 8'h25;  frame0.valid[50] = 1'b1;  frame0.error[50] = 1'b0;
    frame0.data[51] = 8'h26;  frame0.valid[51] = 1'b1;  frame0.error[51] = 1'b0;
    frame0.data[52] = 8'h27;  frame0.valid[52] = 1'b1;  frame0.error[52] = 1'b0;
    frame0.data[53] = 8'h28;  frame0.valid[53] = 1'b1;  frame0.error[53] = 1'b0;
    frame0.data[54] = 8'h29;  frame0.valid[54] = 1'b1;  frame0.error[54] = 1'b0;
    frame0.data[55] = 8'h2A;  frame0.valid[55] = 1'b1;  frame0.error[55] = 1'b0;
    frame0.data[56] = 8'h2B;  frame0.valid[56] = 1'b1;  frame0.error[56] = 1'b0;
    frame0.data[57] = 8'h2C;  frame0.valid[57] = 1'b1;  frame0.error[57] = 1'b0;
    frame0.data[58] = 8'h2D;  frame0.valid[58] = 1'b1;  frame0.error[58] = 1'b0;
    frame0.data[59] = 8'h2E;  frame0.valid[59] = 1'b1;  frame0.error[59] = 1'b0;  // 46th Byte of Data
    // unused
    frame0.data[60] = 8'h00;  frame0.valid[60] = 1'b0;  frame0.error[60] = 1'b0;
    frame0.data[61] = 8'h00;  frame0.valid[61] = 1'b0;  frame0.error[61] = 1'b0;

    // No error in this frame
    frame0.bad_frame  = 1'b0;


    //-----------
    // Frame 1
    //-----------
    frame1.data[0]  = 8'hDA;  frame1.valid[0]  = 1'b1;  frame1.error[0]  = 1'b0; // Destination Address (DA)
    frame1.data[1]  = 8'h02;  frame1.valid[1]  = 1'b1;  frame1.error[1]  = 1'b0;
    frame1.data[2]  = 8'h03;  frame1.valid[2]  = 1'b1;  frame1.error[2]  = 1'b0;
    frame1.data[3]  = 8'h04;  frame1.valid[3]  = 1'b1;  frame1.error[3]  = 1'b0;
    frame1.data[4]  = 8'h05;  frame1.valid[4]  = 1'b1;  frame1.error[4]  = 1'b0;
    frame1.data[5]  = 8'h06;  frame1.valid[5]  = 1'b1;  frame1.error[5]  = 1'b0;
    frame1.data[6]  = 8'h5A;  frame1.valid[6]  = 1'b1;  frame1.error[6]  = 1'b0; // Source Address  (5A)
    frame1.data[7]  = 8'h02;  frame1.valid[7]  = 1'b1;  frame1.error[7]  = 1'b0;
    frame1.data[8]  = 8'h03;  frame1.valid[8]  = 1'b1;  frame1.error[8]  = 1'b0;
    frame1.data[9]  = 8'h04;  frame1.valid[9]  = 1'b1;  frame1.error[9]  = 1'b0;
    frame1.data[10] = 8'h05;  frame1.valid[10] = 1'b1;  frame1.error[10] = 1'b0;
    frame1.data[11] = 8'h06;  frame1.valid[11] = 1'b1;  frame1.error[11] = 1'b0;
    frame1.data[12] = 8'h80;  frame1.valid[12] = 1'b1;  frame1.error[12] = 1'b0; // Length/Type = Type = 8000
    frame1.data[13] = 8'h00;  frame1.valid[13] = 1'b1;  frame1.error[13] = 1'b0;
    frame1.data[14] = 8'h01;  frame1.valid[14] = 1'b1;  frame1.error[14] = 1'b0;
    frame1.data[15] = 8'h02;  frame1.valid[15] = 1'b1;  frame1.error[15] = 1'b0;
    frame1.data[16] = 8'h03;  frame1.valid[16] = 1'b1;  frame1.error[16] = 1'b0;
    frame1.data[17] = 8'h04;  frame1.valid[17] = 1'b1;  frame1.error[17] = 1'b0;
    frame1.data[18] = 8'h05;  frame1.valid[18] = 1'b1;  frame1.error[18] = 1'b0;
    frame1.data[19] = 8'h06;  frame1.valid[19] = 1'b1;  frame1.error[19] = 1'b0;
    frame1.data[20] = 8'h07;  frame1.valid[20] = 1'b1;  frame1.error[20] = 1'b0;
    frame1.data[21] = 8'h08;  frame1.valid[21] = 1'b1;  frame1.error[21] = 1'b0;
    frame1.data[22] = 8'h09;  frame1.valid[22] = 1'b1;  frame1.error[22] = 1'b0;
    frame1.data[23] = 8'h0A;  frame1.valid[23] = 1'b1;  frame1.error[23] = 1'b0;
    frame1.data[24] = 8'h0B;  frame1.valid[24] = 1'b1;  frame1.error[24] = 1'b0;
    frame1.data[25] = 8'h0C;  frame1.valid[25] = 1'b1;  frame1.error[25] = 1'b0;
    frame1.data[26] = 8'h0D;  frame1.valid[26] = 1'b1;  frame1.error[26] = 1'b0;
    frame1.data[27] = 8'h0E;  frame1.valid[27] = 1'b1;  frame1.error[27] = 1'b0;
    frame1.data[28] = 8'h0F;  frame1.valid[28] = 1'b1;  frame1.error[28] = 1'b0;
    frame1.data[29] = 8'h10;  frame1.valid[29] = 1'b1;  frame1.error[29] = 1'b0;
    frame1.data[30] = 8'h11;  frame1.valid[30] = 1'b1;  frame1.error[30] = 1'b0;
    frame1.data[31] = 8'h12;  frame1.valid[31] = 1'b1;  frame1.error[31] = 1'b0;
    frame1.data[32] = 8'h13;  frame1.valid[32] = 1'b1;  frame1.error[32] = 1'b0;
    frame1.data[33] = 8'h14;  frame1.valid[33] = 1'b1;  frame1.error[33] = 1'b0;
    frame1.data[34] = 8'h15;  frame1.valid[34] = 1'b1;  frame1.error[34] = 1'b0;
    frame1.data[35] = 8'h16;  frame1.valid[35] = 1'b1;  frame1.error[35] = 1'b0;
    frame1.data[36] = 8'h17;  frame1.valid[36] = 1'b1;  frame1.error[36] = 1'b0;
    frame1.data[37] = 8'h18;  frame1.valid[37] = 1'b1;  frame1.error[37] = 1'b0;
    frame1.data[38] = 8'h19;  frame1.valid[38] = 1'b1;  frame1.error[38] = 1'b0;
    frame1.data[39] = 8'h1A;  frame1.valid[39] = 1'b1;  frame1.error[39] = 1'b0;
    frame1.data[40] = 8'h1B;  frame1.valid[40] = 1'b1;  frame1.error[40] = 1'b0;
    frame1.data[41] = 8'h1C;  frame1.valid[41] = 1'b1;  frame1.error[41] = 1'b0;
    frame1.data[42] = 8'h1D;  frame1.valid[42] = 1'b1;  frame1.error[42] = 1'b0;
    frame1.data[43] = 8'h1E;  frame1.valid[43] = 1'b1;  frame1.error[43] = 1'b0;
    frame1.data[44] = 8'h1F;  frame1.valid[44] = 1'b1;  frame1.error[44] = 1'b0;
    frame1.data[45] = 8'h20;  frame1.valid[45] = 1'b1;  frame1.error[45] = 1'b0;
    frame1.data[46] = 8'h21;  frame1.valid[46] = 1'b1;  frame1.error[46] = 1'b0;
    frame1.data[47] = 8'h22;  frame1.valid[47] = 1'b1;  frame1.error[47] = 1'b0;
    frame1.data[48] = 8'h23;  frame1.valid[48] = 1'b1;  frame1.error[48] = 1'b0;
    frame1.data[49] = 8'h24;  frame1.valid[49] = 1'b1;  frame1.error[49] = 1'b0;
    frame1.data[50] = 8'h25;  frame1.valid[50] = 1'b1;  frame1.error[50] = 1'b0;
    frame1.data[51] = 8'h26;  frame1.valid[51] = 1'b1;  frame1.error[51] = 1'b0;
    frame1.data[52] = 8'h27;  frame1.valid[52] = 1'b1;  frame1.error[52] = 1'b0;
    frame1.data[53] = 8'h28;  frame1.valid[53] = 1'b1;  frame1.error[53] = 1'b0;
    frame1.data[54] = 8'h29;  frame1.valid[54] = 1'b1;  frame1.error[54] = 1'b0;
    frame1.data[55] = 8'h2A;  frame1.valid[55] = 1'b1;  frame1.error[55] = 1'b0;
    frame1.data[56] = 8'h2B;  frame1.valid[56] = 1'b1;  frame1.error[56] = 1'b0;
    frame1.data[57] = 8'h2C;  frame1.valid[57] = 1'b1;  frame1.error[57] = 1'b0;
    frame1.data[58] = 8'h2D;  frame1.valid[58] = 1'b1;  frame1.error[58] = 1'b0;
    frame1.data[59] = 8'h2E;  frame1.valid[59] = 1'b1;  frame1.error[59] = 1'b0;
    frame1.data[60] = 8'h2F;  frame1.valid[60] = 1'b1;  frame1.error[60] = 1'b0; // 47th Data byte
    // unused
    frame1.data[61] = 8'h00;  frame1.valid[61] = 1'b0;  frame1.error[61] = 1'b0;

    // No error in this frame
    frame1.bad_frame  = 1'b0;


    //-----------
    // Frame 2
    //-----------
    frame2.data[0]  = 8'hDA;  frame2.valid[0]  = 1'b1;  frame2.error[0]  = 1'b0; // Destination Address (DA)
    frame2.data[1]  = 8'h02;  frame2.valid[1]  = 1'b1;  frame2.error[1]  = 1'b0;
    frame2.data[2]  = 8'h03;  frame2.valid[2]  = 1'b1;  frame2.error[2]  = 1'b0;
    frame2.data[3]  = 8'h04;  frame2.valid[3]  = 1'b1;  frame2.error[3]  = 1'b0;
    frame2.data[4]  = 8'h05;  frame2.valid[4]  = 1'b1;  frame2.error[4]  = 1'b0;
    frame2.data[5]  = 8'h06;  frame2.valid[5]  = 1'b1;  frame2.error[5]  = 1'b0;
    frame2.data[6]  = 8'h5A;  frame2.valid[6]  = 1'b1;  frame2.error[6]  = 1'b0; // Source Address  (5A)
    frame2.data[7]  = 8'h02;  frame2.valid[7]  = 1'b1;  frame2.error[7]  = 1'b0;
    frame2.data[8]  = 8'h03;  frame2.valid[8]  = 1'b1;  frame2.error[8]  = 1'b0;
    frame2.data[9]  = 8'h04;  frame2.valid[9]  = 1'b1;  frame2.error[9]  = 1'b0;
    frame2.data[10] = 8'h05;  frame2.valid[10] = 1'b1;  frame2.error[10] = 1'b0;
    frame2.data[11] = 8'h06;  frame2.valid[11] = 1'b1;  frame2.error[11] = 1'b0;
    frame2.data[12] = 8'h00;  frame2.valid[12] = 1'b1;  frame2.error[12] = 1'b0;
    frame2.data[13] = 8'h2E;  frame2.valid[13] = 1'b1;  frame2.error[13] = 1'b0; // Length/Type = Length = 46
    frame2.data[14] = 8'h01;  frame2.valid[14] = 1'b1;  frame2.error[14] = 1'b0;
    frame2.data[15] = 8'h02;  frame2.valid[15] = 1'b1;  frame2.error[15] = 1'b0;
    frame2.data[16] = 8'h03;  frame2.valid[16] = 1'b1;  frame2.error[16] = 1'b0;
    frame2.data[17] = 8'h00;  frame2.valid[17] = 1'b1;  frame2.error[17] = 1'b0; // Underrun this frame
    frame2.data[18] = 8'h00;  frame2.valid[18] = 1'b1;  frame2.error[18] = 1'b0;
    frame2.data[19] = 8'h00;  frame2.valid[19] = 1'b1;  frame2.error[19] = 1'b0;
    frame2.data[20] = 8'h00;  frame2.valid[20] = 1'b1;  frame2.error[20] = 1'b0;
    frame2.data[21] = 8'h00;  frame2.valid[21] = 1'b1;  frame2.error[21] = 1'b0;
    frame2.data[22] = 8'h00;  frame2.valid[22] = 1'b1;  frame2.error[22] = 1'b0;
    frame2.data[23] = 8'h00;  frame2.valid[23] = 1'b1;  frame2.error[23] = 1'b1; // Error asserted
    frame2.data[24] = 8'h00;  frame2.valid[24] = 1'b1;  frame2.error[24] = 1'b0;
    frame2.data[25] = 8'h00;  frame2.valid[25] = 1'b1;  frame2.error[25] = 1'b0;
    frame2.data[26] = 8'h00;  frame2.valid[26] = 1'b1;  frame2.error[26] = 1'b0;
    frame2.data[27] = 8'h00;  frame2.valid[27] = 1'b1;  frame2.error[27] = 1'b0;
    frame2.data[28] = 8'h00;  frame2.valid[28] = 1'b1;  frame2.error[28] = 1'b0;
    frame2.data[29] = 8'h00;  frame2.valid[29] = 1'b1;  frame2.error[29] = 1'b0;
    frame2.data[30] = 8'h00;  frame2.valid[30] = 1'b1;  frame2.error[30] = 1'b0;
    frame2.data[31] = 8'h00;  frame2.valid[31] = 1'b1;  frame2.error[31] = 1'b0;
    frame2.data[32] = 8'h00;  frame2.valid[32] = 1'b1;  frame2.error[32] = 1'b0;
    frame2.data[33] = 8'h00;  frame2.valid[33] = 1'b1;  frame2.error[33] = 1'b0;
    frame2.data[34] = 8'h00;  frame2.valid[34] = 1'b1;  frame2.error[34] = 1'b0;
    frame2.data[35] = 8'h00;  frame2.valid[35] = 1'b1;  frame2.error[35] = 1'b0;
    frame2.data[36] = 8'h00;  frame2.valid[36] = 1'b1;  frame2.error[36] = 1'b0;
    frame2.data[37] = 8'h00;  frame2.valid[37] = 1'b1;  frame2.error[37] = 1'b0;
    frame2.data[38] = 8'h00;  frame2.valid[38] = 1'b1;  frame2.error[38] = 1'b0;
    frame2.data[39] = 8'h00;  frame2.valid[39] = 1'b1;  frame2.error[39] = 1'b0;
    frame2.data[40] = 8'h00;  frame2.valid[40] = 1'b1;  frame2.error[40] = 1'b0;
    frame2.data[41] = 8'h00;  frame2.valid[41] = 1'b1;  frame2.error[41] = 1'b0;
    frame2.data[42] = 8'h00;  frame2.valid[42] = 1'b1;  frame2.error[42] = 1'b0;
    frame2.data[43] = 8'h00;  frame2.valid[43] = 1'b1;  frame2.error[43] = 1'b0;
    frame2.data[44] = 8'h00;  frame2.valid[44] = 1'b1;  frame2.error[44] = 1'b0;
    frame2.data[45] = 8'h00;  frame2.valid[45] = 1'b1;  frame2.error[45] = 1'b0;
    frame2.data[46] = 8'h00;  frame2.valid[46] = 1'b1;  frame2.error[46] = 1'b0;
    frame2.data[47] = 8'h00;  frame2.valid[47] = 1'b1;  frame2.error[47] = 1'b0;
    frame2.data[48] = 8'h00;  frame2.valid[48] = 1'b1;  frame2.error[48] = 1'b0;
    frame2.data[49] = 8'h00;  frame2.valid[49] = 1'b1;  frame2.error[49] = 1'b0;
    frame2.data[50] = 8'h00;  frame2.valid[50] = 1'b1;  frame2.error[50] = 1'b0;
    frame2.data[51] = 8'h00;  frame2.valid[51] = 1'b1;  frame2.error[51] = 1'b0;
    frame2.data[52] = 8'h00;  frame2.valid[52] = 1'b1;  frame2.error[52] = 1'b0;
    frame2.data[53] = 8'h00;  frame2.valid[53] = 1'b1;  frame2.error[53] = 1'b0;
    frame2.data[54] = 8'h00;  frame2.valid[54] = 1'b1;  frame2.error[54] = 1'b0;
    frame2.data[55] = 8'h00;  frame2.valid[55] = 1'b1;  frame2.error[55] = 1'b0;
    frame2.data[56] = 8'h00;  frame2.valid[56] = 1'b1;  frame2.error[56] = 1'b0;
    frame2.data[57] = 8'h00;  frame2.valid[57] = 1'b1;  frame2.error[57] = 1'b0;
    frame2.data[58] = 8'h00;  frame2.valid[58] = 1'b1;  frame2.error[58] = 1'b0;
    frame2.data[59] = 8'h00;  frame2.valid[59] = 1'b1;  frame2.error[59] = 1'b0;
    // unused
    frame2.data[60] = 8'h00;  frame2.valid[60] = 1'b0;  frame2.error[60] = 1'b0;
    frame2.data[61] = 8'h00;  frame2.valid[61] = 1'b0;  frame2.error[61] = 1'b0;

    // Error this frame
    frame2.bad_frame  = 1'b1;


    //-----------
    // Frame 3
    //-----------
    frame3.data[0]  = 8'hDA;  frame3.valid[0]  = 1'b1;  frame3.error[0]  = 1'b0; // Destination Address (DA)
    frame3.data[1]  = 8'h02;  frame3.valid[1]  = 1'b1;  frame3.error[1]  = 1'b0;
    frame3.data[2]  = 8'h03;  frame3.valid[2]  = 1'b1;  frame3.error[2]  = 1'b0;
    frame3.data[3]  = 8'h04;  frame3.valid[3]  = 1'b1;  frame3.error[3]  = 1'b0;
    frame3.data[4]  = 8'h05;  frame3.valid[4]  = 1'b1;  frame3.error[4]  = 1'b0;
    frame3.data[5]  = 8'h06;  frame3.valid[5]  = 1'b1;  frame3.error[5]  = 1'b0;
    frame3.data[6]  = 8'h5A;  frame3.valid[6]  = 1'b1;  frame3.error[6]  = 1'b0; // Source Address  (5A)
    frame3.data[7]  = 8'h02;  frame3.valid[7]  = 1'b1;  frame3.error[7]  = 1'b0;
    frame3.data[8]  = 8'h03;  frame3.valid[8]  = 1'b1;  frame3.error[8]  = 1'b0;
    frame3.data[9]  = 8'h04;  frame3.valid[9]  = 1'b1;  frame3.error[9]  = 1'b0;
    frame3.data[10] = 8'h05;  frame3.valid[10] = 1'b1;  frame3.error[10] = 1'b0;
    frame3.data[11] = 8'h06;  frame3.valid[11] = 1'b1;  frame3.error[11] = 1'b0;
    frame3.data[12] = 8'h00;  frame3.valid[12] = 1'b1;  frame3.error[12] = 1'b0;
    frame3.data[13] = 8'h03;  frame3.valid[13] = 1'b1;  frame3.error[13] = 1'b0; // Length/Type = Length = 03
    frame3.data[14] = 8'h01;  frame3.valid[14] = 1'b1;  frame3.error[14] = 1'b0; // Therefore padding is required
    frame3.data[15] = 8'h02;  frame3.valid[15] = 1'b1;  frame3.error[15] = 1'b0;
    frame3.data[16] = 8'h03;  frame3.valid[16] = 1'b1;  frame3.error[16] = 1'b0;
    frame3.data[17] = 8'h00;  frame3.valid[17] = 1'b1;  frame3.error[17] = 1'b0; // Padding starts here
    frame3.data[18] = 8'h00;  frame3.valid[18] = 1'b1;  frame3.error[18] = 1'b0;
    frame3.data[19] = 8'h00;  frame3.valid[19] = 1'b1;  frame3.error[19] = 1'b0;
    frame3.data[20] = 8'h00;  frame3.valid[20] = 1'b1;  frame3.error[20] = 1'b0;
    frame3.data[21] = 8'h00;  frame3.valid[21] = 1'b1;  frame3.error[21] = 1'b0;
    frame3.data[22] = 8'h00;  frame3.valid[22] = 1'b1;  frame3.error[22] = 1'b0;
    frame3.data[23] = 8'h00;  frame3.valid[23] = 1'b1;  frame3.error[23] = 1'b0;
    frame3.data[24] = 8'h00;  frame3.valid[24] = 1'b1;  frame3.error[24] = 1'b0;
    frame3.data[25] = 8'h00;  frame3.valid[25] = 1'b1;  frame3.error[25] = 1'b0;
    frame3.data[26] = 8'h00;  frame3.valid[26] = 1'b1;  frame3.error[26] = 1'b0;
    frame3.data[27] = 8'h00;  frame3.valid[27] = 1'b1;  frame3.error[27] = 1'b0;
    frame3.data[28] = 8'h00;  frame3.valid[28] = 1'b1;  frame3.error[28] = 1'b0;
    frame3.data[29] = 8'h00;  frame3.valid[29] = 1'b1;  frame3.error[29] = 1'b0;
    frame3.data[30] = 8'h00;  frame3.valid[30] = 1'b1;  frame3.error[30] = 1'b0;
    frame3.data[31] = 8'h00;  frame3.valid[31] = 1'b1;  frame3.error[31] = 1'b0;
    frame3.data[32] = 8'h00;  frame3.valid[32] = 1'b1;  frame3.error[32] = 1'b0;
    frame3.data[33] = 8'h00;  frame3.valid[33] = 1'b1;  frame3.error[33] = 1'b0;
    frame3.data[34] = 8'h00;  frame3.valid[34] = 1'b1;  frame3.error[34] = 1'b0;
    frame3.data[35] = 8'h00;  frame3.valid[35] = 1'b1;  frame3.error[35] = 1'b0;
    frame3.data[36] = 8'h00;  frame3.valid[36] = 1'b1;  frame3.error[36] = 1'b0;
    frame3.data[37] = 8'h00;  frame3.valid[37] = 1'b1;  frame3.error[37] = 1'b0;
    frame3.data[38] = 8'h00;  frame3.valid[38] = 1'b1;  frame3.error[38] = 1'b0;
    frame3.data[39] = 8'h00;  frame3.valid[39] = 1'b1;  frame3.error[39] = 1'b0;
    frame3.data[40] = 8'h00;  frame3.valid[40] = 1'b1;  frame3.error[40] = 1'b0;
    frame3.data[41] = 8'h00;  frame3.valid[41] = 1'b1;  frame3.error[41] = 1'b0;
    frame3.data[42] = 8'h00;  frame3.valid[42] = 1'b1;  frame3.error[42] = 1'b0;
    frame3.data[43] = 8'h00;  frame3.valid[43] = 1'b1;  frame3.error[43] = 1'b0;
    frame3.data[44] = 8'h00;  frame3.valid[44] = 1'b1;  frame3.error[44] = 1'b0;
    frame3.data[45] = 8'h00;  frame3.valid[45] = 1'b1;  frame3.error[45] = 1'b0;
    frame3.data[46] = 8'h00;  frame3.valid[46] = 1'b1;  frame3.error[46] = 1'b0;
    frame3.data[47] = 8'h00;  frame3.valid[47] = 1'b1;  frame3.error[47] = 1'b0;
    frame3.data[48] = 8'h00;  frame3.valid[48] = 1'b1;  frame3.error[48] = 1'b0;
    frame3.data[49] = 8'h00;  frame3.valid[49] = 1'b1;  frame3.error[49] = 1'b0;
    frame3.data[50] = 8'h00;  frame3.valid[50] = 1'b1;  frame3.error[50] = 1'b0;
    frame3.data[51] = 8'h00;  frame3.valid[51] = 1'b1;  frame3.error[51] = 1'b0;
    frame3.data[52] = 8'h00;  frame3.valid[52] = 1'b1;  frame3.error[52] = 1'b0;
    frame3.data[53] = 8'h00;  frame3.valid[53] = 1'b1;  frame3.error[53] = 1'b0;
    frame3.data[54] = 8'h00;  frame3.valid[54] = 1'b1;  frame3.error[54] = 1'b0;
    frame3.data[55] = 8'h00;  frame3.valid[55] = 1'b1;  frame3.error[55] = 1'b0;
    frame3.data[56] = 8'h00;  frame3.valid[56] = 1'b1;  frame3.error[56] = 1'b0;
    frame3.data[57] = 8'h00;  frame3.valid[57] = 1'b1;  frame3.error[57] = 1'b0;
    frame3.data[58] = 8'h00;  frame3.valid[58] = 1'b1;  frame3.error[58] = 1'b0;
    frame3.data[59] = 8'h00;  frame3.valid[59] = 1'b1;  frame3.error[59] = 1'b0;
    // unused
    frame3.data[60] = 8'h00;  frame3.valid[60] = 1'b0;  frame3.error[60] = 1'b0;
    frame3.data[61] = 8'h00;  frame3.valid[61] = 1'b0;  frame3.error[61] = 1'b0;

    // No error in this frame
    frame3.bad_frame  = 1'b0;


  end


  //--------------------------------------------------------------------
  // CRC engine
  //--------------------------------------------------------------------
  task calc_crc;
    input  [7:0]  data;
    inout  [31:0] fcs;

    reg [31:0] crc;
    reg        crc_feedback;
    integer    I;
  begin

    crc = ~ fcs;

    for (I = 0; I < 8; I = I + 1)
    begin
      crc_feedback = crc[0] ^ data[I];

      crc[0]       = crc[1];
      crc[1]       = crc[2];
      crc[2]       = crc[3];
      crc[3]       = crc[4];
      crc[4]       = crc[5];
      crc[5]       = crc[6]  ^ crc_feedback;
      crc[6]       = crc[7];
      crc[7]       = crc[8];
      crc[8]       = crc[9]  ^ crc_feedback;
      crc[9]       = crc[10] ^ crc_feedback;
      crc[10]      = crc[11];
      crc[11]      = crc[12];
      crc[12]      = crc[13];
      crc[13]      = crc[14];
      crc[14]      = crc[15];
      crc[15]      = crc[16] ^ crc_feedback;
      crc[16]      = crc[17];
      crc[17]      = crc[18];
      crc[18]      = crc[19];
      crc[19]      = crc[20] ^ crc_feedback;
      crc[20]      = crc[21] ^ crc_feedback;
      crc[21]      = crc[22] ^ crc_feedback;
      crc[22]      = crc[23];
      crc[23]      = crc[24] ^ crc_feedback;
      crc[24]      = crc[25] ^ crc_feedback;
      crc[25]      = crc[26];
      crc[26]      = crc[27] ^ crc_feedback;
      crc[27]      = crc[28] ^ crc_feedback;
      crc[28]      = crc[29];
      crc[29]      = crc[30] ^ crc_feedback;
      crc[30]      = crc[31] ^ crc_feedback;
      crc[31]      =           crc_feedback;
    end

    // return the CRC result
    fcs = ~ crc;

    end
  endtask // calc_crc




  //----------------------------------------------------------------------------
  // Test Bench signals and constants
  //----------------------------------------------------------------------------

  // Delay to provide setup and hold timing at the GMII/RGMII.
  parameter dly = 2000;  // 2000 ps

  parameter gtx_period = 2500;  // ps


  // testbench signals
  
  wire        gtx_clk;
  reg         mmcm_clk_in;
  reg         reset;
  reg         demo_mode_error = 1'b0;

  wire        rgmii_txc;
  wire        rgmii_tx_ctl;
  wire [3:0]  rgmii_txd;
  reg         rgmii_rxc_1000;
  reg         rgmii_rxc_100;
  reg         rgmii_rxc_10;
  wire        rgmii_rxc;
  reg         rgmii_rx_ctl;
  reg  [3:0]  rgmii_rxd;
  wire        inband_link_status;
  wire [1:0]  inband_clock_speed;
  wire        inband_duplex_status;

  // testbench control semaphores
  reg  tx_monitor_finished_1G;
  reg  tx_monitor_finished_10M;
  reg  tx_monitor_finished_100M;
  reg  management_config_finished;

  reg [1:0] phy_speed;
  reg [1:0] mac_speed;
  reg       update_speed;

  wire         rgmii_rx_ctl_dut;
  wire [3:0]   rgmii_rxd_dut;

  reg          gen_tx_data;
  reg          check_tx_data;
  reg          config_bist;
  
  wire         frame_error;
  reg          bist_mode_error;
  wire         serial_response;


  // Generate a delayed rgmii_rxc to match the spec
  wire         delay_rxc;
  wire         delay_rxc_lcl;
  assign #2000 delay_rxc_lcl = rgmii_rxc;
  // only want the delay if the rgmii isn't looped back
  assign       delay_rxc = (TB_MODE == "BIST") ? rgmii_txc : delay_rxc_lcl;

  // select between loopback or local data
  assign rgmii_rxd_dut    = (TB_MODE == "BIST") ? rgmii_txd    : rgmii_rxd;
  assign rgmii_rx_ctl_dut = (TB_MODE == "BIST") ? rgmii_tx_ctl : rgmii_rx_ctl;

  //----------------------------------------------------------------------------
  // Wire up Device Under Test
  //----------------------------------------------------------------------------

  eth_mac_example_design dut
    (
      // asynchronous reset
      .glbl_rst                   (reset),

      // 200MHz clock input from board
      .clk_in_p                   (mmcm_clk_in),
      .clk_in_n                   (!mmcm_clk_in),
      // 125 MHz clock output from MMCM
      .gtx_clk_bufg_out           (gtx_clk),

      .phy_resetn                 (),


      // RGMII Interface
      //----------------
      .rgmii_txd                  (rgmii_txd),
      .rgmii_tx_ctl               (rgmii_tx_ctl),
      .rgmii_txc                  (rgmii_txc),
      .rgmii_rxd                  (rgmii_rxd_dut),
      .rgmii_rx_ctl               (rgmii_rx_ctl_dut),
      .rgmii_rxc                  (delay_rxc),

      // Serialised statistics vectors
      //------------------------------
      .tx_statistics_s            (),
      .rx_statistics_s            (),

      // Serialised Pause interface controls
      //------------------------------------
      .pause_req_s                (1'b0),

      // Main example design controls
      //-----------------------------
      .mac_speed                  (mac_speed),
      .update_speed               (update_speed),
      .config_board               (config_bist),
      .serial_response            (serial_response),
      .gen_tx_data                (gen_tx_data),
      .chk_tx_data                (check_tx_data),
      .reset_error                (1'b0),
      .frame_error                (frame_error),
      .frame_errorn               (),
      .activity_flash             (),
      .activity_flashn            ()

    );

  //---------------------------------------------------------------------------
  //-- If the simulation is still going then
  //-- something has gone wrong
  //---------------------------------------------------------------------------
  initial
  begin
    #680000000;
    $display("** ERROR: Simulation Running Forever");
    $stop;
  end

  

  //----------------------------------------------------------------------------
  // Clock drivers
  //----------------------------------------------------------------------------
  

  //drives input to an MMCM at 200MHz which creates gtx_clk at 125 MHz
  initial
  begin
    
    mmcm_clk_in <= 1'b0;
    
  #80000;
    forever
    begin
      mmcm_clk_in <= 1'b0;
      
      #gtx_period;
      mmcm_clk_in <= 1'b1;
      
      #gtx_period;
    end
  end

      

  // drives rgmii_rxc_1000 at 125 MHz
  initial
  begin
    rgmii_rxc_1000 <= 1'b0;
    #10000;
    forever
    begin
      rgmii_rxc_1000 <= 1'b0;
      #4000;
      rgmii_rxc_1000 <= 1'b1;
      #4000;
    end
  end


  // drives rgmii_rxc_100 at 25 MHz
  initial
  begin
    rgmii_rxc_100 <= 1'b0;
    #10000;
    forever
    begin
      rgmii_rxc_100 <= 1'b0;
      #20000;
      rgmii_rxc_100 <= 1'b1;
      #20000;
    end
  end


  // drives rgmii_rxc_10 at 2.5 MHz
  initial
  begin
    rgmii_rxc_10 <= 1'b0;
    #10000;
    forever
    begin
      rgmii_rxc_10 <= 1'b0;
      #200000;
      rgmii_rxc_10 <= 1'b1;
      #200000;
    end
  end

  // want a clean swicth between the clocks - provide a low setting
  // Select between 10Mb/s, 100Mb/s and 1Gb/s RGMII Rx clock frequencies
  assign rgmii_rxc = (phy_speed == 2'b11 ? 1'b0 :
                      phy_speed == 2'b10 ? rgmii_rxc_1000 :
                     (phy_speed == 2'b01 ? rgmii_rxc_100 : rgmii_rxc_10));




  //----------------------------------------------------------------------------
  // A Task to reset the MAC
  //----------------------------------------------------------------------------
  task mac_reset;
    begin
      $display("** Note: Resetting core...");

      reset <= 1'b1;
      #400000

      reset <= 1'b0;

      $display("** Note: Timing checks are valid");
    end
  endtask // mac_reset;

  // monitor frame error and output error when asserted (with timestamp)
  always @(posedge gtx_clk or posedge reset)
  begin
     if (reset) begin
        bist_mode_error <= 0;
     end
        
     else if (frame_error & !bist_mode_error) begin
        
        bist_mode_error <= 1;
        $display("ERROR: frame mismatch at time %t ps", $time);
     end
  end

  //----------------------------------------------------------------------------
  // Management process. This process waits a few cycles for the config vector to take effect
  //----------------------------------------------------------------------------
  initial
  begin : p_management

    mac_speed <= 2'b10;
    phy_speed <= 2'b10;
    update_speed <= 1'b0;
    gen_tx_data <= 1'b0;
    check_tx_data <= 1'b0;
    config_bist <= 0;
    management_config_finished <= 0;

    // reset the core
    mac_reset;


    repeat (100) @(posedge gtx_clk);

    

    if (TB_MODE == "BIST") begin
       gen_tx_data <= 1'b1;
       check_tx_data <= 1'b1;
       // run for a set time and then stop
       repeat (15000) @(posedge gtx_clk);
       // Our work here is done


         
       if (frame_error) begin
         
          $display("ERROR: Frame mismatch seen");
       end
          

       else begin
          $display("Test completed successfully");
       end
       $display("Simulation Stopped");
       $stop;
    end
    else begin

       // Signal that configuration is complete.  Other processes will now
       // be allowed to run.
       management_config_finished = 1;

       // The stimulus process will now send 4 frames at 1Gb/s.
       //------------------------------------------------------------------

       // Wait for 1G monitor process to complete.
       wait (tx_monitor_finished_1G == 1);
       management_config_finished = 0;

       // Change the speed to 100Mb/s and send the 4 frames
       //------------------------------------------------------------------

       @(posedge gtx_clk);
       mac_speed <= 2'b01;
       update_speed <= 1'b1;
       @(posedge gtx_clk);
       @(posedge gtx_clk);
       @(posedge gtx_clk);
       update_speed <= 1'b0;

   repeat (40) @(posedge gtx_clk);
   phy_speed <= 2'b01;
   repeat (60) @(posedge gtx_clk);
       // Signal that configuration is complete.  Other processes will now
       // be allowed to run.
       management_config_finished = 1;

       // Wait for 100M monitor process to complete.
       wait (tx_monitor_finished_100M == 1);
       management_config_finished = 0;

       // Change the speed to 10Mb/s and send the 4 frames
       //------------------------------------------------------------------

       @(posedge gtx_clk);
       mac_speed <= 2'b00;
       update_speed <= 1'b1;
       @(posedge gtx_clk);
       @(posedge gtx_clk);
       @(posedge gtx_clk);
       update_speed <= 1'b0;

   repeat (40) @(posedge gtx_clk);
   phy_speed <= 2'b00;
   repeat (60) @(posedge gtx_clk);

       management_config_finished = 1;

       // Wait for 10M monitor process to complete.
       wait (tx_monitor_finished_10M == 1);
       management_config_finished = 0;

       // Change the speed back to 1Gb/s and send the 4 frames
       //------------------------------------------------------------------

       @(posedge gtx_clk);
       mac_speed <= 2'b10;
       phy_speed <= 2'b10;
       update_speed <= 1'b1;
       @(posedge gtx_clk);
       @(posedge gtx_clk);
       @(posedge gtx_clk);
       update_speed <= 1'b0;

   repeat (100) @(posedge gtx_clk);

       management_config_finished = 1;
       wait (tx_monitor_finished_1G == 1);

       // Our work here is done
       if (demo_mode_error == 1'b0 && bist_mode_error == 1'b0) begin
         $display("Test completed successfully");
       end
       $display("Simulation Stopped");
       $stop;
     end
  end // p_management



  //----------------------------------------------------------------------------
  // Procedure to inject a frame into the receiver at 1Gb/s
  //----------------------------------------------------------------------------
  task send_frame_1g;
    input   `FRAME_TYP frame;
    integer column_index;
    integer I;
    reg [31:0] fcs;
    begin
      // import the frame into scratch space
      rx_stimulus_working_frame.frombits(frame);

      // Reset the FCS calculation
      fcs = 32'b0;
      @(posedge rgmii_rxc);

      column_index = 0;

      // Adding the preamble field
      for (I = 0; I <= 13; I = I + 1)
      begin
        rgmii_rxd   <= 4'h5;
        rgmii_rx_ctl <= 1'b1;
        @(rgmii_rxc);
      end

      // Adding the Start of Frame Delimiter (SFD)
      rgmii_rxd   <= 4'h5;
      rgmii_rx_ctl <= 1'b1;
      @(rgmii_rxc)
      rgmii_rxd   <= 4'hD;
      rgmii_rx_ctl <= 1'b1;
      @(rgmii_rxc)

      // loop over columns in frame.
      while (rx_stimulus_working_frame.valid[column_index] !== 1'b0)
      begin
        // send one column of data
        rgmii_rxd    <= rx_stimulus_working_frame.data[column_index][3:0];
        rgmii_rx_ctl <= rx_stimulus_working_frame.valid[column_index];
        @(rgmii_rxc)
        rgmii_rxd    <= rx_stimulus_working_frame.data[column_index][7:4];
        rgmii_rx_ctl <= rx_stimulus_working_frame.valid[column_index] ^ rx_stimulus_working_frame.error[column_index];
        calc_crc(rx_stimulus_working_frame.data[column_index], fcs);

        column_index = column_index + 1;
        @(rgmii_rxc);  // wait for next clock tick

      end

      // Send the CRC.
      for (I = 0; I < 4; I = I + 1)
      begin
        case(I)
           0 : rgmii_rxd    <= fcs[3:0];
           1 : rgmii_rxd    <= fcs[11:8];
           2 : rgmii_rxd    <= fcs[19:16];
           3 : rgmii_rxd    <= fcs[27:24];
        endcase
        rgmii_rx_ctl <= 1'b1;
        @(rgmii_rxc)
        case(I)
           0 : rgmii_rxd    <= fcs[7:4];
           1 : rgmii_rxd    <= fcs[15:12];
           2 : rgmii_rxd    <= fcs[23:20];
           3 : rgmii_rxd    <= fcs[31:28];
        endcase
        rgmii_rx_ctl <= 1'b1;

        @(rgmii_rxc);  // wait for next clock tick
      end

      // Clear the data lines.
      rgmii_rxd       <= 4'h0;
      rgmii_rx_ctl    <= 1'b0;

      // Adding the minimum Interframe gap for a receiver (8 idles)
      for (I = 0; I < 16; I = I + 1)
        @(rgmii_rxc);

    end
  endtask // send_frame_1g;


  //----------------------------------------------------------------------------
  // Procedure to inject a frame into the receiver at 10/100Mb/s
  //----------------------------------------------------------------------------
  task send_frame_10_100m;
    input   `FRAME_TYP frame;
    integer column_index;
    integer I;
    reg [31:0] fcs;
    begin
      // import the frame into scratch space
      rx_stimulus_working_frame.frombits(frame);

      // Reset the FCS calculation
      fcs = 32'b0;

      @(posedge rgmii_rxc);

      column_index = 0;

      // Adding the preamble field
      for (I = 0; I <= 13; I = I + 1)
      begin
        rgmii_rxd   <= 4'h5;
        rgmii_rx_ctl <= 1'b1;
        @(posedge rgmii_rxc);
      end

      // Adding the Start of Frame Delimiter (SFD)
      rgmii_rxd   <= 4'h5;
      rgmii_rx_ctl <= 1'b1;
      @(posedge rgmii_rxc);
      rgmii_rxd   <= 4'hD;
      rgmii_rx_ctl <= 1'b1;
      @(posedge rgmii_rxc);
      // loop over columns in frame.
      while (rx_stimulus_working_frame.valid[column_index] !== 1'b0)
      begin
        // send one column of data
        rgmii_rxd    <= rx_stimulus_working_frame.data[column_index][3:0];
        rgmii_rx_ctl <= rx_stimulus_working_frame.valid[column_index];
        @(posedge rgmii_rxc);
        rgmii_rxd    <= rx_stimulus_working_frame.data[column_index][7:4];
        rgmii_rx_ctl <= rx_stimulus_working_frame.valid[column_index] ^ rx_stimulus_working_frame.error[column_index];
        calc_crc(rx_stimulus_working_frame.data[column_index], fcs);
        @(posedge rgmii_rxc);
      column_index = column_index + 1;
      end

      // Send the CRC.
      for (I = 0; I < 4; I = I + 1)
      begin
        case(I)
           0 : rgmii_rxd    <= fcs[3:0];
           1 : rgmii_rxd    <= fcs[11:8];
           2 : rgmii_rxd    <= fcs[19:16];
           3 : rgmii_rxd    <= fcs[27:24];
        endcase
        rgmii_rx_ctl <= 1'b1;
        @(posedge rgmii_rxc);
        case(I)
           0 : rgmii_rxd    <= fcs[7:4];
           1 : rgmii_rxd    <= fcs[15:12];
           2 : rgmii_rxd    <= fcs[23:20];
           3 : rgmii_rxd    <= fcs[31:28];
        endcase
        rgmii_rx_ctl <= 1'b1;
        @(posedge rgmii_rxc);
      end

      // Clear the data lines.
      rgmii_rxd       <= 4'h0;
      rgmii_rx_ctl    <= 1'b0;

      // Adding the minimum Interframe gap for a receiver (8 idles)
      for (I = 0; I < 32; I = I + 1)
        @(rgmii_rxc);

    end
  endtask // send_frame_10_100m;


  //----------------------------------------------------------------------------
  // Stimulus process. This process will inject frames of data into the
  // PHY side of the receiver.
  //----------------------------------------------------------------------------
  initial
  begin : p_rx_stimulus

    // Initialise stimulus
    rgmii_rxd      = 4'h0;
    rgmii_rx_ctl   = 1'b0;

    // Send four frames through the MAC and Design Exampled
    // at each state Ethernet speed
    //      -- frame 0 = standard frame
    //      -- frame 1 = type frame
    //      -- frame 2 = frame containing an error
    //      -- frame 3 = standard frame with padding
    //-----------------------------------------------------



    // 1 Gb/s speed
    //-----------------------------------------------------
    // Wait for the Management MDIO transaction to finish.
    while (management_config_finished !== 1)
    // wait for the internal resets to settle before staring to send traffic
    #800000;
    $display("Rx Stimulus: sending 4 frames at 1G ... ");

    send_frame_1g(frame0.tobits(0));
    send_frame_1g(frame1.tobits(1));
    send_frame_1g(frame2.tobits(2));
    send_frame_1g(frame3.tobits(3));

    wait (tx_monitor_finished_1G == 1);
    #10000;

    // 100 Mb/s speed
    //-----------------------------------------------------
    while (management_config_finished !== 1) @(posedge management_config_finished);
    $display("Rx Stimulus: sending 4 frames at 100M ... ");

    send_frame_10_100m(frame0.tobits(0));
    send_frame_10_100m(frame1.tobits(1));
    send_frame_10_100m(frame2.tobits(2));
    send_frame_10_100m(frame3.tobits(3));

    wait (tx_monitor_finished_100M == 1);
    #10000;

    // 10 Mb/s speed
    //-----------------------------------------------------
    while (management_config_finished !== 1) @(posedge management_config_finished);
    $display("Rx Stimulus: sending 4 frames at 10M ... ");

    send_frame_10_100m(frame0.tobits(0));
    send_frame_10_100m(frame1.tobits(1));
    send_frame_10_100m(frame2.tobits(2));
    send_frame_10_100m(frame3.tobits(3));

    wait (tx_monitor_finished_10M == 1);
    #10000;

    // 1 Gb/s speed
    //-----------------------------------------------------
    while (management_config_finished !== 1) @(posedge management_config_finished);
    $display("Rx Stimulus: sending 4 frames at 1G ... ");

    send_frame_1g(frame0.tobits(0));
    send_frame_1g(frame1.tobits(1));
    send_frame_1g(frame2.tobits(2));
    send_frame_1g(frame3.tobits(3));


  end // p_rx_stimulus



  //----------------------------------------------------------------------------
  // A Task to check a transmitted frame at 1Gb/s
  //----------------------------------------------------------------------------
  task check_frame_1g;
    input `FRAME_TYP frame;
    integer column_index;
    integer I;
    reg [8*4:0] frame_type;
    reg [31:0] fcs;
    reg [7:0]  rgmii_column;
    reg [1:0]  rgmii_valid;

  begin
    // import the frame into scratch space
    tx_monitor_working_frame.frombits(frame);

    column_index = 0;
    // If the current frame had an error inserted then it would have
    // been dropped by the FIFO in the design example.  Therefore
    // exit this task and move immediately on to the next frame.
    if (tx_monitor_working_frame.bad_frame !== 1'b1)
    begin

      // reset the fcs calculation
      fcs = 32'b0;

      // wait until the first real column of data to come out of RX client
      while (rgmii_tx_ctl !== 1'b1)
        @(rgmii_txc);

      // check tx_ctl has gone high at the correct edge (should be rising)
      if (!rgmii_txc) begin
         $display("** ERROR: tx_ctl started on incorrect phase at %t", $realtime, "ps");
        demo_mode_error <= 1;
      end

      // Parse over the preamble field
      while (rgmii_txd === 4'h5)
        @(negedge rgmii_txc);

      // Parse over the SFD
      if (rgmii_txd !== 4'hd) begin
         $display("** ERROR: SFD not present at %t", $realtime, "ps");
        demo_mode_error <= 1;
      end
      @(posedge rgmii_txc);

      if (TB_MODE == "DEMO") begin
         // Start comparing transmitted data to received data
         $display("** Note: Comparing Transmitted Frame with Injected Frame");

         // frame has started, loop over columns of frame
         while (tx_monitor_working_frame.valid[column_index] !== 1'b0)
         begin

           rgmii_column[3:0] = rgmii_txd[3:0];
           rgmii_valid[0]    = rgmii_tx_ctl;
           @(rgmii_txc);
           rgmii_column[7:4]= rgmii_txd[3:0];
           rgmii_valid[1]    = rgmii_tx_ctl;

           // The transmitted Destination Address was the Source Address
           // of the injected frame
           if (column_index < 6)
           begin

             if (rgmii_valid[0] !== tx_monitor_working_frame.valid[column_index+6]) begin
               $display("** ERROR: rgmii_tx_ctl incorrect during Destination Address at %t", $realtime, "ps");
               demo_mode_error <= 1;
             end
             if (rgmii_valid[1] !== tx_monitor_working_frame.valid[column_index+6]) begin
               $display("** ERROR: rgmii_tx_ctl incorrect during Destination Address at %t", $realtime, "ps");
               demo_mode_error <= 1;
             end

             if (rgmii_column !== tx_monitor_working_frame.data[(column_index+6)]) begin
               $display("** ERROR: rgmii_txd incorrect during Destination Address at %t", $realtime, "ps");
               demo_mode_error <= 1;
             end
           end

           // The transmitted Source Address was the Destination Address
           // of the injected frame
           else if (column_index < 12)
           begin

             if (rgmii_valid[0] !== tx_monitor_working_frame.valid[column_index-6]) begin
               $display("** ERROR: rgmii_tx_ctl incorrect during Source Address at %t", $realtime, "ps");
               demo_mode_error <= 1;
             end
             if (rgmii_valid[1] !== tx_monitor_working_frame.valid[column_index-6]) begin
               $display("** ERROR: rgmii_tx_ctl incorrect during Source Address at %t", $realtime, "ps");
               demo_mode_error <= 1;
             end

             if (rgmii_column !== tx_monitor_working_frame.data[(column_index-6)]) begin
               $display("** ERROR: rgmii_txd incorrect during Source Address at %t", $realtime, "ps");
               demo_mode_error <= 1;
             end
           end

           // check all other data in the frame
           else
           begin

             if (rgmii_valid[0] !== tx_monitor_working_frame.valid[column_index]) begin
               $display("** ERROR: rgmii_tx_ctl incorrect at %t", $realtime, "ps");
               demo_mode_error <= 1;
             end
             if (rgmii_valid[1] !== tx_monitor_working_frame.valid[column_index]) begin
               $display("** ERROR: rgmii_tx_ctl incorrect at %t", $realtime, "ps");
               demo_mode_error <= 1;
             end

             if (rgmii_column !== tx_monitor_working_frame.data[(column_index)]) begin
               $display("** ERROR: rgmii_txd incorrect at %t", $realtime, "ps");
               demo_mode_error <= 1;
             end
           end

           // calculate expected crc for the frame
           calc_crc(rgmii_column, fcs);

           // wait for next column of data
           column_index = column_index + 1;
           @(rgmii_txc);
         end

         // Check the FCS
         // Having checked all data columns, txd must contain FCS.
         for (I = 0; I < 4; I = I + 1)
         begin
           rgmii_column[3:0] = rgmii_txd[3:0];
           rgmii_valid[0]    = rgmii_tx_ctl;
           @(rgmii_txc);
           rgmii_column[7:4] = rgmii_txd[3:0];
           rgmii_valid[1]    = rgmii_tx_ctl;

           if (rgmii_valid !== 2'b11) begin
             $display("** ERROR: rgmii_tx_ctl incorrect during FCS field at %t", $realtime, "ps");
             demo_mode_error <= 1;
           end

           case(I)
              0 : if (rgmii_column !== fcs[7:0]) begin
                     $display("** ERROR: rgmii_txd incorrect during FCS field at %t", $realtime, "ps");
                     demo_mode_error <= 1;
                   end
              1 :  if (rgmii_column !== fcs[15:8]) begin
                     $display("** ERROR: rgmii_txd incorrect during FCS field at %t", $realtime, "ps");
                     demo_mode_error <= 1;
                   end
              2 :  if (rgmii_column !== fcs[23:16]) begin
                     $display("** ERROR: rgmii_txd incorrect during FCS field at %t", $realtime, "ps");
                     demo_mode_error <= 1;
                   end
              3 :  if (rgmii_column !== fcs[31:24]) begin
                     $display("** ERROR: rgmii_txd incorrect during FCS field at %t", $realtime, "ps");
                     demo_mode_error <= 1;
                   end
           endcase

           @(rgmii_txc);
         end
      end
      else begin
         // this is the BIST tb mode - want to idnetify the frame type  - VLAN or not to help with the bandwidth calc
         // check the type field and if equal to 81 then classify as vlan (could do more but that should be adequate)
         frame_type = "";
         while (rgmii_tx_ctl) begin
            rgmii_column[3:0] = rgmii_txd[3:0];
            @(rgmii_txc);
            rgmii_column[7:4]= rgmii_txd[3:0];
            if (column_index == 12 & rgmii_column == 8'h81) begin
               frame_type = "VLAN";
            end

            // wait for next column of data
            column_index = column_index + 1;
            @(rgmii_txc);
         end
         $display("%s Frame transmitted : Size %d", frame_type, column_index);
      end
    end
   end
  endtask // check_frame_1g


  //----------------------------------------------------------------------------
  // Procedure to check a transmitted frame at 10/100Mb/s
  //----------------------------------------------------------------------------
  task check_frame_10_100m;
    input `FRAME_TYP frame;
    integer column_index;
    integer I;
    reg [31:0] fcs;
    reg [7:0]  rgmii_column;
    reg [1:0]  rgmii_valid;

  begin
    // import the frame into scratch space
    tx_monitor_working_frame.frombits(frame);

    column_index = 0;

    // If the current frame had an error inserted then it would have
    // been dropped by the FIFO in the design example.  Therefore
    // exit this task and move immediately on to the next frame.
    if (tx_monitor_working_frame.bad_frame !== 1'b1)
    begin

      // reset the fcs calculation
      fcs = 32'b0;

      // wait until the first real column of data to come out of RX client
      while (rgmii_tx_ctl !== 1'b1)
        @(rgmii_txc);

      // check tx_ctl has gone high at the correct edge (should be rising)
      if (!rgmii_txc) begin
         $display("** ERROR: tx_ctl started on incorrect phase at %t", $realtime, "ps");
        demo_mode_error <= 1;
      end

      // Parse over the preamble field
      while (rgmii_txd === 4'h5)
        @(posedge rgmii_txc);

      // Start comparing transmitted data to received data
      $display("** Note: Comparing Transmitted Frame with Injected Frame");

      // Parse over the SFD
      if (rgmii_txd !== 4'hd) begin
         $display("** ERROR: SFD not present at %t", $realtime, "ps");
         demo_mode_error <= 1;
      end
      @(posedge rgmii_txc);

      // frame has started, loop over columns of frame
      while (tx_monitor_working_frame.valid[column_index] !== 1'b0)
      begin

        rgmii_column[3:0] = rgmii_txd[3:0];
        rgmii_valid[0]    = rgmii_tx_ctl;
        @(posedge rgmii_txc);
        rgmii_column[7:4]= rgmii_txd[3:0];
        rgmii_valid[1]    = rgmii_tx_ctl;

        // The transmitted Destination Address was the Source Address
        // of the injected frame
        if (column_index < 6)
        begin

           if (rgmii_valid[0] !== tx_monitor_working_frame.valid[column_index+6]) begin
            $display("** ERROR: rgmii_tx_ctl incorrect during Destination Address at %t", $realtime, "ps");
            demo_mode_error <= 1;
          end
           if (rgmii_valid[1] !== tx_monitor_working_frame.valid[column_index+6]) begin
            $display("** ERROR: rgmii_tx_ctl incorrect during Destination Address at %t", $realtime, "ps");
            demo_mode_error <= 1;
          end

          if (rgmii_column !== tx_monitor_working_frame.data[(column_index+6)]) begin
            $display("** ERROR: rgmii_txd incorrect during Destination Address at %t", $realtime, "ps");
            demo_mode_error <= 1;
          end
        end

        // The transmitted Source Address was the Destination Address
        // of the injected frame
        else if (column_index < 12)
        begin
          if (rgmii_valid[0] !== tx_monitor_working_frame.valid[column_index-6]) begin
            $display("** ERROR: rgmii_tx_ctl incorrect during Source Address at %t", $realtime, "ps");
            demo_mode_error <= 1;
          end

          if (rgmii_valid[1] !== tx_monitor_working_frame.valid[column_index-6]) begin
            $display("** ERROR: rgmii_tx_ctl incorrect during Source Address at %t", $realtime, "ps");
            demo_mode_error <= 1;
          end

          if (rgmii_column !== tx_monitor_working_frame.data[(column_index-6)]) begin
            $display("** ERROR: rgmii_txd incorrect during Source Address at %t", $realtime, "ps");
            demo_mode_error <= 1;
          end
        end

        // check all other data in the frame
        else
        begin
          if (rgmii_valid[0] !== tx_monitor_working_frame.valid[column_index]) begin
            $display("** ERROR: rgmii_tx_ctl incorrect at %t", $realtime, "ps");
            demo_mode_error <= 1;
          end
          if (rgmii_valid[1] !== tx_monitor_working_frame.valid[column_index]) begin
            $display("** ERROR: rgmii_tx_ctl incorrect at %t", $realtime, "ps");
            demo_mode_error <= 1;
          end

          if (rgmii_column !== tx_monitor_working_frame.data[(column_index)]) begin
            $display("** ERROR: rgmii_txd incorrect at %t", $realtime, "ps");
            demo_mode_error <= 1;
          end
          if (rgmii_tx_ctl !== tx_monitor_working_frame.valid[column_index]) begin
            $display("** ERROR: rgmii_tx_ctl incorrect");
            demo_mode_error <= 1;
          end
        end

        // calculate expected crc for the frame
        calc_crc(rgmii_column, fcs);

        // wait for next column of data
        column_index = column_index + 1;
        @(posedge rgmii_txc);
      end

      // Check the FCS
      // Having checked all data columns, txd must contain FCS.
      for (I = 0; I < 4; I = I + 1)
      begin
        rgmii_column[3:0] = rgmii_txd[3:0];
        rgmii_valid[0]    = rgmii_tx_ctl;
        @(posedge rgmii_txc);
        rgmii_column[7:4] = rgmii_txd[3:0];
        rgmii_valid[1]    = rgmii_tx_ctl;

        if (rgmii_valid !== 2'b11) begin
          $display("** ERROR: rgmii_tx_ctl incorrect during FCS field at %t", $realtime, "ps");
          demo_mode_error <= 1;
        end

        case(I)
           0 : if (rgmii_column !== fcs[7:0]) begin
                 $display("** ERROR: rgmii_txd incorrect during FCS field at %t", $realtime, "ps");
                 demo_mode_error <= 1;
               end
           1 : if (rgmii_column !== fcs[15:8]) begin
                 $display("** ERROR: rgmii_txd incorrect during FCS field at %t", $realtime, "ps");
                 demo_mode_error <= 1;
               end
           2 : if (rgmii_column !== fcs[23:16]) begin
                 $display("** ERROR: rgmii_txd incorrect during FCS field at %t", $realtime, "ps");
                 demo_mode_error <= 1;
               end
           3 : if (rgmii_column !== fcs[31:24]) begin
                 $display("** ERROR: rgmii_txd incorrect during FCS field at %t", $realtime, "ps");
                 demo_mode_error <= 1;
               end
        endcase

        @(negedge rgmii_txc);
         // check tx_ctl has gone low at the correct edge (should be rising)
         if (!rgmii_tx_ctl) begin
            $display("** ERROR: tx_ctl stopped on incorrect phase at %t", $realtime, "ps");
            demo_mode_error <= 1;
         end

        @(posedge rgmii_txc);
      end

    end
   end
  endtask // check_frame_10_100m


  //----------------------------------------------------------------------------
  // Monitor process. This process checks the data coming out of the
  // transmitter to make sure that it matches that inserted into the
  // receiver.
  //----------------------------------------------------------------------------

  initial
  begin : p_tx_monitor
    tx_monitor_finished_1G    <= 0;
    tx_monitor_finished_100M  <= 0;
    tx_monitor_finished_10M   <= 0;

    if (TB_MODE == "DEMO") begin
       // Compare the transmitted frame to the received frames
       //      -- frame 0 = minimum length frame
       //      -- frame 1 = type frame
       //      -- frame 2 = errored frame
       //      -- frame 3 = padded frame
       // Repeated for all stated speeds.
       //-----------------------------------------------------

       // wait for the reset to complete before starting monitor
       @(negedge reset);

       // 1 Gb/s speed
       //-----------------------------------------------------

       // Check the frames
       check_frame_1g(frame0.tobits(0));
       check_frame_1g(frame1.tobits(0));
       check_frame_1g(frame2.tobits(0));
       check_frame_1g(frame3.tobits(0));

       #200000
       tx_monitor_finished_1G  <= 1;

       // 100 Mb/s speed
       //-----------------------------------------------------

       // Check the frames
       check_frame_10_100m(frame0.tobits(0));
       check_frame_10_100m(frame1.tobits(0));
       check_frame_10_100m(frame2.tobits(0));
       check_frame_10_100m(frame3.tobits(0));

       #200000
       tx_monitor_finished_100M  <= 1;
       tx_monitor_finished_1G    <= 0;

       // 10 Mb/s speed
       //-----------------------------------------------------

       // Check the frames
       check_frame_10_100m(frame0.tobits(0));
       check_frame_10_100m(frame1.tobits(0));
       check_frame_10_100m(frame2.tobits(0));
       check_frame_10_100m(frame3.tobits(0));

       #200000
       tx_monitor_finished_10M  <= 1;

       // 1 Gb/s speed
       //-----------------------------------------------------

       // Check the frames
       check_frame_1g(frame0.tobits(0));
       check_frame_1g(frame1.tobits(0));
       check_frame_1g(frame2.tobits(0));
       check_frame_1g(frame3.tobits(0));

       #200000
       tx_monitor_finished_1G  <= 1;

     end
     else begin
       forever check_frame_1g(frame0.tobits(0));
     end

  end // p_tx_monitor




endmodule


