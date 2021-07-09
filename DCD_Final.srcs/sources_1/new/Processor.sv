`timescale 1ns / 1ps

module Processor(CLK,instr_result,PC);
    
    reg[15:0]  instr;
    input logic CLK;
    
    logic C,V,N,Z;
    output reg[7:0] instr_result;

    output reg[7:0] PC;
    
    reg [2:0] Ra,Rb,Rd,funct;
	reg [5:0] imm;
	reg [3:0] OpCode;
	reg [7:0] addr;
    logic [7:0] micro_extendImm;
    
    reg [7:0] PCmuxRes;
    
    assign PC=8'b00000000;
    
    InstructionMemory InstructionMemory(PC,instr);
    Executer Executer(instr, CLK, C, V, N, Z, Ra, Rb, Rd, imm, OpCode,funct, addr, instr_result);
    
    extend extend_2(imm,micro_extendImm);

    reg [7:0] add_to_PC;
    
    always@(*)
    begin  
        if(OpCode == 4'b0010)
            add_to_PC = addr;
        else if(OpCode == 4'b1000 && Ra == Rd)
            add_to_PC = micro_extendImm;
        else
            add_to_PC = 8'b00000001;
    end
    
    PCounter PCounter(CLK,PC,add_to_PC,PC);
endmodule