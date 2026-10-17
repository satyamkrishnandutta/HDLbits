// ============================================================================
// Problem : Vector 4
// Link    : https://hdlbits.01xz.net/wiki/vector4
// ============================================================================

module top_module (
    input [7:0] in,
    output [31:0] out );//

    assign out={{24{in[7]}},in};
endmodule

