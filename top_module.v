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


module top_module(
input clk,
output [3:0] sseg_a_o,
 output [6:0] sseg_c_o);
 
 wire clock_out;
 wire [11:0] count;
 wire en;
 wire [15:0] bcd_out;
 wire rdy;
 
 
 clock_divider uut(clk, clock_out);
 Counter uut1(clock_out, count, en);
 Bin2BCD uut2(clock_out, en, count, bcd_out, rdy);
 multi_seg_drive uut3(clock_out, bcd_out, sseg_a_o, sseg_c_o);
 
 
endmodule


module multi_seg_drive(
input clk,
 input [15:0] bcd_in,
 output [3:0] sseg_a_o,
 output [6:0] sseg_c_o);

parameter g_s = 5;
parameter gt = 4;

wire [6:0] sseg_o;
reg [3:0] anode =4'b0001;
reg [3:0] bcd_seg =4'b0000;
reg [g_s-1:0] g_count =0;


       
    always @(posedge clk)
    begin
    g_count =g_count+1;
        if(g_count == 0)
            begin
            if(anode == 4'b0001)
                begin
                anode = 4'b1000;
                end   
            else 
                begin
                anode = anode >>1;
                end
             end
             
         if(&g_count[g_s-1:gt]) //mux
            begin
            case (anode) //case statement
            4'b1000 : bcd_seg = bcd_in[15:12];
            4'b0100 : bcd_seg = bcd_in[11:8];
            4'b0010 : bcd_seg = bcd_in[7:4];
            4'b0001 : bcd_seg = bcd_in[3:0];
          default : bcd_seg = 4'b1111; 
            endcase
         end 
         
         else 
            begin
            bcd_seg = 4'b1111; 
            end 
          end
          
Seven_seg_decoder uut2(clk, bcd_seg, sseg_o);

assign  sseg_a_o =~anode;
assign  sseg_c_o =sseg_o; 
endmodule




module Seven_seg_decoder(clk, bcd,seg); 
    input clk; 
    input [3:0] bcd; 
    output reg[6:0] seg;// 
        //always block for converting bcd digit into 7 segment format    
    
    always @(posedge clk)    
    begin        
    case (bcd) //case statement                   
        0 : seg = 7'b1000000;
        1 : seg = 7'b1111001;
        2 : seg = 7'b0100100;
        3 : seg = 7'b0110000;
        4 : seg = 7'b0011001;
        5 : seg = 7'b0010010;
        6 : seg = 7'b0000010;
        7 : seg = 7'b1111000;
        8 : seg = 7'b0000000;
        9 : seg = 7'b0010000;
        default : seg = 7'b1111111;                     
    endcase               
    end                
endmodule

