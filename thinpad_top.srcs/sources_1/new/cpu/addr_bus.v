module addr_bus(
	input wire clk,
	input wire rst,
	input wire[31:0] addr_i,
	output reg sram_ce,
	output reg serial_ce,
	output reg[31:0] addr_o
);

always@(*)begin
	if(rst)begin
		addr_o <= 0;
		sram_ce <= 1'b0;
		serial_ce <= 1'b0;
	end else begin
		addr_o <= 0;
		sram_ce <= 1'b0;
		serial_ce <= 1'b0;
		if(addr_i >= 32'h80000000 && addr_i <= 32'h9fffffff)begin
			addr_o <= {1'b0, addr_i[30:0]};
			sram_ce <= 1'b1;
		end else if(addr_i >= 32'ha0000000 && addr_i <= 32'hbfffffff)begin
			addr_o <= {3'b0, addr_i[28:0]};
            if (addr_i >= 32'hbfd003f8 && addr_i <= 32'hbfd003fc)begin
                serial_ce <= 1'b1;
            end
            else if (addr_i == 32'hbfd0f010)begin
                serial_ce <= 1'b1;
            end
		end
	end
end

endmodule