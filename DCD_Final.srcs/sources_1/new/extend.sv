`timescale 1ns / 1ps

module extend(
    input reg [5:0] in,
    output reg [7:0] out
    );
    
    always@*
    begin
        out <= in;
    end
    
endmodule
