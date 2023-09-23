module PRBSsequence_TB;
  parameter CLK_PERIOD = 10;
  reg clk;
  reg reset;
  wire [3:0] prbs_out;
  integer i;
  prbs_generator uut (
    .clk(clk),
    .reset(reset),
    .prbs_out(prbs_out)
  );
  always begin
    #(CLK_PERIOD / 2) clk = ~clk;
  end
  initial begin
    $display("PRBS Generator Testbench");
    clk = 0;
    reset = 1;
    #CLK_PERIOD reset = 0;
    $display("PRBS Output:");
    for ( i = 0; i < 16; i = i + 1) begin
      #CLK_PERIOD;
      $display("%b", prbs_out);
    end
    $finish;
  end
endmodule