`default_nettype none

module thinpad_top(
    input wire clk_50M,           //50MHz 时钟输入
    input wire clk_11M0592,       //11.0592MHz 时钟输入

    input wire clock_btn,         //BTN5手动时钟按钮�???关，带消抖电路，按下时为1
    input wire reset_btn,         //BTN6手动复位按钮�???关，带消抖电路，按下时为1

    input  wire[3:0]  touch_btn,  //BTN1~BTN4，按钮开关，按下时为1
    input  wire[31:0] dip_sw,     //32位拨码开关，拨到“ON”时�???1
    output wire[15:0] leds,       //16位LED，输出时1点亮
    output wire[7:0]  dpy0,       //数码管低位信号，包括小数点，输出1点亮
    output wire[7:0]  dpy1,       //数码管高位信号，包括小数点，输出1点亮

    //CPLD串口控制器信�???
    output wire uart_rdn,         //读串口信号，低有�???
    output wire uart_wrn,         //写串口信号，低有�???
    input wire uart_dataready,    //串口数据准备�???
    input wire uart_tbre,         //发�?�数据标�???
    input wire uart_tsre,         //数据发�?�完毕标�???

    //BaseRAM信号
    inout wire[31:0] base_ram_data,  //BaseRAM数据，低8位与CPLD串口控制器共�???
    output reg[19:0] base_ram_addr, //BaseRAM地址
    output reg[3:0] base_ram_be_n,  //BaseRAM字节使能，低有效。如果不使用字节使能，请保持�???0
    output reg base_ram_ce_n,       //BaseRAM片�?�，低有�???
    output reg base_ram_oe_n,       //BaseRAM读使能，低有�???
    output reg base_ram_we_n,       //BaseRAM写使能，低有�???

    //ExtRAM信号
    inout wire[31:0] ext_ram_data,  //ExtRAM数据
    output reg[19:0] ext_ram_addr, //ExtRAM地址
    output reg[3:0] ext_ram_be_n,  //ExtRAM字节使能，低有效。如果不使用字节使能，请保持�???0
    output reg ext_ram_ce_n,       //ExtRAM片�?�，低有�???
    output reg ext_ram_oe_n,       //ExtRAM读使能，低有�???
    output reg ext_ram_we_n,       //ExtRAM写使能，低有�???

    //直连串口信号
    output wire txd,  //直连串口发�?�端
    input  wire rxd,  //直连串口接收�???

    //Flash存储器信号，参�?? JS28F640 芯片手册
    output reg [22:0]flash_a,      //Flash地址，a0仅在8bit模式有效�???16bit模式无意�???
    inout  wire [15:0]flash_d,      //Flash数据
    output reg flash_rp_n,         //Flash复位信号，低有效
    output reg flash_vpen,         //Flash写保护信号，低电平时不能擦除、烧�???
    output reg flash_ce_n,         //Flash片�?�信号，低有�???
    output reg flash_oe_n,         //Flash读使能信号，低有�???
    output reg flash_we_n,         //Flash写使能信号，低有�???
    output reg flash_byte_n,       //Flash 8bit模式选择，低有效。在使用flash�???16位模式时请设�???1

    //USB+SD 控制器信号，参�?? CH376T 芯片手册
    output wire ch376t_sdi,
    output wire ch376t_sck,
    output wire ch376t_cs_n,
    output wire ch376t_rst,
    input  wire ch376t_int_n,
    input  wire ch376t_sdo,

    //网络交换机信号，参�?? KSZ8795 芯片手册�??? RGMII 规范
    input  wire [3:0] eth_rgmii_rd,
    input  wire eth_rgmii_rx_ctl,
    input  wire eth_rgmii_rxc,
    output wire [3:0] eth_rgmii_td,
    output wire eth_rgmii_tx_ctl,
    output wire eth_rgmii_txc,
    output wire eth_rst_n,
    input  wire eth_int_n,

    input  wire eth_spi_miso,
    output wire eth_spi_mosi,
    output wire eth_spi_sck,
    output wire eth_spi_ss_n,

    //图像输出信号
    output wire[2:0] video_red,    //红色像素�???3�???
    output wire[2:0] video_green,  //绿色像素�???3�???
    output wire[1:0] video_blue,   //蓝色像素�???2�???
    output wire video_hsync,       //行同步（水平同步）信�???
    output wire video_vsync,       //场同步（垂直同步）信�???
    output wire video_clk,         //像素时钟输出
    output wire video_de           //行数据有效信号，用于区分消隐�???
);

/* =========== Demo code begin =========== */

// PLL分频示例
wire locked, clk_10M, clk_20M, clk_125M, clk_200M;
pll_example clock_gen 
 (
  // Clock out ports
  .clk_out1(clk_10M), // 时钟输出1，频率在IP配置界面中设�???
  .clk_out2(clk_20M), // 时钟输出2，频率在IP配置界面中设�???
  .clk_out3(clk_125M), // 时钟输出3，频率在IP配置界面中设�???
  .clk_out4(clk_200M), // 时钟输出4，频率在IP配置界面中设�???
  // Status and control signals
  .reset(reset_btn), // PLL复位输入
  .locked(locked), // 锁定输出�???"1"表示时钟稳定，可作为后级电路复位
 // Clock in ports
  .clk_in1(clk_50M) // 外部时钟输入
 );

assign eth_rst_n = ~reset_btn;
// 以太网交换机寄存器配�???
eth_conf conf(
    .clk(clk_50M),
    .rst_in_n(locked),

    .eth_spi_miso(eth_spi_miso),
    .eth_spi_mosi(eth_spi_mosi),
    .eth_spi_sck(eth_spi_sck),
    .eth_spi_ss_n(eth_spi_ss_n),

    .done()
);

reg reset_of_clk10M;
// 异步复位，同步释�???
always@(posedge clk_10M or negedge locked) begin
    if(~locked) reset_of_clk10M <= 1'b1;
    else        reset_of_clk10M <= 1'b0;
end

always@(posedge clk_10M or posedge reset_of_clk10M) begin
    if(reset_of_clk10M)begin
        // Your Code
    end
    else begin
        // Your Code
    end
end

// 不使用内存�?�串口时，禁用其使能信号
/*assign base_ram_ce_n = 1'b1;
assign base_ram_oe_n = 1'b1;
assign base_ram_we_n = 1'b1;

assign ext_ram_ce_n = 1'b1;
assign ext_ram_oe_n = 1'b1;
assign ext_ram_we_n = 1'b1;

assign uart_rdn = 1'b1;
assign uart_wrn = 1'b1;
*/
// 数码管连接关系示意图，dpy1同理
// p=dpy0[0] // ---a---
// c=dpy0[1] // |     |
// d=dpy0[2] // f     b
// e=dpy0[3] // |     |
// b=dpy0[4] // ---g---
// a=dpy0[5] // |     |
// f=dpy0[6] // e     c
// g=dpy0[7] // |     |
//           // ---d---  p

// 7段数码管译码器演示，将number�???16进制显示在数码管上面
reg[7:0] number;
SEG7_LUT segL(.oSEG1(dpy0), .iDIG(number[3:0])); //dpy0是低位数码管
SEG7_LUT segH(.oSEG1(dpy1), .iDIG(number[7:4])); //dpy1是高位数码管

reg[15:0] led_bits=16'h0000;
//assign leds = led_bits;

always@(posedge clock_btn or posedge reset_btn) begin
    if(reset_btn)begin //复位按下，设置LED和数码管为初始�??
        number<=0;
        led_bits <= 16'h1010;
    end
    else begin //每次按下时钟按钮，数码管显示值加1，LED循环左移
        number <= number+1;
        //led_bits <= {led_bits[14:0],led_bits[15]};
    end
end

//直连串口接收发�?�演示，从直连串口收到的数据再发送出�???
wire [7:0] ext_uart_rx;
reg  [7:0] ext_uart_buffer, ext_uart_tx;
wire ext_uart_ready, ext_uart_busy;
reg ext_uart_start, ext_uart_avai;

async_receiver #(.ClkFrequency(50000000),.Baud(9600)) //接收模块�???9600无检验位
    ext_uart_r(
        .clk(clk_50M),                       //外部时钟信号
        .RxD(rxd),                           //外部串行信号输入
        .RxD_data_ready(ext_uart_ready),  //数据接收到标�???
        .RxD_clear(ext_uart_ready),       //清除接收标志
        .RxD_data(ext_uart_rx)             //接收到的�???字节数据
    );
    
always @(posedge clk_50M) begin //接收到缓冲区ext_uart_buffer
    if(ext_uart_ready)begin
        ext_uart_buffer <= ext_uart_rx;
        ext_uart_avai <= 1;
    end else if(!ext_uart_busy && ext_uart_avai)begin 
        ext_uart_avai <= 0;
    end
end
always @(posedge clk_50M) begin //将缓冲区ext_uart_buffer发�?�出�???
    if(!ext_uart_busy && ext_uart_avai)begin 
        ext_uart_tx <= ext_uart_buffer;
        ext_uart_start <= 1;
    end else begin 
        ext_uart_start <= 0;
    end
end

async_transmitter #(.ClkFrequency(50000000),.Baud(9600)) //发�?�模块，9600无检验位
    ext_uart_t(
        .clk(clk_50M),                  //外部时钟信号
        .TxD(txd),                      //串行信号输出
        .TxD_busy(ext_uart_busy),       //发�?�器忙状态指�???
        .TxD_start(ext_uart_start),    //�???始发送信�???
        .TxD_data(ext_uart_tx)        //待发送的数据
    );

//图像输出演示，分辨率800x600@75Hz，像素时钟为50MHz
wire [11:0] hdata;
assign video_red = hdata < 266 ? 3'b111 : 0; //红色竖条
assign video_green = hdata < 532 && hdata >= 266 ? 3'b111 : 0; //绿色竖条
assign video_blue = hdata >= 532 ? 2'b11 : 0; //蓝色竖条
assign video_clk = clk_50M;
vga #(12, 800, 856, 976, 1040, 600, 637, 643, 666, 1, 1) vga800x600at75 (
    .clk(clk_50M), 
    .hdata(hdata), //横坐�???
    .vdata(),      //纵坐�???
    .hsync(video_hsync),
    .vsync(video_vsync),
    .data_enable(video_de)
);


// 以太�??? MAC 配置演示
/*
wire [7:0] eth_rx_axis_mac_tdata;
wire eth_rx_axis_mac_tvalid;
wire eth_rx_axis_mac_tlast;
wire eth_rx_axis_mac_tuser;
wire [7:0] eth_tx_axis_mac_tdata = 0;
wire eth_tx_axis_mac_tvalid = 0;
wire eth_tx_axis_mac_tlast = 0;
wire eth_tx_axis_mac_tuser = 0;
wire eth_tx_axis_mac_tready;

wire eth_rx_mac_aclk;
wire eth_tx_mac_aclk;
eth_mac eth_mac_inst (
    .gtx_clk(clk_125M),
    .refclk(clk_200M),

    .glbl_rstn(eth_rst_n),
    .rx_axi_rstn(eth_rst_n),
    .tx_axi_rstn(eth_rst_n),

    .rx_mac_aclk(eth_rx_mac_aclk),
    .rx_axis_mac_tdata(eth_rx_axis_mac_tdata),
    .rx_axis_mac_tvalid(eth_rx_axis_mac_tvalid),
    .rx_axis_mac_tlast(eth_rx_axis_mac_tlast),
    .rx_axis_mac_tuser(eth_rx_axis_mac_tuser),

    .tx_ifg_delay(8'b0),
    .tx_mac_aclk(eth_tx_mac_aclk),
    .tx_axis_mac_tdata(eth_tx_axis_mac_tdata),
    .tx_axis_mac_tvalid(eth_tx_axis_mac_tvalid),
    .tx_axis_mac_tlast(eth_tx_axis_mac_tlast),
    .tx_axis_mac_tuser(eth_tx_axis_mac_tuser),
    .tx_axis_mac_tready(eth_tx_axis_mac_tready),

    .pause_req(1'b0),
    .pause_val(16'b0),

    .rgmii_txd(eth_rgmii_td),
    .rgmii_tx_ctl(eth_rgmii_tx_ctl),
    .rgmii_txc(eth_rgmii_txc),
    .rgmii_rxd(eth_rgmii_rd),
    .rgmii_rx_ctl(eth_rgmii_rx_ctl),
    .rgmii_rxc(eth_rgmii_rxc),

    // receive 1Gb/s | promiscuous | flow control | fcs | vlan | enable
    .rx_configuration_vector(80'b10100000101110),
    // transmit 1Gb/s | vlan | enable
    .tx_configuration_vector(80'b10000000000110)
);*/


//---------------------loop back + fifo----------------------------


reg gtx_pre_resetn = 0, gtx_resetn = 0;

always @(posedge clk_125M)
begin
    gtx_pre_resetn  <= 1;
    gtx_resetn      <= gtx_pre_resetn;
end


wire [7:0] eth_rx_axis_fifo_tdata;
wire eth_rx_axis_fifo_tvalid;
wire eth_rx_axis_fifo_tlast;
wire eth_rx_axis_fifo_tready;
wire [7:0] eth_tx_axis_fifo_tdata;
wire eth_tx_axis_fifo_tvalid;
wire eth_tx_axis_fifo_tlast;
wire eth_tx_axis_fifo_tready;
wire [7:0] eth_rx_axis_fifo_tdata2;
wire eth_rx_axis_fifo_tvalid2;
wire eth_rx_axis_fifo_tlast2;
wire eth_rx_axis_fifo_tready2;


eth_mac_fifo_block trimac_fifo_block (
    .gtx_clk                        (clk_125M),
    .refclk                         (clk_200M),

    .glbl_rstn                      (eth_rst_n),
    .rx_axi_rstn                    (eth_rst_n),
    .tx_axi_rstn                    (eth_rst_n),

    .rx_fifo_clock                  (clk_125M),
    .rx_fifo_resetn                 (gtx_resetn),
    .rx_axis_fifo_tdata             (eth_rx_axis_fifo_tdata),
    .rx_axis_fifo_tvalid            (eth_rx_axis_fifo_tvalid),
    .rx_axis_fifo_tready            (eth_rx_axis_fifo_tready),
    .rx_axis_fifo_tlast             (eth_rx_axis_fifo_tlast),

    .tx_ifg_delay                   (8'b0),
    .tx_fifo_clock                  (clk_125M),
    .tx_fifo_resetn                 (gtx_resetn),
    .tx_axis_fifo_tdata             (eth_tx_axis_fifo_tdata),
    .tx_axis_fifo_tvalid            (eth_tx_axis_fifo_tvalid),
    .tx_axis_fifo_tready            (eth_tx_axis_fifo_tready),
    .tx_axis_fifo_tlast             (eth_tx_axis_fifo_tlast),
    
    .pause_req                      (1'b0),
    .pause_val                      (16'b0),

    .rgmii_txd                      (eth_rgmii_td),
    .rgmii_tx_ctl                   (eth_rgmii_tx_ctl),
    .rgmii_txc                      (eth_rgmii_txc),
    .rgmii_rxd                      (eth_rgmii_rd),
    .rgmii_rx_ctl                   (eth_rgmii_rx_ctl),
    .rgmii_rxc                      (eth_rgmii_rxc),

    .rx_configuration_vector        (80'b10100000101110),
    .tx_configuration_vector        (80'b10000000000110)
);

fifo_generator_0 my_fifo(
    .s_aclk(clk_125M),
    .s_aresetn(locked),
    .s_axis_tdata(eth_rx_axis_fifo_tdata),
    .s_axis_tvalid(eth_rx_axis_fifo_tvalid),
    .s_axis_tready(eth_rx_axis_fifo_tready),
    .s_axis_tlast(eth_rx_axis_fifo_tlast),
    .m_axis_tdata(eth_rx_axis_fifo_tdata2),
    .m_axis_tvalid(eth_rx_axis_fifo_tvalid2),
    .m_axis_tready(eth_rx_axis_fifo_tready2),
    .m_axis_tlast(eth_rx_axis_fifo_tlast2)
);


wire[7:0] eth_rx_axis_no_crc_tdata;
wire eth_rx_axis_no_crc_tvalid;
wire eth_rx_axis_no_crc_tlast;
wire eth_rx_axis_no_crc_tready;

rx_axis_tdata_crc_filter rx_crc_filter(
    .clk(clk_125M),
    .rst(~locked),
    .fifo_tdata(eth_rx_axis_fifo_tdata2),
    .fifo_tvalid(eth_rx_axis_fifo_tvalid2),
    .fifo_tready(eth_rx_axis_fifo_tready2),
    .fifo_tlast(eth_rx_axis_fifo_tlast2),
    
    .no_crc_tdata(eth_rx_axis_no_crc_tdata),
    .no_crc_tvalid(eth_rx_axis_no_crc_tvalid),
    .no_crc_tlast(eth_rx_axis_no_crc_tlast),
    .no_crc_tready(eth_rx_axis_no_crc_tready)
);

//测试CRC_filter代码
/*assign eth_tx_axis_fifo_tdata = eth_rx_axis_no_crc_tdata;
assign eth_tx_axis_fifo_tvalid = eth_rx_axis_no_crc_tvalid;
assign eth_tx_axis_fifo_tlast = eth_rx_axis_no_crc_tlast;
assign eth_rx_axis_no_crc_tready = eth_tx_axis_fifo_tready;
*/

//路由表查�???

wire[7:0] receiver_router_data_i;
wire[7:0] receiver_router_data_o;
wire[10:0] receiver_router_addr;
wire receiver_router_ce_n;
wire receiver_router_we_n;

wire[31:0] sender_router_data_i;
wire[31:0] sender_router_data_o;
wire[7:0] sender_router_addr;
wire sender_router_ce_n;
wire[3:0] sender_router_we_n;



//loop back代码
/*eth_mac_basic_pat_gen temac_pat_gen(
    .axi_tclk                       (clk_125M),
    .axi_tresetn                    (gtx_resetn),
    //.check_resetn,

    .enable_pat_gen                 (1'b0),
    .enable_pat_chk                 (1'b0),
    .enable_address_swap            (1'b1),
    //.speed,

    // data from the RX data path
    .rx_axis_tdata                  (eth_rx_axis_no_crc_tdata),
    .rx_axis_tvalid                 (eth_rx_axis_no_crc_tvalid),
    .rx_axis_tlast                  (eth_rx_axis_no_crc_tlast),
    .rx_axis_tuser                  (1'b0),
    .rx_axis_tready                 (eth_rx_axis_no_crc_tready),
    // data TO the TX data path
    .tx_axis_tdata                  (eth_tx_axis_fifo_tdata),
    .tx_axis_tvalid                 (eth_tx_axis_fifo_tvalid),
    .tx_axis_tlast                  (eth_tx_axis_fifo_tlast),
    .tx_axis_tready                 (eth_tx_axis_fifo_tready)

    //.frame_error,
    //.activity_flash
);*/

wire[31:0] openmips_if_addr_o;
reg[31:0] openmips_if_data_i;
wire openmips_if_ce_o;
wire openmips_if_sram_ce_o;
wire openmips_if_flash_ce_o;
wire openmips_if_serial_ce_o;
wire openmips_if_vga_ce_o;
wire openmips_if_rom_ce_o;
wire openmips_if_receiver_mem_ce_o;
wire openmips_if_sender_mem_ce_o;
wire openmips_if_router_table_ce_o;
wire openmips_if_router_port_ce_o;
wire openmips_mem_we_o;
wire[31:0] openmips_mem_addr_o;
wire[3:0] openmips_mem_sel_o;
wire[31:0] openmips_mem_data_o;
reg[31:0] openmips_mem_data_i;
wire openmips_mem_ce_o;
wire openmips_mem_sram_ce_o;
wire openmips_mem_flash_ce_o;
wire openmips_mem_serial_ce_o;
wire openmips_mem_vga_ce_o;
wire openmips_mem_rom_ce_o;
wire openmips_mem_sram_sum;
wire openmips_mem_receiver_mem_ce_o;
wire openmips_mem_sender_mem_ce_o;
wire openmips_mem_router_table_ce_o;
wire openmips_mem_router_port_ce_o;
reg uart_we_o;
reg uart_re_o;
wire[5:0] int;
wire timer_int;
assign int = {5'b00000, timer_int};
assign uart_wrn = uart_we_o;
assign uart_rdn = uart_re_o;

reg[15:0] router_table_os_addr;
wire[63:0] router_table_os_dout;
reg[7:0] router_table_os_we;
reg router_table_os_en;

reg[11:0] router_table_os_port_addr;
wire[31:0] router_table_os_port_dout;
reg[3:0] router_table_os_port_we;
reg router_table_os_port_en;


routing_table_lookup lookup_inst(

    .rst                            (~locked),
    .clk                            (clk_125M),
    // data from the RX data path
    .rx_axis_tdata                  (eth_rx_axis_no_crc_tdata),
    .rx_axis_tvalid                 (eth_rx_axis_no_crc_tvalid),
    .rx_axis_tlast                  (eth_rx_axis_no_crc_tlast),
    .rx_axis_tready                 (eth_rx_axis_no_crc_tready),

    .receiver_data_i(receiver_router_data_i),
    .receiver_data_o(receiver_router_data_o),
    .receiver_addr(receiver_router_addr),
    .receiver_cen(receiver_router_ce_n),
    .receiver_wen(receiver_router_we_n),


    // data to the TX data path
    .tx_axis_tdata                  (eth_tx_axis_fifo_tdata),
    .tx_axis_tvalid                 (eth_tx_axis_fifo_tvalid),
    .tx_axis_tlast                  (eth_tx_axis_fifo_tlast),
    .tx_axis_tready                 (eth_tx_axis_fifo_tready),
    //.led_out(led_bits)

    
    .sender_data_i(sender_router_data_i),
    .sender_data_o(sender_router_data_o),
    .sender_addr(sender_router_addr),
    .sender_cen(sender_router_ce_n),
    .sender_wen(sender_router_we_n),

    .router_table_os_clk(clk_20M),
    .router_table_os_rst(~locked),
    .router_table_os_addr(router_table_os_addr),
    .router_table_os_din({openmips_mem_data_o,openmips_mem_data_o}),
    .router_table_os_dout(router_table_os_dout),
    .router_table_os_we(router_table_os_we),
    .router_table_os_en(router_table_os_en),

    .router_table_os_port_addr(router_table_os_port_addr),
    .router_table_os_port_din(openmips_mem_data_o),
    .router_table_os_port_dout(router_table_os_port_dout),
    .router_table_os_port_we(router_table_os_port_we),
    .router_table_os_port_en(router_table_os_port_en)

);





mips_cpu mips_cpu_inst(
    .clk(clk_20M),
    .rst(~locked),
    .int_i(int),

    .if_addr_o(openmips_if_addr_o),
    .if_data_i(openmips_if_data_i),
    .if_ce_o(openmips_if_ce_o),
    .if_sram_ce_o(openmips_if_sram_ce_o),
    .if_flash_ce_o(openmips_if_flash_ce_o),
    .if_serial_ce_o(openmips_if_serial_ce_o),
    .if_vga_ce_o(openmips_if_vga_ce_o),
    .if_rom_ce_o(openmips_if_rom_ce_o),
    .if_receiver_mem_ce_o(openmips_if_receiver_mem_ce_o),
    .if_sender_mem_ce_o(openmips_if_sender_mem_ce_o),
    .if_router_table_ce_o(openmips_if_router_table_ce_o),
    .if_router_port_ce_o(openmips_if_router_port_ce_o),


    .mem_we_o(openmips_mem_we_o),
    .mem_addr_o(openmips_mem_addr_o),
    .mem_sel_o(openmips_mem_sel_o),
    .mem_data_o(openmips_mem_data_o),
    .mem_data_i(openmips_mem_data_i),
    .mem_ce_o(openmips_mem_ce_o),
    .mem_sram_ce_o(openmips_mem_sram_ce_o),
    .mem_flash_ce_o(openmips_mem_flash_ce_o),
    .mem_serial_ce_o(openmips_mem_serial_ce_o),
    .mem_vga_ce_o(openmips_mem_vga_ce_o),
    .mem_rom_ce_o(openmips_mem_rom_ce_o),
    .mem_receiver_mem_ce_o(openmips_mem_receiver_mem_ce_o),
    .mem_sender_mem_ce_o(openmips_mem_sender_mem_ce_o),
    .mem_router_table_ce_o(openmips_mem_router_table_ce_o),
    .mem_router_port_ce_o(openmips_mem_router_port_ce_o),
    .mem_sram_sum(openmips_mem_sram_sum),
    .timer_int_o(timer_int)
);

reg[8:0] receiver_cpu_addr;
reg receiver_cpu_ce_n;
reg[3:0] receiver_cpu_we_n;
wire[31:0] receiver_cpu_data_o;

reg[7:0] sender_cpu_addr;
reg sender_cpu_ce_n;
reg [3:0]sender_cpu_we_n;
wire[31:0] sender_cpu_data_o;


receiver_mem receiver_mem0(
    .cpu_rst(~locked),
    .cpu_clk(clk_20M),
    .cpu_data_i(openmips_mem_data_o),
    .cpu_data_o(receiver_cpu_data_o),
    .cpu_addr(receiver_cpu_addr),
    .cpu_ce_n(receiver_cpu_ce_n),
    .cpu_we_n(receiver_cpu_we_n),
    
    .router_rst(~locked),
    .router_clk(clk_125M),
    .router_data_i(receiver_router_data_o),
    .router_data_o(receiver_router_data_i),
    .router_addr(receiver_router_addr),
    .router_ce_n(receiver_router_ce_n),
    .router_we_n(receiver_router_we_n)
);

sender_mem sender_mem0(
    .cpu_rst(~locked),
    .cpu_clk(clk_20M),
    .cpu_data_i(openmips_mem_data_o),
    .cpu_data_o(sender_cpu_data_o),
    .cpu_addr(sender_cpu_addr),
    .cpu_ce_n(sender_cpu_ce_n),
    .cpu_we_n(sender_cpu_we_n),
    
    .router_rst(~locked),
    .router_clk(clk_125M),
    .router_data_i(sender_router_data_o),
    .router_data_o(sender_router_data_i),
    .router_addr(sender_router_addr),
    .router_ce_n(sender_router_ce_n),
    .router_we_n(sender_router_we_n)
);

reg rom_ce;
reg[11:0] rom_addr;
wire[31:0] rom_data;
assign base_ram_data = (openmips_mem_ce_o && openmips_mem_we_o && openmips_mem_sram_sum)? openmips_mem_data_o: 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
assign ext_ram_data = (openmips_mem_ce_o && openmips_mem_we_o && openmips_mem_sram_ce_o)? openmips_mem_data_o: 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
always@(*)begin
    if(~locked)begin
        base_ram_addr <= 20'b0;
        base_ram_be_n <= 4'b1111;
        base_ram_ce_n <= 1'b1;
        base_ram_oe_n <= 1'b1;
        base_ram_we_n <= 1'b1;
        ext_ram_addr <= 20'b0;
        ext_ram_be_n <= 4'b1111;
        ext_ram_ce_n <= 1'b1;
        ext_ram_oe_n <= 1'b1;
        ext_ram_we_n <= 1'b1;
        flash_a <= 23'b0;
        flash_rp_n <= 1'b1;
        flash_oe_n <= 1'b1;
        flash_ce_n <= 1'b1;
        flash_byte_n <= 1'b1;
        flash_we_n <= 1'b1;
        //ext_uart_tx <= 8'b0;
        //ext_uart_start <= 1'b0;
        uart_we_o <= 1'b1;
        uart_re_o <= 1'b1;
        rom_ce <= 1'b0;
        rom_addr <= 12'b0;
        openmips_if_data_i <= 32'b0;
        openmips_mem_data_i <= 32'b0;
        
        receiver_cpu_addr <= 9'b0;
        receiver_cpu_we_n <= 4'b0000;
        receiver_cpu_ce_n <= 1'b0;

        sender_cpu_addr <= 8'b0;
        sender_cpu_we_n <= 4'b0000;
        sender_cpu_ce_n <= 1'b0;

        router_table_os_addr <= 16'b0;
        router_table_os_we <= 8'b0;
        router_table_os_en <= 1'b0;

        router_table_os_port_addr <= 12'b0;
        router_table_os_port_we <= 4'b0;
        router_table_os_port_en <= 1'b0;

    end else begin
        base_ram_addr <= 20'b0;
        base_ram_be_n <= 4'b1111;
        base_ram_ce_n <= 1'b1;
        base_ram_oe_n <= 1'b1;
        base_ram_we_n <= 1'b1;
        ext_ram_addr <= 20'b0;
        ext_ram_be_n <= 4'b1111;
        ext_ram_ce_n <= 1'b1;
        ext_ram_oe_n <= 1'b1;
        ext_ram_we_n <= 1'b1;
        flash_a <= 23'b0;
        flash_rp_n <= 1'b1;
        flash_oe_n <= 1'b1;
        flash_ce_n <= 1'b1;
        flash_byte_n <= 1'b1;
        flash_we_n <= 1'b1;
        //ext_uart_tx <= 8'b0;
        //ext_uart_start <= 1'b0;
        rom_ce <= 1'b0;
        rom_addr <= 12'b0;
        uart_we_o <= 1'b1;
        uart_re_o <= 1'b1;
        openmips_if_data_i <= 32'b0;
        openmips_mem_data_i <= 32'b0;
        
        receiver_cpu_addr <= 9'b0;
        receiver_cpu_we_n <= 4'b0000;
        receiver_cpu_ce_n <= 1'b0;

        sender_cpu_addr <= 8'b0;
        sender_cpu_we_n <= 4'b0000;
        sender_cpu_ce_n <= 1'b0;
        
        router_table_os_addr <= 16'b0;
        router_table_os_we <= 8'b0;
        router_table_os_en <= 1'b0;

        router_table_os_port_addr <= 12'b0;
        router_table_os_port_we <= 4'b0;
        router_table_os_port_en <= 1'b0;


        if (openmips_mem_ce_o) begin
            if (openmips_mem_sram_ce_o) begin
                if (openmips_mem_addr_o[22] == 1'b0) begin
                    base_ram_addr <= openmips_mem_addr_o[21:2];
                    base_ram_be_n <= ~openmips_mem_sel_o;
                    base_ram_ce_n <= 1'b0;
                    if (openmips_mem_we_o) begin
                        base_ram_oe_n <= 1'b1;
                        base_ram_we_n <= 1'b0;
                    end else begin
                        base_ram_oe_n <= 1'b0;
                        base_ram_we_n <= 1'b1;
                        openmips_mem_data_i <= base_ram_data;
                    end
                end else if (openmips_mem_addr_o[22] == 1'b1) begin
                    ext_ram_addr <= openmips_mem_addr_o[21:2];
                    ext_ram_be_n <= ~openmips_mem_sel_o;
                    ext_ram_ce_n <= 1'b0;
                    if (openmips_mem_we_o) begin
                        ext_ram_oe_n <= 1'b1;
                        ext_ram_we_n <= 1'b0;
                    end else begin
                        ext_ram_oe_n <= 1'b0;
                        ext_ram_we_n <= 1'b1;
                        openmips_mem_data_i <= ext_ram_data;
                    end
                end
            end else if (openmips_mem_flash_ce_o) begin
                flash_a <= openmips_mem_addr_o[23:1];
                flash_rp_n <= 1'b1;
                flash_oe_n <= 1'b0;
                flash_ce_n <= 1'b0;
                flash_byte_n <= 1'b1;
                flash_we_n <= 1'b1;
                openmips_mem_data_i <= { 16'b0, flash_d };
            end else if (openmips_mem_serial_ce_o) begin
                if (openmips_mem_addr_o[3:0] == 4'hc) begin
                    openmips_mem_data_i <= { 30'b0, uart_dataready, uart_tsre&uart_tbre}; // <TODO>
                end else if (openmips_mem_addr_o[3:0] == 4'h8) begin
                    if (openmips_mem_we_o) begin
                        uart_we_o <= 1'b0;
                    end else begin
                        uart_re_o <= 1'b0;
                        openmips_mem_data_i <= {24'b0, base_ram_data[7:0]};
                        //already_read_status <= serial_read_status;
                        //openmips_mem_data_i <= { 24'b0, serial_read_data };
                    end
                end
            end else if (openmips_mem_rom_ce_o) begin
                rom_addr <= openmips_mem_addr_o[13:2];
                rom_ce <= 1'b1;
                openmips_mem_data_i <= rom_data; 
            end else if(openmips_mem_receiver_mem_ce_o) begin
                receiver_cpu_addr <= openmips_mem_addr_o[10:2];
                receiver_cpu_ce_n <= 1'b1;
                if(openmips_mem_we_o) begin
                    receiver_cpu_we_n <= openmips_mem_sel_o;
                end else begin
                    openmips_mem_data_i<= receiver_cpu_data_o;
                    receiver_cpu_we_n <=4'b0000;
                end
            end else if(openmips_mem_sender_mem_ce_o) begin
                sender_cpu_addr <= openmips_mem_addr_o[9:2];
                sender_cpu_ce_n <= 1'b1;
                if(openmips_mem_we_o) begin
                    sender_cpu_we_n <= openmips_mem_sel_o;
                end else begin
                    openmips_mem_data_i<= sender_cpu_data_o;
                    sender_cpu_we_n <=4'b0000;
                end
            end else if(openmips_mem_router_table_ce_o) begin
                router_table_os_en <= 1'b1;
                router_table_os_addr <= openmips_mem_addr_o[18:3];
                if(openmips_mem_we_o) begin
                    if(openmips_mem_addr_o[2])begin
                        router_table_os_we <= {openmips_mem_sel_o, 4'b0000};
                    end else begin
                        router_table_os_we <= {4'b0000,openmips_mem_sel_o};
                    end
                end else begin
                    if(openmips_mem_addr_o[2])begin
                        router_table_os_we <= 8'b00000000;
                        openmips_mem_data_i <= router_table_os_dout[63:32];
                    end else begin
                        router_table_os_we <= 8'b00000000;
                        openmips_mem_data_i <= router_table_os_dout[31:0];
                    end
                end
            end else if(openmips_mem_router_port_ce_o) begin
                router_table_os_port_en <= 1'b1;
                router_table_os_port_addr <= openmips_mem_addr_o[13:2];
                if(openmips_mem_we_o) begin
                    router_table_os_port_we <= openmips_mem_sel_o;
                end else begin
                    openmips_mem_data_i<= router_table_os_port_dout;
                    router_table_os_port_we <= 4'b0000;
                end
            end
        end else if (openmips_if_ce_o) begin
            if (openmips_if_sram_ce_o) begin
                if (openmips_if_addr_o[22] == 1'b0) begin
                    base_ram_addr <= openmips_if_addr_o[21:2];
                    base_ram_be_n <= 4'b0000;
                    base_ram_ce_n <= 1'b0;
                    base_ram_oe_n <= 1'b0;
                    base_ram_we_n <= 1'b1;
                    openmips_if_data_i <= base_ram_data;
                end else if (openmips_if_addr_o[22] == 1'b1) begin
                    ext_ram_addr <= openmips_if_addr_o[21:2];
                    ext_ram_be_n <= 4'b0000;
                    ext_ram_ce_n <= 1'b0;
                    ext_ram_oe_n <= 1'b0;
                    ext_ram_we_n <= 1'b1;
                    openmips_if_data_i <= ext_ram_data;
                end
            end else if (openmips_if_flash_ce_o) begin
                flash_a <= openmips_if_addr_o[23:1];
                flash_rp_n <= 1'b1;
                flash_oe_n <= 1'b0;
                flash_ce_n <= 1'b0;
                flash_byte_n <= 1'b1;
                flash_we_n <= 1'b1;
                openmips_if_data_i <= { 16'b0, flash_d };
            end else if (openmips_if_serial_ce_o) begin
                if (openmips_if_addr_o[3:0] == 4'hc) begin
                    openmips_if_data_i <= { 30'b0, uart_dataready, uart_tbre&uart_tsre }; // <TODO>
                end else if (openmips_if_addr_o[3:0] == 4'h8) begin
                    uart_re_o <= 1'b0;
                    openmips_if_data_i <= {24'b0, base_ram_data[7:0]};
                    //already_read_status <= serial_read_status;
                    //openmips_if_data_i <= { 24'b0, serial_read_data };
                end
            end else if (openmips_if_rom_ce_o) begin
                rom_addr <= openmips_if_addr_o[13:2];
                rom_ce <= 1'b1;
                openmips_if_data_i <= rom_data;
            end
        end
    end
end

endmodule