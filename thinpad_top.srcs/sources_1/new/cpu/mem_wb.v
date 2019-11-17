
module mem_wb(
    input wire clk,
    input wire rst,
    input wire[4:0] mem_wd,
    input wire mem_wreg,
    input wire[31:0] mem_wdata,
    input wire[31:0] mem_hi,
    input wire[31:0] mem_lo,
    input wire mem_hilo_we,
    input wire[0:1] stop,

    output reg[4:0] wb_wd,
    output reg wb_wreg,
    output reg[31:0] wb_wdata,
    output reg[31:0] wb_hi,
    output reg[31:0] wb_lo,
    output reg wb_hilo_we
);

always @(posedge clk)begin
    if(rst) begin
        wb_wd <= 0;
        wb_wreg <= 0;
        wb_wdata <= 0;
        wb_hi <= 0;
        wb_lo <= 0;
        wb_hilo_we <=0;
    end else if(stop[0]&&!stop[1]) begin
        wb_wd <= 0;
        wb_wreg <= 0;
        wb_wdata <= 0;
        wb_hi <= 0;
        wb_lo <= 0;
        wb_hilo_we <=0;
    end else if(!stop[0])begin
        wb_wd <= mem_wd;
        wb_wdata <= mem_wdata;
        wb_wreg <= mem_wreg;
        wb_hi <= mem_hi;
        wb_lo <= mem_lo;
        wb_hilo_we <=mem_hilo_we;
    end
end

endmodule