module clk_divider(
    input clk,
    input rst,
    output reg clk_div, //1s
    output reg clk_div_int  //2s


);

reg [27:0] counter;
reg [27:0] counter_int;


always @(posedge clk or negedge rst)
begin
    if(~rst) begin
        counter <=0;
        counter_int <=0;
        clk_div_int <=0;
    end
    else begin
        if(counter_int == 19-1)
        begin
            clk_div_int <= ~clk_div_int;
            counter_int <=0;
        end

        if(counter == 10-1)
        begin
            counter <= 0;
            clk_div <= 0;
        end
        else
        begin
            counter_int <= counter_int+1;
            counter <= counter+1;
            clk_div <= 1;
        end
    end
end
endmodule