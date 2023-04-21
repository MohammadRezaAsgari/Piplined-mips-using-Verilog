`timescale 1ns / 1ps
module regfile(clk,	write_en,	ra1,	ra2,	wa,	wd,	rd1,	rd2);
	input clk,write_en;
	input[4:0] ra1, ra2, wa;
	input[31:0] wd;
	output[31:0] rd1, rd2;
		
	reg[31:0] registers[31:0];
	integer i;
	initial begin
		for(i=0;i<32;i=i+1)
			registers[i]=0;
	end

always@(posedge clk)
	if(write_en & wa!=0) 
		registers[wa] <= wd;
		
	assign rd1 = (ra1 != 0) ? registers[ra1] : 0;
	assign rd2 = (ra2 != 0) ? registers[ra2] : 0;
endmodule
