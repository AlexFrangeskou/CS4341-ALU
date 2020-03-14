//----------------------------------------------------------------------------------------
module decoder(a, dout);

   input [3:0] a;
   output [15:0] dout;

   not invA0(nota0, a[0]);
   not invA1(nota1, a[1]);
   not invA2(nota2, a[2]);
   not invA3(nota3, a[3]);
   and and15(dout[15], a[3], a[2], a[1], a[0]);
   and and15(dout[14], a[3], a[2], a[1], nota0);
   and and15(dout[13], a[3], a[2], nota1, a[0]);
   and and15(dout[12], a[3], a[2], nota1, nota0);
   and and15(dout[11], a[3], nota2, a[1], a[0]);
   and and15(dout[10], a[3], nota2, a[1], nota0);
   and and15(dout[9], a[3], nota2, nota1, a[0]);
   and and15(dout[8], a[3], nota2, nota1, nota0);
   and and15(dout[7], nota3, a[2], a[1], a[0]);
   and and15(dout[6], nota3, a[2], a[1], nota0);
   and and15(dout[5], nota3, a[2], nota1, a[0]);
   and and15(dout[4], nota3, a[2], nota1, nota0);
   and and15(dout[3], nota3, nota2, a[1], a[0]);
   and and15(dout[2], nota3, nota2, a[1], nota0);
   and and15(dout[1], nota3, nota2, nota1, a[0]);
   and and15(dout[0], nota3, nota2, nota1, nota0);

endmodule
//----------------------------------------------------------------------------------------

//----------------------------------------------------------------------------------------
module testbench();

   reg [3:0] din;
   wire [15:0] dout;
   decoder plswork(din, dout);

   initial begin
   din = 5;

   #10;
   $display("decoder input is ", din[3], din[2], din[1], din[0]);
   $display("decoder output is ", dout[15], dout[14], dout[13], dout[12], dout[11], dout[10], dout[9], dout[8], dout[7], dout[6], dout[5], dout[4], dout[3], dout[2], dout[1], dout[0]);

   end
endmodule
//----------------------------------------------------------------------------------------
