`timescale 1ns / 1ps

module arp_table_tb;

wire clk_50M, clk_11M0592, clk_125M, clk_125M_90deg;
logic rst = 0;

clock osc(
    .clk_11M0592   (clk_11M0592),
    .clk_50M       (clk_50M),
    .clk_125M      (clk_125M),
    .clk_125M_90deg(clk_125M_90deg)
);

logic[31:0] lookup_ip = 0;
logic[47:0] lookup_mac;
logic[15:0] lookup_port;
logic lookup_valid = 0;
logic lookup_mac_valid;
logic lookup_mac_not_found;
logic lookup_ready;

logic[31:0] insert_ip = 0;
logic[47:0] insert_mac = 0;
logic[15:0] insert_port = 0;
logic insert_valid = 0;
logic insert_ready;       


arp_table arp_table_inst(
    .clk(clk_125M),
    .rst(rst),
    .lookup_ip(lookup_ip),
    .lookup_mac(lookup_mac),
    .lookup_port(lookup_port),
    .lookup_valid(lookup_valid),
    .lookup_mac_valid(lookup_mac_valid),
    .lookup_mac_not_found(lookup_mac_not_found),
    .lookup_ready(lookup_ready),

    .insert_ip(insert_ip),
    .insert_mac(insert_mac),
    .insert_port(insert_port),
    .insert_valid(insert_valid),
    .insert_ready(insert_ready)        
);

logic init = 0;
integer arp_table_fd,count_table = 0,arp_sample_in_fd,arp_sample_out_fd,count_ip = 0;
logic[32+48+16-1:0] arp_table_data[0:31];
logic[31:0] ip_data[0:31];
initial begin
    arp_table_fd = $fopen("arp_table_file.mem","r");
    while(!$feof(arp_table_fd))begin 
        $fscanf(arp_table_fd,"%24h",arp_table_data[count_table]);
        $display("entry: %08h %12h %04h",arp_table_data[count_table][32+48+16-1:48+16],arp_table_data[count_table][48+16-1:16],arp_table_data[count_table][16-1:0]);
        count_table +=1;
    end;
    $fclose(arp_table_fd);
    arp_sample_in_fd = $fopen("arp_sample_in.mem","r");
    while(!$feof(arp_sample_in_fd))begin 
        $fscanf(arp_sample_in_fd,"%08h",ip_data[count_ip]);
        $display("ip: %08h",ip_data[count_ip]);
        count_ip +=1;
    end;
    $fclose(arp_sample_in_fd);
    arp_sample_out_fd = $fopen("arp_sample_out.mem","w");
    
    rst = 1;
    #20 rst = 0;
end

localparam[1:0]
    STATE_INSERT_IDLE = 0,
    STATE_INSERT_INSERT = 1;

logic[1:0] state_insert;
logic[4:0] timer; 
integer insert_current;

always @(posedge clk_125M) begin
    if(rst) begin
        state_insert <= STATE_INSERT_IDLE;
        timer <= 5'b0;
        insert_current <= 0;
        insert_ip <= 32'b0;
        insert_mac <= 48'b0;
        insert_port <= 16'b0;
        insert_valid <= 1'b0;
    end else begin
        case(state_insert)
            STATE_INSERT_IDLE:begin
                if(timer == 5'b11111 && insert_ready)begin
                    state_insert <= STATE_INSERT_INSERT;
                    insert_ip <= 32'b0;
                    insert_mac <= 48'b0;
                    insert_port <= 16'b0;
                    insert_valid <= 1'b0;
                    timer <= 0;
                end else begin
                    if(insert_ready)
                        timer <= timer+1;
                    insert_ip <= 32'b0;
                    insert_mac <= 48'b0;
                    insert_port <= 16'b0;
                    insert_valid <= 1'b0;
                end
            end
            STATE_INSERT_INSERT:begin
                {insert_ip,insert_mac,insert_port} <= arp_table_data[insert_current];
                insert_current <= insert_current == count_table-1? 0:insert_current + 1;
                insert_valid <= 1'b1;
                state_insert <= STATE_INSERT_IDLE;
            end
        endcase
    end
end

localparam[1:0]
    STATE_LOOKUP_IDLE = 0,
    STATE_LOOKUP_LOOKUP = 1;

logic[1:0] state_lookup;
integer lookup_current;

always @(posedge clk_125M) begin
    if(rst) begin
        state_lookup <= STATE_LOOKUP_IDLE;
        lookup_current <= 0;
        lookup_ip <= 32'b0;
        lookup_valid <= 1'b0;
    end else begin
        case(state_lookup)
            STATE_LOOKUP_IDLE:begin
                if(lookup_ready)begin
                    state_lookup <= STATE_LOOKUP_LOOKUP;
                    lookup_ip <= ip_data[lookup_current];
                    lookup_current <= (lookup_current == count_ip-1)?0:lookup_current+1;
                    lookup_valid <= 1'b1;
                end else begin
                    lookup_ip <= 32'b0;
                    lookup_valid <= 1'b0;
                end
            end
            STATE_LOOKUP_LOOKUP:begin
                lookup_valid <= 1'b0;
                if(lookup_mac_valid)begin
                    state_lookup <= STATE_LOOKUP_IDLE;
                    if(lookup_mac_not_found)
                        $display("%08h not found",lookup_ip);
                    else
                        $display("%08h %12h %4h",lookup_ip,lookup_mac,lookup_port);
                end
            end
        endcase
    end
end
endmodule
