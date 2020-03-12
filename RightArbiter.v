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
	reg [15:0] ain = 4306;
	wire [15:0] aout;
	
	// Right Arbiter instance
	rightarbiter instan(aout, ain);
	
	// start display
	initial
		begin
			#10;
			$display("Right Arbiter Test");
			$display("Input is %b", ain);
			$display("Output is %b", aout);
			$finish;
		end
endmodule
