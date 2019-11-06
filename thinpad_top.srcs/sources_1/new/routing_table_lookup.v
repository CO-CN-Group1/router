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
    input  wire                     tx_axis_tready,
    output reg [15:0] led_out
);



reg [DATA_WIDTH-1:0] data[0:FRAME_LENGTH/DATA_WIDTH-1];
integer data_head = 0, data_tail = 0;
localparam[3:0]
    STATE_IDLE = 0,
    STATE_INPUT = 1,
    STATE_COMPUTE = 2,
    STATE_OUTPUT = 3,
    STATE_ARPUPDATE=4,
    STATE_ARPRESPONSE=5,
    STATE_ROUTING=6,
    STATE_ARPQUERY=7,
    STATE_ARPREQUEST=8,
    STATE_SLEEP=9;
(*mark_debug="true"*)reg[3:0] state = STATE_IDLE;

reg [IP_LENGTH-1:0] my_ip=32'h0a000001;
reg [MAC_LENGTH-1:0] my_mac=48'h00cdefabcdef;
reg [IP_LENGTH-1:0] dest_ip;
reg dest_ip_valid = 0;
wire lookup_ready;
wire [IP_LENGTH-1:0] nexthop;
reg [IP_LENGTH-1:0] nexthop_cache;
wire nexthop_valid;
reg lookup_valid=0;
wire nexthop_not_found;

initial begin
    //tx_axis_tdata = 0;
    //tx_axis_tlast = 0;
    dest_ip = 0;
    //dest_ip_valid = 0;
end

routing_table #(
    .IP_LENGTH(IP_LENGTH)
) routing_table_inst(
    .clk(clk),
    .rst(rst),
    
    .dest_ip(dest_ip),
    .dest_ip_valid(dest_ip_valid),
    .nexthop(nexthop),
    .lookup_ready(lookup_ready),
    .nexthop_valid(nexthop_valid),
    .nexthop_not_found(nexthop_not_found)
);

wire[MAC_LENGTH-1:0] lookup_mac;
wire[PORT_LENGTH-1:0] lookup_port;
wire lookup_mac_valid;
wire lookup_mac_not_found;
wire lookup_ready_arp;

reg [IP_LENGTH-1:0]   insert_ip;
reg [MAC_LENGTH-1:0]  insert_mac;
reg [PORT_LENGTH-1:0] insert_port;
reg insert_valid=0;
wire insert_ready;
arp_table #(
    .IP_LENGTH(IP_LENGTH),
    .PORT_LENGTH(PORT_LENGTH),
    .MAC_LENGTH(MAC_LENGTH)
) arp_table_inst(
    .clk(clk),
    .rst(rst),
    
    .lookup_ip(nexthop_cache),
    .lookup_valid(lookup_valid),
    .lookup_mac(lookup_mac),
    .lookup_mac_valid(lookup_mac_valid),
    .lookup_port(lookup_port),
    .lookup_ready(lookup_ready_arp),
    .lookup_mac_not_found(lookup_mac_not_found),
    
    .insert_ip(insert_ip),
    .insert_mac(insert_mac),
    .insert_port(insert_port),
    .insert_valid(insert_valid),
    .insert_ready(insert_ready)
);


reg rx_axis_tready_int=0;
//assign rx_axis_tready = (state==STATE_IDLE)||(state == STATE_INPUT);
assign rx_axis_tready = rx_axis_tready_int;

assign tx_axis_tdata = data[data_head];
assign tx_axis_tlast = (data_head+1==data_tail);

