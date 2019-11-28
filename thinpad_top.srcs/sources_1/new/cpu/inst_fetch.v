`timescale 1ns / 1ps

module inst_fetch(
    input wire clk,
    input wire rst,
    input wire stop,
    input wire branch_we,
    input wire[31:0] branch_addr,
    output reg[19:0] pc,
    output reg ce,
    input wire flush,
    input wire[31:0] new_pc 
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
    end else begin 
        if(flush) begin
            pc <= new_pc[19:0];
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