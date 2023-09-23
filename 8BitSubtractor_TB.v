module eightBitSubtractor_TB;
  reg [7:0] A;
  reg [7:0] B;
  reg borrow_in;
  wire [7:0] difference;
  wire borrow_out;
  eight_bit_subtractor uut (
    .A(A),
    .B(B),
    .borrow_in(borrow_in),
    .difference(difference),
    .borrow_out(borrow_out)
  );
  initial begin
    $display("8-Bit Subtractor Testbench");
    A = 8'b00001010;
    B = 8'b00000101;
    borrow_in = 1'b0;
    #10 $display("A = %b, B = %b, Borrow In = %b, Difference = %b, Borrow Out = %b", A, B, borrow_in, difference, borrow_out);
    A = 8'b00000101;
    B = 8'b00001010;
    borrow_in = 1'b1;
    #10 $display("A = %b, B = %b, Borrow In = %b, Difference = %b, Borrow Out = %b", A, B, borrow_in, difference, borrow_out);
    $finish;
  end
endmodule