module BCDCounter_TB;

    reg clk;
    reg rst;
    wire [3:0] bcd;
BCDCounter UUT (.clk(clk),.rst(rst),.bcd(bcd));
initial begin
        clk = 0;
        rst = 0;
        #5 rst = 1; 
        #5 rst = 0; 
        repeat (20) begin
            #5 clk = ~clk; 
        end
       $finish;
    end
    always begin
        #2 clk = ~clk; 
    end
endmodule
