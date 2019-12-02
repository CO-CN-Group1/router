`include "defines.v"

module ctrl(
	input wire clk,
	input wire rst,
	input wire mem_we_i,
	input wire stallreq_from_id,
	input wire stallreq_from_ex,
	input wire stallreq_from_mem,
	output reg[5:0] stall,

	input wire is_load_i,

	output reg[31:0] new_pc,
	output reg mem_we_o
);

reg pause_for_store;
reg pause_for_load;

always@(posedge clk)begin
	if(rst == 1'b1)begin
		pause_for_store <= 1'b0;
	end else if(mem_we_i == 1'b1)begin
		pause_for_store <= ~pause_for_store;
	end
end

always@(posedge clk)begin
	if(rst == 1'b1)begin
		pause_for_load <= 1'b0;
	end else if(is_load_i == 1'b1)begin
		pause_for_load <= ~pause_for_load;
	end
end

always@(*)begin
	if(rst == 1'b1)begin
		stall <= 6'b000000;
		mem_we_o <= 1'b0;
		new_pc <= `start_inst_addr;
	end else if(mem_we_i == 1'b1 && pause_for_store == 1'b0)begin
		stall <= 6'b011111;
		mem_we_o <= 1'b1;
	end else if(mem_we_i == 1'b1 && pause_for_store == 1'b1)begin
		stall <= 6'b001111;
		mem_we_o <= 1'b1;
	end else if(is_load_i == 1'b1 && pause_for_load == 1'b0)begin
		stall <= 6'b111111;
		mem_we_o <= 1'b0;
	end else if(is_load_i == 1'b1 && pause_for_load == 1'b1)begin
		stall <= 6'b001111;
		mem_we_o <= 1'b0;
	end else if(stallreq_from_ex == 1'b1)begin
		stall <= 6'b001111;
		mem_we_o <= 1'b0;
	end else if(stallreq_from_id == 1'b1)begin
		stall <= 6'b000111;
		mem_we_o <= 1'b0;
	end else if(stallreq_from_mem == 1'b1)begin
		stall <= 6'b000111;
		mem_we_o <= 1'b0;
	end else begin
		stall <= 6'b000000;
		new_pc <= `start_inst_addr;
		mem_we_o <= 1'b0;
	end
end

endmodule // ctrl