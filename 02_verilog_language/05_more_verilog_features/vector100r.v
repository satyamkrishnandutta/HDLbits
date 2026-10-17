// ============================================================================
// Problem : Combinational loop vector reversal
// Link    : https://hdlbits.01xz.net/wiki/vector100r
// ============================================================================

module top_module( 
    input [99:0] in,
    output [99:0] out
);
    always @(*) begin
        for(int i=99;i>=0;i--) begin
            out[i]=in[99-i];
        end
    end
endmodule

