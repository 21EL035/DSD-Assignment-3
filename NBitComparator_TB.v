module testbench;
  parameter N = 4;
  reg [N-1:0] A;
  reg [N-1:0] B;
  wire eq;
  wire lt;
  wire gt;
  n_bit_comparator #(N) uut (
    .A(A),
    .B(B),
    .eq(eq),
    .lt(lt),
    .gt(gt)
  );
initial
begin
        $display("N-Bit Comparator Testbench");
    A = 4'b0010;
    B = 4'b0010;
        #10 $display("A = %b, B = %b, EQ = %b, LT = %b, GT = %b", A, B, eq, lt, gt);
    A = 4'b1100;
    B = 4'b1010;
        #10 $display("A = %b, B = %b, EQ = %b, LT = %b, GT = %b", A, B, eq, lt, gt);
    A = 4'b0101;
    B = 4'b0110;
        #10 $display("A = %b, B = %b, EQ = %b, LT = %b, GT = %b", A, B, eq, lt, gt);
    $finish;
end
endmodule