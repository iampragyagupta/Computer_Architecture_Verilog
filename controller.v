// Code your design here
module controller(input wire [6:0] opcode,
                  output reg regwrite,
                  output reg memtoreg,
                  output reg branch, //decides PC update
                  output reg memwrite,
                  output reg memread,
                  output reg ALUsrc,
                  output reg [1:0] ALUop);
  always @(*)
    begin
  		case (opcode)
    		7'b0000011: //load
              begin
                ALUop = 2'b00; 
                ALUsrc = 1'b1; //ALU source is from immediate
                regwrite = 1'b1; 
                memtoreg = 1'b1; //WB value from mem
                memread = 1'b1; //memory access to read
                memwrite = 1'b0; //no mem write
                branch = 1'b0;
              end
          	7'b0100011: //store
              begin
                ALUop = 2'b00;
                ALUsrc = 1'b1; //ALU source is from immediate
                regwrite = 1'b0; 
                memtoreg = 1'bx; //no WB
                memread = 1'b0; //no mem read
                memwrite = 1'b1; //memory access to write
                branch = 1'b0;
              end
          	7'b1100011: //branch
              begin
                ALUop = 2'b01;
                ALUsrc = 1'b0; //ALU source is from reg file
                regwrite = 1'b0; 
                memtoreg = 1'bx; //no WB
                memread = 1'b0; //no mem read
                memwrite = 1'b0; //no mem write
                branch = 1'b1;
              end
          	7'b0110011: //R type
              begin
                ALUop = 2'b10;
                ALUsrc = 1'b0; //ALU source is from reg file
                regwrite = 1'b1;
                memtoreg = 1'b0; //WB value from ALU
                memread = 1'b0; //no mem read
                memwrite = 1'b0; //no mem write
                branch = 1'b0;
              end
          	7'b0010011: //I type excluding load 
              begin
                ALUop = 2'b10; //to allow I to be executed in ALU as R
                ALUsrc = 1'b1; //ALU source is from immediate
                regwrite = 1'b1;
                memtoreg = 1'b1; //WB value from ALU
                memread = 1'b0; //no mem read
                memwrite = 1'b0; //no mem write
                branch = 1'b0;
              end
          	default:
              begin
                ALUop = 2'b11; //no valid op
                ALUsrc = 1'b0; //ALU source is from reg
                regwrite = 1'b0; //no WB
                memtoreg = 1'b0; //WB value from ALU
                memread = 1'b0; //no mem read
                memwrite = 1'b0; //no mem write
                branch = 1'b0; //no branch
              end
             
  		endcase
    end
  
endmodule
