module control (in5,in4,in3,in2,in1,in0,regDest,jump,aluSrc,memToReg,regWrite,memRead,memWrite,branch,aluOp1,aluOp0);
	output regDest,jump,aluSrc,memToReg,regWrite,memRead,memWrite,branch,aluOp1,aluOp0;	
	input in5,in4,in3,in2,in1,in0;
	
	not (in5_n,in5),
	    (in4_n,in4),
	    (in3_n,in3),
	    (in2_n,in2),
	    (in1_n,in1),
	    (in0_n,in0);
	    
	/*output for R instructions*/
	and (R_regDest,in5_n,in4_n,in3_n,in2_n,in1_n,in0_n),
	    (R_regWrite,in5_n,in4_n,in3_n,in2_n,in1_n,in0_n),
	    (R_aluOp1,in5_n,in4_n,in3_n,in2_n,in1_n,in0_n);
	
	/*output for lw instructions*/
	and (lw_aluSrc,in5,in4_n,in3_n,in2_n,in1,in0),
	    (lw_memToReg,in5,in4_n,in3_n,in2_n,in1,in0),
	    (lw_regWrite,in5,in4_n,in3_n,in2_n,in1,in0),
	    (lw_memRead,in5,in4_n,in3_n,in2_n,in1,in0);
	
	/*output for sw intruvtions*/
	and (sw_aluSrc,in5,in4_n,in3,in2_n,in1,in0),
	    (sw_memWrite,in5,in4_n,in3,in2_n,in1,in0);
	    
	/*output for beq instructions*/
	and (beq_branch,in5_n,in4_n,in3_n,in2,in1_n,in0_n),
	    (beq_aluOp0,in5_n,in4_n,in3_n,in2,in1_n,in0_n);
	    
	/*output for j instructions*/
	and (j_jump,in5_n,in4_n,in3_n,in2_n,in1,in0_n);
	
	/*final outputs*/
	or (regDest,R_regDest,0),
	   (jump,j_jump,0),
	   (aluSrc,lw_aluSrc,sw_aluSrc),
	   (memToReg,lw_memToReg,0),
	   (regWrite,R_regWrite,lw_regWrite),
	   (memRead,lw_memRead,0),
	   (memWrite,sw_memWrite,0),
	   (branch,beq_branch,0),
	   (aluOp1,R_aluOp1,0),
	   (aluOp0,beq_aluOp0,0);
endmodule

module testdecc;
	reg i5,i4,i3,i2,i1,i0;
	wire o1,o2,o3,o4,o5,o6,o7,o8,o9,o10;
	
	control cntrl(i5,i4,i3,i2,i1,i0,o1,o2,o3,o4,o5,o6,o7,o8,o9,o10);
	
	initial
	begin
		i5 = 1'b0;
		i4 = 1'b0;
		i3 = 1'b0;
		i2 = 1'b0;
		i1 = 1'b1;
		i0 = 1'b0;
		
		#10
		$display("o1--> %b\n", o1);
		$display("o2--> %b\n", o2);
		$display("o3--> %b\n", o3);
		$display("o4--> %b\n", o4);
		$display("o5--> %b\n", o5);
		$display("o6--> %b\n", o6);
		$display("o7--> %b\n", o7);
		$display("o8--> %b\n", o8);
		$display("o9--> %b\n", o9);
		$display("o10--> %b\n", o10);
	end
endmodule
