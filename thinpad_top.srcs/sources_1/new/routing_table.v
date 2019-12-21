/*
 * �???多路由表中可以放2048�???
 * 因此Trie树中节点的个数为2048*32
 * Trie树对应数组下标的宽度�??? 11 + 5 = 16
 * RouterEntry 64 = nexthop,left son index,right son index
 * 如果nexthop = 32'h00000000 表示 该节点不对应�???个路由表�???
 * locked_by_cpu 时，表示路由表正在被cpu修改
 */
module routing_table
(
    input wire clk,
    input wire rst,
    input wire[31:0] dest_ip,
    input wire dest_ip_valid,
    output reg[31:0] nexthop,
    output reg[7:0] port,
    output reg lookup_ready,
    output reg nexthop_valid,
    output reg nexthop_not_found,

    input wire os_clk,
    input wire[15:0] os_addr,
    input wire[63:0] os_din,
    output wire[63:0] os_dout,
    input wire[7:0] os_we,
    input wire os_rst,
    input wire os_en,
    
    input wire[11:0] os_port_addr,
    input wire[31:0] os_port_din,
    output wire[31:0] os_port_dout,
    input wire[3:0] os_port_we,
    input wire os_port_en

);

reg locked_by_cpu;

always @(posedge os_clk) begin
    if(os_rst) begin
        locked_by_cpu <= 0;
    end else if(os_addr == 16'b0 && os_en == 1'b1 && os_we!=0) begin
        if(os_din!=64'b0)
            locked_by_cpu <= 1;
        else
            locked_by_cpu <= 0;
    end
end

reg[15:0] current;
wire[63:0] dout;
xpm_memory_tdpram #(
    .ADDR_WIDTH_A(16),
    .WRITE_DATA_WIDTH_A(64),
    .BYTE_WRITE_WIDTH_A(8),
    .READ_DATA_WIDTH_A(64),
    .READ_LATENCY_A(1),
    .ADDR_WIDTH_B(16),
    .WRITE_DATA_WIDTH_B(64),
    .BYTE_WRITE_WIDTH_B(64),
    .READ_DATA_WIDTH_B(64),
    .READ_LATENCY_B(1),
    .MEMORY_SIZE(1920*32*64),
    .CLOCKING_MODE("independent_clock")
) xpm_memory_tdpram_table (
    .dina(os_din),
    .addra(os_addr),
    .wea(os_we),
    .douta(os_dout),
    .clka(os_clk),
    .rsta(os_rst),
    .ena(os_en),

    .dinb(64'b0),
    .addrb(current),
    .web(1'b0),
    .doutb(dout),
    .clkb(clk),
    .rstb(rst),
    .enb(1'b1)
);

wire[7:0] dout_port;

xpm_memory_tdpram #(
    .ADDR_WIDTH_A(12),
    .WRITE_DATA_WIDTH_A(32),
    .BYTE_WRITE_WIDTH_A(8),
    .READ_DATA_WIDTH_A(32),
    .READ_LATENCY_A(1),
    .ADDR_WIDTH_B(14),
    .WRITE_DATA_WIDTH_B(8),
    .BYTE_WRITE_WIDTH_B(8),
    .READ_DATA_WIDTH_B(8),
    .READ_LATENCY_B(1),
    .MEMORY_SIZE(1920*32*2),
    .CLOCKING_MODE("independent_clock")
) xpm_memory_tdpram_port (
    .dina(os_port_din),
    .addra(os_port_addr),
    .wea(os_port_we),
    .douta(os_port_dout),
    .clka(os_clk),
    .rsta(os_rst),
    .ena(os_port_en),

    .dinb(8'b0),
    .addrb(current[15:2]),
    .web(1'b0),
    .doutb(dout_port),
    .clkb(clk),
    .rstb(rst),
    .enb(1'b1)
);



reg[31:0] dest_ip_cache;

localparam[1:0]
    STATE_IDLE = 0,
    STATE_WAIT = 1, // cpu正在修改路由�???
    STATE_SEARCH1 = 2, // 64 个周期做查表，输出位置
    STATE_SEARCH2 = 3; // 得到数据并找到下一个位置

reg[1:0] state = STATE_IDLE;
reg[31:0] ans;
reg[1:0] ans_port;
integer pos;

always @(posedge clk) begin
    if(rst) begin
        nexthop <= 0;
        port <= 8'b0;
        lookup_ready <= 0;
        state <= STATE_IDLE;
        nexthop_not_found <= 0;
        nexthop_valid <= 0;
        current <= 1;
        ans <= 32'h00000000;
        ans_port <= 2'b0;
        dest_ip_cache <= 32'h00000000;
    end begin
        case(state)
            STATE_IDLE:begin
                if(locked_by_cpu) begin
                    nexthop_not_found <= 0;
                    nexthop_valid <= 0;
                    nexthop <= 0;
                    port <= 8'b0;
                    if(dest_ip_valid&&lookup_ready)begin
                        dest_ip_cache <= dest_ip;
                        lookup_ready <= 0;
                    end else begin
                        dest_ip_cache <= 0;
                        lookup_ready <= 0;
                    end
                    state <= STATE_WAIT;
                end else begin
                    nexthop <= 0;
                    port <= 0;
                    nexthop_not_found <= 0;
                    nexthop_valid <= 0;
                    if(lookup_ready && dest_ip_valid) begin
                        dest_ip_cache <= dest_ip;
                        lookup_ready <= 0;
                        state <= STATE_SEARCH1;
                        current <= 1;
                        ans <= 0;
                        ans_port <= 2'b0;
                        pos <= 31;
                    end else begin
                        dest_ip_cache <= 0;
                        lookup_ready <= 1;
                        state <= STATE_IDLE;
                    end
                end
            end
            STATE_WAIT:begin
                if(locked_by_cpu) begin
                    state <= STATE_WAIT;
                    nexthop <= 0;
                    port <= 0;
                    nexthop_not_found <= 0;
                    nexthop_valid <= 0;
                    lookup_ready <= 0;
                end else begin
                    if(dest_ip_cache == 0) begin
                        state <= STATE_IDLE;
                        nexthop <= 0;
                        port <= 0;
                        nexthop_not_found <= 0;
                        nexthop_valid <= 0;
                        lookup_ready <= 1;
                    end else begin
                        state <= STATE_SEARCH1;
                        current <= 1;
                        ans <= 0;
                        ans_port <= 2'b0;
                        pos <= 31;
                        nexthop <= 0;
                        port <= 0;
                        nexthop_not_found <= 0;
                        nexthop_valid <= 0;
                        lookup_ready <= 0;
                    end
                end
            end
            STATE_SEARCH1:begin
                if(locked_by_cpu) begin
                    state <= STATE_WAIT;
                    nexthop <= 0;
                    port <= 0;
                    nexthop_not_found <= 0;
                    nexthop_valid <= 0;
                    lookup_ready <= 0;
                end else begin
                    lookup_ready <= 0;
                    if(current == 0)begin
                        nexthop <= ans;
                        case(ans_port)
                            2'b01,2'b10,2'b11:port<={6'b0,ans_port};
                            2'b00:port <= (ans==0)?8'b0:8'b00000100;
                        endcase
                        if(ans == 0) begin
                            nexthop_not_found <= 1;
                        end else begin
                            nexthop_not_found <= 0;
                        end 
                        nexthop_valid <= 1;
                        state <= STATE_IDLE;
                        dest_ip_cache <= 0;
                    end else begin
                        state <= STATE_SEARCH2;
                    end
                end
            end
            STATE_SEARCH2:begin
                if(locked_by_cpu) begin
                    state <= STATE_WAIT;
                    nexthop <= 0;
                    port <= 0;
                    nexthop_not_found <= 0;
                    nexthop_valid <= 0;
                    lookup_ready <= 0;
                end else begin
                    lookup_ready <= 0;
                    if(dout[31:0]!=0)begin
                        ans <= dout[31:0];
                        case(current[1:0])
                            2'b00:ans_port <= dout_port[1:0];
                            2'b01:ans_port <= dout_port[3:2];
                            2'b10:ans_port <= dout_port[5:4];
                            2'b11:ans_port <= dout_port[7:6];
                        endcase
                    end
                    if(pos!=-1)begin
                        if(dest_ip_cache[pos] == 0)begin
                            current <= dout[47:32];
                            pos <= pos-1;
                        end else begin
                            current <= dout[63:48];
                            pos <= pos-1;
                        end
                    end else begin
                        current <= 0;
                    end
                    state <= STATE_SEARCH1;
                end
            end
        endcase
    end
end

endmodule