`timescale 1ns / 1ps

module Reg_IF(clk,clr,stall,insF,pcp4,insD,out_pcp4
    );
input clk,clr,stall;
input[31:0] insF,pcp4;
output reg[31:0] insD,out_pcp4;

always@(posedge clk)begin
	if(clr)begin
		insD = 0;
		out_pcp4= 0;
		end
	else if(~stall)begin
		insD = insF;
		out_pcp4 = pcp4;
		end

end

endmodule
