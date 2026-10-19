// ============================================================================
// Problem : DFF with asynchronous reset
// Link    : https://hdlbits.01xz.net/wiki/m2014_q4d
// ============================================================================

module top_module (
    input clk,
    input in, 
    output out);
	wire d;
    assign d=out^in;
    always @(posedge clk)begin
        out<=d;
    end
endmodule

