// module creation
//bne blt bge not implemented
module ALU (input wire [63:0] data1,
            input wire [63:0] data2, 
  			input wire [3:0] ctrlALU,
            output reg [63:0] data_out,
            output reg zero);
  
  //combinational logic for assigning current values
  always @(*)
    begin
      case(ctrlALU)
        4'b0000: //and
          data_out = data1 & data2;
        4'b0001: //or
          data_out = data1 | data2;
        4'b0010: //add
          data_out = data1 + data2;
        4'b0011: //xor
          data_out = data1 ^ data2;
        4'b0100: //sll
          data_out = data1 << data2[5:0];	//shift limited to 6 bits
        4'b0101: //srl
          data_out = data1 >> data2[5:0];	//shift limited to 6 bits
        4'b0110: //sub
          data_out = data1 - data2;
        4'b0111: //slt
          data_out = ($signed(data1) < $signed(data2)) ? 64'd1 : 64'd0;
        4'b1000: //sra
          data_out = $signed(data1) >>> data2[5:0];
        default:
          data_out = 64'd0;
      endcase
      if (data_out == 64'd0)
        zero = 1;
      else
        zero= 0;
  end

endmodule
  
