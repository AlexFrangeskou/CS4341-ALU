//----------------------------------------------------------------------
module encoder(a, e);

   input [15:0] a;
   output [3:0] e;

   or(e[0], a[1], a[3], a[5], a[7], a[9], a[11], a[13], a[15]);
   or(e[1], a[2], a[3], a[6], a[7], a[10], a[11], a[14], a[15]);
   or(e[2], a[4], a[5], a[6], a[7], a[12], a[13], a[14], a[15]);
   or(e[3], a[8], a[9], a[10], a[11], a[12], a[13], a[14], a[15]);

endmodule
//----------------------------------------------------------------------

//----------------------------------------------------------------------
module testbench();

   reg [15:0] ein;
   wire [3:0] eout;
   encoder plswork(ein, eout);

   initial begin
   ein = 64;

   #10;
   $display("encoder input is ", ein[15], ein[14], ein[13], ein[12], ein[11], ein[10], ein[9], ein[8], ein[7], ein[6], ein[5], ein[4], ein[3], ein[2], ein[1], ein[0]);
   $display("encoder output is ", eout[3], eout[2], eout[1], eout[0]);

   end
endmodule
//----------------------------------------------------------------------