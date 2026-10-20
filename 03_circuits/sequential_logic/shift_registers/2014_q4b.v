// ============================================================================
// Problem : Shift register 2
// Link    : https://hdlbits.01xz.net/wiki/2014_q4b
// ============================================================================

module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
); //
	wire clk,e,l,w;
    wire [3:0] r;
    assign {w,l,e,clk}=KEY;
    assign r=SW;
    MUXDFF ins1(.clk(clk),.w(w),.R(r[3]),.E(e),.L(l),.Q(LEDR[3]));
    MUXDFF ins2(.clk(clk),.w(LEDR[3]),.R(r[2]),.E(e),.L(l),.Q(LEDR[2]));
    MUXDFF ins3(.clk(clk),.w(LEDR[2]),.R(r[1]),.E(e),.L(l),.Q(LEDR[1]));
    MUXDFF ins4(.clk(clk),.w(LEDR[1]),.R(r[0]),.E(e),.L(l),.Q(LEDR[0]));
endmodule

module MUXDFF (
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


