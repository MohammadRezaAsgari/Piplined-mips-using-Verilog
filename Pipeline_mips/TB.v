`timescale 1ns / 1ps

module TB;
	reg clk;

	MIPS uut (
		.clk(clk)
	);

	initial begin
		clk = 0;
		forever #5 clk=~clk;
	end
	
      
endmodule

