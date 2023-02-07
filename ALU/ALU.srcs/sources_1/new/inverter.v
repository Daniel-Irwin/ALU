`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.01.2023 20:52:00
// Design Name: 
// Module Name: inverter
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


module inverter(
    input invert,
    input [3:0] word_in,
    output [3:0] word_out
    );
    assign word_out[0] = invert ^ word_in[0];
    assign word_out[1] = invert ^ word_in[1];
    assign word_out[2] = invert ^ word_in[2];
    assign word_out[3] = invert ^ word_in[3];
    
endmodule
