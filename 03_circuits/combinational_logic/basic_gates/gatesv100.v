// ============================================================================
// Problem : Even longer vectors
// Link    : https://hdlbits.01xz.net/wiki/Gatesv100
// ============================================================================

module top_module( 
    input [99:0] in,
    output [98:0] out_both,
    output [99:1] out_any,
    output [99:0] out_different );
	always @(*) begin
        for(int i=0;i<99;i++)begin
            if(in[i]==1 && in[i+1]==1)
                out_both[i]=1;
            else
                out_both[i]=0;
        end
        for(int i=1;i<100;i++)begin
            if(in[i]==1 || in[i-1]==1)
                out_any[i]=1;
            else
                out_any[i]=0;
        end
        for(int i=0;i<100;i++)begin
            if(i!=99)begin
                if(in[i]!=in[i+1])
                    out_different[i]=1;
                else
                    out_different[i]=0;
            end
            else if (i==99 && in[99]!=in[0])
                out_different[i]=1;
            else
                out_different[i]=0;
        end
    end
endmodule

