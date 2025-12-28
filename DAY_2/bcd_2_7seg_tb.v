`timescale 1ns/1ps
`include "bcd_2_7seg.v"

module bcd_2_7seg_tb;

    reg  [3:0] bcd;
    wire [6:0] seg;

    
    bcd_to_7seg DUT (
        .bcd(bcd),
        .seg(seg)
    );


    initial begin
        $dumpfile("bcd_2_7seg_tb.vcd");
        $dumpvars(0, bcd_2_7seg_tb);

        $display("Time\tBCD\tSEG");
        $monitor("%0t\t%d\t%b", $time, bcd, seg);

        bcd = 4'd0;
        #5 bcd = 4'd1;
        #5 bcd = 4'd2;
        #5 bcd = 4'd3;
        #5 bcd = 4'd4;
        #5 bcd = 4'd5;
        #5 bcd = 4'd6;
        #5 bcd = 4'd7;
        #5 bcd = 4'd8;
        #5 bcd = 4'd9;
        #50 $finish;
    end

endmodule
