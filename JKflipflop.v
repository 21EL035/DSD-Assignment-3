module JKflipflop(
    input c,j,k,resetn,
    output Q,Qn
    );
    wire MQ,MQn,Cn;
    wire j1,k1,j2,k2;
    assign j2=!resetn?0:j1;
    assign k2=!resetn?1:k2;
    and(j1,j,Qn);
    and(k1,k,Q);
    not(Cn,c);
    sr_latch master(MQ,MQn,c,j2,k2);
    sr_latch slave(Q,Qn,Cn,MQ,MQn);
endmodule

module sr_latch(
    output Q,Qn,
    input G,S,R
    );
    wire S1,R1;
    and(S1,G,S);
    and(R1,G,R);
    nor(Qn,S1,Q);
    nor(Q,R1,Qn);
endmodule 