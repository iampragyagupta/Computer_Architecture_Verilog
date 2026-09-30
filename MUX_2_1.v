// Code your design here
module MUX_2_1(input wire [63:0] in0,
               input wire [63:0] in1,
               input wire S,
               output reg [63:0] out);
  always @ (in0 or in1 or S)
    begin 
      if (S==0)
        out = in0;
      else
        out = in1;
    end
endmodule
               
