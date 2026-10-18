// ============================================================================
// Problem : 3-variable K-map 2
// Link    : https://hdlbits.01xz.net/wiki/kmap2
// ============================================================================

module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  );
    wire na,nb,nc,nd;
    assign na=~a;
    assign nb=~b;
    assign nc=~c;
    assign nd=~d;
	assign out = na&nc&nd | na&nb&nc | na&c&nd | b&c&d | a&nb&d | a&nb&nc;
endmodule

