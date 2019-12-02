`include "defines.v"

module regs(
	input wire clk,
	input wire rst,

	input wire we,
	input wire[4:0] waddr,
	input wire[31:0] wdata,

	input wire re1,
	input wire[4:0] raddr1,
	output reg[31:0] rdata1,

	input wire re2,
	input wire[4:0] raddr2,
	output reg[31:0] rdata2
);

reg[31:0] regs[0:`reg_num-1];

always@(posedge clk)begin
	if(rst == 1'b0)begin
		if((we == 1'b1) && (waddr != `reg_num_log2'h0))begin
			regs[waddr] <= wdata;
		end
	end
end

always@(*)begin
	if(rst == 1'b1)begin
		rdata1 <= `zero_word;
	end else if(raddr1 == `reg_num_log2'h0)begin
		rdata1 <= `zero_word;
	end else if((raddr1 == waddr) && (we == 1'b1) && (re1 == 1'b1))begin
		rdata1 <= wdata;
	end else if(re1 == 1'b1)begin
		rdata1 <= regs[raddr1];
	end else begin
		rdata1 <= `zero_word;
	end
end

always@(*)begin
	if(rst == 1'b1)begin
		rdata2 <= `zero_word;
	end else if(raddr2 == `reg_num_log2'h0)begin
		rdata2 <= `zero_word;
	end else if((raddr2 == waddr) && (we == 1'b1) && (re2 == 1'b1))begin
		rdata2 <= wdata;
	end else if(re2 == 1'b1)begin
		rdata2 <= regs[raddr2];
	end else begin
		rdata2 <= `zero_word;
	end
end


endmodule