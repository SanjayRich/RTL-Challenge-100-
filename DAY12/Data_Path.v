module MUL_ADD(eqz,ldA,ldB,ldP,clrP,decB,data_in,clk,mul_out);


input ldA,ldB,ldP,clrP,decB,clk;
output eqz;
input [15:0] data_in;
output reg [15:0] mul_out;

wire [15:0] X,Y,Z,Bout,Bus;


PIPO1 P1(X,Bus,ldA,clk);
PIPO2 P2(Y,Z,ldP,clrP,clk);
counter C1(Bout,Bus,ldB,decB,clk);
ADD A1(Z,X,Y);
EQZ compare(eqz,Bout);

always@(*)
begin 

    mul_out <= Y;
end



endmodule