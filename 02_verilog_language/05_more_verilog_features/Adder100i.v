// ============================================================================
// Problem : Adder100i
// Link    : https://hdlbits.01xz.net/wiki/Adder100i
// ============================================================================

module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );
    genvar i;
    generate
        for(i=0;i<100;i++) begin : genf
            if(i==0)begin
                fadd ins(.x(a[0]),.y(b[0]),.cin(cin),.cout(cout[0]),.s(sum[0]));
            end
            else begin
                fadd ins(.x(a[i]),.y(b[i]),.cin(cout[i-1]),.cout(cout[i]),.s(sum[i]));
            end
        end
    endgenerate
endmodule

module fadd(
    input x,y,cin,
    output cout,s);
    assign s=x^y^cin;
    assign cout=(x&y)|(cin&(x^y));
endmodule
