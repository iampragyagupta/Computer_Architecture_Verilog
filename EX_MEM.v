// Code your design here
module EX_MEM(input wire [63:0] PC_in,
              input wire [63:0] adder_sum_in,
              input wire ALU_zero_in,
              input wire [63:0] ALU_res_in,
              input wire [4:0] rd_in,
              input wire [63:0] rs2_in, //data for store
              input wire [3:0] func3_in,
              input wire regwrite_in,
              input wire memtoreg_in,
              input wire branch_in, 
              input wire memwrite_in,
              input wire memread_in,
              input wire clk,
              input wire reset,
              output reg [63:0] adder_sum,
              output reg ALU_zero,
              output reg [63:0] ALU_res,
              output reg [4:0] rd,
              output reg [63:0] rs2,
              output reg regwrite,
              output reg memtoreg,
              output reg branch, 
              output reg memwrite,
              output reg memread,
              output reg [63:0] PC,
              output reg [3:0] func3);
  always @(posedge clk)
    if (reset == 1'b1)
        begin
          adder_sum <= 0;
          ALU_zero <= 0;
          ALU_res <= 0;
          rd <= 0;
          rs2 <= 0;
          regwrite <= 0;
          memtoreg <= 0;
          branch <= 0;
          memwrite <= 0;
          memread <= 0;
          PC <= 0;    
          func3 <= 0;
        end
	else
      begin
        adder_sum <= adder_sum_in;
        ALU_zero <= ALU_zero_in;
        ALU_res <= ALU_res_in;
        rd <= rd_in;
        rs2 <= rs2_in;
        regwrite <= regwrite_in;
        memtoreg <= memtoreg_in;
        branch <= branch_in;
        memwrite <= memwrite_in;
        memread <= memread_in;
        PC <= PC_in;
        func3 <= func3_in;
      end
endmodule
