`timescale 1ns / 1ps

module InstructionMemory(input reg[7:0] PC,
output reg[15:0] MemoryRD,
output reg [15:0] instr
);

reg [15:0] instr_memory[3:0];

initial instr_memory[0]=16'b0000000001011000;
initial instr_memory[1]=16'b1111000001000101;
initial instr_memory[2]=16'b0000111000010100;
initial instr_memory[3]=16'b0000111000010010;

assign instr=instr_memory[PC];


endmodule
