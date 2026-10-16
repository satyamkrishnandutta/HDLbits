// ============================================================================
// Problem : Four wires
// Link    : https://hdlbits.01xz.net/wiki/wire4
// ============================================================================

module top_module( 
    input a,b,c,
    output w,x,y,z );
	assign w=a,x=b,y=b,z=c;
endmodule

