`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2024 01:55:51 PM
// Design Name: 
// Module Name: Counter_tb
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


module Counter_tb();
    reg clk_in;
    wire[11:0] count;
    
    Counter uut(.clk_in(clk_in), .count(count));
    initial begin
        clk_in = 0;
        forever #10 clk_in = ~clk_in;
    end
    
endmodule
