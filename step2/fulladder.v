/*32-bit ripple carry full adder*/

//One bit full adder
module oneBitFullAdder(sum, cout, in1, in2, cin);
	
	output sum, cout;
	input in1, in2, cin;
	
	wire s1, s2, c1;	//Intermediate wires
	
	xor (s1, in1, in2);
	and (c1, in1, in2);
	
	xor (sum, s1, cin);
	
	and (s2, s1, cin);
	
	xor (cout, s2, c1);
	
endmodule

//32-bit full adder
module Bit32FullAdder(sum, cout, in1, in2, cin);

	output [31:0] sum;
	output cout;
	input [31:0] in1;
	input [31:0] in2;
	input cin;
	
	wire c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12; 
	wire c13, c14, c15, c16, c17, c18, c19, c20, c21, c22;
	wire c23, c24, c25, c26, c27, c28, c29, c30, c31;
	
	oneBitFullAdder OBA0 (sum[0], c1, in1[0], in2[0], cin);
	oneBitFullAdder OBA1 (sum[1], c2, in1[1], in2[1], c1);
	oneBitFullAdder OBA2 (sum[2], c3, in1[2], in2[2], c2);
	oneBitFullAdder OBA3 (sum[3], c4, in1[3], in2[3], c3);
	oneBitFullAdder OBA4 (sum[4], c5, in1[4], in2[4], c4);
	oneBitFullAdder OBA5 (sum[5], c6, in1[5], in2[5], c5);
	oneBitFullAdder OBA6 (sum[6], c7, in1[6], in2[6], c6);
	oneBitFullAdder OBA7 (sum[7], c8, in1[7], in2[7], c7);
	oneBitFullAdder OBA8 (sum[8], c9, in1[8], in2[8], c8);
	oneBitFullAdder OBA9 (sum[9], c10, in1[9], in2[9], c9);
	oneBitFullAdder OBA10 (sum[10], c11, in1[10], in2[10], c10);
	oneBitFullAdder OBA11(sum[11], c12, in1[11], in2[11], c11);
	oneBitFullAdder OBA12 (sum[12], c13, in1[12], in2[12], c12);
	oneBitFullAdder OBA13(sum[13], c14, in1[13], in2[13], c13);
	oneBitFullAdder OBA14(sum[14], c15, in1[14], in2[14], c14);
	oneBitFullAdder OBA15 (sum[15], c16, in1[15], in2[15], c15);
	oneBitFullAdder OBA16(sum[16], c17, in1[16], in2[16], c16);
	oneBitFullAdder OBA17 (sum[17], c18, in1[17], in2[17], c17);
	oneBitFullAdder OBA18 (sum[18], c19, in1[18], in2[18], c18);
	oneBitFullAdder OBA19 (sum[19], c20, in1[19], in2[19], c19);
	oneBitFullAdder OBA20 (sum[20], c21, in1[20], in2[20], c20);
	oneBitFullAdder OBA21 (sum[21], c22, in1[21], in2[21], c21);
	oneBitFullAdder OBA22 (sum[22], c23, in1[22], in2[22], c22);
	oneBitFullAdder OBA23 (sum[23], c24, in1[23], in2[23], c23);
	oneBitFullAdder OBA24 (sum[24], c25, in1[24], in2[24], c24);
	oneBitFullAdder OBA25 (sum[25], c26, in1[25], in2[25], c25);
	oneBitFullAdder OBA26 (sum[26], c27, in1[26], in2[26], c26);
	oneBitFullAdder OBA27 (sum[27], c28, in1[27], in2[27], c27);
	oneBitFullAdder OBA28 (sum[28], c29, in1[28], in2[28], c28);
	oneBitFullAdder OBA29 (sum[29], c30, in1[29], in2[29], c29);
	oneBitFullAdder OBA30 (sum[30], c31, in1[30], in2[30], c30);
	oneBitFullAdder OBA31 (sum[31], cout, in1[31], in2[31], c31);
	
endmodule


//Stimulus for the 32-bit full adder
module stimulus;

	reg [31:0] IN1, IN2;
	reg CIN;
	
	wire [31:0] SUM;
	wire COUT;
	
	//Instance of 32-bit adder
	Bit32FullAdder BIT32A(SUM, COUT, IN1, IN2, CIN);
	
	//Stimulate inputs
	initial
	begin
	
	IN1 = 32'b01110000000000000000000000000000;	
	IN2 = 32'b01111111111111111111111111111111; 
	CIN = 1'b0;
	
	#5
	$display("Sum: %b and Cout: %d", SUM, COUT);
	
	end
	
	
endmodule
