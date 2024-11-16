module EST (
    input clk,
    input rst,
    input [2:0] stare_semafor,
    input clk_div_int,
    input clk_div,
    output reg ready_E,
    output reg verde_E,
    output reg galben_E,
    output reg rosu_E
);

reg [5:0] counter;

always @(posedge clk or negedge rst) begin
if(~rst) begin
counter <= 0;
ready_E<=0; 
end
else begin
    if(stare_semafor == 3'b001)begin
        if(~clk_div) counter = counter+1;
        
        if(counter < 1) 
        begin
            rosu_E   <= 1;
            verde_E  <= 0;
            galben_E <= 0;
        end
            else if(counter <3)
                 begin
                    rosu_E   <= 0;
                    verde_E  <= 0;
                    galben_E <= 1;
                 end
                else if(counter < 31)
                     begin
                       rosu_E   <= 0;
                       verde_E  <= 1;
                       galben_E <= 0; 
                     end
                     else
                     begin
                        ready_E <= 1;
                        counter <= 0;
                        #20
                        ready_E <= 0;
                     end
    end
    else
    begin
        if(stare_semafor == 3'b111)
        begin
            ready_E <= 0;
            if(clk_div_int)
            begin
                rosu_E <=0;
                verde_E <=0;
                galben_E <= 1;
            end
            else
            begin
                galben_E <= 0;
                rosu_E <=0;
                verde_E <=0;
            end
        end
        else 
        begin
            rosu_E  <= 1;
            galben_E <= 0;
            verde_E <= 0;
        end
    end
end
end

endmodule