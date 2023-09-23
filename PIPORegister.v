module PIPORegister #(parameter N=4) (
  input clk,
  input reset,
  input [N-1:0] parallel_in,
  output [N-1:0] parallel_out
);
  reg [N-1:0] shift_register;
  always @(posedge clk or posedge reset) begin
    if (reset)
      shift_register <= 0;
    else
      shift_register <= parallel_in;
  end
  assign parallel_out = shift_register;
endmodule