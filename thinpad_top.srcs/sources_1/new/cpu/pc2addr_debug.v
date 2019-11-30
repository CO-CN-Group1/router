module pc2addr_debug(
    input wire[19:0] pc,
    output wire[19:0] addr
);

assign addr = {2'b00,pc[19:2]};

endmodule