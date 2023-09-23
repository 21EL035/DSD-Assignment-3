module eightBitSubtractor(
  input [7:0] A,
  input [7:0] B,
  input borrow_in,
  output [7:0] difference,
  output borrow_out
);
  wire [7:0] B_complement;
  assign B_complement = (~B) + 1;
  assign {borrow_out, difference} = A + B_complement + borrow_in;
endmodule
