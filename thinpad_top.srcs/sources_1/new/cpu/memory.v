
module memory(
    input wire rst,
    input wire[31:0] wdata_i,
    input wire wreg_i,
    input wire[4:0] wd_i,
    input wire[31:0] hi_i,
    input wire[31:0] lo_i,
    input wire hilo_we_i,
    
    output reg[31:0] wdata_o,
    output reg wreg_o,
    output reg[4:0] wd_o,
    output reg[31:0] hi_o,
    output reg[31:0] lo_o,
    output reg hilo_we_o,
    
    input wire[7:0] aluop,
    input wire[31:0] load_store_addr,
    input wire[31:0] load_store_data,

    input wire cp0_reg_we_i,
    input wire[4:0] cp0_reg_write_addr_i,
    input wire[31:0] cp0_reg_data_i,
    output reg cp0_reg_we_o,
    output reg[4:0] cp0_reg_write_addr_o,
    output reg[31:0] cp0_reg_data_o,

    input wire[31:0] ram_data_i, //读数�?
    output reg[31:0] ram_data_o, //写数�?
    output reg[31:0] ram_addr, //地址
    output reg[3:0] ram_be, //字节使能，低有效
    output reg ram_ce, //片�?�使能，低有�?
    output reg ram_we  //写使能，低为读，高为�?
);


