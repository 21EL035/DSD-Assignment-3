module HotEncoder(
    input x,y,z,
    output [7:0]out
);
    assign out[0]=(~x&~y&~z);
    assign out[1]=(~x&~y&z);
    assign out[2]=(~x&y&~z);
    assign out[3]=(~x&y&z);
    assign out[4]=(x&~y&~z);
    assign out[5]=(x&~y&z);
    assign out[6]=(x&y&~z);
    assign out[7]=(x&y&z);

endmodule