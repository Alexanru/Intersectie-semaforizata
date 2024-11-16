module testbench();

wire clk;
wire rst;
wire bistabile;
wire buton;
wire signal;

bistabil1 BIST1_INST(
    .clk(clk),
    .rst(rst),
    .signal(signal),
    .bistabile(bistabile)
);

counter COUNER_INST(
    .clk(clk),
    .rst(rst),
    .bistabile(bistabile),
    .buton(buton)
);

gen_clk GEN_INST(
    .clk(clk),
    .rst(rst)
);

gen_input INPUT_INST(
    .clk(clk),
    .signal(signal)
);
endmodule

