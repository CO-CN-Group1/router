module arp_table(
    input wire clk,
    input wire rst,

    input wire[31:0] lookup_ip,
    output reg[47:0] lookup_mac,
    output reg[15:0] lookup_port,
    input wire lookup_valid,
    output reg lookup_mac_valid,
    output reg lookup_mac_not_found,
    output reg lookup_ready,

    input wire[31:0] insert_ip,
    input wire[47:0] insert_mac,
    input wire[15:0] insert_port,
    input wire insert_valid,
    output reg insert_ready
);


wire[6:0] addra;
wire[95:0] douta;

reg web;
reg[95:0] dinb;
wire[95:0] doutb;
wire[6:0] addrb; 


xpm_memory_tdpram #(
    .ADDR_WIDTH_A(4+3),
    .WRITE_DATA_WIDTH_A(96),
    .BYTE_WRITE_WIDTH_A(96),
    .READ_DATA_WIDTH_A(96),
    .READ_LATENCY_A(0),
    .ADDR_WIDTH_B(4+3),
    .WRITE_DATA_WIDTH_B(96),
    .BYTE_WRITE_WIDTH_B(96),
    .READ_DATA_WIDTH_A(96),
    .MEMORY_SIZE(128*96),
    .READ_LATENCY_B(1)
) xpm_memory_tdpram_inst (
    // a for lookup, b for insert
    .dina(96'b0),
    .douta(douta),
    .addra(addra),
    .wea(1'b0),
    .clka(clk),
    .rsta(rst),
    .ena(1'b1),

    .dinb(dinb),
    .doutb(doutb),
    .addrb(addrb),
    .web(web),
    .clkb(clk),
    .rstb(rst),
    .enb(1'b1)
);

localparam[1:0] 
    STATE_LOOKUP_IDLE = 0,
    STATE_LOOKUP_LOOKUP = 1;

reg[1:0] state_lookup;

reg[31:0] lookup_ip_cache;

wire[3:0] lookup_bucket_index; 

/*
使用hash的方式实现arp table
共有2^4 = 16个桶
每个桶的大小�?8
lookup_bucket_index 为lookup_ip对应的桶的编�?
*/
assign lookup_bucket_index = {lookup_ip_cache[11],lookup_ip_cache[10],lookup_ip_cache[9],lookup_ip_cache[8]};

reg [3:0] lookup_current_depth;

assign addra = {lookup_bucket_index,lookup_current_depth[2:0]};

always @(posedge clk) begin
    if(rst)begin
        state_lookup <= STATE_LOOKUP_IDLE;
        lookup_mac <= 48'b0;
        lookup_port <= 16'b0;
        lookup_mac_valid <= 1'b0;
        lookup_mac_not_found <= 1'b0;
        lookup_ip_cache <= 32'b0;
        lookup_current_depth <= 4'b0;
        lookup_ready <= 1'b0;
    end else begin
        case(state_lookup)
            STATE_LOOKUP_IDLE:begin
                if(lookup_valid && lookup_ready) begin
                    lookup_ip_cache <= lookup_ip;
                    lookup_ready <= 1'b0;
                    lookup_mac <= 48'b0;
                    lookup_port <= 16'b0;
                    lookup_current_depth <= 4'b0;
                    lookup_mac_valid <= 1'b0;
                    lookup_mac_not_found <= 1'b0;
                    state_lookup <= STATE_LOOKUP_LOOKUP;
                end else begin
                    lookup_mac <= 48'b0;
                    lookup_port <= 16'b0;
                    lookup_mac_valid <= 1'b0;
                    lookup_mac_not_found <= 1'b0;
                    lookup_ip_cache <= 32'b0;
                    lookup_ready <= 1'b1;
                    lookup_current_depth <= 4'b0;
                end
            end
            STATE_LOOKUP_LOOKUP:begin
                if(lookup_current_depth == 4'b1000)begin
                    /*if(douta[95:64]==lookup_ip_cache) begin
                        {lookup_mac,lookup_port} <= douta[63:0];
                        lookup_mac_valid <= 1'b1;
                        lookup_mac_not_found <= 1'b0;
                        lookup_ip_cache <= 32'b0;
                        lookup_current_depth <= 4'b0;
                        state_lookup<=STATE_LOOKUP_IDLE;
                    end else begin*/
                        lookup_mac <= 48'b0;
                        lookup_port <= 16'b0;
                        lookup_mac_valid <= 1'b1;
                        lookup_mac_not_found <= 1'b1;
                        lookup_ip_cache <= 32'b0;
                        lookup_current_depth <= 4'b0;
                        state_lookup<=STATE_LOOKUP_IDLE;
                    /*end*/
                end else if(douta[95:64]==lookup_ip_cache) begin
                    {lookup_mac,lookup_port} <= douta[63:0];
                    lookup_mac_valid <= 1'b1;
                    lookup_mac_not_found <= 1'b0;
                    lookup_ip_cache <= 32'b0;
                    lookup_current_depth <= 4'b0;
                    state_lookup<=STATE_LOOKUP_IDLE;
                end else
                    lookup_current_depth <= lookup_current_depth +1;
            end
        endcase
    end
end

localparam[1:0] 
    STATE_INSERT_IDLE = 0,
    STATE_INSERT_LOOKUP = 1,
    STATE_INSERT_INSERT = 2;

reg[1:0] state_insert;

reg[31:0] insert_ip_cache;
reg[47:0] insert_mac_cache;
reg[15:0] insert_port_cache;

wire[3:0] insert_bucket_index; 

/*
使用hash的方式实现arp table
共有2^4 = 16个桶
每个桶的大小�?8
insert_bucket_index 为insert_ip对应的桶的编�?
*/
assign insert_bucket_index = {insert_ip_cache[11],insert_ip_cache[10],insert_ip_cache[9],insert_ip_cache[8]};

reg [3:0] insert_current_depth;
reg [2:0] insert_hash_depth;

assign addrb = {insert_bucket_index,insert_current_depth[2:0]};

always @(posedge clk)begin
    if(rst)begin
        state_insert <= STATE_INSERT_IDLE;
        insert_ip_cache <= 32'b0;
        insert_mac_cache <= 48'b0;
        insert_port_cache <= 16'b0;
        insert_current_depth <= 4'b0;
        insert_hash_depth <= 3'b0;
        insert_ready <= 1'b0;
        web <= 1'b0;
        dinb <= 96'b0;
    end else begin
        case(state_insert)
            STATE_INSERT_IDLE:begin
                if(insert_valid && insert_ready)begin
                    state_insert <= STATE_INSERT_LOOKUP;
                    insert_ip_cache <= insert_ip;
                    insert_mac_cache <= insert_mac;
                    insert_port_cache <= insert_port;
                    insert_current_depth <= 4'b0;
                    insert_ready <= 1'b0;
                    web <= 1'b0;
                    dinb <= 96'b0;
                end else begin
                    insert_ip_cache <= 32'b0;
                    insert_mac_cache <= 48'b0;
                    insert_port_cache <= 16'b0;
                    insert_current_depth <= 4'b0;
                    insert_ready <= 1'b1;
                    web <= 1'b0;
                    dinb <= 96'b0;
                end
            end
            STATE_INSERT_LOOKUP:begin
                if(insert_current_depth == 4'b1000)begin
                    if(doutb[95:64]==insert_ip_cache) begin
                        state_insert <= STATE_INSERT_INSERT;
                        insert_current_depth <= insert_current_depth - 1;
                    end else begin
                        // ARP表里没有出现过这�?条ip
                        insert_current_depth <= {1'b0,insert_hash_depth};
                        insert_hash_depth <= insert_hash_depth+3;
                        state_insert <= STATE_INSERT_INSERT;
                    end
                end else if(doutb[95:64]==insert_ip_cache) begin
                    state_insert <= STATE_INSERT_INSERT;
                    insert_current_depth <= insert_current_depth - 1;
                    // 出现过，是修�?
                end else
                    insert_current_depth <= insert_current_depth +1;
            end
            STATE_INSERT_INSERT:begin
                dinb <= {insert_ip_cache,insert_mac_cache,insert_port_cache};
                web <= 1'b1;
                state_insert <= STATE_INSERT_IDLE;
            end
        endcase
    end
end
endmodule