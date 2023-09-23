module BCDCounter (
    input wire clk,       
    input wire rst,       
    output wire [3:0] bcd 
);
    reg [3:0] count;
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            count <= 4'b0000; 
        end else begin
            if (count == 4'b1001) begin
                count <= 4'b0000; 
            end else begin
                count <= count + 1;
            end
        end
    end
    assign bcd = count;
endmodule