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
    input wire[7:0] ext_uart_rx,
    output wire[7:0] ext_uart_tx
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
    .ext_uart_rx(ext_uart_rx),
    .ext_uart_tx(ext_uart_tx)
);


endmodule
