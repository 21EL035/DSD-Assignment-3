module CarrySelectAdder (
  input [3:0] A,
  input [3:0] B,
  input carry_in,
  output carry_out,
  output [3:0]s);
  wire [3:0] temp0, temp1;
  wire [3:0]carry0, carry1;
    fulladder fa00(A[0],B[0],1'b0,temp0[0],carry0[0]);
    fulladder fa01(A[1],B[1],carry0[0],temp0[1],carry0[1]);
    fulladder fa02(A[2],B[2],carry0[1],temp0[2],carry0[2]);
    fulladder fa03(A[3],B[3],carry0[2],temp0[3],carry0[3]);
    
    fulladder fa10(A[0],B[0],1'b0,temp1[0],carry1[0]);
    fulladder fa11(A[1],B[1],carry1[0],temp1[1],carry1[1]);
    fulladder fa12(A[2],B[2],carry1[1],temp1[2],carry1[2]);
    fulladder fa13(A[3],B[3],carry1[2],temp1[3],carry1[3]);
    
    multiplexer mux_carry (carry0[3],carry1[3],cin,cout);
    multiplexer mux_sum0(temp0[0],temp1[0],cin,s[0]);
    multiplexer mux_sum1(temp0[1],temp1[1],cin,s[1]);
    multiplexer mux_sum2(temp0[2],temp1[2],cin,s[2]);
    multiplexer mux_sum3(temp0[3],temp1[3],cin,s[3]);
endmodule
module fulladder(
    input a,b,cin,
    output sum,carry);
    assign sum=a^b^cin;
    assign carry=(a&b)|(cin&a)|(b&cin); 
endmodule
module multiplexer(
    input i0,i1,sel,
    output reg bitout);
    always@(i0,i1,sel)
    begin
    if(sel==0)
        bitout=i0;
    else
        bitout=i1;
    end
endmodule