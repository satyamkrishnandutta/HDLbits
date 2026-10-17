// ============================================================================
// Problem : More replication
// Link    : https://hdlbits.01xz.net/wiki/vector5
// ============================================================================

module top_module (
    input a, b, c, d, e,
    output [24:0] out );//

    wire [4:0] w={a,b,c,d,e};
    assign out={~({a,a,a,a,a}^w),~({b,b,b,b,b}^w),~({c,c,c,c,c}^w),~({d,d,d,d,d}^w),~({e,e,e,e,e}^w)};

endmodule

