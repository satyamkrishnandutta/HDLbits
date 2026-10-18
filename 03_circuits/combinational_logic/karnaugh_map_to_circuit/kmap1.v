// ============================================================================
// Problem : 3-variable K-map 1
// Link    : https://hdlbits.01xz.net/wiki/kmap1
// ============================================================================

module top_module(
    input a,
    input b,
    input c,
    output out  ); 
	assign out=a|b|c;
endmodule

