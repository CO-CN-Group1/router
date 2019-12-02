`include "defines.v"

module inst_decode(
	input wire rst,
	input wire[31:0] pc_i,
	input wire[31:0] inst_i,
	
	input wire[7:0] ex_aluop_i,
	input wire ex_wreg_i,
	input wire[31:0] ex_wdata_i,
	input wire[4:0] ex_wd_i,

	input wire mem_wreg_i,
	input wire[31:0] mem_wdata_i,
	input wire[4:0] mem_wd_i,

	input wire[31:0] reg1_data_i,
	input wire[31:0] reg2_data_i,

	input wire is_in_delayslot_i,

	output reg reg1_read_o,
	output reg reg2_read_o,
	output reg[4:0] reg1_addr_o,
	output reg[4:0] reg2_addr_o,

	output reg[7:0] aluop_o,
	output reg[2:0] alusel_o,
	output reg[31:0] reg1_o,
	output reg[31:0] reg2_o,
	output reg[4:0] wd_o,
	output reg wreg_o,
	output wire[31:0] inst_o,

	output reg next_inst_in_delayslot_o,

	output reg branch_flag_o,
	output reg[31:0] branch_target_address_o,
	output reg[31:0] link_addr_o,
	output reg is_in_delayslot_o,

	output wire[31:0] current_inst_address_o,

	output wire stallreq
);

wire[5:0] op = inst_i[31:26];
wire[4:0] op2 = inst_i[10:6];
wire[5:0] op3 = inst_i[5:0];
wire[4:0] op4 = inst_i[20:16];
reg[31:0] imm;
reg inst_valid;
wire[31:0] pc_plus_8;
wire[31:0] pc_plus_4;
wire[31:0] imm_sll2_signedext;

reg stallreq_for_reg1_loadrelate;
reg stallreq_for_reg2_loadrelate;
wire pre_inst_is_load;

assign pc_plus_8 = pc_i+8;
assign pc_plus_4 = pc_i+4;
assign imm_sll2_signedext = {{14{inst_i[15]}}, inst_i[15:0], 2'b00};
assign stallreq = stallreq_for_reg1_loadrelate | stallreq_for_reg2_loadrelate;
assign pre_inst_is_load = ((ex_aluop_i == `exe_lb_op)||
						   (ex_aluop_i == `exe_lbu_op)||
						   (ex_aluop_i == `exe_lh_op)||
						   (ex_aluop_i == `exe_lhu_op)||
						   (ex_aluop_i == `exe_lw_op)||
						   (ex_aluop_i == `exe_lwr_op)||
						   (ex_aluop_i == `exe_lwl_op)||
						   (ex_aluop_i == `exe_ll_op)||
						   (ex_aluop_i == `exe_sc_op))?1'b1:1'b0;
assign inst_o = inst_i;
assign current_inst_address_o = pc_i;

