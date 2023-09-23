module FSMSequenceDetector (
  input clk,
  input reset,
  input d_in,
  output reg y
);
reg [2:0]cst,nst;
parameter s0=3'b000,
          s1=3'b001,
          s2=3'b010,
          s3=3'b100,
          s4=3'b101;
always@(cst or d_in)
begin
case(cst)
s0:if(d_in==1'b1)
    begin
     nst=s1;
     y=1'b0;
    end
   else cst=nst;
s1:if(d_in==1'b0)
    begin
     nst=s2;
     y=1'b0;
    end 
   else cst=nst;
s2:if(d_in==1'b1)
    begin
     nst=s3;
     y=1'b0;
    end 
   else 
    begin
     nst=s0;
     y=1'b0;
    end
s3:if(d_in==1'b0)
    begin
     nst=s2;
     y=1'b1;
    end 
   else
   begin 
   nst=s1;
   y=1'b0;
   end
default nst=s0;   
   endcase
   end
always@(posedge clk) begin
    if(reset)
        cst<=s0;
     else
        cst<=nst;
        end
endmodule