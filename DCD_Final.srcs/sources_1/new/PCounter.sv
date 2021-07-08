`timescale 1ns / 1ps

module PCounter(input CLK,
    input reg[7:0] PC,
    input [7:0]add_to_PC,
    output reg[7:0] newPC
    );
    
    always@(posedge CLK)
        PC<=PC + add_to_PC;
endmodule
