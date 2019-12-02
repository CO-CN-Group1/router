`include "defines.v"

module memory(
	input wire rst,

	input wire[4:0] wd_i,
	input wire wreg_i,
	input wire[31:0] wdata_i,
	input wire[31:0] hi_i,
	input wire[31:0] lo_i,
	input wire whilo_i,

	input wire[7:0] aluop_i,
	input wire[31:0] mem_addr_i,
	input wire[31:0] reg2_i,

	input wire[31:0] mem_data_i,
	input wire[31:0] current_inst_address_i,
	input wire[31:0] inst_i,

	input wire LLbit_i,
	input wire wb_LLbit_we_i,
	input wire wb_LLbit_value_i,

	output reg[4:0] wd_o,
	output reg wreg_o,
	output reg[31:0] wdata_o,
	output reg[31:0] hi_o,
	output reg[31:0] lo_o,
	output reg whilo_o,

	output reg LLbit_we_o,
	output reg LLbit_value_o,

	output reg[31:0] mem_addr_o,
	output wire mem_we_o,
	output reg[3:0] mem_sel_o,
	output reg[31:0] mem_data_o,
	output reg mem_ce_o,
	output wire[31:0] inst_o,
	output wire[31:0] current_inst_address_o,

	output wire[31:0] virtual_addr,
    input wire[31:0] physical_addr,
	output wire is_load_o
);


assign is_load_o = (aluop_i==`exe_lb_op)||(aluop_i==`exe_lbu_op)||(aluop_i==`exe_lh_op)||(aluop_i==`exe_lhu_op)||(aluop_i==`exe_ll_op)||(aluop_i==`exe_lw_op)||(aluop_i==`exe_lwl_op)||(aluop_i==`exe_lwr_op);

reg LLbit;
wire[31:0] zero32;
reg mem_we;

assign mem_we_o = mem_we;
assign zero32 = `zero_word;
assign inst_o = inst_i;
assign virtual_addr = mem_addr_i;
assign current_inst_address_o = current_inst_address_i;

always@(*)begin
	if(rst == 1'b1)begin
		LLbit <= 1'b0;
	end else begin
		if(wb_LLbit_we_i == 1'b1)begin
			LLbit <= wb_LLbit_value_i;
		end else begin
			LLbit <= LLbit_i;
		end
	end
end

always@(*)begin
	if(rst == 1'b1)begin
		wd_o <= `nop_reg_addr;
		wreg_o <= 1'b0;
		wdata_o <= `zero_word;
		hi_o <= `zero_word;
		lo_o <= `zero_word;
		whilo_o <= 1'b0;
		mem_addr_o <= `zero_word;
		mem_we <= 1'b0;
		mem_sel_o <= 4'b0000;
		mem_data_o <= `zero_word;
		mem_ce_o <= 1'b0;
		LLbit_we_o <= 1'b0;
		LLbit_value_o <= 1'b0;
	end else begin
		wd_o <= wd_i;
		wreg_o <= wreg_i;
		wdata_o <= wdata_i;
		hi_o <= hi_i;
		lo_o <= lo_i;
		whilo_o <= whilo_i;
		mem_we <= 1'b0;
		mem_addr_o <= `zero_word;
		mem_sel_o <= 4'b1111;
		mem_ce_o <= 1'b0;
		case(aluop_i)
			`exe_lb_op:begin
				mem_addr_o <= physical_addr;
				mem_we <= 1'b0;
				mem_ce_o <= 1'b1;
				case(physical_addr[1:0])
					2'b11:begin
						wdata_o <= {{24{mem_data_o[31]}}, mem_data_i[31:24]};
						mem_sel_o <= 4'b1000;
					end
					2'b10:begin
						wdata_o <= {{24{mem_data_i[23]}}, mem_data_i[23:16]};
						mem_sel_o <= 4'b0100;
					end
					2'b01:begin
						wdata_o <= {{24{mem_data_i[15]}}, mem_data_i[15:8]};
						mem_sel_o <= 4'b0010;
					end
					2'b00:begin
						wdata_o <= {{24{mem_data_i[7]}}, mem_data_i[7:0]};
                        mem_sel_o <= 4'b0001;
                    end
					default:begin
						wdata_o <= `zero_word;
					end
				endcase
			end
			`exe_lbu_op:begin
				mem_addr_o <= physical_addr;
				mem_we <= 1'b0;
				mem_ce_o <= 1'b1;
				case(physical_addr[1:0])
					2'b11:begin
						wdata_o <= {{24{1'b0}}, mem_data_i[31:24]};
						mem_sel_o <= 4'b1000;
					end
					2'b10:begin
						wdata_o <= {{24{1'b0}}, mem_data_i[23:16]};
						mem_sel_o <= 4'b0100;
					end
					2'b01:begin
						wdata_o <= {{24{1'b0}}, mem_data_i[15:8]};
						mem_sel_o <= 4'b0010;
					end
					2'b00:begin
						wdata_o <= {{24{1'b0}}, mem_data_i[7:0]};
						mem_sel_o <= 4'b0001;
					end
					default:begin
						wdata_o <= `zero_word;
					end
				endcase
			end
			`exe_lh_op:begin
				mem_addr_o <= physical_addr;
				mem_we <= 1'b0;
				mem_ce_o <= 1'b1;
				case(physical_addr[1:0])
					2'b10:begin
						wdata_o <= {{16{mem_data_i[31]}}, mem_data_i[31:16]};
						mem_sel_o <= 4'b1100;
					end
					2'b00:begin
						wdata_o <= {{16{mem_data_i[15]}}, mem_data_i[15:0]};
						mem_sel_o <= 4'b0011;
					end
					default:begin
						wdata_o <= `zero_word;
					end
				endcase
			end
			`exe_lhu_op:begin
				mem_addr_o <= physical_addr;
				mem_we <= 1'b0;
				mem_ce_o <= 1'b1;
				case(physical_addr[1:0])
					2'b10:begin
						wdata_o <= {{16{1'b0}}, mem_data_i[31:16]};
						mem_sel_o <= 4'b1100;
					end
					2'b00:begin
						wdata_o <= {{16{1'b0}}, mem_data_i[15:0]};
						mem_sel_o <= 4'b0011;
					end
					default:begin
						wdata_o <= `zero_word;
					end
				endcase
			end
			`exe_lw_op:begin
				mem_addr_o <= physical_addr;
				mem_we <= 1'b0;
				wdata_o <= mem_data_i;
				mem_sel_o <= 4'b1111;
				mem_ce_o <= 1'b1;
			end
			`exe_lwl_op:begin
				mem_addr_o <= {physical_addr[31:2], 2'b00};
				mem_we <= 1'b0;
				mem_sel_o <= 4'b1111;
				mem_ce_o <= 1'b1;
				case(physical_addr[1:0])
					2'b11:begin
						wdata_o <= mem_data_i[31:0];
					end
					2'b10:begin
						wdata_o <= {mem_data_i[23:0], reg2_i[7:0]};
					end
					2'b01:begin
						wdata_o <= {mem_data_i[15:0], reg2_i[15:0]};
					end
					2'b00:begin
						wdata_o <= {mem_data_i[7:0], reg2_i[23:0]};
					end
					default:begin
						wdata_o <= `zero_word;
					end
				endcase
			end
			`exe_lwr_op:begin
				mem_addr_o <= {physical_addr[31:2], 2'b00};
				mem_we <= 1'b0;
				mem_sel_o <= 4'b1111;
				mem_ce_o <= 1'b1;
				case(physical_addr[1:0])
					2'b11:begin
						wdata_o <= {reg2_i[31:8], mem_data_i[31:24]};
					end
					2'b10:begin
						wdata_o <= {reg2_i[31:16], mem_data_i[31:16]};
					end
					2'b01:begin
						wdata_o <= {reg2_i[31:24], mem_data_i[31:8]};
					end
					2'b00:begin
						wdata_o <= mem_data_i;
					end
					default:begin
						wdata_o <= `zero_word;
					end
				endcase
			end
			`exe_ll_op:begin
				mem_addr_o <= physical_addr;
				mem_we <= 1'b0;
				wdata_o <= mem_data_i;
				LLbit_we_o <= 1'b1;
				LLbit_value_o <= 1'b1;
				mem_sel_o <= 4'b1111;
				mem_ce_o <= 1'b1;
			end
			`exe_sb_op:begin
				mem_addr_o <= physical_addr;
				mem_we <= 1'b1;
				mem_data_o <= {reg2_i[7:0], reg2_i[7:0], reg2_i[7:0], reg2_i[7:0]};
				mem_ce_o <= 1'b1;
				case(physical_addr[1:0])
					2'b11:begin
						mem_sel_o <= 4'b1000;
					end
					2'b10:begin
						mem_sel_o <= 4'b0100;
					end
					2'b01:begin
						mem_sel_o <= 4'b0010;
					end
					2'b00:begin
						mem_sel_o <= 4'b0001;
					end
					default:begin
						mem_sel_o <= 4'b0000;
					end
				endcase
			end
			`exe_sh_op:begin
				mem_addr_o <= physical_addr;
				mem_we <= 1'b1;
				mem_data_o <= {reg2_i[15:0], reg2_i[15:0]};
				mem_ce_o <= 1'b1;
				case(physical_addr[1:0])
					2'b10:begin
						mem_sel_o <= 4'b1100;
					end
					2'b00:begin
						mem_sel_o <= 4'b0011;
					end
					default:begin
						mem_sel_o <= 4'b0000;
					end
				endcase
			end
			`exe_sw_op:begin
				mem_addr_o <= physical_addr;
				mem_we <= 1'b1;
				mem_data_o <= reg2_i;
				mem_sel_o <= 4'b1111;
				mem_ce_o <= 1'b1;
			end
			`exe_swl_op:begin
				mem_addr_o <= {physical_addr[31:2], 2'b00};
				mem_we <= 1'b1;
				mem_ce_o <= 1'b1;
				case(physical_addr[1:0])
					2'b11:begin
						mem_sel_o <= 4'b1111;
						mem_data_o <= reg2_i;
					end
					2'b10:begin
						mem_sel_o <= 4'b0111;
						mem_data_o <= {zero32[7:0], reg2_i[31:8]};
					end
					2'b01:begin
						mem_sel_o <= 4'b0011;
						mem_data_o <= {zero32[15:0], reg2_i[31:16]};
					end
					2'b00:begin
						mem_sel_o <= 4'b0001;
						mem_data_o <= {zero32[23:0], reg2_i[31:24]};
					end
					default:begin
						mem_sel_o <= 4'b0000;
					end
				endcase
			end
			`exe_swr_op:begin
				mem_addr_o <= {physical_addr[31:2], 2'b00};
				mem_we <= 1'b1;
				mem_ce_o <= 1'b1;
				case(physical_addr[1:0])
					2'b11:begin
						mem_sel_o <= 4'b1000;
						mem_data_o <= {reg2_i[7:0], zero32[23:0]};
					end
					2'b10:begin
						mem_sel_o <= 4'b1100;
						mem_data_o <= {reg2_i[15:0], zero32[15:0]};
					end
					2'b01:begin
						mem_sel_o <= 4'b1110;
						mem_data_o <= {reg2_i[23:0], zero32[7:0]};
					end
					2'b00:begin
						mem_sel_o <= 4'b1111;
						mem_data_o <= reg2_i[31:0];
					end
					default:begin
						mem_sel_o <= 4'b0000;
					end
				endcase
			end
			`exe_sc_op:begin
				if(LLbit == 1'b1)begin
					LLbit_we_o <= 1'b1;
					LLbit_value_o <= 1'b0;
					mem_addr_o <= physical_addr;
					mem_we <= 1'b1;
					mem_data_o <= reg2_i;
					wdata_o <= 32'b1;
					mem_sel_o <= 4'b1111;
					mem_ce_o <= 1'b1;
				end else begin
					wdata_o <= 32'b0;
				end
			end
			default:begin
			end
		endcase
	end
end

endmodule