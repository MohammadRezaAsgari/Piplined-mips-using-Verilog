`timescale 1ns / 1ps

module Hazard_Unit(input regwriteW,	memtoregW,	regwriteM,	memtoregM,	memwriteM,	regwriteE,	memtoregE,	branchD,
						input[4:0] writeregW,	writeregM,	writeregE,	rtE,	rsE,	rtD,	rsD,
						output  reg forwardM,	flushE,	forwardAD,	forwardBD,	stallD,	stallF,
						output  reg [1:0] forwardAE,	forwardBE
    );
	initial begin
		forwardM = 0;
		flushE = 0;
		forwardAD = 0;
		forwardBD = 0;
		stallD = 0;
		stallF = 0;
		forwardAE = 0;
		forwardBE = 0;
		end 
	 always@(regwriteW or memtoregW or regwriteM or memtoregM or memwriteM or regwriteE or memtoregE or branchD or writeregW or writeregM or writeregE or rtE or rsE or rtD or rsD) begin
			forwardM=(writeregW==writeregM & memtoregW==1 & memwriteM==1)? 1:0;
			forwardAE=(regwriteM==1 & writeregM!=0 & writeregM==rsE)? 10:
						(regwriteW==1 & writeregW!=0 & writeregM!=rsE & writeregW==rsE)? 1:0;
			forwardBE=(regwriteM==1 & writeregM!=0 & writeregM==rtE)? 10:
						(regwriteW==1 & writeregW!=0 & writeregM!=rtE & writeregW==rtE)? 1:0;
			forwardAD=(regwriteM==1 & writeregM==rsD)?1:0;
			forwardBD=(regwriteM==1 & writeregM==rtD)?1:0;
			stallD=0;//(memtoregE==1 & regwriteE==1 & (writeregE==rsD | writeregE==rtD) )? 1:0;
			stallF=(stallD==1)? 1:0;
			flushE=0;
	 end
endmodule
