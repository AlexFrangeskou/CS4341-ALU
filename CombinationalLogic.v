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

module and4(out,in1,in2);
	input [3:0] in1, in2;
	output [3:0] out;

	and t1(out[3], in1[3], in2[3]),
		t2(out[2], in1[2], in2[2]),
		t3(out[1], in1[1], in2[1]),
		t4(out[0], in1[0], in2[0]);
endmodule

module and8(out,in1,in2);
	input [7:0] in1, in2;
	output [7:0] out;

	and4 t1(out[7:4], in1[7:4], in2[7:4]),
		 t2(out[3:0], in1[3:0], in2[3:0]);
endmodule

module and16(out,in1,in2);
	input [15:0] in1, in2;
	output [15:0] out;

	and8 t1(out[15:8], in1[15:8], in2[15:8]),
		t2(out[7:0], in1[7:0], in2[7:0]);
endmodule



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
module inv16(in, out);
    
  input [15:0] in;
  output [15:0] out;
  not not1(out[0], in[0]),
    not2(out[1], in[1]),
    not3(out[2], in[2]),
    not4(out[3], in[3]),
    not5(out[4], in[4]),
    not6(out[5], in[5]),
    not7(out[6], in[6]),
    not8(out[7], in[7]),
    not9(out[8], in[8]),
    not10(out[9], in[9]),
    not11(out[10], in[10]),
    not12(out[11], in[11]),
    not13(out[12], in[12]),
    not14(out[13], in[13]),
    not15(out[14], in[14]),
    not16(out[15], in[15]);
endmodule
//----------------------------------------------------------------------

//----------------------------------------------------------------------

