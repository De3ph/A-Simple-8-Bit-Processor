`timescale 1ns / 1ps

module InstructionMemory(input reg[7:0] PC,
output reg [15:0] instr);

reg [15:0] instr_memory[7:0];

initial instr_memory[0]=16'b0100000100000011;
initial instr_memory[1]=16'b0000000001000101;
initial instr_memory[2]=16'b1011111000010100;
initial instr_memory[3]=16'b0010000000000011; //3 adým jump oluyor, 5 tane komut çalýþtýrýlmalý
initial instr_memory[4]=16'b0000111000010010;
initial instr_memory[5]=16'b0000000001011000;
initial instr_memory[6]=16'b1111000001000101;
initial instr_memory[7]=16'b0000111000010100;

assign instr=instr_memory[PC];

endmodule
