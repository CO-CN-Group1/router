module routing_table_lookup #
(
    parameter FIFO_LENGTH = 256
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

reg[8:0] fifo[0:FIFO_LENGTH-1]; //数据fifo

integer tx_index,rx_index,finish_index,index_iter,rx_index_st;

wire[7:0] tx_index_8,rx_index_8,finish_index_8,index_iter_8;

assign tx_index_8 = tx_index[7:0];
assign rx_index_8 = rx_index[7:0];
assign finish_index_8 = finish_index[7:0];
assign index_iter_8 = index_iter[7:0];

assign tx_axis_tdata = fifo[tx_index_8][7:0];
assign tx_axis_tlast = fifo[tx_index_8][8];


always@(posedge clk) begin // 持续发包
    if(rst) begin
        tx_index <= 0;
    end else begin
        if(tx_index<finish_index)begin
            if(tx_axis_tvalid && tx_axis_tready) begin
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
    STATE_SENDER_RELISTEN_SLEEP_2 = 18;

reg[4:0] state;

reg arp_request_flag; //�??要发送ARP_REQUEST时，置位
reg[15:0] arp_request_port;
reg[31:0] arp_request_ip;

reg rx_finish_flag; //该包已经收完�??

reg[31:0] frame_dest_ip;
reg[15:0] frame_port;
reg[7:0] frame_ttl;
reg[15:0] frame_checksum;
reg[31:0] frame_nexthop;
reg[15:0] frame_nexthop_port;
reg[47:0] frame_nexthop_mac;

integer receiver_frame_length;
integer sender_frame_length;
integer sender_iter;


always@(posedge clk) begin // 只关注输入到了什么地步，不在乎发到了�??么地�??
    if(rst) begin
        rx_index <= 0;
        finish_index <= 0;
        arp_request_flag <= 0;
        arp_request_ip <= 0;
        arp_request_port <= 0;
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
        sender_iter <= 0;
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
                sender_iter <= 0;


                arp_lookup_ip <= 0;
                arp_lookup_valid <= 0;
                arp_insert_ip <= 0;
                arp_insert_mac <= 0;
                arp_insert_valid <=0;
                arp_insert_port <=0;

                router_dest_ip <= 0;
                router_dest_ip_valid <= 0;

                //此时finish_index == rx_index
                if(arp_request_flag) begin // �??要发送一个ARP Request 打断流水�??
                    if(rx_index-tx_index<=FIFO_LENGTH-64) begin
                        fifo[rx_index_8] <= 9'h0ff;fifo[rx_index_8+1] <= 9'h0ff;fifo[rx_index_8+2] <= 9'h0ff;fifo[rx_index_8+3] <= 9'h0ff;fifo[rx_index_8+4] <= 9'h0ff;fifo[rx_index_8+5] <= 9'h0ff;

                        fifo[rx_index_8+6] <= {1'b0,my_mac[47:40]};fifo[rx_index_8+7] <= {1'b0,my_mac[39:32]};fifo[rx_index_8+8] <= {1'b0,my_mac[31:24]};fifo[rx_index_8+9] <= {1'b0,my_mac[23:16]};fifo[rx_index_8+10] <= {1'b0,my_mac[15:8]};fifo[rx_index_8+11] <= {1'b0,my_mac[7:0]};
                        
                        fifo[rx_index_8+12] <= 9'h081;fifo[rx_index_8+13] <= 9'h000;
                        
                        fifo[rx_index_8+14] <= {1'b0,arp_request_port[15:8]};fifo[rx_index_8+15] <= {1'b0,arp_request_port[7:0]};

                        fifo[rx_index_8+16] <= 9'h008;fifo[rx_index_8+17] <= 9'h006;

                        fifo[rx_index_8+18] <= 9'h000;fifo[rx_index_8+19] <= 9'h001;

                        fifo[rx_index_8+20] <= 9'h008;fifo[rx_index_8+21] <= 9'h000;

                        fifo[rx_index_8+22] <= 9'h006;fifo[rx_index_8+23] <= 9'h004;

                        fifo[rx_index_8+24] <= 9'h000;fifo[rx_index_8+25] <= 9'h001;

                        fifo[rx_index_8+26] <= {1'b0,my_mac[47:40]};fifo[rx_index_8+27] <= {1'b0,my_mac[39:32]};fifo[rx_index_8+28] <= {1'b0,my_mac[31:24]};fifo[rx_index_8+29] <= {1'b0,my_mac[23:16]};fifo[rx_index_8+30] <= {1'b0,my_mac[15:8]};fifo[rx_index_8+31] <= {1'b0,my_mac[7:0]};

                        fifo[rx_index_8+32] <= {1'b0,my_ip[arp_request_port][31:24]};fifo[rx_index_8+33] <= {1'b0,my_ip[arp_request_port][23:16]};fifo[rx_index_8+34] <= {1'b0,my_ip[arp_request_port][15:8]};fifo[rx_index_8+35] <= {1'b0,my_ip[arp_request_port][7:0]};

                        fifo[rx_index_8+36] <= 9'h000;fifo[rx_index_8+37] <= 9'h000;fifo[rx_index_8+38] <= 9'h000;fifo[rx_index_8+39] <= 9'h000;fifo[rx_index_8+40] <= 9'h000;fifo[rx_index_8+41] <= 9'h000;

                        fifo[rx_index_8+42] <= {1'b0,arp_request_ip[31:24]};fifo[rx_index_8+43] <= {1'b0,arp_request_ip[23:16]};fifo[rx_index_8+44] <= {1'b0,arp_request_ip[15:8]};fifo[rx_index_8+45] <= {1'b0,arp_request_ip[7:0]};

                        {fifo[rx_index_8+46],fifo[rx_index_8+47],fifo[rx_index_8+48],fifo[rx_index_8+49],fifo[rx_index_8+50],fifo[rx_index_8+51],fifo[rx_index_8+52],fifo[rx_index_8+53],fifo[rx_index_8+54],fifo[rx_index_8+55],fifo[rx_index_8+56],fifo[rx_index_8+57],fifo[rx_index_8+58]} <= 117'h0;fifo[rx_index_8+59] <= 9'h100;
                        rx_index <= rx_index + 60;
                        finish_index <= finish_index + 60;
                        
                        arp_request_flag <= 0;
                        arp_request_ip <= 0;
                        arp_request_port <= 0;
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
                fifo[rx_index_8] <= {1'b0,sender_data_o[7:0]};
                fifo[rx_index_8+1] <= {1'b0,sender_data_o[15:8]};                
                fifo[rx_index_8+2] <= {1'b0,sender_data_o[23:16]};                
                fifo[rx_index_8+3] <= {1'b0,sender_data_o[31:24]};                
                if(rx_index+4-rx_index_st>=sender_frame_length) begin
                    //发完了，�??�??4byte
                    case(sender_frame_length[1:0])
                        2'b00:begin
                            fifo[rx_index_8+3] <= {1'b1,sender_data_o[31:24]};
                            rx_index <= rx_index + 4;
                            finish_index <= finish_index + 4;
                        end
                        2'b01:begin
                            fifo[rx_index_8] <= {1'b1,sender_data_o[7:0]};
                            rx_index <= rx_index + 1;
                            finish_index <= finish_index + 1;
                        end
                        2'b10:begin
                            fifo[rx_index_8+1] <= {1'b1,sender_data_o[15:8]};
                            rx_index <= rx_index + 2;
                            finish_index <= finish_index + 2;
                        end
                        2'b11:begin
                            fifo[rx_index_8+2] <= {1'b1,sender_data_o[23:16]};
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
                    fifo[rx_index_8] <= {rx_axis_tlast,rx_axis_tdata};
                    if(rx_index-finish_index == 45)begin
                        if({fifo[finish_index_8+16][7:0],fifo[finish_index_8+17][7:0]} == 16'h0800) begin
                            // ip 协议
                            if({fifo[finish_index_8+34][7:0],fifo[finish_index_8+35][7:0],fifo[finish_index_8+36][7:0],fifo[finish_index_8+37][7:0]} == my_ip[fifo[finish_index_8+15][7:0]]) begin 
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
                                frame_dest_ip <= {fifo[finish_index_8+34][7:0],fifo[finish_index_8+35][7:0],fifo[finish_index_8+36][7:0],fifo[finish_index_8+37][7:0]};
                                frame_port <= {fifo[finish_index_8+14][7:0],fifo[finish_index_8+15][7:0]};
                                frame_checksum <= {fifo[finish_index_8+28][7:0],fifo[finish_index_8+29][7:0]};
                                frame_ttl <= fifo[finish_index_8+26][7:0];
                                if(fifo[finish_index_8+26][7:0] == 8'h1) begin
                                    state <= STATE_DROP_PAYLOAD;
                                    rx_index <= finish_index;
                                end else                                  
                                    state <= STATE_IP_ROUTE_TABLE1;
                            end
                        end else if({fifo[finish_index_8+16][7:0],fifo[finish_index_8+17][7:0]} == 16'h0806) begin
                            // arp 协议
                            state <= STATE_ARP;
                        end else begin
                            // 
                        end
                        if(rx_index-tx_index == FIFO_LENGTH-1||rx_axis_tlast) begin
                            rx_axis_tready <= 0;
                            if(rx_axis_tlast)
                                rx_finish_flag <= 1;
                        end
                    end
                    rx_index <= rx_index + 1;
                end
            end
            STATE_ARP:begin
                if({fifo[finish_index_8+24][7:0],fifo[finish_index_8+25][7:0]} == 16'h0001) begin
                    // request
                    if({fifo[finish_index_8+42][7:0],fifo[finish_index_8+43][7:0],fifo[finish_index_8+44][7:0],fifo[finish_index_8+45][7:0]} == my_ip[fifo[finish_index_8+15][7:0]])begin
                        // request me
                        fifo[finish_index_8+0] <= fifo[finish_index_8+6];fifo[finish_index_8+1] <= fifo[finish_index_8+7];fifo[finish_index_8+2] <= fifo[finish_index_8+8];fifo[finish_index_8+3] <= fifo[finish_index_8+9];fifo[finish_index_8+4] <= fifo[finish_index_8+10];fifo[finish_index_8+5] <= fifo[finish_index_8+11];

                        fifo[rx_index_8+6] <= {1'b0,my_mac[47:40]};fifo[rx_index_8+7] <= {1'b0,my_mac[39:32]};fifo[rx_index_8+8] <= {1'b0,my_mac[31:24]};fifo[rx_index_8+9] <= {1'b0,my_mac[23:16]};fifo[rx_index_8+10] <= {1'b0,my_mac[15:8]};fifo[rx_index_8+11] <= {1'b0,my_mac[7:0]};

                        fifo[rx_index_8+24] <= 9'h000;fifo[rx_index_8+25] <= 9'h002;

                        fifo[rx_index_8+26] <= {1'b0,my_mac[47:40]};fifo[rx_index_8+27] <= {1'b0,my_mac[39:32]};fifo[rx_index_8+28] <= {1'b0,my_mac[31:24]};fifo[rx_index_8+29] <= {1'b0,my_mac[23:16]};fifo[rx_index_8+30] <= {1'b0,my_mac[15:8]};fifo[rx_index_8+31] <= {1'b0,my_mac[7:0]};

                        fifo[finish_index_8+32] <= fifo[finish_index_8+42];fifo[finish_index_8+33] <= fifo[finish_index_8+43];fifo[finish_index_8+34] <= fifo[finish_index_8+44];fifo[finish_index_8+35] <= fifo[finish_index_8+45];

                        fifo[finish_index_8+42] <= fifo[finish_index_8+32];fifo[finish_index_8+43] <= fifo[finish_index_8+33];fifo[finish_index_8+44] <= fifo[finish_index_8+34];fifo[finish_index_8+45] <= fifo[finish_index_8+35];

                        fifo[finish_index_8+36] <= fifo[finish_index_8+26];fifo[finish_index_8+37] <= fifo[finish_index_8+27];fifo[finish_index_8+38] <= fifo[finish_index_8+28];fifo[finish_index_8+39] <= fifo[finish_index_8+29];fifo[finish_index_8+40] <= fifo[finish_index_8+30];fifo[finish_index_8+41] <= fifo[finish_index_8+31];

                        finish_index <= finish_index + 60;
                        state <= STATE_IDLE;

                    end else begin
                        // 丢包
                        rx_index <= finish_index;
                        state <= STATE_IDLE;
                    end 
                end else if({fifo[finish_index_8+24][7:0],fifo[finish_index_8+25][7:0]} == 16'h0002) begin
                    // response
                    if(arp_insert_ready) begin
                        arp_insert_ip <= {fifo[finish_index_8+32][7:0],fifo[finish_index_8+33][7:0],fifo[finish_index_8+34][7:0],fifo[finish_index_8+35][7:0]};
                        arp_insert_mac <= {fifo[finish_index_8+26][7:0],fifo[finish_index_8+27][7:0],fifo[finish_index_8+28][7:0],fifo[finish_index_8+29][7:0],fifo[finish_index_8+30][7:0],fifo[finish_index_8+31][7:0]};
                        arp_insert_port <= {fifo[finish_index_8+14][7:0],fifo[finish_index_8+15][7:0]};
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
                    fifo[rx_index_8] <= {rx_axis_tlast,rx_axis_tdata};
                    if(rx_index-tx_index == FIFO_LENGTH-1||rx_axis_tlast)begin
                        //FIFO满了或收完这个包�??
                        rx_axis_tready <= 0;
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
                    router_dest_ip <= frame_dest_ip;
                    router_dest_ip_valid <= 1; 
                    state <= STATE_IP_ROUTE_TABLE2;
                end
            end
            STATE_IP_ROUTE_TABLE2: begin
                if(rx_axis_tvalid && rx_axis_tready) begin
                    fifo[rx_index_8] <= {rx_axis_tlast,rx_axis_tdata};
                    if(rx_index-tx_index == FIFO_LENGTH-1||rx_axis_tlast)begin
                        //FIFO满了或收完这个包�??
                        rx_axis_tready <= 0;
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
                        frame_nexthop <= router_nexthop;
                        frame_nexthop_port <= router_port;
                        state <= STATE_IP_ARP_TABLE;
                    end
                end
            end
            STATE_IP_ARP_TABLE1:begin
                if(rx_axis_tvalid && rx_axis_tready) begin
                    fifo[rx_index_8] <= {rx_axis_tlast,rx_axis_tdata};
                    if(rx_index-tx_index == FIFO_LENGTH-1||rx_axis_tlast)begin
                        //FIFO满了或收完这个包�??
                        rx_axis_tready <= 0;
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
                    arp_lookup_ip <= frame_nexthop;
                    arp_lookup_valid <= 1; 
                    state <= STATE_IP_ARP_TABLE2;
                end
            end
            STATE_IP_ARP_TABLE2:begin
                if(rx_axis_tvalid && rx_axis_tready) begin
                    fifo[rx_index_8] <= {rx_axis_tlast,rx_axis_tdata};
                    if(rx_index-tx_index == FIFO_LENGTH-1||rx_axis_tlast)begin
                        //FIFO满了或收完这个包�??
                        rx_axis_tready <= 0;
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
                        arp_request_ip <= frame_nexthop;
                        arp_request_port <= frame_nexthop_port;
                        state <= STATE_DROP_PAYLOAD;
                    end else begin
                        frame_nexthop_mac <= arp_lookup_mac;
                        frame_nexthop_port <= arp_lookup_port;
                        frame_ttl <= frame_ttl-1;
                        if (frame_checksum[15:8]==8'hff) begin
                                frame_checksum[15:8]<=8'h00;
                                frame_checksum[7:0]<=frame_checksum[7:0]+1;
                        end else if (frame_checksum[15:8]==8'hfe && frame_checksum[7:0]==8'hff) begin
                            frame_checksum[15:8]<=8'h00;
                            frame_checksum[7:0]<=8'h00;
                        end else begin
                            frame_checksum[15:8]<=frame_checksum[15:8]+1;
                        end 
                        state <= STATE_FORWARD;
                    end
                end
            end
            STATE_FORWARD:begin
                if(rx_axis_tvalid && rx_axis_tready) begin
                    fifo[rx_index_8] <= {rx_axis_tlast,rx_axis_tdata};
                    if(rx_index-tx_index == FIFO_LENGTH-1||rx_axis_tlast)begin
                        //FIFO满了或收完这个包�??
                        rx_axis_tready <= 0;
                        rx_finish_flag <= 1;
                    end
                    rx_index <= rx_index + 1;
                end else if(rx_finish_flag) begin
                    // 收完该包了，等待路由查表arp查表
                end else if(!rx_axis_tready) begin
                    if(rx_index-tx_index<=FIFO_LENGTH-1)
                        rx_axis_tready <= 1;
                end
                {fifo[finish_index_8+0][7:0],fifo[finish_index_8+1][7:0],fifo[finish_index_8+2][7:0],fifo[finish_index_8+3][7:0],fifo[finish_index_8+4][7:0],fifo[finish_index_8+5][7:0]} <= frame_nexthop_mac;
                {fifo[finish_index_8+6][7:0],fifo[finish_index_8+7][7:0],fifo[finish_index_8+8][7:0],fifo[finish_index_8+9][7:0],fifo[finish_index_8+10][7:0],fifo[finish_index_8+11][7:0]} <= my_mac;
                {fifo[finish_index_8+14][7:0],fifo[finish_index_8+15][7:0]}<= frame_nexthop_port;
                fifo[finish_index_8+26][7:0] <= frame_ttl-1;
                {fifo[finish_index_8+28][7:0],fifo[finish_index_8+29][7:0]} <= frame_checksum;
                state <= STATE_FORWARD_PAYLOAD;
                finish_index <= rx_index;
            end
            STATE_FORWARD_PAYLOAD:begin
                if(rx_axis_tvalid && rx_axis_tready) begin
                    fifo[rx_index_8] <= {rx_axis_tlast,rx_axis_tdata};
                    if(rx_index-tx_index == FIFO_LENGTH-1||rx_axis_tlast)begin
                        //FIFO满了或收完这个包�??
                        rx_axis_tready <= 0;
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
                receiver_data_o <= fifo[index_iter_8];
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
                end else if(receiver_addr == 11'h7fd) begin
                    receiver_addr <= 11'h7fd;
                    receiver_data_o <= receiver_frame_length[15:8];
                end else if(receiver_addr == 11'h7fe) begin
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
