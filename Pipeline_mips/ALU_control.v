`timescale 1ns / 1ps

module ALU_control(Aluop,func,out);
input[1:0] Aluop;
input[5:0] func;
output reg[2:0] out;

always@(Aluop or func)begin
	if(Aluop==0)
		out=3'b010;
	else if(Aluop==1)
		out=3'b110;
	else if(Aluop==2'b11)
		out=3'b11;
	else begin
		if(func[3:0]==4'b0)
			out=3'b010;
		else if(func[3:0]==4'b10)
			out=3'b110;
		else if(func[3:0]==4'b100)
			out=3'b0;
		else if(func[3:0]==4'b101)
			out=3'b001;	
		else if(func[3:0]==4'b1010)
			out=3'b111;
	end

end

endmodule
