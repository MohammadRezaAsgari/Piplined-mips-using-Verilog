`timescale 1ns / 1ps
module Data_mem(clk,	we, address, wd, rd);
input clk, we;
input [31:0] address, wd;
output [31:0] rd;

	reg[31:0] RAM[127:0];
	assign rd = RAM[address];

always@(posedge clk)begin
	if(we) 
		RAM[address] <= wd;
	end
endmodule 