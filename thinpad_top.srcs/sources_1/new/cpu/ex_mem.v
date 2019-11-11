`include "defines.v"
module ex_mem(
    input wire rst,
    input wire clk,
    input wire ex_wreg,
    input wire[31:0] ex_wdata,
    input wire[4:0] ex_wd,
    output reg mem_wreg,
    output reg[31:0] mem_wdata,
    output reg[4:0] mem_wd
);

always @(posedge clk)begin
    if(rst)begin
        mem_wdata <= 0;
        mem_wreg <= 0;
        mem_wd <= 0;
    end else begin
        mem_wd <= ex_wd;
        mem_wreg <= ex_wreg;
        mem_wdata <= ex_wdata;
    end
end

endmodule 