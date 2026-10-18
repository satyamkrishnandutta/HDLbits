// ============================================================================
// Problem : 100-bit binary adder
// Link    : https://hdlbits.01xz.net/wiki/adder100
// ============================================================================

module top_module( 
    input [99:0] a, b,
    input cin,
    output cout,
    output [99:0] sum );
    genvar i;
    wire [99:0] w;
    generate
        for(i=0;i<100;i++)begin : genadd
            if(i==0)
                fadd ins(.a(a[i]),.b(b[i]),.cin(cin),.cout(w[i]),.sum(sum[i]));
            else
                fadd ins(.a(a[i]),.b(b[i]),.cin(w[i-1]),.cout(w[i]),.sum(sum[i]));
        end
    endgenerate
    assign cout = w[99];
endmodule
                
module fadd( 
    input a, b, cin,
    output cout, sum );
	assign sum=a^b^cin;
    assign cout=a&b | cin&(a^b);
endmodule


