// ============================================================================
// Problem : 3-bit LUT
// Link    : https://hdlbits.01xz.net/wiki/ece241_2013_q12
// ============================================================================

module top_module (
    input clk,
    input enable,
    input S,
    input A, B, C,
    output Z ); 
    reg [7:0] q=8'h00;
    always @(posedge clk)begin
        if(enable)begin
            q<={q[6:0],S};
        end
    end
    wire [2:0] in={A,B,C};
    always @(*)begin
        case(in)
            3'b000 : Z=q[0];
            3'b001 : Z=q[1];
            3'b010 : Z=q[2];
            3'b011 : Z=q[3];
            3'b100 : Z=q[4];
            3'b101 : Z=q[5];
            3'b110 : Z=q[6];
            3'b111 : Z=q[7];
        endcase
    end

endmodule
