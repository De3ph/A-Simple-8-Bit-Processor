`timescale 1ns / 1ps

module ALU(input signed [7:0] A, B,
input [2:0] ALUControl,
output logic [7:0]result,
output C, V, N, Z);

wire [7:0] b_sub_add,add_or_sub, a_and_b, a_or_b, not_b;
wire n5,n6,cout;

assign not_b=~B;
assign a_and_b=A&B;
assign a_or_b=A|B;


mux2 first_mux (B,not_b,ALUControl[1],b_sub_add);
Nbitfulladder first_adder (A,b_sub_add,ALUControl[1],add_or_sub,cout);

always@*
begin
    if(ALUControl==3'b000)begin
        result <= add_or_sub;end
        
    if(ALUControl==3'b010)begin
        result <= add_or_sub;end
        
    if(ALUControl==3'b100)begin
        result = a_and_b;end
        
    if(ALUControl==3'b101)begin
        result <= a_or_b;   end
              
end

assign C= (~ALUControl[1])&0;
assign n5=(add_or_sub[7])^A[7];
assign n6=~(ALUControl[0] ^ A[7] ^ B[7]);
assign V= (~ALUControl[1]) & n5 & n6;
assign Z= &(~result);
assign N=result[7];

endmodule
