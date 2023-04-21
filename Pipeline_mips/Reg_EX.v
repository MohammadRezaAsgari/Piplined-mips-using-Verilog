`timescale 1ns / 1ps

module Reg_EX(clk,regwriE,memtoregE,memwriE,aluoutE,wridataE,wriregE,regwriM,memtoregM,memwriM,aluoutM,wridataM,wriregM
    );
input clk,regwriE,memtoregE,memwriE;
input[31:0] aluoutE,wridataE;
input[4:0] wriregE;
output reg regwriM,memtoregM,memwriM;
output reg[31:0] aluoutM,wridataM;
output reg[4:0] wriregM;

always@(posedge clk)begin
		regwriM=regwriE;memtoregM=memtoregE;memwriM=memwriE;aluoutM=aluoutE;wridataM=wridataE;wriregM=wriregE;
end

endmodule
