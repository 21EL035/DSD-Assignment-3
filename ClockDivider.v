module ClockDivider (
    input clk, rst,
    output reg clk_div
    );

always @ (posedge(clk), posedge(rst))
begin
    if (rst) clk_div <= 0;
    else clk_div <= !clk_div;
end
endmodule
