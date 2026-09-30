// Code your design here
module ALU_control(input wire [3:0] func3,
                   input wire [1:0] ALUop,
                   output reg [3:0] ALUctrl);
  always @(*)
    begin
      case (ALUop)
        2'b00: //load, store, I type
          ALUctrl = 4'b0010;
        2'b01: //branch
          case (func3[2:1])
            2'b00:
              ALUctrl = 4'b0110;
            2'b10:
              ALUctrl = 4'b0111;
            default: 
              ALUctrl = 4'b1111;
          endcase
        2'b10: //R type
          begin
            case (func3[2:0])
              3'b000:
                begin
                  case (func3[3])
                    1'b0: //add
                      ALUctrl = 4'b0010;
                    1'b1: //sub
                      ALUctrl = 4'b0110;
                    default:
                      ALUctrl = 4'b1111;
                  endcase
                end
              3'b110: //or
                  ALUctrl = 4'b0001;
              3'b111: //and
                  ALUctrl = 4'b0000;
              3'b100: //xor
                  ALUctrl = 4'b0011;
              3'b001: //sll
                  ALUctrl = 4'b0100;
              3'b101: 
                begin
                    case (func3[3])
                      1'b0:
                        ALUctrl = 4'b0101; // srl
                      1'b1:
                        ALUctrl = 4'b1000; // sra
                      default:
                        ALUctrl = 4'b1111;
                    endcase
                end
              default:
                ALUctrl = 4'b1111;
            endcase
          end
        default:
          ALUctrl = 4'b1111;
      endcase
    end
endmodule
