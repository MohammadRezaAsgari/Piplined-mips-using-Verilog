`timescale 1ns / 1ps
module Control(opcode,jump,RegWr,MemtoReg,MemWr,ALUopc,ALUsrc,RegDst,Branch);
input[5:0] opcode;
output reg jump,RegWr,MemtoReg,MemWr,ALUsrc,RegDst,Branch;
output reg[1:0] ALUopc;

always@(opcode)begin
	jump=(opcode==6'b10)?1:0;
	RegWr=(opcode==0)? 1:
			(opcode==6'b100011)? 1:
			(opcode==6'b1000)? 1:0;
	MemtoReg=(opcode==6'b100011)? 1:0;
	MemWr=(opcode==6'b101011)? 1:0;
	ALUsrc=(opcode==6'b100011)? 1:
			(opcode==6'b101011)? 1:
			(opcode==6'b1000)? 1:0;
	RegDst=(opcode==0)? 1:0;
	Branch=(opcode==6'b100)? 1:0;
	ALUopc[0]=(opcode==6'b100)? 1:
				(opcode==6'b1000)?1:0;
	ALUopc[1]=(opcode==0)? 1:
				(opcode==6'b1000)?1:0;
end

endmodule
