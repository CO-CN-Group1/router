# This constraints file contains default clock frequencies to be used during creation of a
# Synthesis Design Checkpoint (DCP). For best results the frequencies should be modified
# to match the target frequencies. 
# This constraints file is not used in top-down/global synthesis (not the default flow of Vivado).
###################################
# TX Clock period Constraints
###################################
# Transmitter clock period constraints: please do not relax
create_clock -name gtx_clk_ooc -period 8.000 [get_ports gtx_clk]
set_property HD.CLK_SRC BUFGCTRL_X0Y0 [get_ports gtx_clk]
   
   

###################################
# IDELAYCTRL reference clock period
###################################
create_clock -name refclk_ooc -period 5.000 [get_ports refclk]
set_property HD.CLK_SRC BUFGCTRL_X0Y3 [get_ports refclk]


