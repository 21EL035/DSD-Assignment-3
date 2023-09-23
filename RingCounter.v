module ringcounter(clk, rst, count);  
    input clk, rst; 
    output [5:0] count; 
    wire clk, rst; 
    reg [5:0] count = 6'b1;     
    always @ ( posedge clk ) 
        begin   
        if ( ~rst )   
            begin     
            count <= count << 1;    
            count[0] <= count[5];   
        end 
    end  
    always @ ( posedge rst ) 
    begin   
        count <= 6'b1; 
    end  
endmodule