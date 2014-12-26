//4 to 16 decoder for instruction memory
module dec4to16 (a,b,c,d,result);
	
	output [15:0] result;
	input a,b,c,d;
	
	not (a_n,a), (b_n,b), (c_n,c), (d_n,d); 
	
	and (result[0],a_n,b_n,c_n,d_n);
	and (result[1],a_n,b_n,c_n,d);
	and (result[2],a_n,b_n,c,d_n);
	and (result[3],a_n,b_n,c,d);
	
	and (result[4],a_n,b,c_n,d_n);
	and (result[5],a_n,b,c_n,d);
	and (result[6],a_n,b,c,d_n);
	and (result[7],a_n,b,c,d);
	
	and (result[8],a,b_n,c_n,d_n);
	and (result[9],a,b_n,c_n,d);
	and (result[10],a,b_n,c,d_n);
	and (result[11],a,b_n,c,d);
	
	and (result[12],a,b,c_n,d_n);
	and (result[13],a,b,c_n,d);
	and (result[14],a,b,c,d_n);
	and (result[15],a,b,c,d);
endmodule

//tester
module testdec;
	reg a,b,c,d;
	wire [15:0] outit;
	
	dec4to16 decs(a,b,c,d,outit);
	
	initial
	begin
		a<=1'b0;
		b<=1'b0;
		c<=1'b0;
		d<=1'b1;
		#1
		$display("Output--> %b\n", outit);
	end
endmodule

