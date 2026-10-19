// ============================================================================
// Problem : Counter 1-12
// Link    : https://hdlbits.01xz.net/wiki/Exams/ece241_2014_q7a
// ============================================================================

module top_module (
    input clk,
    input reset,
    input enable,
    output [3:0] Q,
    output c_enable,
    output c_load,
    output [3:0] c_d
); //
    assign c_enable=enable;
    assign c_load=reset || (enable & (Q==12));
    assign c_d=1;
    count4 ins(.clk(clk),.enable(c_enable),.load(c_load),.d(c_d),.Q(Q));
endmodule

