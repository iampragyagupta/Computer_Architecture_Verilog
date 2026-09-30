// Code your design here
module PC_reg(input wire [63:0] PC_in,
              input wire clk,
              input wire reset,
              output reg [63:0] PC);
  always @(posedge clk)
    begin
      if (reset == 1'b1)
        begin
          PC <= 0;
        end
      else
        begin
          PC <= PC_in;
        end
    end
endmodule
