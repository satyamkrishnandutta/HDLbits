// ============================================================================
// Problem : D flip-flops
// Link    : https://hdlbits.01xz.net/wiki/dff8
// ============================================================================

module top_module (
    input clk,
    input [7:0] d,
    output [7:0] q
);
    always @(posedge clk) begin
        for(int i=0;i<8;i++)begin
            q[i]<=d[i];
        end
    end
endmodule

