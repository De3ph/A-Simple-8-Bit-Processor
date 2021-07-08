`timescale 1ns / 1ps

module registerFile(A1, A2, A3, WD3,WE3, CLK,RD1,RD2,RD3);
   input [2:0] A1, A2, A3;
   input [7:0] WD3;     
   input  WE3, CLK;
   output reg [7:0] RD1,RD2, RD3;
   
reg [7:0] regfile [7:0];
    initial regfile[0] = 8'b00000000;
    initial regfile[1] = 8'b00000001;
    initial regfile[2] = 8'b00000010;
    initial regfile[3] = 8'b00000011;
    initial regfile[4] = 8'b00000100;
    initial regfile[5] = 8'b00000101;
    initial regfile[6] = 8'b00000110;
    initial regfile[7] = 8'b00000111;

assign RD1 = regfile[A1];
assign RD2 = regfile[A2];
assign RD3 = regfile[A3];

always@(posedge CLK)begin
    if(WE3)  
        regfile[A3] <=  WD3;
end
endmodule
