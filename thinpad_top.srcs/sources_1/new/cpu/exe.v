`timescale 1ns / 1ps

module exe(
    input wire rst,
    input wire[7:0] aluop,
    input wire[2:0] alusel,
    input wire[31:0] reg1,
    input wire[31:0] reg2,
    input wire[4:0] wd_i,
    input wire wreg_i,
    output reg[31:0] wdata,
    output reg wreg_o,
    output reg[4:0] wd_o
);

reg[31:0] logic_ans;

always @(*)begin
    if(rst)begin
        logic_ans <= 0;
    end else begin
        case(aluop)
            `EXE_OR_OP:begin
                logic_ans <= reg1 | reg2;    
            end
            default:begin
                logic_ans <= 0;
            end
        endcase 
    end
end

always@(*) begin
    wd_o <= wd_i;
    wreg_o <= wreg_i;
    case(alusel)
        `EXE_RES_LOGIC: begin
            wdata <= logic_ans;
        end
        default:begin
            wdata <= 0;
        end
    endcase
end
endmodule