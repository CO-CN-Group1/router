module router_table_lookup #
(
    parameter DATA_WIDTH = 8,
    parameter ROUTER_TABLE_N = 10,  
    parameter FRAME_LENGTH = 4096
)
(

    input wire                      clk,
    // data from the RX data path
    input wire [DATA_WIDTH-1:0]     rx_axis_tdata,
    input wire                      rx_axis_tvalid,
    input wire                      rx_axis_tlast,  
    output wire                     rx_axis_tready,
    // data to the TX data path
    output wire [DATA_WIDTH-1:0]    tx_axis_tdata,
    output reg                     tx_axis_tvalid,
    output wire                     tx_axis_tlast,
    input wire                      tx_axis_tready
);

wire rx_axis_tready_reg = 0;
reg[DATA_WIDTH-1:0] tx_axis_tdata_reg;
wire tx_axis_tvalid_reg = 0;
reg tx_axis_tlast_reg = 0;

assign rx_axis_tready = rx_axis_tready_reg;
//assign tx_axis_tvalid = tx_axis_tvalid_reg;
assign tx_axis_tlast = tx_axis_tlast_reg;
assign tx_axis_tdata = tx_axis_tdata_reg;

integer trie_n = 0;
integer trie[0:ROUTER_TABLE_N * 32-1][0:1];
reg trie_is_valid[0:ROUTER_TABLE_N * 32-1];
reg[15:0] ports[0:ROUTER_TABLE_N*32-1];

reg [DATA_WIDTH-1:0] data[0:FRAME_LENGTH/DATA_WIDTH-1];
integer data_head = 0,data_tail = 0;
localparam[2:0] 
    STATE_IDLE = 3'd0,
    STATE_WAIT = 3'd1,
    STATE_INPUT = 3'd2,
    STATE_BUSY = 3'd3,
    STATE_OUTPUT = 3'd4;
reg [2:0] rx_state = STATE_IDLE;
reg [2:0] tx_state = STATE_IDLE;

integer current = 1,next_current;
integer loop_var = 31;
reg is_node_have_info;
reg [15:0] port,tmp_port;
reg [31:0] dest_ip;

assign rx_axis_tready_reg = (rx_state==STATE_INPUT);
always @(posedge clk)begin
    case(rx_state)
        STATE_IDLE:begin
            if (tx_state==STATE_IDLE && rx_axis_tvalid) begin
                rx_state<=STATE_INPUT;
                data_head<=0;
                data_tail<=0;
            end
        end
        STATE_INPUT:begin
            if (rx_axis_tvalid) begin
                data[data_tail]<=rx_axis_tdata;
                data_tail<=data_tail+1;
                if (rx_axis_tlast) begin
                    rx_state<=STATE_IDLE;
                end
            end
        end
        default:begin
            rx_state<=STATE_IDLE;
        end
    endcase
end

assign tx_axis_tvalid_reg = (tx_state==STATE_OUTPUT) && (data_head<data_tail);
always @(posedge clk)begin
    case(tx_state)
        STATE_IDLE:begin
            if (rx_state!=STATE_IDLE) begin
                tx_state<=STATE_WAIT;
                data_head<=0;
            end
        end
        STATE_WAIT:begin
            if (data_tail>37) begin
                tx_state<=STATE_BUSY;
                dest_ip<={data[34],data[35],data[36],data[37]};
                loop_var<=31;
                current<=1;
                is_node_have_info<=1'b1;
                tmp_port<=ports[1];
                port<=ports[1];
                next_current<=trie[1][data[34][DATA_WIDTH-1]];
            end
            else begin
                if (rx_state==STATE_IDLE) begin
                    tx_state<=STATE_IDLE;
                end
            end
        end
        STATE_BUSY:begin
            if (current==0) begin
                tx_state<=STATE_OUTPUT;
                data[0]<=port[15:8];
                data[1]<=port[7:0];
            end
            else begin
                if (is_node_have_info) begin
                    port<=tmp_port;
                end
                if (loop_var<0) begin
                    current<=0;
                end
                else begin
                    loop_var<=loop_var-1;
                    //current=trie[current][dest_ip[loop_var]];
                    current<=next_current;
                    is_node_have_info<=trie_is_valid[next_current];
                    tmp_port<=ports[next_current];
                    if (loop_var>0) begin
                        next_current<=trie[next_current][dest_ip[loop_var-1]];
                    end
                end
            end
        end
        STATE_OUTPUT:begin
            if (tx_axis_tvalid_reg && tx_axis_tready) begin
                data_head<=data_head+1;
                if (rx_state==STATE_IDLE && data_head+1==data_tail) begin
                    tx_state<=STATE_IDLE;
                end
            end
        end
        default:begin
            tx_state<=STATE_IDLE;
        end
    endcase
