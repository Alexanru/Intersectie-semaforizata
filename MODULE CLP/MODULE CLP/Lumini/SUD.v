module SUD (
    input clk,
    input rst,
    input [2:0] stare_semafor,
    input clk_div_int,
    input clk_div,
    output reg ready_S,
    output reg verde_S,
    output reg galben_S,
    output reg rosu_S
);

reg [5:0] counter;

always @(posedge clk or negedge rst) begin
if(~rst) begin
counter <= 0;
ready_S <=0; 
end
else begin
    if(stare_semafor == 3'b000)begin
        if(~clk_div) counter = counter+1;
        
        if(counter <1) 
        begin
            rosu_S   <= 1;
            verde_S  <= 0;
            galben_S <= 0;
        end
            else if(counter <3)
                 begin
                    rosu_S   <= 0;
                    verde_S  <= 0;
                    galben_S <= 1;
                 end
                else if(counter < 28)
                     begin
                       rosu_S   <= 0;
                       verde_S  <= 1;
                       galben_S <= 0; 
                     end
                     else
                     begin
                        ready_S <= 1;
                        counter <= 0;
                        #20
                        ready_S <=0;
                     end
    end
    else
    begin
        if(stare_semafor == 3'b111)
        begin
            ready_S <= 0;
            if(clk_div_int)
            begin
                rosu_S <=0;
                verde_S <=0;
                galben_S <= 1;
            end
            else
            begin
                galben_S <= 0;
                rosu_S <=0;
                verde_S <=0;
            end
        end
        else 
        begin
            rosu_S  <= 1;
            galben_S <= 0;
            verde_S <= 0;
        end
    end
end
end

endmodule