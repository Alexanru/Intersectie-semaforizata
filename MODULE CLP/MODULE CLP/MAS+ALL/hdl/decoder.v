module decoder(

    input clk_div,
    input clk_div_int,
    input clk,
    input rst,
    input button,
    input service,
    input ready_N,
    input ready_S,
    input ready_E,
    input ready_V,
    input ready_P,
    output reg[2:0] stare_semafor
);

reg[2:0] stare_urmatoare;


localparam SUD     = 3'b000;
localparam EST     = 3'b001;
localparam VEST    = 3'b010;
localparam NORD    = 3'b011;
localparam PIETONI = 3'b100;
localparam SERVICE = 3'b111;


always @(posedge clk or negedge rst) begin
    if(~rst) begin
        stare_semafor   <=3'b000;
        stare_urmatoare <=3'b000;
    end
    else
    stare_semafor <= stare_urmatoare;
end

 always @(*) begin
    case (stare_semafor)
        SUD: if (service)       stare_urmatoare <= SERVICE;
             else if (ready_S)  stare_urmatoare <= EST;
             else if (~rst)     stare_semafor <= SUD;
             else               stare_urmatoare <= SUD;
        EST: if (service)       stare_urmatoare <= SERVICE;
             else if (ready_E)  stare_urmatoare <= VEST;
             else if (~rst)     stare_semafor <= SUD;
             else               stare_urmatoare <= EST;
        VEST: if (service)      stare_urmatoare <= SERVICE;
              else if (ready_V) stare_urmatoare <= NORD;
              else if (~rst)    stare_urmatoare <= SUD;
              else              stare_urmatoare <= VEST;
        NORD: if (service)      stare_urmatoare <= SERVICE;
              else if (ready_N) stare_urmatoare <= PIETONI;
              else if (~rst)    stare_urmatoare <= SUD; 
              else              stare_urmatoare <= NORD;
        PIETONI: if (service)   stare_urmatoare <= SERVICE;
              else if (ready_P) stare_urmatoare <= SUD;
              else if (~rst)    stare_urmatoare <= SUD;
              else              stare_urmatoare <= PIETONI;
        SERVICE: if (~service) stare_urmatoare <= SUD;
        default: stare_urmatoare <= SUD;
    endcase
end

endmodule