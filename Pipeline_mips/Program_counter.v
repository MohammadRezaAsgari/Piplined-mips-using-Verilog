`timescale 1ns / 1ps
module Program_counter(clk, stall, in, out);
input clk,stall;
input [31:0] in;
output reg[31:0] out;

//	integer i;
//	initial i=0;
//	
//	reg[31:0] pc;
//	always@(posedge clk)begin
//		if(i==0)begin
//			out = 0;
//			i = 1;
//			end
//		else if(stall)
//			out = pc;
//		else begin
//			pc = in;
//			out = pc;
//			end
//end


	initial out=0;

	reg[31:0] pc;
	always@(posedge clk)begin
		if(stall)
			out = pc;
		else begin
			pc = in;
			out = pc;
			end
end





endmodule 