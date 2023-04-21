`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:25:58 06/28/2022 
// Design Name: 
// Module Name:    register_pc_save 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module register_pc_save(input[31:0] in,output [31:0] out
    );
	reg[31:0] register;
	always@(in)
		register=in;
	assign out=register;
endmodule
