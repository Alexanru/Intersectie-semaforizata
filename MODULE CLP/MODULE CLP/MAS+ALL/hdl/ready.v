module ready (
    input clk,
    output reg ready_s,
    output reg service_s
);

integer count = 0;
integer count1 =0;

initial begin
    service_s = 0;
    ready_s = 0;
end

always @(posedge clk) begin
    if (count < 10) begin
        // Generăm 10 margini ascendente ale semnalului de ceas
        count <= count + 1;
        ready_s <= 0; // Semnalul ready este 0 pentru cele 10 margini ascendente
    end else begin
        // După cele 10 margini ascendente, stabilim semnalul ready la 1
        ready_s <= 1;
	count <=0;
    end
end

    always @(posedge clk) begin
    if (count1 < 100) begin
        // Generăm 10 margini ascendente ale semnalului de ceas
        count1 <= count1 + 1;
         // Semnalul ready este 0 pentru cele 10 margini ascendente
    end else begin
        // După cele 10 margini ascendente, stabilim semnalul ready la 1
        service_s = ~service_s;
	    count1 <=0;
    end
end

endmodule
