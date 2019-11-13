`include "defines.v"
module ex_mem(
    input wire rst,
    input wire clk,
    input wire ex_wreg,
    input wire[31:0] ex_wdata,
    input wire[4:0] ex_wd,
    input wire[31:0] ex_hi,
    input wire[31:0] ex_lo,
    input wire ex_hilo_we,
    output reg mem_wreg,
    output reg[31:0] mem_wdata,
    output reg[4:0] mem_wd,
    output reg[31:0] mem_hi,
    output reg[31:0] mem_lo,
    output reg mem_hilo_we
);

always @(posedge clk)begin
    if(rst)begin
        mem_wdata <= 0;
        mem_wreg <= 0;
        mem_wd <= 0;
        mem_hi <= 0;
        mem_lo <= 0;
        mem_hilo_we <= 0;
    end else begin
        mem_wd <= ex_wd;
        mem_wreg <= ex_wreg;
        mem_wdata <= ex_wdata;
        mem_hi <= ex_hi;
        mem_lo <= ex_lo;
        mem_hilo_we <= ex_hilo_we;
    end
end

endmodule 