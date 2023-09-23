module FourBitMultiplier (
  input [3:0] A,
  input [3:0] B,
  output [7:0] product
);
    wire [7:0] temp_product;
  assign temp_product = {4'b0, A} * {4'b0, B};
  assign product = temp_product[7:0];

endmodule
