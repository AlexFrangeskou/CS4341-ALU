module HalfAdder1(a,b,s,c) ;
  input a,b ;
  output c,s ;  // carry and sum
  assign s = a ^ b ;
  assign c = a & b ;
endmodule

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
HalfAdder1 z1(temp[0],temp[1],c[1],temp[3]);
HalfAdder1 z2(temp[2],temp[3],c[2],c[3]);
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

//
module main;
reg[15:0] in1Multiplier, in2Multiplier;
wire[31:0] outMultiplier;
vedic_16x16 zap(in1Multiplier, in2Multiplier, outMultiplier);
  initial 
    begin
    in1Multiplier = 16'b0000000000000010;
    in2Multiplier = 16'b0000000000000010;
    #10
      $display("Testing 16 bit multiplier");
      $display("operand 1 is %b", in1Multiplier);
      $display("operand 2 is %b", in2Multiplier);
      $display("output is    %b", outMultiplier);
      $finish ;
    end
// reg[3:0] in1Multiplier, in2Multiplier;
// wire[7:0] outMultiplier;
// vedic_4_x_4 zap(in1Multiplier, in2Multiplier, outMultiplier);
//   initial 
//     begin
//     in1Multiplier = 8;
//     in2Multiplier = 2;
//     #10
//       $display("Testing 16 bit multiplier");
//       $display("operand 1 is %d", in1Multiplier);
//       $display("operand 2 is %d", in2Multiplier);
//       $display("output is    %d", outMultiplier);
//       $finish ;
//     end
endmodule
