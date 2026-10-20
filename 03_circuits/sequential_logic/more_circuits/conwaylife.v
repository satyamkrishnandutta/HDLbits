// ============================================================================
// Problem : Conway's Game of Life 16x16
// Link    : https://hdlbits.01xz.net/wiki/conwaylife
// ============================================================================

module top_module (
    input clk,
    input load,
    input [255:0] data,
    output reg [255:0] q
);

    integer r, c;
    integer up, dn, lf, rt;
    reg [3:0] count;

    always @(posedge clk) begin
        if (load) begin
            q <= data;
        end else begin
            for (r = 0; r < 16; r = r + 1) begin
                for (c = 0; c < 16; c = c + 1) begin
                    up = (r == 15) ? 0 : r + 1;
                    dn = (r == 0)  ? 15 : r - 1;
                    rt = (c == 15) ? 0 : c + 1;
                    lf = (c == 0)  ? 15 : c - 1;
                    count = q[up*16 + lf] + q[up*16 + c] + q[up*16 + rt]+ q[r*16 + lf] + q[r*16 + rt]+ q[dn*16 + lf] + q[dn*16 + c] + q[dn*16 + rt];
                    
                    case (count)
                        4'd2:    q[r*16 + c] <= q[r*16 + c];  
                        4'd3:    q[r*16 + c] <= 1'b1;        
                        default: q[r*16 + c] <= 1'b0;      
                    endcase
                end
            end
        end
    end

endmodule