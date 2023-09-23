module PositiveEdgeDetector (
  input clk,
  input nreset,din,
  output dout,
    reg d_ff
);
  always @(posedge clk or negedge nreset) begin
    if (!nreset)
      d_ff <= 1'b0;
    else
      d_ff <= din;
  end
endmodule

module d_ff(D,C,a);
    input D,C;
    output a;
    reg a;
    always@(posedge C)
    begin
     a<=D;
    end
endmodule