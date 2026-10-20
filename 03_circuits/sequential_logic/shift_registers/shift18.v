// ============================================================================
// Problem : Arithmetic shift register
// Link    : https://hdlbits.01xz.net/wiki/shift18
// ============================================================================

module top_module(
    input clk,
    input load,
    input ena,
    input [1:0] amount,
    input [63:0] data,
    output reg [63:0] q); 
    always @(posedge clk)begin
        if(load)
            q<=data;
        else if(ena)begin
            if(amount==2'b00)begin
                q[0]<=0;
                for(int i=1;i<64;i++)begin
                    q[i]<=q[i-1];
                end
            end
            else if(amount==2'b01)begin
                q[7:0]<=8'b00000000;
                for(int i=8;i<64;i++)begin
                    q[i]<=q[i-8];
                end
            end
            else if (amount==2'b10)begin
                for(int i=0;i<63;i++)begin
                    q[i]<=q[i+1];
                end
            end
            else begin
                q[63:56]={8{q[63]}};
                for(int i=0;i<56;i++)begin
                    q[i]<=q[i+8];
                end
            end
                
        end
        
        
    end
endmodule

