`timescale 1ns / 1ps

module dataMem(
    input logic [7:0] A,
    input CLK,
    input logic WE,
    input logic [1:0] lw_sw,
    input reg [7:0] WD,
    input reg [7:0] regf_rd,
    output reg [7:0] ReadData
    );
    
    //initial WD=8'b00000000;
    
reg [7:0] dataMem [7:0];
    initial dataMem[0] = 8'b00000000;
    initial dataMem[1] = 8'b00000001;
    initial dataMem[2] = 8'b00000010;
    initial dataMem[3] = 8'b00000011;
    initial dataMem[4] = 8'b00000100;
    initial dataMem[5] = 8'b00000101;
    initial dataMem[6] = 8'b00000110;
    initial dataMem[7] = 8'b00000111;
    
    always @(posedge CLK)
        begin
            ReadData <= A;
        end
        
    always@(posedge CLK)
        begin
            if(WE==1)
                ReadData <= WD;
                
            else if(lw_sw == 2'b01) // lw
                begin
                    WD = dataMem[A];
                    ReadData <= WD;
                 end
                
            else if(lw_sw == 2'b10) // sw
                dataMem[A] <= regf_rd;
        end
endmodule
