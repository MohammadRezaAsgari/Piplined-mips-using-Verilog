`timescale 1ns / 1ps

module xtozero(input in,output reg out
    );


always@(in)begin
	if(in==0)
		out<=0;
	else if(in==1)
		out<=1;
	else
		out<=0;

end

endmodule
