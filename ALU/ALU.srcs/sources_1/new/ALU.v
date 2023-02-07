`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.01.2023 21:02:03
// Design Name: 
// Module Name: ALU
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


module ALU(
    input wire [3:0] OpCode, A, B,
    input wire mode, Cin,
    output wire equality, Cout,
    output wire [3:0] f
    );
    wire [3:0] adder_out;
    reg Cin_reg;
    reg [3:0] a_reg, b_reg, Out;
    
    
    fourBitRippleCarryAdder rca (.a(a_reg), .b(b_reg), .Cin(Cin_reg), .sum(adder_out), .Cout(Cout));
    always @(*) 
        if ((mode == 1'b1) && (OpCode == 4'b0000)) begin
            Out = ~A;
        end else if ((mode == 1'b1) && (OpCode == 4'b0001)) begin
            Out = ~(A | B);
        end else if ((mode == 1'b1) && (OpCode == 4'b0010)) begin
            Out = ~A & B;
        end else if ((mode == 1'b1) && (OpCode == 4'b0011)) begin
            Out = 4'b0000;
        end else if ((mode == 1'b1) && (OpCode == 4'b0100)) begin
            Out = ~(A & B);
        end else if ((mode == 1'b1) && (OpCode == 4'b0101)) begin
            Out = ~B;
        end else if ((mode == 1'b1) && (OpCode == 4'b0110)) begin
            Out = A ^ B;
        end else if ((mode == 1'b1) && (OpCode == 4'b0111)) begin
            Out = A & ~B;
        end else if ((mode == 1'b1) && (OpCode == 4'b1000)) begin
            Out = ~A | B;
        end else if ((mode == 1'b1) && (OpCode == 4'b1001)) begin
            Out = ~(A ^ B);
        end else if ((mode == 1'b1) && (OpCode == 4'b1010)) begin
            Out = B;
        end else if ((mode == 1'b1) && (OpCode == 4'b1011)) begin
            Out = A & B;
        end else if ((mode == 1'b1) && (OpCode == 4'b1100)) begin
            Out = ~(A & B);
        end else if ((mode == 1'b1) && (OpCode == 4'b0101)) begin
            Out = 4'b0001;
        end else if ((mode == 1'b1) && (OpCode == 4'b1101)) begin
            Out = A | ~B;
        end else if ((mode == 1'b1) && (OpCode == 4'b1110)) begin
            Out = A | B;
        end else if ((mode == 1'b1) && (OpCode == 4'b1111)) begin
            Out = A;
        //Mode Low
        end else if ((mode == 1'b0) && (OpCode == 4'b0000)) begin
            Out = A;
        end else if ((mode == 1'b0) && (OpCode == 4'b0001)) begin
            Out = A | B;
        end else if ((mode == 1'b0) && (OpCode == 4'b0010)) begin
            Out = A | ~B;
        end else if ((mode == 1'b0) && (OpCode == 4'b0011)) begin
            Out = 4'b0000; //minus 1 2's compliment
        end else if ((mode == 1'b0) && (OpCode == 4'b0100)) begin
            a_reg = A;
            b_reg = A & ~B;
            Out = adder_out;
        end else if ((mode == 1'b0) && (OpCode == 4'b0101)) begin
            a_reg = A | B;
            b_reg = A & ~B;
            Out = adder_out;
        end else if ((mode == 1'b0) && (OpCode == 4'b0110)) begin
            a_reg = A;
            b_reg = B;
            Cin_reg = 1'b1;
            Out = adder_out - 1;
        end else if ((mode == 1'b0) && (OpCode == 4'b0111)) begin
            a_reg = A & ~B;
            b_reg = 4'b0001;
            Cin_reg = 1'b1;
            Out = adder_out;
        end else if ((mode == 1'b0) && (OpCode == 4'b1000)) begin
            a_reg = A;
            b_reg = A & B;
            Out = adder_out;
        end else if ((mode == 1'b0) && (OpCode == 4'b1001)) begin
            a_reg = A;
            b_reg = B;
            Out = adder_out;
        end else if ((mode == 1'b0) && (OpCode == 4'b1010)) begin
            a_reg = A | ~B;
            b_reg = A & B;
            Out = adder_out;
        end else if ((mode == 1'b0) && (OpCode == 4'b1011)) begin
            a_reg = A & B;
            b_reg = 4'b0001;
            Cin_reg = 1'b1;
            Out = adder_out;
        end else if ((mode == 1'b0) && (OpCode == 4'b1100)) begin
            a_reg = A | ~B;
            b_reg = A;
            Out = adder_out;     
        end else if ((mode == 1'b0) && (OpCode == 4'b1101)) begin
            a_reg = A | ~B;
            b_reg = A;
            Out = adder_out;
        end else if ((mode == 1'b0) && (OpCode == 4'b1110)) begin
            a_reg = A | B;
            b_reg = A;
            Out = adder_out;
        end else if ((mode == 1'b0) && (OpCode == 4'b1111)) begin
            a_reg = A;
            b_reg = 4'b0001;
            Cin_reg = 1'b1;
            Out = adder_out;
        end else begin
            Out = 4'bZZZZ;
    end
    assign f = Out;
    
    
endmodule
