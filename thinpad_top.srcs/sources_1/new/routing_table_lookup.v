module routing_table_lookup #
(
    parameter DATA_WIDTH = 8,
    parameter FRAME_LENGTH = 4096,
    parameter IP_LENGTH = 32,
    parameter PORT_LENGTH = 8,
    parameter MAC_LENGTH = 48
)(
    input wire                      clk,
    input wire                      rst,
    
    input wire [DATA_WIDTH-1:0]     rx_axis_tdata,
    input wire                      rx_axis_tvalid,
    input wire                      rx_axis_tlast,
    output wire                     rx_axis_tready,

    output wire [DATA_WIDTH-1:0]     tx_axis_tdata,
    output reg                      tx_axis_tvalid,
    output wire                      tx_axis_tlast,
    input  wire                     tx_axis_tready
);



reg [DATA_WIDTH-1:0] data[0:FRAME_LENGTH/DATA_WIDTH-1];
integer data_head = 0, data_tail = 0;
localparam[1:0]
    STATE_IDLE = 0,
    STATE_INPUT = 1,
    STATE_COMPUTE = 2,
    STATE_OUTPUT = 3;
reg[1:0] state = STATE_IDLE;

reg [IP_LENGTH-1:0] dest_ip;
reg dest_ip_valid = 0;
wire lookup_ready;
wire [IP_LENGTH-1:0] nexthop;
wire [PORT_LENGTH-1:0] port;
wire nexthop_valid;
wire nexthop_not_found;

initial begin
    //tx_axis_tdata = 0;
    //tx_axis_tlast = 0;
    dest_ip = 0;
    dest_ip_valid = 0;
end

routing_table #(
    .IP_LENGTH(IP_LENGTH),
    .PORT_LENGTH(PORT_LENGTH)
) routing_table_inst(
    .clk(clk),
    .rst(rst),
    
    .dest_ip(dest_ip),
    .dest_ip_valid(dest_ip_valid),
    .nexthop(nexthop),
    .port(port),
    .lookup_ready(lookup_ready),
    .nexthop_valid(nexthop_valid),
    .nexthop_not_found(nexthop_not_found)
);

wire[MAC_LENGTH-1:0] lookup_mac;
wire[PORT_LENGTH-1:0] lookup_port;
wire lookup_mac_valid;
wire lookup_mac_not_found;
wire lookup_ready_arp;

arp_table #(
    .IP_LENGTH(IP_LENGTH),
    .PORT_LENGTH(PORT_LENGTH),
    .MAC_LENGTH(MAC_LENGTH)
) arp_table_inst(
    .clk(clk),
    .rst(rst),
    
    .lookup_ip(dest_ip),
    .lookup_valid(dest_ip_valid),
    .lookup_mac(lookup_mac),
    .lookup_mac_valid(lookup_mac_valid),
    .lookup_port(lookup_port),
    .lookup_ready(lookup_ready_arp),
    .lookup_mac_not_found(lookup_mac_not_found)
);


reg rx_axis_tready_int=0;
//assign rx_axis_tready = (state==STATE_IDLE)||(state == STATE_INPUT);
assign rx_axis_tready = rx_axis_tready_int;

assign tx_axis_tdata = data[data_head];
assign tx_axis_tlast = (data_head+1==data_tail);

always @(posedge clk)begin
    if(rst) begin
        state <= STATE_IDLE;
        data_head <= 0;
        data_tail <= 0;
        //tx_axis_tdata <= 0;
        //tx_axis_tlast <= 0;
        tx_axis_tvalid <=0;
        //jrx_axis_tready_int <=0;
    end else begin
        case(state)
            STATE_IDLE:begin
                //tx_axis_tlast <=0;
                tx_axis_tvalid <=0;
                rx_axis_tready_int <=1;
                data_head <= 0;
                if(rx_axis_tvalid && rx_axis_tready_int)begin
                    state <= STATE_INPUT;
                    data[data_tail]<=rx_axis_tdata;
                    data_tail <= data_tail+1;
                end else begin
                    state <= STATE_IDLE;
                    data_tail <= 0;
                end    
            end
            STATE_INPUT:begin
                tx_axis_tvalid <=0;
                if(rx_axis_tvalid && rx_axis_tready_int)begin
                    if(rx_axis_tlast) begin
                        state <= STATE_COMPUTE;
                        rx_axis_tready_int <=0;
                    end else begin
                        rx_axis_tready_int <=1;
                    end
                    data[data_tail]<=rx_axis_tdata;
                    data_tail <= data_tail+1;
                end else begin
                    rx_axis_tready_int <=1;
                end
            end
            STATE_COMPUTE:begin
                if(nexthop_valid) begin
                    state <= STATE_OUTPUT;
                    tx_axis_tvalid<=1;
                end
                if(lookup_ready)begin
                    dest_ip <= {data[34],data[35],data[36],data[37]};
                    dest_ip_valid <= 1;
                end else begin 
                    dest_ip_valid <= 0;
                end
            end
            STATE_OUTPUT:begin
                if(tx_axis_tvalid && tx_axis_tready)begin
                    data_head<=data_head+1;
                    if(tx_axis_tlast)begin
                        //data_head <= data_head + 1;
                        //tx_axis_tlast <= 1;
                        state <= STATE_IDLE;
                        tx_axis_tvalid<=0;
                    end else begin
                        //data_head <= data_head + 1;
                    end
                end
            end
        endcase 
    end
end

endmodule
