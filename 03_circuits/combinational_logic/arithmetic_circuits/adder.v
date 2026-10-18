// ============================================================================
// Problem : Adder
// Link    : https://hdlbits.01xz.net/wiki/Exams/m2014_q4j
// ============================================================================

module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);
    wire w1,w2,w3;
    fadd ins1(.a(x[0]),.b(y[0]),.cin(1'b0),.cout(w1),.sum(sum[0]));
    fadd ins2(.a(x[1]),.b(y[1]),.cin(w1),.cout(w2),.sum(sum[1]));
    fadd ins3(.a(x[2]),.b(y[2]),.cin(w2),.cout(w3),.sum(sum[2]));
    fadd ins4(.a(x[3]),.b(y[3]),.cin(w3),.cout(sum[4]),.sum(sum[3]));

endmodule

module fadd( 
    input a, b, cin,
    output cout, sum );
	assign sum=a^b^cin;
    assign cout=a&b | cin&(a^b);
endmodule


