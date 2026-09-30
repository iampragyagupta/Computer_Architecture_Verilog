// Code your design here
module IF_ID(input wire [31:0] inst,
             input wire [63:0] PC_in,
             input wire clk,
             input wire reset,
             input wire flush,
             output reg [4:0] rs1,
             output reg [4:0] rs2,
             output reg [4:0] rd,
             output reg [31:0] imm,
             output reg [6:0] opcode,
             output reg [63:0] PC,
             output reg [3:0] func3);
  always @(posedge clk)
    if (reset == 1'b1 || flush == 1'b1)
      begin
        rs1[4:0] <= 0;
        rs2[4:0] <= 0;
        rd [4:0] <= 0;
        func3[3:0] <= 0;
        imm[31:0] <= 0;
        opcode[6:0] <= 0;
        PC[63:0] <= 0;
      end
  	else
      begin
        rs1[4:0] <= inst[19:15];
        rs2[4:0] <= inst[24:20];
        rd [4:0] <= inst[11:7];
        func3[3:0] <= {inst[30],{inst[14:12]}};
        imm[31:0] <= inst[31:0];
        opcode[6:0] <= inst[6:0];
        PC[63:0] <= PC_in[63:0];
      end
  
endmodule
