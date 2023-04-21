`timescale 1ns / 1ps

module Reg_M(clk,regwriM,memtoregM,readdataM,aluoutM,wriregM,regwriW,memtoregW,readdataW,aluoutW,wriregW
    );
input clk,regwriM,memtoregM;
input[31:0] readdataM,aluoutM;
input[4:0] wriregM;
output reg regwriW,memtoregW;
output reg[31:0] readdataW,aluoutW;
output reg[4:0] wriregW;

always@(posedge clk)begin
	regwriW=regwriM;memtoregW=memtoregM;readdataW=readdataM;aluoutW=aluoutM;wriregW=wriregM;
end


endmodule
