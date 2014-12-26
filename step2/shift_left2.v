/*shift left 2*/
module shiftleft2 (in_word,out_word);
	input [31:0] in_word;
	output [31:0] out_word;
	
	assign out_word[0]=1'b0;
	assign out_word[1]=1'b0;
	
	genvar i;
	
	generate for (i=2; i<32; i=i+1)
	begin: buf_loop
		buf	(out_word[i],in_word[i-2]);	
	end
	endgenerate
endmodule
	
module test;
	reg [31:0] in;	
	wire [31:0] out;
	
	shiftleft2 shft(in,out);
	
	initial
	begin
	#0
		in <= 32'b11111111111111111111111111111111;
		
	#5	
		$display("Output: %b\n",out);
	end
endmodule
