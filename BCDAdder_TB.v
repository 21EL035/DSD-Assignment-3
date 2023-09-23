module BCDAdder_TB;
  reg [3:0] A;
  reg [3:0] B;
  wire [3:0] sum;
  wire carry_out;
  bcd_adder uut (
    .A(A),
    .B(B),
    .sum(sum),
    .carry_out(carry_out)
  );
  initial begin
    $display("BCD Adder Testbench");
    A = 4'b0101;
    B = 4'b0011;
    #10;
        $display("A = %d, B = %d, Sum = %d, Carry Out = %b", A, B, sum, carry_out);
    A = 4'b1001;
    B = 4'b1001;
    #10;
        $display("A = %d, B = %d, Sum = %d, Carry Out = %b", A, B, sum, carry_out);
    $finish;
  end
endmodule