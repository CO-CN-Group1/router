//enable
`define zero_word {32{1'b0}}
`define start_inst_addr 32'h80000000

//op_code
`define exe_and 6'b100100
`define exe_or  6'b100101
`define exe_xor 6'b100110
`define exe_nor 6'b100111
`define exe_andi 6'b001100
`define exe_xori 6'b001110
`define exe_lui 6'b001111
`define exe_ori 6'b001101

`define exe_sll 6'b000000
`define exe_sllv 6'b000100
`define exe_srl 6'b000010
`define exe_srlv 6'b000110
`define exe_sra 6'b000011
`define exe_srav 6'b000111
`define exe_sync 6'b001111
`define exe_pref 6'b110011

`define exe_movz 6'b001010
`define exe_movn 6'b001011
`define exe_mfhi 6'b010000
`define exe_mthi 6'b010001
`define exe_mflo 6'b010010
`define exe_mtlo 6'b010011

`define exe_slt 6'b101010 
`define exe_sltu 6'b101011
`define exe_slti 6'b001010 
`define exe_sltiu 6'b001011 
`define exe_add 6'b100000 
`define exe_addu 6'b100001 
`define exe_sub 6'b100010 
`define exe_subu 6'b100011 
`define exe_addi 6'b001000 
`define exe_addiu 6'b001001 
`define exe_clz 6'b100000 
`define exe_clo 6'b100001 

`define exe_mult 6'b011000 
`define exe_multu 6'b011001 
`define exe_mul 6'b000010 
`define exe_madd 6'b000000 
`define exe_maddu 6'b000001 
`define exe_msub 6'b000100 
`define exe_msubu 6'b000101

`define exe_div 6'b011010 
`define exe_divu 6'b011011 

`define exe_j 6'b000010 
`define exe_jal 6'b000011 
`define exe_jalr 6'b001001 
`define exe_jr 6'b001000 
`define exe_beq 6'b000100 
`define exe_bgez 5'b00001
`define exe_bgezal 5'b10001 
`define exe_bgtz 6'b000111 
`define exe_blez 6'b000110 
`define exe_bltz 5'b00000 
`define exe_bltzal 5'b10000 
`define exe_bne 6'b000101

`define exe_lb 6'b100000 
`define exe_lbu 6'b100100 
`define exe_lh 6'b100001 
`define exe_lhu 6'b100101 
`define exe_ll 6'b110000 
`define exe_lw 6'b100011 
`define exe_lwl 6'b100010 
`define exe_lwr 6'b100110 
`define exe_sb 6'b101000 
`define exe_sc 6'b111000 
`define exe_sh 6'b101001 
`define exe_sw 6'b101011 
`define exe_swl 6'b101010 
`define exe_swr 6'b101110 

`define exe_nop 6'b000000
`define ssnop 32'b00000000000000000000000001000000

`define exe_special_inst 6'b000000
`define exe_regimm_inst 6'b000001
`define exe_special2_inst 6'b011100

//alu_op
`define exe_and_op 8'b00100100
`define exe_or_op 8'b00100101
`define exe_xor_op 8'b00100110
`define exe_nor_op 8'b00100111
`define exe_andi_op 8'b01011001
`define exe_ori_op 8'b01011010
`define exe_xori_op 8'b01011011
`define exe_lui_op 8'b01011100

`define exe_sll_op 8'b01111100
`define exe_sllv_op 8'b00000100
`define exe_srl_op 8'b00000010
`define exe_srlv_op 8'b00000110
`define exe_sra_op 8'b00000011
`define exe_srav_op 8'b00000111

`define exe_movz_op 8'b00001010
`define exe_movn_op 8'b00001011 
`define exe_mfhi_op 8'b00010000 
`define exe_mthi_op 8'b00010001 
`define exe_mflo_op 8'b00010010 
`define exe_mtlo_op 8'b00010011 

`define exe_slt_op 8'b00001010 
`define exe_sltu_op 8'b00101011 
`define exe_slti_op 8'b01010111 
`define exe_sltiu_op 8'b01011000 
`define exe_add_op 8'b00100000 
`define exe_addu_op 8'b00100001 
`define exe_sub_op 8'b00100010
`define exe_subu_op 8'b00100011 
`define exe_addi_op 8'b01010101 
`define exe_addiu_op 8'b01010110 
`define exe_clz_op 8'b10110000 
`define exe_clo_op 8'b10110001 

`define exe_mult_op 8'b00011000
`define exe_multu_op 8'b00011001
`define exe_mul_op 8'b10101001
`define exe_madd_op 8'b10100110 
`define exe_maddu_op 8'b10101000 
`define exe_msub_op 8'b10101010 
`define exe_msubu_op 8'b10101011 

`define exe_div_op 8'b00011010 
`define exe_divu_op 8'b00011011 

`define exe_j_op 8'b01001111 
`define exe_jal_op 8'b01010000 
`define exe_jalr_op 8'b00001001 
`define exe_jr_op 8'b00001000 
`define exe_beq_op 8'b01010001 
`define exe_bgez_op 8'b01000001
`define exe_bgezal_op 8'b01001011 
`define exe_bgtz_op 8'b01010100 
`define exe_blez_op 8'b01010100 
`define exe_bltz_op 8'b01000000 
`define exe_bltzal_op 8'b01001010 
`define exe_bne_op 8'b01010010

`define exe_lb_op 8'b11100000 
`define exe_lbu_op 8'b11100100 
`define exe_lh_op 8'b11100001 
`define exe_lhu_op 8'b11100101 
`define exe_ll_op 8'b11110000 
`define exe_lw_op 8'b11100011 
`define exe_lwl_op 8'b11100010 
`define exe_lwr_op 8'b11100110 
`define exe_pref_op 8'b11110011
`define exe_sb_op 8'b11101000 
`define exe_sc_op 8'b11111000 
`define exe_sh_op 8'b11101001 
`define exe_sw_op 8'b11101011 
`define exe_swl_op 8'b11101010
`define exe_swr_op 8'b11101110 
`define exe_sync_op 8'b00001111

`define exe_mfc0_op 8'b01011101
`define exe_mtc0_op 8'b01100000


`define exe_nop_op 8'b00000000

//alu_sel
`define exe_res_logic 3'b001
`define exe_res_shift 3'b010
`define exe_res_move 3'b011
`define exe_res_arithmetic 3'b100 
`define exe_res_mul 3'b101
`define exe_res_jump_branch 3'b110
`define exe_res_load_store 3'b111

`define exe_res_nop 3'b000

//length
`define inst_mem_num 131071
`define inst_mem_num_log2 17
`define data_mem_num 31
`define data_mem_num_log2 5
`define reg_width 32
`define double_reg_width 64
`define reg_num 32
`define reg_num_log2 5
`define nop_reg_addr 5'b00000

//div
`define div_free 2'b00 
`define div_by_zero 2'b01 
`define div_on 2'b10 
`define div_end 2'b11 
`define div_result_ready 1'b1 
`define div_result_not_ready 1'b0 
`define div_start 1'b1
`define div_stop 1'b0

//cp0
`define cp0_reg_count 5'b01001
`define cp0_reg_compare 5'b01011
`define cp0_reg_status 5'b01100
`define cp0_reg_cause 5'b01101
`define cp0_reg_epc 5'b01110
`define cp0_reg_prid 5'b01111
`define cp0_reg_config 5'b10000