`timescale 1ns / 1ps
module Mux3to1 #(parameter WIDTH = 8)(a,b,c,s,y);
	
input[WIDTH-1:0] a, b, c;
input[1:0] s;
output [WIDTH-1:0] y;

	assign y =(s==2'b10)? c : 
				(s==2'b1)? b :a;
				

	
endmodule

