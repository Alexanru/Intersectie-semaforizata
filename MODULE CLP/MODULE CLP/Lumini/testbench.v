module testbench();

wire clk;
wire clk_div;
wire [2:0] stare_semafor;
wire rst;
wire clk_div_int;
wire ready_S;
wire ready_E;
wire ready_V;
wire ready_N;
wire ready_P;

SUD SUD_INST(
    .clk(clk),
    .rst(rst),
    .stare_semafor(stare_semafor),
    .clk_div_int(clk_div_int),
    .clk_div(clk_div),
    .ready_S(ready_S),
    .verde_S(verde_S),
    .galben_S(galben_S),
    .rosu_S(rosu_S)
);

EST EST_INST(
    .clk(clk),
    .rst(rst),
    .stare_semafor(stare_semafor),
    .clk_div_int(clk_div_int),
    .clk_div(clk_div),
    .ready_E(ready_E),
    .verde_E(verde_E),
    .galben_E(galben_E),
    .rosu_E(rosu_E)

);

VEST VEST_INST(
    .clk(clk),
    .rst(rst),
    .stare_semafor(stare_semafor),
    .clk_div_int(clk_div_int),
    .clk_div(clk_div),
    .ready_V(ready_V),
    .verde_V(verde_V),
    .galben_V(galben_V),
    .rosu_V(rosu_V)
);

NORD NORD_INST(
    .clk(clk),
    .rst(rst),
    .stare_semafor(stare_semafor),
    .clk_div_int(clk_div_int),
    .clk_div(clk_div),
    .ready_N(ready_N),
    .verde_N(verde_N),
    .galben_N(galben_N),
    .rosu_N(rosu_N)
);

PIETONI PIETONI_INST(
    .clk(clk),
    .rst(rst),
    .stare_semafor(stare_semafor),
    .clk_div_int(clk_div_int),
    .clk_div(clk_div),
    .ready_P(ready_P),
    .verde_P(verde_P),
    .rosu_P(rosu_P)
);

clk_divider DIVIDER_INST(
    .clk(clk),
    .rst(rst),
    .clk_div(clk_div),
    .clk_div_int(clk_div_int)
);

gen_clk GENERATROR_INST(
    .clk(clk),
    .rst(rst)
);

gen_stimuli STIMULI_INST(
    .clk(clk),
    .rst(rst),
    .clk_div(clk_div),
    .clk_div_int(clk_div_int),
    .ready_S(ready_S),
    .stare_semafor(stare_semafor)
);
endmodule