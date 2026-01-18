`timescale 1ns/1ps

module tb_FSM;

    reg clk;
    reg rst;
    reg [1:0] in;

    wire out;
    wire [1:0] change;

    // DUT instantiation
    FSM dut (
        .clk(clk),
        .rst(rst),
        .in(in),
        .out(out),
        .change(change)
    );

    // Clock generation: 10 ns period
    always #5 clk = ~clk;

    initial begin
        // Initial values
        clk = 0;
        rst = 1;
        in  = 2'b00;

        // Dump waveform
        $dumpfile("fsm_moore.vcd");
        $dumpvars(0, tb_FSM);

        // Apply reset
        #12 rst = 0;

        // ----------------------------
        // Case 1: 5 + 10 = 15 (Exact)
        // ----------------------------
        #10 in = 2'b01;   // ₹5
        #10 in = 2'b10;   // ₹10
        #10 in = 2'b00;

        // ----------------------------
        // Case 2: 10 + 10 = 20 (₹5 change)
        // ----------------------------
        #20 in = 2'b10;   // ₹10
        #10 in = 2'b10;   // ₹10
        #10 in = 2'b00;

        // ----------------------------
        // Case 3: 10 + 10 + 5 = 25 (₹10 change)
        // ----------------------------
        #20 in = 2'b10;   // ₹10
        #10 in = 2'b10;   // ₹10
        #10 in = 2'b01;   // ₹5
        #10 in = 2'b00;

        // ----------------------------
        // Reset again
        // ----------------------------
        #20 rst = 1;
        #10 rst = 0;

        #30 $finish;
    end

    // Console monitor
    initial begin
        $monitor("Time=%0t | in=%b | out=%b | change=%b",
                  $time, in, out, change);
    end

endmodule
