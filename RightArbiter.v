// Yashal Saleem - CS 4341
// Right Arbiter 
module rightarbiter(out, A);
	// The parameter here will be the number of bits the arbiter will take in. This can be adjusted to whatever number of bit inputs you like
	parameter n = 16;
	
	input [n-1:0] A;
	output [n-1:0] out;
	
	// The cas interface here will be used to do the arbiter logic. This should return a one hot number of the least significant 1 bit
	wire [n-1:0] cas = {(~A[n-2:0] & cas[n-2:0]), 1'b1};
	assign out = A & cas;
endmodule

// test module
module testbench();
	reg [15:0] inputRArb = 15'b0000010000000101;
	wire [15:0] outputRArb;
	
	// Right Arbiter instance
	rightarbiter instan(outputRArb, inputRArb);
	
	// start display
	initial
		begin
			#10;
			$display("Testing right arbiter---------");
			$display("Input is %b", inputRArb);
			$display("Output is %b", outputRArb);
			$finish;
		end
endmodule
