`timescale 1ns / 1ps
module tb;

wire clk_50M, clk_11M0592, clk_125M, clk_125M_90deg;

reg clock_btn = 0;         //BTN5手动时钟按钮开关，带消抖电路，按下时为1
reg reset_btn = 0;         //BTN6手动复位按钮开关，带消抖电路，按下时为1

reg[3:0]  touch_btn;  //BTN1~BTN4，按钮开关，按下时为1
reg[31:0] dip_sw;     //32位拨码开关，拨到“ON”时为1

wire[15:0] leds;       //16位LED，输出时1点亮
wire[7:0]  dpy0;       //数码管低位信号，包括小数点，输出1点亮
wire[7:0]  dpy1;       //数码管高位信号，包括小数点，输出1点亮

wire txd;  //直连串口发送端
wire rxd;  //直连串口接收端

wire[31:0] base_ram_data; //BaseRAM数据，低8位与CPLD串口控制器共享
wire[19:0] base_ram_addr; //BaseRAM地址
wire[3:0] base_ram_be_n;  //BaseRAM字节使能，低有效。如果不使用字节使能，请保持为0
wire base_ram_ce_n;       //BaseRAM片选，低有效
wire base_ram_oe_n;       //BaseRAM读使能，低有效
wire base_ram_we_n;       //BaseRAM写使能，低有效

wire[31:0] ext_ram_data; //ExtRAM数据
wire[19:0] ext_ram_addr; //ExtRAM地址
wire[3:0] ext_ram_be_n;  //ExtRAM字节使能，低有效。如果不使用字节使能，请保持为0
wire ext_ram_ce_n;       //ExtRAM片选，低有效
wire ext_ram_oe_n;       //ExtRAM读使能，低有效
wire ext_ram_we_n;       //ExtRAM写使能，低有效

wire [22:0]flash_a;      //Flash地址，a0仅在8bit模式有效，16bit模式无意义
wire [15:0]flash_d;      //Flash数据
wire flash_rp_n;         //Flash复位信号，低有效
wire flash_vpen;         //Flash写保护信号，低电平时不能擦除、烧写
wire flash_ce_n;         //Flash片选信号，低有效
wire flash_oe_n;         //Flash读使能信号，低有效
wire flash_we_n;         //Flash写使能信号，低有效
wire flash_byte_n;       //Flash 8bit模式选择，低有效。在使用flash的16位模式时请设为1

wire uart_rdn;           //读串口信号，低有效
wire uart_wrn;           //写串口信号，低有效
wire uart_dataready;     //串口数据准备好
wire uart_tbre;          //发送数据标志
wire uart_tsre;          //数据发送完毕标志

wire [3:0] eth_rgmii_rd; //RGMII RX 数据
wire eth_rgmii_rx_ctl;   //RGMII RX 控制
wire eth_rgmii_rxc;      //RGMII RX 时钟

wire [3:0] eth_rgmii_td; //RGMII TX 数据
wire eth_rgmii_tx_ctl;   //RGMII TX 控制
wire eth_rgmii_txc;      //RGMII TX 时钟

//Windows需要注意路径分隔符的转义，例如"D:\\foo\\bar.bin"
parameter BASE_RAM_INIT_FILE = "/tmp/main.bin"; //BaseRAM初始化文件，请修改为实际的绝对路径
parameter EXT_RAM_INIT_FILE = "/tmp/eram.bin";    //ExtRAM初始化文件，请修改为实际的绝对路径
parameter FLASH_INIT_FILE = "/tmp/kernel.elf";    //Flash初始化文件，请修改为实际的绝对路径
parameter STATIC_ROUTER_TABLE = "static_router_table.mem";
parameter ROUTING_TABLE_RESULT = "routing_result.mem";
parameter STATIC_ARP_TABLE = "static_arp_table.mem";
parameter ARP_TABLE_RESULT = "arp_result.mem";

assign rxd = 1'b1; //idle state

initial begin 
    //在这里可以自定义测试输入序列，例如：
    dip_sw = 32'h2;
    touch_btn = 0;
    for (integer i = 0; i < 20; i = i+1) begin
        #100; //等待100ns
        clock_btn = 1; //按下手工时钟按钮
        #100; //等待100ns
        clock_btn = 0; //松开手工时钟按钮
    end
    // 模拟PC通过串口发送字符
    cpld.pc_send_byte(8'h32);
    #10000;
    cpld.pc_send_byte(8'h33);
end

// 待测试用户设计
thinpad_top dut(
    .clk_50M(clk_50M),
    .clk_11M0592(clk_11M0592),
    .clock_btn(clock_btn),
    .reset_btn(reset_btn),
    .touch_btn(touch_btn),
    .dip_sw(dip_sw),
    .leds(leds),
    .dpy1(dpy1),
    .dpy0(dpy0),
    .txd(txd),
    .rxd(rxd),
    .uart_rdn(uart_rdn),
    .uart_wrn(uart_wrn),
    .uart_dataready(uart_dataready),
    .uart_tbre(uart_tbre),
    .uart_tsre(uart_tsre),
    .base_ram_data(base_ram_data),
    .base_ram_addr(base_ram_addr),
    .base_ram_ce_n(base_ram_ce_n),
    .base_ram_oe_n(base_ram_oe_n),
    .base_ram_we_n(base_ram_we_n),
    .base_ram_be_n(base_ram_be_n),
    .ext_ram_data(ext_ram_data),
    .ext_ram_addr(ext_ram_addr),
    .ext_ram_ce_n(ext_ram_ce_n),
    .ext_ram_oe_n(ext_ram_oe_n),
    .ext_ram_we_n(ext_ram_we_n),
    .ext_ram_be_n(ext_ram_be_n),
    .flash_d(flash_d),
    .flash_a(flash_a),
    .flash_rp_n(flash_rp_n),
    .flash_vpen(flash_vpen),
    .flash_oe_n(flash_oe_n),
    .flash_ce_n(flash_ce_n),
    .flash_byte_n(flash_byte_n),
    .flash_we_n(flash_we_n),
    .eth_rgmii_rd(eth_rgmii_rd),
    .eth_rgmii_rx_ctl(eth_rgmii_rx_ctl),
    .eth_rgmii_rxc(eth_rgmii_rxc),
    .eth_rgmii_td(eth_rgmii_td),
    .eth_rgmii_tx_ctl(eth_rgmii_tx_ctl),
    .eth_rgmii_txc(eth_rgmii_txc)
);
// 时钟源
clock osc(
    .clk_11M0592   (clk_11M0592),
    .clk_50M       (clk_50M),
    .clk_125M      (clk_125M),
    .clk_125M_90deg(clk_125M_90deg)
);
// CPLD 串口仿真模型
cpld_model cpld(
    .clk_uart(clk_11M0592),
    .uart_rdn(uart_rdn),
    .uart_wrn(uart_wrn),
    .uart_dataready(uart_dataready),
    .uart_tbre(uart_tbre),
    .uart_tsre(uart_tsre),
    .data(base_ram_data[7:0])
);
// BaseRAM 仿真模型
sram_model base1(/*autoinst*/
            .DataIO(base_ram_data[15:0]),
            .Address(base_ram_addr[19:0]),
            .OE_n(base_ram_oe_n),
            .CE_n(base_ram_ce_n),
            .WE_n(base_ram_we_n),
            .LB_n(base_ram_be_n[0]),
            .UB_n(base_ram_be_n[1]));
sram_model base2(/*autoinst*/
            .DataIO(base_ram_data[31:16]),
            .Address(base_ram_addr[19:0]),
            .OE_n(base_ram_oe_n),
            .CE_n(base_ram_ce_n),
            .WE_n(base_ram_we_n),
            .LB_n(base_ram_be_n[2]),
            .UB_n(base_ram_be_n[3]));
// ExtRAM 仿真模型
sram_model ext1(/*autoinst*/
            .DataIO(ext_ram_data[15:0]),
            .Address(ext_ram_addr[19:0]),
            .OE_n(ext_ram_oe_n),
            .CE_n(ext_ram_ce_n),
            .WE_n(ext_ram_we_n),
            .LB_n(ext_ram_be_n[0]),
            .UB_n(ext_ram_be_n[1]));
sram_model ext2(/*autoinst*/
            .DataIO(ext_ram_data[31:16]),
            .Address(ext_ram_addr[19:0]),
            .OE_n(ext_ram_oe_n),
            .CE_n(ext_ram_ce_n),
            .WE_n(ext_ram_we_n),
            .LB_n(ext_ram_be_n[2]),
            .UB_n(ext_ram_be_n[3]));
// Flash 仿真模型
x28fxxxp30 #(.FILENAME_MEM(FLASH_INIT_FILE)) flash(
    .A(flash_a[1+:22]), 
    .DQ(flash_d), 
    .W_N(flash_we_n),    // Write Enable 
    .G_N(flash_oe_n),    // Output Enable
    .E_N(flash_ce_n),    // Chip Enable
    .L_N(1'b0),    // Latch Enable
    .K(1'b0),      // Clock
    .WP_N(flash_vpen),   // Write Protect
    .RP_N(flash_rp_n),   // Reset/Power-Down
    .VDD('d3300), 
    .VDDQ('d3300), 
    .VPP('d1800), 
    .Info(1'b1));

initial begin 
    wait(flash_byte_n == 1'b0);
    $display("8-bit Flash interface is not supported in simulation!");
    $display("Please tie flash_byte_n to high");
    $stop;
end

// 从文件加载 BaseRAM
initial begin 
    reg [31:0] tmp_array[0:1048575];
    integer n_File_ID, n_Init_Size;
    n_File_ID = $fopen(BASE_RAM_INIT_FILE, "rb");
    if(!n_File_ID)begin 
        n_Init_Size = 0;
        $display("Failed to open BaseRAM init file");
    end else begin
        n_Init_Size = $fread(tmp_array, n_File_ID);
        n_Init_Size /= 4;
        $fclose(n_File_ID);
    end
    $display("BaseRAM Init Size(words): %d",n_Init_Size);
    for (integer i = 0; i < n_Init_Size; i++) begin
        base1.mem_array0[i] = tmp_array[i][24+:8];
        base1.mem_array1[i] = tmp_array[i][16+:8];
        base2.mem_array0[i] = tmp_array[i][8+:8];
        base2.mem_array1[i] = tmp_array[i][0+:8];
    end
end

// 从文件加载 ExtRAM
initial begin 
    reg [31:0] tmp_array[0:1048575];
    integer n_File_ID, n_Init_Size;
    n_File_ID = $fopen(EXT_RAM_INIT_FILE, "rb");
    if(!n_File_ID)begin 
        n_Init_Size = 0;
        $display("Failed to open ExtRAM init file");
    end else begin
        n_Init_Size = $fread(tmp_array, n_File_ID);
        n_Init_Size /= 4;
        $fclose(n_File_ID);
    end
    $display("ExtRAM Init Size(words): %d",n_Init_Size);
    for (integer i = 0; i < n_Init_Size; i++) begin
        ext1.mem_array0[i] = tmp_array[i][24+:8];
        ext1.mem_array1[i] = tmp_array[i][16+:8];
        ext2.mem_array0[i] = tmp_array[i][8+:8];
        ext2.mem_array1[i] = tmp_array[i][0+:8];
    end
end

// RGMII 仿真模型

rgmii_model rgmii(
    .clk_125M(clk_125M),
    .clk_125M_90deg(clk_125M_90deg),

    .rgmii_rd(eth_rgmii_rd),
    .rgmii_rxc(eth_rgmii_rxc),
    .rgmii_rx_ctl(eth_rgmii_rx_ctl)
);

//RGMII 输出打印到文件

localparam integer FRAME_SAVE_MAX = 3;

rgmii_tx_printer #(
    .FRAME_SAVE_MAX(FRAME_SAVE_MAX)
)rgmii_printer(
    .rgmii_td(eth_rgmii_td),
    .rgmii_tx_ctl(eth_rgmii_tx_ctl),
    .rgmii_txc(eth_rgmii_txc)
);


//加载trie树
logic[7:0] data[0:9][0:30];
logic[1000*8-1:0]buffer;
integer fd = 0;
integer index = 0;
integer table_count = 0,res = 0;
logic son;
integer current;
logic[31:0] addr;
logic[31:0] mask;
logic[31:0] nexthop;
logic[7:0] port;
integer length;
integer n;
initial begin
    fd = $fopen(STATIC_ROUTER_TABLE,"r");
    while (!$feof(fd))begin
        res = $fscanf(fd, "%x", data[table_count][index]);
        if (res != 1) begin
            // end of a frame
            // read a line
            $fgets(buffer, fd);
            if (index > 0) begin
                table_count = table_count + 1;
            end
            index = 0;
        end else begin
            index = index + 1;
        end
    end
    if (index > 0) begin
        table_count = table_count + 1;
    end
    for(integer i=0;i<=table_count*32;i++)begin
        dut.lookup_inst.routing_table_inst.trie[i][0] = 0;
        dut.lookup_inst.routing_table_inst.trie[i][1] = 0;
    end
    n = 1;
    $display("table_count = %d",table_count);
    for(integer i=0;i<table_count;i++)begin
        addr = {data[i][0],data[i][1],data[i][2],data[i][3]};
        mask = {data[i][4],data[i][5],data[i][6],data[i][7]};
        nexthop = {data[i][8],data[i][9],data[i][10],data[i][11]};
        port = data[i][12];
        $display("addr = %h%h %h%h %h%h %h%h mask = %h%h %h%h %h%h %h%h nexthop = %h%h %h%h %h%h %h%h port = %h%h",addr[31:28],addr[27:24],addr[23:20],addr[19:16],addr[15:12],addr[11:8],addr[7:4],addr[3:0],mask[31:28],mask[27:24],mask[23:20],mask[19:16],mask[15:12],mask[11:8],mask[7:4],mask[3:0],nexthop[31:28],nexthop[27:24],nexthop[23:20],nexthop[19:16],nexthop[15:12],nexthop[11:8],nexthop[7:4],nexthop[3:0],port[7:4],port[3:0]);
        current = 1;
        for(integer j=31;j>=0;j--)begin
            if(mask[j]==0)
                break;
            son = addr[j];
            if(dut.lookup_inst.routing_table_inst.trie[current][son]==0)begin
                dut.lookup_inst.routing_table_inst.trie[current][son] = ++n;
                current = n;
            end else
                current = dut.lookup_inst.routing_table_inst.trie[current][son];
        end
        dut.lookup_inst.routing_table_inst.data_entry[current] = {data[i][8],data[i][9],data[i][10],data[i][11],data[i][12]};
    end

    fd = $fopen(ROUTING_TABLE_RESULT,"w");
end

reg[31:0] dest_ip;
integer cnt = 0;
always @(posedge dut.lookup_inst.routing_table_inst.nexthop_valid)begin
    if(cnt<FRAME_SAVE_MAX)begin
        dest_ip = dut.lookup_inst.routing_table_inst.dest_ip_cache;
        nexthop = dut.lookup_inst.routing_table_inst.nexthop;
        port = dut.lookup_inst.routing_table_inst.port;
        if(dut.lookup_inst.routing_table_inst.nexthop_not_found)
            $fwrite(fd,"dest_ip = %02h %02h %02h %02h nexthop,port = NOTFOUND",dest_ip[31:24],dest_ip[23:16],dest_ip[15:8],dest_ip[7:0]);
        else
            $fwrite(fd,"dest_ip = %02h %02h %02h %02h nexthop,port = %02h %02h %02h %02h : %02h",dest_ip[31:24],dest_ip[23:16],dest_ip[15:8],dest_ip[7:0],nexthop[31:24],nexthop[23:16],nexthop[15:8],nexthop[7:0],port);
        $fwrite(fd,"\n");
        cnt = cnt + 1;
        if(cnt==FRAME_SAVE_MAX)
            $fclose(fd);
    end
end

reg[47:0] mac;
integer index2=0;
integer fd2;
initial begin
    index = 0;
    table_count = 0;
    fd = $fopen(STATIC_ARP_TABLE,"r");
    while (!$feof(fd))begin
        res = $fscanf(fd, "%x", data[table_count][index]);
        if (res != 1) begin
            // end of a frame
            // read a line
            $fgets(buffer, fd);
            if (index > 0) begin
                table_count = table_count + 1;
            end
            index = 0;
        end else begin
            index = index + 1;
        end
    end
    if (index > 0) begin
        table_count = table_count + 1;
    end
    for(integer i=0;i<=7;i++)begin
        dut.lookup_inst.arp_table_inst.bucket_depth[i] = 0;
        dut.lookup_inst.arp_table_inst.bucket_ins_pos[i] = 0;
    end
    n = 1;
    $display("arp_table_count = %d",table_count);
    for(integer i=0;i<table_count;i++)begin
        addr = {data[i][0],data[i][1],data[i][2],data[i][3]};
        mac = {data[i][4],data[i][5],data[i][6],data[i][7],data[i][8],data[i][9]};
        port = data[i][10];
        $display("addr = %h%h %h%h %h%h %h%h mac = %h%h %h%h %h%h %h%h %h%h %h%h port = %h%h",addr[31:28],addr[27:24],addr[23:20],addr[19:16],addr[15:12],addr[11:8],addr[7:4],addr[3:0],mac[47:44],mac[43:40],mac[39:36],mac[35:32],mac[31:28],mac[27:24],mac[23:20],mac[19:16],mac[15:12],mac[11:8],mac[7:4],mac[3:0],port[7:4],port[3:0]);
        index = addr[31:29];
        index2 = dut.lookup_inst.arp_table_inst.bucket_ins_pos[index];
        dut.lookup_inst.arp_table_inst.data_entry[index][index2] = {addr,mac,port};
        dut.lookup_inst.arp_table_inst.bucket_ins_pos[index] = index2 + 1;
        dut.lookup_inst.arp_table_inst.bucket_depth[index] = index2 + 1;
        $display("data_entry: %22h %22h",dut.lookup_inst.arp_table_inst.data_entry[index][index2],{addr,mac,port});
    end
    
    fd2 = $fopen(ARP_TABLE_RESULT,"w");
end

integer arp_cnt = 0;
reg[31:0] dip;
reg[7:0] pt;
always @(posedge dut.lookup_inst.arp_table_inst.lookup_mac_valid)begin
    if(arp_cnt<FRAME_SAVE_MAX)begin
        dip = dut.lookup_inst.arp_table_inst.lookup_ip_cache;
        mac = dut.lookup_inst.arp_table_inst.lookup_mac;
        pt = dut.lookup_inst.arp_table_inst.lookup_port;
        if(dut.lookup_inst.arp_table_inst.lookup_mac_not_found)
            $fwrite(fd2,"dest_ip = %02h %02h %02h %02h mac,port = NOTFOUND",dip[31:24],dip[23:16],dip[15:8],dip[7:0]);
        else
            $fwrite(fd2,"dest_ip = %02h %02h %02h %02h mac,port = %02h %02h %02h %02h %02h %02h: %02h",dip[31:24],dip[23:16],dip[15:8],dip[7:0],mac[47:40],mac[39:32],mac[31:24],mac[23:16],mac[15:8],mac[7:0],pt);
        $fwrite(fd2,"\n");
        arp_cnt = arp_cnt + 1;
        if(arp_cnt==FRAME_SAVE_MAX)
            $fclose(fd2);
    end
end

endmodule
