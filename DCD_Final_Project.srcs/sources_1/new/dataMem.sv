`timescale 1ns / 1ps

module dataMem(
    input logic [7:0] A,
    input CLK,
    input logic WE,
    input logic MemWriteRd,
    input logic [7:0] WD,
    input reg [7:0] regf_rd,
    output reg [7:0] ReadData
    );
    
    always @(posedge CLK)
        begin
            ReadData <= A;
            
            if(WE==1)
                ReadData <= WD;
            if(MemWriteRd==1)
                ReadData <= regf_rd;
        end
endmodule
