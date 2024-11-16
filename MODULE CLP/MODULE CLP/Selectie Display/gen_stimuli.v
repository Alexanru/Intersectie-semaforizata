module gen_stimuli(
input clk,
input rst,
output reg [2:0]stare_semafor

);

reg [10:0] counter;

always @(posedge clk or negedge rst)begin

    if(~rst)
        counter <=0;
    else
    begin
        counter <= counter + 1;
        if(counter < 5)
        stare_semafor <= 3'b000;
        else
        stare_semafor <= 3'b001;
    end
end

//always @(posedge clk or negedge rst)begin

//    if(~rst)
//        counter <=0;
//    else
//    begin
//        counter <= counter + 1;
//        if(counter < 5)
//        stare_semafor <= 3'b010;
//        else
//        stare_semafor <= 3'b111;
//    end
//end


endmodule