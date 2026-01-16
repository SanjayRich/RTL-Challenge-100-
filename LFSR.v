module random_lfsr(clk,rst,lfsr_out);

  input clk,rst;
  output reg [3:0] lfsr_out;

  always@(posedge clk or posedge rst)
    begin 
      if(rst)
        lfsr_out <= 4'hf;
      else
        lfsr_out <= {lfsr_out[2:0],(lfsr_out[3]^lfst_out[2])};
    end 

endmodule 
