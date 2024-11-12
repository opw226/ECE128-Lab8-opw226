`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2024 02:24:30 PM
// Design Name: 
// Module Name: Bin2BCD_tb
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


module Bin2BCD_tb();
    reg clk;
    reg en;
    reg [11:0] bin_d_in;
    wire [15:0] bcd_d_out;
    wire rdy;
    
    Bin2BCD uut(.clk(clk), .en(en), .bin_d_in(bin_d_in), .bcd_d_out(bcd_d_out), .rdy(rdy));
    
    initial begin
        bin_d_in = 12'b010111100111;
        en = 1'b1;
        clk = 0;
        forever #10 clk = ~clk;
    end
    
    
endmodule
