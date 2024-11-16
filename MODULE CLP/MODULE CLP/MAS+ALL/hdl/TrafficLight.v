module TrafficLight(
    input clk,
    input rst,
    input [2:0] stare_semafor,
    output reg [7:0] Cell0_i,
    output reg [7:0] Cell1_i,
    output reg [7:0] Cell2_i,
    output reg [7:0] Cell3_i
);


//logica catod comun

    always @(*) begin
        case (stare_semafor)
            3'b000: Cell0_i = 8'b11000000; // SUD        0
            3'b001: Cell0_i = 8'b11111001; // EST        1
            3'b010: Cell0_i = 8'b10100100; // VEST       2
            3'b011: Cell0_i = 8'b10110000; // NORD       3
            3'b100: Cell0_i = 8'b10011001; // PIETONI    4
            3'b111: Cell0_i = 8'b10011110; // SERVICE    6
            default: Cell0_i = 8'b11111111; // off       tot stins
        endcase

        // Celelalte celule nu sunt utilizate(sunt stinse)
        Cell1_i = 8'b11111111;
        Cell2_i = 8'b11111111;
        Cell3_i = 8'b11111111;
    end

endmodule
