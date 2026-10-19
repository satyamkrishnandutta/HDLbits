// ============================================================================
// Problem : DFF gating
// Link    : https://hdlbits.01xz.net/wiki/ece241_2014_q4
// ============================================================================

module top_module (
    input clk,
    input x,
    output z
); 
    wire w1,w2,w3;
    dff ins1(.clk(clk),.d(w1^x),.q(w1));
    dff ins2(.clk(clk),.d(x&~w2),.q(w2));
    dff ins3(.clk(clk),.d(~w3|x),.q(w3));
    assign z=~(w1|w2|w3);
endmodule

module dff(
    input clk,d,
    output reg q
);
    always @(posedge clk)begin
        q<=d;
    end
endmodule
