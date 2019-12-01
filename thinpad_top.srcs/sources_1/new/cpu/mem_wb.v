
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
    output reg wb_hilo_we,

    input wire mem_cp0_reg_we,
    input wire[4:0] mem_cp0_reg_write_addr,
    input wire[31:0] mem_cp0_reg_data,
    output reg wb_cp0_reg_we,
    output reg[4:0] wb_cp0_reg_write_addr,
    output reg[31:0] wb_cp0_reg_data,
    input wire flush
);

always @(posedge clk)begin
    if(rst) begin
        wb_wd <= 0;
        wb_wreg <= 0;
        wb_wdata <= 0;
        wb_hi <= 0;
        wb_lo <= 0;
        wb_hilo_we <=0;
        wb_cp0_reg_we <= 1'b0;
        wb_cp0_reg_write_addr <= 5'b00000;
        wb_cp0_reg_data <= 0;    
    end else if(flush)begin
        wb_wd <= 0;
        wb_wreg <= 0;
        wb_wdata <= 0;
        wb_hi <= 0;
        wb_lo <= 0;
        wb_hilo_we <=0;
        wb_cp0_reg_we <= 1'b0;
        wb_cp0_reg_write_addr <= 5'b00000;
        wb_cp0_reg_data <= 0;     
    end else if(stop[0]&&!stop[1]) begin
        wb_wd <= 0;
        wb_wreg <= 0;
        wb_wdata <= 0;
        wb_hi <= 0;
        wb_lo <= 0;
        wb_hilo_we <=0;
        wb_cp0_reg_we <= 1'b0;
        wb_cp0_reg_write_addr <= 5'b00000;
        wb_cp0_reg_data <= 0;
    end else if(!stop[0])begin
        wb_wd <= mem_wd;
        wb_wdata <= mem_wdata;
        wb_wreg <= mem_wreg;
        wb_hi <= mem_hi;
        wb_lo <= mem_lo;
        wb_hilo_we <=mem_hilo_we;
        wb_cp0_reg_we <= mem_cp0_reg_we;
        wb_cp0_reg_write_addr <= mem_cp0_reg_write_addr;
        wb_cp0_reg_data <= mem_cp0_reg_data;
    end
end

endmodule