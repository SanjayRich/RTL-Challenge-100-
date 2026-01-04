module multi_4x3(A,B,P);

input [3:0]A;
input [2:0]B;


output [6:0]P;

wire pp00,pp10,pp20,pp30,pp01,pp11,pp21,pp31,pp02,pp12,pp22,pp32,s0,s1,s2,s3,c0,c1;

assign pp00 = A[0]& B[0];
assign pp10 = A[1]& B[0];
assign pp20 = A[2]& B[0];
assign pp30 = A[3]& B[0];

assign pp01 = A[0]& B[1];
assign pp11 = A[1]& B[1];
assign pp21 = A[2]& B[1];
assign pp31 = A[3]& B[1];

assign pp02 = A[0]& B[2];
assign pp12 = A[1]& B[2];
assign pp22 = A[2]& B[2];
assign pp32 = A[3]& B[2];

assign P[0] = pp00;
assign P[1] = s0;

RCA RCA1({1'b0,pp30,pp20,pp10},{pp31,pp21,pp11,pp01},1'b0,{s3,s2,s1,s0},c0);
RCA RCA2({c0,s3,s2,s1},{pp32,pp22,pp12,pp02},1'b0,{P[5],P[4],P[3],P[2]},c1);





assign P[6] = c1;


endmodule

module full_adder(Sum,Cout,a,b,cin);
input a,b,cin;
output Sum,Cout;

assign Sum = ((a)^(b))^(cin);
assign Cout = (((a)&(b))|((b)&(cin)))|((a)&(cin));

endmodule




module RCA(A,B,cin,Sum,Cout);

input [3:0]A,B;
input cin;
output [3:0]Sum;
output Cout;

wire c0,c1,c2;

full_adder FA1 (Sum[0],c0,A[0],B[0],cin);
full_adder FA2 (Sum[1],c1,A[1],B[1],c0);
full_adder FA3 (Sum[2],c2,A[2],B[2],c1);
full_adder FA4 (Sum[3],Cout,A[3],B[3],c2);


endmodule

