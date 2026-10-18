// ============================================================================
// Problem : 2-to-1 multiplexer
// Link    : https://hdlbits.01xz.net/wiki/mux2to1
// ============================================================================

module top_module( 
    input a, b, sel,
    output out ); 
    always @(*) begin
        case(sel)
            1'b0 : out=a;
            1'b1 : out=b;
        endcase
    end
endmodule

