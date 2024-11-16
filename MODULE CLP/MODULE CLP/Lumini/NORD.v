module NORD (
    input clk,
    input rst,
    input [2:0] stare_semafor,
    input clk_div_int,
    input clk_div,
    output reg ready_N,
    output reg verde_N,
    output reg galben_N,
    output reg rosu_N
);

reg [5:0] counter;

always @(posedge clk or negedge rst) begin
if(~rst) begin
counter <= 0;
ready_N<=0; 
end
else begin
    if(stare_semafor == 3'b011)begin
        if(~clk_div) counter = counter+1;
        
        if(counter < 1) 
        begin
            rosu_N   <= 1;
            verde_N  <= 0;
            galben_N <= 0;
        end
            else if(counter <3)
                 begin
                    rosu_N   <= 0;
                    verde_N  <= 0;
                    galben_N <= 1;
                 end
                else if(counter < 26)
                     begin
                       rosu_N   <= 0;
                       verde_N  <= 1;
                       galben_N <= 0; 
                     end
                     else
                     begin
                        ready_N <= 1;
                        counter <= 0;
                        #20
                        ready_N <= 0;
                     end
    end
    else
    begin
        if(stare_semafor == 3'b111)
        begin
            ready_N <= 0;
            if(clk_div_int)
            begin
                rosu_N <=0;
                verde_N <=0;
                galben_N <= 1;
            end
            else
            begin
                galben_N <= 0;
                rosu_N <=0;
                verde_N <=0;
            end
        end
        else 
        begin
            rosu_N  <= 1;
            galben_N <= 0;
            verde_N <= 0;
        end
    end
end
end

endmodule