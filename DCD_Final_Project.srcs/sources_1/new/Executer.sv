`timescale 1ns / 1ps

module Executer(
    input reg[15:0] instr,
    input CLK,
    output C,V,N,Z,
    output reg [2:0] Ra,
	output reg [2:0] Rb,
	output reg [2:0] Rd,
	output reg [5:0] imm,
	output reg [3:0] OpCode,
	output reg [2:0] funct,
	output reg [7:0] addr,
	output reg [7:0] result
    );
    
    wire aluResult, Rd1, Rd2, Rd3, mux1Res;
    reg [7:0] mux2Res;
    wire [7:0] dataMemResult;
    reg extendImm;
    
    logic MemtoReg, MemWrite, AluSrc, RegWrite, MemWriteRd;
    logic [2:0] ALUControl;
     
    extend extend(imm,extendImm);
    
    always @*
    begin
    
        OpCode <= instr[15:12];
        Rd <= instr[11:9];
        Ra <= instr[8:6];
        Rb <= instr[5:3];
        funct <= instr[2:0];
        imm <= instr[5:0];
        addr <= instr[7:0];
        
    end
    
     ControlUnit ControlUnit(OpCode, funct,Rd,MemtoReg,MemWrite,ALUControl,AluSrc, RegWrite, MemWriteRd);
     
     registerFile registerfile(Ra,Rb,Rd,mux2Res,RegWrite,CLK,Rd1,Rd2,Rd3);
     
     mux2 mux2(Rd2,extendImm,AluSrc,mux1Res);
     
     ALU ALU(Rd1,mux1Res,ALUControl,aluResult,C,V,N,Z);
     
     dataMem dataMem(aluResult,CLK,MemWrite,MemWriteRd,Rd2,Rd3,dataMemResult);
     
     mux2 mux2_2(aluResult,dataMemResult,MemtoReg,mux2Res);
     
     assign result = mux2Res;

endmodule