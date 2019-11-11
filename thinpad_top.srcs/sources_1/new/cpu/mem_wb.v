
module mem_wb(
    input wire clk,
    input wire rst,
    input wire[4:0] mem_wd,
    input wire mem_wreg,
    input wire[31:0] mem_wdata,
    output reg[4:0] wb_wd,
    output reg wb_wreg,
    output reg[31:0] wb_wdata
);

always @(posedge clk)begin
    if(rst) begin
        wb_wd <= 0;
        wb_wreg <= 0;
        wb_wdata <= 0;
    end else begin
        wb_wd <= mem_wd;
        wb_wdata <= mem_wdata;
        wb_wreg <= mem_wreg;
    end
end

endmodule