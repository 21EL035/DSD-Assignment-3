module EightbitAdderSubtractor_TB;
  reg [7:0] A;
  reg [7:0] B;
  reg subtract;
  wire [7:0] result;
  wire overflow;
  eight_bit_adder_subtractor uut (
    .A(A),
    .B(B),
    .subtract(subtract),
    .result(result),
    .overflow(overflow)
  );
  initial begin
    $display("8-Bit Adder/Subtractor Testbench");
    A = 8'b00001010;
    B = 8'b00000101;
    subtract = 1'b0;
        #10 $display("A = %b, B = %b, Subtract = %b, Result = %b, Overflow = %b", A, B, subtract, result, overflow);
    A = 8'b00000101;
    B = 8'b00001010;
    subtract = 1'b1;
        #10 $display("A = %b, B = %b, Subtract = %b, Result = %b, Overflow = %b", A, B, subtract, result, overflow);
    $finish;
  end
endmodule