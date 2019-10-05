module rgmii_tx_printer(
    input [3:0] rgmii_td,
    input rgmii_tx_ctl,
    input rgmii_txc
);

integer fd=0, frame_count=0, frame_count_max = 3;
logic [7:0] data;
logic [3:0] data_pre;
logic dv,dv_pre,dv_reg = 0;


initial begin
    fd = $fopen("send_frame.mem","w");
end



always @(posedge rgmii_txc)begin
    if(frame_count<frame_count_max) begin
        if(dv_reg == 1'b1 && dv==1'b0)begin
            frame_count = frame_count + 1;
            $fwrite(fd,"\n");
            if(frame_count == frame_count_max)begin
                //$display("close file");
                $fclose(fd);
            end
        end 
        if(dv&&frame_count<frame_count_max)begin
            //$display("%d %02h",frame_count,data);
            $fwrite(fd,"%02H ",data);
        end
    end
    dv <= dv_pre;
    data[3:0] <= data_pre;
    dv_reg <= dv;
end

genvar i;
for (i = 0;i < 4;i++) begin
    IDDR #(
        .DDR_CLK_EDGE("SAME_EDGE")
    ) iddr_inst (
        .Q1(data_pre[i]),
        .Q2(data[i+4]),
        .C(rgmii_txc),
        .CE(1'b1),
        .D(rgmii_td[i]),
        .R(1'b0)
    );
end

IDDR #(
    .DDR_CLK_EDGE("SAME_EDGE")
) iddr_inst_ctl (
    .Q1(dv_pre),
    .C(rgmii_txc),
    .CE(1'b1),
    .D(rgmii_tx_ctl),
    .R(1'b0)
);

endmodule
