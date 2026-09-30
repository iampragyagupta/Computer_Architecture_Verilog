// Code your design here
module PC_source_gen(input wire [3:0] func3,
                     input wire ALU_zero,
                     input wire branch,
                     output reg PCsrc);
  always @(*)
    begin
      case (func3[2:0])
        3'b000://beq
          begin
            if (ALU_zero == 1'b1 && branch == 1'b1)
              PCsrc = 1'b1;
        	else
              PCsrc = 1'b0;
          end
        3'b001://bne
          begin
            if (ALU_zero == 1'b0 && branch == 1'b1)
              PCsrc = 1'b1;
        	else
              PCsrc = 1'b0;
          end
        3'b100://blt
          begin
          	if (ALU_zero == 1'b0 && branch == 1'b1)
              PCsrc = 1'b1;
        	else
              PCsrc = 1'b0;
          end
        3'b101://bge
          begin
            if (ALU_zero == 1'b1 && branch == 1'b1)
              PCsrc = 1'b1;
        	else
              PCsrc = 1'b0;
          end
        default: PCsrc = 1'b0;
      endcase
    end
endmodule
