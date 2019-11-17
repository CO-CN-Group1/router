module divide(
    input wire clk,
    input wire rst,
    input wire signed_div,
    input wire[31:0] reg1,
    input wire[31:0] reg2,
    input wire start,
    input wire stop,
    output reg[63:0] ans,
    output reg finish
);
localparam [1:0] 
    STATE_IDLE = 0,
    STATE_ERROR = 1,
    STATE_COMPUTE = 2,
    STATE_FINISH = 3;

reg[1:0] state;
reg[5:0] now_pos;

reg[31:0] op_data1,op_data2;
reg[64:0] divend;
wire[32:0] div_temp;
assign div_temp = {1'b0,divend[63:32]}-{1'b0,op_data2};

always @(posedge clk)begin
    if(rst)begin
        state <= STATE_IDLE;
        finish <= 0;
        ans <= 0;
    end else begin
        case(state)

            STATE_IDLE: begin
                if(start&&!stop)begin
                    if(reg2==0)begin
                        state <= STATE_ERROR;
                    end else begin
                        state <= STATE_COMPUTE;
                        now_pos <= 0;
                        if(signed_div && reg1[31])begin
                            op_data1 <= (~reg1)+1;
                            divend <= {32'b0,(~reg1)+1,1'b0};
                        end else begin
                            op_data1 <= reg1;
                            divend <= {32'b0,reg1,1'b0};
                        end
                        if(signed_div && reg2[31])begin
                            op_data2 <= (~reg2)+1;
                        end else begin
                            op_data2 <= reg2;
                        end
                    end
                end else begin
                    finish <= 0;
                    ans <= 0;
                end
            end
            STATE_COMPUTE:begin
                if(stop)begin
                    state <= STATE_IDLE; 
                end else begin
                    if(now_pos!=6'b100000)begin
                        now_pos <= now_pos + 1;
                        if(div_temp[32])begin
                            divend <= {divend[63:0],1'b0};
                        end else begin
                            divend <= {div_temp[31:0],divend[31:0],1'b1};
                        end
                    end else begin
                        if(signed_div&&(reg1[31]^reg2[31]))begin
                            divend[31:0] <= (~divend[31:0])+1;
                        end
                        if(signed_div&&(reg1[31]^divend[64]))begin
                            divend[64:33] <= (~divend[64:33])+1;
                        end
                        now_pos <= 0;
                        state <= STATE_FINISH;
                    end
                end
            end
            STATE_ERROR:begin
                state <= STATE_FINISH;
                divend <= 0;
            end
            STATE_FINISH:begin
                if(!start)begin
                    state <= STATE_IDLE;
                    finish <= 0;
                    ans <= 0;
                end else begin
                    finish <= 1;
                    ans <= {divend[64:33],divend[31:0]};
                end
            end

        endcase
    end
end


endmodule