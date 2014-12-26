//buffer for 4 inputs
module buf4 (out,in,ctrl);

	output [3:0] out;
	input [3:0] in;
	input ctrl;
	
	bufif1 (out[0],in[0],ctrl),
	       (out[1],in[1],ctrl),
	       (out[2],in[2],ctrl),
	       (out[3],in[3],ctrl);
endmodule
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

//Instruction memory
module ins_mem (ins_add, ins_dec);
	input [3:0] ins_add;//address of instruction
	output [3:0] ins_dec;//instruction(for now it is 4 bits, but make it 32 bits)
	wire [15:0] outit;
		
	reg [3:0] word0 = 4'b0000;
	reg [3:0] word1 = 4'b0001;
	reg [3:0] word2 = 4'b0010;
	reg [3:0] word3 = 4'b0011;
	reg [3:0] word4 = 4'b0100;
	reg [3:0] word5 = 4'b0101;
	reg [3:0] word6 = 4'b0110;
	reg [3:0] word7 = 4'b0111;
	reg [3:0] word8 = 4'b1000;
	reg [3:0] word9 = 4'b1001;
	reg [3:0] word10 = 4'b1010;
	reg [3:0] word11 = 4'b1011;
	reg [3:0] word12 = 4'b1100;
	reg [3:0] word13 = 4'b1101;
	reg [3:0] word14 = 4'b1110;
	reg [3:0] word15 = 4'b1111;
	
	dec4to16 decs(ins_add[3],ins_add[2],ins_add[1],ins_add[0],outit);
	
	buf4 b0 (ins_dec,word0,outit[0]),
	     b1 (ins_dec,word1,outit[1]),
	     b2 (ins_dec,word2,outit[2]),
	     b3 (ins_dec,word3,outit[3]),
	     b4 (ins_dec,word4,outit[4]),
	     b5 (ins_dec,word5,outit[5]),
	     b6 (ins_dec,word6,outit[6]),
	     b7 (ins_dec,word7,outit[7]),
	     b8 (ins_dec,word8,outit[8]),
	     b9 (ins_dec,word9,outit[9]),
	     b10 (ins_dec,word10,outit[10]),
	     b11 (ins_dec,word11,outit[11]),
	     b12 (ins_dec,word12,outit[12]),
	     b13 (ins_dec,word13,outit[13]),
	     b14 (ins_dec,word14,outit[14]),
	     b15 (ins_dec,word15,outit[15]);   
endmodule	

//tester
module testdec;
	reg [3:0] a;
	wire [3:0] outit;
	
	ins_mem inmm(a,outit);
	
	initial
	begin
		a<=4'b1110;
		#20
		$display("Output--> %d\n", outit);
	end
endmodule	
