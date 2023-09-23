module PISORegister_TB;
  parameter N = 4;
  parameter CLK_PERIOD = 10; 
  reg clk;
  reg reset;
  integer parallel_in;
  wire serial_out;
  piso_shift_register #(N) uut (
    .clk(clk),
    .reset(reset),
    .parallel_in(parallel_in),
    .serial_out(serial_out)
  );
  always begin
    #(CLK_PERIOD / 2 )clk = ~clk;
  end
  initial begin
    $display("PISO Shift Register Testbench");
    clk = 0;
    reset = 1;
    parallel_in = 4'b0000;
    #CLK_PERIOD reset = 0;
    parallel_in = 4'b1010;
    #CLK_PERIOD parallel_in = 4'b0101;
    reset = 1;
    #CLK_PERIOD reset = 0;
    $display("Serial Out: %b", serial_out);
    $finish;
  end
endmodule