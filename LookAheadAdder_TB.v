module LookAheadAdder_TB;
    reg [3:0] A;
    reg [3:0] B;
    wire [3:0] Sum;
    wire Cout;
 CarryLookaheadAdder UUT (.A(A),.B(B),.Sum(Sum),.Cout(Cout));
initial begin
        $display("Testing 4-Bit Carry Lookahead Adder");
        A = 4'b0000;
        B = 4'b0000;
            #10 $display("A = %b, B = %b, Sum = %b, Cout = %b", A, B, Sum, Cout);
        A = 4'b1101;
        B = 4'b1010;
            #10 $display("A = %b, B = %b, Sum = %b, Cout = %b", A, B, Sum, Cout);
        A = 4'b1111;
        B = 4'b0001;
            #10 $display("A = %b, B = %b, Sum = %b, Cout = %b", A, B, Sum, Cout);
        A = 4'b1000;
        B = 4'b1000;
            #10 $display("A = %b, B = %b, Sum = %b, Cout = %b", A, B, Sum, Cout);
        $finish;
    end
endmodule