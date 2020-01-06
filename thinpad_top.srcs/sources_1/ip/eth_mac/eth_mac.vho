-- (c) Copyright 1995-2019 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: xilinx.com:ip:tri_mode_ethernet_mac:9.0
-- IP Revision: 13

-- The following code must appear in the VHDL architecture header.

------------- Begin Cut here for COMPONENT Declaration ------ COMP_TAG
COMPONENT eth_mac
  PORT (
    gtx_clk : IN STD_LOGIC;
    gtx_clk_out : OUT STD_LOGIC;
    gtx_clk90_out : OUT STD_LOGIC;
    glbl_rstn : IN STD_LOGIC;
    rx_axi_rstn : IN STD_LOGIC;
    tx_axi_rstn : IN STD_LOGIC;
    rx_statistics_vector : OUT STD_LOGIC_VECTOR(27 DOWNTO 0);
    rx_statistics_valid : OUT STD_LOGIC;
    rx_mac_aclk : OUT STD_LOGIC;
    rx_reset : OUT STD_LOGIC;
    rx_enable : OUT STD_LOGIC;
    rx_axis_mac_tdata : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    rx_axis_mac_tvalid : OUT STD_LOGIC;
    rx_axis_mac_tlast : OUT STD_LOGIC;
    rx_axis_mac_tuser : OUT STD_LOGIC;
    tx_ifg_delay : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    tx_statistics_vector : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    tx_statistics_valid : OUT STD_LOGIC;
    tx_mac_aclk : OUT STD_LOGIC;
    tx_reset : OUT STD_LOGIC;
    tx_enable : OUT STD_LOGIC;
    tx_axis_mac_tdata : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    tx_axis_mac_tvalid : IN STD_LOGIC;
    tx_axis_mac_tlast : IN STD_LOGIC;
    tx_axis_mac_tuser : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    tx_axis_mac_tready : OUT STD_LOGIC;
    pause_req : IN STD_LOGIC;
    pause_val : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    refclk : IN STD_LOGIC;
    speedis100 : OUT STD_LOGIC;
    speedis10100 : OUT STD_LOGIC;
    rgmii_txd : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    rgmii_tx_ctl : OUT STD_LOGIC;
    rgmii_txc : OUT STD_LOGIC;
    rgmii_rxd : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    rgmii_rx_ctl : IN STD_LOGIC;
    rgmii_rxc : IN STD_LOGIC;
    inband_link_status : OUT STD_LOGIC;
    inband_clock_speed : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    inband_duplex_status : OUT STD_LOGIC;
    rx_configuration_vector : IN STD_LOGIC_VECTOR(79 DOWNTO 0);
    tx_configuration_vector : IN STD_LOGIC_VECTOR(79 DOWNTO 0)
  );
END COMPONENT;
-- COMP_TAG_END ------ End COMPONENT Declaration ------------

-- The following code must appear in the VHDL architecture
-- body. Substitute your own instance name and net names.

------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG
your_instance_name : eth_mac
  PORT MAP (
    gtx_clk => gtx_clk,
    gtx_clk_out => gtx_clk_out,
    gtx_clk90_out => gtx_clk90_out,
    glbl_rstn => glbl_rstn,
    rx_axi_rstn => rx_axi_rstn,
    tx_axi_rstn => tx_axi_rstn,
    rx_statistics_vector => rx_statistics_vector,
    rx_statistics_valid => rx_statistics_valid,
    rx_mac_aclk => rx_mac_aclk,
    rx_reset => rx_reset,
    rx_enable => rx_enable,
    rx_axis_mac_tdata => rx_axis_mac_tdata,
    rx_axis_mac_tvalid => rx_axis_mac_tvalid,
    rx_axis_mac_tlast => rx_axis_mac_tlast,
    rx_axis_mac_tuser => rx_axis_mac_tuser,
    tx_ifg_delay => tx_ifg_delay,
    tx_statistics_vector => tx_statistics_vector,
    tx_statistics_valid => tx_statistics_valid,
    tx_mac_aclk => tx_mac_aclk,
    tx_reset => tx_reset,
    tx_enable => tx_enable,
    tx_axis_mac_tdata => tx_axis_mac_tdata,
    tx_axis_mac_tvalid => tx_axis_mac_tvalid,
    tx_axis_mac_tlast => tx_axis_mac_tlast,
    tx_axis_mac_tuser => tx_axis_mac_tuser,
    tx_axis_mac_tready => tx_axis_mac_tready,
    pause_req => pause_req,
    pause_val => pause_val,
    refclk => refclk,
    speedis100 => speedis100,
    speedis10100 => speedis10100,
    rgmii_txd => rgmii_txd,
    rgmii_tx_ctl => rgmii_tx_ctl,
    rgmii_txc => rgmii_txc,
    rgmii_rxd => rgmii_rxd,
    rgmii_rx_ctl => rgmii_rx_ctl,
    rgmii_rxc => rgmii_rxc,
    inband_link_status => inband_link_status,
    inband_clock_speed => inband_clock_speed,
    inband_duplex_status => inband_duplex_status,
    rx_configuration_vector => rx_configuration_vector,
    tx_configuration_vector => tx_configuration_vector
  );
-- INST_TAG_END ------ End INSTANTIATION Template ---------

-- You must compile the wrapper file eth_mac.vhd when simulating
-- the core, eth_mac. When compiling the wrapper file, be sure to
-- reference the VHDL simulation library.

