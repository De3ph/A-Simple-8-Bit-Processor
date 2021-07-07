`timescale 1ns / 1ps

module PCounter(
    input reg PC,
    input reg add_to_PC,
    output reg newPC
    );
    
    assign newPC = PC + add_to_PC;
    
endmodule
