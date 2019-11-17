`timescale 1ns / 1ps

module inst_fetch(
    input wire clk,
    input wire rst,
    input wire stop,
    output reg[19:0] pc,
    output reg ce 
);

always @(posedge clk)begin
    if(rst)begin
        ce <=1;
    end else begin
        ce <=0;
    end
end

always @(posedge clk)begin
    if (ce == 1)begin
        pc <= 0;
    end else if(!stop) begin
        pc <= pc + 1;
    end
end
endmodule