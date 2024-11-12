`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2024 01:29:59 PM
// Design Name: 
// Module Name: Counter
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


module Counter(clk_in,count, en);
input wire clk_in;
output reg [11:0] count = 12'b000000000000;
output reg en;

    always @(posedge clk_in) begin
    
    if (count == 12'b111111111111) begin
            count <= 12'b000000000000;  // Wrap back to zero when max value is reached
            en <= 1'b0;
        end else begin
          //  count <= count + 1;
        count <= count + 1;  // Increment the counter on each clock edge
        en <= 1'b1;
        
    end
    end

endmodule

