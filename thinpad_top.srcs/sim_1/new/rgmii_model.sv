`timescale 1ns / 1ps
module rgmii_model (
    input clk_125M,
    input clk_125M_90deg,

    input [3:0] rgmii_td,
    input rgmii_tx_ctl,
    input rgmii_txc,

    output [3:0] rgmii_rd,
    output rgmii_rx_ctl,
    output rgmii_rxc
);
    localparam BUFFER_SIZE = 2000;
    localparam FRAME_COUNT = 10;

    logic packet_clk;
    logic trans, out_en;
    logic [7:0] frame_index = 0;
    logic [3:0] data1;
    logic [3:0] data2;
    logic [3:0] out1;
    logic [3:0] out2;
    logic [7:0] frame_data [FRAME_COUNT-1:0][BUFFER_SIZE-1:0];
    logic [8*BUFFER_SIZE-1:0] buffer;
    logic [15:0] count;
    logic [15:0] frame_size [FRAME_COUNT-1:0];
    integer fd, fout, index, res, frame_count;

    initial begin
        packet_clk = 0;
        fd = $fopen("example_frame.mem", "r");
        fout = $fopen("receive_data.mem", "w");

        index = 0;
        frame_count = 0;
        for (integer i = 0;i < FRAME_COUNT;i++) begin
            frame_size[i] = 0;
            for (integer j = 0;j < BUFFER_SIZE;j++) begin
                frame_data[i][j] = 0;
            end
        end

        while (!$feof(fd)) begin
            res = $fscanf(fd, "%x", frame_data[frame_count][index]);
            if (res != 1) begin
                // end of a frame
                // read a line
                $fgets(buffer, fd);
                if (index > 0) begin
                    frame_size[frame_count] = index + 1;
                    frame_count = frame_count + 1;
                end
                index = 0;
            end else begin
                index = index + 1;
            end
        end

        if (index > 0) begin
            frame_size[frame_count] = index + 1;
            frame_count = frame_count + 1;
        end
    end

    always packet_clk = #1000 ~packet_clk;
    /*always_ff @ (posedge clk_125M) begin
        count <= packet_clk ? count + 1 : 0;
        if (packet_clk && count < frame_size[frame_index] - 1) begin
            trans <= 1'b1;
            data1 <= frame_data[frame_index][count][3:0];
            data2 <= frame_data[frame_index][count][7:4];
        end else begin
            trans <= 1'b0;
            data1 <= 4'b0;
            data2 <= 4'b0;
        end
    end
    always_ff @ (negedge packet_clk) begin
        frame_index = (frame_index + 1) % frame_count;
    end*/

    always_ff @ (posedge clk_125M) begin
        if (count < frame_size[frame_index] - 1) begin
            count <= count + 1;
            trans <= 1'b1;
            data1 <= frame_data[frame_index][count][3:0];
            data2 <= frame_data[frame_index][count][7:4];
        end else begin
            trans <= 1'b0;
            data1 <= 4'b0;
            data2 <= 4'b0;
            count <= 0;
            frame_index <= (frame_index + 1) % frame_count;
        end
    end
    

    genvar i;
    for (i = 0;i < 4;i++) begin
        ODDR #(
            .DDR_CLK_EDGE("SAME_EDGE")
        ) oddr_inst (
            .D1(data1[i]),
            .D2(data2[i]),
            .C(clk_125M),
            .CE(1'b1),
            .Q(rgmii_rd[i]),
            .R(1'b0)
        );
    end

    ODDR #(
        .DDR_CLK_EDGE("SAME_EDGE")
    ) oddr_inst_ctl (
        .D1(trans),
        .D2(trans),
        .C(clk_125M),
        .CE(1'b1),
        .Q(rgmii_rx_ctl),
        .R(1'b0)
    );

    for (i = 0;i < 4;i++) begin
        IDDR #(
            .DDR_CLK_EDGE("SAME_EDGE_PIPELINED")
        ) iddr_inst (
            .Q1(out1[i]),
            .Q2(out2[i]),
            .C(rgmii_txc),
            .D(rgmii_td[i]),
            .CE(1'b1),
            .R(1'b0)
        );
    end

    IDDR #(
        .DDR_CLK_EDGE("SAME_EDGE_PIPELINED")
    ) iddr_inst_ctl (
        .Q1(out_en),
        .C(rgmii_txc),
        .D(rgmii_tx_ctl),
        .CE(1'b1),
        .R(1'b0)
    );

    // Output trasmitted frame into file. 
    // Each output frame a line. 
    // Output file is located in 'thinpad_top.sim/sim_1/behav/xsim'
    // If you see nothing in the file while simulating, 
    //   press 'Restart' button on the toolbar to enforce file flushing. 
    reg receiving = 0;
    always @ (posedge rgmii_txc) begin
        if (out_en) begin
            $fwrite(fout, "%X", out2);
            $fwrite(fout, "%X ", out1);
            receiving <= 1;
        end
        else if (receiving) begin
            $fwrite(fout, "\n");
            $fflush(fout);
            receiving <= 0;
        end
    end

    assign rgmii_rxc = clk_125M_90deg;
endmodule
