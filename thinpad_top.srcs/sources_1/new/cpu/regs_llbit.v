`include "defines.v"

module regs_llbit(
	input wire clk,
	input wire rst,

	input wire flush,
	input wire LLbit_i,
	input wire we,

	output reg LLbit_o
);

always@(posedge clk)begin
	if(rst == 1'b1)begin
		LLbit_o <= 1'b0;
	end else if(flush == 1'b1)begin
		LLbit_o <= 1'b0;
	end else if(we == 1'b1)begin
		LLbit_o <= LLbit_i;
	end
end

endmodule