always @(posedge clk or posedge rst)begin
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
                //led_out<=16'h0000;
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
                led_out<=16'h1100;
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
                if (data[16]==8'h08 && data[17]==8'h06) begin
                    state<=STATE_ARPUPDATE;
                    insert_valid<=1;
                    insert_ip<={data[32],data[33],data[34],data[35]};
                    insert_mac<={data[6],data[7],data[8],data[9],data[10],data[11]};
                    insert_port<={data[14],data[15]};
                end
                else begin
                    if ({data[34],data[35],data[36],data[37]}==my_ip) begin
                        //TODO: write to software interface
                        state<=STATE_IDLE;
                    end
                    else begin
                        if (data[26]==0) begin
                            state<=STATE_IDLE;
                        end
                        else begin
                            state<=STATE_ROUTING;
                            dest_ip_valid<=1;
                            dest_ip <= {data[34],data[35],data[36],data[37]};
                        end
                    end
                end
            end
            STATE_ARPUPDATE:begin
                if (insert_ready) begin
                    insert_valid<=0;
                    if (data[24]==8'h00 && data[25]==8'h01) begin
                        if ({data[42],data[43],data[44],data[45]}==my_ip) begin
                            state<=STATE_ARPRESPONSE;
                        end
                        else begin
                            state<=STATE_IDLE;
                        end
                    end
                    else begin
                        state<=STATE_IDLE;
                    end
                end else begin
                    //insert_valid<=0;
                end
            end
            STATE_ARPRESPONSE:begin
                data[0]<=data[6];
                data[1]<=data[7];
                data[2]<=data[8];
                data[3]<=data[9];
                data[4]<=data[10];
                data[5]<=data[11];
                {data[6],data[7],data[8],data[9],data[10],data[11]}<=my_mac;
                //data[12]<=8'h81;
                //data[13]<=8'h00;
                data[16]<=8'h08;
                data[17]<=8'h06;
                data[18]<=8'h00;//todo
                data[19]<=8'h01;//todo
                data[20]<=8'h08;
                data[21]<=8'h00;
                data[22]<=8'h06;//todo
                data[23]<=8'h04;
                data[24]<=8'h00;
                data[25]<=8'h02;
                {data[26],data[27],data[28],data[29],data[30],data[31]}<=my_mac;
                {data[32],data[33],data[34],data[35]}<=my_ip;
                {data[36],data[37],data[38],data[39],data[40],data[41]}<={data[6],data[7],data[8],data[9],data[10],data[11]};
                {data[42],data[43],data[44],data[45]}<={data[32],data[33],data[34],data[35]};
                {data[46],data[47],data[48],data[49],data[50],data[51],data[52],data[53],data[54],data[55],data[56],data[57],data[58],data[59]}=112'h0000000000000000000000000000;
                data_tail<=60;
                state<=STATE_OUTPUT;
            end
            STATE_ROUTING:begin
                if (dest_ip_valid) begin
                    if(lookup_ready)begin
                        dest_ip_valid <= 0;
                    end else begin 
                        //dest_ip_valid <= 0;
                    end
                end
                else begin
                    if(nexthop_valid) begin
                        nexthop_cache<=nexthop;
                        state<=STATE_SLEEP;
                        //lookup_valid<=1;
                    end
                end
            end
            STATE_SLEEP:begin
                state<=STATE_ARPQUERY;
                lookup_valid<=1;
            end
            STATE_ARPQUERY:begin
                if (lookup_valid) begin
                    if(lookup_ready_arp) begin
                        lookup_valid<=0;
                    end
                    else begin
                        //lookup_valid<=0;
                    end
                end
                else begin
                    if(lookup_mac_valid) begin
                        if (lookup_mac_not_found) begin
                            //state<=STATE_ARPREQUEST;
                            data[0]<=8'hff;
                            data[1]<=8'hff;
                            data[2]<=8'hff;
                            data[3]<=8'hff;
                            data[4]<=8'hff;
                            data[5]<=8'hff;
                            {data[6],data[7],data[8],data[9],data[10],data[11]}<=my_mac;
                            //data[12]<=8'h81;
                            //data[13]<=8'h00;
                            data[16]<=8'h08;
                            data[17]<=8'h06;
                            data[18]<=8'h00;//todo
                            data[19]<=8'h01;//todo
                            data[20]<=8'h08;
                            data[21]<=8'h00;
                            data[22]<=8'h06;//todo
                            data[23]<=8'h04;
                            data[24]<=8'h00;
                            data[25]<=8'h01;
                            {data[26],data[27],data[28],data[29],data[30],data[31]}<=my_mac;
                            {data[32],data[33],data[34],data[35]}<=my_ip;
                            {data[36],data[37],data[38],data[39],data[40],data[41]}<=48'h000000000000;
                            {data[42],data[43],data[44],data[45]}<=nexthop_cache;//{data[34],data[35],data[36],data[37]};
                            {data[46],data[47],data[48],data[49],data[50],data[51],data[52],data[53],data[54],data[55],data[56],data[57],data[58],data[59]}=112'h0000000000000000000000000000;
                            data_tail<=60;
                            state <= STATE_OUTPUT;
                        end
                        else begin
                            {data[14],data[15]}<=lookup_port;
                            data[26]<=data[26]-1;
                            if (data[29]==8'b11111111) begin
                                data[28]<=data[28]+1;
                            end
                            data[29]<=data[29]+1;
                            {data[0],data[1],data[2],data[3],data[4],data[5]}<=lookup_mac;
                            state<=STATE_OUTPUT;
                        end
                        //state <= STATE_OUTPUT;
                        //tx_axis_tvalid<=1;
                    end
                end
            end
            STATE_ARPREQUEST:begin
                data[0]<=8'hff;
                data[1]<=8'hff;
                data[2]<=8'hff;
                data[3]<=8'hff;
                data[4]<=8'hff;
                data[5]<=8'hff;
                {data[6],data[7],data[8],data[9],data[10],data[11]}<=my_mac;
                //data[12]<=8'h81;
                //data[13]<=8'h00;
                data[16]<=8'h08;
                data[17]<=8'h06;
                data[18]<=8'h00;//todo
                data[19]<=8'h01;//todo
                data[20]<=8'h08;
                data[21]<=8'h00;
                data[22]<=8'h06;//todo
                data[23]<=8'h04;
                data[24]<=8'h00;
                data[25]<=8'h01;
                {data[26],data[27],data[28],data[29],data[30],data[31]}<=my_mac;
                {data[32],data[33],data[34],data[35]}<=my_ip;
                {data[36],data[37],data[38],data[39],data[40],data[41]}<=48'h000000000000;
                {data[42],data[43],data[44],data[45]}<=nexthop_cache;//{data[34],data[35],data[36],data[37]};
                {data[46],data[47],data[48],data[49],data[50],data[51],data[52],data[53],data[54],data[55],data[56],data[57],data[58],data[59]}=112'h0000000000000000000000000000;
                data_tail<=60;
                state <= STATE_OUTPUT;
                //tx_axis_tvalid<=1;
            end
            STATE_OUTPUT:begin
                tx_axis_tvalid<=1;
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
