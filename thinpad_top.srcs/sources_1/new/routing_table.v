module routing_table #(
    parameter PORT_LENGTH = 8,
    parameter IP_LENGTH = 32,
    parameter TRIE_SIZE = 256,
    parameter TRIE_INDEX_WIDTH = 8
)
(
    input wire                      clk,
    input wire                      rst,
    input wire [IP_LENGTH-1:0]      dest_ip,
    input wire                      dest_ip_valid,
    output reg [IP_LENGTH-1:0]      nexthop,
    output reg [PORT_LENGTH-1:0]    port,
    output reg                      lookup_ready,
    output reg                      nexthop_valid,
    output reg                      nexthop_not_found

);

reg [IP_LENGTH-1:0]                 dest_ip_cache;

reg[IP_LENGTH+PORT_LENGTH-1:0]      data_entry[0:TRIE_SIZE-1];
reg[TRIE_INDEX_WIDTH-1:0]           trie[0:TRIE_SIZE-1][0:1];
reg [TRIE_INDEX_WIDTH-1:0]          current;
reg [4:0]                           pos;
reg [IP_LENGTH+PORT_LENGTH-1:0]     ans;

initial begin
    nexthop = 0;
    port = 0;
    lookup_ready = 1;
    nexthop_not_found = 0;
    nexthop_valid = 0;
    current = 0;
    pos = 31;
end


localparam[1:0] 
    STATE_IDLE = 0,
    STATE_BUSY = 1,
    STATE_OUT  = 2;
reg [1:0] state = STATE_IDLE;


always @(state) begin
    case (state)
        STATE_IDLE:lookup_ready <= 1;
        STATE_BUSY:lookup_ready <= 0;
        STATE_OUT: lookup_ready <= 0;
    endcase 
end

always @(current)begin
    if(data_entry[current]!=0)
        ans <= data_entry[current];
end

always @(posedge clk) begin
    if (rst) begin
        nexthop <= 0;
        port<=0;
        nexthop_valid<=0;
        nexthop_not_found<=0;
        dest_ip_cache <=0;
        current<=0;
        state<=STATE_IDLE;
        pos<=31;
        ans<=0;
    end else begin
        case(state)
            STATE_IDLE:begin
                if(dest_ip_valid)begin
                    state <= STATE_BUSY;
                    dest_ip_cache <= dest_ip;
                    current <= 1;
                end else begin
                    current <= 0;
                end
                nexthop_valid <= 0;
                nexthop_not_found <= 0;
                pos <= 31;
                ans <= 0; 
            end
            STATE_BUSY:begin
                if(current == 0)begin
                    {nexthop,port} <= ans;
                    if(ans == 0)
                        nexthop_not_found <=1;
                    else
                        nexthop_not_found <=0;
                    nexthop_valid <= 1;
                    state<=STATE_OUT;
                end else begin
                    if(dest_ip_cache[pos]==0)begin
                        current <= trie[current][0];
                        pos <= pos-1;
                    end else begin
                        current <= trie[current][1];
                        pos <= pos-1;
                    end          
                end
            end
            STATE_OUT:begin
                state <= STATE_IDLE;
                nexthop_valid <= 0;
                nexthop_not_found <= 0;
            end
        endcase 
    end
end
endmodule
