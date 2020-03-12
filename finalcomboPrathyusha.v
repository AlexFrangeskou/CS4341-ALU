//----------------------------------------------------------------------
module Add_half (input a, b, output c_out, sum);
   xor G1(sum, a, b);	 
   and G2(c_out, a, b);
endmodule
//----------------------------------------------------------------------

//----------------------------------------------------------------------
module Add_full (input a, b, c_in, output c_out, sum);
   wire w1, w2, w3;	 
   Add_half M1 (a, b, w1, w2);
   Add_half M0 (w2, c_in, w3, sum);
   or (c_out, w1, w3);
endmodule
//----------------------------------------------------------------------

//----------------------------------------------------------------------
module adder16(a, b, c, s, ovf);
   
   input [15:0] a; // first number
   input [15:0] b; // second number  
   output [16:0] c;
   output [15:0] s;	
   output ovf;
        
        and(d, 0, 0);
        Add_full first(a[0], b[0], d, c[1], s[0]); 
       Add_full second(a[1], b[1], c[1], c[2], s[1]);
        Add_full third(a[2], b[2], c[2], c[3], s[2]);
       Add_full fourth(a[3], b[3], c[3], c[4], s[3]); 
        Add_full fifth(a[4], b[4], c[4], c[5], s[4]); 
        Add_full sixth(a[5], b[5], c[5], c[6], s[5]);
      Add_full seventh(a[6], b[6], c[6], c[7], s[6]);
       Add_full eighth(a[7], b[7], c[7], c[8], s[7]); 
        Add_full ninth(a[8], b[8], c[8], c[9], s[8]); 
        Add_full tenth(a[9], b[9], c[9], c[10], s[9]);
     Add_full eleventh(a[10], b[10], c[10], c[11], s[10]);
      Add_full twelfth(a[11], b[11], c[11], c[12], s[11]); 
   Add_full thirteenth(a[12], b[12], c[12], c[13], s[12]); 
   Add_full fourteenth(a[13], b[13], c[13], c[14], s[13]);
    Add_full fifteenth(a[14], b[14], c[14], c[15], s[14]);
    Add_full sixteenth(a[15], b[15], c[15], c[16], s[15]); 

   xnor(v, a[15], b[15]);
   xor(w, b[15], s[15]);
   and(ovf, v, w);

endmodule
//----------------------------------------------------------------------

//-------------------------------------------------------------
module subtractor16(a, b, c, s, ovf);   
      
   input [15:0] a; // first number
   input [15:0] b; // second number
   output [16:0] c;
   output [15:0] s;
   output ovf;
   
   and(m, 1, 1);
   xor x0(d, m, b[0]); // xor m with b[0]
   xor x1(e, m, b[1]); // xor m with b[1]
   xor x2(f, m, b[2]); // xor m with b[2]
   xor x3(g, m, b[3]); // xor m with b[3]
   xor x4(h, m, b[4]); // xor m with b[4]
   xor x5(i, m, b[5]); // xor m with b[5]
   xor x6(j, m, b[6]); // xor m with b[6]                             
   xor x7(k, m, b[7]); // xor m with b[7]
   xor x8(l, m, b[8]); // xor m with b[8]
   xor x9(n, m, b[9]); // xor m with b[9]
   xor x10(o, m, b[10]); // xor m with b[10]
   xor x11(p, m, b[11]); // xor m with b[11]
   xor x12(q, m, b[12]); // xor m with b[12]
   xor x13(r, m, b[13]); // xor m with b[13]
   xor x14(t, m, b[14]); // xor m with b[14]
   xor x15(u, m, b[15]); // xor m with b[15]
   
        Add_full first(a[0], d, m, c[1], s[0]); 
       Add_full second(a[1], e, c[1], c[2], s[1]);
        Add_full third(a[2], f, c[2], c[3], s[2]);
       Add_full fourth(a[3], g, c[3], c[4], s[3]); 
        Add_full fifth(a[4], h, c[4], c[5], s[4]); 
        Add_full sixth(a[5], i, c[5], c[6], s[5]);
      Add_full seventh(a[6], j, c[6], c[7], s[6]);
       Add_full eighth(a[7], k, c[7], c[8], s[7]); 
        Add_full ninth(a[8], l, c[8], c[9], s[8]); 
        Add_full tenth(a[9], n, c[9], c[10], s[9]);
     Add_full eleventh(a[10], o, c[10], c[11], s[10]);
      Add_full twelfth(a[11], p, c[11], c[12], s[11]); 
   Add_full thirteenth(a[12], q, c[12], c[13], s[12]); 
   Add_full fourteenth(a[13], r, c[13], c[14], s[13]);
    Add_full fifteenth(a[14], t, c[14], c[15], s[14]);
    Add_full sixteenth(a[15], u, c[15], c[16], s[15]); 

   xor(v, a[15], d);
   xnor(w, d, s[15]);
   and(ovf, v, w);

