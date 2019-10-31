module rx_axis_tdata_crc_filter #
(
    parameter DATA_WIDTH = 8,
    parameter CRC_LENGTH = 4
)
(
    input wire                      clk,
    input wire                      rst,

    input wire [DATA_WIDTH-1:0]     fifo_tdata,
    input wire                      fifo_tvalid,
    input wire                      fifo_tlast,
    output wire                     fifo_tready,

    output reg[DATA_WIDTH-1:0]      no_crc_tdata,
    output reg                      no_crc_tvalid,
    output reg                      no_crc_tlast,
    input wire                      no_crc_tready
);

reg [DATA_WIDTH-1:0]    buffer[0:CRC_LENGTH];
integer                 buffer_st;
integer                 buffer_ed;

assign fifo_tready = no_crc_tready;

initial begin
    no_crc_tdata = 0;
    no_crc_tvalid = 0;
    no_crc_tlast = 0;
    buffer_st = 0;
    buffer_ed = 0;
end

always @(buffer_ed)begin
    if(buffer_ed==0)
        buffer[CRC_LENGTH] <= fifo_tdata;
    else 
        buffer[buffer_ed-1] <= fifo_tdata;
end 

always @(buffer_st)begin
    if(buffer_st==0)
        no_crc_tdata <= buffer[CRC_LENGTH];
    else
        no_crc_tdata <= buffer[buffer_st-1]; 
end

always @(posedge clk or posedge rst) begin

    if(rst)begin
        buffer_st <= 0;
        buffer_ed <= 0;
        no_crc_tvalid <= 0;
        no_crc_tlast <= 0;
        no_crc_tdata <= 0;
    end else begin
        if(no_crc_tlast)begin
            buffer_st <= 0;
            buffer_ed <= 0;
            no_crc_tvalid <= 0;
            no_crc_tlast <= 0;
        end else if(fifo_tvalid && fifo_tready) begin
            if(buffer_ed+1 == buffer_st||(buffer_ed==CRC_LENGTH&&buffer_st==0))begin
                no_crc_tvalid <= 1'b1;
                buffer_st <= buffer_st==CRC_LENGTH?0:buffer_st+1;
                buffer_ed <= buffer_ed==CRC_LENGTH?0:buffer_ed+1;
                if(fifo_tlast)
                    no_crc_tlast <= 1'b1;
            end else begin
                buffer_ed <= buffer_ed==CRC_LENGTH?0:buffer_ed+1;
            end
        end
    end
end;
endmodule
