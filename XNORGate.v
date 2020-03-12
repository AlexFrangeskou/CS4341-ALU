// Yashal Saleem - CS 4341
// XNOR Gate 
module xnor16bit(out, A, B);
	input [15:0] A;
	input [15:0] B;
	output [15:0] out;
	
	// Takes the xnor of A and B
	xnor xnor1(out[0], A[0], B[0]),
		xnor2(out[1], A[1], B[1]),
		xnor3(out[2], A[2], B[2]),
		xnor4(out[3], A[3], B[3]),
		xnor5(out[4], A[4], B[4]),
		xnor6(out[5], A[5], B[5]),
		xnor7(out[6], A[6], B[6]),
		xnor8(out[7], A[7], B[7]),
		xnor9(out[8], A[8], B[8]),
		xnor10(out[9], A[9], B[9]),
		xnor11(out[10], A[10], B[10]),
		xnor12(out[11], A[11], B[11]),
		xnor13(out[12], A[12], B[12]),
		xnor14(out[13], A[13], B[13]),
		xnor15(out[14], A[14], B[14]),
		xnor16(out[15], A[15], B[15]);
endmodule

// test module
module testbench();
	reg[15:0] inputXNOR;
	reg[15:0] inputXNOR2;
	wire[15:0] outputXNOR;
	
	// xnor of the two hex values
	xnor16bit instan(outputXNOR, inputXNOR, inputXNOR2);
	
	// start display
	initial
		begin
			inputXNOR = 16'b0000000011111100;
			inputXNOR2 = 16'b1111111101010100;
			#10;
			$display("Testing of XNOR--------");
			$display("Input 1 is %b", inputXNOR);
			$display("Input 2 is %b", inputXNOR2);
			$display("Output is  %b", outputXNOR);
			$finish;
		end
endmodule
