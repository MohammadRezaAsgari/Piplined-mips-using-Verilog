`timescale 1ns / 1ps
module ALU(a,b,control,out);
input[31:0] a,b;
input[2:0] control;
output reg[31:0] out;

always@(a or b)begin
	if(control==3'b10)
		out=a+b;
	else if(control==3'b11)
		out=a+b;
	else if(control==3'b110)
		out=a-b;
	else if(control==3'b0)
		out=a & b;
	else if(control==3'b1)
		out=a | b;
	else if(control==3'b111)
		out=(a<b)? 1:0;
end

endmodule
