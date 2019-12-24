`include "defines.v"

module inst_fetch(
	input wire clk,
	input wire rst,
	input wire[5:0] stall,
	input wire[31:0] new_pc,
	input wire branch_flag_i,
	input wire[31:0] branch_target_address_i,
	output reg[31:0] pc,
	output reg ce
);

always@(posedge clk)begin
	if(ce == 1'b0)begin
		pc <= `start_inst_addr;
	end else if(stall[0] == 1'b0)begin
		if(branch_flag_i == 1'b1)begin
			pc <= branch_target_address_i;
		end else begin
			pc <= pc+4'h4;
		end
	end
end

always@(posedge clk)begin
	if(rst == 1'b1)begin
		ce <= 1'b0;
	end else begin
		ce <= 1'b1;
	end
end

endmodule