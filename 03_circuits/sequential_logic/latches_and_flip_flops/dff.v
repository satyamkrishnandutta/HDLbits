// ============================================================================
// Problem : D flip-flop
// Link    : https://hdlbits.01xz.net/wiki/dff
// ============================================================================

module top_module (
    input clk,    // Clocks are used in sequential circuits
    input d,
    output reg q );//

    always @(posedge clk) begin
        q<=d;
    end

endmodule

