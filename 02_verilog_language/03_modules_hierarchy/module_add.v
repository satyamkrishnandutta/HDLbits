// ============================================================================
// Problem : Adder 1
// Link    : https://hdlbits.01xz.net/wiki/module_add
// ============================================================================

module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire w;
    add16 ins1(.a(a[15:0]),.b(b[15:0]),.sum(sum[15:0]),.cin(1'b0),.cout(w));
    add16 ins2(.a(a[31:16]),.b(b[31:16]),.sum(sum[31:16]),.cin(w),.cout(1'b0));
endmodule

