`timescale 1ns / 1ps
module receiver_tb;

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

logic[7:0] router_data_i;
logic[7:0] router_data_o;
logic[8:0] router_addr;
logic router_ce_n;
logic router_we_n;

receiver_mem receiver_mem0(
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
    CPU_STATE_IDLE = 0,
    CPU_STATE_READ = 1,
    CPU_STATE_FINISH = 2;

logic[1:0] cpu_state = CPU_STATE_IDLE;

integer cpu_length,cpu_current;

always @(posedge clk_50M) begin
    if(rst) begin
        cpu_state <= CPU_STATE_IDLE;
        cpu_ce_n <= 0;
        cpu_we_n <= 0;
        cpu_addr <= 0;
        cpu_length <= 0;
    end else begin
        cpu_ce_n <= 1;
        case(cpu_state)
            CPU_STATE_IDLE:begin
                if(cpu_addr == 7'b1111111 && cpu_data_o[31:24]!=8'b00000000 && cpu_we_n[3] == 0) begin
                    cpu_length <= {8'b0,cpu_data_o[23:0]};
                    cpu_state <= CPU_STATE_READ;
                    cpu_current <= 0;
                    cpu_addr <= 0;
                    cpu_we_n <= 0;
                end else begin
                    cpu_addr <= 7'b1111111;
                    cpu_we_n <= 0;
                end
            end
            CPU_STATE_READ:begin
                if(cpu_current == {2'b00,cpu_length[31:2]}) begin
                    cpu_addr <= 7'b1111111;
                    cpu_we_n <= 4'b1111;
                    cpu_data_i <= 0;
                    cpu_state <= CPU_STATE_IDLE;
                end else begin
                    $display("%d %08h\n",cpu_current,cpu_data_o);
                    cpu_current <= cpu_current + 1;
                    cpu_we_n <= 0;
                    cpu_addr <= cpu_addr + 1;
                end
            end
        endcase
    end
end


localparam[1:0]
    ROUTER_STATE_IDLE = 0,
    ROUTER_STATE_WRITE = 1,
    ROUTER_STATE_FINISH = 2;

logic[1:0] router_state = ROUTER_STATE_IDLE;

integer router_length,router_current,data_gen;
integer timer_cnt;
always @(posedge clk_125M)begin
    if(rst)begin
        router_state <= ROUTER_STATE_IDLE;
        router_length <= 20;
        data_gen <= 0;
        router_addr <= 0;
        router_ce_n <= 0;
        router_we_n <= 0;
        router_data_i <= 0;
        timer_cnt <= 0;
    end else begin
        router_ce_n <= 1;
        case(router_state)
            ROUTER_STATE_IDLE:begin
                if(router_addr == 9'b111111111 && router_data_o == 8'b00000000 && router_we_n == 1'b0 && timer_cnt >=2) begin
                    router_addr <= 0;
                    router_we_n <= 1;
                    router_data_i <= data_gen[7:0];
                    router_current <= 0;
                    router_state <= ROUTER_STATE_WRITE;
                end else begin
                    router_addr <= 9'b111111111;
                    router_we_n <= 0;
                    timer_cnt <= timer_cnt + 1;
                end
            end
            ROUTER_STATE_WRITE:begin
                if(router_current == router_length-1)begin
                    router_state<=ROUTER_STATE_FINISH;
                    router_we_n <= 1;
                    router_data_i <= router_length[7:0];
                    data_gen <= data_gen + 1;
                    router_addr <= 9'b111111100;
                end else begin
                    router_we_n <= 1;
                    data_gen <= data_gen + 1;
                    router_data_i <= data_gen + 1;
                    router_current <= router_current + 1;
                    router_addr <= router_addr+1;
                end
            end
            ROUTER_STATE_FINISH:begin
                router_state<=ROUTER_STATE_IDLE;
                router_we_n <= 1;
                router_data_i <= 8'b11111111;
                router_addr <= 9'b111111111;
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