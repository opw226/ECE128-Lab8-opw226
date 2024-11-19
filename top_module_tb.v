`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2024 03:33:16 PM
// Design Name: 
// Module Name: top_module_tb
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


module top_module_tb();
    reg clk;
    wire [3:0] sseg_a_o;
    wire [6:0] sseg_c_o;
    
    top_module uut(.clk(clk), .sseg_a_o(sseg_a_o), .sseg_c_o(sseg_c_o));
   
    initial begin
        clk = 0;
        forever #10 clk = ~clk;
    end
    
    
endmodule
