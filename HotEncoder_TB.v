module HotEncoder_TB;
reg x,y,z;
wire[7:0]out;
HotEncoder DUT(x,y,z,out);
initial 
begin
$monitor($time,"x=%b,y=%b,z=%b,out=%b",x,y,z,out);
x=0;y=0;z=0;
#100
x=0;y=0;z=1;
#100
x=0;y=1;z=0;
#100
x=1;y=1;z=1;
#100
$finish;
end
endmodule