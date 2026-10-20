// ============================================================================
// Problem : Rule 110
// Link    : https://hdlbits.01xz.net/wiki/rule110
// ============================================================================

module top_module (
    input clk,
    input load,
    input [511:0] data,
    output reg [511:0] q
);

    integer i;

    always @(posedge clk) begin
        if (load) begin
            q <= data;
        end else begin
            for (i = 0; i < 512; i = i + 1) begin
                if (i == 0)
                    q[0] <= (q[0] ^ 1'b0) | (q[0] & ~q[1]);
                else if (i == 511)
                    q[511] <= (q[511] ^ q[510]) | (q[511] & ~1'b0);
                else
                    q[i] <= (q[i] ^ q[i-1]) | (q[i] & ~q[i+1]);
            end
        end
    end

endmodule