endmodule
//----------------------------------------------------------------------

//----------------------------------------------------------------------
module decoder(a, d);

   input [3:0] a;
   output [15:0] d;

   not invA0(nota0, a[0]);
   not invA1(nota1, a[1]);
   not invA2(nota2, a[2]);
   not invA3(nota3, a[3]);
   and and15(d[15], a[3], a[2], a[1], a[0]);
   and and15(d[14], a[3], a[2], a[1], nota0);
   and and15(d[13], a[3], a[2], nota1, a[0]);
   and and15(d[12], a[3], a[2], nota1, nota0);
   and and15(d[11], a[3], nota2, a[1], a[0]);
   and and15(d[10], a[3], nota2, a[1], nota0);
   and and15(d[9], a[3], nota2, nota1, a[0]);
   and and15(d[8], a[3], nota2, nota1, nota0);
   and and15(d[7], nota3, a[2], a[1], a[0]);
   and and15(d[6], nota3, a[2], a[1], nota0);
   and and15(d[5], nota3, a[2], nota1, a[0]);
   and and15(d[4], nota3, a[2], nota1, nota0);
   and and15(d[3], nota3, nota2, a[1], a[0]);
   and and15(d[2], nota3, nota2, a[1], nota0);
   and and15(d[1], nota3, nota2, nota1, a[0]);
   and and15(d[0], nota3, nota2, nota1, nota0);

endmodule
//----------------------------------------------------------------------

