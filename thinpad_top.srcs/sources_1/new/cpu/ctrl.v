module ctrl(
    input wire rst,
    input wire stop_from_id,
    input wire stop_from_ex,
    output reg[0:5] stop
);

always @(*)begin
    if(rst)begin
        stop <= 0;
    end else if(stop_from_ex)begin
        stop <= 6'b111100;
    end else if(stop_from_id)begin
        stop <= 6'b111000;
    end else begin
        stop <= 0;
    end
end
endmodule