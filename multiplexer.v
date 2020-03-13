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

module testBench;
reg[15:0] channelTest1, channelTest2, selectorBit1, selectorBit2; 
wire[15:0] outMultiplexer1, outMultiplexer2;
Multiplexer mux1(channelTest1, channelTest1, channelTest1, channelTest1, channelTest1, channelTest1, channelTest1, 
channelTest1, channelTest1, channelTest1, channelTest1, channelTest1, channelTest1, channelTest1, channelTest1, channelTest2, selectorBit1, outMultiplexer1);
Multiplexer mux2(channelTest1, channelTest1, channelTest1, channelTest1, channelTest1, channelTest1, channelTest1, 
channelTest1, channelTest1, channelTest1, channelTest1, channelTest1, channelTest1, channelTest1, channelTest1, channelTest2, selectorBit2, outMultiplexer2);

  initial 
    begin
    channelTest1 = 16'b000000010000000;
    channelTest2 = 16'b000000000000010;
    selectorBit1 = 16'b1000000000000000;
    selectorBit2 = 16'b0000000000000001;
    #10
      $display("Testing of 16 bit multiplexer");
      $display("output is    %b", outMultiplexer1);
      $display("output is    %b", outMultiplexer2);

      $finish ;
    end

endmodule