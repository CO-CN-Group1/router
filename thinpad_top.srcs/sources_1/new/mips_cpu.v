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
    output wire ext_ram_we_n,

    input wire[5:0] int_i,
    output wire timer_int_o
);


assign base_ram_oe_n = 0;
assign base_ram_we_n = 1;
assign base_ram_be_n = 0;



wire[19:0] pc;


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

wire id_in_delayslot_o;
wire id_in_delayslot_i;
wire[31:0] id_link_addr;
wire id_next_in_delayslot;
wire[31:0] id_branch_addr;
wire id_branch_we;

wire ex_in_delayslot_i;
wire ex_in_delayslot_o;
wire[31:0] ex_link_addr;

wire mem_in_delayslot_i;
wire mem_in_delayslot_o;



wire[31:0] id_inst_o;
wire[31:0] ex_inst;

wire[7:0] ex_aluop_o;
wire[31:0] ex_load_store_addr;
wire[31:0] ex_load_store_data;

wire[7:0] mem_aluop;
wire[31:0] mem_load_store_addr;
wire[31:0] mem_load_store_data;

wire mem_cp0_reg_we_i;
wire[4:0] mem_cp0_reg_write_addr_i;
wire[31:0] mem_cp0_reg_data_i;


wire mem_cp0_reg_we_o;
wire[4:0] mem_cp0_reg_write_addr_o;
wire[31:0] mem_cp0_reg_data_o;

wire wb_cp0_reg_we_i;
wire[4:0] wb_cp0_reg_write_addr_i;
wire[31:0] wb_cp0_reg_data_i;

wire[31:0] cp0_data_o;
wire[4:0] cp0_raddr_i;

wire ex_cp0_reg_we_o;
wire[4:0] ex_cp0_reg_write_addr_o;
wire[31:0] ex_cp0_reg_data_o;

wire flush;
wire[31:0] new_pc; 

wire[31:0] id_excepttype_o;
wire[31:0] id_current_inst_address_o;

wire[31:0] ex_excepttype_i;
wire[31:0] ex_current_inst_address_i;

wire[31:0] ex_excepttype_o;
wire[31:0] ex_current_inst_address_o;


wire[31:0] mem_excepttype_i;    
wire[31:0] mem_excepttype_o;
wire[31:0] mem_current_inst_address_i;
wire[31:0] mem_current_inst_address_o;
wire[31:0] wb_excepttype_i;
wire wb_in_delayslot_i;
wire[31:0] wb_current_inst_address_i;


wire[31:0] latest_epc;
wire[31:0] cp0_count;
wire[31:0]cp0_compare;
wire[31:0]cp0_status;
wire[31:0]cp0_cause;
wire[31:0]cp0_epc;
wire[31:0]cp0_config;
wire[31:0]cp0_prid; 


ctrl ctrl_inst(
    .rst(rst),
    .stop_from_id(stop_from_id),
    .stop_from_ex(stop_from_ex),
    .stop(stop),
    .excepttype_i(mem_excepttype_o),
    .cp0_epc_i(latest_epc),
    .flush(flush),
    .new_pc(new_pc)
);



inst_fetch inst_fetch_inst(
    .clk(clk),
    .rst(rst),
    .pc(pc),
    .ce(base_ram_ce_n),
    .stop(stop[0]),
    .branch_addr(id_branch_addr),
    .branch_we(id_branch_we),
    .flush(flush),
    .new_pc(new_pc)
);



pc2addr_debug pc2addr_debug_inst(
    .pc(pc),
    .addr(base_ram_addr)
);


if_id if_id_inst(
    .clk(clk),
    .rst(rst),
    .if_pc(pc),
    .if_inst(base_ram_data),
    .id_pc(id_pc),
    .id_inst(id_inst),
    .stop(stop[1:2]),
    .flush(flush)
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
    .stop(stop_from_id),
    .in_delayslot_i(id_in_delayslot_i),
    .in_delayslot_o(id_in_delayslot_o),
    .branch_addr(id_branch_addr),
    .branch_we(id_branch_we),
    .link_addr(id_link_addr),
    .next_in_delayslot(id_next_in_delayslot),
    .inst_o(id_inst_o),
    .ex_aluop(ex_aluop_o),
    .current_inst_address_o(id_current_inst_address_o),
    .excepttype_o(id_excepttype_o)
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
    .stop(stop[2:3]),
    .id_in_delayslot(id_in_delayslot_o),
    .id_link_addr(id_link_addr),
    .id_next_in_delayslot(id_next_in_delayslot),
    .ex_link_addr(ex_link_addr),
    .ex_in_delayslot(ex_in_delayslot_i),
    .in_delayslot(id_in_delayslot_i),
    .id_inst(id_inst_o),
    .ex_inst(ex_inst),
    .flush(flush),
    .id_excepttype(id_excepttype_o),
    .id_current_inst_address(id_current_inst_address_o),
    .ex_excepttype(ex_excepttype_i),
    .ex_current_inst_address(ex_current_inst_address_i)    
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
    .div_finish(ex_div_finish),
    .link_addr(ex_link_addr),
    .in_delayslot_i(ex_in_delayslot_i),
    .inst(ex_inst),
    .aluop_o(ex_aluop_o),
    .load_store_addr(ex_load_store_addr),
    .load_store_data(ex_load_store_data),
    
    .mem_cp0_reg_we(mem_cp0_reg_we_o),
    .mem_cp0_reg_write_addr(mem_cp0_reg_write_addr_o),
    .mem_cp0_reg_data(mem_cp0_reg_data_o),
    
    .wb_cp0_reg_we(wb_cp0_reg_we_i),
    .wb_cp0_reg_write_addr(wb_cp0_reg_write_addr_i),
    .wb_cp0_reg_data(wb_cp0_reg_data_i),

    .cp0_reg_data_i(cp0_data_o),
    .cp0_reg_read_addr_o(cp0_raddr_i),
    
    .cp0_reg_we_o(ex_cp0_reg_we_o),
    .cp0_reg_write_addr_o(ex_cp0_reg_write_addr_o),
    .cp0_reg_data_o(ex_cp0_reg_data_o),
    .in_delayslot_o(ex_in_delayslot_o),       

    .excepttype_i(ex_excepttype_i),
    .current_inst_address_i(ex_current_inst_address_i),
    .excepttype_o(ex_excepttype_o),
    .current_inst_address_o(ex_current_inst_address_o)
);

