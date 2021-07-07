`timescale 1ns / 1ps

module Processor(input logic CLK, output reg [7:0] instr_result);
    
    reg[15:0] MemoryRD , instr;
    logic C,V,N,Z;
    
    reg[7:0] PC, PC_Plus1;
    reg [2:0] Ra,Rb,Rd,funct;
	reg [5:0] imm;
	reg [3:0] OpCode;
	reg [7:0] addr;
    reg [7:0] micro_extendImm;
    
    reg [7:0] PCmuxRes;
    
    InstructionMemory InstructionMemory(PC,MemoryRD,instr);
    Executer Executer(instr, CLK, C, V, N, Z, Ra, Rb, Rd, imm, OpCode,funct, addr, instr_result);
    
    extend extend_2(imm,micro_extendImm);
    
    reg add_to_PC;
    
    always@(posedge CLK)
    begin  
        if(OpCode == 4'b0010)
            add_to_PC <= addr;
        else if(OpCode == 4'b1000 && Ra == Rd)
            add_to_PC <= micro_extendImm;
        else
            PC_Plus1 <= PC + 8'b00000001;
            add_to_PC <= 8'b00000001;
    end
    
    PCounter PCounter(PC,add_to_PC,newPC);
    
    always@(posedge CLK)
    begin
        PC <= newPC;
    end
    
    /*
    always@(posedge CLK)
    begin  
        if(OpCode == 4'b0010)
            PC <= PC + addr;
        else if(OpCode == 4'b1000 && Ra == Rd)
            PC <= PC + micro_extendImm;
        else
            PC_Plus1 <= PC + 8'b00000001;
            PC <= PC_Plus1;
    end
    */
 
endmodule