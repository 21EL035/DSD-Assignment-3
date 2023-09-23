module PISORegister #(parameter N=4) (
  input clk,
  input reset,
  input [N-1:0] parallel_in,
  output serial_out
);
  reg [N-1:0] shift_register;
  reg [N-1:0] temp;
  always @(posedge clk or posedge reset) begin
    if (reset)
      shift_register <= 0;
    else
      shift_register <= parallel_in;
  end
  always @(posedge clk or posedge reset) begin
    if (reset)
      temp <= 0;
    else
      temp <= {shift_register[N-2:0], temp[N-1]};
  end
  assign serial_out = temp[0];
endmodule