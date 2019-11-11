`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/11 10:54:49
// Design Name: 
// Module Name: mips_tb
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

module mips_tb;

wire clk_50M, clk_11M0592, clk_125M, clk_125M_90deg;

wire[31:0] base_ram_data; //BaseRAM数据，低8位与CPLD串口控制器共�?
wire[19:0] base_ram_addr; //BaseRAM地址
wire[3:0] base_ram_be_n;  //BaseRAM字节使能，低有效。如果不使用字节使能，请保持�?0
wire base_ram_ce_n;       //BaseRAM片�?�，低有�?
wire base_ram_oe_n;       //BaseRAM读使能，低有�?
wire base_ram_we_n;       //BaseRAM写使能，低有�?
reg rst,print;



wire[31:0] ext_ram_data; //ExtRAM数据
wire[19:0] ext_ram_addr; //ExtRAM地址
wire[3:0] ext_ram_be_n;  //ExtRAM字节使能，低有效。如果不使用字节使能，请保持�?0
wire ext_ram_ce_n;       //ExtRAM片�?�，低有�?
wire ext_ram_oe_n;       //ExtRAM读使能，低有�?
wire ext_ram_we_n;       //ExtRAM写使能，低有�?



// 时钟�?
clock osc(
    .clk_11M0592   (clk_11M0592),
    .clk_50M       (clk_50M),
    .clk_125M      (clk_125M),
    .clk_125M_90deg(clk_125M_90deg)
);


mips_sopc mips_sopc(
    .clk(clk_50M),
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
    .ext_ram_we_n(ext_ram_we_n)
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
sram_model ext1(
            .DataIO(ext_ram_data[15:0]),
            .Address(ext_ram_addr[19:0]),
            .OE_n(ext_ram_oe_n),
            .CE_n(ext_ram_ce_n),
            .WE_n(ext_ram_we_n),
            .LB_n(ext_ram_be_n[0]),
            .UB_n(ext_ram_be_n[1]));
sram_model ext2(
            .DataIO(ext_ram_data[31:16]),
            .Address(ext_ram_addr[19:0]),
            .OE_n(ext_ram_oe_n),
            .CE_n(ext_ram_ce_n),
            .WE_n(ext_ram_we_n),
            .LB_n(ext_ram_be_n[2]),
            .UB_n(ext_ram_be_n[3]));

//Windows�?要注意路径分隔符的转义，例如"D:\\foo\\bar.bin"
parameter BASE_RAM_INIT_FILE = "base_ram_init.mem"; //BaseRAM初始化文件，请修改为实际的绝对路�?
parameter EXT_RAM_INIT_FILE = "/tmp/eram.bin";    //ExtRAM初始化文件，请修改为实际的绝对路�?
integer count;
// 从文件加�? BaseRAM
initial begin 
    reg [31:0] tmp_array[0:1048575];
    integer n_File_ID;
    n_File_ID = $fopen(BASE_RAM_INIT_FILE, "r");
    count = 0;
    while(!$feof(n_File_ID))begin
        $fscanf(n_File_ID,"%8h",tmp_array[count]);       
        count +=1;
    end
    $fclose(n_File_ID);
    for (integer i = 0; i < count; i++) begin
        base1.mem_array0[i] = tmp_array[i][7:0];
        base1.mem_array1[i] = tmp_array[i][15:8];
        base2.mem_array0[i] = tmp_array[i][23:16];
        base2.mem_array1[i] = tmp_array[i][31:24];
        $display("%4h",{base2.mem_array1[i],base2.mem_array0[i],base1.mem_array1[i],base1.mem_array0[i]});
    end
end

// 从文件加�? ExtRAM
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

initial begin
    rst = 1;
    print = 0;
    #200 rst = 0;
    #1000 print = 1;
    $stop;
end 

localparam BUFFER_SIZE = 32;
integer cpu_data_fd; 
always @(posedge print)begin
    cpu_data_fd = $fopen("cpu_data.mem","w");
    for(integer i=0;i<BUFFER_SIZE;i++)begin
        $fwrite(cpu_data_fd,"%04h\n",base1.mem_array0[i],base1.mem_array1[i],base2.mem_array0[i],base2.mem_array1[i]);
    end
    $fclose(cpu_data_fd);
end
endmodule
