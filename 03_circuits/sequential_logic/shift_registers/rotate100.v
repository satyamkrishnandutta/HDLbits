// ============================================================================
// Problem : Left/right rotator
// Link    : https://hdlbits.01xz.net/wiki/rotate100
// ============================================================================

module top_module(
    input clk,
    input load,
    input [1:0] ena,
    input [99:0] data,
    output reg [99:0] q); 
    always @(posedge clk) begin
        if(load)
            q=data;
        else if(ena==2'b01)begin
            q[99]<=q[0];
            for(int i=0;i<99;i++)begin
                q[i]<=q[i+1];
            end
        end
        else if (ena==2'b10) begin
            q[0]<=q[99];
            for(int i=1;i<100;i++)begin
                q[i]<=q[i-1];
            end
        end
    end
endmodule

