`timescale 1ns/1ps
`include "defines.v"

module inst_decode(
    input wire rst,
    input wire[19:0] pc,
    input wire[31:0] inst,
    input wire[31:0] regs_data1,
    output reg[4:0] regs_addr1,
    output reg regs_re1,
    input wire[31:0] regs_data2,
    output reg[4:0] regs_addr2,
    output reg regs_re2,
    output reg[7:0]aluop,
    output reg[2:0]alusel,
    output reg[31:0] reg1,
    output reg[31:0] reg2,
    output reg[4:0] wd,
    output reg wreg,
    
    input wire ex_wreg,
    input wire[31:0] ex_wdata,
    input wire[4:0] ex_wd,

    input wire mem_wreg,
    input wire[31:0] mem_wdata,
    input wire[4:0] mem_wd,
    
    output reg stop
);

reg[31:0] imme;
wire[5:0] op = inst[31:26];
wire[5:0] func = inst[5:0];

always @(*) begin
    if(rst) begin
        aluop <= 0;
        alusel <= 0;
        regs_addr1 <= 0;
        regs_addr2 <= 0;
        regs_re1 <= 0;
        regs_re2 <= 0;
        reg1 <= 0;
        reg2 <= 0;
        wd <= 0;
        wreg <= 0;
        imme <= 0;
    end else begin
        case (op)
            `EXE_ORI:begin
                wreg <= 1;
                aluop <= `EXE_OR_OP;
                alusel <= `EXE_RES_LOGIC;
                regs_re1 <= 1;
                regs_re2 <= 0;
                imme <= {16'h0,inst[15:0]};
                regs_addr1 <= inst[25:21];
                regs_addr2 <= inst[20:16];
                wd <= inst[20:16]; 
            end
            `EXE_ANDI:begin
                wreg <= 1;
                aluop <= `EXE_AND_OP;
                alusel <= `EXE_RES_LOGIC;
                regs_re1 <= 1;
                regs_re2 <= 0;
                imme <= {16'h0,inst[15:0]};
                regs_addr1 <= inst[25:21];
                regs_addr2 <= inst[20:16];
                wd <= inst[20:16];
            end
            `EXE_XORI:begin
                wreg <= 1;
                aluop <= `EXE_XOR_OP;
                alusel <= `EXE_RES_LOGIC;
                regs_re1 <= 1;
                regs_re2 <= 0;
                imme <= {16'h0,inst[15:0]};
                regs_addr1 <= inst[25:21];
                regs_addr2 <= inst[20:16];
                wd <= inst[20:16];
            end
            `EXE_LUI:begin
                wreg <= 1;
                aluop <= `EXE_OR_OP;
                alusel <= `EXE_RES_LOGIC;
                regs_re1 <= 0;
                regs_re2 <= 0;
                imme <= {inst[15:0],16'b0};
                wd <= inst[20:16];
            end
            `EXE_PREF:begin
               wreg <= 0;
               aluop <= `EXE_NOP_OP;
               alusel <= `EXE_RES_NOP;
               regs_re1 <= 0;
               regs_re2 <= 0;
               imme <= 0;
               wd <= 0; 
            end
            `EXE_SPECIAL:begin
                case(func)
                    `EXE_AND:begin
                        wreg <= 1;
                        aluop <= `EXE_AND_OP;
                        alusel <= `EXE_RES_LOGIC;
                        regs_re1 <= 1;
                        regs_re2 <= 1;
                        imme <= 0;
                        regs_addr1 <= inst[25:21];
                        regs_addr2 <= inst[20:16];
                        wd <= inst[15:11];
                    end
                    `EXE_OR:begin
                        wreg <= 1;
                        aluop <= `EXE_OR_OP;
                        alusel <= `EXE_RES_LOGIC;
                        regs_re1 <= 1;
                        regs_re2 <= 1;
                        imme <= 0;
                        regs_addr1 <= inst[25:21];
                        regs_addr2 <= inst[20:16];
                        wd <= inst[15:11];
                    end
                    `EXE_XOR:begin
                        wreg <= 1;
                        aluop <= `EXE_XOR_OP;
                        alusel <= `EXE_RES_LOGIC;
                        regs_re1 <= 1;
                        regs_re2 <= 1;
                        imme <= 0;
                        regs_addr1 <= inst[25:21];
                        regs_addr2 <= inst[20:16];
                        wd <= inst[15:11];
                    end
                    `EXE_NOR:begin
                        wreg <= 1;
                        aluop <= `EXE_NOR_OP;
                        alusel <= `EXE_RES_LOGIC;
                        regs_re1 <= 1;
                        regs_re2 <= 1;
                        imme <= 0;
                        regs_addr1 <= inst[25:21];
                        regs_addr2 <= inst[20:16];
                        wd <= inst[15:11];
                    end
                    `EXE_SLLV:begin
                        wreg <= 1;
                        aluop <= `EXE_SLL_OP;
                        alusel <= `EXE_RES_SHIFT;
                        regs_re1 <= 1;
                        regs_re2 <= 1;
                        imme <= 0;
                        regs_addr1 <= inst[20:16];
                        regs_addr2 <= inst[25:21];
                        wd <= inst[15:11];
                    end
                    `EXE_SRLV:begin
                        wreg <= 1;
                        aluop <= `EXE_SRL_OP;
                        alusel <= `EXE_RES_SHIFT;
                        regs_re1 <= 1;
                        regs_re2 <= 1;
                        imme <= 0;
                        regs_addr1 <= inst[20:16];
                        regs_addr2 <= inst[25:21];
                        wd <= inst[15:11];
                    end
                    `EXE_SRAV:begin
                        wreg <= 1;
                        aluop <= `EXE_SRA_OP;
                        alusel <= `EXE_RES_SHIFT;
                        regs_re1 <= 1;
                        regs_re2 <= 1;
                        imme <= 0;
                        regs_addr1 <= inst[20:16];
                        regs_addr2 <= inst[25:21];
                        wd <= inst[15:11];
                    end
                    `EXE_SLL:begin
                        wreg <= 1;
                        aluop <= `EXE_SLL_OP;
                        alusel <= `EXE_RES_SHIFT;
                        regs_re1 <= 1;
                        regs_re2 <= 0;
                        regs_addr1 <= inst[20:16];
                        imme[4:0] <= inst[10:6];
                        wd <= inst[15:11];
                    end
                    `EXE_SRL:begin
                        wreg <= 1;
                        aluop <= `EXE_SRL_OP;
                        alusel <= `EXE_RES_SHIFT;
                        regs_re1 <= 1;
                        regs_re2 <= 0;
                        regs_addr1 <= inst[20:16];
                        imme[4:0] <= inst[10:6];
                        wd <= inst[15:11];
                    end
                    `EXE_SRA:begin
                        wreg <= 1;
                        aluop <= `EXE_SRA_OP;
                        alusel <= `EXE_RES_SHIFT;
                        regs_re1 <= 1;
                        regs_re2 <= 0;
                        regs_addr1 <= inst[20:16];
                        imme[4:0] <= inst[10:6];
                        wd <= inst[15:11];
                    end
                    `EXE_MOVN:begin
                        aluop <= `EXE_MOVN_OP;
                        alusel <= `EXE_RES_MOVE;
                        regs_re1 <= 1;
                        regs_re2 <= 1;
                        regs_addr1 <= inst[25:21];
                        regs_addr2 <= inst[20:16];
                        wd <= inst[15:11];
                        if(reg2!=0)
                            wreg <= 1;
                        else
                            wreg <= 0;
                    end
                    `EXE_MOVZ:begin
                        aluop <= `EXE_MOVN_OP;
                        alusel <= `EXE_RES_MOVE;
                        regs_re1 <= 1;
                        regs_re2 <= 1;
                        regs_addr1 <= inst[25:21];
                        regs_addr2 <= inst[20:16];
                        wd <= inst[15:11];
                        if(reg2!=0)
                            wreg <= 0;
                        else
                            wreg <= 1;
                    end
                    `EXE_MFHI:begin
                        aluop <= `EXE_MFHI_OP;
                        alusel <= `EXE_RES_MOVE;
                        wreg <= 1;
                        regs_re1 <= 0;
                        regs_re2 <= 0;
                        wd <= inst[15:11];
                    end
                    `EXE_MTHI:begin
                        aluop <= `EXE_MTHI_OP;
                        alusel <= `EXE_RES_MOVE;
                        wreg <= 0;
                        regs_re1 <= 1;
                        regs_addr1 <= inst[25:21];
                        regs_re2 <= 0;
                    end
                    `EXE_MFLO:begin
                        aluop <= `EXE_MFLO_OP;
                        alusel <= `EXE_RES_MOVE;
                        wreg <= 1;
                        regs_re1 <= 0;
                        regs_re2 <= 0;
                        wd <= inst[15:11];
                    end
                    `EXE_MTLO:begin
                        aluop <= `EXE_MTLO_OP;
                        alusel <= `EXE_RES_MOVE;
                        wreg <= 0;
                        regs_re1 <= 1;
                        regs_addr1 <= inst[25:21];
                        regs_re2 <= 0;
                    end
                    `EXE_SLT:begin
                        aluop <= `EXE_SLT_OP;
                        alusel <= `EXE_RES_ARITHMETIC;
                        regs_re1 <= 1;
                        regs_re2 <= 1;
                        regs_addr1 <= inst[25:21];
                        regs_addr2 <= inst[20:16];
                        wreg <= 1;
                        wd <= inst[15:11];
                    end
                    `EXE_SLTU:begin
                        aluop <= `EXE_SLTU_OP;
                        alusel <= `EXE_RES_ARITHMETIC;
                        regs_re1 <= 1;
                        regs_re2 <= 1;
                        regs_addr1 <= inst[25:21];
                        regs_addr2 <= inst[20:16];
                        wreg <= 1;
                        wd <= inst[15:11];
                    end
                    `EXE_ADD:begin
                        aluop <= `EXE_ADD_OP;
                        alusel <= `EXE_RES_ARITHMETIC;
                        regs_re1 <= 1;
                        regs_re2 <= 1;
                        regs_addr1 <= inst[25:21];
                        regs_addr2 <= inst[20:16];
                        wreg <= 1;
                        wd <= inst[15:11];
                    end
                    `EXE_ADDU:begin
                        aluop <= `EXE_ADDU_OP;
                        alusel <= `EXE_RES_ARITHMETIC;
                        regs_re1 <= 1;
                        regs_re2 <= 1;
                        regs_addr1 <= inst[25:21];
                        regs_addr2 <= inst[20:16];
                        wreg <= 1;
                        wd <= inst[15:11];
                    end
                    `EXE_SUB:begin
                        aluop <= `EXE_SUB_OP;
                        alusel <= `EXE_RES_ARITHMETIC;
                        regs_re1 <= 1;
                        regs_re2 <= 1;
                        regs_addr1 <= inst[25:21];
                        regs_addr2 <= inst[20:16];
                        wreg <= 1;
                        wd <= inst[15:11];
                    end
                    `EXE_SUBU:begin
                        aluop <= `EXE_SUBU_OP;
                        alusel <= `EXE_RES_ARITHMETIC;
                        regs_re1 <= 1;
                        regs_re2 <= 1;
                        regs_addr1 <= inst[25:21];
                        regs_addr2 <= inst[20:16];
                        wreg <= 1;
                        wd <= inst[15:11];
                    end
                    `EXE_MULT:begin
                        aluop <= `EXE_MULT_OP;
                        alusel <= `EXE_RES_ARITHMETIC;
                        regs_re1 <= 1;
                        regs_re2 <= 1;
                        regs_addr1 <= inst[25:21];
                        regs_addr2 <= inst[20:16];
                        wreg <= 0;
                    end
                    `EXE_MULTU:begin
                        aluop <= `EXE_MULTU_OP;
                        alusel <= `EXE_RES_ARITHMETIC;
                        regs_re1 <= 1;
                        regs_re2 <= 1;
                        regs_addr1 <= inst[25:21];
                        regs_addr2 <= inst[20:16];
                        wreg <= 0;
                    end
                    `EXE_DIV:begin
                        wreg <= 0;
                        aluop <= `EXE_DIV_OP;
                        alusel <= `EXE_NOP_OP;
                        regs_re1 <= 1;
                        regs_re2 <= 1;
                        regs_addr1 <= inst[25:21];
                        regs_addr2 <= inst[20:16];
                    end
                    `EXE_DIVU:begin
                        wreg <= 0;
                        aluop <= `EXE_DIVU_OP;
                        alusel <= `EXE_NOP_OP;
                        regs_re1 <= 1;
                        regs_re2 <= 1;
                        regs_addr1 <= inst[25:21];
                        regs_addr2 <= inst[20:16];
                    end
                endcase
            end
            `EXE_SLTI:begin
                aluop <= `EXE_SLT_OP;
                alusel <= `EXE_RES_ARITHMETIC;
                regs_re1 <= 1;
                regs_re2 <= 0;
                regs_addr1 <= inst[25:21];
                wreg <= 1;
                wd <= inst[20:16];
                imme <= {{16{inst[15]}},inst[15:0]};
            end
            `EXE_SLTIU:begin
                aluop <= `EXE_SLTU_OP;
                alusel <= `EXE_RES_ARITHMETIC;
                regs_re1 <= 1;
                regs_re2 <= 0;
                regs_addr1 <= inst[25:21];
                wreg <= 1;
                wd <= inst[20:16];
                imme <= {{16{inst[15]}},inst[15:0]};
            end
            `EXE_ADDI:begin
                aluop <= `EXE_ADD_OP;
                alusel <= `EXE_RES_ARITHMETIC;
                regs_re1 <= 1;
                regs_re2 <= 0;
                regs_addr1 <= inst[25:21];
                wreg <= 1;
                wd <= inst[20:16];
                imme <= {{16{inst[15]}},inst[15:0]};
            end
            `EXE_ADDIU:begin
                aluop <= `EXE_ADDU_OP;
                alusel <= `EXE_RES_ARITHMETIC;
                regs_re1 <= 1;
                regs_re2 <= 0;
                regs_addr1 <= inst[25:21];
                wreg <= 1;
                wd <= inst[20:16];
                imme <= {{16{inst[15]}},inst[15:0]};
            end
            `EXE_SPECIAL2:begin
                case(func)
                    `EXE_CLZ:begin
                        wreg <= 1;
                        wd <= inst[15:11];
                        aluop <= `EXE_CLZ_OP;
                        alusel <= `EXE_RES_ARITHMETIC;
                        regs_re1 <= 1;
                        regs_re2 <= 0;
                        regs_addr1 <=  inst[25:21];
                    end
                    `EXE_CLO:begin
                        wreg <= 1;
                        wd <= inst[15:11];
                        aluop <= `EXE_CLO_OP;
                        alusel <= `EXE_RES_ARITHMETIC;
                        regs_re1 <= 1;
                        regs_re2 <= 0;
                        regs_addr1 <=  inst[25:21];
                    end
                    `EXE_MUL:begin
                        wreg <= 1;
                        wd <= inst[15:11];
                        aluop <= `EXE_MUL_OP;
                        alusel <= `EXE_RES_MUL;
                        regs_re1 <= 1;
                        regs_re2 <= 1;
                        regs_addr1 <= inst[25:21];
                        regs_addr2 <= inst[20:16];
                    end
                    `EXE_MADD:begin
                        wreg <= 0;
                        aluop <= `EXE_MADD_OP;
                        alusel <= `EXE_RES_MUL;
                        regs_re1 <= 1;
                        regs_re2 <= 1;
                        regs_addr1 <= inst[25:21];
                        regs_addr2 <= inst[20:16];
                    end
                    `EXE_MADDU:begin
                        wreg <= 0;
                        aluop <= `EXE_MADDU_OP;
                        alusel <= `EXE_RES_MUL;
                        regs_re1 <= 1;
                        regs_re2 <= 1;
                        regs_addr1 <= inst[25:21];
                        regs_addr2 <= inst[20:16];
                    end
                    `EXE_MSUB:begin
                        wreg <= 0;
                        aluop <= `EXE_MSUB_OP;
                        alusel <= `EXE_RES_MUL;
                        regs_re1 <= 1;
                        regs_re2 <= 1;
                        regs_addr1 <= inst[25:21];
                        regs_addr2 <= inst[20:16];
                    end
                    `EXE_MSUBU:begin
                        wreg <= 0;
                        aluop <= `EXE_MSUBU_OP;
                        alusel <= `EXE_RES_MUL;
                        regs_re1 <= 1;
                        regs_re2 <= 1;
                        regs_addr1 <= inst[25:21];
                        regs_addr2 <= inst[20:16];
                    end
                endcase
            end
            default:begin
                aluop <= `EXE_NOP_OP;
                alusel <= `EXE_RES_NOP;
                regs_addr1 <= 0;
                regs_addr2 <= 0;
                regs_re1 <= 0;
                regs_re2 <= 0;
                wd <= 0;
                wreg <= 0;
            end
        endcase
    end
end

always @(*) begin
    if(rst) begin
        reg1 <= 0;
    end else if(ex_wreg && ex_wd == regs_addr1 && regs_re1)begin
        reg1 <= ex_wdata;    
    end else if(mem_wreg && mem_wd == regs_addr1 && regs_re1)begin
        reg1 <= mem_wdata;
    end else if(regs_re1)begin
        reg1 <= regs_data1;
    end else begin
        reg1 <= imme; 
    end
end 
always @(*) begin
    if(rst) begin
        reg2 <= 0;
    end else if(ex_wreg && ex_wd == regs_addr2 && regs_re2)begin
        reg2 <= ex_wdata;    
    end else if(mem_wreg && mem_wd == regs_addr2 && regs_re2)begin
        reg2 <= mem_wdata;
    end else if(regs_re2)begin
        reg2 <= regs_data2;
    end else begin
        reg2 <= imme; 
    end
end 
endmodule