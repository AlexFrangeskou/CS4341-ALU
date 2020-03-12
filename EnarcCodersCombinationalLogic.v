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

//----------------------------------------------------------------------
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
module testbench();


    
    /*TEST OF THE 16 bit Adder
    **********************************
    **********************************
    **********************************/


   reg [15:0] a; // first number
   reg [15:0] b; // second number
   reg [15:0] d; // first number
   reg [15:0] e; // second number
   wire [15:0] s; // sum wire
   wire [16:0] c1; // carry wire
   wire [15:0] s1; // sum wire
   wire [16:0] c; // carry wire
   wire ovfadd, ovfadd1;

   adder16 pls(a, b, c, s, ovfadd);
   adder16 pls2(d, e, c1, s1, ovfadd1);

   //FOR SUBTRACTOR
    wire ovfsub, ovfsub1;

   subtractor16 plswork(a, b, c, s, ovfsub);
   subtractor16 plswork2(d, e, c1, s1, ovfsub1);

   initial begin
   a=32767;
   b=32767;
   d=1230;
   e=22135;

   #10;
   $display("Value of a = %b", a);
   $display("Value of b = %b", b);
   #10;
   $display("Sum of a and b = %b", s);
   
   if (ovfadd == 1)
      $display("Overflow: Yes");
   else
      $display("Overflow: No");

   $display("Value of d = %b", d);
   $display("Value of e = %b", e);
   #10;
   $display("Sum of d and e = %b", s1);

   if (ovfadd1 == 1)
      $display("Overflow: Yes");
   else
      $display("Overflow: No");


    #10;
   a = 32767;
   b = -24576;
   d = 25;
   e = 35;

   #10;
   $display("Value of a = %b", a);
   $display("Value of b = %b", b);
   #10;
   $display("Difference of a and b = %b", s);

   if (ovfsub == 1)
      $display("Overflow: Yes");
   else
      $display("Overflow: No");

   $display("Value of d = %b", d);
   $display("Value of e = %b", e);
   #10;
   $display("Difference of d and e = %b", s1);

   if (ovfsub1 == 1)
      $display("Overflow: Yes");
   else
      $display("Overflow: No");

   end
endmodule
//-----------------------------------------------------------------------
























