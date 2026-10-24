// ============================================================================
// Problem : Fsm_hdlc
// Link    : https://hdlbits.01xz.net/wiki/Fsm_hdlc
// ============================================================================

module top_module(
    input clk,
    input reset,    // Synchronous reset
    input in,
    output disc,
    output flag,
    output err);
	parameter A=0,B=1,C=2,D=3,E=4;
    reg [2:0] pstate,nstate;
    reg [2:0] count;
    
    always @(posedge clk)begin
        if(reset)begin
            pstate<=A;
        end
        else
            pstate<=nstate;
    end
    
    always @(posedge clk) begin
        if(reset)
            count<=0;
        else begin
            if(in)
                count<=count+1;
            else
                count<=0;
        end
    end
    
    always @(*)begin
        case(pstate)
            A : nstate = in ? B : A;
            B : begin
                if(in==1)begin
                   	if(count<6)
                        nstate = B;
                    else if(count>=6)
                        nstate = E;
                end
                else begin
                    if(count==5) nstate=D;
                    else if (count==6) nstate=C;
                    else nstate=A;
                end
            end
            C : nstate = in ? B : A;
            D : nstate = in ? B : A;
            E : nstate = ~in ? A : E;
        endcase
    end
    
    assign flag = (pstate==C);
    assign disc = (pstate==D);
    assign err = ((pstate==B && count>6) || (pstate==E));
          
endmodule
