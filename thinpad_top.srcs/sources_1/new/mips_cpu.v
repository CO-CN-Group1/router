`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/11 12:14:49
// Design Name: 
// Module Name: mips_cpu
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


module mips_cpu(
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
    output wire ext_ram_we_n
);


assign base_ram_oe_n = 0;
assign base_ram_we_n = 1;
assign base_ram_be_n = 0;
assign ext_ram_ce_n = 1;
assign ext_ram_addr =0;
assign ext_ram_be_n = 15;
assign ext_ram_oe_n = 1;
assign ext_ram_we_n = 1;


wire[19:0] id_pc;
wire[31:0] id_inst;

wire[31:0] regs_data1,regs_data2;
wire[4:0] regs_addr1,regs_addr2;
wire regs_re1,regs_re2;
wire[7:0] id_aluop;
wire[2:0] id_alusel;
wire[31:0] id_reg1,id_reg2;
wire[4:0] id_wd;
wire id_wreg;

wire wb_we;
wire[4:0] wb_addr;
wire[31:0] wb_wdata;

wire[7:0] ex_aluop;
wire[2:0] ex_alusel;
wire[31:0] ex_reg1,ex_reg2;
wire[4:0] ex_wd_i;
wire ex_wreg_i; 

wire[31:0] ex_wdata;
wire[4:0] ex_wd_o;
wire ex_wreg_o;

wire[31:0] ex_hi_o;
wire[31:0] ex_lo_o;
wire ex_hilo_we_o;


wire[31:0] mem_wdata_i;
wire[4:0] mem_wd_i;
wire mem_wreg_i;
wire[31:0] mem_hi_i;
wire[31:0] mem_lo_i;
wire mem_hilo_we_i;

wire[31:0] mem_wdata_o;
wire[4:0] mem_wd_o;
wire mem_wreg_o;
wire[31:0] mem_hi_o;
wire[31:0] mem_lo_o;
wire mem_hilo_we_o;

wire[31:0] hi_i;
wire[31:0] hi_o;
wire[31:0] lo_i;
wire[31:0] lo_o;
wire hilo_we;

wire[0:5] stop;
wire stop_from_id,stop_from_ex;

wire[63:0] ex_hilo_tmp_i;
wire[1:0] ex_hilo_cnt_i;
wire[63:0] ex_hilo_tmp_o;
wire[1:0] ex_hilo_cnt_o;

wire ex_signed_div;
wire[31:0] ex_div_reg1;
wire[31:0] ex_div_reg2;
wire ex_div_start;
wire[63:0] ex_div_ans;
wire ex_div_finish;


ctrl ctrl_inst(
    .rst(rst),
    .stop_from_id(stop_from_id),
    .stop_from_ex(stop_from_ex),
    .stop(stop)
);



inst_fetch inst_fetch_inst(
    .clk(clk),
    .rst(rst),
    .pc(base_ram_addr),
    .ce(base_ram_ce_n),
    .stop(stop[0])
);

if_id if_id_inst(
    .clk(clk),
    .rst(rst),
    .if_pc(base_ram_addr),
    .if_inst(base_ram_data),
    .id_pc(id_pc),
    .id_inst(id_inst),
    .stop(stop[1:2])
);

inst_decode inst_decode_inst(
    .rst(rst),
    .pc(id_pc),
    .inst(id_inst),
    .regs_data1(regs_data1),
    .regs_data2(regs_data2),
    .regs_addr1(regs_addr1),
    .regs_addr2(regs_addr2),
    .regs_re1(regs_re1),
    .regs_re2(regs_re2),
    .aluop(id_aluop),
	.alusel(id_alusel),
    .reg1(id_reg1),
    .reg2(id_reg2),
    .wd(id_wd),
    .wreg(id_wreg),
    .ex_wreg(ex_wreg_o),
    .ex_wdata(ex_wdata),
    .ex_wd(ex_wd_o),
    .mem_wreg(mem_wreg_o),
    .mem_wdata(mem_wdata_o),
    .mem_wd(mem_wd_o),
    .stop(stop_from_id)
);

regs regs_inst(
    .rst(rst),
    .clk(clk),
    .we(wb_we),
    .waddr(wb_addr),
    .wdata(wb_wdata),
    .re1(regs_re1),
    .re2(regs_re2),
    .raddr1(regs_addr1),
    .raddr2(regs_addr2),
    .rdata1(regs_data1),
    .rdata2(regs_data2)
);

id_ex id_ex_inst(
    .clk(clk),
    .rst(rst),
    .id_aluop(id_aluop),
    .id_alusel(id_alusel),
    .id_reg1(id_reg1),
    .id_reg2(id_reg2),
    .id_wd(id_wd),
    .id_wreg(id_wreg),

    .ex_aluop(ex_aluop),
    .ex_alusel(ex_alusel),
    .ex_reg1(ex_reg1),
    .ex_reg2(ex_reg2),
    .ex_wd(ex_wd_i),
    .ex_wreg(ex_wreg_i),
    .stop(stop[2:3])  
);




exe exe_inst(
    .rst(rst),
    .aluop(ex_aluop),
    .alusel(ex_alusel),
    .reg1(ex_reg1),
    .reg2(ex_reg2),
    .wd_i(ex_wd_i),
    .wreg_i(ex_wreg_i),
    .wdata(ex_wdata),
    .wreg_o(ex_wreg_o),
    .wd_o(ex_wd_o),

    .mem_hi(mem_hi_o),
    .mem_lo(mem_lo_o),
    .mem_hilo_we(mem_hilo_we_o),
    .wb_hi(hi_i),
    .wb_lo(lo_i),
    .wb_hilo_we(hilo_we),

    .hi_i(hi_o),
    .lo_i(lo_o),

    .hilo_we(ex_hilo_we_o),
    .hi_o(ex_hi_o),
    .lo_o(ex_lo_o),
    .stop(stop_from_ex),
    .hilo_tmp_i(ex_hilo_tmp_i),
    .hilo_tmp_o(ex_hilo_tmp_o),
    .hilo_cnt_i(ex_hilo_cnt_i),
    .hilo_cnt_o(ex_hilo_cnt_o),
    .signed_div(ex_signed_div),
    .div_reg1(ex_div_reg1),
    .div_reg2(ex_div_reg2),
    .div_start(ex_div_start),
    .div_ans(ex_div_ans),
    .div_finish(ex_div_finish)
);

divide divie_inst(
    .clk(clk),
    .rst(rst),
    .signed_div(ex_signed_div),
    .reg1(ex_div_reg1),
    .reg2(ex_div_reg2),
    .start(ex_div_start),
    .stop(0),
    .ans(ex_div_ans),
    .finish(ex_div_finish)
);



regs_hilo regs_hilo_inst(
    .clk(clk),
    .rst(rst),
    .we(hilo_we),
    .hi_i(hi_i),
    .hi_o(hi_o),
    .lo_i(lo_i),
    .lo_o(lo_o)
);


ex_mem ex_mem_inst(
    .rst(rst),
    .clk(clk),
    .ex_wreg(ex_wreg_o),
    .ex_wdata(ex_wdata),
    .ex_wd(ex_wd_o),
    .ex_hi(ex_hi_o),
    .ex_lo(ex_lo_o),
    .ex_hilo_we(ex_hilo_we_o),


    .mem_wd(mem_wd_i),
    .mem_wreg(mem_wreg_i),
    .mem_wdata(mem_wdata_i),
    .mem_hi(mem_hi_i),
    .mem_lo(mem_lo_i),
    .mem_hilo_we(mem_hilo_we_i),
    .stop(stop[3:4]),
    .hilo_cnt_i(ex_hilo_cnt_o),
    .hilo_cnt_o(ex_hilo_cnt_i),
    .hilo_tmp_i(ex_hilo_tmp_o),
    .hilo_tmp_o(ex_hilo_tmp_i)
);

memory memory_inst(
    .rst(rst),
    .wdata_i(mem_wdata_i),
    .wreg_i(mem_wreg_i),
    .wd_i(mem_wd_i),
    .hi_i(mem_hi_i),
    .lo_i(mem_lo_i),
    .hilo_we_i(mem_hilo_we_i),


    .wdata_o(mem_wdata_o),
    .wreg_o(mem_wreg_o),
    .wd_o(mem_wd_o),
    .hi_o(mem_hi_o),
    .lo_o(mem_lo_o),
    .hilo_we_o(mem_hilo_we_o)

);

mem_wb mem_wb_inst(
    .rst(rst),
    .clk(clk),
    .mem_wd(mem_wd_o),
    .mem_wdata(mem_wdata_o),
    .mem_wreg(mem_wreg_o),
    .mem_hi(mem_hi_o),
    .mem_lo(mem_lo_o),
    .mem_hilo_we(mem_hilo_we_o),
    .wb_wd(wb_addr),
    .wb_wreg(wb_we),
    .wb_wdata(wb_wdata),
    .wb_hi(hi_i),
    .wb_lo(lo_i),
    .wb_hilo_we(hilo_we),
    .stop(stop[4:5])
);

endmodule
