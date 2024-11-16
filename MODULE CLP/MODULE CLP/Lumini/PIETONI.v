module PIETONI (
    input clk,
    input rst,
    input [2:0] stare_semafor,
    input clk_div_int,
    input clk_div,
    output reg ready_P,
    output reg verde_P,
    output reg rosu_P
);

reg [5:0] counter;

always @(posedge clk or negedge rst) begin
if(~rst) begin
counter <= 0;
ready_P<=0; 
end
else begin
    if(stare_semafor == 3'b100)begin
        if(~clk_div) counter= counter+1;
        
        if(counter < 1) 
        begin
            rosu_P   <= 1;
            verde_P  <= 0;
            
        end
            else if(counter <8)
                 begin
                    rosu_P   <= 0;
                    verde_P  <= 1;
                    
                 end
                else if(counter < 16)
                     begin
                    if(clk_div_int)
                    begin
                        rosu_P <=0;
                        verde_P <=1;
                    end
            else
            begin
                rosu_P <=0;
                verde_P <=0;
            end
                     
                     end
                     else
                     begin
                        ready_P <= 1;
                        counter <= 0;
                        #20
                        ready_P <= 0;
                     end
    end
    else
    begin
        if(stare_semafor == 3'b111)
        begin
            ready_P <= 0;
            if(clk_div_int) //2s
            begin
                rosu_P <=0;
                verde_P <=1;
            end
            else
            begin
                
                rosu_P <=0;
                verde_P <=0;
            end
        end
        else 
        begin
            rosu_P  <= 1;
            verde_P <= 0;
        end
    end
end
end

endmodule