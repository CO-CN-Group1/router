`timescale 1ns / 1ps

module regs(
    input wire clk,
    input wire rst,
    
    input wire we,
    input wire[4:0] waddr,
    input wire[31:0] wdata,
    
    input wire re1,
    input wire[4:0] raddr1,
    output reg[31:0] rdata1,

    input wire re2,
    input wire[4:0] raddr2,
    output reg[31:0] rdata2
    
);

reg[31:0] reg_arr[0:31];

always @(posedge clk)begin
    if(!rst && we && waddr!=0)begin
        reg_arr[waddr] <= wdata;
    end
end
always @(*)begin
    if(rst)begin
        rdata1 <= 0;
    end else if(raddr1==0)begin
        rdata1 <= 0;
    end else if(raddr1==waddr && we && re1)begin
        rdata1 <= wdata;
    end else if(re1)begin
        rdata1 <= reg_arr[raddr1];
    end else begin
        rdata1 <= 0;
    end
end

always @(*)begin
    if(rst)begin
        rdata2 <= 0;
    end else if(raddr2==0)begin
        rdata2 <= 0;
    end else if(raddr2==waddr && we && re2)begin
        rdata2 <= wdata;
    end else if(re2)begin
        rdata2 <= reg_arr[raddr2];
    end else begin
        rdata2 <= 0;
    end
end
endmodule