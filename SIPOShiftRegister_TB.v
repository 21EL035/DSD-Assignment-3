module SIPOShiftRegister_TB;
  parameter N = 4;
  parameter CLK_PERIOD = 10; 
  reg clk;
  reg reset;
  reg serial_in;
  wire [N-1:0] parallel_out;

  sipo_shift_register #(N) uut (
    .clk(clk),
    .reset(reset),
    .serial_in(serial_in),
    .parallel_out(parallel_out)
  );
  always begin
    #(CLK_PERIOD / 2) clk = ~clk;
  end
  initial begin
    $display("SIPO Shift Register Testbench");
    clk = 0;
    reset = 1;
    serial_in = 0;
    #CLK_PERIOD reset = 0;
    serial_in = 1;
    #CLK_PERIOD serial_in = 0;
    #CLK_PERIOD serial_in = 1;
    #CLK_PERIOD serial_in = 0;
    reset = 1;
    #CLK_PERIOD reset = 0;
    $display("Parallel Out: %b", parallel_out);
    $finish;
  end
endmodule