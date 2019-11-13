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
    output reg[4:0] wd_o,

    input wire[31:0] hi_i,
    input wire[31:0] lo_i,
    input wire[31:0] mem_hi,
    input wire[31:0] mem_lo,
    input wire[31:0] wb_hi,
    input wire[31:0] wb_lo,
    input wire mem_hilo_we,
    input wire wb_hilo_we,
    output reg hilo_we,
    output reg[31:0] hi_o,
    output reg[31:0] lo_o
);

reg[31:0] logic_ans;
reg[31:0] shift_ans;
reg[31:0] move_ans;
reg[31:0] hi;
reg[31:0] lo;

always @(*)begin
    if(rst)
        {hi,lo} <= 64'b0;     
    else if(mem_hilo_we)
        {hi,lo} <= {mem_hi,mem_lo};
    else if(wb_hilo_we)
        {hi,lo} <= {wb_hi,wb_lo};
    else
        {hi,lo} <= {hi_i,lo_i};
end

always @(*)begin
    if(rst)begin
        move_ans <= 0;
        hilo_we <= 0;
        hi_o <= 0;
        lo_o <= 0;
    end else begin
        case(aluop)
            `EXE_MOVZ_OP:begin
                move_ans <= reg1;
                hilo_we <= 0;
                hi_o <= 0;
                lo_o <= 0;
            end
            `EXE_MOVN_OP:begin
                move_ans <= reg1;
                hilo_we <= 0;
                hi_o <= 0;
                lo_o <= 0;
            end
            `EXE_MFHI_OP:begin
                move_ans <= hi;
                hilo_we <= 0;
                hi_o <= 0;
                lo_o <= 0;
            end
            `EXE_MFLO_OP:begin
                move_ans <= lo;
                hilo_we <= 0;
                hi_o <= 0;
                lo_o <= 0;
            end
            `EXE_MTHI_OP:begin
                move_ans <= 0;
                hilo_we <= 1;
                hi_o <= reg1;
                lo_o <= lo;
            end
            `EXE_MTLO_OP:begin
                move_ans <=0;
                hilo_we <= 1;
                hi_o <= hi;
                lo_o <= reg1;
            end
            default:begin
                move_ans <= 0;
                hi_o <= 0;
                lo_o <= 0;
                hilo_we <= 0;
            end
        endcase
    end
end

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
        `EXE_RES_MOVE: begin
            wdata <= move_ans;
        end
        default:begin
            wdata <= 0;
        end
    endcase
end
endmodule