module bistabil1(
    input      clk,
    input      rst,
    input      signal,
    output reg bistabile
);


 reg q_2;
 reg q_1;

always @(posedge clk or negedge rst) begin
    if(~rst) begin
        q_1 <= 0;
        q_2 <= 0;
	
    end
    else begin
          q_2 <= q_1;
          q_1 <= signal;
    end

    bistabile <= (q_1 & q_2);
end

endmodule