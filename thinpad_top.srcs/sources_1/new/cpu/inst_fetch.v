`timescale 1ns / 1ps

module inst_fetch(
    input wire clk,
    input wire rst,
    input wire stop,
    input wire branch_we,
    input wire[31:0] branch_addr,
    output reg[31:0] pc,
    input wire flush,
    input wire[31:0] new_pc 
);

always @(posedge clk)begin
    if (rst == 1)begin
        pc <= 32'h80000000;
    end else begin 
        if(flush) begin
            pc <= new_pc;
        end else if(!stop) begin
            if(branch_we)begin
                pc <= branch_addr; 
            end else begin
                pc <= pc + 4;
            end
        end
    end
end
endmodule