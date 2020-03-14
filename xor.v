module xor4(out,in1,in2);
	input [3:0] in1, in2;
	output [3:0] out;

	xor t1(out[3], in1[3], in2[3]),
		t2(out[2], in1[2], in2[2]),
		t3(out[1], in1[1], in2[1]),
		t4(out[0], in1[0], in2[0]);
endmodule

// Test for xor4, uncomment module main for testing
/*
module main;
reg[3:0] in1;
reg[3:0] in2;
wire[3:0] out1;
xor4 zap(out1,in1,in2);
  initial 
    begin
    in1 = 5;
    in2 = 2;
    #10
      $display("Hello, World");
      $display("%b", in1);
      $display("%b", in2);
      $display("%b", out1);
      $finish ;
    end
endmodule
*/

//-----------------------

module xor8(out,in1,in2);
	input [7:0] in1, in2;
	output [7:0] out;

	xor4 t1(out[7:4], in1[7:4], in2[7:4]),
		 t2(out[3:0], in1[3:0], in2[3:0]);
endmodule

// Test for xor8, uncomment module main2 for testing
/*
module main2;
reg[7:0] in3;
reg[7:0] in4;
wire[7:0] out2;
xor8 zap(out2,in3,in4);
  initial 
    begin
    in3 = 14;
    in4 = 14;
    #10
      $display("Hello, World");
      $display("%b", in3);
      $display("%b", in4);
      $display("%b", out2);
      $finish ;
    end

endmodule
*/

//-----------------------


module xor16(out,in1,in2);
	input [15:0] in1, in2;
	output [15:0] out;

	xor8 t1(out[15:8], in1[15:8], in2[15:8]),
		t2(out[7:0], in1[7:0], in2[7:0]);
endmodule

// Test for and16, uncomment module main3 for testing
module main3;
reg[15:0] inputXor;
reg[15:0] inputXor1;
wire[15:0] outputXor;
xor16 zap(outputXor,inputXor,inputXor1);
  initial 
    begin
    inputXor = 16'b0000000011111100;
    inputXor1 = 16'b1111111101010100;
    #10
      $display("Test of 16 bit XOR gate");
      $display("%b", inputXor);
      $display("%b", inputXor1);
      $display("%b", outputXor);
      $finish ;
    end

endmodule

