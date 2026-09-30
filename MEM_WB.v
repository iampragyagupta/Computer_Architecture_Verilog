// Code your design here
module MEM_WB(input wire [63:0] mem_data_in,
              input wire [63:0] ALU_res_in,
              input wire [4:0] rd_in, //loc
              input wire regwrite_in,
              input wire memtoreg_in,
              input wire clk,
              input wire reset,
              output reg [63:0] mem_data,
              output reg [63:0] ALU_res,
              output reg [4:0] rd,
              output reg regwrite,
              output reg memtoreg);
  always @(posedge clk)
    if (reset == 1'b1)
        begin
          mem_data <= 0;
          ALU_res <= 0;
          rd <= 0;
          regwrite <= 0;
          memtoreg <= 0;
        end
	else
      begin
        mem_data <= mem_data_in;
        ALU_res <= ALU_res_in;
        rd <= rd_in;
        regwrite <= regwrite_in;
        memtoreg <= memtoreg_in;
      end
endmodule
