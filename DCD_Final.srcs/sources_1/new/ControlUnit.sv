`timescale 1ns / 1ps


module ControlUnit(
    input [3:0] OpCode,
    input [2:0] funct,
    input [2:0] Rd,
    output logic MemtoReg,
    output logic MemWrite,
    output logic [2:0] ALUControl,
    output logic AluSrc,
    output logic RegWrite,
    output logic [1:0] lw_sw
    );
    
    always@*
    begin
        if(OpCode == 4'b0000)
        begin
            if(funct == 3'b000)
            begin
                MemtoReg<=1'b1;
                MemWrite<=1'b0;
                ALUControl<=3'b000;
                AluSrc<=1'b0;
                RegWrite<=1'b1;
                lw_sw<=2'b00;
            end
            else if(funct == 3'b010)
            begin
                MemtoReg<=1'b1;
                MemWrite<=1'b0;
                ALUControl<=3'b010;
                AluSrc<=1'b0;
                RegWrite<=1'b1;
                lw_sw<=2'b00;
            end
            else if(funct == 3'b100)
            begin
                MemtoReg<=1'b1;
                MemWrite<=1'b0;
                ALUControl<=3'b100;
                AluSrc<=1'b0;
                RegWrite<=1'b1;
                lw_sw<=2'b00;
            end
            else if(funct == 3'b101)
            begin
                MemtoReg<=1'b1;
                MemWrite<=1'b0;
                ALUControl<=3'b101;
                AluSrc<=1'b0;
                RegWrite<=1'b1;
                lw_sw<=2'b00;
            end
        end
        else if(OpCode==4'b0100)
            begin
                MemtoReg<=1'b1;
                MemWrite<=1'b0;
                ALUControl<=3'b000;
                AluSrc<=1'b1;
                RegWrite<=1'b1;
                lw_sw<=2'b00;
            end
        else if(OpCode==4'b1011)
            begin
                MemtoReg<=1'b1;
                MemWrite<=1'b0;
                ALUControl<=3'b000;
                AluSrc<=1'b1;
                RegWrite<=1'b1;
                lw_sw<=2'b01;
            end
        else if(OpCode==4'b1111)
            begin
                MemtoReg<=1'b1;
                MemWrite<=1'b0;
                ALUControl<=3'b000;
                AluSrc<=1'b1;
                RegWrite<=1'b0;
                lw_sw <= 2'b10;
            end
        else if(OpCode==4'b1000)
            begin
                MemtoReg<=1'b1;
                MemWrite<=1'b0;
                ALUControl<=3'b000;
                AluSrc<=1'b0;
                RegWrite<=1'b0;
                lw_sw<=2'b00;
            end
        else if(OpCode==4'b0010)
            begin
                MemtoReg<=1'b1;
                MemWrite<=1'b0;
                ALUControl<=3'b000;
                AluSrc<=1'b0;
                RegWrite<=1'b0;
                lw_sw <= 2'b00;
            end
        
    end    
endmodule
