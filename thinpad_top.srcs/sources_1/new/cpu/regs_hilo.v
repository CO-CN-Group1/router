`include "defines.v"

module regs_hilo(
	input wire clk,
	input wire rst,

	input wire we,
	input wire[31:0] hi_i,
	input wire[31:0] lo_i,

	output reg[31:0] hi_o,
	output reg[31:0] lo_o
);

always@(posedge clk)begin
	if(rst == 1'b1)begin
		hi_o <= `zero_word;
		lo_o <= `zero_word;
	end else if(we == 1'b1)begin
		hi_o <= hi_i;
		lo_o <= lo_i;
	end
end

endmodule // hilo_reg