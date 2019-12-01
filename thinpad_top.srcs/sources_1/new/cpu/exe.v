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
    output reg[31:0] lo_o,

    input wire[63:0] hilo_tmp_i,
    input wire[1:0] hilo_cnt_i,

    output reg[63:0] hilo_tmp_o,
    output reg[1:0] hilo_cnt_o,

    output reg stop,

    output reg signed_div,
    output reg[31:0] div_reg1,
    output reg[31:0] div_reg2,
    output reg div_start,
    input wire[63:0] div_ans,
    input wire div_finish,

    input wire[31:0] link_addr,
    input wire in_delayslot_i,
    input wire[31:0] inst,
    output wire[7:0] aluop_o,
    output wire[31:0] load_store_addr,
    output wire[31:0] load_store_data,

    input wire mem_cp0_reg_we,
    input wire[4:0] mem_cp0_reg_write_addr,
    input wire[31:0] mem_cp0_reg_data,
    
    input wire wb_cp0_reg_we,
    input wire[4:0] wb_cp0_reg_write_addr,
    input wire[31:0] wb_cp0_reg_data,

    input wire[31:0] cp0_reg_data_i,
    output reg[4:0] cp0_reg_read_addr_o,

    output reg cp0_reg_we_o,
    output reg[4:0] cp0_reg_write_addr_o,
    output reg[31:0] cp0_reg_data_o,
    
    input wire[31:0] excepttype_i,
    input wire[31:0] current_inst_address_i,

    output wire[31:0] excepttype_o,
    output wire in_delayslot_o,
    output wire[31:0] current_inst_address_o,

    output wire isLoadInst

);

assign isLoadInst = (aluop == `EXE_LB_OP)||(aluop == `EXE_LBU_OP)||(aluop == `EXE_LH_OP)||(aluop == `EXE_LHU_OP)||(aluop == `EXE_LL_OP)||(aluop == `EXE_LW_OP)||(aluop == `EXE_LWL_OP)||(aluop == `EXE_LWR_OP);

reg[31:0] logic_ans;
reg[31:0] shift_ans;
reg[31:0] move_ans;
reg[31:0] arithmetic_ans;
reg[63:0] mul_ans;
reg[63:0] hilo_m_ans;
reg[31:0] hi;
reg[31:0] lo;

wire [31:0] reg1addreg2;
wire [31:0] reg2_mux;
wire [63:0] hilo_tmp;
wire [31:0] mul1,mul2;
wire overflow;

reg stop_div;
reg stop_madd_and_msub;

reg trapassert;
reg ovassert;
wire reg1_eq_reg2;
wire reg1_lt_reg2;
    

