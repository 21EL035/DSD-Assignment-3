module PRBSsequence (
  input clk,
  input reset,
  output prbs_out
);
  reg [3:0] shift_register;
  always @(posedge clk or posedge reset) begin
    if (reset)
      shift_register <= 4'b0001;
    else
      shift_register <= {shift_register[2:0], shift_register[3] ^ shift_register[0]};
  end
  assign prbs_out = shift_register;
endmodule