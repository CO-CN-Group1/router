`include "defines.v"
module ex_mem(
    input wire rst,
    input wire clk,
    input wire ex_wreg,
    input wire[31:0] ex_wdata,
    input wire[4:0] ex_wd,
    input wire[31:0] ex_hi,
    input wire[31:0] ex_lo,
    input wire[0:1] stop,
    input wire ex_hilo_we,
    input wire[63:0] hilo_tmp_i,
    input wire[1:0] hilo_cnt_i,
    output reg mem_wreg,
    output reg[31:0] mem_wdata,
    output reg[4:0] mem_wd,
    output reg[31:0] mem_hi,
    output reg[31:0] mem_lo,
    output reg mem_hilo_we,
    output reg[63:0] hilo_tmp_o,
    output reg[1:0] hilo_cnt_o
);

always @(posedge clk)begin
    if(rst)begin
        mem_wdata <= 0;
        mem_wreg <= 0;
        mem_wd <= 0;
        mem_hi <= 0;
        mem_lo <= 0;
        mem_hilo_we <= 0;
        hilo_tmp_o <= 0;
        hilo_cnt_o <= 0;
    end else if(stop[0]&&!stop[1])begin
        mem_wdata <= 0;
        mem_wreg <= 0;
        mem_wd <= 0;
        mem_hi <= 0;
        mem_lo <= 0;
        mem_hilo_we <= 0;
        hilo_cnt_o <= hilo_cnt_i;
        hilo_tmp_o <= hilo_tmp_i;
    end else if(!stop[0]) begin
        mem_wd <= ex_wd;
        mem_wreg <= ex_wreg;
        mem_wdata <= ex_wdata;
        mem_hi <= ex_hi;
        mem_lo <= ex_lo;
        mem_hilo_we <= ex_hilo_we;
        hilo_tmp_o <= 0;
        hilo_cnt_o <= 0;
    end else begin
        hilo_tmp_o <= hilo_tmp_i;
        hilo_cnt_o <= hilo_cnt_i;
    end
end

endmodule 