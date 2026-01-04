module tb_multi_4x3;

reg  [3:0] A;
reg  [2:0] B;
wire [6:0] P;

multi_4x3 DUT (
    .A(A),
    .B(B),
    .P(P)
);


initial begin
    $dumpfile("multi_4x3.vcd");
    $dumpvars(0, tb_multi_4x3);
end


initial begin
    $display(" A   B   |  P");
    $display("----------------");

    A = 4'd3;  B = 3'd2;  #10; // 6
    A = 4'd7;  B = 3'd5;  #10; // 35
    A = 4'd9;  B = 3'd4;  #10; // 36
    A = 4'd15; B = 3'd7;  #10; // 105
    A = 4'd0;  B = 3'd6;  #10; // 0
    A = 4'd12; B = 3'd3;  #10; // 36

    $finish;
end

initial begin
    $monitor("%d  %d = %d", A, B, P);
end

endmodule
