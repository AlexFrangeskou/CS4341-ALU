module leftarbiter(out, A);
	// The parameter here will be the number of bits the arbiter will take in. This can be adjusted to whatever number of bit inputs you like
	parameter n = 16;
	
	input [n-1:0] A;
	output [n-1:0] out;
	
	// The cas interface here will be used to do the arbiter logic. This should return a one hot number of the most significant 1 bit
	wire [n-1:0] cas = {1'b1, (~A[n-1:1] & cas[n-1:1])};
	assign out = A & cas;
endmodule

// test module
module testbench();
	reg [15:0] inputLarb = a6'b0000010000000000;
	wire [15:0] outputLarb;
	
	// Right Arbiter instance
	leftarbiter instan(outputLarb, inputLarb);
	
	// start display
	initial
		begin
			#10;
			$display("Left Arbiter Test---------");
			$display("Input is  %b", inputLarb);
			$display("Output is %b", outputLarb);
			$finish;
		end
endmodule