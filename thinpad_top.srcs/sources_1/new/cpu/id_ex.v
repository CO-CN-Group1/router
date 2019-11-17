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
	output reg ex_wreg
	
);

always @ (posedge clk) begin
    if (rst) begin
        ex_aluop <=0;
        ex_alusel <=0;
        ex_reg1 <=0;
        ex_reg2 <= 0;
        ex_wd <= 0;
        ex_wreg <= 0;
    end else if(stop[0] && !stop[1])begin
        ex_aluop <=0;
        ex_alusel <=0;
        ex_reg1 <=0;
        ex_reg2 <= 0;
        ex_wd <= 0;
        ex_wreg <= 0;
    end else if(!stop[0])begin		
        ex_aluop <= id_aluop;
        ex_alusel <= id_alusel;
        ex_reg1 <= id_reg1;
        ex_reg2 <= id_reg2;
        ex_wd <= id_wd;
        ex_wreg <= id_wreg;		
    end
end
	
endmodule