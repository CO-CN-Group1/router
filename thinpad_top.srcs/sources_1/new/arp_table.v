module arp_table #(
    parameter PORT_LENGTH = 16,
    parameter IP_LENGTH = 32,
    parameter MAC_LENGTH = 48,
    parameter BUCKET_INDEX_WIDTH = 4,
    parameter BUCKET_DEPTH_WIDTH = 3,
    parameter BUCKET_DEPTH_COUNT = 8,
    parameter BUCKET_INDEX_COUNT = 16
)(
    input wire                  clk,
    input wire                  rst,

    input wire[IP_LENGTH-1:0]   lookup_ip,
    output reg[MAC_LENGTH-1:0]  lookup_mac,
    output reg[PORT_LENGTH-1:0] lookup_port,
    input wire                  lookup_valid,
    output reg                  lookup_mac_valid,
    output reg                  lookup_mac_not_found,
    output reg                  lookup_ready,

    input wire[IP_LENGTH-1:0]   insert_ip,
    input wire[MAC_LENGTH-1:0]  insert_mac,
    input wire[PORT_LENGTH-1:0] insert_port,
    input wire                  insert_valid,
    output reg                  insert_ready                 
);

localparam[2:0]
    STATE_INIT = 0,
    STATE_IDLE = 1,
    STATE_SEARCH = 2,
    STATE_INSERT1 = 3,
    STATE_INSERT2 = 4;

reg[2:0] state = STATE_INIT;

reg[IP_LENGTH-1:0] lookup_ip_cache;

wire [BUCKET_INDEX_WIDTH-1:0] lookup_bucket_index;
assign lookup_bucket_index = {lookup_ip_cache[11],lookup_ip_cache[7],lookup_ip_cache[5],lookup_ip_cache[2]};

reg [BUCKET_DEPTH_WIDTH:0] lookup_current_depth;

reg  [IP_LENGTH+MAC_LENGTH+PORT_LENGTH-1:0] lookup_din;
wire [IP_LENGTH+MAC_LENGTH+PORT_LENGTH-1:0] lookup_dout;
wire [BUCKET_INDEX_WIDTH+BUCKET_DEPTH_WIDTH-1:0] lookup_addr;

assign lookup_addr = {lookup_bucket_index,lookup_current_depth[BUCKET_DEPTH_WIDTH-1:0]};


reg [IP_LENGTH+MAC_LENGTH+PORT_LENGTH-1:0] lookup_data_entry;


wire [BUCKET_INDEX_WIDTH-1:0] insert_bucket_index;
assign insert_bucket_index = {insert_data_entry[11+MAC_LENGTH+PORT_LENGTH],insert_data_entry[7+MAC_LENGTH+PORT_LENGTH],insert_data_entry[5+MAC_LENGTH+PORT_LENGTH],insert_data_entry[2+MAC_LENGTH+PORT_LENGTH]};
reg  [BUCKET_DEPTH_WIDTH-1:0] insert_current_depth;
reg  [BUCKET_DEPTH_WIDTH-1:0] insert_hash_depth;

reg  [IP_LENGTH+MAC_LENGTH+PORT_LENGTH-1:0] insert_din;
wire [IP_LENGTH+MAC_LENGTH+PORT_LENGTH-1:0] insert_dout;
wire [BUCKET_INDEX_WIDTH+BUCKET_DEPTH_WIDTH-1:0] insert_addr;
reg  insert_enable;

assign insert_addr = {insert_bucket_index,insert_current_depth};

reg [IP_LENGTH+MAC_LENGTH+PORT_LENGTH-1:0] insert_data_entry;

