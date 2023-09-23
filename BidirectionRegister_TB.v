module BidirectionRegister_TB;
  parameter N = 8;
  parameter CLK_PERIOD = 10; 
  reg clk;
  reg reset;
  reg shift_left;
  reg shift_right;
  integer parallel_in;
  wire [N-1:0] parallel_out;
  bidirectional_shift_register #(N) uut (
    .clk(clk),
    .reset(reset),
    .shift_left(shift_left),
    .shift_right(shift_right),
    .parallel_in(parallel_in),
    .parallel_out(parallel_out)
  );
  always begin
    #(CLK_PERIOD / 2 )clk = ~clk;  end
 initial begin
    $display("Bidirectional Shift Register Testbench");
    clk = 0;
    reset = 1;
    shift_left = 0;
    shift_right = 0;
    parallel_in = 8'b00000000;
    #CLK_PERIOD reset = 0;
    parallel_in = 8'b10101010;
    shift_left = 1;
    #CLK_PERIOD shift_left = 0;
    shift_right = 1;
    #CLK_PERIOD shift_right = 0;
    shift_right = 1;
    #CLK_PERIOD shift_right = 0;
    parallel_in = 8'b11001100;
    shift_left = 1;
    #CLK_PERIOD shift_left = 0;
    $display("Parallel Out: %b", parallel_out);
    $finish;
  end
endmodule