end

always @(posedge clk)begin
    tx_axis_tvalid<=tx_axis_tvalid_reg;
    tx_axis_tdata_reg<=data[data_head];
    tx_axis_tlast_reg<=(rx_state==STATE_IDLE && data_head+1==data_tail);
end
















/*




reg [111:0] router_table[0:ROUTER_TABLE_N-1];
reg [DATA_WIDTH-1:0] data[0:FRAME_LENGTH/DATA_WIDTH-1];
integer data_head = 0,data_tail = 0,router_table_total;
reg [15:0] port;
reg [31:0] ip;
reg [31:0] nexthop;
reg [31:0] mask;
reg [31:0] dest_ip;
localparam[1:0] 
    STATE_IDLE = 2'd0,
    STATE_INPUT = 2'd1,
    STATE_BUSY = 2'd2,
    STATE_OUTPUT = 2'd3;
reg [1:0] state = STATE_IDLE;
reg [31:0] debug;
reg [31:0] debug2;
reg hasFind = 1'b0;
always @(state) begin
    if(state==STATE_BUSY||state==STATE_OUTPUT)begin
        rx_axis_tready_reg = 1'b0;
    end else begin
        rx_axis_tready_reg = 1'b1;
    end
end

always @(posedge clk)begin
    case(state)
        STATE_IDLE:begin
            tx_axis_last_reg = 1'b0;
            tx_axis_tvalid_reg = 1'b0;
            hasFind = 1'b0;
            if(rx_axis_tvalid)begin
                state = STATE_INPUT;
                data_head = 0;
                data_tail = 0;
                data[data_tail] = rx_axis_tdata;
                data_tail = data_tail + 1;
            end
        end
        STATE_INPUT:begin
            if(rx_axis_tvalid)begin
                data[data_tail] = rx_axis_tdata;
                data_tail= data_tail + 1;
            end 
            if(rx_axis_tlast)begin
                state = STATE_BUSY;
            end
        end 
        STATE_BUSY:begin
            
            for(integer i=0;i<router_table_total;i = i+1)begin
                
                dest_ip = {data[34],data[35],data[36],data[37]};
                debug = dest_ip&router_table[i][79:48];
                debug2 = router_table[i][111:80];
                if((dest_ip&router_table[i][79:48])==router_table[i][111:80]&&!hasFind)begin
                    {ip,mask,nexthop,port} = router_table[i];
                    hasFind = 1'b1;
                    //  暂时放置在前两位
                    data[0] = port[15:8];
                    data[1] = port[7:0];
                end
            end
            state = STATE_OUTPUT;
        end
        STATE_OUTPUT:begin
            if(tx_axis_tready)begin
                tx_axis_tvalid_reg = 1;
                tx_axis_tdata_reg = data[data_head];
                data_head =data_head+ 1;
                if(data_head==data_tail)begin
                    tx_axis_last_reg = 1'b1;
                    state = STATE_IDLE;
                end
            end
        end
    endcase
end
*/
endmodule
