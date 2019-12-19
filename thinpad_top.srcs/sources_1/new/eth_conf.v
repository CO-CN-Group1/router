module eth_conf(
    input wire clk,
    input wire rst_in_n,

    input  wire eth_spi_miso,
    output reg eth_spi_mosi,
    output reg eth_spi_sck,
    output reg eth_spi_ss_n,

    output wire done
);

parameter N_CONFIG_ENTRY = 31;

reg [15:0] config_addr[0:N_CONFIG_ENTRY-1];
reg [7:0] config_data[0:N_CONFIG_ENTRY-1];

initial begin
  // P1-P4 Tag Removal
  config_addr[0] = 16;
  config_data[0] = 2;
  config_addr[1] = 32;
  config_data[1] = 2;
  config_addr[2] = 48;
  config_data[2] = 2;
  config_addr[3] = 64;
  config_data[3] = 2;
  // P5 Tag Insertion
  config_addr[4] = 80;
  config_data[4] = 4;
  // P1-P5 PVID
  config_addr[5] = 20;
  config_data[5] = 1;
  config_addr[6] = 36;
  config_data[6] = 2;
  config_addr[7] = 52;
  config_data[7] = 3;
  config_addr[8] = 68;
  config_data[8] = 4;
  config_addr[9] = 84;
  config_data[9] = 5;
  // P1-P4 membership
  config_addr[10] = 17;
  config_data[10] = (1 << 4) | (1 << 0);
  config_addr[11] = 33;
  config_data[11] = (1 << 4) | (1 << 1);
  config_addr[12] = 49;
  config_data[12] = (1 << 4) | (1 << 2);
  config_addr[13] = 65;
  config_data[13] = (1 << 4) | (1 << 3);
  // P1-P4 VLAN Table
  config_addr[14] = 110;
  config_data[14] = 20;
  config_addr[15] = 111;
  config_data[15] = 0; // Read from Set 0
  config_addr[16] = 118; // VLAN 1, membership 1 and 5, FID = 1
  config_data[16] = 8'b1_0000001;
  config_addr[17] = 117;
  config_data[17] = 8'b11000;
  config_addr[18] = 116; // VLAN 2, membership 2 and 5, FID = 2
  config_data[18] = 8'b0_0000010;
  config_addr[19] = 115;
  config_data[19] = 8'b11001;
  config_addr[20] = 114; // VLAN 3, membership 3 and 5, FID = 3
  config_data[20] = 8'b0_0000011;
  config_addr[21] = 113;
  config_data[21] = 8'b11010;
  config_addr[22] = 110;
  config_data[22] = 4;
  config_addr[23] = 111;
  config_data[23] = 0; // Write to Set 0
  config_addr[24] = 110;
  config_data[24] = 20;
  config_addr[25] = 111;
  config_data[25] = 1; // Read from Set 1
  config_addr[26] = 120; // VLAN 4, membership 4 and 5, FID = 4
  config_data[26] = 8'b0_0000100;
  config_addr[27] = 119;
  config_data[27] = 8'b11100;
  config_addr[28] = 110;
  config_data[28] = 4;
  config_addr[29] = 111;
  config_data[29] = 1; // Write to Set 1
  config_addr[30] = 5; // VLAN Enable
  config_data[30] = 8'b10000000;
end

reg [15:0] reg_addr;
reg [7:0] reg_data;

reg rst_n;

reg [2:0] conf_state;
reg [14:0] wait_counter;

reg [5:0] conf_entry_index;
reg conf_written;
wire conf_wr_en;

assign done = conf_state == 2;
assign conf_wr_en = conf_state == 1;

always @(posedge clk or negedge rst_in_n) begin
    if(~rst_in_n)
        rst_n <= 0;
    else
        rst_n <= 1;
end

always @(posedge clk) begin
    reg_addr <= config_addr[conf_entry_index];
    reg_data <= config_data[conf_entry_index];
end

always @(posedge clk) begin
    if(~rst_n) begin
        conf_state <= 0;
        wait_counter <= 0;
    end else begin
        case (conf_state)
            0: begin
                wait_counter <= wait_counter + 1;
                if(wait_counter[14]) begin
                    conf_state <= 1;
                    conf_entry_index <= 0;
                end
            end
            1: begin
                if(conf_written) begin
                    if(conf_entry_index == N_CONFIG_ENTRY-1)
                        conf_state <= 2;
                    conf_entry_index <= conf_entry_index + 1;
                end
            end
            2: begin
                conf_state <= 2;
            end
        endcase
    end
end

reg [2:0] entry_state;
reg [7:0] spi_data;
reg spi_en;
reg spi_done;

always @(posedge clk) begin
    if(~rst_n) begin
        conf_written <= 0;
        eth_spi_ss_n <= 1;
        entry_state <= 0;
        spi_en <= 0;
    end else if(conf_wr_en) begin
        conf_written <= 0;
        case(entry_state)
        0: begin
            eth_spi_ss_n <= 0;
            entry_state <= 1;
        end
        1: begin
            spi_data <= 8'h40 | reg_addr[7+:8];
            spi_en <= 1;
            if(spi_done) begin
                spi_en <= 0;
                entry_state <= 2;
            end
        end
        2: begin
            spi_data <= {reg_addr[0+:7], 1'b0};
            spi_en <= 1;
            if(spi_done) begin
                spi_en <= 0;
                entry_state <= 3;
            end
        end
        3: begin
            spi_data <= reg_data;
            spi_en <= 1;
            if(spi_done) begin
                spi_en <= 0;
                entry_state <= 4;
            end
        end
        4: begin
            eth_spi_ss_n <= 1;
            conf_written <= 1;
            entry_state <= 5;
        end
        5: begin
            entry_state <= 0;
        end
        endcase
    end
end

reg [4:0] spi_bit_cnt;
reg [6:0] spi_shift;
always @(posedge clk) begin
    if(~rst_n) begin
        spi_done <= 0;
        spi_bit_cnt <= 0;
        eth_spi_sck <= 0;
    end else if(spi_done) begin
        spi_done <= 0;
        spi_bit_cnt <= 0;
    end else if(spi_en) begin
        eth_spi_sck <= spi_bit_cnt[0];
        spi_bit_cnt <= spi_bit_cnt + 1;

        if(spi_bit_cnt == 0) begin
            spi_shift <= spi_data[6:0];
            eth_spi_mosi <= spi_data[7];
        end else if(spi_bit_cnt == 5'd16) begin
            spi_done <= 1;
        end else begin
            if(~spi_bit_cnt[0]) begin
                eth_spi_mosi <= spi_shift[6];
                spi_shift <= {spi_shift[0+:6], 1'b0};
            end
        end 
    end
end

endmodule