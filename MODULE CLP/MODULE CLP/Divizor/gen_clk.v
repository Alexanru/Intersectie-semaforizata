module gen_clk(
    output reg clk,
    output reg rst
);

parameter CLK_PERIOD = 10;
    
initial begin
    clk <=0;
    
    rst <=1;
    #10
    rst <=0;
    #6
    rst <=1;
end

always#((CLK_PERIOD/2)) begin
    
clk <= ~clk;
end
endmodule