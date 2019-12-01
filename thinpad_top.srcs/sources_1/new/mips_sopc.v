`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/11 11:59:02
// Design Name: 
// Module Name: mips_sopc
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module mips_sopc(
    input wire clk,
    input wire rst,
    input wire[31:0] base_ram_data,
    output wire[19:0] base_ram_addr,
    output wire[3:0] base_ram_be_n,
    output wire base_ram_ce_n,
    output wire base_ram_oe_n, 
    output wire base_ram_we_n, 
    inout wire[31:0] ext_ram_data,  
    output wire[19:0] ext_ram_addr, 
    output wire[3:0] ext_ram_be_n,  
    output wire ext_ram_ce_n,
    output wire ext_ram_oe_n,
    output wire ext_ram_we_n,
    output wire uart_rdn,
    output wire uart_wrn,
    input wire uart_dataready,
    input wire uart_tbre,
    input wire uart_tsre
);

wire[5:0] int;
wire timer_int;
assign int = {5'b00000, timer_int};

mips_cpu mips_cpu_inst(
    .clk(clk),
    .rst(rst),
    // 代码地址
    .base_ram_data(base_ram_data),
    .base_ram_addr(base_ram_addr),
    .base_ram_oe_n(base_ram_oe_n),
    .base_ram_we_n(base_ram_we_n),
    .base_ram_ce_n(base_ram_ce_n),
    .base_ram_be_n(base_ram_be_n),
    // 数据地址
    .ext_ram_data(ext_ram_data),
    .ext_ram_addr(ext_ram_addr),
    .ext_ram_be_n(ext_ram_be_n),
    .ext_ram_ce_n(ext_ram_ce_n),
    .ext_ram_oe_n(ext_ram_oe_n),
    .ext_ram_we_n(ext_ram_we_n),
    .int_i(int),
    .timer_int_o(timer_int),
    .uart_rdn(uart_rdn),
    .uart_wrn(uart_wrn),
    .uart_dataready(uart_dataready),
    .uart_tbre(uart_tbre),
    .uart_tsre(uart_tsre)
);


endmodule
