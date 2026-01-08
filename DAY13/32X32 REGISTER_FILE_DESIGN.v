//////////////////////////////////////////////////////////////////////////////////
// Company: VIT Vellore (Student)  
// Engineer: SANJAY ELAVARASAN KARTHIKEYAN..
// 
// Create Date: 08.01.2026 23:00:01
// Design Name: 32X32 Register File
// Module Name: Regbank
// Project Name: MIPS32_Processor_5-Staged_Pipelined_Implementation_
// Target Devices: --
// Tool Versions: --
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module regbank(rdData1,rdData2,wrData,sr1,sr2,dr,write,clk,reset);

input clk,write,reset;
input [4:0] sr1,sr2,dr;
input [31:0] wrData;
output [31:0] rdData1,rdData2;

integer k;

reg [31:0] regfile[0:31];


assign rdData1 = regfile[sr1];
assign rdData2 = regfile[sr2];

always@(posedge clk)
begin
    if(reset)begin
        for(k=0;k<32;k=k+1)begin 
            regfile[k] <=0;
        end
    end
    else begin 
        if(write) regfile[dr] <= wrData;
    end
end

endmodule
