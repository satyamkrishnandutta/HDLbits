// ============================================================================
// Problem : Exams/2014 q4a
// Link    : https://hdlbits.01xz.net/wiki/2014_q4a
// ============================================================================

module top_module (
    input clk,
    input w, R, E, L,
    output Q
);
	wire w1,d;
    always @(*) begin
        case(E)
            1'b0 : w1=Q;
            1'b1 : w1=w;
        endcase
        case(L)
            1'b0 : d=w1;
            1'b1 : d=R;
        endcase
    end
    always @(posedge clk)begin
        Q<=d;
    end
endmodule

