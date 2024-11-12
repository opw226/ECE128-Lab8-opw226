`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2024 01:52:43 PM
// Design Name: 
// Module Name: Clock_divider
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


module clock_divider(clk_in,clk_out);

input clk_in;   // Input clock signal
output reg clk_out;  // Output clock signal (divided)
    
    
    parameter DIVISOR = 28'd2;  // Adjust this based on your desired clock frequency
    reg [27:0] counter = 28'd0;     // 32-bit counter

    always @(posedge clk_in) 
        begin
        counter <= counter + 28'd1;
        if (counter >= (DIVISOR - 1)) begin
            counter <= 28'd0;      // Reset the counter
            clk_out <= (counter<DIVISOR/2)?1'b1:1'b0;   // Toggle the output clock
        end
    end
endmodule
