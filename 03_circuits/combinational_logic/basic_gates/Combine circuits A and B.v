// ============================================================================
// Problem : Combine circuits A and B
// Link    : https://hdlbits.01xz.net/wiki/Mt2015_q4
// ============================================================================

module top_module (input x, input y, output z);
    wire w1,w2,w3,w4;
    a ins1(.x(x),.y(y),.z(w1));
    a ins2(.x(x),.y(y),.z(w2));
    b ins3(.x(x),.y(y),.z(w3));
    b ins4(.x(x),.y(y),.z(w4));
    wire w5,w6;
    assign w5=w1|w2;
    assign w6=w3&w4;
    assign z=w5^w6;
endmodule

module a(input x,y , output z);
    assign z=(x^y)&x;
endmodule

module b(input x,y , output z);
    assign z=~(x^y);
endmodule

