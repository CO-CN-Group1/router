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
logic [7:0] port;
logic lookup_ready;
logic nexthop_valid;
logic nexthop_not_found;

logic[15:0] os_addr;
logic[63:0] os_din;
logic[63:0] os_dout;
logic[7:0] os_wea;
logic os_rst;

logic[12:0] os_port_addr;
logic[31:0] os_port_din;
logic[31:0] os_port_dout;
logic[3:0] os_port_wea;


routing_table routing_table0(
    .clk(clk_125M),
    .rst(rst),
    .dest_ip(dest_ip),
    .dest_ip_valid(dest_ip_valid),
    .nexthop(nexthop),
    .lookup_ready(lookup_ready),
    .nexthop_valid(nexthop_valid),
    .nexthop_not_found(nexthop_not_found),
    .port(port),

    .os_clk(clk_50M),
    .os_addr(os_addr),
    .os_din(os_din),
    .os_dout(os_dout),
    .os_we(os_wea),
    .os_rst(os_rst),
    .os_en(1'b1),
    
    .os_port_addr(os_port_addr),
    .os_port_din(os_port_din),
    .os_port_dout(os_port_dout),
    .os_port_we(os_port_wea),
    .os_port_en(1'b1)
);



/*
  测试思路：有两个版本的路由表，每100ns替换一次路由表
  模拟路由器在路由表空闲时持续对路由表进行查询操作
*/

logic[63:0] trie1[0:256],trie2[0:256];
logic[31:0] ports1[0:31],ports2[0:31];
logic[15:0] total1=1,total2=1;
integer route_table_fd,route_sample_in_fd,route_sample_out_fd,count_ip=0;
logic[31:0] ip = 0,mask = 0,dip = 0;
logic[7:0] tmp_port;
logic[31:0] tmp_port2;
logic[15:0] current;
logic[31:0] ip_data[0:20];

logic cpu_init = 0;
logic router_init = 0;

initial begin
    trie1[0] = 64'h0000000000000001;
    trie1[1] = 64'b0;
    ports1[0] = 32'b0;
    route_table_fd = $fopen("route_table_file1.mem","r");
    for(integer i=0;i<=32;i++)begin
        ports1[i] = 0;
        ports2[i] = 0;
    end
    while(!$feof(route_table_fd))begin
        $fscanf(route_table_fd,"%26h",{ip,mask,dip,tmp_port});
        $display("table1 ip:%8h mask:%8h nexthop:%8h port:%2h",ip,mask,dip,tmp_port);
        current = 1;
        for(integer pos = 31;pos>=0;pos--)begin
            if(mask[pos]==1)begin
                if(ip[pos]==0)begin
                    if(trie1[current][47:32] == 0)begin
                        total1 ++ ;
                        trie1[total1] = 0;   
                        trie1[current][47:32] = total1;
                        current = total1;
                    end else begin
                        current = trie1[current][47:32];
                    end
                end else begin
                    if(trie1[current][63:48] == 0)begin
                        total1 ++ ;
                        trie1[total1] = 0;
                        trie1[current][63:48] = total1;
                        current = total1;
                    end else begin
                        current = trie1[current][63:48];
                    end
                end
            end else begin
                break;
            end
        end
        trie1[current][31:0] = dip;
        tmp_port2 = {30'b0,tmp_port[1:0]};
        tmp_port2 = tmp_port2 << {current[3:0],1'b0}; 
        $display("%8h (%4h): %8h\n",dip,current,tmp_port2);
        ports1[current >> 4] = ports1[current >> 4] | tmp_port2;
    end    
    $display("table1 total = %d",total1);
    $fclose(route_table_fd);
    trie2[0] = 64'h0000000000000002;
    trie2[1] = 64'b0;
    ports2[0] = 32'b0;
    route_table_fd = $fopen("route_table_file2.mem","r");
    while(!$feof(route_table_fd))begin
        $fscanf(route_table_fd,"%26h",{ip,mask,dip,tmp_port});
        $display("table2 ip:%8h mask:%8h nexthop:%8h port:%2h",ip,mask,dip,tmp_port);
        current = 1;
        for(integer pos = 31;pos>=0;pos--)begin
            if(mask[pos]==1)begin
                if(ip[pos]==0)begin
                    if(trie2[current][47:32] == 0)begin
                        total2 ++ ;
                        trie2[total2] = 0;
                        trie2[current][47:32] = total2;
                        current = total2;
                    end else begin
                        current = trie2[current][47:32];
                    end
                end else begin
                    if(trie2[current][63:48] == 0)begin
                        total2 ++ ;
                        trie2[total2] = 0;
                        trie2[current][63:48] = total2;
                        current = total2;
                    end else begin
                        current = trie2[current][63:48];
                    end
                end
            end else begin
                break;
            end
        end
        trie2[current][31:0] = dip;
        tmp_port2 = {30'b0,tmp_port[1:0]}; 
        tmp_port2 = tmp_port2 << {current[3:0],1'b0};
        ports2[current >> 4] = ports2[current >> 4] | tmp_port2;
    end    
    $display("table1 total = %d",total2);
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
    os_rst = 1;
    #10 rst = 0;
    os_rst = 0;
    #10 cpu_init = 1;
    #10 router_init = 1;
end

localparam[1:0]
    CPU_STATE_IDLE1 = 0,
    CPU_STATE_WRITE1 = 1,
    CPU_STATE_IDLE2 = 2,
    CPU_STATE_WRITE2 = 3;

logic[1:0] cpu_state = CPU_STATE_IDLE1;
integer timer;
integer cpu_cnt;
always @(posedge clk_50M)begin
    if(cpu_init == 1'b0) begin
        cpu_state = CPU_STATE_IDLE1;
        timer = 0;
    end else begin
        case(cpu_state)
            CPU_STATE_IDLE1:begin
                os_addr <= 0;
                os_port_addr <= 0;
                os_din <= 0;
                os_port_din <= 0;
                os_wea <= 0;
                os_port_wea <= 0;
                if(timer>=43) begin
                    cpu_state <= CPU_STATE_WRITE1;
                    cpu_cnt <= 0;
                    timer <= 0;
                end else 
                    timer <= timer + 1;
            end
            CPU_STATE_IDLE2:begin
                os_addr <= 0;
                os_port_addr <= 0;
                os_din <= 0;
                os_port_din <= 0;
                os_wea <= 0;
                os_port_wea <= 0;
                if(timer>=35) begin
                    cpu_state <= CPU_STATE_WRITE2;
                    cpu_cnt <= 0;
                    timer <= 0;
                end else 
                    timer <= timer + 1;
            end
            CPU_STATE_WRITE1:begin
                if(cpu_cnt <= total1)begin
                    os_addr <= cpu_cnt;
                    os_port_addr <= cpu_cnt>>4;
                    os_din <= trie1[cpu_cnt];
                    os_port_din <= ports1[cpu_cnt>>4];
                    os_wea <= 8'b11111111;
                    os_port_wea <= 4'b1111;
                    cpu_cnt <= cpu_cnt+1;
                end else begin
                    os_wea <= 8'b11111111;
                    os_port_wea <= 4'b0000;
                    os_port_din <= 0;
                    os_port_addr <= 0;
                    os_din <= 0;
                    os_addr <= 0;
                    cpu_cnt <= 0;
                    cpu_state <= CPU_STATE_IDLE2;
                end
            end
            CPU_STATE_WRITE2:begin
                if(cpu_cnt <= total2)begin
                    os_addr <= cpu_cnt;
                    os_port_addr <= cpu_cnt>>4;
                    os_din <= trie2[cpu_cnt];
                    os_port_din <= ports2[cpu_cnt>>4];
                    os_wea <= 8'b11111111;
                    os_port_wea <= 4'b1111;
                    cpu_cnt <= cpu_cnt+1;
                end else begin
                    os_wea <= 8'b11111111;
                    os_port_wea <= 4'b0000;
                    os_port_din <= 0;
                    os_port_addr <= 0;
                    os_din <= 0;
                    os_addr <= 0;
                    cpu_cnt <= 0;
                    cpu_state <= CPU_STATE_IDLE1;
                end
            end
        endcase
    end
end 

localparam[1:0]
    ROUTER_STATE_IDLE = 0,
    ROUTER_STATE_SEARCH = 1;

logic[1:0] router_state = ROUTER_STATE_IDLE;
integer router_cnt;

always @(posedge clk_125M)begin
    if(router_init == 1'b0)begin
        router_state <= ROUTER_STATE_IDLE;
        router_cnt <= 0;
    end else begin
        case(router_state)
            ROUTER_STATE_IDLE:begin
                if(lookup_ready)begin
                    dest_ip <= ip_data[router_cnt];
                    dest_ip_valid <= 1;
                    router_state <= ROUTER_STATE_SEARCH;
                    if(router_cnt == count_ip-1)
                        router_cnt <= 0; 
                    else
                        router_cnt <= router_cnt + 1;
                end else begin
                    dest_ip_valid <= 0;
                    dest_ip <= 0;
                end
            end
            ROUTER_STATE_SEARCH:begin
                if(nexthop_valid)begin
                    $display("%08h",dest_ip);
                    if(nexthop_not_found)begin
                        $display("not found\n");
                    end else begin
                        $display("%8h %2h\n",nexthop,port);
                    end
                    router_state <= ROUTER_STATE_IDLE;
                    dest_ip_valid <= 0;
                    dest_ip <= 0;
                end 
            end
        endcase
    end
end



/*
  测试思路：正确性测试，先读路由表，再查询
*/
/*logic init = 0;
integer route_table_fd,count_table = 0,route_sample_in_fd,route_sample_out_fd,count_ip = 0;
logic[63:0] trie[0:256];
logic[31:0] ip_data[0:20];
logic[15:0] current;
logic[15:0] total=1;
logic[31:0] ip = 0,mask = 0,dip = 0;

initial begin
    trie[0] = 64'b0;//因为是严格先写后查，不需要锁住
    trie[1] = 64'b0;
    route_table_fd = $fopen("route_table_file.mem","r");
    while(!$feof(route_table_fd))begin
        $fscanf(route_table_fd,"%24h",{ip,mask,dip});
        $display("ip :%8h mask:%8h nexthop: %8h",ip,mask,dip);
        current = 1;
        for(integer pos = 31;pos>=0;pos--)begin
            if(mask[pos]==1)begin
                if(ip[pos]==0)begin
                    if(trie[current][47:32] == 0)begin
                        total ++ ;
                        trie[total] = 0;
                        trie[current][47:32] = total;
                        current = total;
                    end else begin
                        current = trie[current][47:32];
                    end
                end else begin
                    if(trie[current][63:48] == 0)begin
                        total ++ ;
                        trie[total] = 0;
                        trie[current][63:48] = total;
                        current = total;
                    end else begin
                        current = trie[current][63:48];
                    end
                end
            end else begin
                break;
            end
        end
        trie[current][31:0] = dip;
        $display("total = %d",total);
    end
    //$display("trie[1]: %d,%d %8h",trie[1][32+11+11-1:32+11],trie[1][32+11-1:32],trie[1][31:0]);
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
    os_rst = 1;
    #10 rst = 0;
    os_rst = 0;
    #10 init = 1;
end

logic [1:0] state = 0;
logic [15:0] cnt = 0;
logic [15:0] cnt2 = 0;


always @(posedge clk_50M) begin
    if(init)begin
        if(state==0)begin
            os_wea = 0;
            if(cnt <= total)begin
                os_addr = cnt;
                os_din = trie[cnt];
                os_wea = 8'b11111111;
                cnt++;
            end else begin
                state = 1;
                cnt = 0;
            end
        end else begin
            os_wea = 0;
            $display("pos : %04h, data : %16h",cnt2,os_dout);
            os_addr = cnt2;
            cnt2 ++;
        end 
    end
end


always @(posedge clk_125M) begin
    if(init)begin
        if(state == 1)begin
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
end*/

endmodule
