module id_ex(
    input wire clk,
    input wire rst,

    input wire[7:0] id_aluop,
    input wire[2:0] id_alusel,
    input wire[31:0] id_reg1,
    input wire[31:0] id_reg2,
    input wire[4:0] id_wd,
    input wire id_wreg,        
    input wire[0:1] stop,

    output reg[7:0] ex_aluop,
    output reg[2:0] ex_alusel,
    output reg[31:0] ex_reg1,
    output reg[31:0] ex_reg2,
    output reg[4:0] ex_wd,
    output reg ex_wreg,

    input wire[31:0] id_link_addr,
    input wire id_in_delayslot,
    input wire id_next_in_delayslot,
    output reg[31:0] ex_link_addr,
    output reg ex_in_delayslot,
    output reg in_delayslot,
    
    input wire[31:0] id_inst,
    output reg[31:0] ex_inst,

    input wire flush,
    
    input wire[31:0] id_current_inst_address,
    input wire[31:0] id_excepttype,

    output reg[31:0] ex_excepttype,
    output reg[31:0] ex_current_inst_address        
        
);

always @ (posedge clk) begin
    if (rst) begin
        ex_aluop <=0;
        ex_alusel <=0;
        ex_reg1 <=0;
        ex_reg2 <= 0;
        ex_wd <= 0;
        ex_wreg <= 0;
        ex_link_addr <= 0;
        ex_in_delayslot <= 0;
        in_delayslot <= 0;
        ex_inst <= 0;
        ex_excepttype <= 0;
        ex_current_inst_address <= 0;
    end else if(flush) begin
        ex_aluop <=0;
        ex_alusel <=0;
        ex_reg1 <=0;
        ex_reg2 <= 0;
        ex_wd <= 0;
        ex_wreg <= 0;
        ex_link_addr <= 0;
        ex_in_delayslot <= 0;
        in_delayslot <= 0;
        ex_inst <= 0;
        ex_excepttype <= 0;
        ex_current_inst_address <= 0;
    end else if(stop[0] && !stop[1])begin
        ex_aluop <=0;
        ex_alusel <=0;
        ex_reg1 <=0;
        ex_reg2 <= 0;
        ex_wd <= 0;
        ex_wreg <= 0;
        ex_link_addr <= 0;
        ex_in_delayslot <= 0;
        ex_inst <= 0;
        ex_excepttype <= 0;
        ex_current_inst_address <= 0;
    end else if(!stop[0])begin                
        ex_aluop <= id_aluop;
        ex_alusel <= id_alusel;
        ex_reg1 <= id_reg1;
        ex_reg2 <= id_reg2;
        ex_wd <= id_wd;
        ex_wreg <= id_wreg;        
        ex_link_addr <= id_link_addr;
        ex_in_delayslot <= id_in_delayslot;
        in_delayslot <= id_next_in_delayslot;
        ex_inst <= id_inst;
        ex_excepttype <= id_excepttype;
        ex_current_inst_address <= id_current_inst_address;
    end
end
        
endmodule