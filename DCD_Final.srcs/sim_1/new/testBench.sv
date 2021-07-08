`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.07.2021 15:28:30
// Design Name: 
// Module Name: Testbench
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Testbench();
logic clk;
reg[7:0] result;


Processor dut(clk,result);

initial begin
// Nedenini bilmiyorum ama saat sinyalini 100 yapýnca 8 tane komut çalýþmýyor, 5 tane çalýþýyor
        clk=0;
        forever #50 clk=~(clk);
    end

endmodule
