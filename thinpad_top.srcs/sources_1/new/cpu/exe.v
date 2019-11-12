`timescale 1ns / 1ps
`include "defines.v"
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
reg[31:0] shift_ans;
always @(*)begin
    if(rst)begin
        shift_ans <= 0;
    end else begin
        case(aluop)
            `EXE_SLL_OP:begin
                shift_ans <= reg1 << reg2[4:0];    
            end
            `EXE_SRL_OP:begin
                shift_ans <= reg1 >> reg2[4:0];
            end
            `EXE_SRA_OP:begin
                shift_ans <= ({32{reg1[31]}} << (6'd32-{1'b0,reg2[4:0]}))| reg1 >> reg2[4:0];
            end
            default:begin
                shift_ans <= 0;
            end
        endcase 
    end
end

always @(*)begin
    if(rst)begin
        logic_ans <= 0;
    end else begin
        case(aluop)
            `EXE_OR_OP:begin
                logic_ans <= reg1 | reg2;    
            end
            `EXE_AND_OP:begin
                logic_ans <= reg1 & reg2;
            end
            `EXE_XOR_OP:begin
                logic_ans <= reg1 ^ reg2;
            end
            `EXE_NOR_OP:begin
                logic_ans <= ~(reg1 | reg2);
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
        `EXE_RES_SHIFT: begin
            wdata <= shift_ans;
        end
        default:begin
            wdata <= 0;
        end
    endcase
end
endmodule