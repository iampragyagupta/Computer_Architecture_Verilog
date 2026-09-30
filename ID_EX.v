// Code your design here
module ID_EX(input wire [63:0] PC_in,
             input wire [63:0] rs1_in, //data
             input wire [63:0] rs2_in, //data
             input wire [63:0] n_imm_in,
             input wire [4:0] rd_in, //loc
             input wire [3:0] func3_in,
             input wire regwrite_in,
             input wire memtoreg_in,
             input wire branch_in, 
             input wire memwrite_in,
             input wire memread_in,
             input wire ALUsrc_in,
             input wire [1:0] ALUop_in,
             input wire clk,
             input wire reset,
             input wire flush,
             output reg [63:0] rs1,
             output reg [63:0] rs2,
             output reg [63:0] n_imm,
             output reg [4:0] rd,
             output reg [3:0] func3,
             output reg regwrite,
             output reg memtoreg,
             output reg branch, 
             output reg memwrite,
             output reg memread,
             output reg ALUsrc,
             output reg [1:0] ALUop,
             output reg [63:0] PC);
  always  @(posedge clk)
    begin
      if (reset == 1'b1 || flush == 1'b1)
        begin
          rs1 <= 0;
          rs2 <= 0;
          n_imm <= 0;
          rd <= 0;
          func3 <= 0;
          regwrite <= 0;
          memtoreg <= 0;
          branch <= 0; 
          memwrite <= 0;
          memread <= 0;
          ALUsrc <= 0;
          ALUop <= 0;
          PC <= 0;
        end
      else
        begin
          rs1 <= rs1_in;
          rs2 <= rs2_in;
          n_imm <= n_imm_in;
          rd <= rd_in;
          func3 <= func3_in;
          regwrite <= regwrite_in;
          memtoreg <= memtoreg_in;
          branch <= branch_in; 
          memwrite <= memwrite_in;
          memread <= memread_in;
          ALUsrc <= ALUsrc_in;
          ALUop <= ALUop_in;
          PC <= PC_in;
        end
    end
  
endmodule
