// ============================================================================
// Problem : Combinational circuit 4
// Link    : https://hdlbits.01xz.net/wiki/sim_circuit4
// ============================================================================

module top_module (
    input a,
    input b,
    input c,
    input d,
    output q );//

    assign q = b | c;

endmodule
