set_property SRC_FILE_INFO {cfile:c:/Users/liangzhao/thinpad_top-thinrouter.1/thinpad_top.srcs/sources_1/ip/eth_mac/synth/eth_mac.xdc rfile:../../../thinpad_top.srcs/sources_1/ip/eth_mac/synth/eth_mac.xdc id:1 order:EARLY scoped_inst:inst} [current_design]
set_property SRC_FILE_INFO {cfile:c:/Users/liangzhao/thinpad_top-thinrouter.1/thinpad_top.srcs/sources_1/ip/eth_mac/synth/eth_mac_clocks.xdc rfile:../../../thinpad_top.srcs/sources_1/ip/eth_mac/synth/eth_mac_clocks.xdc id:2 order:LATE scoped_inst:inst} [current_design]
current_instance inst
set_property src_info {type:SCOPED_XDC file:1 line:65 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay -from [get_cells {tri_mode_ethernet_mac_i/eth_mac_core/flow/rx_pause/pause*to_tx_reg[*]}] -to [get_cells {tri_mode_ethernet_mac_i/eth_mac_core/flow/tx_pause/count_set*reg}] 32 -datapath_only
set_property src_info {type:SCOPED_XDC file:1 line:66 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay -from [get_cells {tri_mode_ethernet_mac_i/eth_mac_core/flow/rx_pause/pause*to_tx_reg[*]}] -to [get_cells {tri_mode_ethernet_mac_i/eth_mac_core/flow/tx_pause/pause_count*reg[*]}] 32 -datapath_only
set_property src_info {type:SCOPED_XDC file:1 line:67 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay -from [get_cells {tri_mode_ethernet_mac_i/eth_mac_core/flow/rx_pause/pause_req_to_tx_int_reg}] -to [get_cells {tri_mode_ethernet_mac_i/eth_mac_core/flow/tx_pause/sync_good_rx/data_sync_reg0}] 6 -datapath_only
set_property src_info {type:SCOPED_XDC file:1 line:84 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay -from [get_cells {tri_mode_ethernet_mac_i/eth_mac_core/sync_int_tx_rst_mgmt_tx_clk/sync_rst1_reg}] -to [get_cells {tri_mode_ethernet_mac_i/enable_gen/reset90gen/data_sync_reg0}] 6 -datapath_only
set_property src_info {type:SCOPED_XDC file:2 line:43 export:INPUT save:INPUT read:READ} [current_design]
set_false_path -rise_from [get_clocks inst_rgmii_rx_clk] -rise_to [get_clocks -of_objects [get_ports rgmii_rxc]] -hold
set_property src_info {type:SCOPED_XDC file:2 line:44 export:INPUT save:INPUT read:READ} [current_design]
set_false_path -fall_from [get_clocks inst_rgmii_rx_clk] -fall_to [get_clocks -of_objects [get_ports rgmii_rxc]] -hold
set_property src_info {type:SCOPED_XDC file:2 line:47 export:INPUT save:INPUT read:READ} [current_design]
set_multicycle_path -from [get_clocks inst_rgmii_rx_clk] -to [get_clocks -of_objects [get_ports rgmii_rxc]] -hold -1
set_property src_info {type:SCOPED_XDC file:2 line:58 export:INPUT save:INPUT read:READ} [current_design]
set_false_path -rise_from [get_clocks -of_objects [get_pins inst/tri_mode_ethernet_mac_support_clocking_i/mmcm_adv_inst/CLKOUT0]] -rise_to [get_clocks inst_rgmii_tx_clk] -hold
set_property src_info {type:SCOPED_XDC file:2 line:59 export:INPUT save:INPUT read:READ} [current_design]
set_false_path -fall_from [get_clocks -of_objects [get_pins inst/tri_mode_ethernet_mac_support_clocking_i/mmcm_adv_inst/CLKOUT0]] -fall_to [get_clocks inst_rgmii_tx_clk] -hold
