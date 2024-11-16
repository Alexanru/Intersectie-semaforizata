module testbench();


wire clk;
wire rst;
wire [2:0] stare_semafor;
wire [7:0] Cell0_i;
wire [7:0] Cell1_i;
wire [7:0] Cell2_i;
wire [7:0] Cell3_i;

TrafficLight TRAFFIC_INST(
    .clk(clk),
    .rst(rst),
    .stare_semafor(stare_semafor),
    .Cell0_i(Cell0_i),
    .Cell1_i(Cell1_i),
    .Cell2_i(Cell2_i),
    .Cell3_i(Cell3_i)
);


gen_clk GEN_CLK_INST(
    .clk(clk),
    .rst(rst) 
);

gen_stimuli STIMULI_INST(
    .clk(clk),
    .rst(rst),
    .stare_semafor(stare_semafor)
);
endmodule