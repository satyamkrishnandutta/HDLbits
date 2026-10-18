// ============================================================================
// Problem : Gates and vectors
// Link    : https://hdlbits.01xz.net/wiki/Gatesv
// ============================================================================

module top_module( 
    input [3:0] in,
    output [2:0] out_both,
    output [3:1] out_any,
    output [3:0] out_different );
    always @(*) begin
        for(int i=0;i<3;i++)begin
            if(in[i]==1 && in[i+1]==1)
                out_both[i]=1;
            else
                out_both[i]=0;
        end
        for(int i=1;i<4;i++)begin
            if(in[i]==1 || in[i-1]==1)
                out_any[i]=1;
            else
                out_any[i]=0;
        end
        for(int i=0;i<4;i++)begin
            if(i!=3)begin
                if(in[i]!=in[i+1])
                    out_different[i]=1;
                else
                    out_different[i]=0;
            end
            else if (i==3 && in[3]!=in[0])
                out_different[i]=1;
            else
                out_different[i]=0;
        end
    end
endmodule

