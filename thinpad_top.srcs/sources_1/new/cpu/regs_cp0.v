`include "defines.v"

module regs_cp0(

    input wire clk,
    input wire rst,
    
    
    input wire we_i,
    input wire[4:0] waddr_i,
    input wire[4:0] raddr_i,
    input wire[31:0] data_i,
    
//  input wire[31:0] excepttype_i,
    input wire[5:0] int_i,
//  input wire[31:0] current_inst_addr_i,
//  input wire is_in_delayslot_i,
    
    output reg[31:0] data_o,
    output reg[31:0] count_o,
    output reg[31:0] compare_o,
    output reg[31:0] status_o,
    output reg[31:0] cause_o,
    output reg[31:0] epc_o,
    output reg[31:0] config_o,
    output reg[31:0] prid_o,
    output reg timer_int_o
);

always @ (posedge clk) begin
    if(rst == 1'b1) begin
        count_o <= 0;
        compare_o <= 0;
        //status寄存器的cu为0001，表示协处理器cp0存在
        status_o <= 32'b00010000000000000000000000000000;
        cause_o <= 0;
        epc_o <= 0;
        //config寄存器的be为1，表示big-endian；mt为00，表示没有mmu
        config_o <= 32'b00000000000000001000000000000000;
        //制作者是l，对应的是0x48，类型是0x1，基本类型，版本号是1.0
        prid_o <= 32'b00000000010011000000000100000010;
        timer_int_o <= 1'b0;
    end else begin
        count_o <= count_o + 1 ;
        cause_o[15:10] <= int_i;
    
        if(compare_o != 0 && count_o == compare_o) begin
            timer_int_o <= 1'b1;
        end
                
        if(we_i == 1'b1) begin
            case (waddr_i) 
                `cp0_reg_count:        begin
                    count_o <= data_i;
                end
                `cp0_reg_compare:    begin
                    compare_o <= data_i;
                    timer_int_o <= 1'b0;
                end
                `cp0_reg_status:    begin
                    status_o <= data_i;
                end
                `cp0_reg_epc:    begin
                    epc_o <= data_i;
                end
                `cp0_reg_cause:    begin
                    cause_o[9:8] <= data_i[9:8];
                    cause_o[23] <= data_i[23];
                    cause_o[22] <= data_i[22];
                end                    
            endcase  //case addr_i
        end
    end    //if
end      //always
        
always @ (*) begin
    if(rst == 1'b1) begin
        data_o <= 0;
    end else begin
            case (raddr_i) 
                `cp0_reg_count:        begin
                    data_o <= count_o ;
                end
                `cp0_reg_compare:    begin
                    data_o <= compare_o ;
                end
                `cp0_reg_status:    begin
                    data_o <= status_o ;
                end
                `cp0_reg_cause:    begin
                    data_o <= cause_o ;
                end
                `cp0_reg_epc:    begin
                    data_o <= epc_o ;
                end
                `cp0_reg_prid:    begin
                    data_o <= prid_o ;
                end
                `cp0_reg_config:    begin
                    data_o <= config_o ;
                end    
                default:     begin
                end            
            endcase  //case addr_i            
    end    //if
end      //always

endmodule