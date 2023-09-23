module bidirectional_shift_register #(parameter N=8) (
  input clk,
  input reset,
  input shift_left,
  input shift_right,
  input [N-1:0] parallel_in,
  output [N-1:0] parallel_out
);
  reg [N-1:0] shift_register;
  reg [N-1:0] temp;
  always @(posedge clk or posedge reset) begin
    if (reset)
      shift_register <= 0;
    else if (shift_left)
      shift_register <= {shift_register[N-2:0], 1'b0};
    else if (shift_right)
      shift_register <= {1'b0, shift_register[N-1:1]};
    else
      shift_register <= parallel_in;
  end
  assign parallel_out = shift_register;
endmodule
