// ============================================================================
// Problem : Combinational circuit 3
// Link    : https://hdlbits.01xz.net/wiki/sim_circuit3
// ============================================================================

module top_module (
    input a,
    input b,
    input c,
    input d,
    output q );//

    assign q = (a | b) & (c | d);

endmodule
