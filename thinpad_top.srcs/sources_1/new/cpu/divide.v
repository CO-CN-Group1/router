`include "defines.v"

module divide(
	input wire clk,
	input wire rst,

	input wire signed_div_i,
	input wire[31:0] opdata1_i,
	input wire[31:0] opdata2_i,
	input wire start_i,
	input wire annul_i,

	output reg[63:0] result_o,
	output reg ready_o
);

wire[32:0] div_tmp;
reg[5:0] cnt;
reg[64:0] dividend;
reg[1:0] state;
reg[31:0] divisor;
reg[31:0] tmp_op1;
reg[31:0] tmp_op2;

assign div_tmp = {1'b0, dividend[63:32]}-{1'b0, divisor};

always@(posedge clk)begin
	if(rst == 1'b1)begin
		state <= `div_free;
		ready_o <= `div_result_not_ready;
		result_o <= {`zero_word, `zero_word};
		dividend <= 65'b0;
		cnt <= 6'b0;
		divisor <= `zero_word;
		tmp_op1 <= `zero_word;
		tmp_op2 <= `zero_word;
	end else begin
		case(state)
			`div_free:begin
				if(start_i == `div_start && annul_i == 1'b0)begin
					if(opdata2_i == `zero_word)begin
						state <= `div_by_zero;
					end else begin
						state <= `div_on;
						cnt <= 6'b000000;
						if(signed_div_i == 1'b1 && opdata1_i[31] == 1'b1)begin
							tmp_op1 = ~opdata1_i+1;
						end else begin
							tmp_op1 = opdata1_i;
						end
						if(signed_div_i == 1'b1 && opdata2_i[31] == 1'b1)begin
							tmp_op2 = ~opdata2_i+1;
						end else begin
							tmp_op2 = opdata2_i;
						end
						dividend <= {`zero_word, `zero_word};
						dividend[32:1] <= tmp_op1;
						divisor <= tmp_op2;
					end
				end
				else begin
					ready_o <= `div_result_not_ready;
					result_o <= {`zero_word, `zero_word};
				end
			end
			`div_by_zero:begin
				dividend <= {`zero_word, `zero_word};
				state <= `div_end;
			end
			`div_on:begin
				if(annul_i == 1'b0)begin
					if(cnt != 6'b100000)begin
						if(div_tmp[32] == 1'b1)begin
							dividend <= {dividend[63:0], 1'b0};
						end else begin
							dividend <= {div_tmp[31:0], dividend[31:0], 1'b1};
						end
						cnt <= cnt+1;
					end else begin
						if((signed_div_i == 1'b1) && ((opdata1_i[31] ^ opdata2_i[31]) == 1'b1))begin
							dividend[31:0] <= (~dividend[31:0]+1);
						end
						if((signed_div_i == 1'b1) && ((opdata1_i[31] ^ dividend[64]) == 1'b1))begin
							dividend[64:33] <= (~dividend[64:33]+1);
						end
						state <= `div_end;
						cnt <= 6'b000000;
					end
				end else begin
					state <= `div_free;
				end
			end
			`div_end:begin
				result_o <= {dividend[64:33], dividend[31:0]};
				ready_o <= `div_result_ready;
				if(start_i == `div_stop)begin
					state <= `div_free;
					ready_o <= `div_result_not_ready;
					result_o <= {`zero_word, `zero_word};
				end
			end
		endcase
	end
end

endmodule // div