 module nand16(in, in1, out);
    
  input [15:0] in; 			//A
  input [15:0] in1; 			//B
  output [15:0] out; 			//C	

		
  nand nand1(out[0],   in[0],  in1[0]),
       nand2(out[1],   in[1],  in1[1]),
       nand3(out[2],   in[2],  in1[2]),
       nand4(out[3],   in[3],  in1[3]),
       nand5(out[4],   in[4],  in1[4]),
       nand6(out[5],   in[5],  in1[5]),
       nand7(out[6],   in[6],  in1[6]),
       nand8(out[7],   in[7],  in1[7]),
       nand9(out[8],   in[8],  in1[8]),
       nand10(out[9],  in[9],  in1[9]),
       nand11(out[10], in[10], in1[10]),
       nand12(out[11], in[11], in1[11]),
       nand13(out[12], in[12], in1[12]),
       nand14(out[13], in[13], in1[13]),
       nand15(out[14], in[14], in1[14]),
       nand16(out[15], in[15], in1[15]);

endmodule

module main;
reg [15:0] inNand ;
reg [15:0] inNand1;
wire[15:0] outNand ;
nand16 zap(inNand, inNand1, outNand);
  initial 
    begin
   inNand = 16'b0000000011111111;
   inNand1 = 16'b1111111101010101;
    #10;
      $display("Testing 16 bit NAND-------");
      $display("operand 1 is %b", inNand);
      $display("operand 2 is %b", inNand1);
      $display("output is    %b", outNand);
      $finish ;
    end

endmodule