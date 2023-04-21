`timescale 1ns / 1ps
module Mux2to1 #(parameter WIDTH = 8)(a,b,s,y);
	
input[WIDTH-1:0] a, b;
input s;
output[WIDTH-1:0] y;

	assign y =(s==1)? b : a;
	
endmodule
