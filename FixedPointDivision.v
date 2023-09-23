module FixedPointDivision (
  input [15:0] dividend,clk,reset, divisor,   
  output [15:0] quotient  
);
  integer quotient;  
  reg [15:0] remainder;
  reg [15:0] temp_quotient;
  reg [7:0] count;
    always @(posedge clk or posedge reset) begin
    if (reset) begin
      count <= 0;
      remainder <= 0;
      temp_quotient <= 0;
    end
    else begin
      if (remainder >= divisor) begin
        remainder <= remainder - divisor;
        temp_quotient <= temp_quotient + 1;
      end
      else begin
        remainder <= remainder;
        temp_quotient <= temp_quotient;
      end
       count <= count + 1;
      if (count == 7) begin
        quotient <= temp_quotient;
        count <= 0;
      end
    end
  end
endmodule