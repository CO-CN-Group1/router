
# PART is artix7 xc7a100tfgg676

############################################################
# Clock Period Constraints                                 #
############################################################

############################################################
# RX Clock period Constraints (per instance)               #
############################################################
# Receiver clock period constraints: please do not relax
create_clock -period 8 [get_ports rgmii_rxc]

#
####
#######
##########
#############
#################
#BLOCK CONSTRAINTS

############################################################
# Physical Interface Constraints
############################################################

############################################################
# The following are required to maximise setup/hold        #
############################################################

set_property SLEW FAST [get_ports {rgmii_txd[3] rgmii_txd[2] rgmii_txd[1] rgmii_txd[0] rgmii_tx_ctl rgmii_txc}]


############################################################
# RGMII: IODELAY Constraints
############################################################
# Please modify the value of the IDELAY_VALUE/ODELAY_VALUE
# according to your design.
# For more information on IDELAYCTRL and IODELAY, please
# refer to the Series-7 User Guide.
#
# Apply the same IDELAY_VALUE to all RGMII RX inputs.
# This is to provide a similiar Clock Path and Data Path delay.
set_property IDELAY_VALUE 13 [get_cells {tri_mode_ethernet_mac_i/rgmii_interface/delay_rgmii_rx* tri_mode_ethernet_mac_i/rgmii_interface/rxdata_bus[*].delay_rgmii_rx*}]

# Group IODELAY components
set_property IODELAY_GROUP tri_mode_ethernet_mac_iodelay_grp [get_cells {tri_mode_ethernet_mac_i/rgmii_interface/delay_rgmii_rx* tri_mode_ethernet_mac_i/rgmii_interface/rxdata_bus[*].delay_rgmii_rx*}]
set_property IODELAY_GROUP tri_mode_ethernet_mac_iodelay_grp [get_cells  {tri_mode_ethernet_mac_idelayctrl_common_i}]


#
####
#######
##########
#############
#################
#CORE CONSTRAINTS



############################################################
# Crossing of Clock Domain Constraints: please do not edit #
############################################################

# control signal is synced separately so we want a max delay to ensure the signal has settled by the time the control signal has passed through the synch
set_max_delay -from [get_cells {tri_mode_ethernet_mac_i/eth_mac_core/flow/rx_pause/pause*to_tx_reg[*]}] -to [get_cells {tri_mode_ethernet_mac_i/eth_mac_core/flow/tx_pause/count_set*reg}] 32 -datapath_only
set_max_delay -from [get_cells {tri_mode_ethernet_mac_i/eth_mac_core/flow/rx_pause/pause*to_tx_reg[*]}] -to [get_cells {tri_mode_ethernet_mac_i/eth_mac_core/flow/tx_pause/pause_count*reg[*]}] 32 -datapath_only
set_max_delay -from [get_cells {tri_mode_ethernet_mac_i/eth_mac_core/flow/rx_pause/pause_req_to_tx_int_reg}] -to [get_cells {tri_mode_ethernet_mac_i/eth_mac_core/flow/tx_pause/sync_good_rx/data_sync_reg0}] 6 -datapath_only

set_false_path -through [get_ports {rx_configuration_vector[*]}]
set_false_path -through [get_ports {tx_configuration_vector[*]}]



############################################################
# Ignore paths to resync flops
############################################################
set_false_path -to [get_pins -filter {REF_PIN_NAME =~ PRE} -of [get_cells -hier -regexp {.*\/async_rst.*}]]
set_false_path -to [get_pins -filter {REF_PIN_NAME =~ CLR} -of [get_cells -hier -regexp {.*\/async_rst.*}]]
set_false_path -to [get_pins -filter {REF_PIN_NAME =~ PRE} -of [get_cells -hier -regexp {.*\/reset_sync.*}]]
set_false_path -from [get_cells {tri_mode_ethernet_mac_i/eth_mac_core/sync_*tx_clk/sync_rst1_reg}] -to [get_cells {tri_mode_ethernet_mac_i/*/data_sync_reg0}]



set_max_delay -from [get_cells {tri_mode_ethernet_mac_i/eth_mac_core/sync_int_tx_rst_mgmt_tx_clk/sync_rst1_reg}] -to [get_cells {tri_mode_ethernet_mac_i/enable_gen/reset90gen/data_sync_reg0}] 6 -datapath_only


