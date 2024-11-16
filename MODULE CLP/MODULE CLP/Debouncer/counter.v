module counter(
    input clk,
    input rst,
    input bistabile,
    output reg buton
);

reg[8:0] counter;
reg flag;

always @(posedge clk or negedge rst) begin

    if(~rst) 
    begin
        counter <= 5'b00000;
        buton <= 0;
        flag <= 0;
    end
    else
     begin
        if(bistabile)
            counter <= counter + 1;
        else 
        begin
            counter <=0;
            flag <= 0;
        end
        if(counter == 5'b11110)
        begin
            flag <= 1;
            buton <= 1;
            #20
            buton <= 0;
        end
        if(~bistabile)
         counter <= 5'b00000;
    end
end

endmodule