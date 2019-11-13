`timescale 1ns / 1ps

module regs_hilo(
    input wire clk,
    input wire rst,
    
    input wire we,

    input wire[31:0] hi_i,
    output reg[31:0] hi_o,
    
    input wire[31:0] lo_i,
    output reg[31:0] lo_o
);

always @(posedge clk)begin
    if(rst)begin
        hi_o <= 0;
        lo_o <= 0;
    end else if(we)begin
        hi_o <= hi_i;
        lo_o <= lo_i;
    end
end

endmodule