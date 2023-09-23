 module NBitComparator #(parameter N=4) (
  input [N-1:0] A,
  input [N-1:0] B,
  output eq,
  output lt,
  output gt
);
  assign eq = (A == B);
  assign lt = (A < B);
  assign gt = (A > B);
endmodule