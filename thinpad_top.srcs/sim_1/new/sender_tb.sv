`timescale 1ns / 1ps
module sender_tb;

wire clk_50M, clk_11M0592, clk_125M, clk_125M_90deg;
logic rst = 0;

clock osc(
    .clk_11M0592   (clk_11M0592),
    .clk_50M       (clk_50M),
    .clk_125M      (clk_125M),
    .clk_125M_90deg(clk_125M_90deg)
);

logic[31:0] cpu_data_i;
logic[31:0] cpu_data_o;
logic[6:0] cpu_addr;
logic cpu_ce_n;
logic[3:0] cpu_we_n;

logic[31:0] router_data_i;
logic[31:0] router_data_o;
logic[6:0] router_addr;
logic router_ce_n;
logic[3:0] router_we_n;

sender_mem sender_mem0(
    .cpu_rst(rst),
    .cpu_clk(clk_50M),
    .cpu_data_i(cpu_data_i),
    .cpu_data_o(cpu_data_o),
    .cpu_ce_n(cpu_ce_n),
    .cpu_we_n(cpu_we_n),
    .cpu_addr(cpu_addr),
    
    .router_rst(rst),
    .router_clk(clk_125M),
    .router_data_i(router_data_i),
    .router_data_o(router_data_o),
    .router_addr(router_addr),
    .router_ce_n(router_ce_n),
    .router_we_n(router_we_n)
);

localparam[1:0]
    ROUTER_STATE_IDLE = 0,
    ROUTER_STATE_READ = 1,
    ROUTER_STATE_TMP_READ = 2;

logic[1:0] router_state = ROUTER_STATE_IDLE;

integer router_length,router_current;

always @(posedge clk_125M) begin
    if(rst) begin
        router_state <= ROUTER_STATE_IDLE;
        router_ce_n <= 0;
        router_we_n <= 0;
        router_addr <= 0;
        router_length <= 0;
    end else begin
        router_ce_n <= 1;
        case(router_state)
            ROUTER_STATE_IDLE:begin
                if(router_addr == 7'b1111111 && router_data_o[31:24]!=8'b00000000 && router_we_n == 4'b0000) begin
                    router_length <= router_data_o[23:0];
                    router_state <= ROUTER_STATE_TMP_READ;
                    router_current <= 0;
                    router_addr <= 0;
                    router_we_n <= 4'b0000;
                end else begin
                    router_addr <= 7'b1111111;
                    router_we_n <= 4'b0000;
                end
            end
            ROUTER_STATE_TMP_READ:begin
                router_state <= ROUTER_STATE_READ;
                router_addr <= router_addr + 1;
            end
            ROUTER_STATE_READ:begin
                if(router_current == (router_length+1)>>2) begin
                    $display("%d %08h\n",router_current,router_data_o);
                    router_addr <= 7'b1111111;
                    router_we_n <= 4'b1000;
                    router_data_i <= 8'b0;
                    router_state <= ROUTER_STATE_IDLE;
                end else begin
                    $display("%d %08h\n",router_current,router_data_o);
                    router_current <= router_current + 1;
                    router_we_n <= 4'b0000;
                    router_addr <= router_addr + 1;
                end
            end
        endcase
    end
end


localparam[1:0]
    CPU_STATE_IDLE = 0,
    CPU_STATE_WRITE = 1,
    CPU_STATE_FINISH = 2;

logic[1:0] cpu_state = CPU_STATE_IDLE;

integer cpu_length,cpu_current;
logic[7:0]data_gen;
integer timer_cnt;
always @(posedge clk_50M)begin
    if(rst)begin
        cpu_state <= CPU_STATE_IDLE;
        cpu_length <= 66;
        data_gen <= 0;
        cpu_addr <= 0;
        cpu_ce_n <= 0;
        cpu_we_n <= 0;
        cpu_data_i <= 0;
        timer_cnt <= 0;
    end else begin
        cpu_ce_n <= 1;
        case(cpu_state)
            CPU_STATE_IDLE:begin
                if(cpu_addr == 7'b1111111 && cpu_data_o[31:24] == 8'b00000000 && cpu_we_n == 4'b0000 && timer_cnt >=2) begin
                    cpu_addr <= 0;
                    cpu_we_n <= 4'b0001;
                    cpu_data_i <= {data_gen,data_gen,data_gen,data_gen};
                    data_gen <= data_gen+1;
                    cpu_current <= 0;
                    cpu_state <= CPU_STATE_WRITE;
                end else begin
                    cpu_addr <= 7'b1111111;
                    cpu_we_n <= 4'b0000;
                    timer_cnt <= timer_cnt + 1;
                end
            end
            CPU_STATE_WRITE:begin
                if(cpu_current == cpu_length-1)begin
                    cpu_state<=CPU_STATE_FINISH;
                    cpu_we_n <= 4'b0111;
                    cpu_data_i <= cpu_length;
                    cpu_addr <= 7'b1111111;
                end else begin
                    case(cpu_current[1:0])
                        2'b00: begin
                            cpu_we_n <= 4'b0010;
                            cpu_addr <= {cpu_current[8:2]};
                        end
                        2'b01: begin
                            cpu_we_n <= 4'b0100;
                            cpu_addr <= {cpu_current[8:2]};
                        end
                        2'b10: begin
                            cpu_we_n <= 4'b1000;
                            cpu_addr <= {cpu_current[8:2]};
                        end
                        2'b11: begin
                            cpu_we_n <= 4'b0001;
                            cpu_addr <= (cpu_current[8:2])+1;
                        end
                    endcase
                    cpu_data_i <= {data_gen,data_gen,data_gen,data_gen};
                    data_gen <= data_gen + 1;
                    cpu_current <= cpu_current + 1;
                    
                end
            end
            CPU_STATE_FINISH:begin
                cpu_state<=CPU_STATE_IDLE;
                cpu_we_n <= 4'b1000;
                cpu_data_i <= 32'hff000000;
                cpu_addr <= 7'b1111111;
                timer_cnt <= 0;
            end
        endcase 
    end
end


initial begin
    rst = 1;
    #30 rst = 0;
end

endmodule