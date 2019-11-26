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
    
    output wire stop,

    input wire in_delayslot_i,
    output reg in_delayslot_o,
    output reg[31:0] branch_addr,
    output reg branch_we,
    output reg[31:0] link_addr,
    output reg next_in_delayslot,
    
    output wire[31:0] inst_o,
    input wire[7:0] ex_aluop
);

(*mark_debug="true"*)reg[31:0] imme;
(*mark_debug="true"*)wire[5:0] op = inst[31:26];
(*mark_debug="true"*)wire[5:0] func = inst[5:0];
(*mark_debug="true"*)wire[4:0] func2 = inst[20:16];
(*mark_debug="true"*)wire[31:0] pc_next;
(*mark_debug="true"*)assign pc_next = pc + 4;
(*mark_debug="true"*)wire[31:0] pc_next2;
assign pc_next2 = pc + 8;
always @(*)begin
    if(rst)
        in_delayslot_o <= 0;
    else
        in_delayslot_o <= in_delayslot_i; 
end

assign inst_o = inst;

reg stop_load_reg1;
reg stop_load_reg2;

wire pre_inst_is_load;

assign stop = stop_load_reg1 | stop_load_reg2;

assign pre_inst_is_load = (ex_aluop == `EXE_LB_OP) || (ex_aluop == `EXE_LBU_OP) || (ex_aluop == `EXE_LH_OP) || (ex_aluop == `EXE_LHU_OP) || (ex_aluop == `EXE_LW_OP) || (ex_aluop == `EXE_LL_OP) || (ex_aluop == `EXE_LWL_OP) || (ex_aluop == `EXE_LWR_OP) || (ex_aluop == `EXE_SC_OP);

always @(*) begin
    if(rst) begin
        aluop <= 0;
        alusel <= 0;
        regs_addr1 <= 0;
        regs_addr2 <= 0;
        regs_re1 <= 0;
        regs_re2 <= 0;
        //reg1 <= 0;
        //reg2 <= 0;
        wd <= 0;
        wreg <= 0;
        imme <= 0;
        branch_addr <= 0;
        branch_we <= 0;
        next_in_delayslot <= 0;
        link_addr <= 0;
    end else begin
        case (op)
            `EXE_LB:begin
                wreg <= 1;
                aluop <= `EXE_LB_OP;
                alusel <= `EXE_RES_LOAD_STORE;
                regs_re1 <= 1;
                regs_addr1 <= inst[25:21];
                regs_re2 <= 0;
                wd <= inst[20:16];
                branch_addr <= 0;
                branch_we <= 0;
                next_in_delayslot <= 0;
                link_addr <= 0;
            end
            `EXE_LBU:begin
                wreg <= 1;
                aluop <= `EXE_LBU_OP;
                alusel <= `EXE_RES_LOAD_STORE;
                regs_re1 <= 1;
                regs_addr1 <= inst[25:21];
                regs_re2 <= 0;
                wd <= inst[20:16];
                branch_addr <= 0;
                branch_we <= 0;
                next_in_delayslot <= 0;
                link_addr <= 0;
            end
            `EXE_LH:begin
                wreg <= 1;
                aluop <= `EXE_LH_OP;
                alusel <= `EXE_RES_LOAD_STORE;
                regs_re1 <= 1;
                regs_addr1 <= inst[25:21];
                regs_re2 <= 0;
                wd <= inst[20:16];
                branch_addr <= 0;
                branch_we <= 0;
                next_in_delayslot <= 0;
                link_addr <= 0;
            end
            `EXE_LHU:begin
                wreg <= 1;
                aluop <= `EXE_LHU_OP;
                alusel <= `EXE_RES_LOAD_STORE;
                regs_re1 <= 1;
                regs_addr1 <= inst[25:21];
                regs_re2 <= 0;
                wd <= inst[20:16];
                branch_addr <= 0;
                branch_we <= 0;
                next_in_delayslot <= 0;
                link_addr <= 0;
            end
            `EXE_LW:begin
                wreg <= 1;
                aluop <= `EXE_LW_OP;
                alusel <= `EXE_RES_LOAD_STORE;
                regs_re1 <= 1;
                regs_addr1 <= inst[25:21];
                regs_re2 <= 0;
                wd <= inst[20:16];
                branch_addr <= 0;
                branch_we <= 0;
                next_in_delayslot <= 0;
                link_addr <= 0;
            end
            `EXE_LWL:begin
                wreg <= 1;
                aluop <= `EXE_LWL_OP;
                alusel <= `EXE_RES_LOAD_STORE;
                regs_re1 <= 1;
                regs_addr1 <= inst[25:21];
                regs_addr2 <= inst[20:16];
                regs_re2 <= 1;
                wd <= inst[20:16];
                branch_addr <= 0;
                branch_we <= 0;
                next_in_delayslot <= 0;
                link_addr <= 0;
            end
            `EXE_LWR:begin
                wreg <= 1;
                aluop <= `EXE_LWR_OP;
                alusel <= `EXE_RES_LOAD_STORE;
                regs_re1 <= 1;
                regs_addr1 <= inst[25:21];
                regs_addr2 <= inst[20:16];
                regs_re2 <= 1;
                wd <= inst[20:16];
                branch_addr <= 0;
                branch_we <= 0;
                next_in_delayslot <= 0;
                link_addr <= 0;
            end
            `EXE_SB:begin
                wreg <= 0;
                aluop <= `EXE_SB_OP;
                alusel <= `EXE_RES_LOAD_STORE;
                regs_re1 <= 1;
                regs_addr1 <= inst[25:21];
                regs_re2 <= 1;
                regs_addr2 <= inst[20:16];
                branch_addr <= 0;
                branch_we <= 0;
                next_in_delayslot <= 0;
                link_addr <= 0;
            end
            `EXE_SH:begin
                wreg <= 0;
                aluop <= `EXE_SH_OP;
                alusel <= `EXE_RES_LOAD_STORE;
                regs_re1 <= 1;
                regs_addr1 <= inst[25:21];
                regs_re2 <= 1;
                regs_addr2 <= inst[20:16];
                branch_addr <= 0;
                branch_we <= 0;
                next_in_delayslot <= 0;
                link_addr <= 0;
            end
            `EXE_SW:begin
                wreg <= 0;
                aluop <= `EXE_SW_OP;
                alusel <= `EXE_RES_LOAD_STORE;
                regs_re1 <= 1;
                regs_addr1 <= inst[25:21];
                regs_re2 <= 1;
                regs_addr2 <= inst[20:16];
                branch_addr <= 0;
                branch_we <= 0;
                next_in_delayslot <= 0;
                link_addr <= 0;
            end
            `EXE_SWL:begin
                wreg <= 0;
                aluop <= `EXE_SWL_OP;
                alusel <= `EXE_RES_LOAD_STORE;
                regs_re1 <= 1;
                regs_addr1 <= inst[25:21];
                regs_re2 <= 1;
                regs_addr2 <= inst[20:16];
                branch_addr <= 0;
                branch_we <= 0;
                next_in_delayslot <= 0;
                link_addr <= 0;
            end
            `EXE_SWR:begin
                wreg <= 0;
                aluop <= `EXE_SWR_OP;
                alusel <= `EXE_RES_LOAD_STORE;
                regs_re1 <= 1;
                regs_addr1 <= inst[25:21];
                regs_re2 <= 1;
                regs_addr2 <= inst[20:16];
                branch_addr <= 0;
                branch_we <= 0;
                next_in_delayslot <= 0;
                link_addr <= 0;
            end
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
                branch_addr <= 0;
                branch_we <= 0;
                next_in_delayslot <= 0;
                link_addr <= 0;
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
                branch_addr <= 0;
                branch_we <= 0;
                next_in_delayslot <= 0;
                link_addr <= 0;
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
                branch_addr <= 0;
                branch_we <= 0;
                next_in_delayslot <= 0;
                link_addr <= 0;
            end
            `EXE_LUI:begin
                wreg <= 1;
                aluop <= `EXE_OR_OP;
                alusel <= `EXE_RES_LOGIC;
                regs_re1 <= 0;
                regs_re2 <= 0;
                imme <= {inst[15:0],16'b0};
                wd <= inst[20:16];
                branch_addr <= 0;
                branch_we <= 0;
                next_in_delayslot <= 0;
                link_addr <= 0;
            end
            `EXE_PREF:begin
                wreg <= 0;
                aluop <= `EXE_NOP_OP;
                alusel <= `EXE_RES_NOP;
                regs_re1 <= 0;
                regs_re2 <= 0;
                imme <= 0;
                wd <= 0; 
                branch_addr <= 0;
                branch_we <= 0;
                next_in_delayslot <= 0;
                link_addr <= 0;
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
                        branch_addr <= 0;
                        branch_we <= 0;
                        next_in_delayslot <= 0;
                        link_addr <= 0;
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
                        branch_addr <= 0;
                        branch_we <= 0;
                        next_in_delayslot <= 0;
                        link_addr <= 0;
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
                        branch_addr <= 0;
                        branch_we <= 0;
                        next_in_delayslot <= 0;
                        link_addr <= 0;
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
                        branch_addr <= 0;
                        branch_we <= 0;
                        next_in_delayslot <= 0;
                        link_addr <= 0;
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
                        branch_addr <= 0;
                        branch_we <= 0;
                        next_in_delayslot <= 0;
                        link_addr <= 0;
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
                        branch_addr <= 0;
                        branch_we <= 0;
                        next_in_delayslot <= 0;
                        link_addr <= 0;
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
                        branch_addr <= 0;
                        branch_we <= 0;
                        next_in_delayslot <= 0;
                        link_addr <= 0;
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
                        branch_addr <= 0;
                        branch_we <= 0;
                        next_in_delayslot <= 0;
                        link_addr <= 0;
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
                        branch_addr <= 0;
                        branch_we <= 0;
                        next_in_delayslot <= 0;
                        link_addr <= 0;
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
                        branch_addr <= 0;
                        branch_we <= 0;
                        next_in_delayslot <= 0;
                        link_addr <= 0;
                    end
                    `EXE_MOVN:begin
                        aluop <= `EXE_MOVN_OP;
                        alusel <= `EXE_RES_MOVE;
                        regs_re1 <= 1;
                        regs_re2 <= 1;
                        regs_addr1 <= inst[25:21];
                        regs_addr2 <= inst[20:16];
                        wd <= inst[15:11];
                        branch_addr <= 0;
                        branch_we <= 0;
                        next_in_delayslot <= 0;
                        link_addr <= 0;
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
                        branch_addr <= 0;
                        branch_we <= 0;
                        next_in_delayslot <= 0;
                        link_addr <= 0;
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
                        branch_addr <= 0;
                        branch_we <= 0;
                        next_in_delayslot <= 0;
                        link_addr <= 0;
                    end
                    `EXE_MTHI:begin
                        aluop <= `EXE_MTHI_OP;
                        alusel <= `EXE_RES_MOVE;
                        wreg <= 0;
                        regs_re1 <= 1;
                        regs_addr1 <= inst[25:21];
                        regs_re2 <= 0;
                        branch_addr <= 0;
                        branch_we <= 0;
                        next_in_delayslot <= 0;
                        link_addr <= 0;
                    end
                    `EXE_MFLO:begin
                        aluop <= `EXE_MFLO_OP;
                        alusel <= `EXE_RES_MOVE;
                        wreg <= 1;
                        regs_re1 <= 0;
                        regs_re2 <= 0;
                        wd <= inst[15:11];
                        branch_addr <= 0;
                        branch_we <= 0;
                        next_in_delayslot <= 0;
                        link_addr <= 0;
                    end
                    `EXE_MTLO:begin
                        aluop <= `EXE_MTLO_OP;
                        alusel <= `EXE_RES_MOVE;
                        wreg <= 0;
                        regs_re1 <= 1;
                        regs_addr1 <= inst[25:21];
                        regs_re2 <= 0;
                        branch_addr <= 0;
                        branch_we <= 0;
                        next_in_delayslot <= 0;
                        link_addr <= 0;
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
                        branch_addr <= 0;
                        branch_we <= 0;
                        next_in_delayslot <= 0;
                        link_addr <= 0;
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
                        branch_addr <= 0;
                        branch_we <= 0;
                        next_in_delayslot <= 0;
                        link_addr <= 0;
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
                        branch_addr <= 0;
                        branch_we <= 0;
                        next_in_delayslot <= 0;
                        link_addr <= 0;
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
                        branch_addr <= 0;
                        branch_we <= 0;
                        next_in_delayslot <= 0;
                        link_addr <= 0;
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
                        branch_addr <= 0;
                        branch_we <= 0;
                        next_in_delayslot <= 0;
                        link_addr <= 0;
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
                        branch_addr <= 0;
                        branch_we <= 0;
                        next_in_delayslot <= 0;
                        link_addr <= 0;
                    end
                    `EXE_MULT:begin
                        aluop <= `EXE_MULT_OP;
                        alusel <= `EXE_RES_ARITHMETIC;
                        regs_re1 <= 1;
                        regs_re2 <= 1;
                        regs_addr1 <= inst[25:21];
                        regs_addr2 <= inst[20:16];
                        wreg <= 0;
                        branch_addr <= 0;
                        branch_we <= 0;
                        next_in_delayslot <= 0;
                        link_addr <= 0;
                    end
                    `EXE_MULTU:begin
                        aluop <= `EXE_MULTU_OP;
                        alusel <= `EXE_RES_ARITHMETIC;
                        regs_re1 <= 1;
                        regs_re2 <= 1;
                        regs_addr1 <= inst[25:21];
                        regs_addr2 <= inst[20:16];
                        wreg <= 0;
                        branch_addr <= 0;
                        branch_we <= 0;
                        next_in_delayslot <= 0;
                        link_addr <= 0;
                    end
                    `EXE_DIV:begin
                        wreg <= 0;
                        aluop <= `EXE_DIV_OP;
                        alusel <= `EXE_NOP_OP;
                        regs_re1 <= 1;
                        regs_re2 <= 1;
                        regs_addr1 <= inst[25:21];
                        regs_addr2 <= inst[20:16];
                        branch_addr <= 0;
                        branch_we <= 0;
                        next_in_delayslot <= 0;
                        link_addr <= 0;
                    end
                    `EXE_DIVU:begin
                        wreg <= 0;
                        aluop <= `EXE_DIVU_OP;
                        alusel <= `EXE_NOP_OP;
                        regs_re1 <= 1;
                        regs_re2 <= 1;
                        regs_addr1 <= inst[25:21];
                        regs_addr2 <= inst[20:16];
                        branch_addr <= 0;
                        branch_we <= 0;
                        next_in_delayslot <= 0;
                        link_addr <= 0;
                    end
                    `EXE_JR:begin
                        wreg <= 0;
                        aluop <= `EXE_JR_OP;
                        alusel <= `EXE_RES_JB;
                        regs_re1 <= 1;
                        regs_addr1 <= inst[25:21];
                        regs_re2 <= 0;
                        link_addr <= 0;
                        branch_addr <= reg1;
                        branch_we <= 1;
                        next_in_delayslot <= 1;
                    end
                    `EXE_JALR:begin
                        wreg <=1;
                        aluop <= `EXE_JALR_OP;
                        alusel <= `EXE_RES_JB;
                        regs_re1 <= 1;
                        regs_addr1 <= inst[25:21];
                        regs_re2 <= 0;
                        wd <= inst[15:11];
                        link_addr <= pc_next2;
                        branch_addr <= reg1;
                        branch_we <= 1;
                        next_in_delayslot <= 1; 
                    end
                endcase
            end
            `EXE_J:begin
                aluop <= `EXE_J_OP;
                alusel <= `EXE_RES_JB;
                regs_re1 <= 0;
                regs_re2 <= 0;
                wreg <= 0;
                link_addr <= 0;
                branch_we <= 1;
                next_in_delayslot <= 1;
                branch_addr <= {pc_next[31:28],inst[25:0],2'b00};
            end
            `EXE_JAL:begin
                aluop <= `EXE_JAL_OP;
                alusel <= `EXE_RES_JB;
                regs_re1 <= 0;
                regs_re2 <= 0;
                wd <= 5'b11111;
                wreg <= 1;
                link_addr <= pc+8;
                branch_we <= 1;
                next_in_delayslot <= 1;
                branch_addr <= {pc_next[31:28],inst[25:0],2'b00};
            end
            `EXE_BEQ:begin
                wreg <= 0;
                aluop <= `EXE_BEQ_OP;
                alusel <= `EXE_RES_JB;
                regs_re1 <= 1;
                regs_re2 <= 1;
                regs_addr1 <= inst[25:21];
                regs_addr2 <= inst[20:16];
                link_addr <= 0;
                if(reg1==reg2)begin
                    branch_addr <= pc_next + {{14{inst[15]}},inst[15:0],2'b00};
                    branch_we <= 1;
                    next_in_delayslot <= 1;
                end else begin
                    branch_addr <= 0;
                    branch_we <= 0;
                    next_in_delayslot <= 0;
                end
            end
            `EXE_BGTZ:begin
                wreg <= 0;
                aluop <= `EXE_BGTZ_OP;
                alusel <= `EXE_RES_JB;
                regs_re1 <= 1;
                regs_re2 <= 0;
                regs_addr1 <= inst[25:21];
                link_addr <=0;
                if(!reg1[31]&&reg1)begin
                    branch_addr <= pc_next + {{14{inst[15]}},inst[15:0],2'b00};
                    branch_we <= 1;
                    next_in_delayslot <= 1;
                end else begin
                    branch_addr <= 0;
                    branch_we <= 0;
                    next_in_delayslot <= 0;
                end
            end
            `EXE_BLEZ:begin
                wreg <= 0;
                aluop <= `EXE_BLEZ_OP;
                alusel <= `EXE_RES_JB;
                regs_re1 <= 1;
                regs_re2 <= 0;
                regs_addr1 <= inst[25:21];
                link_addr <= 0;
                if(reg1[31]||reg1==0)begin
                    branch_addr <= pc_next + {{14{inst[15]}},inst[15:0],2'b00};
                    branch_we <= 1;
                    next_in_delayslot <= 1;
                end else begin
                    branch_addr <= 0;
                    branch_we <= 0;
                    next_in_delayslot <= 0;
                end
            end
            `EXE_BNE:begin
                wreg <= 0;
                aluop <= `EXE_BNE_OP;
                alusel <= `EXE_RES_JB;
                regs_re1 <= 1;
                regs_re2 <= 1;
                regs_addr1 <= inst[25:21];
                regs_addr2 <= inst[20:16];
                link_addr <= 0;
                if(reg1!=reg2)begin
                    branch_addr <= pc_next + {{14{inst[15]}},inst[15:0],2'b00};
                    branch_we <= 1;
                    next_in_delayslot <= 1;
                end else begin
                    branch_addr <= 0;
                    branch_we <= 0;
                    next_in_delayslot <= 0;
                end
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
                branch_addr <= 0;
                branch_we <= 0;
                next_in_delayslot <= 0;
                link_addr <= 0;
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
                branch_addr <= 0;
                branch_we <= 0;
                next_in_delayslot <= 0;
                link_addr <= 0;
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
                branch_addr <= 0;
                branch_we <= 0;
                next_in_delayslot <= 0;
                link_addr <= 0;
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
                branch_addr <= 0;
                branch_we <= 0;
                next_in_delayslot <= 0;
                link_addr <= 0;
            end
            `EXE_REGIMM:begin
                case(func2)
                    `EXE_BGEZ:begin
                        wreg <= 0;
                        aluop <= `EXE_BGEZ_OP;
                        alusel <= `EXE_RES_JB;
                        regs_re1 <= 1;
                        regs_re2 <= 0;
                        regs_addr1 <= inst[25:21];
                        link_addr <= 0;
                        if(!reg1[31])begin
                            branch_we <= 1;
                            next_in_delayslot <= 1;
                            branch_addr <= pc_next + {{14{inst[15]}},inst[15:0],2'b00};
                        end else begin
                            branch_addr <= 0;
                            branch_we <= 0;
                            next_in_delayslot <= 0;
                        end
                    end
                    `EXE_BGEZAL:begin
                        wreg <= 1;
                        wd <= 5'b11111;
                        link_addr <= pc_next2;
                        aluop <= `EXE_BGEZAL_OP;
                        alusel <= `EXE_RES_JB;
                        regs_re1 <= 1;
                        regs_re2 <= 0;
                        regs_addr1 <= inst[25:21];
                        if(!reg1[31])begin
                            branch_we <= 1;
                            next_in_delayslot <= 1;
                            branch_addr <= pc_next + {{14{inst[15]}},inst[15:0],2'b00};
                        end else begin
                            branch_addr <= 0;
                            branch_we <= 0;
                            next_in_delayslot <= 0;
                        end
                    end
                    `EXE_BLTZ:begin
                        wreg <= 0;
                        aluop <= `EXE_BLTZ_OP;
                        alusel <= `EXE_RES_JB;
                        regs_re1 <= 1;
                        regs_re2 <= 0;
                        regs_addr1 <= inst[25:21];
                        link_addr <= 0;
                        if(reg1[31])begin
                            branch_we <= 1;
                            next_in_delayslot <= 1;
                            branch_addr <= pc_next + {{14{inst[15]}},inst[15:0],2'b00};
                        end else begin
                            branch_addr <= 0;
                            branch_we <= 0;
                            next_in_delayslot <= 0;
                        end
                    end
                    `EXE_BLTZAL:begin
                        wreg <= 1;
                        wd <= 5'b11111;
                        link_addr <= pc_next2;
                        aluop <= `EXE_BGEZAL_OP;
                        alusel <= `EXE_RES_JB;
                        regs_re1 <= 1;
                        regs_re2 <= 0;
                        regs_addr1 <= inst[25:21];
                        if(reg1[31])begin
                            branch_we <= 1;
                            next_in_delayslot <= 1;
                            branch_addr <= pc_next + {{14{inst[15]}},inst[15:0],2'b00};
                        end else begin
                            branch_addr <= 0;
                            branch_we <= 0;
                            next_in_delayslot <= 0;
                        end
                    end
                endcase
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
                        branch_addr <= 0;
                        branch_we <= 0;
                        next_in_delayslot <= 0;
                        link_addr <= 0;
                    end
                    `EXE_CLO:begin
                        wreg <= 1;
                        wd <= inst[15:11];
                        aluop <= `EXE_CLO_OP;
                        alusel <= `EXE_RES_ARITHMETIC;
                        regs_re1 <= 1;
                        regs_re2 <= 0;
                        regs_addr1 <=  inst[25:21];
                        branch_addr <= 0;
                        branch_we <= 0;
                        next_in_delayslot <= 0;
                        link_addr <= 0;
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
                        branch_addr <= 0;
                        branch_we <= 0;
                        next_in_delayslot <= 0;
                        link_addr <= 0;
                    end
                    `EXE_MADD:begin
                        wreg <= 0;
                        aluop <= `EXE_MADD_OP;
                        alusel <= `EXE_RES_MUL;
                        regs_re1 <= 1;
                        regs_re2 <= 1;
                        regs_addr1 <= inst[25:21];
                        regs_addr2 <= inst[20:16];
                        branch_addr <= 0;
                        branch_we <= 0;
                        next_in_delayslot <= 0;
                        link_addr <= 0;
                    end
                    `EXE_MADDU:begin
                        wreg <= 0;
                        aluop <= `EXE_MADDU_OP;
                        alusel <= `EXE_RES_MUL;
                        regs_re1 <= 1;
                        regs_re2 <= 1;
                        regs_addr1 <= inst[25:21];
                        regs_addr2 <= inst[20:16];
                        branch_addr <= 0;
                        branch_we <= 0;
                        next_in_delayslot <= 0;
                        link_addr <= 0;
                    end
                    `EXE_MSUB:begin
                        wreg <= 0;
                        aluop <= `EXE_MSUB_OP;
                        alusel <= `EXE_RES_MUL;
                        regs_re1 <= 1;
                        regs_re2 <= 1;
                        regs_addr1 <= inst[25:21];
                        regs_addr2 <= inst[20:16];
                        branch_addr <= 0;
                        branch_we <= 0;
                        next_in_delayslot <= 0;
                        link_addr <= 0;
                    end
                    `EXE_MSUBU:begin
                        wreg <= 0;
                        aluop <= `EXE_MSUBU_OP;
                        alusel <= `EXE_RES_MUL;
                        regs_re1 <= 1;
                        regs_re2 <= 1;
                        regs_addr1 <= inst[25:21];
                        regs_addr2 <= inst[20:16];
                        branch_addr <= 0;
                        branch_we <= 0;
                        next_in_delayslot <= 0;
                        link_addr <= 0;
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
                branch_addr <= 0;
                branch_we <= 0;
                next_in_delayslot <= 0;
                link_addr <= 0;
            end
        endcase
    end
end

always @(*) begin
    if(rst) begin
        reg1 <= 0;
        stop_load_reg1 <= 0;
    end else if(pre_inst_is_load && ex_wd == regs_addr1 && regs_re1)begin
        stop_load_reg1 <= 1;
    end else if(ex_wreg && ex_wd == regs_addr1 && regs_re1)begin
        reg1 <= ex_wdata;
        stop_load_reg1 <= 0; 
    end else if(mem_wreg && mem_wd == regs_addr1 && regs_re1)begin
        reg1 <= mem_wdata;
        stop_load_reg1 <= 0;
    end else if(regs_re1)begin
        reg1 <= regs_data1;
        stop_load_reg1 <= 0;
    end else begin
        reg1 <= imme; 
        stop_load_reg1 <= 0;
    end
end 
always @(*) begin
    if(rst) begin
        reg2 <= 0;
        stop_load_reg2 <= 0;
    end else if(pre_inst_is_load && ex_wd == regs_addr2 && regs_re2)begin
        stop_load_reg2 <= 1;
    end else if(ex_wreg && ex_wd == regs_addr2 && regs_re2)begin
        reg2 <= ex_wdata;   
        stop_load_reg2 <= 0; 
    end else if(mem_wreg && mem_wd == regs_addr2 && regs_re2)begin
        reg2 <= mem_wdata;
        stop_load_reg2 <= 0;
    end else if(regs_re2)begin
        reg2 <= regs_data2;
        stop_load_reg2 <= 0;
    end else begin
        reg2 <= imme; 
        stop_load_reg2 <= 0;
    end
end 
endmodule