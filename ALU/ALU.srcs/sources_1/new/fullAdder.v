`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.01.2023 20:33:53
// Design Name: 
// Module Name: fullAdder
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


module fullAdder(
    input wire a, b, Cin,
    output sum, Cout
    );
    wire w1, w2, w3;
    halfAdder ha1 (.a(a), .b(b), .sum(w1), .carry_out(w2));
    halfAdder ha2 (.a(w1), .b(Cin), .sum(sum), .carry_out(w3));
    
    assign Cout = w2 | w3;
    
endmodule
