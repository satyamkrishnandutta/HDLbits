// ============================================================================
// Problem : Edge capture register
// Link    : https://hdlbits.01xz.net/wiki/edgecapture
// ============================================================================

module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);
    reg [31:0] prev=32'h00000000;
    always @(posedge clk)begin
        if(reset)
            out<=32'h00000000;
        else
            out<= out | (prev&~in);
       	prev<=in;    
    end
endmodule
