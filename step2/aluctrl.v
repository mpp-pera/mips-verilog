/***************ALU control unit module***************/
module buf4 (out,in,ctrl);

	output [3:0] out;
	input [3:0] in;
	input ctrl;
	
	bufif1 (out[0],in[0],ctrl),
	       (out[1],in[1],ctrl),
	       (out[2],in[2],ctrl),
	       (out[3],in[3],ctrl);
endmodule

module buf5 (out, in, ctrl);

	output [4:0] out;
	input [4:0] in;
	input ctrl;
	
	bufif1 (out[0],in[0],ctrl),
	       (out[1],in[1],ctrl),
	       (out[2],in[2],ctrl),
	       (out[3],in[3],ctrl),
	       (out[4],in[4],ctrl);
			
endmodule



module aluControlUnit(funct, aluOp, aluControl);

	output [3:0] aluControl;
	input [1:0] aluOp;
	input [5:0] funct;
	
	not (aluOpBar0, aluOp[0]),
		(aluOpBar1, aluOp[1]);
		
	not (functBar0, funct[0]),
		(functBar1, funct[1]),
		(functBar2, funct[2]),
		(functBar3, funct[3]),
		(functBar4, funct[4]),
		(functBar5, funct[5]);
		
	and (T0, aluOpBar1, aluOpBar0),
		(T1, aluOpBar1, aluOp[0]);
	
	
	and (T2, funct[5],functBar4,functBar3,functBar2,functBar1,functBar0),
		(T3, funct[5],functBar4,functBar3,functBar2,funct[1],functBar0),
		(T4, funct[5],functBar4,functBar3,funct[2],functBar1,functBar0),
		(T5, funct[5],functBar4,functBar3,funct[2],functBar1,funct[0]),
		(T6, funct[5],functBar4,funct[3],functBar2,funct[1],functBar0);
	//or (aluControl1, T0, T1, T2);
	
	reg [3:0] aluCtrl0 = 4'b0000;   
	reg [3:0] aluCtrl1 = 4'b0001;
	reg [3:0] aluCtrl2 = 4'b0010;
	reg [3:0] aluCtrl3 = 4'b0110;   //Only up to subtract for now
	
	/*For data transfer and conditional branch*/
	buf4 b4_0(aluControl,aluCtrl2,T0),
		 b4_1(aluControl,aluCtrl3,T1);
	/*For R-type*/	 
	buf4 b4_2(aluControl,aluCtrl2, T2),
		 b4_3(aluControl,aluCtrl3, T3),
		 b4_4(aluControl,aluCtrl0, T4),
		 b4_5(aluControl,aluCtrl1, T5);
		 
endmodule

module stimulus;

	reg [5:0] funct;
	reg [1:0] aluOp;
	wire [3:0] aluControl;
	
	aluControlUnit a1(funct, aluOp, aluControl);
	
	initial
	begin
	
	aluOp = 2'b01;
	funct = 6'b000000;
	
	#5
	$display("Control for %b: %b", aluOp, aluControl);
	
	
	end
	

endmodule





