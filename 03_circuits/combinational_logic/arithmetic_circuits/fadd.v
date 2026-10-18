// ============================================================================
// Problem : Full adder
// Link    : https://hdlbits.01xz.net/wiki/fadd
// ============================================================================

module top_module( 
    input a, b, cin,
    output cout, sum );
	assign sum=a^b^cin;
    assign cout=a&b | cin&(a^b);
endmodule

