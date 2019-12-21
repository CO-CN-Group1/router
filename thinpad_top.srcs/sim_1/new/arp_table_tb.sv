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
logic[31:0] ip_data[0:9];
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
    end else begin
        case(state_insert)
            STATE_INSERT_IDLE:begin
                if(timer == 5'b11111)begin
                    state_insert <= STATE_INSERT_INSERT;
                end else begin
                    timer <= timer+1;
                    insert_ip <= 32'b0;
                    insert_mac <= 48'b0;
                    insert_port <= 16'b0;
                    insert
                end
            end

        endcase
    end
end






logic[1:0] table_insert = 0;
integer current = 0;

always @(posedge clk_50M)begin
    if(init)begin
        if(table_insert==0)begin
            
            if(insert_ready&&!insert_valid)begin
                insert_valid = 1;
                {insert_ip,insert_mac,insert_port} = arp_table_data[current];
                if(current==count_table-1)begin
                    table_insert = 1;
                    current = 0;
                end else begin
                    current = current + 1;
                end
            end else begin
                lookup_valid = 0;
                insert_valid = 0;    
            end
        end else if(table_insert==1)begin
            
            if(lookup_mac_valid)begin
                $fwrite(arp_sample_out_fd,"%08h ",lookup_ip);
                if(lookup_mac_not_found)begin
                    $fwrite(arp_sample_out_fd,"not found\n");
                end else begin
                    $fwrite(arp_sample_out_fd,"%12h %04h\n",lookup_mac,lookup_port);
                end
            end else if(lookup_ready && !lookup_valid && !insert_valid)begin
                lookup_ip = ip_data[current];
                lookup_valid = 1;
                if(current == count_ip-1)begin 
                    table_insert = 2;
                    
                end else 
                    current = current + 1;
            end else begin
                insert_valid = 0;
                lookup_valid = 0;
            end
        end else begin
            if(lookup_mac_valid)begin
                $fwrite(arp_sample_out_fd,"%08h ",lookup_ip);
                if(lookup_mac_not_found)begin
                    $fwrite(arp_sample_out_fd,"not found\n");
                end else begin
                    $fwrite(arp_sample_out_fd,"%12h %04h\n",lookup_mac,lookup_port);
                end
                $fclose(arp_sample_out_fd);
            end
            insert_valid = 0;
            lookup_valid = 0;
        end
    end
end



endmodule
