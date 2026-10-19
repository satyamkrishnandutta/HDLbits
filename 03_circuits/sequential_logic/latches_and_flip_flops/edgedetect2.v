// ============================================================================
// Problem : Detect both edges
// Link    : https://hdlbits.01xz.net/wiki/edgedetect2
// ============================================================================

module top_module (
    input clk,
    input [7:0] in,
    output [7:0] anyedge
);
    reg [7:0] prev=8'h00;
    always @(posedge clk)begin 
        anyedge <= (~in&prev) | (in&~prev);
        prev<=in;
    end
endmodule
