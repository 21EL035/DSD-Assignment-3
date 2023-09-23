module SISOShiftRegister #(parameter N=4) (
  input clk,
  input reset,
  input serial_in,
  output [N-1:0] serial_out
);
  reg [N-1:0] shift_register;
  always @(posedge clk or posedge reset) begin
    if (reset)
      shift_register <= 0;
    else
      shift_register <= {serial_in, shift_register[N-1:1]};
  end
  assign serial_out = shift_register;
endmodule