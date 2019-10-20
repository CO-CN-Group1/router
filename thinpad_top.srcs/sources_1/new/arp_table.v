module arp_table #(
    parameter PORT_LENGTH = 8,
    parameter IP_LENGTH = 32,
    parameter MAC_LENGTH = 48,
    parameter BUCKET_COUNT = 8,
    parameter BUCKET_DEPTH = 8
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

reg [IP_LENGTH+MAC_LENGTH+PORT_LENGTH-1:0]  data_entry[0:BUCKET_COUNT-1][0:BUCKET_DEPTH-1];

integer bucket_depth[0:BUCKET_COUNT-1];
integer bucket_ins_pos[0:BUCKET_COUNT-1];


localparam[2:0]
    STATE_IDLE = 0,
    STATE_SEARCH = 1,
    STATE_INSERT = 2;

reg[2:0] state = STATE_IDLE;


reg[IP_LENGTH-1:0] lookup_ip_cache;
reg[2:0] lookup_bucket_index;
integer current = 0;

integer debug = 0;

initial begin
    lookup_ready <= 1;
    insert_ready <= 1; 
    lookup_mac_valid <= 0;
end

always @(posedge clk) begin
    if(rst) begin
        lookup_mac <= 0;
        lookup_port <= 0;
        lookup_mac_valid <= 0;
        lookup_mac_not_found <= 0;
        lookup_ready <= 1;
        state <= STATE_IDLE;
        lookup_ip_cache <= 0;
        lookup_bucket_index <=0;
    end else begin
        case(state)
            STATE_IDLE:begin
                
                lookup_mac_valid <= 0;
                lookup_mac_not_found <= 0;
                if(lookup_valid) begin
                    debug <= 1;
                    lookup_ip_cache <= lookup_ip;
                    lookup_bucket_index <= lookup_ip[IP_LENGTH-1: IP_LENGTH-3];
                    lookup_ready <= 0;
                    insert_ready <= 0;
                    current <= 0;
                    state <= STATE_SEARCH;  
                end
            end
            STATE_INSERT:begin
                lookup_mac_valid <= 0;
                lookup_mac_not_found <= 0;
            end
            STATE_SEARCH:begin
                if(current == bucket_depth[lookup_bucket_index])begin
                    state <= STATE_IDLE;
                    lookup_mac <= 0;
                    lookup_mac_valid <= 1;
                    lookup_mac_not_found <= 1;
                    lookup_port <= 0;
                    lookup_ready <= 1;
                    insert_ready <= 1;
                end else begin
                    if(data_entry[lookup_bucket_index][current][IP_LENGTH+MAC_LENGTH+PORT_LENGTH-1:MAC_LENGTH+PORT_LENGTH]==lookup_ip_cache)begin
                        state<=STATE_IDLE;
                        lookup_ready<=1;
                        insert_ready<=1;
                        lookup_mac_valid <=1;
                        lookup_mac_not_found <= 0;
                        {lookup_mac,lookup_port} <= data_entry[lookup_bucket_index][current][MAC_LENGTH + PORT_LENGTH-1:0];
                    end else begin
                        current <= current+1;
                    end
                end
            end
        endcase
    end
end

reg[IP_LENGTH+MAC_LENGTH+PORT_LENGTH-1:0] data_entry_ins;
reg insert_bucket_index;

always @(posedge clk)begin
    if(rst) begin
        insert_ready <= 1;
        state<= STATE_IDLE;
        data_entry_ins <= 0;
        insert_bucket_index <= 0;
    end else begin
        case(state)
            STATE_IDLE:begin
                if(insert_valid)begin
                    state <= STATE_INSERT;
                    insert_ready <= 0;
                    lookup_ready <= 0;
                    insert_bucket_index <= insert_ip[IP_LENGTH-1:IP_LENGTH-3];
                    data_entry_ins <= {insert_ip,insert_mac,insert_port};
                end
            end
            STATE_INSERT:begin
                state <= STATE_IDLE;
                insert_ready  <= 1;
                lookup_ready <= 1;
                data_entry[insert_bucket_index][bucket_ins_pos[insert_bucket_index]] <= data_entry_ins;
                if(bucket_ins_pos[insert_bucket_index]==BUCKET_DEPTH)
                    bucket_ins_pos[insert_bucket_index] <= 0;
                else
                    bucket_ins_pos[insert_bucket_index] <= bucket_ins_pos[insert_bucket_index] + 1;

                if(bucket_depth[insert_bucket_index]<BUCKET_DEPTH)
                    bucket_depth[insert_bucket_index] <= bucket_depth[insert_bucket_index]+1;
            end
            STATE_SEARCH:begin
            end
        endcase
    end
end


endmodule