divide divie_inst(
    .clk(clk),
    .rst(rst),
    .signed_div(ex_signed_div),
    .reg1(ex_div_reg1),
    .reg2(ex_div_reg2),
    .start(ex_div_start),
    .stop(flush),
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
    .hilo_tmp_o(ex_hilo_tmp_i),
    .ex_aluop(ex_aluop_o),
    .ex_load_store_addr(ex_load_store_addr),
    .ex_load_store_data(ex_load_store_data),
    .mem_aluop(mem_aluop),
    .mem_load_store_data(mem_load_store_data),
    .mem_load_store_addr(mem_load_store_addr),
    
    .ex_in_delayslot(ex_in_delayslot_o),
    .mem_in_delayslot(mem_in_delayslot_i),

    .ex_cp0_reg_we(ex_cp0_reg_we_o),
    .ex_cp0_reg_write_addr(ex_cp0_reg_write_addr_o),
    .ex_cp0_reg_data(ex_cp0_reg_data_o),
    
    .mem_cp0_reg_we(mem_cp0_reg_we_i),
    .mem_cp0_reg_write_addr(mem_cp0_reg_write_addr_i),
    .mem_cp0_reg_data(mem_cp0_reg_data_i),

    .flush(flush),

    .ex_excepttype(ex_excepttype_o),
    .ex_current_inst_address(ex_current_inst_address_o),    

    .mem_excepttype(mem_excepttype_i),
    .mem_current_inst_address(mem_current_inst_address_i)
);

wire[31:0] ram_addr;
wire ram_we;
assign ext_ram_addr = ram_addr[21:2];
assign ext_ram_oe_n = ram_we;
assign ext_ram_we_n = ~ram_we;
wire[31:0] ext_ram_data_in;
wire[31:0] ext_ram_data_out;

assign ext_ram_data_in = ext_ram_data;
assign ext_ram_data = ram_we ? ext_ram_data_out : 32'bz;

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
    .hilo_we_o(mem_hilo_we_o),
    .aluop(mem_aluop),
    .load_store_addr(mem_load_store_addr),
    .load_store_data(mem_load_store_data),
    .ram_addr(ram_addr),
    .ram_be(ext_ram_be_n),
    .ram_ce(ext_ram_ce_n),
    .ram_we(ram_we),
    .ram_data_i(ext_ram_data_in),
    .ram_data_o(ext_ram_data_out),

    .cp0_reg_we_i(mem_cp0_reg_we_i),
    .cp0_reg_write_addr_i(mem_cp0_reg_write_addr_i),
    .cp0_reg_data_i(mem_cp0_reg_data_i),
    .cp0_reg_we_o(mem_cp0_reg_we_o),
    .cp0_reg_write_addr_o(mem_cp0_reg_write_addr_o),
    .cp0_reg_data_o(mem_cp0_reg_data_o),
    .in_delayslot_i(mem_in_delayslot_i),
    .in_delayslot_o(mem_in_delayslot_o),


    .excepttype_i(mem_excepttype_i),
    .current_inst_address_i(mem_current_inst_address_i),    
        
    .cp0_status_i(cp0_status),
    .cp0_cause_i(cp0_cause),
    .cp0_epc_i(cp0_epc),

    .wb_cp0_reg_we(wb_cp0_reg_we_i),
    .wb_cp0_reg_write_addr(wb_cp0_reg_write_addr_i),
    .wb_cp0_reg_data(wb_cp0_reg_data_i),
    .excepttype_o(mem_excepttype_o),
    .cp0_epc_o(latest_epc),
    .current_inst_address_o(mem_current_inst_address_o)            
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
    .stop(stop[4:5]),

    .mem_cp0_reg_we(mem_cp0_reg_we_o),
    .mem_cp0_reg_write_addr(mem_cp0_reg_write_addr_o),
    .mem_cp0_reg_data(mem_cp0_reg_data_o),
    .wb_cp0_reg_we(wb_cp0_reg_we_i),
    .wb_cp0_reg_write_addr(wb_cp0_reg_write_addr_i),
    .wb_cp0_reg_data(wb_cp0_reg_data_i),
    .flush(flush)                
);
cp0_regs cp0_regs_inst(
    .clk(clk),
    .rst(rst),
    
    .we_i(wb_cp0_reg_we_i),
    .waddr_i(wb_cp0_reg_write_addr_i),
    .raddr_i(cp0_raddr_i),
    .data_i(wb_cp0_reg_data_i),
    
    .excepttype_i(mem_excepttype_o),
    .int_i(int_i),
    .current_inst_addr_i(mem_current_inst_address_o),
    .in_delayslot(mem_in_delayslot_o),
    
    .data_o(cp0_data_o),
    .count_o(cp0_count),
    .compare_o(cp0_compare),
    .status_o(cp0_status),
    .cause_o(cp0_cause),
    .epc_o(cp0_epc),
    .config_o(cp0_config),
    .prid_o(cp0_prid),

    .timer_int_o(timer_int_o)
);

endmodule
