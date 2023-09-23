module FixedPointDivision_TB;
  reg clk;
  reg reset;
  reg [15:0] dividend;
  reg [7:0] divisor;
  wire [15:0] quotient;
  fixed_point_division uut (
    .dividend(dividend),
    .divisor(divisor),
    .quotient(quotient)
  );
  always begin
    #10 clk = ~clk;
  end
  initial begin
    $display("Fixed-Point Division Testbench");
    clk = 0;
    reset = 0;
    dividend = 16'b0101100010000000; 
    divisor = 8'b00000100;           
    reset = 1;
    #20 reset = 0;
    dividend = 16'b0101100010000000; 
    divisor = 8'b00000100;           
    #20;
    $display("Dividend: %d, Divisor: %d", dividend, divisor);
    $display("Quotient: %d.%02d", quotient[15:8], quotient[7:0]);
    $finish;
  end
endmodule