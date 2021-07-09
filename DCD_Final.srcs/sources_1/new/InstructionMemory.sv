`timescale 1ns / 1ps

module InstructionMemory(input reg[7:0] PC,
output reg [15:0] instr);

reg [15:0] instr_memory[7:0];


initial instr_memory[0]=16'b0000000010001000; //add
initial instr_memory[1]=16'b0000000010001010; //sub
initial instr_memory[2]=16'b0000000010001100; //and
initial instr_memory[3]=16'b0000000010001101; //or
initial instr_memory[4]=16'b0100000100000011; //addi
initial instr_memory[5]=16'b0010000000000010; //j
initial instr_memory[6]=16'b1111111010000010; //sw

//initial instr_memory[6]=16'b1011000010000010; //lw
initial instr_memory[7]=16'b1000000000000010;

assign instr=instr_memory[PC];

endmodule