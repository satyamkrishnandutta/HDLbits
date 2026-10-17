// ============================================================================
// Problem : Adder-subtractor
// Link    : https://hdlbits.01xz.net/wiki/module_addsub
// ============================================================================

module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire w1;
    wire [31:0] subv={32{sub}};
    wire [31:0] w2 = b^subv;
    add16 ins1(.a(a[15:0]),.b(w2[15:0]),.cin(sub),.cout(w1),.sum(sum[15:0]));
    add16 ins2(.a(a[31:16]),.b(w2[31:16]),.cin(w1),.cout(),.sum(sum[31:16]));
endmodule
