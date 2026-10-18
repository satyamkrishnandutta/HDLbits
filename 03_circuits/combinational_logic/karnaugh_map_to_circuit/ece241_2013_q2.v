// ============================================================================
// Problem : 4-variable K-map 1
// Link    : https://hdlbits.01xz.net/wiki/ece241_2013_q2
// ============================================================================

module top_module (
    input a,
    input b,
    input c,
    input d,
    output out_sop,
    output out_pos
); 
    assign out_sop = (~a & ~b & c) | (c & d);
    assign out_pos = c & (~a | d) & (~b | d);
endmodule
