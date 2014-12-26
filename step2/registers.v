//2x4 decoder with enable
module decoder2x4 (in1,in0,enable,out0,out1,out2,out3);
	output out0,out1,out2,out3;
	input in1,in0,enable;
	
	not (in1_n,in1), (in0_n,in0);
	
	and (out0, in1_n, in0_n, enable),
	    (out1, in1_n, in0, enable),
	    (out2, in1, in0_n, enable),
	    (out3, in1, in0, enable);
endmodule
//3x8 decoder with enable
module decoder3x8 (in2,in1,in0,enable,out0,out1,out2,out3,out4,out5,out6,out7);
	output out0,out1,out2,out3,out4,out5,out6,out7;
	input in2,in1,in0,enable;
	
	not (in2_n,in2);
	
	and (en1,in2_n,enable),
	    (en2,in2,enable);
	    
	decoder2x4 dec1 (in1,in0,en1,out0,out1,out2,out3);
	decoder2x4 dec2 (in1,in0,en2,out4,out5,out6,out7);
	
endmodule
//5x32 decoder---->>> check the enable signal
module decoder5x32 (in4,in3,in2,in1,in0,enable,out0,out1,out2,out3,out4,out5,out6,out7,
                    out8,out9,out10,out11,out12,out13,out14,out15,
                    out16,out17,out18,out19,out20,out21,out22,out23,
                    out24,out25,out26,out27,out28,out29,out30,out31);
                    
        output out0,out1,out2,out3,out4,out5,out6,out7,
                    out8,out9,out10,out11,out12,out13,out14,out15,
                    out16,out17,out18,out19,out20,out21,out22,out23,
                    out24,out25,out26,out27,out28,out29,out30,out31;
                    
        input in4,in3,in2,in1,in0,enable;
        
        decoder2x4 dec (in4,in3,enable,en1,en2,en3,en4);
        
        decoder3x8 dec1 (in2,in1,in0,en1,out0,out1,out2,out3,out4,out5,out6,out7);
        decoder3x8 dec2 (in2,in1,in0,en2,out8,out9,out10,out11,out12,out13,out14,out15);
        decoder3x8 dec3 (in2,in1,in0,en3,out16,out17,out18,out19,out20,out21,out22,out23);
        decoder3x8 dec4 (in2,in1,in0,en4,out24,out25,out26,out27,out28,out29,out30,out31);
endmodule
        
//registers

module registers (read_reg1, read_reg2, write_data, read_data1, read_data2, write_to_reg, reg_write);
 	output [31:0] read_data1, read_data2;
 	input [31:0] write_data;
 	input write_to_reg, reg_write;
 	input [4:0] read_reg1, read_reg2;
 	
 	reg [31:0] r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,r16,r17,r18,r19,r20,r21,r22,r23,r24,r25,r26,r27,r28,r29,r30,r31;
 	
 	wire o0,o1,o2,o3,o4,o5,o6,o7,o8,o9,o10,o11,o12,o13,o14,o15,o16,o17,o18,o19,o20,o21,o22,o23,o24,o25,o26,o27,o28,o29,o30,o31;
 	
 	
 	
module test;
	reg in4,in3,in2,in1,in0,enable;
	wire out0,out1,out2,out3,out4,out5,out6,out7,out8,out9,out10,out11,out12,out13,out14,out15,
                    out16,out17,out18,out19,out20,out21,out22,out23,
                    out24,out25,out26,out27,out28,out29,out30,out31;
	
	decoder5x32 dec (in4,in3,in2, in1, in0, enable, out0, out1, out2, out3, out4,out5,out6,out7,out8,out9,out10,out11,out12,out13,out14,out15,
                    out16,out17,out18,out19,out20,out21,out22,out23,
                    out24,out25,out26,out27,out28,out29,out30,out31);
	initial 
	begin
		#0
		in4 <= 1'b1;
		in3 <= 1'b1;
		in2 <= 1'b1;
		in1 <= 1'b1;
		in0 <= 1'b0;
		enable <= 1'b1;
		#10
		$display("Output-  -> %b\n", out30);
	end
endmodule	
	
