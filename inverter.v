
//16bit inverter  
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

//16 bit inverter test module
module main;
reg[15:0] inputInverter;
wire[15:0] outputInverter ;
inv16 zap(inputInverter, outputInverter);
  initial 
    begin
      inputInverter = 16'b0000000011111111;
      #10
      $display("Testing of 16 bit inverter---------");
      $display("Initial value is %b", inputInverter);
      $display("Output value is  %b", outputInverter);
      $finish ;
    end

endmodule
