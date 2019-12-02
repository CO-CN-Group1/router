`include "defines.v"

module mem_wb(
	input wire clk,
	input wire rst,

	input wire[5:0] stall,
	
	input wire[4:0] mem_wd,
	input wire mem_wreg,
	input wire[31:0] mem_wdata,
	input wire[31:0] mem_hi,
	input wire[31:0] mem_lo,
	input wire mem_whilo,
	
	input wire mem_LLbit_we,
	input wire mem_LLbit_value,

	output reg[4:0] wb_wd,
	output reg wb_wreg,
	output reg[31:0] wb_wdata,
	output reg[31:0] wb_hi,
	output reg[31:0] wb_lo,
	output reg wb_whilo,

	output reg wb_LLbit_we,
	output reg wb_LLbit_value,

	input wire[31:0] mem_inst,
	output reg[31:0] wb_inst
);

always@(posedge clk)begin
	if(rst == 1'b1)begin
		wb_wd <= `nop_reg_addr;
		wb_wreg <= 1'b0;
		wb_wdata <= `zero_word;
		wb_hi <= `zero_word;
		wb_lo <= `zero_word;
		wb_whilo <= 1'b0;
		wb_LLbit_we <= 1'b0;
		wb_LLbit_value <= 1'b0;
		wb_inst <= `zero_word;
	end else if(stall[4] == 1'b1 && stall[5] == 1'b0)begin
		wb_wd <= `nop_reg_addr;
		wb_wreg <= 1'b0;
		wb_wdata <= `zero_word;
		wb_hi <= `zero_word;
		wb_lo <= `zero_word;
		wb_whilo <= 1'b0;
		wb_LLbit_we <= 1'b0;
		wb_LLbit_value <= 1'b0;
		wb_inst <= `zero_word;
	end else if(stall[4] == 1'b0)begin
		wb_wd <= mem_wd;
		wb_wreg <= mem_wreg;
		wb_wdata <= mem_wdata;
		wb_hi <= mem_hi;
		wb_lo <= mem_lo;
		wb_whilo <= mem_whilo;
		wb_LLbit_we <= mem_LLbit_we;
		wb_LLbit_value <= mem_LLbit_value;
		wb_inst <= mem_inst;
	end
end

endmodule