module JKflipflop_TB;
  reg clk;
  reg reset;
  reg J;
  reg K;
  wire Q, not_Q;
  jk_flip_flop uut (.clk(clk),.reset(reset),.J(J),.K(K),.Q(Q),.not_Q(not_Q));
  always begin
    #5 clk = ~clk;
  end
  initial begin
    $display("JK Flip-Flop Testbench");
    clk = 0;
    reset = 1;
    J = 0;
    K = 0;
    #10 reset = 0;
    J = 1;
    K = 0;
    #10;
        $display("Q = %b, ~Q = %b", Q, ~Q);
    J = 0;
    K = 1;
    #10;
        $display("Q = %b, ~Q = %b", Q, ~Q);
    J = 1;
    K = 1;
    #10;
        $display("Q = %b, ~Q = %b", Q, ~Q);
    J = 0;
    K = 0;
    #10;
        $display("Q = %b, ~Q = %b", Q, ~Q);
    $finish;
  end
endmodule