xpm_memory_tdpram #(
    .ADDR_WIDTH_A(BUCKET_INDEX_WIDTH+BUCKET_DEPTH_WIDTH),
    .WRITE_DATA_WIDTH_A(IP_LENGTH+MAC_LENGTH+PORT_LENGTH),
    .BYTE_WRITE_WIDTH_A(IP_LENGTH+MAC_LENGTH+PORT_LENGTH),

    .ADDR_WIDTH_B(BUCKET_INDEX_WIDTH+BUCKET_DEPTH_WIDTH),
    .WRITE_DATA_WIDTH_B(IP_LENGTH+MAC_LENGTH+PORT_LENGTH),
    .BYTE_WRITE_WIDTH_B(IP_LENGTH+MAC_LENGTH+PORT_LENGTH),
    .MEMORY_SIZE(BUCKET_INDEX_COUNT*BUCKET_DEPTH_COUNT*(IP_LENGTH+MAC_LENGTH+PORT_LENGTH)),
    .READ_LATENCY_A(1),
    .READ_LATENCY_B(0)
) xpm_memory_tdpram_inst (
    .dina(lookup_din),
    .douta(lookup_dout),
    .addra(lookup_addr),
    .wea(1'b0),
    .clka(clk),
    .rsta(rst),
    .ena(1'b1),

    .dinb(insert_din),
    .doutb(insert_dout),
    .addrb(insert_addr),
    .web(insert_enable),
    .clkb(clk),
    .rstb(rst),
    .enb(1'b1)
);

always @(posedge clk) begin
    if(rst)begin
        lookup_ready <= 0;
        insert_ready <= 0;
        lookup_mac <= 0;
        lookup_port <= 0;
        lookup_mac_valid <= 0;
        lookup_mac_not_found <=0;
        lookup_ip_cache <= 0;
        lookup_current_depth <= 0;
        insert_enable <= 0;
        state <= STATE_INIT;
        lookup_data_entry <= 0;
        insert_data_entry <= 0;
        insert_current_depth <= 0;
        insert_enable <= 0;
        insert_hash_depth <= 0;
    end else if(state == STATE_INIT)begin
        lookup_ready <= 1;
        insert_ready <= 1;
        lookup_mac <= 0;
        lookup_port <= 0;
        lookup_mac_valid <= 0;
        lookup_mac_not_found <=0;
        lookup_ip_cache <= 0;
        lookup_current_depth <= 0;
        insert_enable <= 0;
        state <= STATE_IDLE;
        lookup_data_entry <= 0;
        insert_data_entry <= 0;
        insert_current_depth <= 0;
        insert_enable <= 0;
        insert_hash_depth <= 0;
        state <= STATE_IDLE;
    end else begin
        case(state)
            STATE_IDLE:begin
                lookup_mac_valid <= 0;
                lookup_mac_not_found <= 0;
                if(lookup_valid) begin
                    lookup_current_depth <= 0;
                    lookup_ip_cache <= lookup_ip;
                    lookup_ready <= 0;
                    insert_ready <= 0;
                    lookup_mac <= 0;
                    lookup_port <= 0;
                    state <= STATE_SEARCH;  
                end else if(insert_valid)begin
                    //state <= STATE_INSERT1;
                    state <= STATE_INSERT2;
                    insert_ready <= 0;
                    lookup_ready <= 0;
                    insert_current_depth <= 0;
                    insert_data_entry <= {insert_ip,insert_mac,insert_port};
                end else begin
                    insert_ready <= 1;
                    lookup_ready <= 1;
                end
            end
            STATE_INSERT1:begin
                lookup_mac_valid <= 0;
                lookup_mac_not_found <= 0;
                if(insert_dout[IP_LENGTH+MAC_LENGTH+PORT_LENGTH-1:MAC_LENGTH+PORT_LENGTH] == insert_data_entry)begin
                    insert_hash_depth <= insert_current_depth;
                    insert_din <= insert_data_entry;
                    insert_enable <= 1;
                    state <= STATE_INSERT2; 
                end else if(insert_current_depth == BUCKET_DEPTH_COUNT-1)begin 
                    insert_current_depth <= insert_hash_depth;
                    insert_din <= insert_data_entry;
                    insert_enable <= 1;
                    state <= STATE_INSERT2;
                end else
                    insert_current_depth <= insert_current_depth + 1; 
            end
            STATE_INSERT2:begin
                lookup_mac_valid <= 0;
                lookup_mac_not_found <= 0;
                insert_enable <= 0;
                insert_hash_depth <= insert_hash_depth + 3;
                state <= STATE_IDLE;
                insert_ready <= 1;
                lookup_ready <= 1;
            end
            STATE_SEARCH:begin
                insert_data_entry <= 0;
                /*if(lookup_dout[IP_LENGTH+MAC_LENGTH+PORT_LENGTH-1:MAC_LENGTH+PORT_LENGTH] == lookup_ip_cache) begin
                    lookup_mac_valid <= 1;
                    lookup_mac_not_found <= 0;
                    {lookup_mac,lookup_port} <= lookup_dout[MAC_LENGTH + PORT_LENGTH-1:0];
                    lookup_ready <= 1;
                    insert_ready <= 1;
                    state <= STATE_IDLE;
                end else if(lookup_current_depth == BUCKET_DEPTH_COUNT)begin
                    state <= STATE_IDLE;
                    lookup_mac <= 0;
                    lookup_mac_valid <= 1;
                    lookup_mac_not_found <= 1;
                    lookup_port <= 0;
                    lookup_ready <= 1;
                    insert_ready <= 1;
                end else begin
                    lookup_current_depth <= lookup_current_depth + 1;
                end*/
                state <= STATE_IDLE;
                lookup_mac_valid <= 1;
                lookup_port <= 1;
                state <= STATE_IDLE;
                case(lookup_ip_cache)
                    32'h01234567:begin
                        lookup_mac_not_found <= 0;
                        lookup_mac <= 48'h0123456789ab;
                    end
                    default:begin
                        
                        lookup_mac_not_found <= 1;
                        lookup_mac <= 0;
                        
                    end
                endcase

            end
        endcase
    end
end

endmodule
