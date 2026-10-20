// ============================================================================
// Problem : Mt2015 lfsr
// Link    : https://hdlbits.01xz.net/wiki/Mt2015_lfsr
// ============================================================================

module top_module (
	input [2:0] SW,      // R
	input [1:0] KEY,     // L and clk
	output [2:0] LEDR);  // Q
    wire [3:0] R;
    wire L, clk;
    assign R=SW;
    assign {L,clk}=KEY;
    
    always @(posedge clk)begin
        LEDR[0]<= L ? R[0] : LEDR[2];
        LEDR[1]<= L ? R[1] : LEDR[0];
        LEDR[2]<= L ? R[2] : LEDR[2]^LEDR[1];
    end

endmodule
