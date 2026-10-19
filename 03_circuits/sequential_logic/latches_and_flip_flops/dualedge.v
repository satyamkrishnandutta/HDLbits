// ============================================================================
// Problem : Dual-edge triggered flip-flop
// Link    : https://hdlbits.01xz.net/wiki/dualedge
// ============================================================================

module top_module (
    input clk,
    input d,
    output q
);
    reg a,b;
    always @(posedge clk)begin
        a<=d;
    end
    always @(negedge clk) begin
        b<=d;
    end
    
    assign q = clk ? a : b;
endmodule
