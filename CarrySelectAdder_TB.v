module CarrySelectAdder_TB;
  reg [3:0] A;
  reg [3:0] B;
  reg carry_in;
  wire [3:0] sum;
  wire carry_out;
 carry_select_adder_4bit uut (
    .A(A),
    .B(B),
    .carry_in(carry_in),
    .sum(sum),
    .carry_out(carry_out)
  );
  initial begin
    $display("4-Bit Carry-Select Adder Testbench");
    A = 4'b0111;
    B = 4'b0011;
    carry_in = 1'b0;
    #10;
        $display("A = %d, B = %d, Sum = %d, Carry Out = %b", A, B, sum, carry_out);
    A = 4'b1010;
    B = 4'b0110;
    carry_in = 1'b1;
	#10;
        $display("A = %d, B = %d, Sum = %d, Carry Out = %b", A, B, sum, carry_out);
    $finish;
  end
endmodule