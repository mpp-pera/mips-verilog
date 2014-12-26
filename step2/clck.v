module clock_tick(go,clk);
	
	input go;
	output clk;
	
	reg clk;
	
	initial begin
		clk=1'b0;
	end
	
	always  begin
	
		#1000	clk <= ~clk;
			//$display("Clock: %b\n",clk);
	end
endmodule

module test;
	
	reg go;
	wire signal;
	clock_tick df(go,signal);
	
	initial
	begin
	$dumpfile("test.vcd");
    		$dumpvars(0,test);
	#0
		go=1'b1;
		$display("Time: %d----Clock: %b\n",$time,signal);
	#5	
		go=1'b1;
		$display("Time: %d----Clock: %b\n",$time,signal);
		
	#1000
		go=1'b1;
		$display("Time: %d----Clock: %b\n",$time,signal);
		
	#1000
		go=1'b1;
		$display("Time: %d----Clock: %b\n",$time,signal);
		
	#1000
		go=1'b1;
		$display("Time: %d----Clock: %b\n",$time,signal);
	
	#1000
		go=1'b1;
		$display("Time: %d----Clock: %b\n",$time,signal);
		
	#1000
		go=1'b1;
		$display("Time: %d----Clock: %b\n",$time,signal);
		
		
 end
	
	
endmodule

	
