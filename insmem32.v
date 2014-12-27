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
/*----------------------------------------*/
/*32 bit buffer*/
/*--Reason--Expression width 32 does not match width 1 of logic gate array port 1---*/
module buf32 (in,out,ctrl);
	input [31:0] in;
	input ctrl;
	output [31:0] out;
	
	genvar i;
	
	generate for (i=0; i<32; i=i+1)
	begin: buf_loop
		bufif1	(out[i],in[i],ctrl);	
	end
	endgenerate
endmodule
/*--------------------------------------------------------------*/
module insmem32 (ins_add,ins_dec);
	input [3:0] ins_add;
	output [31:0] ins_dec;
	
	wire [15:0] outit;
	
	reg [31:0] word0 = 32'b00001111000011110000111100001111;
	reg [31:0] word1 = 32'b00000000000000001111111111111111;
	reg [31:0] word2 = 32'b00110011001100110011001100110011;
	reg [31:0] word3 = 32'b00010001000100010001000100010001;
	reg [31:0] word4 = 32'b01110111011101110111011101110111;
	reg [31:0] word5 = 32'b01010101010101010101010101010101;
	reg [31:0] word6 = 32'b01100110011001100110011001100110;
	reg [31:0] word7 = 32'b00000000000000010000000000000001;
	reg [31:0] word8 = 32'b11110000111100001111000011110000;
	reg [31:0] word9 = 32'b11111111111111110000000000000000;
	reg [31:0] word10 = 32'b11001100110011001100110011001100;
	reg [31:0] word11 = 32'b10001000100010001000100010001000;
	reg [31:0] word12 = 32'b11101110111011101110111011101110;
	reg [31:0] word13 = 32'b10101010101010101010101010101010;
	reg [31:0] word14 = 32'b10011001100110011001100110011001;
	reg [31:0] word15 = 32'b11111111111111111111111111111111;
	
	dec4to16 decs(ins_add[3],ins_add[2],ins_add[1],ins_add  [0],outit);
	
	buf32 b0(word0,ins_dec,outit[0]),
	      b1(word1,ins_dec,outit[1]),
	      b2(word2,ins_dec,outit[2]),
	      b3(word3,ins_dec,outit[3]),
	      b4(word4,ins_dec,outit[4]),
	      b5(word5,ins_dec,outit[5]),
	      b6(word6,ins_dec,outit[6]),
	      b7(word7,ins_dec,outit[7]),
	      b8(word8,ins_dec,outit[8]),
	      b9(word9,ins_dec,outit[9]),
	      b10(word10,ins_dec,outit[10]),
	      b11(word11,ins_dec,outit[11]),
	      b12(word12,ins_dec,outit[12]),
	      b13(word13,ins_dec,outit[13]),
	      b14(word14,ins_dec,outit[14]),
	      b15(word15,ins_dec,outit[15]);
endmodule
/*---------------------------------------------------------------*/
module test;
	reg [3:0] insadd;
	wire [31:0] instr;
	
	insmem32 inss(insadd,instr);
	
	initial
	begin
	#0	insadd <= 4'b1110;
	#5	$display("Output: %b\n",instr);
	end
endmodule
