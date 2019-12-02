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
	output reg sram_sum
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
	end else begin
		addr_o <= `zero_word;
		sram_ce <= 1'b0;
		flash_ce <= 1'b0;
		rom_ce <= 1'b0;
		serial_ce <= 1'b0;
		vga_ce <= 1'b0;
		sram_sum <= 1'b0;
		if(addr_i >= 32'h80000000 && addr_i <= 32'h9fffffff)begin
			addr_o <= {1'b0, addr_i[30:0]};
			sram_ce <= 1'b1;
			sram_sum <= 1'b1;
		end else if(addr_i >= 32'ha0000000 && addr_i <= 32'hbfffffff)begin
			addr_o <= {3'b0, addr_i[28:0]};
			if (addr_i >= 32'hba000000 && addr_i <= 32'hba080000) vga_ce <= 1'b1;
            else if (addr_i >= 32'hbe000000 && addr_i <= 32'hbeffffff) flash_ce <= 1'b1;
            else if (addr_i >= 32'hbfc00000 && addr_i <= 32'hbfc00fff) rom_ce <= 1'b1;
            else if (addr_i >= 32'hbfd003f8 && addr_i <= 32'hbfd003fc)begin
                serial_ce <= 1'b1;
                sram_sum <= 1'b1;
            end
            else if (addr_i == 32'hbfd0f010)begin
                serial_ce <= 1'b1;
                sram_sum <= 1'b1;
            end
		end
	end
end

endmodule