module PositiveEdgeDetecto_TB;
  reg clk;
  reg reset;
  wire pos_edge_detected;
  positive_edge_detector uut (
    .clk(clk),
    .reset(reset),
    .pos_edge_detected(pos_edge_detected)
  );
  always begin
    #5 clk = ~clk;
  end
  initial begin
    $display("Positive Edge Detector Testbench");
    clk = 0;
    reset = 1;
    #10 reset = 0;
    #5 clk = 1;
    #5 clk = 0;
    #5 clk = 1;
    #5 clk = 0;
    $display("Positive Edge Detected: %b", pos_edge_detected);
    $finish;
  end
endmodule
