`timescale 1ns/1ps
`include "Pr_encoder.v"

module Pr_encoder_tb();

reg [7:0] in;
wire [2:0] code;

priority_encoder DUT (in,code);

initial begin

    $dumpfile("Pr_encoder.vcd");
    $dumpvars(0,Pr_encoder_tb);

    $display("Time\t In Code");
    $monitor("%g\t%b %b", $time, in,code);

    in = 7'd0;
    #5 in = 7'd1;
    #5 in = 7'd2;
    #5 in = 7'd3;
    #5 in = 7'd4;
    #5 in = 7'd5;
    #5 in = 7'd6;
    #5 in = 7'd7;
    #5 in = 7'd8;
    #5 in = 7'd9;

    


end


endmodule
