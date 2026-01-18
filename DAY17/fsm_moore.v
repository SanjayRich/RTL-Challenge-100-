module FSM(in,clk,rst,out,change);

input [1:0]in;
input rst;
input clk;
output out;
output [1:0]change;

reg [2:0] tempout;

parameter S0 = 3'b000,S1=3'b001,S2=3'b010,S3=3'b011,S4=3'b100,S5=3'b101,S6=3'b110;
reg [2:0]ps,ns;

always @(posedge clk or posedge rst) begin
    if(rst) ps <= S0; 
    else ps <= ns;
end


//NEXT STATE LOGIC
always @(ps or in) begin
    ns = ps;
    case(ps)

    S0: begin 
        if(in==2'b00) begin 
            ns = S0;
        end
        else if(in==2'b01) begin 
            ns = S1;
        end
        else if(in==2'b10) begin
            ns = S2;
        end
        else begin 
            ns = S0;
        end 
    end

    S1: begin 
        if(in==2'b00) begin 
            ns = S4;
            
        end
        else if(in==2'b01) begin 
            ns = S2;
            
        end
        else if(in==2'b10) begin
            ns = S3;
            
        end
        else begin 
            ns = S0;
        
        end
    end

    S2: begin 
        if(in==2'b00) begin 
            ns = S5;
            
        end
        else if(in==2'b01) begin 
            ns = S3;
            
        end
        else if(in==2'b10) begin
            ns = S6;
           
        end
        else begin 
            ns = S0;
        end

    end



   

    default ns = S0;


    endcase
    

end

//OUTPUT LOGIC
always @(*) begin
    case(ps)
        S0: tempout = 3'b000;
        S1: tempout = 3'b000;
        S2: tempout = 3'b000;
        S3: tempout = 3'b001; // vend
        S4: tempout = 3'b010; // change
        S5: tempout = 3'b100;
        S6: tempout = 3'b011;
        default: tempout = 3'b000;
    endcase
end

assign out = tempout[0];
assign change = tempout[2:1];


endmodule 