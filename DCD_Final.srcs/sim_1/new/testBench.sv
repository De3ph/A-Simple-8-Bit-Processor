`timescale 1ns / 1ps


module testBench();
logic CLK;
reg[7:0] res;

    initial begin 
        CLK = 0;
        forever #50 CLK=~(CLK);
    end
    
    Processor dut(CLK,res);
endmodule
