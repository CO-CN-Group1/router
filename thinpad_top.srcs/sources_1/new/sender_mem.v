/*
 * cpu将准备发送的帧放到这里
 * 路由器读取cpu传给它要发送的帧
 * 对于路由器来说，每个上升沿监听2047地址，如果为0的话不能执行写操作
 * 如果2047不为0，那么首先将帧读出来，帧长度在2044-2046，小端序
 * 最后将2047 置为 8'b00000000
 * 注意!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
 * we high = write low = read
 * ce high = enable
 */

module sender_mem(
    input wire cpu_clk,
    input wire cpu_rst,
    input wire[31:0] cpu_data_i,
    output wire[31:0] cpu_data_o,
    input wire[8:0] cpu_addr,
    input wire cpu_ce_n,
    input wire[3:0] cpu_we_n,
    
    input wire router_rst,
    input wire router_clk, 
    input wire[31:0] router_data_i,
    output wire[31:0] router_data_o,
    input wire[8:0] router_addr,
    input wire router_ce_n,
    input wire[3:0] router_we_n
);

xpm_memory_tdpram #(
    // A for cpu B for router
    .ADDR_WIDTH_A(9),
    .WRITE_DATA_WIDTH_A(32),
    .BYTE_WRITE_WIDTH_A(8),
    .READ_DATA_WIDTH_A(32),
    .READ_LATENCY_A(1),
    .ADDR_WIDTH_B(9),
    .WRITE_DATA_WIDTH_B(32),
    .BYTE_WRITE_WIDTH_B(8),
    .READ_DATA_WIDTH_B(32),
    .READ_LATENCY_B(1),
    .MEMORY_SIZE(1024*8),
    .CLOCKING_MODE("independent_clock")
) xpm_memory_tdpram0 (
    .clka(cpu_clk),
    .rsta(cpu_rst),
    .ena(cpu_ce_n),
    .addra(cpu_addr),
    .dina(cpu_data_i),
    .douta(cpu_data_o),
    .wea(cpu_we_n),

    .clkb(router_clk),
    .rstb(router_rst),
    .enb(router_ce_n),
    .addrb(router_addr),
    .dinb(router_data_i),
    .doutb(router_data_o),
    .web(router_we_n)
);

//当data[2047]不为0时表示已经有了发送帧，此时cpu不能进行写操作
//data[2044-2046] 表示帧的长度 单位bytes 小端序
//当data[2047] == 8'b00000000时表示还没有发送的帧，此时路由器不能进行写操作

endmodule