//----------------------------------------------------------------------
module encoder(a, e);

   input [15:0] a;
   output [3:0] e;
   wire v, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15;
   wire [3:0] unknown;
 
   assign v15= a[15]&~a[14]&~a[13]&~a[12]&~a[11]&~a[10]&~a[9]&~a[8]&~a[7]&~a[6]&~a[5]&~a[4]&~a[3]&~a[2]&~a[1]&~a[0];
   assign v14= ~a[15]&a[14]&~a[13]&~a[12]&~a[11]&~a[10]&~a[9]&~a[8]&~a[7]&~a[6]&~a[5]&~a[4]&~a[3]&~a[2]&~a[1]&~a[0];
   assign v13= ~a[15]&~a[14]&a[13]&~a[12]&~a[11]&~a[10]&~a[9]&~a[8]&~a[7]&~a[6]&~a[5]&~a[4]&~a[3]&~a[2]&~a[1]&~a[0];
   assign v12= ~a[15]&~a[14]&~a[13]&a[12]&~a[11]&~a[10]&~a[9]&~a[8]&~a[7]&~a[6]&~a[5]&~a[4]&~a[3]&~a[2]&~a[1]&~a[0];
   assign v11= ~a[15]&~a[14]&~a[13]&~a[12]&a[11]&~a[10]&~a[9]&~a[8]&~a[7]&~a[6]&~a[5]&~a[4]&~a[3]&~a[2]&~a[1]&~a[0];
   assign v10= ~a[15]&~a[14]&~a[13]&~a[12]&~a[11]&a[10]&~a[9]&~a[8]&~a[7]&~a[6]&~a[5]&~a[4]&~a[3]&~a[2]&~a[1]&~a[0];
   assign v9 = ~a[15]&~a[14]&~a[13]&~a[12]&~a[11]&~a[10]&a[9]&~a[8]&~a[7]&~a[6]&~a[5]&~a[4]&~a[3]&~a[2]&~a[1]&~a[0];
   assign v8 = ~a[15]&~a[14]&~a[13]&~a[12]&~a[11]&~a[10]&~a[9]&a[8]&~a[7]&~a[6]&~a[5]&~a[4]&~a[3]&~a[2]&~a[1]&~a[0];
   assign v7 = ~a[15]&~a[14]&~a[13]&~a[12]&~a[11]&~a[10]&~a[9]&~a[8]&a[7]&~a[6]&~a[5]&~a[4]&~a[3]&~a[2]&~a[1]&~a[0];
   assign v6 = ~a[15]&~a[14]&~a[13]&~a[12]&~a[11]&~a[10]&~a[9]&~a[8]&~a[7]&a[6]&~a[5]&~a[4]&~a[3]&~a[2]&~a[1]&~a[0];
   assign v5 = ~a[15]&~a[14]&~a[13]&~a[12]&~a[11]&~a[10]&~a[9]&~a[8]&~a[7]&~a[6]&a[5]&~a[4]&~a[3]&~a[2]&~a[1]&~a[0];
   assign v4 = ~a[15]&~a[14]&~a[13]&~a[12]&~a[11]&~a[10]&~a[9]&~a[8]&~a[7]&~a[6]&~a[5]&a[4]&~a[3]&~a[2]&~a[1]&~a[0];
   assign v3 = ~a[15]&~a[14]&~a[13]&~a[12]&~a[11]&~a[10]&~a[9]&~a[8]&~a[7]&~a[6]&~a[5]&~a[4]&a[3]&~a[2]&~a[1]&~a[0];
   assign v2 = ~a[15]&~a[14]&~a[13]&~a[12]&~a[11]&~a[10]&~a[9]&~a[8]&~a[7]&~a[6]&~a[5]&~a[4]&~a[3]&a[2]&~a[1]&~a[0];
   assign v1 = ~a[15]&~a[14]&~a[13]&~a[12]&~a[11]&~a[10]&~a[9]&~a[8]&~a[7]&~a[6]&~a[5]&~a[4]&~a[3]&~a[2]&a[1]&~a[0];
   assign v0 = ~a[15]&~a[14]&~a[13]&~a[12]&~a[11]&~a[10]&~a[9]&~a[8]&~a[7]&~a[6]&~a[5]&~a[4]&~a[3]&~a[2]&~a[1]&a[0];

   assign v = v15|v14|v13|v12|v11|v10|v9|v8|v7|v6|v5|v4|v3|v2|v1|v0;

   or(e[0], a[1], a[3], a[5], a[7], a[9], a[11], a[13], a[15]);
   or(e[1], a[2], a[3], a[6], a[7], a[10], a[11], a[14], a[15]);
   or(e[2], a[4], a[5], a[6], a[7], a[12], a[13], a[14], a[15]);
   or(e[3], a[8], a[9], a[10], a[11], a[12], a[13], a[14], a[15]);

   assign e = (v) ? unknown : e ;

endmodule
//----------------------------------------------------------------------

//----------------------------------------------------------------------
module division(a, b, q, r);

   input [15:0] a, b;
   output [15:0] q, r;
   
   assign r = a%b;
   assign q = a/b;

endmodule   
//----------------------------------------------------------------------