always @(*)begin
    if(rst)begin
        wd_o <= 0;
        wreg_o <= 0;
        wdata_o <= 0;
        hi_o <= 0;
        lo_o <= 0;
        hilo_we_o <= 0;
        ram_addr <= 0;
        ram_be <= 0;
        ram_ce <= 1;
        ram_we <= 0;
        cp0_reg_we_o <= 1'b0;
        cp0_reg_write_addr_o <= 5'b00000;
        cp0_reg_data_o <= 0;    
    end else begin
        wd_o <= wd_i;
        hi_o <= hi_i;
        lo_o <= lo_i;
        wreg_o <= wreg_i;
        hilo_we_o <= hilo_we_i;
        cp0_reg_we_o <= cp0_reg_we_i;
        cp0_reg_write_addr_o <= cp0_reg_write_addr_i;
        cp0_reg_data_o <= cp0_reg_data_i;         
        case(aluop)
            `EXE_LB_OP: begin
                ram_we <= 0;
                ram_ce <= 0;
                ram_addr <= load_store_addr;
                ram_be <= 0;
                case (load_store_addr[1:0])
                    2'b00:wdata_o <= {{24{ram_data_i[31]}},ram_data_i[31:24]};
                    2'b01:wdata_o <= {{24{ram_data_i[23]}},ram_data_i[23:16]};
                    2'b10:wdata_o <= {{24{ram_data_i[15]}},ram_data_i[15:8]};
                    2'b11:wdata_o <= {{24{ram_data_i[7]}},ram_data_i[7:0]};
                endcase
            end
            `EXE_LBU_OP:begin
                ram_we <= 0;
                ram_ce <= 0;
                ram_addr <= load_store_addr;
                ram_be <= 0;
                case (load_store_addr[1:0])
                    2'b00:wdata_o <= {24'b0,ram_data_i[31:24]};
                    2'b01:wdata_o <= {24'b0,ram_data_i[23:16]};
                    2'b10:wdata_o <= {24'b0,ram_data_i[15:8]};
                    2'b11:wdata_o <= {24'b0,ram_data_i[7:0]};
                endcase
            end
            `EXE_LH_OP:begin
                case (load_store_addr[1:0])
                    2'b00:begin
                        ram_we <= 0;
                        ram_ce <= 0;
                        ram_addr <= load_store_addr;
                        ram_be <= 0;
                        wdata_o <= {{16{ram_data_i[31]}},ram_data_i[31:16]};
                    end
                    2'b10:begin
                        ram_we <= 0;
                        ram_ce <= 0;
                        ram_addr <= load_store_addr;
                        ram_be <= 0;
                        wdata_o <= {{16{ram_data_i[15]}},ram_data_i[15:0]};
                    end
                    default:begin
                        ram_be <= 0;
                        ram_we <= 0;
                        ram_ce <= 1;
                        ram_addr <= 0;
                        wdata_o <= 0;
                    end
                endcase
            end
            `EXE_LHU_OP:begin
                case (load_store_addr[1:0])
                    2'b00:begin
                        ram_we <= 0;
                        ram_ce <= 0;
                        ram_addr <= load_store_addr;
                        ram_be <= 0;
                        wdata_o <= {16'b0,ram_data_i[31:16]};
                    end
                    2'b10:begin
                        ram_we <= 0;
                        ram_ce <= 0;
                        ram_addr <= load_store_addr;
                        ram_be <= 0;
                        wdata_o <= {16'b0,ram_data_i[15:0]};
                    end
                    default:begin
                        ram_be <= 0;
                        ram_we <= 0;
                        ram_ce <= 1;
                        ram_addr <= 0;
                        wdata_o <= 0;
                    end
                endcase
            end
            `EXE_LW_OP:begin
                case (load_store_addr[1:0])
                    2'b00:begin
                        ram_we <= 0;
                        ram_ce <= 0;
                        ram_addr <= load_store_addr;
                        ram_be <= 0;
                        wdata_o <= ram_data_i;
                    end
                    default:begin
                        ram_be <= 0;
                        ram_we <= 0;
                        ram_ce <= 1;
                        ram_addr <= 0;
                        wdata_o <= 0;
                    end
                endcase
            end
            `EXE_LWL_OP:begin
                ram_addr <= {load_store_addr[31:2],2'b00};
                ram_we <= 0;
                ram_ce <= 0;
                ram_be <= 0;
                case(load_store_addr[1:0])
                    2'b00:begin
                        wdata_o <= ram_data_i;
                    end
                    2'b01:begin
                        wdata_o <= {ram_data_i[23:0],load_store_data[7:0]};
                    end
                    2'b10:begin
                        wdata_o <= {ram_data_i[15:0],load_store_data[15:0]};
                    end
                    2'b11:begin
                        wdata_o <= {ram_data_i[7:0],load_store_data[23:0]};
                    end
                endcase
            end
            `EXE_LWR_OP:begin
                ram_addr <= {load_store_addr[31:2],2'b00};
                ram_we <= 0;
                ram_ce <= 0;
                ram_be <= 0;
                case(load_store_addr[1:0])
                    2'b00:begin
                        wdata_o <= {load_store_data[31:8],ram_data_i[31:24]};
                    end
                    2'b01:begin
                        wdata_o <= {load_store_data[31:16],ram_data_i[31:16]};
                    end
                    2'b10:begin
                        wdata_o <= {load_store_data[31:24],ram_data_i[31:8]};
                    end
                    2'b11:begin
                        wdata_o <= ram_data_i;
                    end
                endcase
            end
            `EXE_SB_OP:begin
                ram_addr <= load_store_addr;
                ram_we <= 1;
                ram_ce <= 0;
                ram_data_o <= {load_store_data[7:0],load_store_data[7:0],load_store_data[7:0],load_store_data[7:0]};
                case(load_store_addr[1:0])
                    2'b00: ram_be <= 4'b0111;
                    2'b01: ram_be <= 4'b1011;
                    2'b10: ram_be <= 4'b1101;
                    2'b11: ram_be <= 4'b1110;
                endcase
            end
            `EXE_SH_OP:begin
                ram_addr <= load_store_addr;
                ram_we <= 1;
                ram_ce <= 0;
                ram_data_o <= {load_store_data[15:0],load_store_data[15:0]};
                case(load_store_addr[1:0])
                    2'b00: ram_be <= 4'b0011;
                    2'b10: ram_be <= 4'b1100;
                    default: ram_be <= 4'b1111;
                endcase
            end        
            `EXE_SW_OP:begin
                ram_addr <= load_store_addr;
                ram_we <= 1;
                ram_ce <= 0;
                ram_data_o <= load_store_data;
                ram_be <= 4'b0000;
            end
            `EXE_SWL_OP:begin
                ram_addr <= {load_store_addr[31:2],2'b00};
                ram_we <= 1;
                ram_ce <= 0;
                case(load_store_addr[1:0])
                    2'b00:begin
                        ram_be = 4'b0000;
                        ram_data_o <= load_store_data;
                    end
                    2'b01:begin
                        ram_be = 4'b1000;
                        ram_data_o <= {8'b0,load_store_data[31:8]};
                    end
                    2'b10:begin
                        ram_be = 4'b1100;
                        ram_data_o <= {16'b0,load_store_data[31:16]};
                    end
                    2'b11:begin
                        ram_be = 4'b1110;
                        ram_data_o <= {24'b0,load_store_data[31:24]};
                    end
                endcase
            end
            `EXE_SWR_OP:begin
                ram_addr <= {load_store_addr[31:2],2'b00};
                ram_we <= 1;
                ram_ce <= 0;
                case(load_store_addr[1:0])
                    2'b00:begin
                        ram_be = 4'b0111;
                        ram_data_o <= {load_store_data[7:0],24'b0};
                    end
                    2'b01:begin
                        ram_be = 4'b0011;
                        ram_data_o <= {load_store_data[15:0],16'b0};
                    end
                    2'b10:begin
                        ram_be = 4'b0001;
                        ram_data_o <= {load_store_data[23:0],8'b0};
                    end
                    2'b11:begin
                        ram_be = 4'b0000;
                        ram_data_o <= load_store_data;
                    end
                endcase
            end
            default:begin
                wdata_o <= wdata_i;                
                ram_addr <= 0;
                ram_be <= 0;
                ram_ce <= 1;
                ram_we <= 0;
            end
        endcase
    end   

end

endmodule