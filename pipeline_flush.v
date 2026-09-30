// Code your design here
module flush_gen(input wire branch,
              output reg flush);
  always @(*)
    begin
      if (branch == 1'b1)
        begin
          flush = 1'b1; //branch taken
        end
      else
        begin
          flush = 1'b0;
        end
    end
endmodule
