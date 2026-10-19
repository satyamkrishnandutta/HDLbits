// ============================================================================
// Problem : Count15
// Link    : https://hdlbits.01xz.net/wiki/Count15
// ============================================================================

module top_module (
    input clk,
    input reset,      // Synchronous active-high reset
    output [3:0] q);
    reg [3:0] count=0;
    always @(posedge clk) begin
        if(reset)
            q<=4'b0000;
        else
            q<=q+1'b1;
    end
endmodule
