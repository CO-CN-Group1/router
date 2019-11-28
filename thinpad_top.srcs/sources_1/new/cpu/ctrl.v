module ctrl(
    input wire rst,
    input wire stop_from_id,
    input wire stop_from_ex,
    output reg[0:5] stop,
    
    input wire[31:0] excepttype_i,
    input wire[31:0] cp0_epc_i,
    output reg[31:0] new_pc,
    output reg flush
);

always @(*)begin
    if(rst)begin
        stop <= 0;
        flush <= 0;
        new_pc <= 0;
    end else if(excepttype_i) begin
        flush <= 1'b1;
        stop <= 6'b000000;
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
    end else if(stop_from_id)begin
        stop <= 6'b111000;
        flush <= 0;
    end else begin
        stop <= 0;
        flush <= 0;
        new_pc <= 0;
    end
end
endmodule