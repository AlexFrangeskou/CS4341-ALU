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
module testbench();

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

   end
endmodule
//-----------------------------------------------------------------------
























