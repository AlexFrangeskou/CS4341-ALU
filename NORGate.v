// Yashal Saleem - CS 4341
// NOR Gate 
module nor16bit(out, A, B);
	input [15:0] A;
	input [15:0] B;
	output [15:0] out;
	
	// Takes the nor of A and B
	nor nor1(out[0], A[0], B[0]),
		nor2(out[1], A[1], B[1]),
		nor3(out[2], A[2], B[2]),
		nor4(out[3], A[3], B[3]),
		nor5(out[4], A[4], B[4]),
		nor6(out[5], A[5], B[5]),
		nor7(out[6], A[6], B[6]),
		nor8(out[7], A[7], B[7]),
		nor9(out[8], A[8], B[8]),
		nor10(out[9], A[9], B[9]),
		nor11(out[10], A[10], B[10]),
		nor12(out[11], A[11], B[11]),
		nor13(out[12], A[12], B[12]),
		nor14(out[13], A[13], B[13]),
		nor15(out[14], A[14], B[14]),
		nor16(out[15], A[15], B[15]);
endmodule

// test module
module testbench();
	reg[15:0] inputNor1;
	reg[15:0] inputNor2;
	wire[15:0] outNor;

	// Nor of these two
	nor16bit instan(outNor, inputNor1, inputNor2);
	
	// start display
	initial
		begin
			
			inputNor1 = 16'b0000000011111100;
			inputNor2 = 16'b1111111101010100;	
			#10;
			$display("Testing NOR output-------");
			$display("Input 1 is %b", inputNor1);
			$display("Input 2 is %b", inputNor2);
			$display("Output is  %b", outNor);
			$finish;
		end
endmodule
