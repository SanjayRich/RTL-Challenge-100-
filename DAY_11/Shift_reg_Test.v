module shiftreg_tb;

    reg clk,ld,clr,sft,S_in;
    reg [15:0] data_in;
    wire [15:0] data_out;

    shiftreg DUT(data_out,data_in,S_in,clk,ld,clr,sft);
    
    
    
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        ld = 0;
        clr = 0;
        sft = 0;
        S_in = 0;
        data_in = 16'h0000;

        
        #10 clr = 1;
        #10 clr = 0;

        
        #10 ld = 1;
        data_in = 16'hA5A5;
        #10 ld = 0;

        
        #10 sft = 1;
        S_in = 1;
        #10;

        
        S_in = 0;
        #10;

        
        sft = 0;

        
        #20 $finish;
    end

    initial begin
        $monitor("Time=%0t | clr=%b ld=%b sft=%b S_in=%b | data_out=%h",$time, clr, ld, sft, S_in, data_out);
    end

    initial begin
        $dumpfile("shift_reg.vcd");
        $dumpvars(0,shiftreg_tb);
    end

endmodule
