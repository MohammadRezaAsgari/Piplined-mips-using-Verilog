`timescale 1ns / 1ps

module Reg_ID(clk,clr,regwriD,memtoregD,memwriD,aluconD,alusrcD,regdstD,r1D,r2D,rsD,rtD,rdD,immD,regwriE,memtoregE,memwriE,aluconE,alusrcE,regdstE,r1E,r2E,rsE,rtE,rdE,immE
    );
input clk,clr,regwriD,memtoregD,memwriD,alusrcD,regdstD;
input [2:0] aluconD;
input[31:0] r1D,r2D,immD;
input[4:0] rsD,rtD,rdD;
output reg regwriE,memtoregE,memwriE,alusrcE,regdstE;
output reg[2:0] aluconE;
output reg[31:0] r1E,r2E,immE;
output reg[4:0] rsE,rtE,rdE;

integer i;
initial i=0;
always@(posedge clk)begin
	if(clr)begin
		regwriE=0;memtoregE=0;memwriE=0;aluconE=0;alusrcE=0;regdstE=0;r1E=0;r2E=0;immE=0;rsE=0;rtE=0;rdE=0;
		end
	else if(i==0)begin
			regwriE=0;memtoregE=0;memwriE=0;aluconE=0;alusrcE=0;regdstE=0;r1E=0;r2E=0;immE=0;rsE=0;rtE=0;rdE=0;i=1;
	end
	else begin
		regwriE=regwriD;memtoregE=memtoregD;memwriE=memwriD;aluconE=aluconD;alusrcE=alusrcD;regdstE=regdstD;r1E=r1D;r2E=r2D;immE=immD;rsE=rsD;rtE=rtD;rdE=rdD;i=0;
	end

end

endmodule
