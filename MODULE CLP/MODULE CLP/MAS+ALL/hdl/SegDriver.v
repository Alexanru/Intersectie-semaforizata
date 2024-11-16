`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2024 11:33:41 PM
// Design Name: 
// Module Name: SegDriver
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module SegDriver(
    input clk,
    input rst,
    input [7:0] Cell0_i,
    input [7:0] Cell1_i,
    input [7:0] Cell2_i,
    input [7:0] Cell3_i,
    output reg [6:0] seg_o,
    output reg dp_o,
    output reg [7:0] an_o
    );
    
reg [3:0] toOutput;
reg [7:0] miniDivCLK;
    
always @(posedge clk or negedge rst) 
begin
    if (!rst)
        miniDivCLK <= 'b0;
    else
        miniDivCLK <= miniDivCLK + 1;
end
    
always @(posedge clk or negedge rst) 
begin
    if (!rst)
        toOutput <= 'hE;
    else
        if(miniDivCLK == 'hff)
        begin
            if(toOutput == 'h7)
                toOutput <=  'hE;
            else 
                toOutput <= {toOutput[2:0], 1'b1};
        end
end

always @(posedge clk or negedge rst) 
begin
    if (!rst)
        an_o <= 'b0;
    else
        an_o = toOutput;
end

always @(posedge clk or negedge rst) 
begin
    if (!rst)
        dp_o <= 'b0;
    else
    case (toOutput)
        'hE: dp_o = ~Cell0_i[7];
        'hD: dp_o = ~Cell1_i[7];
        'hB: dp_o = ~Cell2_i[7];
        'h7: dp_o = ~Cell3_i[7];
        default: dp_o = 'b0;
    endcase
end

always @(posedge clk or negedge rst) 
begin
    if (!rst)
        seg_o <= 'b0;
    else
    case (toOutput)
        'hE: seg_o = ~Cell0_i[6:0];
        'hD: seg_o = ~Cell1_i[6:0];
        'hB: seg_o = ~Cell2_i[6:0];
        'h7: seg_o = ~Cell3_i[6:0];
        default: seg_o = 'b1111111;
    endcase
end


endmodule
