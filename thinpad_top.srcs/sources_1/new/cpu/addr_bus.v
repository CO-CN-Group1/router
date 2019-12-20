`include "defines.v"

module addr_bus(
	input wire clk,
	input wire rst,
	input wire[31:0] addr_i,
	output reg sram_ce,
	output reg flash_ce,
	output reg rom_ce,
	output reg serial_ce,
	output reg vga_ce,
	output reg[31:0] addr_o,
	output reg sram_sum,
	output reg sender_mem_ce,
	output reg receiver_mem_ce,
	output reg router_table_ce,
	output reg router_port_ce
);

always@(*)begin
	if(rst == 1'b1)begin
		addr_o <= `zero_word;
		sram_ce <= 1'b0;
		flash_ce <= 1'b0;
		rom_ce <= 1'b0;
		serial_ce <= 1'b0;
		vga_ce <= 1'b0;
		sram_sum <= 1'b0;
		sender_mem_ce <= 1'b0;
		receiver_mem_ce <= 1'b0;
		router_table_ce <= 1'b0;
		router_port_ce <= 1'b0;
	end else begin
		addr_o <= `zero_word;
		sram_ce <= 1'b0;
		flash_ce <= 1'b0;
		rom_ce <= 1'b0;
		serial_ce <= 1'b0;
		vga_ce <= 1'b0;
		sram_sum <= 1'b0;
		sender_mem_ce <= 1'b0;
		receiver_mem_ce <= 1'b0;
		router_table_ce <= 1'b0;
		router_port_ce <= 1'b0;
		if(addr_i >= 32'h80000000 && addr_i <= 32'h9fffffff)begin
			addr_o <= {1'b0, addr_i[30:0]};
			sram_ce <= 1'b1;
			sram_sum <= 1'b1;
		end else if(addr_i >= 32'ha0000000 && addr_i <= 32'hbfffffff)begin
			addr_o <= {3'b0, addr_i[28:0]};
			if (addr_i >= 32'hba000000 && addr_i <= 32'hba080000) vga_ce <= 1'b1;
			else if (addr_i >= 32'hbb000000 && addr_i <= 32'hbb0001ff) receiver_mem_ce <= 1'b1;
			else if (addr_i >= 32'hbc000000 && addr_i <= 32'hbc0001ff) sender_mem_ce <= 1'b1;
			else if (addr_i >= 32'hbd000000 && addr_i <= 32'hbd07ffff) router_table_ce <= 1'b1;
            else if (addr_i >= 32'hbe000000 && addr_i <= 32'hbeffffff) flash_ce <= 1'b1;
			else if (addr_i >= 32'hbf000000 && addr_i <= 32'hbf00ffff) router_port_ce <= 1'b1;
            else if (addr_i >= 32'hbfc00000 && addr_i <= 32'hbfc00fff) rom_ce <= 1'b1;
            else if (addr_i >= 32'hbfd003f8 && addr_i <= 32'hbfd003fc)begin
                serial_ce <= 1'b1;
                sram_sum <= 1'b1;
            end else if (addr_i == 32'hbfd0f010)begin
                serial_ce <= 1'b1;
                sram_sum <= 1'b1;
            end
		end
	end
end

endmodule