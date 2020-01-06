module routing_table_lookup #
(
    parameter FIFO_LENGTH = 128,
    parameter FIFO_INDEX_WIDTH = 7
)(
    input wire clk,
    input wire rst,
    
    input wire[7:0] rx_axis_tdata,
    input wire rx_axis_tvalid,
    input wire rx_axis_tlast,
    output reg rx_axis_tready,

    input wire[7:0] receiver_data_i,
    output reg[7:0] receiver_data_o,
    output reg[10:0] receiver_addr,
    output reg receiver_ce,
    output reg receiver_we,

    output wire[7:0] tx_axis_tdata,
    output reg tx_axis_tvalid,
    output wire tx_axis_tlast,
    input wire tx_axis_tready,

    input wire[31:0] sender_data_i,
    output reg[31:0] sender_data_o,
    output reg[7:0] sender_addr,
    output reg sender_ce,
    output reg[3:0] sender_we,

    input wire router_table_os_clk,
    input wire[15:0] router_table_os_addr,
    input wire[63:0] router_table_os_din,
    output wire[63:0] router_table_os_dout,
    input wire[7:0] router_table_os_we,
    input wire[7:0] router_table_os_rst,
    input wire router_table_os_en,

    input wire[13:0] router_table_os_port_addr,
    input wire[31:0] router_table_os_port_din,
    output wire[31:0] router_table_os_port_dout,
    input wire[3:0] router_table_os_port_we,
    input wire router_table_os_port_en
);

reg[7:0] fifo[0:FIFO_LENGTH-1]; //数据fifo
reg fifo_tlast[0:FIFO_LENGTH-1]; //tlast fifo
reg fifo_replace_flag[0:FIFO_LENGTH-1];//是否替换该位

reg[7:0] fifo_replace_data[0:FIFO_LENGTH/4-1]; // 替换为的数据

integer tx_index,rx_index,finish_index,index_iter,rx_index_st,tx_index2,rx_index2;

wire[FIFO_INDEX_WIDTH-1:0] tx_index_,rx_index_,finish_index_,index_iter_;
wire[FIFO_INDEX_WIDTH-3:0] tx_index2_,rx_index2_;

assign tx_index_ = tx_index[FIFO_INDEX_WIDTH-1:0];
assign rx_index_ = rx_index[FIFO_INDEX_WIDTH-1:0];
assign finish_index_ = finish_index[FIFO_INDEX_WIDTH-1:0];
assign index_iter_ = index_iter[FIFO_INDEX_WIDTH-1:0];
assign tx_index2_ = tx_index2[FIFO_INDEX_WIDTH-3:0];
assign rx_index2_ = rx_index2[FIFO_INDEX_WIDTH-3:0];

assign tx_axis_tdata = (fifo_replace_flag[tx_index_] == 1)?fifo_replace_data[tx_index2_]:fifo[tx_index_];
assign tx_axis_tlast = fifo_tlast[tx_index_];


always@(posedge clk) begin // 持续发包 TODO
    if(rst) begin
        tx_index <= 0;
        tx_index2 <= 0;
        tx_axis_tvalid <= 0;
    end else begin
        if(tx_index<finish_index)begin
            if(tx_axis_tvalid && tx_axis_tready) begin
                if(fifo_replace_flag[tx_index_])begin
                    tx_index2 <= tx_index2 + 1;
                    tx_index <= tx_index + 1;
                end else
                    tx_index <= tx_index + 1;
            end else begin
                tx_axis_tvalid <= 1;
            end 
        end else begin
            tx_axis_tvalid <= 0;
        end
    end
end


wire[47:0] arp_lookup_mac;
wire[15:0] arp_lookup_port;
reg[31:0] arp_lookup_ip;
reg arp_lookup_valid;
wire arp_lookup_mac_valid;
wire arp_lookup_mac_not_found;
wire arp_lookup_ready;

reg[31:0] arp_insert_ip;
reg[47:0] arp_insert_mac;
reg[15:0] arp_insert_port;
reg arp_insert_valid;
wire arp_insert_ready;

arp_table arp_table_inst(
    .clk(clk),
    .rst(rst),
    
    .lookup_ip(arp_lookup_ip),
    .lookup_valid(arp_lookup_valid),
    .lookup_mac(arp_lookup_mac),
    .lookup_mac_valid(arp_lookup_mac_valid),
    .lookup_port(arp_lookup_port),
    .lookup_ready(arp_lookup_ready),
    .lookup_mac_not_found(arp_lookup_mac_not_found),
    
    .insert_ip(arp_insert_ip),
    .insert_mac(arp_insert_mac),
    .insert_port(arp_insert_port),
    .insert_valid(arp_insert_valid),
    .insert_ready(arp_insert_ready)
);

reg[31:0] router_dest_ip;
reg router_dest_ip_valid;
wire[31:0] router_nexthop;
wire[15:0] router_port;
wire router_lookup_ready;
wire router_nexthop_valid;
wire router_nexthop_not_found;


routing_table routing_table_inst(
    .clk(clk),
    .rst(rst),
    
    .dest_ip(router_dest_ip),
    .dest_ip_valid(router_dest_ip_valid),
    .nexthop(router_nexthop),
    .port(router_port),
    .lookup_ready(router_lookup_ready),
    .nexthop_valid(router_nexthop_valid),
    .nexthop_not_found(router_nexthop_not_found),
    
    .os_clk(router_table_os_clk),
    .os_addr(router_table_os_addr),
    .os_din(router_table_os_din),
    .os_dout(router_table_os_dout),
    .os_we(router_table_os_we),
    .os_rst(router_table_os_rst),
    .os_en(router_table_os_en),

    .os_port_addr(router_table_os_port_addr),
    .os_port_din(router_table_os_port_din),
    .os_port_dout(router_table_os_port_dout),
    .os_port_we(router_table_os_port_we),
    .os_port_en(router_table_os_port_en)
);

reg[31:0] my_ip[0:5];
reg[47:0] my_mac;