assign excepttype_o = {excepttype_i[31:12],ovassert,trapassert,excepttype_i[9:8],8'h00};
assign in_delayslot_o = in_delayslot_i;
assign current_inst_address_o = current_inst_address_i;

assign reg2_mux = ((aluop == `EXE_SUB_OP) || (aluop == `EXE_SUBU_OP) ||(aluop == `EXE_SLT_OP)|| (aluop == `EXE_TLT_OP) ||(aluop == `EXE_TLTI_OP) || (aluop == `EXE_TGE_OP) ||(aluop == `EXE_TGEI_OP)) ? (~reg2)+1 : reg2;
  

assign reg1addreg2 = reg1 + reg2_mux;

assign overflow = (!reg1[31]&&!reg2_mux[31] && reg1addreg2[31])||(reg1[31]&&reg2_mux[31] && !reg1addreg2[31]);


                                    
assign reg1_lt_reg2 = ((aluop == `EXE_SLT_OP) || (aluop == `EXE_TLT_OP) || (aluop == `EXE_TLTI_OP) || (aluop == `EXE_TGE_OP) || (aluop == `EXE_TGEI_OP)) ?((reg1[31] && !reg2[31]) || (!reg1[31] && !reg2[31] && reg1addreg2[31])||(reg1[31] && reg2[31] && reg1addreg2[31])) :(reg1 < reg2);
  

always @ (*) begin
    if(rst) begin
        trapassert <= 0;
    end else begin
        case (aluop)
            `EXE_TEQ_OP, `EXE_TEQI_OP: begin
                if( reg1 == reg2 )
                    trapassert <= 1;
                else
                    trapassert <= 0;
            end
            `EXE_TGE_OP, `EXE_TGEI_OP, `EXE_TGEIU_OP,`EXE_TGEU_OP: begin
                if( ~reg1_lt_reg2 )
                    trapassert <= 1;
                else 
                    trapassert <= 0;
            end
            `EXE_TLT_OP, `EXE_TLTI_OP, `EXE_TLTIU_OP, `EXE_TLTU_OP: begin
                if( reg1_lt_reg2 )
                    trapassert <= 1;
                else
                    trapassert <= 0;
            end
            `EXE_TNE_OP, `EXE_TNEI_OP: begin
                if( reg1 != reg2 )
                    trapassert <= 1;
                else
                    trapassert <= 0;
            end
            default:                begin
                trapassert <= 0;
            end
        endcase
    end
end



assign aluop_o = aluop;
assign load_store_data = reg2;
assign load_store_addr = reg1 + {{16{inst[15]}},inst[15:0]};

always @(*)begin
    stop <= stop_madd_and_msub || stop_div;
end


always @(*)begin
    if(rst)begin
        stop_div <= 0;
        div_reg1 <= 0;
        div_reg2 <= 0;
        div_start <= 0;
        signed_div <= 0;
    end else begin
        case(aluop)
            `EXE_DIV_OP:begin
                if(div_finish)begin
                    div_reg1 <= reg1;
                    div_reg2 <= reg2;
                    div_start <= 0;
                    signed_div <= 1;
                    stop_div <= 0;
                end else begin
                    div_reg1 <= reg1;
                    div_reg2 <= reg2;
                    div_start <= 1;
                    signed_div <= 1;
                    stop_div <= 1;
                end
            end
            `EXE_DIVU_OP:begin
                if(div_finish)begin
                    div_reg1 <= reg1;
                    div_reg2 <= reg2;
                    div_start <= 0;
                    signed_div <= 0;
                    stop_div <= 0;
                end else begin
                    div_reg1 <= reg1;
                    div_reg2 <= reg2;
                    div_start <= 1;
                    signed_div <= 0;
                    stop_div <= 1;
                end
            end
            default:begin
                stop_div <= 0;
                div_reg1 <= 0;
                div_reg2 <= 0;
                div_start <= 0;
                signed_div <= 0;
            end
        endcase 
    end
end



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
            `EXE_MULT_OP,`EXE_MULTU_OP:begin
                hilo_we <= 1;
                hi_o <= mul_ans[63:32];
                lo_o <= mul_ans[31:0];
            end
            `EXE_DIV_OP,`EXE_DIVU_OP:begin
                hilo_we <= 1;
                hi_o <= div_ans[63:32];
                lo_o <= div_ans[31:0];
            end
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
            `EXE_MADD_OP,`EXE_MADDU_OP,`EXE_MSUB_OP,`EXE_MSUBU_OP:begin
                hilo_we <= 1;
                hi_o <= hilo_m_ans[63:32];
                lo_o <= hilo_m_ans[31:0];
            end
            `EXE_MFC0_OP:begin
                cp0_reg_read_addr_o <= inst[15:11];
                move_ans <= cp0_reg_data_i;
                if(mem_cp0_reg_we&&mem_cp0_reg_write_addr == inst[15:11] ) begin
                    move_ans <= mem_cp0_reg_data;
                end else if(wb_cp0_reg_we&&wb_cp0_reg_write_addr == inst[15:11] ) begin
                    move_ans <= wb_cp0_reg_data;
                end
                hilo_we <= 0;
                hi_o <= 0;
                lo_o <= 0;
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

always @(*)begin
    if(rst)begin
        arithmetic_ans <= 0;
    end else begin
        case(aluop)
            `EXE_SLT_OP:begin
                arithmetic_ans <= (reg1[31] && !reg2[31]) || (!reg1[31]&&!reg2[31]&&reg1addreg2[31]) || (reg1[31] && reg2[31] && reg1addreg2[31]);
            end
            `EXE_SLTU_OP:begin
                arithmetic_ans <= reg1<reg2;
            end
            `EXE_ADD_OP,`EXE_ADDU_OP,`EXE_SUB_OP,`EXE_SUBU_OP: begin
                arithmetic_ans <= reg1addreg2;
            end
            `EXE_CLZ_OP:begin
                arithmetic_ans <= reg1[31]?0:reg1[30]?1:reg1[29]?2:reg1[28]?3:reg1[27]?4:reg1[26]?5:reg1[25]?6:reg1[24]?7:reg1[23]?8:reg1[22]?9:reg1[21]?10:reg1[20]?11:reg1[19]?12:reg1[18]?13:reg1[17]?14:reg1[16]?15:reg1[15]?16:reg1[14]?17:reg1[13]?18:reg1[12]?19:reg1[11]?20:reg1[10]?21:reg1[9]?22:reg1[8]?23:reg1[7]?24:reg1[6]?25:reg1[5]?26:reg1[4]?27:reg1[3]?28:reg1[2]?29:reg1[1]?30:reg1[0]?31:32;
            end
            `EXE_CLO_OP:begin
                arithmetic_ans <= !reg1[31]?0:!reg1[30]?1:!reg1[29]?2:!reg1[28]?3:!reg1[27]?4:!reg1[26]?5:!reg1[25]?6:!reg1[24]?7:!reg1[23]?8:!reg1[22]?9:!reg1[21]?10:!reg1[20]?11:!reg1[19]?12:!reg1[18]?13:!reg1[17]?14:!reg1[16]?15:!reg1[15]?16:!reg1[14]?17:!reg1[13]?18:!reg1[12]?19:!reg1[11]?20:!reg1[10]?21:!reg1[9]?22:!reg1[8]?23:!reg1[7]?24:!reg1[6]?25:!reg1[5]?26:!reg1[4]?27:!reg1[3]?28:!reg1[2]?29:!reg1[1]?30:!reg1[0]?31:32;
            end
            default:begin
                arithmetic_ans <= 0;
            end
        endcase
    end
end

assign mul1 = ((aluop==`EXE_MUL_OP || aluop==`EXE_MULT_OP||aluop==`EXE_MADD_OP || aluop==`EXE_MSUB_OP) && reg1[31]) ? (~reg1)+1: reg1;

assign mul2 = ((aluop==`EXE_MUL_OP || aluop==`EXE_MULT_OP||aluop==`EXE_MADD_OP || aluop==`EXE_MSUB_OP) && reg2[31]) ? (~reg2)+1: reg2;

assign hilo_tmp = mul1 * mul2;

always @(*) begin
    if(rst) begin
        mul_ans <= 0;
    end else begin
        case(aluop)
            `EXE_MULT_OP,`EXE_MUL_OP,`EXE_MADD_OP,`EXE_MSUB_OP:begin
                if(reg1[31]^reg2[31])begin
                    mul_ans <= (~hilo_tmp)+1;
                end else begin
                    mul_ans <= hilo_tmp;
                end
            end
            default:begin
                mul_ans <= hilo_tmp;
            end
        endcase
    end
end


always @(*)begin
    if(rst)begin
        hilo_tmp_o <= 0;
        hilo_cnt_o <= 0;
        stop_madd_and_msub <= 0;
        hilo_m_ans <= 0;
    end else begin
        case(aluop)
            `EXE_MADD_OP,`EXE_MADDU_OP:begin
                if(hilo_cnt_i == 0)begin
                    hilo_tmp_o <= mul_ans;
                    hilo_cnt_o <= 1;
                    stop_madd_and_msub <= 1;
                    hilo_m_ans <= 0;
                end else if(hilo_cnt_i==1)begin
                    hilo_tmp_o <= 0;
                    hilo_m_ans <= hilo_tmp_i + {hi,lo};
                    hilo_cnt_o <= 2;
                    stop_madd_and_msub <= 0;
                end
            end 
            `EXE_MSUB_OP,`EXE_MSUBU_OP:begin
                if(hilo_cnt_i == 0)begin
                    hilo_tmp_o <= (~mul_ans)+1;
                    hilo_cnt_o <= 1;
                    stop_madd_and_msub <= 1;
                    hilo_m_ans <= 0;
                end else if(hilo_cnt_i==1)begin
                    hilo_tmp_o <= 0;
                    hilo_m_ans <= hilo_tmp_i + {hi,lo};
                    hilo_cnt_o <= 2;
                    stop_madd_and_msub <= 0;
                end
            end 
            default:begin
                hilo_tmp_o <= 0;
                hilo_cnt_o <= 0;
                stop_madd_and_msub <= 0;
            end
        endcase
    end
end


always@(*) begin
    wd_o <= wd_i;
    if((aluop == `EXE_ADD_OP || aluop == `EXE_ADDI_OP || aluop == `EXE_SUB_OP) && overflow) begin
         wreg_o <= 0;
         ovassert <= 1'b1;
    end else begin
        wreg_o <= wreg_i;
        ovassert <= 1'b0;
    end
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
        `EXE_RES_MUL:begin
            wdata <= mul_ans[31:0];
        end
        `EXE_RES_ARITHMETIC:begin
            wdata <= arithmetic_ans;
        end
        `EXE_RES_JB:begin
            wdata <= link_addr;
        end
        default:begin
            wdata <= 0;
        end
    endcase
end

always @ (*) begin
    if(rst) begin
        cp0_reg_write_addr_o <= 5'b00000;
        cp0_reg_we_o <= 1'b0;
        cp0_reg_data_o <= 0;
    end else if(aluop == `EXE_MTC0_OP) begin
        cp0_reg_write_addr_o <= inst[15:11];
        cp0_reg_we_o <= 1'b1;
        cp0_reg_data_o <= reg1;
    end else begin
        cp0_reg_write_addr_o <= 5'b00000;
        cp0_reg_we_o <= 1'b0;
        cp0_reg_data_o <= 0;
    end
end


endmodule