//----------------------------------------------------------------------
module testbench();

   // Addition variables and calls
   reg [15:0] aadd; // first number
   reg [15:0] badd; // second number
   reg [15:0] dadd; // first number
   reg [15:0] eadd; // second number
   wire [15:0] sadd; // sum wire
   wire [16:0] cadd; // carry wire
   wire [15:0] sadd1; // sum wire
   wire [16:0] cadd1; // carry wire
   wire ovfadd, ovfadd1;

   adder16 pls(aadd, badd, cadd, sadd, ovfadd);
   adder16 pls2(dadd, eadd, cadd1, sadd1, ovfadd1);
   
   // Subtraction variables and calls
   reg [15:0] asub; // first number
   reg [15:0] bsub; // second number
   reg [15:0] dsub; // first number
   reg [15:0] esub; // second number
   wire [15:0] ssub; // difference wire
   wire [16:0] csub; // carry wire
   wire [15:0] ssub1; // difference wire
   wire [16:0] csub1; // carry wire
   wire ovfsub, ovfsub1;

   subtractor16 plswork(asub, bsub, csub, ssub, ovfsub);
   subtractor16 plswork2(dsub, esub, csub1, ssub1, ovfsub1);

   // Decoder variables and calls
   reg [3:0] din;
   wire [15:0] dout;

   decoder pls3(din, dout);
   
   // Encoder variables and calls
   wire [3:0] eout1;
   reg [15:0] ein1;
   encoder pls4(ein1, eout1);

   wire [3:0] eout2;
   reg [15:0] ein2;
   encoder pls5(ein2, eout2);

   // Dvision variables and calls
   reg [15:0] adiv; // first number
   reg [15:0] bdiv; // second number
   wire [15:0] quotient;
   wire [15:0] remainder;

   division pls16(adiv, bdiv, quotient, remainder);
   

   // Start of testbench code
   initial begin
   aadd=32767;
   badd=32767;
   dadd=1230;
   eadd=22135;

   asub = 32767;
   bsub = -24576;
   dsub = 25;
   esub = 35;

   din = 13;

   ein1 = 128;
   ein2 = 2543;

   adiv = 256;
   bdiv = 240;

   
   #10;
   $display(" ");
   $display("Testing 16 bit Addition");
   $display("==============================================");
   $display("Value of a = %b", aadd);
   $display("Value of b = %b", badd);
   #10;
   $display("Sum of a and b = %b", sadd);
   
   if (ovfadd == 1)
      $display("Overflow: Yes");
   else
      $display("Overflow: No");

   $display("Value of d = %b", dadd);
   $display("Value of e = %b", eadd);
   #10;
   $display("Sum of d and e = %b", sadd1);

   if (ovfadd1 == 1)
      $display("Overflow: Yes");
   else
      $display("Overflow: No");

   #10;
   $display(" ");
   $display("Testing 16 bit Subtraction");
   $display("==============================================");
   $display("Value of a = %b", asub);
   $display("Value of b = %b", bsub);
   #10;
   $display("Difference of a and b = %b", ssub);

   if (ovfsub == 1)
      $display("Overflow: Yes");
   else
      $display("Overflow: No");

   $display("Value of d = %b", dsub);
   $display("Value of e = %b", esub);
   #10;
   $display("Difference of d and e = %b", ssub1);

   if (ovfsub1 == 1)
      $display("Overflow: Yes");
   else
      $display("Overflow: No");

   #10;
   $display(" ");
   $display("Testing 4-16 Decoder");
   $display("==============================================");
   $display("Decoder input is %b", din);
   $display("Decoder output is %b", dout);

   #10;
   $display(" ");
   $display("Testing 16-4 Encoder");
   $display("==============================================");
   $display("Encoder input ein1 is %b", ein1);
   $display("Encoder output eout1 is %b", eout1);
   $display("Encoder input ein2 is %b", ein2);
   $display("Encoder output eout2 is %b", eout2);

   #10;
   $display(" ");
   $display("Testing 16 bit Division");
   $display("==============================================");
   $display("Value of dividend = %b", adiv);
   $display("Value of divisor  = %b", bdiv);
   $display("Value of quotient = %b", quotient);
   $display("Value of remainder = %b", remainder);
   end
endmodule
//-----------------------------------------------------------------------