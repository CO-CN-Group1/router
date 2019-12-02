`include "defines.v"

module if_id(
	input wire clk,
	input wire rst,

	input wire[5:0] stall,

	input wire[31:0] if_pc,
	input wire[31:0] if_inst,
	output reg[31:0] id_pc,
	output reg[31:0] id_inst
);

always@(posedge clk)begin
	if(rst == 1'b1)begin
		id_pc <= `zero_word;
		id_inst <= `zero_word;
	end else if(stall[1] == 1'b1 && stall[2] == 1'b0)begin
		id_pc <= `zero_word;
		id_inst <= `zero_word;
	end else if(stall[1] == 1'b0)begin
		id_pc <= if_pc;
		id_inst <= if_inst;
	end
end

endmodule