always@(*)begin
	if(rst == 1'b1)begin
		aluop_o <= `exe_nop_op;
		alusel_o <= `exe_res_nop;
		wd_o <= `nop_reg_addr;
		wreg_o <= 1'b0;
		inst_valid <= 1'b0;
		reg1_read_o <= 1'b0;
		reg2_read_o <= 1'b0;
		reg1_addr_o <= `nop_reg_addr;
		reg2_addr_o <= `nop_reg_addr;
		imm <= `zero_word;
		link_addr_o <= `zero_word;
		branch_target_address_o <= `zero_word;
		branch_flag_o <= 1'b0;
		next_inst_in_delayslot_o <= 1'b0;
	end else begin
		aluop_o <= `exe_nop_op;
		alusel_o <= `exe_res_nop;
		wd_o <= inst_i[15:11];
		wreg_o <= 1'b0;
		inst_valid <= 1'b0;
		reg1_read_o <= 1'b0;
		reg2_read_o <= 1'b0;
		reg1_addr_o <= inst_i[25:21];
		reg2_addr_o <= inst_i[20:16];
		imm <= `zero_word;
		link_addr_o <= `zero_word;
		branch_target_address_o <= `zero_word;
		branch_flag_o <= 1'b0;
		next_inst_in_delayslot_o <= 1'b0;
		case(op)
			`exe_special_inst:begin
				case(op2)
					5'b00000:begin
						case(op3)
							`exe_or:begin
								wreg_o <= 1'b1;
								aluop_o <= `exe_or_op;
								alusel_o <= `exe_res_logic;
								reg1_read_o <= 1'b1;
								reg2_read_o <= 1'b1;
								inst_valid <= 1'b0;
							end
							`exe_and:begin
								wreg_o <= 1'b1;
								aluop_o <= `exe_and_op;
								alusel_o <= `exe_res_logic;
								reg1_read_o <= 1'b1;
								reg2_read_o <= 1'b1;
								inst_valid <= 1'b0;
							end
							`exe_xor:begin
								wreg_o <= 1'b1;
								aluop_o <= `exe_xor_op;
								alusel_o <= `exe_res_logic;
								reg1_read_o <= 1'b1;
								reg2_read_o <= 1'b1;
								inst_valid <= 1'b0;
							end
							`exe_nor:begin
								wreg_o <= 1'b1;
								aluop_o <= `exe_nor_op;
								alusel_o <= `exe_res_logic;
								reg1_read_o <= 1'b1;
								reg2_read_o <= 1'b1;
								inst_valid <= 1'b0;
							end
							`exe_sllv:begin
								wreg_o <= 1'b1;
								aluop_o <= `exe_sll_op;
								alusel_o <= `exe_res_shift;
								reg1_read_o <= 1'b1;
								reg2_read_o <= 1'b1;
								inst_valid <= 1'b0;
							end
							`exe_srlv:begin
								wreg_o <= 1'b1;
								aluop_o <= `exe_srl_op;
								alusel_o <= `exe_res_shift;
								reg1_read_o <= 1'b1;
								reg2_read_o <= 1'b1;
								inst_valid <= 1'b0;
							end
							`exe_srav:begin
								wreg_o <= 1'b1;
								aluop_o <= `exe_sra_op;
								alusel_o <= `exe_res_shift;
								reg1_read_o <= 1'b1;
								reg2_read_o <= 1'b1;
								inst_valid <= 1'b0;
							end
							`exe_sync:begin
								wreg_o <= 1'b0;
								aluop_o <= `exe_nop_op;
								alusel_o <= `exe_res_nop;
								reg1_read_o <= 1'b0;
								reg2_read_o <= 1'b1;
								inst_valid <= 1'b0;
							end
							`exe_mfhi:begin
								wreg_o <=1'b1;
								aluop_o <= `exe_mfhi_op;
								alusel_o <= `exe_res_move;
								reg1_read_o <= 1'b0;
								reg2_read_o <= 1'b0;
								inst_valid <= 1'b0;
							end
							`exe_mflo:begin
								wreg_o <= 1'b1;
								aluop_o <= `exe_mflo_op;
								alusel_o <= `exe_res_move;
								reg1_read_o <= 1'b0;
								reg2_read_o <= 1'b0;
								inst_valid <= 1'b0;
							end
							`exe_mthi:begin
								wreg_o <= 1'b0;
								aluop_o <= `exe_mthi_op;
								reg1_read_o <= 1'b1;
								reg2_read_o <= 1'b0;
								inst_valid <= 1'b0;
							end
							`exe_mtlo:begin
								wreg_o <= 1'b0;
								aluop_o <= `exe_mtlo_op;
								reg1_read_o <= 1'b1;
								reg2_read_o <= 1'b0;
								inst_valid <= 1'b0;
							end
							`exe_movn:begin
								aluop_o <= `exe_movn_op;
								alusel_o <= `exe_res_move;
								reg1_read_o <= 1'b1;
								reg2_read_o <= 1'b1;
								inst_valid <= 1'b0;
								if(reg2_o != `zero_word)begin
									wreg_o <= 1'b1;
								end else begin
									wreg_o <= 1'b0;
								end
							end
							`exe_movz:begin
								aluop_o <= `exe_movz_op;
								alusel_o <= `exe_res_move;
								reg1_read_o <= 1'b1;
								reg2_read_o <= 1'b1;
								inst_valid <= 1'b0;
								if(reg2_o == `zero_word)begin
									wreg_o <= 1'b1;
								end else begin
									wreg_o <= 1'b0;
								end
							end
							`exe_slt:begin
								wreg_o <= 1'b1;
								aluop_o <= `exe_slt_op;
								alusel_o <= `exe_res_arithmetic;
								reg1_read_o <= 1'b1;
								reg2_read_o <= 1'b1;
								inst_valid <= 1'b0;
							end
							`exe_sltu:begin
								wreg_o <= 1'b1;
								aluop_o <= `exe_sltu_op;
								alusel_o <= `exe_res_arithmetic;
								reg1_read_o <= 1'b1;
								reg2_read_o <= 1'b1;
								inst_valid <= 1'b0;
							end
							`exe_add:begin
								wreg_o <= 1'b1;
								aluop_o <= `exe_add_op;
								alusel_o <= `exe_res_arithmetic;
								reg1_read_o <= 1'b1;
								reg2_read_o <= 1'b1;
								inst_valid <= 1'b0;
							end
							`exe_addu:begin
								wreg_o <=  1'b1;
								aluop_o <= `exe_addu_op;
								alusel_o <= `exe_res_arithmetic;
								reg1_read_o <= 1'b1;
								reg2_read_o <= 1'b1;
								inst_valid <= 1'b0;
							end
							`exe_sub:begin
								wreg_o <= 1'b1;
								aluop_o <= `exe_sub_op;
								alusel_o <= `exe_res_arithmetic;
								reg1_read_o <= 1'b1;
								reg2_read_o <= 1'b1;
								inst_valid <= 1'b0;
							end
							`exe_subu:begin
								wreg_o <= 1'b1;
								aluop_o <= `exe_subu_op;
								alusel_o <= `exe_res_arithmetic;
								reg1_read_o <= 1'b1;
								reg2_read_o <= 1'b1;
								inst_valid <= 1'b0;
							end
							`exe_mult:begin
								wreg_o <= 1'b0;
								aluop_o <= `exe_mult_op;
								reg1_read_o <= 1'b1;
								reg2_read_o <= 1'b1;
								inst_valid <= 1'b0;
							end
							`exe_multu:begin
								wreg_o <= 1'b0;
								aluop_o <= `exe_multu_op;
								reg1_read_o <= 1'b1;
								reg2_read_o <= 1'b1;
								inst_valid <= 1'b0;
							end
							`exe_div:begin
								wreg_o <= 1'b0;
								aluop_o <= `exe_div_op;
								reg1_read_o <= 1'b1;
								reg2_read_o <= 1'b1;
								inst_valid <= 1'b0;
							end
							`exe_divu:begin
								wreg_o <= 1'b0;
								aluop_o <= `exe_divu_op;
								reg1_read_o <= 1'b1;
								reg2_read_o <= 1'b1;
								inst_valid <= 1'b0;
							end
							`exe_jr:begin
								wreg_o <= 1'b0;
								aluop_o <= `exe_jr_op;
								alusel_o <= `exe_res_jump_branch;
								reg1_read_o <= 1'b1;
								reg2_read_o <= 1'b0;
								link_addr_o <= `zero_word;
								branch_target_address_o <= reg1_o;
								branch_flag_o <= 1'b1;
								next_inst_in_delayslot_o <= 1'b1;
								inst_valid <= 1'b0;
							end
							`exe_jalr:begin
								wreg_o <= 1'b1;
								aluop_o <= `exe_jalr_op;
								alusel_o <= `exe_res_jump_branch;
								reg1_read_o <= 1'b1;
								reg2_read_o <= 1'b0;
								wd_o <= inst_i[15:11];
								link_addr_o <= pc_plus_8;
								branch_target_address_o <= reg1_o;
								branch_flag_o <= 1'b1;
								next_inst_in_delayslot_o <= 1'b1;
								inst_valid <= 1'b0;
							end
							default:begin
							end
						endcase
					end
					default:begin
					end
				endcase
			end
			`exe_ori:begin
				wreg_o <= 1'b1;
				aluop_o <= `exe_or_op;
				alusel_o <= `exe_res_logic;
				reg1_read_o <= 1'b1;
				reg2_read_o <= 1'b0;
				imm <= {16'h0, inst_i[15:0]};
				wd_o <= inst_i[20:16];
				inst_valid <= 1'b0;
			end
			`exe_andi:begin
				wreg_o <= 1'b1;
				aluop_o <= `exe_and_op;
				alusel_o <= `exe_res_logic;
				reg1_read_o <= 1'b1;
				reg2_read_o <= 1'b0;
				imm <= {16'h0, inst_i[15:0]};
				wd_o <= inst_i[20:16];
				inst_valid <= 1'b0;
			end
			`exe_xori:begin
				wreg_o <= 1'b1;
				aluop_o <= `exe_xor_op;
				alusel_o <= `exe_res_logic;
				reg1_read_o <= 1'b1;
				reg2_read_o <= 1'b0;
				imm <= {16'h0, inst_i[15:0]};
				wd_o <= inst_i[20:16];
				inst_valid <= 1'b0;
			end
			`exe_lui:begin
				wreg_o <= 1'b1;
				aluop_o <= `exe_or_op;
				alusel_o <= `exe_res_logic;
				reg1_read_o <= 1'b1;
				reg2_read_o <= 1'b0;
				imm <= {inst_i[15:0], 16'h0};
				wd_o <= inst_i[20:16];
				inst_valid <= 1'b0;
			end
			`exe_slti:begin
				wreg_o <= 1'b1;
				aluop_o <= `exe_slt_op;
				alusel_o <= `exe_res_arithmetic;
				reg1_read_o <= 1'b1;
				reg2_read_o <= 1'b0;
				imm <= {{16{inst_i[15]}}, inst_i[15:0]};
				wd_o <= inst_i[20:16];
				inst_valid <= 1'b0;
			end
			`exe_sltiu:begin
				wreg_o <= 1'b1;
				aluop_o <= `exe_sltu_op;
				alusel_o <= `exe_res_arithmetic;
				reg1_read_o <= 1'b1;
				reg2_read_o <= 1'b0;
				imm <= {{16{inst_i[15]}}, inst_i[15:0]};
				inst_valid <= 1'b0;
			end
			`exe_addi:begin
				wreg_o <= 1'b1;
				aluop_o <= `exe_addi_op;
				alusel_o <= `exe_res_arithmetic;
				reg1_read_o <= 1'b1;
				reg2_read_o <= 1'b0;
				imm <= {{16{inst_i[15]}}, inst_i[15:0]};
				wd_o <= inst_i[20:16];
				inst_valid <= 1'b0;
			end
			`exe_addiu:begin
				wreg_o <= 1'b1;
				aluop_o <= `exe_addiu_op;
				alusel_o <= `exe_res_arithmetic;
				reg1_read_o <= 1'b1;
				reg2_read_o <= 1'b0;
				imm <= {{16{inst_i[15]}}, inst_i[15:0]};
				wd_o <= inst_i[20:16];
				inst_valid <= 1'b0;
			end
			`exe_j:begin
				wreg_o <= 1'b0;
				aluop_o <= `exe_j_op;
				alusel_o <= `exe_res_jump_branch;
				reg1_read_o <= 1'b0;
				reg2_read_o <= 1'b0;
				link_addr_o <= `zero_word;
				branch_target_address_o <= {pc_plus_4[31:28], inst_i[25:0], 2'b00};
				branch_flag_o <= 1'b1;
				next_inst_in_delayslot_o <= 1'b1;
				inst_valid <= 1'b0;
			end
			`exe_jal:begin
				wreg_o <= 1'b1;
				aluop_o <= `exe_jal_op;
				alusel_o <= `exe_res_jump_branch;
				reg1_read_o <= 1'b0;
				reg2_read_o <= 1'b0;
				wd_o <= 5'b11111;
				link_addr_o <= pc_plus_8;
				branch_target_address_o <= {pc_plus_4[31:28], inst_i[25:0], 2'b00};
				branch_flag_o <= 1'b1;
				next_inst_in_delayslot_o <= 1'b1;
				inst_valid <= 1'b0;
			end
			`exe_beq:begin
				wreg_o <= 1'b0;
				aluop_o <= `exe_beq_op;
				alusel_o <= `exe_res_jump_branch;
				reg1_read_o <= 1'b1;
				reg2_read_o <= 1'b1;
				inst_valid <= 1'b0;
				if(reg1_o == reg2_o)begin
					branch_target_address_o <= pc_plus_4+imm_sll2_signedext;
					branch_flag_o <= 1'b1;
					next_inst_in_delayslot_o <= 1'b1;
				end
			end
			`exe_bgtz:begin
				wreg_o <= 1'b0;
				aluop_o <= `exe_bgtz_op;
				alusel_o <= `exe_res_jump_branch;
				reg1_read_o <= 1'b1;
				reg2_read_o <= 1'b0;
				inst_valid <= 1'b0;
				if((reg1_o[31] == 1'b0) && (reg1_o != `zero_word))begin
					branch_target_address_o <= pc_plus_4+imm_sll2_signedext;
					branch_flag_o <= 1'b1;
					next_inst_in_delayslot_o <= 1'b1;
				end
			end
			`exe_blez:begin
				wreg_o <= 1'b0;
				aluop_o <= `exe_blez_op;
				alusel_o <= `exe_res_jump_branch;
				reg1_read_o <= 1'b1;
				reg2_read_o <= 1'b0;
				inst_valid <= 1'b0;
				if((reg1_o[31] == 1'b1) || (reg1_o == `zero_word))begin
					branch_target_address_o <= pc_plus_4+imm_sll2_signedext;
					branch_flag_o <= 1'b1;
					next_inst_in_delayslot_o <= 1'b1;
				end
			end
			`exe_bne:begin
				wreg_o <= 1'b0;
				aluop_o <= `exe_blez_op;
				alusel_o <= `exe_res_jump_branch;
				reg1_read_o <= 1'b1;
				reg2_read_o <= 1'b1;
				inst_valid <= 1'b0;
				if(reg1_o != reg2_o)begin
				    branch_target_address_o <= pc_plus_4+imm_sll2_signedext;
					branch_flag_o <= 1'b1;
					next_inst_in_delayslot_o <= 1'b1;
				end
			end
			`exe_lb:begin
				wreg_o <= 1'b1;
				aluop_o <= `exe_lb_op;
				alusel_o <= `exe_res_load_store;
				reg1_read_o <= 1'b1;
				reg2_read_o <= 1'b0;
				wd_o <= inst_i[20:16];
				inst_valid <= 1'b0;
			end
			`exe_lbu:begin
				wreg_o <= 1'b1;
				aluop_o <= `exe_lbu_op;
				alusel_o <= `exe_res_load_store;
				reg1_read_o <= 1'b1;
				reg2_read_o <= 1'b0;
				wd_o <= inst_i[20:16];
				inst_valid <= 1'b0;
			end
			`exe_lh:begin
				wreg_o <= 1'b1;
				aluop_o <= `exe_lh_op;
				alusel_o <= `exe_res_load_store;
				reg1_read_o <= 1'b1;
				reg2_read_o <= 1'b0;
				wd_o <= inst_i[20:16];
				inst_valid <= 1'b0;
			end
			`exe_lhu:begin
				wreg_o <= 1'b1;
				aluop_o <= `exe_lhu_op;
				alusel_o <= `exe_res_load_store;
				reg1_read_o <= 1'b1;
				reg2_read_o <= 1'b0;
				wd_o <= inst_i[20:16];
				inst_valid <= 1'b0;
			end
			`exe_lw:begin
				wreg_o <= 1'b1;
				aluop_o <= `exe_lw_op;
				alusel_o <= `exe_res_load_store;
				reg1_read_o <= 1'b1;
				reg2_read_o <= 1'b0;
				wd_o <= inst_i[20:16];
				inst_valid <= 1'b0;
			end
			`exe_ll:begin
				wreg_o <= 1'b1;
				aluop_o <= `exe_ll_op;
				alusel_o <= `exe_res_load_store;
				reg1_read_o <= 1'b1;
				reg2_read_o <= 1'b0;
				wd_o <= inst_i[20:16];
				inst_valid <= 1'b0;
			end
			`exe_lwl:begin
				wreg_o <= 1'b1;
				aluop_o <= `exe_lwl_op;
				alusel_o <= `exe_res_load_store;
				reg1_read_o <= 1'b1;
				reg2_read_o <= 1'b1;
				wd_o <= inst_i[20:16];
				inst_valid <= 1'b0;
			end
			`exe_lwr:begin
				wreg_o <= 1'b1;
				aluop_o <= `exe_lwr_op;
				alusel_o <= `exe_res_load_store;
				reg1_read_o <= 1'b1;
				reg2_read_o <= 1'b1;
				wd_o <= inst_i[20:16];
				inst_valid <= 1'b0;
			end
			`exe_sb:begin
				wreg_o <= 1'b0;
				aluop_o <= `exe_sb_op;
				reg1_read_o <= 1'b1;
				reg2_read_o <= 1'b1;
				inst_valid <= 1'b0;
				alusel_o <= `exe_res_load_store;
			end
			`exe_sh:begin
				wreg_o <= 1'b0;
				aluop_o <= `exe_sh_op;
				reg1_read_o <= 1'b1;
				reg2_read_o <= 1'b1;
				inst_valid <= 1'b0;
				alusel_o <= `exe_res_load_store;
			end
			`exe_sw:begin
				wreg_o <= 1'b0;
				aluop_o <= `exe_sw_op;
				reg1_read_o <= 1'b1;
				reg2_read_o <= 1'b1;
				inst_valid <= 1'b0;
				alusel_o <= `exe_res_load_store;
			end
			`exe_swl:begin
				wreg_o <= 1'b0;
				aluop_o <= `exe_swl_op;
				reg1_read_o <= 1'b1;
				reg2_read_o <= 1'b1;
				inst_valid <= 1'b0;
				alusel_o <= `exe_res_load_store;
			end
			`exe_swr:begin
				wreg_o <= 1'b0;
				aluop_o <= `exe_swr_op;
				reg1_read_o <= 1'b1;
				reg2_read_o <= 1'b1;
				inst_valid <= 1'b0;
				alusel_o <= `exe_res_load_store;
			end
			`exe_sc:begin
				wreg_o <= 1'b1;
				aluop_o <= `exe_sc_op;
				alusel_o <= `exe_res_load_store;
				reg1_read_o <= 1'b1;
				reg2_read_o <= 1'b1;
				wd_o <= inst_i[20:16];
				inst_valid <= 1'b0;
			end
			`exe_regimm_inst:begin
				case(op4)
					`exe_bgez:begin
						wreg_o <= 1'b0;
						aluop_o <= `exe_bgez_op;
						alusel_o <= `exe_res_jump_branch;
						reg1_read_o <= 1'b1;
						reg2_read_o <= 1'b0;
						inst_valid <= 1'b0;
						if(reg1_o[31] == 1'b0)begin
							branch_target_address_o <= pc_plus_4+imm_sll2_signedext;
							branch_flag_o <= 1'b1;
							next_inst_in_delayslot_o <= 1'b1;
						end
					end
					`exe_bgezal:begin
						wreg_o <= 1'b1;
						aluop_o <= `exe_bgezal_op;
						alusel_o <= `exe_res_jump_branch;
						reg1_read_o <= 1'b1;
						reg2_read_o <= 1'b0;
						link_addr_o <= pc_plus_8;
						wd_o <= 5'b11111;
						inst_valid <= 1'b0;
						if(reg1_o[31] == 1'b0)begin
							branch_target_address_o <= pc_plus_4+imm_sll2_signedext;
							branch_flag_o <= 1'b1;
							next_inst_in_delayslot_o <= 1'b1;
						end
					end
					`exe_bltz:begin
						wreg_o <= 1'b0;
						aluop_o <= `exe_bgezal_op;
						alusel_o <= `exe_res_jump_branch;
						reg1_read_o <= 1'b1;
						reg2_read_o <= 1'b0;
						inst_valid <= 1'b0;
						if(reg1_o[31] == 1'b1)begin
							branch_target_address_o <= pc_plus_4+imm_sll2_signedext;
							branch_flag_o <= 1'b1;
							next_inst_in_delayslot_o <= 1'b1;
						end
					end
					`exe_bltzal:begin
						wreg_o <= 1'b1;
						aluop_o <= `exe_bgezal_op;
						alusel_o <= `exe_res_jump_branch;
						reg1_read_o <= 1'b1;
						reg2_read_o <= 1'b0;
						link_addr_o <= pc_plus_8;
						wd_o <= 5'b11111;
						inst_valid <= 1'b0;
						if(reg1_o[31] == 1'b1)begin
							branch_target_address_o <= pc_plus_4+imm_sll2_signedext;
							branch_flag_o <= 1'b1;
							next_inst_in_delayslot_o <= 1'b1;
						end
					end
					default:begin
					end
				endcase
			end
			`exe_special2_inst:begin
				case(op3)
					`exe_clz:begin
						wreg_o <= 1'b1;
						aluop_o <= `exe_clz_op;
						alusel_o <= `exe_res_arithmetic;
						reg1_read_o <= 1'b1;
						reg2_read_o <= 1'b0;
						inst_valid <= 1'b0;
					end
					`exe_clo:begin
						wreg_o <= 1'b1;
						aluop_o <= `exe_clo_op;
						alusel_o <= `exe_res_arithmetic;
						reg1_read_o <= 1'b1;
						reg2_read_o <= 1'b0;
						inst_valid <= 1'b0;
					end
					`exe_mul:begin
						wreg_o <= 1'b1;
						aluop_o <= `exe_mul_op;
						alusel_o <= `exe_res_mul;
						reg1_read_o <= 1'b1;
						reg2_read_o <= 1'b1;
						inst_valid <= 1'b0;
					end
					`exe_madd:begin
						wreg_o <= 1'b0;
						aluop_o <= `exe_madd_op;
						alusel_o <= `exe_res_mul;
						reg1_read_o <= 1'b1;
						reg2_read_o <= 1'b1;
						inst_valid <= 1'b0;
					end
					`exe_maddu:begin
						wreg_o <= 1'b0;
						aluop_o <= `exe_maddu_op;
						alusel_o <= `exe_res_mul;
						reg1_read_o <= 1'b1;
						reg2_read_o <= 1'b1;
						inst_valid <= 1'b0;
					end
					`exe_msub:begin
						wreg_o <= 1'b0;
						aluop_o <= `exe_msub_op;
						alusel_o <= `exe_res_mul;
						reg1_read_o <= 1'b1;
						reg2_read_o <= 1'b1;
						inst_valid <= 1'b0;
					end
					`exe_msubu:begin
						wreg_o <= 1'b0;
						aluop_o <= `exe_msubu_op;
						alusel_o <= `exe_res_mul;
						reg1_read_o <= 1'b1;
						reg2_read_o <= 1'b1;
						inst_valid <= 1'b0;
					end
					default:begin
					end
				endcase
			end
			`exe_pref:begin
				wreg_o <= 1'b1;
				aluop_o <= `exe_nop_op;
				alusel_o <= `exe_res_nop;
				reg1_read_o <= 1'b0;
				reg2_read_o <= 1'b0;
				inst_valid <= 1'b0;
			end
			default:begin
			end
		endcase

		if(inst_i[31:21] == 11'b00000000000)begin
			if(op3 == `exe_sll)begin
				wreg_o <= 1'b1;
				aluop_o <= `exe_sll_op;
				alusel_o <= `exe_res_shift;
				reg1_read_o <= 1'b0;
				reg2_read_o <= 1'b1;
				imm[4:0] <= inst_i[10:6];
				wd_o <= inst_i[15:11];
				inst_valid <= 1'b0;
			end else if(op3 == `exe_srl)begin
				wreg_o <= 1'b1;
				aluop_o <= `exe_srl_op;
				alusel_o <= `exe_res_shift;
				reg1_read_o <= 1'b0;
				reg2_read_o <= 1'b1;
				imm[4:0] <= inst_i[10:6];
				wd_o <= inst_i[15:11];
				inst_valid <= 1'b0;
			end else if(op3 == `exe_sra)begin
				wreg_o <= 1'b1;
				aluop_o <= `exe_sra_op;
				alusel_o <= `exe_res_shift;
				reg1_read_o <= 1'b0;
				reg2_read_o <= 1'b1;
				imm[4:0] <= inst_i[10:6];
				wd_o <= inst_i[15:11];
				inst_valid <= 1'b0;
			end
		end
	end
end

always@(*)begin
	stallreq_for_reg1_loadrelate <= 1'b0;
	if(rst == 1'b1)begin
		reg1_o <= `zero_word;
	end else if(pre_inst_is_load == 1'b1 && ex_wd_i == reg1_addr_o
				&& reg1_read_o == 1'b1)begin
		stallreq_for_reg1_loadrelate <= 1'b1;
	end else if((reg1_read_o == 1'b1) && (ex_wreg_i == 1'b1)
				&& (ex_wd_i == reg1_addr_o))begin
		reg1_o <= ex_wdata_i;
	end else if((reg1_read_o == 1'b1) && (mem_wreg_i == 1'b1)
				&& (mem_wd_i == reg1_addr_o))begin
		reg1_o <= mem_wdata_i;
	end else if(reg1_read_o == 1'b1)begin
		reg1_o <= reg1_data_i;
	end else if(reg1_read_o == 1'b0)begin
		reg1_o <= imm;
	end else begin
		reg1_o <= `zero_word;
	end
end

always@(*)begin
	stallreq_for_reg2_loadrelate <= 1'b0;
	if(rst == 1'b1)begin
		reg2_o <= `zero_word;
	end else if(pre_inst_is_load == 1'b1 && ex_wd_i == reg2_addr_o
				&& reg2_read_o == 1'b1)begin
		stallreq_for_reg2_loadrelate <= 1'b1;
	end else if((reg2_read_o == 1'b1) && (ex_wreg_i == 1'b1)
				&& (ex_wd_i == reg2_addr_o))begin
		reg2_o <= ex_wdata_i;
	end else if((reg2_read_o == 1'b1) && (mem_wreg_i == 1'b1)
				&& (mem_wd_i == reg2_addr_o))begin
		reg2_o <= mem_wdata_i;
	end else if(reg2_read_o == 1'b1)begin
		reg2_o <= reg2_data_i;
	end else if(reg2_read_o == 1'b0)begin
		reg2_o <= imm;
	end else begin
		reg2_o <= `zero_word;
	end
end

always@(*)begin
	if(rst == 1'b1)begin
		is_in_delayslot_o <= 1'b0;
	end else begin
		is_in_delayslot_o <= is_in_delayslot_i;
	end
end

endmodule // id