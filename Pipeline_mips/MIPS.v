`timescale 1ns / 1ps
module MIPS(input clk);

wire jumptaken;
wire pcsrcD;
wire[31:0] pcplus4F,pcplus4D;
wire[31:0] pcBranchD;
wire[31:0] pcinput,pcF,mux_branch_out,wirebranch_pc;;

Mux2to1#(32) mux_branch(pcplus4D,	pcBranchD,	pcsrcD,	mux_branch_out);

Mux2to1#(32) mux_jump(mux_branch_out,	wirebranch_pc,	jumptaken,	pcinput);

wire stallF;
Program_counter pc(clk,	stallF,	pcinput,	pcF);

wire[31:0] insF;
Ins_mem instruction_memory(pcF,	insF);


Adder addpc(pcF,	4,	pcplus4F);

wire stallD;
wire[31:0] insD;
Reg_IF reg_if_id(clk,	pcsrcD,	stallD,	insF,	pcplus4F,	insD,	pcplus4D);

wire regwriteW;
wire[4:0] writeregW;
wire[31:0] resultW,readdata1D,readdata2D;
regfile register_file(clk,	regwriteW,	insD[25:21],	insD[20:16],	writeregW,	resultW,	readdata1D,readdata2D);

wire[31:0] aluoutM,eq_srcA,eq_srcB;
wire ForwardAD,ForwardBD;
Mux2to1#(32) mux_forwardAD(readdata1D, aluoutM,	ForwardAD,	eq_srcA);
Mux2to1#(32) mux_forwardBD(readdata2D, aluoutM,	ForwardBD,	eq_srcB);

wire equalD,BranchD;
assign equalD=(eq_srcA==eq_srcB)? 1:0;
assign pcsrcD=(equalD & BranchD)? 1:0;

wire regwriteD,memtoregD,memwriteD,alusrcD,regdstD;
wire[1:0] aluopc;
Control control_unit(insD[31:26],	jumptaken,		regwriteD,	memtoregD,	memwriteD,	aluopc,	alusrcD,	regdstD,	BranchD);

wire[2:0] alucontrolD;
ALU_control alucontrol(aluopc,	insD[5:0],	alucontrolD);

wire[31:0] signimmD;
signextend se(insD[15:0],	signimmD);

SL2 shiftlefttwo(signimmD,	wirebranch_pc);

Adder add_branch(wirebranch_pc,	pcplus4D,	pcBranchD);


wire flushE;

wire regwriteE,memtoregE,memwriteE,alusrcE,regdstE;
wire[2:0] aluconE;
wire[4:0] rsE,rtE,rdE;
wire[31:0] immE,readdata1E,readdata2E;
Reg_ID register_id_ex(clk,	flushE,	regwriteD,	memtoregD,	memwriteD,	alucontrolD,	alusrcD,	regdstD,	readdata1D,	readdata2D,
	insD[25:21],	insD[20:16],	insD[15:11],	signimmD,	regwriteE,	memtoregE,	memwriteE,	aluconE,	alusrcE,	regdstE,
	readdata1E,	readdata2E,	rsE,	rtE,	rdE,	immE);
	
wire[4:0] writeregE;
Mux2to1#(5) mux_regdst(rtE,	rdE,	regdstE,	writeregE);
	
	
wire[1:0] ForwardAE;
wire[31:0] srcAE;
Mux3to1#(32) mux_forwardAE(readdata1E,	resultW,	aluoutM,	ForwardAE,	srcAE);


wire[1:0] ForwardBE;
wire[31:0] writedataE;
Mux3to1#(32) mux_forwardBE(readdata2E,	resultW,	aluoutM,	ForwardBE,	writedataE);

wire[31:0] srcBE;
Mux2to1#(32) mux_alusrc(writedataE,	immE,	alusrcE,	srcBE);

wire[31:0] aluoutE;
ALU alu(srcAE,	srcBE,	aluconE,	aluoutE);

wire regwriteM,memtoregM,memwriteM;
wire[31:0] writedataM;
wire[4:0] writeregM;
Reg_EX register_ex_mem(clk,	regwriteE,	memtoregE,	memwriteE,	aluoutE,	writedataE,	writeregE,	regwriteM,	memtoregM,
		memwriteM,	aluoutM,	writedataM,	writeregM);
		

wire[31:0] readdataW,output_mux_mem;
wire ForwardM; 
Mux2to1#(32) mux_memory(writedataM,	readdataW,	ForwardM,	output_mux_mem);

wire[31:0] readdataM;
Data_mem data_memory(clk,	memwriteM,	aluoutM,	output_mux_mem,	readdataM);


wire memtoregW;
wire[31:0] aluoutW;
Reg_M register_mem_wb(clk,	regwriteM,	memtoregM,	readdataM,	aluoutM,	writeregM,	regwriteW,	memtoregW,	readdataW,	aluoutW,	writeregW);


Mux2to1#(32) muxWB(aluoutW,	readdataW,	memtoregW,	resultW);


Hazard_Unit hazard_unit(regwriteW,	memtoregW,	regwriteM,	memtoregM,	memwriteM,	regwriteE,	memtoregE,	BranchD,
				writeregW,	writeregM,	writeregE,	rtE,	rsE,	insD[20:16],	insD[25:21],
				ForwardM,	flushE,	ForwardAD,	ForwardBD,	stallD,	stallF,ForwardAE,	ForwardBE);

endmodule
