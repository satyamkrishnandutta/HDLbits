// ============================================================================
// Problem : 100-digit BCD adder
// Link    : https://hdlbits.01xz.net/wiki/bcdadd100
// ============================================================================

module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );
	genvar i;
    wire [99:0] w;
    generate
        for(i=0;i<100;i++)begin : genbcd
            if(i==0)begin
                bcd_fadd ins(.a(a[3:0]),.b(b[3:0]),.cin(cin),.cout(w[0]),.sum(sum[3:0]));
            end
            else begin
                bcd_fadd ins(.a(a[i*4+3:i*4]),.b(b[i*4+3:i*4]),.cin(w[i-1]),.cout(w[i]),.sum(sum[i*4+3:i*4]));
            end
        end
    endgenerate
    assign cout=w[99];
endmodule

