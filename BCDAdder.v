module BCDAdder (
  input [3:0] A,
  input [3:0] B,
  output [3:0] sum,
  output carry_out
);
  integer sum;
  wire [3:0] sum_internal;
  wire carry_out_internal;
  assign {carry_out_internal, sum_internal} = A + B;
  assign carry_out = (sum_internal > 9);
  always @(sum_internal) begin
    if (carry_out_internal)
      sum = sum_internal + 6;
    else
      sum = sum_internal;
  end
endmodule