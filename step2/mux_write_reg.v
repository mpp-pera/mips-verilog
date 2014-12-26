//mux for write reg
module mux_registers (sel,in0,in1,out);
	output [4:0] out;
	input [4:0] in0, in1;
	input sel;
	
	genvar i;
	
	generate for (i=0; i<5; i=i+1)
	begin: buf_loop
		bufif1	(out[i],in1[i],sel);
		bufif0	(out[i],in0[i],sel);	
	end
	endgenerate
	
endmodule
//testing 
module test;
	reg [4:0] in0, in1;
	wire [4:0] out;
	
	reg sel;
	
	
	mux_registers m1 (sel,in0,in1,out);
	
	initial
	begin
		#0
		in0 <= 5'b11101;
		in1 <= 5'b11001;
	
		#10
		 sel = 1'b0;
		#12
		  
		#20
		 sel = 1'b1;
		#25
		 $display("Output- %b -> %b\n", sel,out);
	end
endmodule
	
	
	
	
	
	
