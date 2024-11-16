module VEST (
    input clk,
    input rst,
    input [2:0] stare_semafor,
    input clk_div_int,
    input clk_div,
    output reg ready_V,
    output reg verde_V,
    output reg galben_V,
    output reg rosu_V
);

reg [5:0] counter;

always @(posedge clk or negedge rst) begin
if(~rst) begin
counter <= 0;
ready_V<=0; 
end
else begin
    if(stare_semafor == 3'b010)begin
        if(~clk_div) counter = counter+1;
        
        if(counter < 1) 
        begin
            rosu_V   <= 1;
            verde_V  <= 0;
            galben_V <= 0;
        end
            else if(counter <3)
                 begin
                    rosu_V   <= 0;
                    verde_V  <= 0;
                    galben_V <= 1;
                 end
                else if(counter < 18)
                     begin
                       rosu_V   <= 0;
                       verde_V  <= 1;
                       galben_V <= 0; 
                     end
                     else
                     begin
                        ready_V <= 1;
                        counter <= 0;
                        #20
                        ready_V <=0;
                     end
    end
    else
    begin
        if(stare_semafor == 3'b111)
        begin
            ready_V <= 0;
            if(clk_div_int)
            begin
                rosu_V <=0;
                verde_V <=0;
                galben_V <= 1;
            end
            else
            begin
                galben_V <= 0;
                rosu_V <=0;
                verde_V <=0;
            end
        end
        else 
        begin
            rosu_V  <= 1;
            galben_V <= 0;
            verde_V <= 0;
        end
    end
end
end

endmodule