module rx_axis_tdata_crc_filter #
(
    parameter DATA_WIDTH = 8,
    parameter CRC_LENGTH = 8
)
(
    input wire                      clk,
    input wire                      rst,

    input wire [DATA_WIDTH-1:0]     fifo_tdata,
    input wire                      fifo_tvalid,
    input wire                      fifo_tlast,
    output reg                     fifo_tready,

    output wire[DATA_WIDTH-1:0]      no_crc_tdata,
    output wire                      no_crc_tvalid,
    output wire                      no_crc_tlast,
    input wire                      no_crc_tready
);

reg [DATA_WIDTH-1:0]    buffer[0:CRC_LENGTH-1];
reg buffer_tlast[0:CRC_LENGTH-1];
integer                 buffer_st;
integer                 buffer_ed;

reg frame_end_flag;

assign no_crc_tdata = buffer[buffer_st[2:0]];
assign no_crc_tvalid = (buffer_ed-buffer_st>=5);
assign no_crc_tlast = buffer_tlast[buffer_st[2:0]+3'd4];
always @(posedge clk) begin
    if(rst) begin
        buffer_st <= 0;
        buffer_ed <= 0;
        fifo_tready <= 0;
        frame_end_flag <= 0;
    end else begin
        if(fifo_tvalid && fifo_tready) begin
            buffer[buffer_ed[2:0]] <= fifo_tdata;
            buffer_tlast[buffer_ed[2:0]] <= fifo_tlast;
            if(fifo_tlast||buffer_ed-buffer_st == CRC_LENGTH) begin
                fifo_tready <= 0;
            end
            buffer_ed <= buffer_ed + 1;
        end else if(fifo_tvalid) begin
            if(buffer_ed-buffer_st <= CRC_LENGTH-1)
                fifo_tready <= 1;
        end
        if(no_crc_tlast) begin
            buffer_st <= buffer_st + 5;
        end else if(no_crc_tready && no_crc_tvalid) begin
            buffer_st <= buffer_st + 1;
        end
    end
end


endmodule
