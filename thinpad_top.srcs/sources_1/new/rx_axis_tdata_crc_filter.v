

module rx_axis_tdata_crc_filter #
(
    parameter DATA_WIDTH = 8,
    parameter CRC_LENGTH = 4
)
(
    input wire                      clk,

    input wire [DATA_WIDTH-1:0]     fifo_tdata,
    input wire                      fifo_tvalid,
    input wire                      fifo_tlast,
    output wire                     fifo_tready,

    output wire[DATA_WIDTH-1:0]     no_crc_tdata,
    output wire                     no_crc_tvalid,
    output wire                     no_crc_tlast,
    input wire                      no_crc_tready
);

reg [DATA_WIDTH-1:0]    no_crc_tdata_reg = 0;
reg                     no_crc_tvalid_reg = 0;
reg                     no_crc_tlast_reg = 0;


reg [DATA_WIDTH-1:0]    buffer[0:CRC_LENGTH];
integer                 buffer_st = 0;
integer                 buffer_ed = 0;


assign fifo_tready = no_crc_tready;
assign no_crc_tdata = no_crc_tdata_reg;
assign no_crc_tlast = no_crc_tlast_reg;
assign no_crc_tvalid = no_crc_tvalid_reg;



always @(posedge clk) begin

    if(no_crc_tlast_reg==1'b1)begin
        buffer_st = 0;
        buffer_ed = 0;
        no_crc_tvalid_reg = 1'b0;
        no_crc_tlast_reg = 1'b0;
    end

    if(fifo_tvalid && fifo_tready) begin
        if(buffer_ed+1 == buffer_st||(buffer_ed==CRC_LENGTH&&buffer_st==0))begin
            no_crc_tvalid_reg = 1'b1;
            no_crc_tdata_reg = buffer[buffer_st];
            buffer_st = buffer_st==CRC_LENGTH?0:buffer_st+1;
            buffer[buffer_ed] = fifo_tdata;
            buffer_ed = buffer_ed==CRC_LENGTH?0:buffer_ed+1;
            if(fifo_tlast)
                no_crc_tlast_reg = 1'b1;
        end else begin
            buffer[buffer_ed] = fifo_tdata;
            buffer_ed = buffer_ed==CRC_LENGTH?0:buffer_ed+1;
        end
    end
end;
endmodule
