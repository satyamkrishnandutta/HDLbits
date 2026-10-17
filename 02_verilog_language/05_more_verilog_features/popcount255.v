// ============================================================================
// Problem : 100-bit binary adder
// Link    : https://hdlbits.01xz.net/wiki/popcount255
// ============================================================================

module top_module( 
    input [254:0] in,
    output [7:0] out );
    int count;
    always @(*) begin
        count=0;
        for(int i=0;i<=254;i++) begin
            if((in[i]&1'b1)==1'b1)
                count=count+1;
        end
    end
    assign out=count;
endmodule

