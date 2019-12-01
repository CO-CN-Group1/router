module ctrl(
    input wire rst,
    input wire clk,
    input wire stop_from_ex,
    output reg[0:5] stop,
    
    input wire[31:0] excepttype_i,
    input wire[31:0] cp0_epc_i,
    output reg[31:0] new_pc,
    output reg flush,
    input wire load_inst,
    input wire store_inst,
    output reg we_o
);

reg[1:0] load_cnt,store_cnt;

always @(*)begin
    if(rst)begin
        stop <= 0;
        flush <= 0;
        new_pc <= 0;
        we_o <= 0; 
    end else if(excepttype_i) begin
        flush <= 1'b1;
        stop <= 6'b000000;
        we_o <= 0;
        case (excepttype_i)
            32'h00000001: begin   //interrupt
                new_pc <= 32'h00000020;
            end
            32'h00000008: begin   //syscall
                new_pc <= 32'h00000040;
            end
            32'h0000000a: begin   //inst_invalid
                new_pc <= 32'h00000040;
            end
            32'h0000000d: begin   //trap
                new_pc <= 32'h00000040;
            end
            32'h0000000c: begin   //ov
                new_pc <= 32'h00000040;
            end
            32'h0000000e: begin   //eret
                new_pc <= cp0_epc_i;
            end
            default : begin
            end
        endcase                         
    end else if(stop_from_ex)begin
        stop <= 6'b111100;
        flush <= 0;
        we_o <= 0;
    end else if(store_inst)begin
        //we_o <= 1'b1;
        if(store_cnt==1)begin
            we_o <= 1'b1;
        end else 
            we_o <= 1'b0;
        if(store_cnt!=2)begin
            stop <= 6'b111110;
            flush <= 0;
        end else begin
            stop <= 0;
            flush <= 0;
        end
    end else if(load_inst)begin
        we_o <= 1'b0;
        if(load_cnt!=2)begin
            stop <= 6'b111000;
            flush <= 0;
        end else begin
            stop <= 0;
            flush <= 0;
        end
    end else begin
        we_o <= 1'b0;
        stop <= 0;
        flush <= 0;
        new_pc <= 0;
    end
end
always @(posedge clk)begin
    if(rst)begin
        load_cnt <= 0;
        store_cnt <= 0;
    end else if(store_inst)begin
        if(store_cnt!=2)begin
            store_cnt <= store_cnt + 1;
        end else begin
            store_cnt <= 0;
        end
    end else if(load_inst)begin
        if(load_cnt!=2)begin
            load_cnt <= load_cnt + 1;
        end else begin
            load_cnt <= 0;
        end
    end else begin
        load_cnt <= 0;
        store_cnt <= 0;
    end
end
endmodule