`timescale 1ns/1ps

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
    output reg wreg
);

reg[31:0] imme;
wire[5:0] op = inst[31:26];

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
            default:begin
                aluop <= 0;
                alusel <= 0;
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
    end else if(regs_re1)begin
        reg1 <= regs_data1;
    end else begin
        reg1 <= imme; 
    end
end 
always @(*) begin
    if(rst) begin
        reg2 <= 0;
    end else if(regs_re2)begin
        reg2 <= regs_data2;
    end else begin
        reg2 <= imme; 
    end
end 
endmodule