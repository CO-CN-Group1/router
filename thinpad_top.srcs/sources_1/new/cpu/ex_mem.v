`include "defines.v"

module ex_mem(
	input wire clk,
	input wire rst,

	input wire[5:0] stall,

	input wire[4:0] ex_wd,
	input wire ex_wreg,
	input wire[31:0] ex_wdata,
	input wire[31:0] ex_hi,
	input wire[31:0] ex_lo,
	input ex_whilo,

	input wire[7:0] ex_aluop,
	input wire[31:0] ex_mem_addr,
	input wire[31:0] ex_reg2,
	input wire[31:0] ex_current_inst_address,

	input wire[63:0] hilo_i,
	input wire[1:0] cnt_i,

	output reg[4:0] mem_wd,
	output reg mem_wreg,
	output reg[31:0] mem_wdata,
	output reg[31:0] mem_hi,
	output reg[31:0] mem_lo,
	output reg mem_whilo,

	output reg[7:0] mem_aluop,
	output reg[31:0] mem_mem_addr,
	output reg[31:0] mem_reg2,
	output reg[31:0] mem_current_inst_address,

	output reg[63:0] hilo_o,
	output reg[1:0] cnt_o,

	input wire[31:0] ex_inst,
	output reg[31:0] mem_inst
);

always@(posedge clk)begin
	if(rst == 1'b1)begin
		mem_wd <=  `nop_reg_addr;
		mem_wreg <=  1'b0;
		mem_wdata <= `zero_word;
		mem_hi <= `zero_word;
		mem_lo <= `zero_word;
		mem_whilo <= 1'b0;
		hilo_o <= {`zero_word, `zero_word};
		cnt_o <= 2'b00;
		mem_aluop <= `exe_nop_op;
		mem_mem_addr <= `zero_word;
		mem_reg2 <= `zero_word;
		mem_current_inst_address <= `zero_word;
		mem_inst <= `zero_word;
	end else if(stall[3] == 1'b1 && stall[4] == 1'b0)begin
		mem_wd <= `nop_reg_addr;
		mem_wreg <= 1'b0;
		mem_wdata <= `zero_word;
		mem_hi <= `zero_word;
		mem_lo <= `zero_word;
		mem_whilo <= 1'b0;
		hilo_o <= hilo_i;
		cnt_o <= cnt_i;
		mem_aluop <= `exe_nop_op;
		mem_mem_addr <= `zero_word;
		mem_reg2 <= `zero_word;
		mem_current_inst_address <= `zero_word;
		mem_inst <= `zero_word;
	end else if(stall[3] == 1'b0)begin
		mem_wd <= ex_wd;
		mem_wreg <= ex_wreg;
		mem_wdata <= ex_wdata;
		mem_hi <= ex_hi;
		mem_lo <= ex_lo;
		mem_whilo <= ex_whilo;
		hilo_o <= {`zero_word, `zero_word};
		cnt_o <= 2'b00;
		mem_aluop <= ex_aluop;
		mem_mem_addr <= ex_mem_addr;
		mem_reg2 <= ex_reg2;
		mem_current_inst_address <= ex_current_inst_address;
		mem_inst <= ex_inst;
	end else begin
		hilo_o <= hilo_i;
		cnt_o <= cnt_i;
	end
end

endmodule