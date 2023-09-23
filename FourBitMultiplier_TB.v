module FourBitMultiplier_TB;
  reg [3:0] A;
  reg [3:0] B;
  wire [7:0] product;
  four_bit_multiplier uut (
    .A(A),
    .B(B),
    .product(product)
  );
  initial begin
    $display("4-Bit Multiplier Testbench");
    A = 4'b0111;
    B = 4'b0101;
        #10 $display("A = %b, B = %b, Product = %b", A, B, product);
    A = 4'b0011;
    B = 4'b1000;
        #10 $display("A = %b, B = %b, Product = %b", A, B, product);
    $finish;
  end
endmodule