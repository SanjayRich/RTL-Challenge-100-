module MUL_ADD_TEST();

reg[15:0] data_in;
reg clk,start;
wire done;
wire [15:0] out;


MUL_ADD DUT(eqz,ldA,ldB,ldP,clrP,decB,data_in,clk,out);

controller DUT1(ldA,ldB,ldP,clrP,decB,done,clk,eqz,start);

initial begin
    clk = 1'b0;
    #3 start = 1'b1;
    #500 $finish;
end

always #5 clk = ~clk;

initial begin
    #17 data_in = 17;
    #10 data_in = 5;
end

initial
begin
    $monitor($time,"%d %b",out,done);
    $dumpfile("mul.vcd");
    $dumpvars(0,MUL_ADD_TEST);


end

endmodule