module gen_input (
    input wire clk,
    output reg signal
);

//simulare apasare lunga de buton

//initial begin
//    signal <= 1;
//end


//simulare de apasari repetate
//pentru a schimba modul celor doua simulari vom decomenta initial-begin
//si vom comenta structura always

reg [5:0] counter; // Contor pentru numărul de perioade ale semnalului

always @(posedge clk) begin
    if (counter < 2) begin 
        signal <= 1'b0;
        counter <= counter + 1;
    end else if (counter < 7) begin 
        signal <= 1'b1;
        counter <= counter + 1;
    end else if (counter < 42) begin 
        signal <= 1'b1;
        counter <= counter + 1;
    end else if (counter < 47) begin 
        signal <= 1'b0;
        counter <= counter + 1;
    end else begin
        counter <= 0; // Resetează contorul
    end
end

endmodule