initial begin
    my_ip[1] <= 32'hc0a80001;
    my_ip[2] <= 32'hc0a80101;
    my_ip[3] <= 32'hc0a80201;
    my_ip[4] <= 32'hc0a80301;
    my_mac <= 48'h00cdefabcdef;
end


localparam[4:0] 
    STATE_IDLE = 0, // 空闲输入状�?�，此时路由器没有在收任何包
    STATE_INPUT_HEADER = 1, //此时路由器在收一个包的前60�??
    STATE_IP_ROUTE_TABLE1 = 2, // ip协议状�??
    STATE_IP_ROUTE_TABLE2 = 3,
    STATE_IP_ARP_TABLE1 = 4,
    STATE_IP_ARP_TABLE2 = 5,
    STATE_DROP_PAYLOAD = 6,
    STATE_ARP = 7,
    STATE_FORWARD = 8,// arp协议状�??
    STATE_FORWARD_PAYLOAD = 9,
    STATE_TDATA_TO_RECEIVER = 10,
    STATE_FIFO_TO_RECEIVER = 11,
    STATE_SENDER_TO_FIFO = 12,
    STATE_SENDER_TO_FIFO_SLEEP0 = 13,
    STATE_SENDER_TO_FIFO_SLEEP1 = 14,
    STATE_SENDER_TO_FIFO_SLEEP2 = 15,
    STATE_SENDER_RELISTEN = 16,
    STATE_SENDER_RELISTEN_SLEEP_1 = 17,
    STATE_SENDER_RELISTEN_SLEEP_2 = 18,
    STATE_LENGTH_TO_RECEIVER = 19;

reg[4:0] state;

reg arp_request_flag; //�??要发送ARP_REQUEST时，置位
reg[15:0] arp_request_port;
reg[31:0] arp_request_ip;
reg arp_response_flag; // 要发送ARP_Response时，置位
reg[15:0] arp_response_port;
reg[47:0] arp_response_mac;
reg[31:0] arp_response_ip;

reg rx_finish_flag; //该包已经收完�??

reg[31:0] frame_ip_dest_ip;
reg[7:0] frame_ip_ttl;
reg[15:0] frame_ip_checksum;
reg[31:0] frame_ip_nexthop;
reg[15:0] frame_ip_nexthop_port;
reg[47:0] frame_ip_nexthop_mac;

reg[47:0] frame_src_mac;
reg[15:0] frame_port;
reg[15:0] frame_protocol;

reg[31:0] frame_arp_sender_ip;
reg[31:0] frame_arp_target_ip;
reg[15:0] frame_arp_opcode;

integer receiver_frame_length;
integer sender_frame_length;
integer sender_iter;


