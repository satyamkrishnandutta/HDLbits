// ============================================================================
// Problem : DFF 2
// Link    : https://hdlbits.01xz.net/wiki/m2014_q4c
// ============================================================================

module top_module (
    input clk,
    input d, 
    input r,   // synchronous reset
    output q);
    always @(posedge clk)begin
        if(r)
            q<=0;
        else
            q<=d;
    end
endmodule

