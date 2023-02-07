`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.01.2023 20:39:51
// Design Name: 
// Module Name: fourBitRippleCarryAdder
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


module fourBitRippleCarryAdder(
    input [3:0] a,
    input [3:0] b,
    input Cin,
    output [3:0] sum,
    output Cout
    );
    //Used for subtraction. If Cin is 1, then the bits from b will be inverted
    wire [3:0] inverted_word;
    inverter i (.word_in(b), .word_out(inverted_word), .invert(Cin));
    
    wire w1, w2, w3;
    
    fullAdder fa1 (.a(a[0]), .b(inverted_word[0]), .Cin(Cin), .sum(sum[0]), .Cout(w1));
    fullAdder fa2 (.a(a[1]), .b(inverted_word[1]), .Cin(w1), .sum(sum[1]), .Cout(w2));
    fullAdder fa3 (.a(a[2]), .b(inverted_word[2]), .Cin(w2), .sum(sum[2]), .Cout(w3));
    fullAdder fa4 (.a(a[3]), .b(inverted_word[3]), .Cin(w3), .sum(sum[3]), .Cout(Cout));
    
endmodule
