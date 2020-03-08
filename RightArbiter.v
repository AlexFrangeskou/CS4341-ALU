// Yashal Saleem - CS 4341
// Right Arbiter (Incomplete)
module rightarbiter(out, A);
	input [15:0] A;
	output [15:0] out;
	
	// Will take the one hot number of the rightmost bit that has 1
	always @* begin
	if (A[0] == 1)
		begin
		out[0] = 1;
		end
	else if (A[1] == 1)
		out[1] = 1;
	else if (A[2] == 1)
		out[2] = 1;
	else if (A[3] == 1)
		out[3] = 1;
	else if (A[4] == 1)
		out[4] = 1;
	else if (A[5] == 1)
		out[5] = 1;
	else if (A[6] == 1)
		out[6] = 1;
	else if (A[7] == 1)
		out[7] = 1;
	else if (A[8] == 1)
		out[8] = 1;
	else if (A[9] == 1)
		out[9] = 1;
	else if (A[10] == 1)
		out[10] = 1;
	else if (A[11] == 1)
		out[11] = 1;
	else if (A[12] == 1)
		out[12] = 1;
	else if (A[13] == 1)
		out[13] = 1;
	else if (A[14] == 1)
		out[14] = 1;
	else if (A[15] == 1)
		out[15] = 1;
	end
endmodule

// test module
module testbench();
	reg [15:0] ain = 10'd20488;
	wire [15:0] aout;
	
	// Right bit arbiter
	rightarbiter pls(aout, ain);
	
	// start display
	initial
		begin
			#10;
			$display("Binary input: ", ain[0], ain[1], ain[2], ain[3], ain[4], ain[5], ain[6], ain[7], ain[8], ain[9], ain[10], ain[11], ain[12], ain[13], ain[14], ain[15]);
			$display("Arbiter output: ", aout[0], aout[1], aout[2], aout[3], aout[4], aout[5], aout[6], aout[7], aout[8], aout[9], aout[10], aout[11], aout[12], aout[13], aout[14], aout[15]);
			$finish;
		end
endmodule