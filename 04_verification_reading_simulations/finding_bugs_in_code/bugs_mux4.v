// ============================================================================
// Problem : Mux 2
// Link    : https://hdlbits.01xz.net/wiki/bugs_mux4
// ============================================================================

module top_module (
    input [1:0] sel,
    input [7:0] a,
    input [7:0] b,
    input [7:0] c,
    input [7:0] d,
    output [7:0] out  ); //

    wire [7:0] o0, o1;
    mux2 ins1 ( sel[0],    a,    b, o0 );
    mux2 ins2 ( sel[0],    c,    d, o1 );
    mux2 ins3 ( sel[1], o0, o1,  out );

endmodule

