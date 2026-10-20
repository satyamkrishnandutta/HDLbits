// ============================================================================
// Problem : Shift register 1
// Link    : https://hdlbits.01xz.net/wiki/m2014_q4k
// ============================================================================

module top_module (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output out);
    reg[3:0] temp=4'b0000;
    always @(posedge clk)begin
        if(~resetn)begin
            temp<=4'b0000;
        end
        
        else begin
            temp[3]<=in;
            temp[2]<=temp[3];
            temp[1]<=temp[2];
            temp[0]<=temp[1];
        end
    end
    assign out=temp[0];
endmodule