always@(posedge clk) begin // 只关注输入到了什么地步，不在乎发到了�??么地�??
    if(rst) begin
        rx_index <= 0;
        rx_index2 <= 0;
        finish_index <= 0;
        index_iter <= 0;
        rx_index_st <= 0;

        arp_request_flag <= 0;
        arp_request_ip <= 0;
        arp_request_port <= 0;
        arp_response_flag <= 0;
        arp_response_ip <= 0;
        arp_response_mac <= 0;
        arp_response_port <= 0;
        
        state <= STATE_IDLE; 

        rx_finish_flag <= 0;

        arp_lookup_ip <= 0;
        arp_lookup_valid <= 0;
        arp_insert_ip <= 0;
        arp_insert_mac <= 0;
        arp_insert_valid <=0;
        arp_insert_port <=0;

        router_dest_ip <= 0;
        router_dest_ip_valid <= 0;

        receiver_addr <= 11'h7ff;
        receiver_ce <= 0;
        receiver_we <= 0;
        receiver_data_o <= 0;

        receiver_frame_length <= 0;
        sender_frame_length <= 0;

        sender_addr <= 8'hff;
        sender_ce <= 0;
        sender_we <= 0;
        sender_data_o <= 0;
        
        rx_axis_tready <= 0;
    end else begin
        case(state)
            STATE_IDLE:begin // 对应进入�??个新的帧
                
                receiver_addr <= 11'h7ff;
                receiver_ce <= 1;
                receiver_we <= 0;
                receiver_data_o <= 0;

                rx_finish_flag <= 0;

                receiver_frame_length <= 0;
                sender_frame_length <= 0;

                sender_addr <= 8'hff;
                sender_ce <= 1;
                sender_we <= 0;
                sender_data_o <= 0;


                arp_lookup_ip <= 0;
                arp_lookup_valid <= 0;
                arp_insert_ip <= 0;
                arp_insert_mac <= 0;
                arp_insert_valid <=0;
                arp_insert_port <=0;

                router_dest_ip <= 0;
                router_dest_ip_valid <= 0;

                rx_axis_tready <= 0;
                //此时finish_index == rx_index
                if(arp_request_flag) begin // �??要发送一个ARP Request 打断流水�??
                    if(rx_index-tx_index<=FIFO_LENGTH-60) begin
                        {fifo[rx_index_],fifo[rx_index_+1],fifo[rx_index_+2],fifo[rx_index_+3],fifo[rx_index_+4],fifo[rx_index_+5]} <= 48'hffffffffffff;

                        {fifo[rx_index_+6],fifo[rx_index_+7],fifo[rx_index_+8],fifo[rx_index_+9],fifo[rx_index_+10],fifo[rx_index_+11]} <= my_mac;

                        
                        {fifo[rx_index_+12],fifo[rx_index_+13]} <= 16'h8100;
                        
                        {fifo[rx_index_+14],fifo[rx_index_+15]} <= arp_request_port;

                        {fifo[rx_index_+16],fifo[rx_index_+17]} <= 16'h0806;

                        {fifo[rx_index_+18],fifo[rx_index_+19]} <= 16'h0001;

                        {fifo[rx_index_+20],fifo[rx_index_+21]} <= 16'h0800;

                        {fifo[rx_index_+22],fifo[rx_index_+23]} <= 16'h0604;

                        {fifo[rx_index_+24],fifo[rx_index_+25]} <= 16'h0001;

                        {fifo[rx_index_+26],fifo[rx_index_+27],fifo[rx_index_+28],fifo[rx_index_+29],fifo[rx_index_+30],fifo[rx_index_+31]} <= my_mac;

                        {fifo[rx_index_+32],fifo[rx_index_+33],fifo[rx_index_+34],fifo[rx_index_+35]} <= my_ip[arp_request_port];

                        {fifo[rx_index_+36],fifo[rx_index_+37],fifo[rx_index_+38],fifo[rx_index_+39],fifo[rx_index_+40],fifo[rx_index_+41]} <= 48'h0;

                        {fifo[rx_index_+42],fifo[rx_index_+43],fifo[rx_index_+44],fifo[rx_index_+45]} <= arp_request_ip;

                        {fifo[rx_index_+46],fifo[rx_index_+47],fifo[rx_index_+48],fifo[rx_index_+49],fifo[rx_index_+50],fifo[rx_index_+51],fifo[rx_index_+52],fifo[rx_index_+53],fifo[rx_index_+54],fifo[rx_index_+55],fifo[rx_index_+56],fifo[rx_index_+57],fifo[rx_index_+58],fifo[rx_index_+59]} <= 112'h0;
                        
                        {fifo_tlast[rx_index_],fifo_tlast[rx_index_+1],fifo_tlast[rx_index_+2],fifo_tlast[rx_index_+3],fifo_tlast[rx_index_+4],fifo_tlast[rx_index_+5],fifo_tlast[rx_index_+6],fifo_tlast[rx_index_+7],fifo_tlast[rx_index_+8],fifo_tlast[rx_index_+9],fifo_tlast[rx_index_+10],fifo_tlast[rx_index_+11],fifo_tlast[rx_index_+12],fifo_tlast[rx_index_+13],fifo_tlast[rx_index_+14],fifo_tlast[rx_index_+15],fifo_tlast[rx_index_+16],fifo_tlast[rx_index_+17],fifo_tlast[rx_index_+18],fifo_tlast[rx_index_+19],fifo_tlast[rx_index_+20],fifo_tlast[rx_index_+21],fifo_tlast[rx_index_+22],fifo_tlast[rx_index_+23],fifo_tlast[rx_index_+24],fifo_tlast[rx_index_+25],fifo_tlast[rx_index_+26],fifo_tlast[rx_index_+27],fifo_tlast[rx_index_+28],fifo_tlast[rx_index_+29],fifo_tlast[rx_index_+30],fifo_tlast[rx_index_+31],fifo_tlast[rx_index_+32],fifo_tlast[rx_index_+33],fifo_tlast[rx_index_+34],fifo_tlast[rx_index_+35],fifo_tlast[rx_index_+36],fifo_tlast[rx_index_+37],fifo_tlast[rx_index_+38],fifo_tlast[rx_index_+39],fifo_tlast[rx_index_+40],fifo_tlast[rx_index_+41],fifo_tlast[rx_index_+42],fifo_tlast[rx_index_+43],fifo_tlast[rx_index_+44],fifo_tlast[rx_index_+45],fifo_tlast[rx_index_+46],fifo_tlast[rx_index_+47],fifo_tlast[rx_index_+48],fifo_tlast[rx_index_+49],fifo_tlast[rx_index_+50],fifo_tlast[rx_index_+51],fifo_tlast[rx_index_+52],fifo_tlast[rx_index_+53],fifo_tlast[rx_index_+54],fifo_tlast[rx_index_+55],fifo_tlast[rx_index_+56],fifo_tlast[rx_index_+57],fifo_tlast[rx_index_+58],fifo_tlast[rx_index_+59]} <= 60'b1;

                        {fifo_replace_flag[rx_index_],fifo_replace_flag[rx_index_+1],fifo_replace_flag[rx_index_+2],fifo_replace_flag[rx_index_+3],fifo_replace_flag[rx_index_+4],fifo_replace_flag[rx_index_+5],fifo_replace_flag[rx_index_+6],fifo_replace_flag[rx_index_+7],fifo_replace_flag[rx_index_+8],fifo_replace_flag[rx_index_+9],fifo_replace_flag[rx_index_+10],fifo_replace_flag[rx_index_+11],fifo_replace_flag[rx_index_+12],fifo_replace_flag[rx_index_+13],fifo_replace_flag[rx_index_+14],fifo_replace_flag[rx_index_+15],fifo_replace_flag[rx_index_+16],fifo_replace_flag[rx_index_+17],fifo_replace_flag[rx_index_+18],fifo_replace_flag[rx_index_+19],fifo_replace_flag[rx_index_+20],fifo_replace_flag[rx_index_+21],fifo_replace_flag[rx_index_+22],fifo_replace_flag[rx_index_+23],fifo_replace_flag[rx_index_+24],fifo_replace_flag[rx_index_+25],fifo_replace_flag[rx_index_+26],fifo_replace_flag[rx_index_+27],fifo_replace_flag[rx_index_+28],fifo_replace_flag[rx_index_+29],fifo_replace_flag[rx_index_+30],fifo_replace_flag[rx_index_+31],fifo_replace_flag[rx_index_+32],fifo_replace_flag[rx_index_+33],fifo_replace_flag[rx_index_+34],fifo_replace_flag[rx_index_+35],fifo_replace_flag[rx_index_+36],fifo_replace_flag[rx_index_+37],fifo_replace_flag[rx_index_+38],fifo_replace_flag[rx_index_+39],fifo_replace_flag[rx_index_+40],fifo_replace_flag[rx_index_+41],fifo_replace_flag[rx_index_+42],fifo_replace_flag[rx_index_+43],fifo_replace_flag[rx_index_+44],fifo_replace_flag[rx_index_+45],fifo_replace_flag[rx_index_+46],fifo_replace_flag[rx_index_+47],fifo_replace_flag[rx_index_+48],fifo_replace_flag[rx_index_+49],fifo_replace_flag[rx_index_+50],fifo_replace_flag[rx_index_+51],fifo_replace_flag[rx_index_+52],fifo_replace_flag[rx_index_+53],fifo_replace_flag[rx_index_+54],fifo_replace_flag[rx_index_+55],fifo_replace_flag[rx_index_+56],fifo_replace_flag[rx_index_+57],fifo_replace_flag[rx_index_+58],fifo_replace_flag[rx_index_+59]} <= 60'b0;

                        rx_index <= rx_index + 60;
                        finish_index <= finish_index + 60;
                        
                        arp_request_flag <= 0;
                        arp_request_ip <= 0;
                        arp_request_port <= 0;
                    end
                end else if(arp_response_flag) begin // �??要发送一个ARP response 打断流水�??
                    if(rx_index-tx_index<=FIFO_LENGTH-60) begin
                        {fifo[rx_index_],fifo[rx_index_+1],fifo[rx_index_+2],fifo[rx_index_+3],fifo[rx_index_+4],fifo[rx_index_+5]} <= arp_response_mac;

                        {fifo[rx_index_+6],fifo[rx_index_+7],fifo[rx_index_+8],fifo[rx_index_+9],fifo[rx_index_+10],fifo[rx_index_+11]} <= my_mac;

                        
                        {fifo[rx_index_+12],fifo[rx_index_+13]} <= 16'h8100;
                        
                        {fifo[rx_index_+14],fifo[rx_index_+15]} <= arp_response_port;

                        {fifo[rx_index_+16],fifo[rx_index_+17]} <= 16'h0806;

                        {fifo[rx_index_+18],fifo[rx_index_+19]} <= 16'h0001;

                        {fifo[rx_index_+20],fifo[rx_index_+21]} <= 16'h0800;

                        {fifo[rx_index_+22],fifo[rx_index_+23]} <= 16'h0604;

                        {fifo[rx_index_+24],fifo[rx_index_+25]} <= 16'h0002;

                        {fifo[rx_index_+26],fifo[rx_index_+27],fifo[rx_index_+28],fifo[rx_index_+29],fifo[rx_index_+30],fifo[rx_index_+31]} <= my_mac;

                        {fifo[rx_index_+32],fifo[rx_index_+33],fifo[rx_index_+34],fifo[rx_index_+35]} <= my_ip[arp_response_port];

                        {fifo[rx_index_+36],fifo[rx_index_+37],fifo[rx_index_+38],fifo[rx_index_+39],fifo[rx_index_+40],fifo[rx_index_+41]} <= arp_response_mac;

                        {fifo[rx_index_+42],fifo[rx_index_+43],fifo[rx_index_+44],fifo[rx_index_+45]} <= arp_response_ip;

                        {fifo[rx_index_+46],fifo[rx_index_+47],fifo[rx_index_+48],fifo[rx_index_+49],fifo[rx_index_+50],fifo[rx_index_+51],fifo[rx_index_+52],fifo[rx_index_+53],fifo[rx_index_+54],fifo[rx_index_+55],fifo[rx_index_+56],fifo[rx_index_+57],fifo[rx_index_+58],fifo[rx_index_+59]} <= 112'h0;
                        
                        {fifo_tlast[rx_index_],fifo_tlast[rx_index_+1],fifo_tlast[rx_index_+2],fifo_tlast[rx_index_+3],fifo_tlast[rx_index_+4],fifo_tlast[rx_index_+5],fifo_tlast[rx_index_+6],fifo_tlast[rx_index_+7],fifo_tlast[rx_index_+8],fifo_tlast[rx_index_+9],fifo_tlast[rx_index_+10],fifo_tlast[rx_index_+11],fifo_tlast[rx_index_+12],fifo_tlast[rx_index_+13],fifo_tlast[rx_index_+14],fifo_tlast[rx_index_+15],fifo_tlast[rx_index_+16],fifo_tlast[rx_index_+17],fifo_tlast[rx_index_+18],fifo_tlast[rx_index_+19],fifo_tlast[rx_index_+20],fifo_tlast[rx_index_+21],fifo_tlast[rx_index_+22],fifo_tlast[rx_index_+23],fifo_tlast[rx_index_+24],fifo_tlast[rx_index_+25],fifo_tlast[rx_index_+26],fifo_tlast[rx_index_+27],fifo_tlast[rx_index_+28],fifo_tlast[rx_index_+29],fifo_tlast[rx_index_+30],fifo_tlast[rx_index_+31],fifo_tlast[rx_index_+32],fifo_tlast[rx_index_+33],fifo_tlast[rx_index_+34],fifo_tlast[rx_index_+35],fifo_tlast[rx_index_+36],fifo_tlast[rx_index_+37],fifo_tlast[rx_index_+38],fifo_tlast[rx_index_+39],fifo_tlast[rx_index_+40],fifo_tlast[rx_index_+41],fifo_tlast[rx_index_+42],fifo_tlast[rx_index_+43],fifo_tlast[rx_index_+44],fifo_tlast[rx_index_+45],fifo_tlast[rx_index_+46],fifo_tlast[rx_index_+47],fifo_tlast[rx_index_+48],fifo_tlast[rx_index_+49],fifo_tlast[rx_index_+50],fifo_tlast[rx_index_+51],fifo_tlast[rx_index_+52],fifo_tlast[rx_index_+53],fifo_tlast[rx_index_+54],fifo_tlast[rx_index_+55],fifo_tlast[rx_index_+56],fifo_tlast[rx_index_+57],fifo_tlast[rx_index_+58],fifo_tlast[rx_index_+59]} <= 60'b1;

                        {fifo_replace_flag[rx_index_],fifo_replace_flag[rx_index_+1],fifo_replace_flag[rx_index_+2],fifo_replace_flag[rx_index_+3],fifo_replace_flag[rx_index_+4],fifo_replace_flag[rx_index_+5],fifo_replace_flag[rx_index_+6],fifo_replace_flag[rx_index_+7],fifo_replace_flag[rx_index_+8],fifo_replace_flag[rx_index_+9],fifo_replace_flag[rx_index_+10],fifo_replace_flag[rx_index_+11],fifo_replace_flag[rx_index_+12],fifo_replace_flag[rx_index_+13],fifo_replace_flag[rx_index_+14],fifo_replace_flag[rx_index_+15],fifo_replace_flag[rx_index_+16],fifo_replace_flag[rx_index_+17],fifo_replace_flag[rx_index_+18],fifo_replace_flag[rx_index_+19],fifo_replace_flag[rx_index_+20],fifo_replace_flag[rx_index_+21],fifo_replace_flag[rx_index_+22],fifo_replace_flag[rx_index_+23],fifo_replace_flag[rx_index_+24],fifo_replace_flag[rx_index_+25],fifo_replace_flag[rx_index_+26],fifo_replace_flag[rx_index_+27],fifo_replace_flag[rx_index_+28],fifo_replace_flag[rx_index_+29],fifo_replace_flag[rx_index_+30],fifo_replace_flag[rx_index_+31],fifo_replace_flag[rx_index_+32],fifo_replace_flag[rx_index_+33],fifo_replace_flag[rx_index_+34],fifo_replace_flag[rx_index_+35],fifo_replace_flag[rx_index_+36],fifo_replace_flag[rx_index_+37],fifo_replace_flag[rx_index_+38],fifo_replace_flag[rx_index_+39],fifo_replace_flag[rx_index_+40],fifo_replace_flag[rx_index_+41],fifo_replace_flag[rx_index_+42],fifo_replace_flag[rx_index_+43],fifo_replace_flag[rx_index_+44],fifo_replace_flag[rx_index_+45],fifo_replace_flag[rx_index_+46],fifo_replace_flag[rx_index_+47],fifo_replace_flag[rx_index_+48],fifo_replace_flag[rx_index_+49],fifo_replace_flag[rx_index_+50],fifo_replace_flag[rx_index_+51],fifo_replace_flag[rx_index_+52],fifo_replace_flag[rx_index_+53],fifo_replace_flag[rx_index_+54],fifo_replace_flag[rx_index_+55],fifo_replace_flag[rx_index_+56],fifo_replace_flag[rx_index_+57],fifo_replace_flag[rx_index_+58],fifo_replace_flag[rx_index_+59]} <= 60'b0;

                        rx_index <= rx_index + 60;
                        finish_index <= finish_index + 60;
                        
                        arp_response_ip <= 0;
                        arp_response_flag <= 0;
                        arp_response_mac <= 0;
                        arp_response_port <= 0;
                    end
                end else if(sender_data_i[31:24] != 8'b0) begin
                    // 需要发送数据
                    sender_frame_length <= {8'h0,sender_data_i[23:0]};
                    if(sender_data_i[23:0]!=0)begin
                        sender_addr <= 0;
                        state <= STATE_SENDER_TO_FIFO_SLEEP0;
                        rx_index_st <= rx_index;
                        sender_ce <= 1;
                        sender_we <= 0;
                    end else begin
                        sender_addr <= 8'hff;
                        sender_ce <= 1;
                        sender_we <= 4'b1111;
                        sender_data_o <= 32'h0;
                        state <= STATE_SENDER_RELISTEN;
                    end
                end else if(rx_axis_tvalid && rx_index-tx_index<=FIFO_LENGTH-60) begin
                    rx_axis_tready <= 1;
                    state <= STATE_INPUT_HEADER;
                    rx_finish_flag <= 0;
                end
            end 
            STATE_SENDER_TO_FIFO_SLEEP0: begin
                if(rx_index-tx_index<=FIFO_LENGTH-4)
                    state <= STATE_SENDER_TO_FIFO_SLEEP1;
            end
            STATE_SENDER_TO_FIFO_SLEEP1: begin
                sender_addr <= sender_addr + 1;
                state <= STATE_SENDER_TO_FIFO_SLEEP2;
            end
            STATE_SENDER_TO_FIFO_SLEEP2:begin
                sender_addr <= sender_addr + 1;
                state <= STATE_SENDER_TO_FIFO;
            end
            STATE_SENDER_TO_FIFO: begin
                {fifo[rx_index_+3],fifo[rx_index_+2],fifo[rx_index_+1],fifo[rx_index_]} <= sender_data_i;
                {fifo_tlast[rx_index_],fifo_tlast[rx_index_+1],fifo_tlast[rx_index_+2],fifo_tlast[rx_index_+3]} <= 4'b0;
                {fifo_replace_flag[rx_index_],fifo_replace_flag[rx_index_+1],fifo_replace_flag[rx_index_+2],fifo_replace_flag[rx_index_+3]} <= 4'b0;
                if(rx_index+4-rx_index_st>=sender_frame_length) begin
                    //发完了，�??�??4byte
                    case(sender_frame_length[1:0])
                        2'b00:begin
                            fifo_tlast[rx_index_+3] <= 1'b1;
                            rx_index <= rx_index + 4;
                            finish_index <= finish_index + 4;
                        end
                        2'b01:begin
                            fifo_tlast[rx_index_] <= 1'b1;
                            rx_index <= rx_index + 1;
                            finish_index <= finish_index + 1;
                        end
                        2'b10:begin
                            fifo_tlast[rx_index_+1] <= 1'b1;
                            rx_index <= rx_index + 2;
                            finish_index <= finish_index + 2;
                        end
                        2'b11:begin
                            fifo_tlast[rx_index_+2] <= 1'b1;
                            rx_index <= rx_index + 3;
                            finish_index <= finish_index + 3;
                        end
                    endcase
                    sender_addr <= 8'hff;
                    sender_data_o <= 32'b0;
                    sender_ce <= 1;
                    sender_we <= 4'b1111;
                    state <= STATE_SENDER_RELISTEN;
                end else if(rx_index+4-tx_index<=FIFO_LENGTH-4) begin
                    sender_addr <= sender_addr + 1;
                    rx_index <= rx_index + 4;
                    finish_index <= finish_index + 4;
                end else begin
                    rx_index <= rx_index + 4;
                    finish_index <= finish_index + 4;
                    sender_addr <= sender_addr-1;
                    state <= STATE_SENDER_TO_FIFO_SLEEP0;
                end
            end
            STATE_SENDER_RELISTEN:begin
                sender_addr <= 8'hff;
                sender_ce <= 1;
                sender_we <= 0;
                state <= STATE_SENDER_RELISTEN_SLEEP_1;
            end
            STATE_SENDER_RELISTEN_SLEEP_1:begin
                sender_addr <= 8'hff;
                sender_ce <= 1;
                sender_we <= 0;
                state <= STATE_SENDER_RELISTEN_SLEEP_2;
            end
            STATE_SENDER_RELISTEN_SLEEP_2:begin
                sender_addr <= 8'hff;
                sender_ce <= 1;
                sender_we <= 0;
                state <= STATE_IDLE;
            end
            STATE_INPUT_HEADER: begin
                if(rx_axis_tvalid && rx_axis_tready) begin
                    fifo[rx_index_] <= rx_axis_tdata;
                    fifo_tlast[rx_index_] <= rx_axis_tlast;
                    fifo_replace_flag[rx_index_] <= 0;
                    case(rx_index-finish_index)
                        0,1,2,3,4,5:fifo_replace_flag[rx_index_] <= 1;
                        6: begin
                            frame_src_mac[47:40] <= rx_axis_tdata;
                            fifo_replace_flag[rx_index_] <= 1;
                        end
                        7: begin
                            frame_src_mac[39:32] <= rx_axis_tdata;
                            fifo_replace_flag[rx_index_] <= 1;
                        end
                        8: begin
                            frame_src_mac[31:24] <= rx_axis_tdata;
                            fifo_replace_flag[rx_index_] <= 1;
                        end
                        9: begin
                            frame_src_mac[23:16] <= rx_axis_tdata;
                            fifo_replace_flag[rx_index_] <= 1;
                        end
                        10: begin
                            frame_src_mac[15:8] <= rx_axis_tdata;
                            fifo_replace_flag[rx_index_] <= 1;
                        end
                        11: begin
                            frame_src_mac[7:0] <= rx_axis_tdata;
                            fifo_replace_flag[rx_index_] <= 1;
                        end
                        14: begin
                            frame_port[15:8] <= rx_axis_tdata;
                            //fifo_replace_flag[rx_index_] <= 1;
                        end
                        15:begin
                            frame_port[7:0] <= rx_axis_tdata;
                            fifo_replace_flag[rx_index_] <= 1;
                        end
                        16:frame_protocol[15:8] <= rx_axis_tdata;
                        17:frame_protocol[7:0] <= rx_axis_tdata;
                        24:frame_arp_opcode[15:8] <= rx_axis_tdata;
                        25:frame_arp_opcode[7:0] <= rx_axis_tdata;
                        26: begin 
                            frame_ip_ttl <= rx_axis_tdata;
                            fifo_replace_flag[rx_index_] <= 1;
                        end
                        28: begin 
                            frame_ip_checksum[15:8] <= rx_axis_tdata;
                            fifo_replace_flag[rx_index_] <= 1;
                        end
                        29:begin
                            frame_ip_checksum[7:0] <= rx_axis_tdata;
                            fifo_replace_flag[rx_index_] <= 1;
                        end
                        32:frame_arp_sender_ip[31:24] <= rx_axis_tdata;
                        33:frame_arp_sender_ip[23:16] <= rx_axis_tdata;
                        34: begin
                            frame_ip_dest_ip[31:24] <= rx_axis_tdata;
                            frame_arp_sender_ip[15:8] <= rx_axis_tdata;
                        end
                        35: begin
                            frame_ip_dest_ip[23:16] <= rx_axis_tdata;
                            frame_arp_sender_ip[7:0] <= rx_axis_tdata;
                        end
                        36:frame_ip_dest_ip[15:8] <= rx_axis_tdata;
                        37:frame_ip_dest_ip[7:0] <= rx_axis_tdata;
                        42:frame_arp_target_ip[31:24] <= rx_axis_tdata;
                        43:frame_arp_target_ip[23:16] <= rx_axis_tdata;
                        44:frame_arp_target_ip[15:8] <= rx_axis_tdata;
                        45:frame_arp_target_ip[7:0] <= rx_axis_tdata;
                        59:begin
                            if(frame_protocol == 16'h0800) begin
                            // ip 协议
                                if(frame_ip_dest_ip == my_ip[frame_port]||frame_ip_dest_ip == 32'he0000009) begin 
                                    // cpu 收包
                                    if(receiver_data_i != 8'b0) begin
                                        // 缓冲区还有包，丢�??
                                        state <= STATE_DROP_PAYLOAD;
                                        rx_index <= finish_index;
                                    end else begin
                                        //缓冲区没有包了，向缓冲区�??
                                        state <= STATE_TDATA_TO_RECEIVER;
                                        receiver_frame_length <= rx_index+1-finish_index;
                                    end
                                end else begin
                                    if(frame_ip_ttl <= 1) begin
                                        state <= STATE_DROP_PAYLOAD;
                                        rx_index <= finish_index;
                                    end else
                                        state <= STATE_IP_ROUTE_TABLE1;
                                end
                            end else if(frame_protocol == 16'h0806) begin
                                // arp 协议
                                state <= STATE_ARP;
                            end else begin
                                //不认识，丢包
                                rx_index <= finish_index;
                                state <= STATE_DROP_PAYLOAD; 
                            end
                            if(rx_axis_tlast) begin
                                rx_axis_tready <= 0;
                                rx_finish_flag <= 1;
                            end
                        end
                    endcase
                    rx_index <= rx_index + 1;
                end
            end
            STATE_ARP:begin
                if(frame_arp_opcode == 16'h0001) begin
                    // request
                    if(frame_arp_target_ip == my_ip[frame_port])begin
                        // request me
                        arp_response_flag <= 1;
                        arp_response_ip <= frame_arp_sender_ip;
                        arp_response_mac <= frame_src_mac;
                        arp_response_port <= frame_port;
                        
                        rx_index <= finish_index;
                        state <= STATE_IDLE;

                    end else begin
                        // 丢包
                        rx_index <= finish_index;
                        state <= STATE_IDLE;
                    end 
                end else if(frame_arp_opcode == 16'h0002) begin
                    // response
                    if(arp_insert_ready) begin
                        arp_insert_ip <= frame_arp_sender_ip;
                        arp_insert_mac <= frame_src_mac;
                        arp_insert_port <= frame_port;
                        arp_insert_valid <= 1;
                        
                        rx_index <= finish_index;
                        state <= STATE_IDLE;
                    end
                end else begin
                    // 不认识，丢包
                    rx_index <= finish_index;
                    state <= STATE_IDLE;
                end
            end
            STATE_DROP_PAYLOAD:begin
                if(rx_finish_flag)
                    state<= STATE_IDLE;
                else if(!rx_axis_tready)
                    rx_axis_tready <= 1;
                else if(rx_axis_tready && rx_axis_tvalid && rx_axis_tlast)begin
                    rx_axis_tready <= 0;
                    state <= STATE_IDLE;
                end
            end
            
            STATE_IP_ROUTE_TABLE1: begin
                if(rx_axis_tvalid && rx_axis_tready) begin
                    fifo[rx_index_] <= rx_axis_tdata;
                    fifo_tlast[rx_index_] <= rx_axis_tlast;
                    fifo_replace_flag[rx_index_] <= 0;
                    if(rx_index-tx_index == FIFO_LENGTH-1||rx_axis_tlast)begin
                        //FIFO满了或收完这个包�??
                        rx_axis_tready <= 0;
                        if(rx_axis_tlast)
                            rx_finish_flag <= 1;
                    end
                    rx_index <= rx_index + 1;
                end else if(rx_finish_flag) begin
                    // 收完该包了，等待路由查表arp查表
                end else if(!rx_axis_tready) begin
                    if(rx_index-tx_index<=FIFO_LENGTH-1)
                        rx_axis_tready <= 1;
                end
                
                if(router_lookup_ready) begin
                    router_dest_ip <= frame_ip_dest_ip;
                    router_dest_ip_valid <= 1; 
                    state <= STATE_IP_ROUTE_TABLE2;
                end
            end
            STATE_IP_ROUTE_TABLE2: begin
                if(rx_axis_tvalid && rx_axis_tready) begin
                    fifo[rx_index_] <= rx_axis_tdata;
                    fifo_tlast[rx_index_] <= rx_axis_tlast;
                    fifo_replace_flag[rx_index_] <= 0;
                    if(rx_index-tx_index == FIFO_LENGTH-1||rx_axis_tlast)begin
                        //FIFO满了或收完这个包�??
                        rx_axis_tready <= 0;
                        if(rx_axis_tlast)
                            rx_finish_flag <= 1;
                    end
                    rx_index <= rx_index + 1;
                end else if(rx_finish_flag) begin
                    // 收完该包了，等待路由查表arp查表
                end else if(!rx_axis_tready) begin
                    if(rx_index-tx_index<=FIFO_LENGTH-1)
                        rx_axis_tready <= 1;
                end
                router_dest_ip <= 0;
                router_dest_ip_valid <= 0;
                if(router_nexthop_valid) begin
                    if(router_nexthop_not_found) begin
                        rx_index <= finish_index;
                        state <= STATE_DROP_PAYLOAD;
                    end else begin
                        frame_ip_nexthop <= router_nexthop;
                        frame_ip_nexthop_port <= router_port;
                        state <= STATE_IP_ARP_TABLE1;
                    end
                end
            end
            STATE_IP_ARP_TABLE1:begin
                if(rx_axis_tvalid && rx_axis_tready) begin
                    fifo[rx_index_] <= rx_axis_tdata;
                    fifo_tlast[rx_index_] <= rx_axis_tlast;
                    fifo_replace_flag[rx_index_] <= 0;
                    if(rx_index-tx_index == FIFO_LENGTH-1||rx_axis_tlast)begin
                        //FIFO满了或收完这个包�??
                        rx_axis_tready <= 0;
                        if(rx_axis_tlast)
                            rx_finish_flag <= 1;
                    end
                    rx_index <= rx_index + 1;
                end else if(rx_finish_flag) begin
                    // 收完该包了，等待路由查表arp查表
                end else if(!rx_axis_tready) begin
                    if(rx_index-tx_index<=FIFO_LENGTH-1)
                        rx_axis_tready <= 1;
                end

                if(arp_lookup_ready) begin
                    arp_lookup_ip <= frame_ip_nexthop;
                    arp_lookup_valid <= 1; 
                    state <= STATE_IP_ARP_TABLE2;
                end
            end
            STATE_IP_ARP_TABLE2:begin
                if(rx_axis_tvalid && rx_axis_tready) begin
                    fifo[rx_index_] <= rx_axis_tdata;
                    fifo_tlast[rx_index_] <= rx_axis_tlast;
                    fifo_replace_flag[rx_index_] <= 0;
                    if(rx_index-tx_index == FIFO_LENGTH-1||rx_axis_tlast)begin
                        //FIFO满了或收完这个包�??
                        rx_axis_tready <= 0;
                        if(rx_axis_tlast)
                            rx_finish_flag <= 1;
                    end
                    rx_index <= rx_index + 1;
                end else if(rx_finish_flag) begin
                    // 收完该包了，等待路由查表arp查表
                end else if(!rx_axis_tready) begin
                    if(rx_index-tx_index<=FIFO_LENGTH-1)
                        rx_axis_tready <= 1;
                end
                arp_lookup_ip <= 0;
                arp_lookup_valid <= 0;
                if(arp_lookup_mac_valid)begin
                    if(arp_lookup_mac_not_found)begin
                        rx_index <= finish_index;
                        arp_request_flag <= 1;
                        arp_request_ip <= frame_ip_nexthop;
                        arp_request_port <= frame_ip_nexthop_port;
                        state <= STATE_DROP_PAYLOAD;
                    end else begin
                        frame_ip_nexthop_mac <= arp_lookup_mac;
                        frame_ip_nexthop_port <= arp_lookup_port;
                        frame_ip_ttl <= frame_ip_ttl-1;
                        if (frame_ip_checksum[15:8]==8'hff) begin
                                frame_ip_checksum[15:8]<=8'h00;
                                frame_ip_checksum[7:0]<=frame_ip_checksum[7:0]+1;
                        end else if (frame_ip_checksum[15:8]==8'hfe && frame_ip_checksum[7:0]==8'hff) begin
                            frame_ip_checksum[15:8]<=8'h00;
                            frame_ip_checksum[7:0]<=8'h00;
                        end else begin
                            frame_ip_checksum[15:8]<=frame_ip_checksum[15:8]+1;
                        end 
                        state <= STATE_FORWARD;
                    end
                end
            end
            STATE_FORWARD:begin
                if(rx_axis_tvalid && rx_axis_tready) begin
                    fifo[rx_index_] <= rx_axis_tdata;
                    fifo_tlast[rx_index_] <= rx_axis_tlast;
                    fifo_replace_flag[rx_index_] <= 0;
                    if(rx_index-tx_index == FIFO_LENGTH-1||rx_axis_tlast)begin
                        //FIFO满了或收完这个包�??
                        rx_axis_tready <= 0;
                        if(rx_axis_tlast)
                            rx_finish_flag <= 1;
                    end
                    rx_index <= rx_index + 1;
                end else if(rx_finish_flag) begin
                    // 收完该包了，等待路由查表arp查表
                end else if(!rx_axis_tready) begin
                    if(rx_index-tx_index<=FIFO_LENGTH-1)
                        rx_axis_tready <= 1;
                end
                {fifo_replace_data[rx_index2_],fifo_replace_data[rx_index2_+1],fifo_replace_data[rx_index2_+2],fifo_replace_data[rx_index2_+3],fifo_replace_data[rx_index2_+4],fifo_replace_data[rx_index2_+5]} <= frame_ip_nexthop_mac;
                {fifo_replace_data[rx_index2_+6],fifo_replace_data[rx_index2_+7],fifo_replace_data[rx_index2_+8],fifo_replace_data[rx_index2_+9],fifo_replace_data[rx_index2_+10],fifo_replace_data[rx_index2_+11]} <= my_mac;
                {fifo_replace_data[rx_index2_+12]} <= frame_ip_nexthop_port[7:0];
                {fifo_replace_data[rx_index2_+13]} <= frame_ip_ttl-1;
                {fifo_replace_data[rx_index2+14],fifo_replace_data[rx_index2_+15]} <= frame_ip_checksum;
                rx_index2 <= rx_index2 + 16;
                state <= STATE_FORWARD_PAYLOAD;
                finish_index <= rx_index;
            end
            STATE_FORWARD_PAYLOAD:begin
                if(rx_axis_tvalid && rx_axis_tready) begin
                    fifo[rx_index_] <= rx_axis_tdata;
                    fifo_tlast[rx_index_] <= rx_axis_tlast;
                    fifo_replace_flag[rx_index_] <= 0;
                    if(rx_index-tx_index == FIFO_LENGTH-1||rx_axis_tlast)begin
                        //FIFO满了或收完这个包�??
                        rx_axis_tready <= 0;
                        if(rx_axis_tlast)
                            state <= STATE_IDLE;
                    end
                    rx_index <= rx_index + 1;
                    finish_index <= finish_index + 1;
                end else if(rx_finish_flag) begin
                    state <= STATE_IDLE;
                end else if(!rx_axis_tready) begin
                    if(rx_index-tx_index<=FIFO_LENGTH-1)
                        rx_axis_tready <= 1;
                end
            end
            STATE_TDATA_TO_RECEIVER: begin
                if(rx_axis_tvalid && rx_axis_tready) begin
                    receiver_addr <= receiver_frame_length;
                    receiver_ce <= 1;
                    receiver_data_o <= rx_axis_tdata;
                    receiver_we <= 1;
                    receiver_frame_length <= receiver_frame_length + 1;
                    if(rx_axis_tlast)begin
                        rx_axis_tready <= 0;
                        state <= STATE_FIFO_TO_RECEIVER;
                        index_iter <= finish_index;
                    end
                end else if(rx_finish_flag) begin
                    state <= STATE_FIFO_TO_RECEIVER;
                    index_iter <= finish_index;
                end else if(!rx_axis_tready)begin
                    rx_axis_tready <= 1;
                end
            end
            STATE_FIFO_TO_RECEIVER: begin
                receiver_addr <= index_iter-finish_index;
                receiver_data_o <= fifo[index_iter_];
                receiver_ce <= 1;
                receiver_we <= 1;
                if(index_iter+1 == rx_index)
                    state <= STATE_LENGTH_TO_RECEIVER;
                index_iter <= index_iter+1;
            end
            STATE_LENGTH_TO_RECEIVER:begin
                receiver_ce <= 1;
                receiver_we <= 1;
                if(receiver_addr<11'h7fc)begin
                    receiver_addr <= 11'h7fc;
                    receiver_data_o <= receiver_frame_length[7:0];
                end else if(receiver_addr == 11'h7fc) begin
                    receiver_addr <= 11'h7fd;
                    receiver_data_o <= receiver_frame_length[15:8];
                end else if(receiver_addr == 11'h7fd) begin
                    receiver_addr <= 11'h7fe;
                    receiver_data_o <= receiver_frame_length[23:16];
                end else if(receiver_addr == 11'h7fe) begin
                    receiver_addr <= 11'h7ff;
                    receiver_data_o <= 8'b11111111;
                    state <= STATE_IDLE;
                end
            end
        endcase
    end
end

endmodule
