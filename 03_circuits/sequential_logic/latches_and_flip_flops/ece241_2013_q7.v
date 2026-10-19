// ============================================================================
// Problem : DFFs and gates
// Link    : https://hdlbits.01xz.net/wiki/ece241_2013_q7
// ============================================================================

module top_module (
    input clk,
    input j,
    input k,
    output Q); 
    wire D;
    assign D=~Q&j | j&~k | Q&~k;
    dff ins1(.clk(clk),.d(D),.q(Q));
endmodule

module dff(
    input clk,d,
    output q
);
    always @(posedge clk)begin
        q<=d;
    end
endmodule

