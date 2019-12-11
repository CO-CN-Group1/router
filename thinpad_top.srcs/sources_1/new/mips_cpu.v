`include "cpu/defines.v"

module mips_cpu(
    input wire clk,
    input wire rst,

    input wire[5:0] int_i,

    input wire[31:0] if_data_i,
    output wire[31:0] if_addr_o,
    output wire if_sram_ce_o,
    output wire if_flash_ce_o,
    output wire if_rom_ce_o,
    output wire if_serial_ce_o,
    output wire if_vga_ce_o,
    output wire if_ce_o,
    output wire if_sender_mem_ce_o,
    output wire if_receiver_mem_ce_o,

    input wire[31:0] mem_data_i,
    output wire[31:0] mem_addr_o,
    output wire[31:0] mem_data_o,
    output wire mem_we_o,
    output wire[3:0] mem_sel_o,
    output wire mem_sram_ce_o,
    output wire mem_flash_ce_o,
    output wire mem_rom_ce_o,
    output wire mem_serial_ce_o,
    output wire mem_vga_ce_o,
    output wire mem_ce_o,
    output wire mem_sender_mem_ce_o,
    output wire mem_receiver_mem_ce_o,
    output wire mem_sram_sum,
    output wire timer_int_o
);

wire[31:0] pc;
wire[31:0] virtual_pc;
wire[31:0] physical_pc;
wire[31:0] virtual_addr;
wire[31:0] physical_addr;
wire[31:0] id_pc_i;
wire[31:0] id_inst_i;

wire[7:0] id_aluop_o;
wire[2:0] id_alusel_o;
wire[31:0] id_reg1_o;
wire[31:0] id_reg2_o;
wire id_wreg_o;
wire[4:0] id_wd_o;
wire id_is_in_delayslot_o;
wire[31:0] id_link_address_o;
wire[31:0] id_inst_o;
wire[31:0] id_current_inst_address_o;

wire[7:0] ex_aluop_i;
wire[2:0] ex_alusel_i;
wire[31:0] ex_reg1_i;
wire[31:0] ex_reg2_i;
wire ex_wreg_i;
wire[4:0] ex_wd_i;
wire ex_is_in_delayslot_i;
wire[31:0] ex_link_address_i;
wire[31:0] ex_inst_i;
wire[31:0] ex_current_inst_address_i;

wire[31:0] ex_inst_o;
wire ex_wreg_o;
wire[4:0] ex_wd_o;
wire[31:0] ex_wdata_o;
wire[31:0] ex_hi_o;
wire[31:0] ex_lo_o;
wire ex_whilo_o;
wire[7:0] ex_aluop_o;
wire[31:0] ex_mem_addr_o;
wire[31:0] ex_reg1_o;
wire[31:0] ex_reg2_o;
wire[31:0] ex_current_inst_address_o;

wire[31:0] mem_inst_i;
wire mem_wreg_i;
wire[4:0] mem_wd_i;
wire[31:0] mem_wdata_i;
wire[31:0] mem_hi_i;
wire[31:0] mem_lo_i;
wire mem_whilo_i;
wire[7:0] mem_aluop_i;
wire[31:0] mem_mem_addr_i;
wire[31:0] mem_reg1_i;
wire[31:0] mem_reg2_i;
wire[31:0] mem_current_inst_address_i;

wire[31:0] mem_inst_o;
wire mem_wreg_o;
wire[4:0] mem_wd_o;
wire[31:0] mem_wdata_o;
wire[31:0] mem_hi_o;
wire[31:0] mem_lo_o;
wire mem_whilo_o;
wire mem_LLbit_value_o;
wire mem_LLbit_we_o;
wire[31:0] mem_current_inst_address_o;

wire[31:0] wb_inst_i;
wire wb_wreg_i;
wire[4:0] wb_wd_i;
wire[31:0] wb_wdata_i;
wire[31:0] wb_hi_i;
wire[31:0] wb_lo_i;
wire wb_whilo_i;
wire wb_LLbit_value_i;
wire wb_LLbit_we_i;
wire[31:0] wb_current_inst_address_i;

wire reg1_read;
wire reg2_read;
wire[31:0] reg1_data;
wire[31:0] reg2_data;
wire[4:0] reg1_addr;
wire[4:0] reg2_addr;

wire[31:0] hi;
wire[31:0] lo;

wire[63:0] hilo_tmp_o;
wire[1:0] cnt_o;

wire[63:0] hilo_tmp_i;
wire[1:0] cnt_i;

wire[63:0] div_result;
wire div_ready;
wire[31:0] div_opdata1;
wire[31:0] div_opdata2;
wire div_start;
wire div_annul;
wire signed_div;

wire is_in_delayslot_i;
wire is_in_delayslot_o;
wire next_inst_in_delayslot_o;
wire id_branch_flag_o;
wire[31:0] branch_target_address;

wire[5:0] stall;
wire stallreq_from_id;
wire stallreq_from_ex;
wire stallreq_from_mem;

wire LLbit_o;

wire[31:0] new_pc;
wire we_from_mem;
wire ex_is_load;
wire mem_is_load;

wire ex_cp0_reg_we_o;
wire[4:0] ex_cp0_reg_write_addr_o;
wire[31:0] ex_cp0_reg_data_o;
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



inst_fetch inst_fetch0(
    .clk(clk),
    .rst(rst),
    .stall(stall),
    .branch_flag_i(id_branch_flag_o),
    .branch_target_address_i(branch_target_address),
    .new_pc(new_pc),
    .pc(pc),
    .ce(if_ce_o)
);

addr_bus addr_bus0(
    .clk(clk),
    .rst(rst),
    .addr_i(pc),
    .sram_ce(if_sram_ce_o),
    .flash_ce(if_flash_ce_o),
    .rom_ce(if_rom_ce_o),
    .serial_ce(if_serial_ce_o),
    .vga_ce(if_vga_ce_o),
    .sender_mem_ce(if_sender_mem_ce_o),
    .receiver_mem_ce(if_receiver_mem_ce_o),
    .addr_o(physical_pc)
);

assign if_addr_o = pc;

if_id if_id0(
    .clk(clk),
    .rst(rst),
    .stall(stall),
    .if_pc(pc),
    .if_inst(if_data_i),
    .id_pc(id_pc_i),
    .id_inst(id_inst_i)
);

inst_decode inst_decode0(
    .rst(rst),
    .pc_i(id_pc_i),
    .inst_i(id_inst_i),

    .ex_aluop_i(ex_aluop_o),

    .reg1_data_i(reg1_data),
    .reg2_data_i(reg2_data),

    .ex_wreg_i(ex_wreg_o),
    .ex_wdata_i(ex_wdata_o),
    .ex_wd_i(ex_wd_o),

    .mem_wreg_i(mem_wreg_o),
    .mem_wdata_i(mem_wdata_o),
    .mem_wd_i(mem_wd_o),

    .is_in_delayslot_i(is_in_delayslot_i),

    .reg1_read_o(reg1_read),
    .reg2_read_o(reg2_read),
    
    .reg1_addr_o(reg1_addr),
    .reg2_addr_o(reg2_addr),

    .aluop_o(id_aluop_o),
    .alusel_o(id_alusel_o),
    .reg1_o(id_reg1_o),
    .reg2_o(id_reg2_o),
    .wd_o(id_wd_o),
    .wreg_o(id_wreg_o),
    .inst_o(id_inst_o),

    .next_inst_in_delayslot_o(next_inst_in_delayslot_o),
    .branch_flag_o(id_branch_flag_o),
    .branch_target_address_o(branch_target_address),
    .link_addr_o(id_link_address_o),

    .is_in_delayslot_o(id_is_in_delayslot_o),
    .current_inst_address_o(id_current_inst_address_o),

    .stallreq(stallreq_from_id)
);

regs regs0(
    .clk(clk),
    .rst(rst),
    .we(wb_wreg_i),
    .waddr(wb_wd_i),
    .wdata(wb_wdata_i),
    .re1(reg1_read),
    .raddr1(reg1_addr),
    .rdata1(reg1_data),
    .re2(reg2_read),
    .raddr2(reg2_addr),
    .rdata2(reg2_data)
);

id_ex id_ex0(
    .clk(clk),
    .rst(rst),

    .stall(stall),

    .id_aluop(id_aluop_o),
    .id_alusel(id_alusel_o),
    .id_reg1(id_reg1_o),
    .id_reg2(id_reg2_o),
    .id_wd(id_wd_o),
    .id_wreg(id_wreg_o),
    .id_link_address(id_link_address_o),
    .id_is_in_delayslot(id_is_in_delayslot_o),
    .next_inst_in_delayslot_i(next_inst_in_delayslot_o),
    .id_inst(id_inst_o),
    .id_current_inst_address(id_current_inst_address_o),

    .ex_aluop(ex_aluop_i),
    .ex_alusel(ex_alusel_i),
    .ex_reg1(ex_reg1_i),
    .ex_reg2(ex_reg2_i),
    .ex_wd(ex_wd_i),
    .ex_wreg(ex_wreg_i),
    .ex_link_address(ex_link_address_i),
    .ex_is_in_delayslot(ex_is_in_delayslot_i),
    .is_in_delayslot_o(is_in_delayslot_i),
    .ex_inst(ex_inst_i),
    .ex_current_inst_address(ex_current_inst_address_i)
);

exe exe0(
    .rst(rst),

    .aluop_i(ex_aluop_i),
    .alusel_i(ex_alusel_i),
    .reg1_i(ex_reg1_i),
    .reg2_i(ex_reg2_i),
    .wd_i(ex_wd_i),
    .wreg_i(ex_wreg_i),
    .hi_i(hi),
    .lo_i(lo),
    .inst_i(ex_inst_i),
    .inst_o(ex_inst_o),

    .wb_hi_i(wb_hi_i),
    .wb_lo_i(wb_lo_i),
    .wb_whilo_i(wb_whilo_i),
    .mem_hi_i(mem_hi_o),
    .mem_lo_i(mem_lo_o),
    .mem_whilo_i(mem_whilo_o),

    .hilo_tmp_i(hilo_tmp_i),
    .cnt_i(cnt_i),

    .div_result_i(div_result),
    .div_ready_i(div_ready),

    .link_address_i(ex_link_address_i),
    .is_in_delayslot_i(ex_is_in_delayslot_i),
    .current_inst_address_i(ex_current_inst_address_i),

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

    .wd_o(ex_wd_o),
    .wreg_o(ex_wreg_o),
    .wdata_o(ex_wdata_o),

    .hi_o(ex_hi_o),
    .lo_o(ex_lo_o),
    .whilo_o(ex_whilo_o),

    .hilo_tmp_o(hilo_tmp_o),
    .cnt_o(cnt_o),

    .div_opdata1_o(div_opdata1),
    .div_opdata2_o(div_opdata2),
    .div_start_o(div_start),
    .signed_div_o(signed_div),

    .aluop_o(ex_aluop_o),
    .mem_addr_o(ex_mem_addr_o),
    .reg2_o(ex_reg2_o),

    .current_inst_address_o(ex_current_inst_address_o),

    .stallreq(stallreq_from_ex),
    
    .is_load_o(ex_is_load)
);

ex_mem ex_mem0(
    .clk(clk),
    .rst(rst),

    .stall(stall),

    .ex_wd(ex_wd_o),
    .ex_wreg(ex_wreg_o),
    .ex_wdata(ex_wdata_o),
    .ex_hi(ex_hi_o),
    .ex_lo(ex_lo_o),
    .ex_whilo(ex_whilo_o),

    .ex_aluop(ex_aluop_o),
    .ex_mem_addr(ex_mem_addr_o),
    .ex_reg2(ex_reg2_o),

    .ex_current_inst_address(ex_current_inst_address_o),

    .hilo_i(hilo_tmp_o),
    .cnt_i(cnt_o),

    .ex_cp0_reg_we(ex_cp0_reg_we_o),
    .ex_cp0_reg_write_addr(ex_cp0_reg_write_addr_o),
    .ex_cp0_reg_data(ex_cp0_reg_data_o),

    .mem_wd(mem_wd_i),
    .mem_wreg(mem_wreg_i),
    .mem_wdata(mem_wdata_i),
    .mem_hi(mem_hi_i),
    .mem_lo(mem_lo_i),
    .mem_whilo(mem_whilo_i),

    .mem_aluop(mem_aluop_i),
    .mem_mem_addr(mem_mem_addr_i),
    .mem_reg2(mem_reg2_i),

    .mem_current_inst_address(mem_current_inst_address_i),

    .hilo_o(hilo_tmp_i),
    .cnt_o(cnt_i),

    .mem_cp0_reg_we(mem_cp0_reg_we_i),
    .mem_cp0_reg_write_addr(mem_cp0_reg_write_addr_i),
    .mem_cp0_reg_data(mem_cp0_reg_data_i),

    .ex_inst(ex_inst_o),
    .mem_inst(mem_inst_i)
);

memory memory0(
    .rst(rst),
    .inst_i(mem_inst_i),
    .inst_o(mem_inst_o),

    .wd_i(mem_wd_i),
    .wreg_i(mem_wreg_i),
    .wdata_i(mem_wdata_i),
    .hi_i(mem_hi_i),
    .lo_i(mem_lo_i),
    .whilo_i(mem_whilo_i),
    .aluop_i(mem_aluop_i),
    .mem_addr_i(mem_mem_addr_i),
    .reg2_i(mem_reg2_i),

    .mem_data_i(mem_data_i),

    .LLbit_i(LLbit_o),
    .wb_LLbit_we_i(wb_LLbit_we_i),
    .wb_LLbit_value_i(wb_LLbit_value_i),

    .cp0_reg_we_i(mem_cp0_reg_we_i),
    .cp0_reg_write_addr_i(mem_cp0_reg_write_addr_i),
    .cp0_reg_data_i(mem_cp0_reg_data_i),

    .current_inst_address_i(mem_current_inst_address_i),

    .LLbit_we_o(mem_LLbit_we_o),
    .LLbit_value_o(mem_LLbit_value_o),

    .cp0_reg_we_o(mem_cp0_reg_we_o),
    .cp0_reg_write_addr_o(mem_cp0_reg_write_addr_o),
    .cp0_reg_data_o(mem_cp0_reg_data_o),

    .current_inst_address_o(mem_current_inst_address_o),

    .wd_o(mem_wd_o),
    .wreg_o(mem_wreg_o),
    .wdata_o(mem_wdata_o),
    .hi_o(mem_hi_o),
    .lo_o(mem_lo_o),
    .whilo_o(mem_whilo_o),
    
    .mem_addr_o(mem_addr_o),
    .mem_we_o(we_from_mem),
    .mem_sel_o(mem_sel_o),
    .mem_data_o(mem_data_o),
    .mem_ce_o(mem_ce_o),

    .virtual_addr(virtual_addr),
    .physical_addr(physical_addr),
    .is_load_o(mem_is_load)
);

addr_bus addr_bus1(
    .clk(clk),
    .rst(rst),
    .addr_i(virtual_addr),
    .sram_ce(mem_sram_ce_o),
    .flash_ce(mem_flash_ce_o),
    .rom_ce(mem_rom_ce_o),
    .serial_ce(mem_serial_ce_o),
    .vga_ce(mem_vga_ce_o),
    .addr_o(physical_addr),
    .sram_sum(mem_sram_sum),
    .sender_mem_ce(mem_sender_mem_ce_o),
    .receiver_mem_ce(mem_receiver_mem_ce_o)
);

mem_wb mem_wb0(
    .clk(clk),
    .rst(rst),

    .stall(stall),

    .mem_wd(mem_wd_o),
    .mem_wreg(mem_wreg_o),
    .mem_wdata(mem_wdata_o),
    .mem_hi(mem_hi_o),
    .mem_lo(mem_lo_o),
    .mem_whilo(mem_whilo_o),

    .mem_LLbit_we(mem_LLbit_we_o),
    .mem_LLbit_value(mem_LLbit_value_o),

    .mem_cp0_reg_we(mem_cp0_reg_we_o),
    .mem_cp0_reg_write_addr(mem_cp0_reg_write_addr_o),
    .mem_cp0_reg_data(mem_cp0_reg_data_o),

    .wb_wd(wb_wd_i),
    .wb_wreg(wb_wreg_i),
    .wb_wdata(wb_wdata_i),
    .wb_hi(wb_hi_i),
    .wb_lo(wb_lo_i),
    .wb_whilo(wb_whilo_i),

    .wb_LLbit_we(wb_LLbit_we_i),
    .wb_LLbit_value(wb_LLbit_value_i),

    .wb_cp0_reg_we(wb_cp0_reg_we_i),
    .wb_cp0_reg_write_addr(wb_cp0_reg_write_addr_i),
    .wb_cp0_reg_data(wb_cp0_reg_data_i),

    .mem_inst(mem_inst_o),
    .wb_inst(wb_inst_i)
);

regs_hilo regs_hilo(
    .clk(clk),
    .rst(rst),

    .we(wb_whilo_i),
    .hi_i(wb_hi_i),
    .lo_i(wb_lo_i),

    .hi_o(hi),
    .lo_o(lo)
);

ctrl ctrl0(
    .clk(clk),
    .rst(rst),
    .stallreq_from_id(stallreq_from_id),
    .stallreq_from_ex(stallreq_from_ex),
    .stallreq_from_mem(mem_ce_o),
    .new_pc(new_pc),
    .mem_we_i(we_from_mem),
    .is_load_i(mem_is_load),
    .mem_we_o(mem_we_o),
    .stall(stall)
);

divide divide0(
    .clk(clk),
    .rst(rst),

    .signed_div_i(signed_div),
    .opdata1_i(div_opdata1),
    .opdata2_i(div_opdata2),
    .start_i(div_start),
    .annul_i(1'b0),

    .result_o(div_result),
    .ready_o(div_ready)
);

regs_llbit regs_llbit0(
    .clk(clk),
    .rst(rst),
    .flush(1'b0),
    .LLbit_i(wb_LLbit_value_i),
    .we(wb_LLbit_we_i),
    .LLbit_o(LLbit_o)
);

regs_cp0 regs_cp00(
    .clk(clk),
    .rst(rst),
    .we_i(wb_cp0_reg_we_i),
    .waddr_i(wb_cp0_reg_write_addr_i),
    .raddr_i(cp0_raddr_i),
    .data_i(wb_cp0_reg_data_i),
    //.excepttype_i(mem_excepttype_o),
    .int_i(int_i),
    //.current_inst_addr_i(mem_current_inst_address_o),
    //.is_in_delayslot_i(mem_is_in_delayslot_o),
    .data_o(cp0_data_o),
    .timer_int_o(timer_int_o)  			
);

endmodule