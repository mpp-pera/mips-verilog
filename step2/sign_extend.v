//sign extender
module sign_extend(in,out);
	
	input [15:0] in;
	output [31:0] out;
	
	reg sgn = 1'b0;
	
	genvar i;
	
	for(i = 0; i < 16; i=i+1 ) begin
		buf (out[i],in[i]);
		buf (out[i+16], sgn);
	end
endmodule
/*test module*/
module testdec;
	reg [15:0] er;
	wire [31:0] out;
	
	sign_extend sd(er,out);
	
	initial
	begin
	#0
		er = 16'b11010001010101;
		
		
	#10
		$display("OUtput: %b\n",out);
	end
endmodule
