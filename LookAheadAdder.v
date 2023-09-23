module LookAheadAdder (
    input wire [3:0] A,  
    input wire [3:0] B,  
    output wire [3:0] Sum,  
    output wire Cout  
);
    wire [3:0] G;  
    wire [3:0] P;  
    wire [3:0] C;  
    assign G = A & B;
    assign P = A ^ B;
    assign C[0] = G[0] | (P[0] & Cout);
    assign C[1] = G[1] | (P[1] & G[0]);
    assign C[2] = G[2] | (P[2] & G[1]);
    assign C[3] = G[3] | (P[3] & G[2]);
    assign Sum = A ^ B ^ Cout;
    assign Cout = C[3];
endmodule