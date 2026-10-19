// ============================================================================
// Problem : 1000-bit counter
// Link    : https://hdlbits.01xz.net/wiki/Exams/ece241_2014_q7b
// ============================================================================

module top_module (
    input clk,
    input reset,
    output OneHertz,
    output [2:0] c_enable
); //
    wire w1,w2,w3;
    wire [3:0] q1,q2,q3;
    assign w1=1;
    assign w2= (q1==4'd9);
    assign w3 = (q1==4'd9) && (q2==4'd9);
    bcdcount ins1(.clk(clk),.reset(reset),.enable(w1),.Q(q1));
    bcdcount ins2(.clk(clk),.reset(reset),.enable(w2),.Q(q2));
    bcdcount ins3(.clk(clk),.reset(reset),.enable(w3),.Q(q3));
    assign c_enable={w3,w2,w1};
    assign OneHertz = (q3==4'd9 && q2==4'd9 && q1==4'd9);
endmodule

