module FSMSequenceDetector_TB;
  reg clk;
  reg reset;
  reg data_in;
  wire sequence_detected;
  moore_sequence_detector uut (.clk(clk),.reset(reset),.data_in(data_in),.sequence_detected(sequence_detected));
  always begin
    #5 clk = ~clk;
  end
  initial begin
    $display("Moore Sequence Detector Testbench");
    clk = 0;
    reset = 1;
    data_in = 0;
    #10 reset = 0;
    data_in = 1;
    #10 data_in = 0;
    #10 data_in = 1;
    #10 data_in = 0;
    #10 $display("Input Sequence: 1010, Sequence Detected: %b", sequence_detected);
    data_in = 1;
    #10 data_in = 1;
    #10 data_in = 1;
    #10 data_in = 0;
    #10 $display("Input Sequence: 1110, Sequence Detected: %b", sequence_detected);
    data_in = 1;
    #10 data_in = 0;
    #10 data_in = 0;
    #10 data_in = 1;
    #10 data_in = 0;
    #10 data_in = 0;
    #10 data_in = 1;
    #10 data_in = 0;
    #10 $display("Input Sequence: 10010010, Sequence Detected: %b", sequence_detected);
    $finish;
  end
endmodule
