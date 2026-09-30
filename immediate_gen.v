// Code your design here
//unshifted immediate
module immediate_calc(input wire [31:0] imm,
                      output reg [63:0] n_imm);
  always @(*)
    begin
      n_imm = 64'b0;
      case (imm[6:5])
        2'b00: //I type and auipc(not supported)
          n_imm[11:0] = imm[31:20];
        2'b01: //S type and lui(not supported)
          begin
            n_imm[11:5] = imm[31:25];
            n_imm[4:0] = imm[11:7];
          end
        2'b11: //B type
          begin
            n_imm[11] = imm[31];
            n_imm[9:4] = imm[30:25];
            n_imm[3:0] = imm[11:8];
            n_imm[10] = imm[7];            
          end
        default:
          n_imm = 32'b0;
      endcase
      n_imm = {{52{n_imm[11]}}, n_imm[11:0]}; //sign extention
          
    end
endmodule