module leftarbiter(out, A);
	// The parameter here will be the number of bits the arbiter will take in. This can be adjusted to whatever number of bit inputs you like
	parameter n = 16;
	
	input [n-1:0] A;
	output [n-1:0] out;
	
	// The cas interface here will be used to do the arbiter logic. This should return a one hot number of the most significant 1 bit
	wire [n-1:0] cas = {1'b1, (~A[n-1:1] & cas[n-1:1])};
	assign out = A & cas;
endmodule
//----------------------------------------------------------------------

//----------------------------------------------------------------------
module Multiplexer(Ch15,Ch14,Ch13,Ch12,Ch11,Ch10,Ch9,Ch8,Ch7,Ch6,Ch5,Ch4,Ch3,Ch2, Ch1, Ch0, s, b);
  parameter bus_size = 16 ;
  input [bus_size-1:0] Ch15,Ch14,Ch13,Ch12,Ch11,Ch10,Ch9,Ch8,Ch7,Ch6,Ch5,Ch4,Ch3,Ch2, Ch1, Ch0 ;  // inputs
  input [15:0] s ; // one-hot select
  output[bus_size-1:0] b ;
  assign b = 
  ({bus_size{s[15]}} & Ch15) | 
  ({bus_size{s[14]}} & Ch14) | 
  ({bus_size{s[13]}} & Ch13) | 
  ({bus_size{s[12]}} & Ch12) |   
  ({bus_size{s[11]}} & Ch11) |   
  ({bus_size{s[10]}} & Ch10) | 
  ({bus_size{s[9]}} & Ch9) |
  ({bus_size{s[8]}} & Ch8) |
  ({bus_size{s[7]}} & Ch7) | 
  ({bus_size{s[6]}} & Ch6) | 
  ({bus_size{s[5]}} & Ch5) | 
  ({bus_size{s[4]}} & Ch4) |   
  ({bus_size{s[3]}} & Ch3) |   
  ({bus_size{s[2]}} & Ch2) | 
  ({bus_size{s[1]}} & Ch1) |
  ({bus_size{s[0]}} & Ch0) ;
endmodule // Mux16Channel
//----------------------------------------------------------------------

 //multiplier
   module HalfAdder1Bit(a,b,c,s) ;
  input a,b ;
  output c,s ;  // carry and sum
  assign s = a ^ b ;
  assign c = a & b ;
endmodule

//4bit adder
module add_4_bit(a,b,s);
parameter size=4;
input [size-1:0] a;
input [size-1:0] b;
output [size-1:0] s;
wire  carry[3:0];

HalfAdder1Bit ha1(a[0],b[0],carry[0],s[0]);
HalfAdder1Bit ha2(a[1],b[1],carry[1],s[1]);
HalfAdder1Bit ha3(a[2],b[2],carry[2],s[2]);
HalfAdder1Bit ha4(a[3],b[3],carry[3],s[3]);


endmodule

//6bit adder
module add_6_bit(a,b,s);
parameter size=6;
input [size-1:0] a;
input [size-1:0] b;
output [size-1:0] s;
wire  carry[5:0];

HalfAdder1Bit ha1(a[0],b[0],carry[0],s[0]);
HalfAdder1Bit ha2(a[1],b[1],carry[1],s[1]);
HalfAdder1Bit ha3(a[2],b[2],carry[2],s[2]);
HalfAdder1Bit ha4(a[3],b[3],carry[3],s[3]);
HalfAdder1Bit ha5(a[4],b[4],carry[4],s[4]);
HalfAdder1Bit ha6(a[5],b[5],carry[5],s[5]);

endmodule

//8bit adder
module add_8_bit(a,b,s);
parameter size=8;
input [size-1:0] a;
input [size-1:0] b;
output [size-1:0] s;
wire  carry[7:0];

HalfAdder1Bit ha1(a[0],b[0],carry[0],s[0]);
HalfAdder1Bit ha2(a[1],b[1],carry[1],s[1]);
HalfAdder1Bit ha3(a[2],b[2],carry[2],s[2]);
HalfAdder1Bit ha4(a[3],b[3],carry[3],s[3]);
HalfAdder1Bit ha5(a[4],b[4],carry[4],s[4]);
HalfAdder1Bit ha6(a[5],b[5],carry[5],s[5]);
HalfAdder1Bit ha7(a[6],b[6],carry[6],s[6]);
HalfAdder1Bit ha8(a[7],b[7],carry[7],s[7]);


endmodule


//12bit adder
module add_12_bit(a,b,s);
parameter size=12;
input [size-1:0] a;
input [size-1:0] b;
output [size-1:0] s;
wire  carry[11:0];

HalfAdder1Bit ha1(a[0],b[0],carry[0],s[0]);
HalfAdder1Bit ha2(a[1],b[1],carry[1],s[1]);
HalfAdder1Bit ha3(a[2],b[2],carry[2],s[2]);
HalfAdder1Bit ha4(a[3],b[3],carry[3],s[3]);
HalfAdder1Bit ha5(a[4],b[4],carry[4],s[4]);
HalfAdder1Bit ha6(a[5],b[5],carry[5],s[5]);
HalfAdder1Bit ha7(a[6],b[6],carry[6],s[6]);
HalfAdder1Bit ha8(a[7],b[7],carry[7],s[7]);
HalfAdder1Bit ha9(a[8],b[8],carry[8],s[8]);
HalfAdder1Bit ha10(a[9],b[9],carry[9],s[9]);
HalfAdder1Bit ha11(a[10],b[10],carry[10],s[10]);
HalfAdder1Bit ha12(a[11],b[11],carry[11],s[11]);

endmodule

//16bit adder
module add_16_bit(a,b,s);
parameter size=16;
input [size-1:0] a;
input [size-1:0] b;
output [size-1:0] s;
wire  carry[15:0];

HalfAdder1Bit ha1(a[0],b[0],carry[0],s[0]);
HalfAdder1Bit ha2(a[1],b[1],carry[1],s[1]);
HalfAdder1Bit ha3(a[2],b[2],carry[2],s[2]);
HalfAdder1Bit ha4(a[3],b[3],carry[3],s[3]);
HalfAdder1Bit ha5(a[4],b[4],carry[4],s[4]);
HalfAdder1Bit ha6(a[5],b[5],carry[5],s[5]);
HalfAdder1Bit ha7(a[6],b[6],carry[6],s[6]);
HalfAdder1Bit ha8(a[7],b[7],carry[7],s[7]);
HalfAdder1Bit ha9(a[8],b[8],carry[8],s[8]);
HalfAdder1Bit ha10(a[9],b[9],carry[9],s[9]);
HalfAdder1Bit ha11(a[10],b[10],carry[10],s[10]);
HalfAdder1Bit ha12(a[11],b[11],carry[11],s[11]);
HalfAdder1Bit ha13(a[12],b[12],carry[12],s[12]);
HalfAdder1Bit ha14(a[13],b[13],carry[13],s[13]);
HalfAdder1Bit ha15(a[14],b[14],carry[14],s[14]);
HalfAdder1Bit ha16(a[15],b[15],carry[15],s[15]);

endmodule

//16bit adder
module add_24_bit(a,b,s);
parameter size=24;
input [size-1:0] a;
input [size-1:0] b;
output [size-1:0] s;
wire  carry[23:0];

HalfAdder1Bit ha1(a[0],b[0],carry[0],s[0]);
HalfAdder1Bit ha2(a[1],b[1],carry[1],s[1]);
HalfAdder1Bit ha3(a[2],b[2],carry[2],s[2]);
HalfAdder1Bit ha4(a[3],b[3],carry[3],s[3]);
HalfAdder1Bit ha5(a[4],b[4],carry[4],s[4]);
HalfAdder1Bit ha6(a[5],b[5],carry[5],s[5]);
HalfAdder1Bit ha7(a[6],b[6],carry[6],s[6]);
HalfAdder1Bit ha8(a[7],b[7],carry[7],s[7]);
HalfAdder1Bit ha9(a[8],b[8],carry[8],s[8]);
HalfAdder1Bit ha10(a[9],b[9],carry[9],s[9]);
HalfAdder1Bit ha11(a[10],b[10],carry[10],s[10]);
HalfAdder1Bit ha12(a[11],b[11],carry[11],s[11]);
HalfAdder1Bit ha13(a[12],b[12],carry[12],s[12]);
HalfAdder1Bit ha14(a[13],b[13],carry[13],s[13]);
HalfAdder1Bit ha15(a[14],b[14],carry[14],s[14]);
HalfAdder1Bit ha16(a[15],b[15],carry[15],s[15]);
HalfAdder1Bit ha17(a[16],b[16],carry[16],s[16]);
HalfAdder1Bit ha18(a[17],b[17],carry[17],s[17]);
HalfAdder1Bit ha19(a[18],b[18],carry[18],s[18]);
HalfAdder1Bit ha20(a[19],b[19],carry[19],s[19]);
HalfAdder1Bit ha21(a[20],b[20],carry[20],s[20]);
HalfAdder1Bit ha22(a[21],b[21],carry[21],s[21]);
HalfAdder1Bit ha23(a[22],b[22],carry[22],s[22]);
HalfAdder1Bit ha24(a[23],b[23],carry[23],s[23]);

endmodule

module vedic_2_x_2(a,b,c);
input [1:0]a;
input [1:0]b;
output [3:0]c;
wire [3:0]c;
wire [3:0]temp;
//stage 1
// four multiplication operation of bits accourding to vedic logic done using and gates 
assign c[0]=a[0]&b[0]; 
assign temp[0]=a[1]&b[0];
assign temp[1]=a[0]&b[1];
assign temp[2]=a[1]&b[1];
//stage two 
// using two half adders 
HalfAdder1Bit z1(temp[0],temp[1],c[1],temp[3]);
HalfAdder1Bit z2(temp[2],temp[3],c[2],c[3]);
endmodule


module vedic_4_x_4(a,b,c);
input [3:0]a;
input [3:0]b;
output [7:0]c;

wire [3:0]q0;	
wire [3:0]q1;	
wire [3:0]q2;
wire [3:0]q3;	
wire [7:0]c;
wire [3:0]temp1;
wire [5:0]temp2;
wire [5:0]temp3;
wire [5:0]temp4;
wire [3:0]q4;
wire [5:0]q5;
wire [5:0]q6;
// using 4 2x2 multipliers
vedic_2_x_2 z1(a[1:0],b[1:0],q0[3:0]);
vedic_2_x_2 z2(a[3:2],b[1:0],q1[3:0]);
vedic_2_x_2 z3(a[1:0],b[3:2],q2[3:0]);
vedic_2_x_2 z4(a[3:2],b[3:2],q3[3:0]);
// stage 1 adders 
assign temp1 ={2'b0,q0[3:2]};
add_4_bit z5(q1[3:0],temp1,q4);
assign temp2 ={2'b0,q2[3:0]};
assign temp3 ={q3[3:0],2'b0};
add_6_bit z6(temp2,temp3,q5);
assign temp4={2'b0,q4[3:0]};
// stage 2 adder 
add_6_bit z7(temp4,q5,q6);
// fnal output assignment 
assign c[1:0]=q0[1:0];
assign c[7:2]=q6[5:0];


endmodule


module vedic_8X8(a,b,c);
   
input [7:0]a;
input [7:0]b;
output [15:0]c;

wire [15:0]q0;	
wire [15:0]q1;	
wire [15:0]q2;
wire [15:0]q3;	
wire [15:0]c;
wire [7:0]temp1;
wire [11:0]temp2;
wire [11:0]temp3;
wire [11:0]temp4;
wire [7:0]q4;
wire [11:0]q5;
wire [11:0]q6;
// using 4 4x4 multipliers
vedic_4_x_4 z1(a[3:0],b[3:0],q0[7:0]);
vedic_4_x_4 z2(a[7:4],b[3:0],q1[7:0]);
vedic_4_x_4 z3(a[3:0],b[7:4],q2[7:0]);
vedic_4_x_4 z4(a[7:4],b[7:4],q3[7:0]);

// stage 1 adders 
assign temp1 ={4'b0,q0[7:4]};
add_8_bit z5(q1[7:0],temp1,q4);
assign temp2 ={4'b0,q2[7:0]};
assign temp3 ={q3[7:0],4'b0};
add_12_bit z6(temp2,temp3,q5);
assign temp4={4'b0,q4[7:0]};
// stage 2 adder
add_12_bit z7(temp4,q5,q6);
// fnal output assignment 
assign c[3:0]=q0[3:0];
assign c[15:4]=q6[11:0];



endmodule



module vedic_16x16(a,b,c);
input [15:0]a;
input [15:0]b;
output [31:0]c;

wire [15:0]q0;	
wire [15:0]q1;	
wire [15:0]q2;
wire [15:0]q3;	
wire [31:0]c;
wire [15:0]temp1;
wire [23:0]temp2;
wire [23:0]temp3;
wire [23:0]temp4;
wire [15:0]q4;
wire [23:0]q5;
wire [23:0]q6;
// using 4 8x8 multipliers
vedic_8X8 z1(a[7:0],b[7:0],q0[15:0]);
vedic_8X8 z2(a[15:8],b[7:0],q1[15:0]);
vedic_8X8 z3(a[7:0],b[15:8],q2[15:0]);
vedic_8X8 z4(a[15:8],b[15:8],q3[15:0]);

// stage 1 adders 
assign temp1 ={8'b0,q0[15:8]};
add_16_bit z5(q1[15:0],temp1,q4);
assign temp2 ={8'b0,q2[15:0]};
assign temp3 ={q3[15:0],8'b0};
add_24_bit z6(temp2,temp3,q5);
assign temp4={8'b0,q4[15:0]};

//stage 2 adder
add_24_bit z7(temp4,q5,q6);
// fnal output assignment 
assign c[7:0]=q0[7:0];
assign c[31:8]=q6[23:0];


endmodule

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

module nor16bit(out, A, B);
	input [15:0] A;
	input [15:0] B;
	output [15:0] out;
	
	// Takes the nor of A and B
	nor nor1(out[0], A[0], B[0]),
		nor2(out[1], A[1], B[1]),
		nor3(out[2], A[2], B[2]),
		nor4(out[3], A[3], B[3]),
		nor5(out[4], A[4], B[4]),
		nor6(out[5], A[5], B[5]),
		nor7(out[6], A[6], B[6]),
		nor8(out[7], A[7], B[7]),
		nor9(out[8], A[8], B[8]),
		nor10(out[9], A[9], B[9]),
		nor11(out[10], A[10], B[10]),
		nor12(out[11], A[11], B[11]),
		nor13(out[12], A[12], B[12]),
		nor14(out[13], A[13], B[13]),
		nor15(out[14], A[14], B[14]),
		nor16(out[15], A[15], B[15]);
endmodule

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

module rightarbiter(out, A);
	// The parameter here will be the number of bits the arbiter will take in. This can be adjusted to whatever number of bit inputs you like
	parameter n = 16;
	
	input [n-1:0] A;
	output [n-1:0] out;
	
	// The cas interface here will be used to do the arbiter logic. This should return a one hot number of the least significant 1 bit
	wire [n-1:0] cas = {(~A[n-2:0] & cas[n-2:0]), 1'b1};
	assign out = A & cas;
endmodule


module xnor16bit(out, A, B);
	input [15:0] A;
	input [15:0] B;
	output [15:0] out;
	
	// Takes the xnor of A and B
	xnor xnor1(out[0], A[0], B[0]),
		xnor2(out[1], A[1], B[1]),
		xnor3(out[2], A[2], B[2]),
		xnor4(out[3], A[3], B[3]),
		xnor5(out[4], A[4], B[4]),
		xnor6(out[5], A[5], B[5]),
		xnor7(out[6], A[6], B[6]),
		xnor8(out[7], A[7], B[7]),
		xnor9(out[8], A[8], B[8]),
		xnor10(out[9], A[9], B[9]),
		xnor11(out[10], A[10], B[10]),
		xnor12(out[11], A[11], B[11]),
		xnor13(out[12], A[12], B[12]),
		xnor14(out[13], A[13], B[13]),
		xnor15(out[14], A[14], B[14]),
		xnor16(out[15], A[15], B[15]);
endmodule

module xor4(out,in1,in2);
	input [3:0] in1, in2;
	output [3:0] out;

	xor t1(out[3], in1[3], in2[3]),
		t2(out[2], in1[2], in2[2]),
		t3(out[1], in1[1], in2[1]),
		t4(out[0], in1[0], in2[0]);
endmodule


//-----------------------

module xor8(out,in1,in2);
	input [7:0] in1, in2;
	output [7:0] out;

	xor4 t1(out[7:4], in1[7:4], in2[7:4]),
		 t2(out[3:0], in1[3:0], in2[3:0]);
endmodule


//-----------------------


module xor16(out,in1,in2);
	input [15:0] in1, in2;
	output [15:0] out;

	xor8 t1(out[15:8], in1[15:8], in2[15:8]),
		t2(out[7:0], in1[7:0], in2[7:0]);
endmodule

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
   
   //AND 16 components
   reg[15:0] inAnd1;
   reg[15:0] inAnd2;
   wire[15:0] outAnd1;
   and16 zap1(outAnd1, inAnd1,inAnd2);

   //Inverter 16 components
   reg[15:0] inputInverter;
   wire[15:0] outputInverter ;
   inv16 zap2(inputInverter, outputInverter);

   //left arbiter components
	reg [15:0] inputLarb = 16'b0000001000000101;
	wire [15:0] outputLarb;
	leftarbiter instan(outputLarb, inputLarb);

   //multiplexer componentss
   reg[15:0] channelTest1, ChannelTest2, selectorBit1, selectorBit2; 
   wire[15:0] outMultiplexer1, outMultiplexer2;
   Multiplexer mux1(channelTest1, channelTest1, channelTest1, channelTest1, channelTest1, channelTest1, channelTest1, 
   channelTest1, channelTest1, channelTest1, channelTest1, channelTest1, channelTest1, channelTest1, channelTest1, channelTest2, selectorBit1, outMultiplexer1);
   Multiplexer mux2(channelTest1, channelTest1, channelTest1, channelTest1, channelTest1, channelTest1, channelTest1, 
   channelTest1, channelTest1, channelTest1, channelTest1, channelTest1, channelTest1, channelTest1, channelTest1, channelTest2, selectorBit2, outMultiplexer2);

   //multiplier
   reg[15:0] in1Multiplier, in2Multiplier;
   wire[31:0] outMultiplier;
   vedic_16x16 zap(in1Multiplier, in2Multiplier, outMultiplier);

   //Nor components
   reg[15:0] inputNor1;
	reg[15:0] inputNor2;
	wire[15:0] outNor;
	nor16bit instanc(outNor, inputNor1, inputNor2);
   
   //or components
   reg [15:0] inputOr1;
   reg [15:0] inputOr2;
   wire[15:0] outputOr;
   or16 zap3(inputOr1, inputOr2, outputOr);

   //right arbiter components
	reg [15:0] inputRArb = 16'b0000010000000101;
	wire [15:0] outputRArb;
	rightarbiter zap43(outputRArb, inputRArb);

   //xnor components
   reg[15:0] inputXNOR;
	reg[15:0] inputXNOR2;
	wire[15:0] outputXNOR;
	xnor16bit instance1(outputXNOR, inputXNOR, inputXNOR2);

   //xor components
   reg[15:0] inputXor;
   reg[15:0] inputXor1;
   wire[15:0] outputXor;
   xor16 zip(outputXor,inputXor,inputXor1);

   //nand components
   reg [15:0] inNand ;
   reg [15:0] inNand1;
   wire[15:0] outNand ;
   nand16 zep(inNand, inNand1, outNand);

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

   inAnd1 = 16'b1010101010101010;
   inAnd2 = 16'b1010101010100101;

   inputInverter = 16'b0000000011111111;

   channelTest1 = 16'b000000010000000;
   ChannelTest2 = 16'b000000000000001;
   selectorBit1 = 16'b1000000000000000;
   selectorBit2 = 16'b0000000000000001;

   inNand = 16'b0000000011111101;
   inNand1 = 16'b1111111101010101;

	inputNor1 = 16'b0000000011111100;
	inputNor2 = 16'b1111111101010100;	

	inputOr1 = 16'b0000000011111100;
	inputOr2 = 16'b1111111101010100;	

   inputXNOR = 16'b0000000011111100;
	inputXNOR2 = 16'b1111111101010100;

   inputXor = 16'b0000000011111100;
   inputXor1 = 16'b1111111101010100;

   in1Multiplier = 16'b0000000000000010;
   in2Multiplier = 16'b0000000000000010;
   
   #10
   $display("\n");
   $display("Test of 16 bit XOR gate");
   $display("==============================================");
   $display("%b", inputXor);
   $display("%b", inputXor1);
   $display("%b", outputXor);

   #10;
   $display("\n");
	$display("Testing of XNOR--------");
   $display("==============================================");
	$display("Input 1 is %b", inputXNOR);
	$display("Input 2 is %b", inputXNOR2);
	$display("Output is  %b", outputXNOR);

   #10;
   $display("\n");
	$display("Testing right arbiter---------");
   $display("==============================================");
	$display("Input is %b", inputRArb);
	$display("Output is %b", outputRArb);

	#10;
   $display("\n");
	$display("Testing OR output-------");
   $display("==============================================");
	$display("Input 1 is %b", inputOr1);
	$display("Input 2 is %b", inputOr2);
	$display("Output is  %b", outputOr);

	#10;
   $display("\n");
	$display("Testing NOR output-------");
   $display("==============================================");
	$display("Input 1 is %b", inputNor1);
	$display("Input 2 is %b", inputNor2);
	$display("Output is  %b", outNor);

   #10;
   $display("\n");
   $display("Testing 16 bit NAND-------");
   $display("==============================================");
   $display("operand 1 is %b", inNand);
   $display("operand 2 is %b", inNand1);
   $display("output is    %b", outNand);
			
   #10;
   $display("\n");
	$display("Left Arbiter Test---------");
   $display("==============================================");
	$display("Input is  %b", inputLarb);
	$display("Output is %b", outputLarb);

   #10
   $display("\n");
   $display("Testing 16 bit multiplier");
   $display("==============================================");
   $display("operand 1 is %b", in1Multiplier);
   $display("operand 2 is %b", in2Multiplier);
   $display("output is    %b", outMultiplier);

   #10
   $display("\n");
   $display("Testing of 16 bit multiplexer");
   $display("==============================================");
   $display("output is    %b", outMultiplexer1);
   $display("output is    %b", outMultiplexer2);

   #10
   $display("\n");
   $display("Testing of 16 bit inverter---------");
   $display("==============================================");
   $display("Initial value is %b", inputInverter);
   $display("Output value is  %b", outputInverter);
   
   #10;
   $display("\n");
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
   $display("\n");
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
   $display("\n");
   $display("Testing 4-16 Decoder");
   $display("==============================================");
   $display("Decoder input is %b", din);
   $display("Decoder output is %b", dout);

   #10;
   $display("\n");
   $display("Testing 16-4 Encoder");
   $display("==============================================");
   $display("Encoder input ein1 is %b", ein1);
   $display("Encoder output eout1 is %b", eout1);
   $display("Encoder input ein2 is %b", ein2);
   $display("Encoder output eout2 is %b", eout2);

   #10;
   $display("\n");
   $display("Testing 16 bit Division");
   $display("==============================================");
   $display("Value of dividend = %b", adiv);
   $display("Value of divisor  = %b", bdiv);
   $display("Value of quotient = %b", quotient);
   $display("Value of remainder = %b", remainder);



   #10
   $display("\n");
   $display("Testing of 16bit AND----------------");
   $display("Input1 for and is: %b", inAnd1);
   $display("Input2 for and is: %b", inAnd2);
   $display("ANDed output is:   %b", outAnd1);
   $finish ;
   end
endmodule
//-----------------------------------------------------------------------