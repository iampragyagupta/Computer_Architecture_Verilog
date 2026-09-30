// Code your design here
//synch write memory
module data_mem(input wire [63:0] address,
                input wire [63:0] data_write,
                input wire memwrite,
                input wire memread,
                input wire clk,
                output reg [63:0] data_read);
  //byte addressable memory
  reg [7:0] d_mem [99:0]; //one mem unit stores 1 byte => 4 units = 1 data
  always @(*)
    begin
      data_read = 64'b0;
      if (memread == 1)
        begin
          if (address <= 64'd92)
            begin
              data_read[7:0] = d_mem[address];
              data_read[15:8] = d_mem[address+1];
              data_read[23:16] = d_mem[address+2];
              data_read[31:24] = d_mem[address+3];
              data_read[39:32] = d_mem[address+4];
              data_read[47:40] = d_mem[address+5];
              data_read[55:48] = d_mem[address+6];
              data_read[63:56] = d_mem[address+7];
            end
        end
    end
  always @(posedge clk)
    begin
      if (memwrite == 1)
        begin
          if (address <= 64'd92)
            begin
              d_mem[address] <= data_write[7:0];
              d_mem[address+1] <= data_write[15:8];
              d_mem[address+2] <= data_write[23:16];
              d_mem[address+3] <= data_write[31:24];
              d_mem[address+4] <= data_write[39:32];
              d_mem[address+5] <= data_write[47:40];
              d_mem[address+6] <= data_write[55:48];
              d_mem[address+7] <= data_write[63:56];
            end
        end
    end
endmodule
