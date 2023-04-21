`timescale 1ns / 1ps
module signextend(input [15:0] a,	output [31:0] y);
	assign y = {16'b0, a};
endmodule
