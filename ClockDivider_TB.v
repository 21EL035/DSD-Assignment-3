module ClockDivider_TB;
reg clk_in;
wire clk_out;
ClockDivider uut(
 .clk_in(clk_in),
 .clk_out(clk_out)
 );
 initial begin
 clk_in=0;
    forever #10 clk_in=~clk_in;
    end
endmodule