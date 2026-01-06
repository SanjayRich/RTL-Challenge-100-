module seq_mul (
    input        clk,
    input        rst,
    input  [3:0] m,
    input  [3:0] q,
    output reg [7:0] p);
reg [3:0] a;
reg [3:0] mq;
reg c;
reg [2:0] count;
reg [4:0] s;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        a   <= 4'd0;
        mq    <= q;
        c <= 1'b0;
        count <= 3'd0;
        p     <= 8'd0;
    end
    else begin
        if (count < 4) begin
            if (mq[0]) s = a + m;
            else s = {c, a};

            {c, a, mq} <= {s, mq} >> 1;
            count <= count + 1;
        end
        else begin p <= {a, mq};end
    end
end
endmodule
