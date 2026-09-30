// Code your design here
module reg_file(input wire clk,
                input wire reset,
                input wire [4:0] rs1,
                input wire [4:0] rs2,
                input wire [4:0] rd,
                input wire regwrite,
                input wire [63:0] write_data,
                output reg [63:0] read_data1,
                output reg [63:0] read_data2);
  reg [63:0] registers [31:0];
  integer i;
  
  //not using initial block to create register file (not synthesisable)
  assign read_data1 = (rs1 == 5'b0) ? 64'b0 : registers[rs1];
  assign read_data2 = (rs2 == 5'b0) ? 64'b0 : registers[rs2];
  always @(posedge clk)
    begin
      if (reset == 1) //synch reset
        begin
          for (i = 0; i < 32; i = i + 1)
            registers[i] <= 64'b0;
        end
      else if ((regwrite == 1) && (rd != 5'b0))
        begin
          registers[rd] <= write_data;
        end
    end
  
endmodule
                
