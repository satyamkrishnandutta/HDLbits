// ============================================================================
// Problem : Four-bit binary counter
// Link    : https://hdlbits.01xz.net/wiki/count10
// ============================================================================

module top_module (
    input clk,
    input reset,        // Synchronous active-high reset
    output [3:0] q);
    always @(posedge clk) begin
        if(reset || q==9)
            q<=0;
        else
            q<=q+1;
    end
endmodule

