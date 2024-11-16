module gen_stimuli(
    input clk,
    input rst,
    input clk_div,
    input clk_div_int,
    input ready_S,
    output reg [2:0] stare_semafor
);

localparam SUD     = 3'b000;
localparam EST     = 3'b001;
localparam VEST    = 3'b010;
localparam NORD    = 3'b011;
localparam PIETONI = 3'b100;
localparam SERVICE = 3'b111;


//scenariu comutare intre stari si reset

//always @(posedge clk or negedge rst) begin
//    if(~rst) begin
//        stare_semafor <= SUD;
//    end    
//
//    if(ready_S) begin
//        stare_semafor <= EST;
//    end
//end


//scenariu service
//always @(posedge clk or negedge rst) begin
//    if(~rst) begin
//        stare_semafor <= SERVICE;
//    end    
//end


//scenariu semafor pietoni
always @(posedge clk or negedge rst) begin
    if(~rst) begin
        stare_semafor <= PIETONI;
    end    
end

endmodule