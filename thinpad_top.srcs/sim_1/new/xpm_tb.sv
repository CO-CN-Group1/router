`timescale 1ns / 1ps
module xpm_tb;

wire clk_50M, clk_11M0592, clk_125M, clk_125M_90deg;
logic rst = 0;

clock osc(
    .clk_11M0592   (clk_11M0592),
    .clk_50M       (clk_50M),
    .clk_125M      (clk_125M),
    .clk_125M_90deg(clk_125M_90deg)
);

logic rsta,rstb,ena,enb;
logic[3:0] wea,web;
logic[6:0] addra;
logic[6:0] addrb;
logic[31:0] dina,dinb,douta,doutb;

xpm_memory_tdpram #(
    // A for cpu B for router
    .ADDR_WIDTH_A(7),
    .WRITE_DATA_WIDTH_A(32),
    .BYTE_WRITE_WIDTH_A(8),
    .READ_DATA_WIDTH_A(32),
    .READ_LATENCY_A(0),
    .ADDR_WIDTH_B(7),
    .WRITE_DATA_WIDTH_B(32),
    .BYTE_WRITE_WIDTH_B(8),
    .READ_DATA_WIDTH_B(32),
    .READ_LATENCY_B(0),
    .MEMORY_SIZE(32*128),
    .CLOCKING_MODE("independent_clock")
) xpm_memory_tdpram0 (
    .clka(clk_50M),
    .rsta(rsta),
    .ena(ena),
    .addra(addra),
    .dina(dina),
    .douta(douta),
    .wea(wea),

    .clkb(clk_125M),
    .rstb(rstb),
    .enb(enb),
    .addrb(addrb),
    .dinb(dinb),
    .doutb(doutb),
    .web(web)
);

always @(posedge clk_50M) begin
    if(rsta) begin
        ena <= 1'b0;
        addra <= 0;
        dina <= 0;
        wea <= 4'b0;
    end else begin
        ena <= 1'b1;
        addra <= 0;
        wea <= 4'b0;
    end
end

integer dataGen = 0,addrGen = 0;
always @(posedge clk_125M)begin
    if(rstb)begin
        enb <= 1'b0;
        addrb <= 0;
        dinb <= 0;
        web <= 4'b0;
    end else begin
        if(addrGen <=100) begin
            enb <= 1'b1;
            dinb <= {dataGen[7:0],dataGen[7:0],dataGen[7:0],dataGen[7:0]};
            addrb <= addrGen[8:2];
            dataGen <= dataGen + 32'h1;
            addrGen <= addrGen + 32'h1; 
            case(addrGen[1:0])
                2'b00:
                    web <= 4'b0001;
                2'b01:
                    web <= 4'b0010;
                2'b10:
                    web <= 4'b0100;
                2'b11:
                    web <= 4'b1000;    
            endcase
        end else begin
            enb <= 1'b1;
            web <= 4'b0000;
        end
    end
end


initial begin
    rsta = 1;
    rstb = 1;
    #30 rsta = 0;
    rstb = 0;
end

endmodule