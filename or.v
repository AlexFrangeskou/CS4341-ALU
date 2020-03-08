 module or16(in, in1, out);
    
  input [15:0] in; 			//A
  input [15:0] in1; 			//B
  output [15:0] out; 			//C	

		
  or or1(out[0],   in[0],  in1[0]),
     or2(out[1],   in[1],  in1[1]),
     or3(out[2],   in[2],  in1[2]),
     or4(out[3],   in[3],  in1[3]),
     or5(out[4],   in[4],  in1[4]),
     or6(out[5],   in[5],  in1[5]),
     or7(out[6],   in[6],  in1[6]),
     or8(out[7],   in[7],  in1[7]),
     or9(out[8],   in[8],  in1[8]),
     or10(out[9],  in[9],  in1[9]),
     or11(out[10], in[10], in1[10]),
     or12(out[11], in[11], in1[11]),
     or13(out[12], in[12], in1[12]),
     or14(out[13], in[13], in1[13]),
     or15(out[14], in[14], in1[14]),
     or16(out[15], in[15], in1[15]);

endmodule

module main;
reg [15:0] in;
reg [15:0] in1;
wire[15:0] out;
or16 zap(in, in1, out);
  initial 
    begin
   in = 3589;
   in1 = 26235;
    #10;
      $display(in[15], in[14], in[13], in[12], in[11], in[10], in[9], in[8], 
               in[7], in[6], in[5], in[4], in[3], in[2], in[1], in[0]);

      $display(in1[15], in1[14], in1[13], in1[12], in1[11], in1[10], in1[9], in1[8],
	       in1[7], in1[6], in1[5], in1[4], in1[3], in1[2], in1[1], in1[0]);

      $display(out[15], out[14], out[13], out[12], out[11], out[10], out[9], out[8],
	       out[7], out[6], out[5], out[4], out[3], out[2], out[1], out[0]);
      $finish ;
    end

endmodule