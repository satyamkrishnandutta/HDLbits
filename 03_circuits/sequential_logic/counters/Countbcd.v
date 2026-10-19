// ============================================================================
// Problem : Countbcd
// Link    : https://hdlbits.01xz.net/wiki/Countbcd
// ============================================================================

module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);
	wire q1,q2,q3;
    assign q1 = (q[3:0]==4'd9);
    assign q2 = (q[3:0]==4'd9) && (q[7:4]==4'd9);
    assign q3 = (q[3:0]==4'd9) && (q[7:4]==4'd9) && (q[11:8]==4'd9);
    dc ins1(.clk(clk),.reset(reset),.enable(1),.q(q[3:0]));
    dc ins2(.clk(clk),.reset(reset),.enable(q1),.q(q[7:4]));
    dc ins3(.clk(clk),.reset(reset),.enable(q2),.q(q[11:8]));
    dc ins4(.clk(clk),.reset(reset),.enable(q3),.q(q[15:12]));
    assign ena ={q3,q2,q1};
endmodule

module dc (
    input clk,
    input reset,enable, 
    output [3:0] q);
    always @(posedge clk) begin
        if(reset || (q==9&&enable))
            q<=0;
        else if(enable)
            q<=q+1;
    end
endmodule

