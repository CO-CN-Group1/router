module routing_table #(
    parameter IP_LENGTH = 32,
    parameter TABLE_COUNT = 64,
    parameter TRIE_INDEX_COUNT = TABLE_COUNT*IP_LENGTH,
    parameter TRIE_INDEX_WIDTH = 6+5,
    parameter BYTE_WIDTH = 8
)
(
    input wire                          clk,
    input wire                          rst,
    input wire [IP_LENGTH-1:0]          dest_ip,
    input wire                          dest_ip_valid,
    output reg [IP_LENGTH-1:0]          nexthop,
    output reg                          lookup_ready,
    output reg                          nexthop_valid,
    output reg                          nexthop_not_found,

    input wire                          os_clk,
    input wire[TRIE_INDEX_WIDTH-1:0]    os_addr,
    input wire[IP_LENGTH+2*TRIE_INDEX_WIDTH-1:0] os_din,
    output wire[IP_LENGTH+2*TRIE_INDEX_WIDTH-1:0]os_dout,
    input wire                          os_wea,
    input wire                          os_rst,
    input wire                          os_en
);

reg[TRIE_INDEX_WIDTH-1:0] current = 1;
wire[IP_LENGTH+2*TRIE_INDEX_WIDTH-1:0] lookup_dout;

xpm_memory_tdpram #(
    .ADDR_WIDTH_A(TRIE_INDEX_WIDTH),
    .WRITE_DATA_WIDTH_A(IP_LENGTH+2*TRIE_INDEX_WIDTH),
    .BYTE_WRITE_WIDTH_A(IP_LENGTH+2*TRIE_INDEX_WIDTH),
    .READ_DATA_WIDTH_A(IP_LENGTH+2*TRIE_INDEX_WIDTH),
    .ADDR_WIDTH_B(TRIE_INDEX_WIDTH),
    .READ_LATENCY_A(0),
    .WRITE_DATA_WIDTH_B(IP_LENGTH+2*TRIE_INDEX_WIDTH),
    .BYTE_WRITE_WIDTH_B(IP_LENGTH+2*TRIE_INDEX_WIDTH),
    .READ_DATA_WIDTH_B(IP_LENGTH+2*TRIE_INDEX_WIDTH),
    .READ_LATENCY_B(0),
    .MEMORY_SIZE(TRIE_INDEX_COUNT * (IP_LENGTH + 2*TRIE_INDEX_WIDTH))
) xpm_memory_tdpram_data (
    .dina(os_din),
    .addra(os_addr),
    .wea(os_wea),
    .douta(os_dout),
    .clka(os_clk),
    .rsta(os_rst),
    .ena(os_en),

    .dinb(54'b0),
    .addrb(current),
    .web(1'b0),
    .doutb(lookup_dout),
    .clkb(clk),
    .rstb(rst),
    .enb(1'b1)
);

reg [IP_LENGTH-1:0]                 dest_ip_cache;

localparam[2:0] 
    STATE_INIT = 0,
    STATE_IDLE = 1,
    STATE_SEARCH = 2;
reg [2:0] state = STATE_INIT;


reg [IP_LENGTH-1:0] best_ans;

always @(posedge clk)begin
    if(rst)begin
        nexthop <= 0;
        lookup_ready = 0;
        state <= STATE_INIT;
        nexthop_not_found <= 0;
        nexthop_valid <= 0;
        current <= 0;
        best_ans <= 0;
    end else if(state==STATE_INIT)begin
        lookup_ready <= 1;
        state <= STATE_IDLE;
        current <= 1;
        best_ans <= 0;
    end
end

integer pos;

reg[53:0] debug;

always @(posedge clk) begin
    if(!rst && state!=STATE_INIT) begin
        case(state)
            STATE_IDLE:begin
                if(dest_ip_valid)begin
                    state <= STATE_SEARCH;
                    dest_ip_cache <= dest_ip;
                    current <= 1;
                    best_ans <= 0;
                    pos <= 31;
                    lookup_ready <= 0;
                end
                nexthop_valid <= 0;
                debug <= 0;
                nexthop_not_found <= 0;
            end
            STATE_SEARCH:begin
                if(current == 0)begin
                    nexthop <= best_ans;
                    if(best_ans==0)
                        nexthop_not_found <= 1;
                    else
                        nexthop_not_found <= 0;
                    nexthop_valid <= 1;
                    state <= STATE_IDLE;
                    lookup_ready <= 1;
                end else begin
                    if(lookup_dout[IP_LENGTH-1:0]!=0)
                        best_ans <= lookup_dout[IP_LENGTH-1:0];
                    if(pos!=-1)begin
                        if(dest_ip_cache[pos] == 0)begin
                            debug <= lookup_dout;
                            current <= lookup_dout[IP_LENGTH+2*TRIE_INDEX_WIDTH-1:IP_LENGTH+TRIE_INDEX_WIDTH];
                            pos<=pos-1;
                        end else begin
                            current <= lookup_dout[IP_LENGTH+TRIE_INDEX_WIDTH-1:IP_LENGTH];
                            pos<=pos-1;
                        end
                    end else begin
                        current <= 0;
                    end
                end
            end
        endcase
    end
end
endmodule
