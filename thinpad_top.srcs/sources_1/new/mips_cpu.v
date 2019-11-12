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

wire[31:0] mem_wdata_i;
wire[4:0] mem_wd_i;
wire mem_wreg_i;

wire[31:0] mem_wdata_o;
wire[4:0] mem_wd_o;
wire mem_wreg_o;

inst_fetch inst_fetch_inst(
    .clk(clk),
    .rst(rst),
    .pc(base_ram_addr),
    .ce(base_ram_ce_n)
);

if_id if_id_inst(
    .clk(clk),
    .rst(rst),
    .if_pc(base_ram_addr),
    .if_inst(base_ram_data),
    .id_pc(id_pc),
    .id_inst(id_inst)
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
    .mem_wd(mem_wd_o)
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
    .ex_wreg(ex_wreg_i)      
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
    .wd_o(ex_wd_o)
);


ex_mem ex_mem_inst(
    .rst(rst),
    .clk(clk),
    .ex_wreg(ex_wreg_o),
    .ex_wdata(ex_wdata),
    .ex_wd(ex_wd_o),
    
    .mem_wd(mem_wd_i),
    .mem_wreg(mem_wreg_i),
    .mem_wdata(mem_wdata_i)
);

memory memory_inst(
    .rst(rst),
    .wdata_i(mem_wdata_i),
    .wreg_i(mem_wreg_i),
    .wd_i(mem_wd_i),

    .wdata_o(mem_wdata_o),
    .wreg_o(mem_wreg_o),
    .wd_o(mem_wd_o)
);

mem_wb mem_wb_inst(
    .rst(rst),
    .clk(clk),
    .mem_wd(mem_wd_o),
    .mem_wdata(mem_wdata_o),
    .mem_wreg(mem_wreg_o),

    .wb_wd(wb_addr),
    .wb_wreg(wb_we),
    .wb_wdata(wb_wdata)
);

endmodule
