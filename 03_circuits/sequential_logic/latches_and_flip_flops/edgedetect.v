// ============================================================================
// Problem : Detect an edge
// Link    : https://hdlbits.01xz.net/wiki/edgedetect
// ============================================================================

module top_module (
    input clk,
    input [7:0] in,
    output [7:0] pedge
);
    reg [7:0] w = 8'h0000;
    always @(posedge clk)begin
        pedge <= in&(~w);
        w<=in;
    end
endmodule

