// ============================================================================
// Problem : Slow decade counter
// Link    : https://hdlbits.01xz.net/wiki/countslow
// ============================================================================

module top_module (
    input clk,
    input slowena,
    input reset,
    output [3:0] q=4'b0000);
    always @(posedge clk)begin
        if(reset || (q==9&&slowena))
            q<=0;
        else if(slowena)
            q<=q+1;
    end
endmodule

