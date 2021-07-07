`timescale 1ns / 1ps

module ALU(input [7:0] A, B,
input [2:0] ALUControl,
output logic [7:0]result,
output C, V, N, Z);

wire [7:0] b_sub_add, add_and_sub, a_and_b, a_or_b, not_b;
wire n5,n6,cout;

assign not_b=~B;
assign a_and_b=A&B;
assign a_or_b=A|B;

assign C= (~ALUControl[1])&cout;
assign n5=add_and_sub[7]^A[7];
assign n6=~(ALUControl[0] ^ A[7] ^ B[7]);
assign V= (~ALUControl[1]) & n5 & n6;
assign Z= &(~result);
assign N=result[7];

parameter	ALU_OP_ADD	= 3'b000,
			ALU_OP_SUB	= 3'b010,
			ALU_OP_AND	= 3'b100,
			ALU_OP_OR	= 3'b101,
			ALU_OP_ADDI	= 3'b000,
			ALU_OP_LW	= 3'b000,
			ALU_OP_SW	= 3'b000;

mux2 first_mux (B,not_b,ALUControl[0],b_sub_add);
Nbitfulladder first_adder (A,b_sub_add,ALUControl[0],add_and_sub,cout);
//mux4 secound_mux (add_and_sub,add_and_sub,a_and_b,a_or_b,ALUControl,result);

always @(*) 
begin
	case(ALUControl)
			ALU_OP_ADD 	: result = add_and_sub;
			ALU_OP_SUB 	: result = A - B;
			ALU_OP_AND 	: result = A & B;
			ALU_OP_OR	: result = A | B;
			ALU_OP_ADDI	: result = add_and_sub;
			ALU_OP_LW	: result = add_and_sub;
			ALU_OP_SW	: result = add_and_sub;
			
	endcase
end

endmodule
