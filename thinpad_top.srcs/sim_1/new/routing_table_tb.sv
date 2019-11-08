`timescale 1ns / 1ps
module routing_table_tb;

wire clk_50M, clk_11M0592, clk_125M, clk_125M_90deg;
logic rst = 0;

clock osc(
    .clk_11M0592   (clk_11M0592),
    .clk_50M       (clk_50M),
    .clk_125M      (clk_125M),
    .clk_125M_90deg(clk_125M_90deg)
);

logic[31:0] dest_ip;
logic dest_ip_valid;
logic[31:0] nexthop;
logic lookup_ready;
logic nexthop_valid;
logic nexthop_not_found;

logic[10:0] os_addr;
logic[53:0] os_din;
logic[53:0] os_dout;
logic os_wea;
logic os_rst;

routing_table routing_table_inst(
    .clk(clk_50M),
    .rst(rst),
    .dest_ip(dest_ip),
    .dest_ip_valid(dest_ip_valid),
    .nexthop(nexthop),
    .lookup_ready(lookup_ready),
    .nexthop_valid(nexthop_valid),
    .nexthop_not_found(nexthop_not_found),
    .os_clk(clk_50M),
    .os_addr(os_addr),
    .os_din(os_din),
    .os_dout(os_dout),
    .os_wea(os_wea),
    .os_rst(rst),
    .os_en(1'b1)
);

logic init = 0;
integer route_table_fd,count_table = 0,route_sample_in_fd,route_sample_out_fd,count_ip = 0;
logic[32+11+11-1:0] trie[0:256];
logic[31:0] ip_data[0:20];
logic[10:0] current;
logic[10:0] total=1;
logic[31:0] ip = 0,mask = 0,dip = 0;

initial begin
    trie[0] = 54'b0;
    trie[1] = 54'b0;
    route_table_fd = $fopen("route_table_file.mem","r");
    while(!$feof(route_table_fd))begin
        $fscanf(route_table_fd,"%24h",{ip,mask,dip});
        $display("ip :%8h mask:%8h nexthop: %8h",ip,mask,dip);
        current = 1;
        for(integer pos = 31;pos>=0;pos--)begin
            if(mask[pos]==1)begin
                if(ip[pos]==0)begin
                    if(trie[current][32+11+11-1:32+11] == 0)begin
                        total ++ ;
                        trie[total] = 0;
                        trie[current][32+11+11-1:32+11] = total;
                        current = total;
                    end else begin
                        current = trie[current][32+11+11-1:32+11];
                    end
                end else begin
                    if(trie[current][32+11-1:32] == 0)begin
                        total ++ ;
                        trie[total] = 0;
                        trie[current][32+11-1:32] = total;
                        current = total;
                    end else begin
                        current = trie[current][32+11-1:32];
                    end
                end
            end else begin
                break;
            end
        end
        trie[current][31:0] = dip;
        $display("total = %d",total);
    end
    $display("trie[1]: %d,%d %8h",trie[1][32+11+11-1:32+11],trie[1][32+11-1:32],trie[1][31:0]);
    $fclose(route_table_fd);
    route_sample_in_fd = $fopen("route_sample_in.mem","r");
    while(!$feof(route_sample_in_fd))begin 
        $fscanf(route_sample_in_fd,"%08h",ip_data[count_ip]);
        $display("ip: %08h",ip_data[count_ip]);
        count_ip +=1;
    end;
    $fclose(route_sample_in_fd);
    route_sample_out_fd = $fopen("route_sample_out.mem","w");
    rst = 1;
    #100 rst = 0;
    #10 init = 1;
end

logic [1:0] state = 0;
logic [10:0] cnt = 0;
always @(posedge clk_50M) begin
    if(init)begin
        if(state==0)begin
            os_wea = 0;
            if(cnt <= total)begin
                os_addr = cnt;
                os_din = trie[cnt];
                os_wea = 1;
                cnt++;
            end else begin
                state = 1;
                cnt = 0;
            end
        end else if(state == 1)begin
            if(nexthop_valid)begin
                $fwrite(route_sample_out_fd,"%08h ",dest_ip);
                if(nexthop_not_found)begin
                    $fwrite(route_sample_out_fd,"not found\n");
                end else begin
                    $fwrite(route_sample_out_fd,"%8h\n",nexthop);
                end
            end else if(lookup_ready && !dest_ip_valid)begin
                dest_ip = ip_data[cnt];
                dest_ip_valid = 1;
                if(cnt == count_ip-1)begin
                    state = 2;
                end else 
                    cnt = cnt + 1;     
            end else begin
                dest_ip_valid = 0;
            end
        end else begin
            if(nexthop_valid)begin
                $fwrite(route_sample_out_fd,"%08h ",dest_ip);
                if(nexthop_not_found)begin
                    $fwrite(route_sample_out_fd,"not found\n");
                end else begin
                    $fwrite(route_sample_out_fd,"%8h\n",nexthop);
                end
                $fclose(route_sample_out_fd);
            end
            dest_ip_valid = 0;
        end
    end   
end

endmodule
