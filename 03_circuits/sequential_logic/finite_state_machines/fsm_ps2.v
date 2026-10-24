// ============================================================================
// Problem : PS/2 packet parser
// Link    : https://hdlbits.01xz.net/wiki/fsm_ps2
// ============================================================================

module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output done); //
    
    parameter A=0,B=1;
	reg pstate,nstate;
    reg [1:0] count=1; 
    
    always @(posedge clk)begin
        if(reset)
            pstate<=A;
        else if(pstate==A)begin
            count<=1;
            pstate<=nstate;
        end
        else if(pstate==B)begin
            count<=count+1;
            pstate<=nstate;
        end
            
    end
    
    always @(*)begin
        case(pstate)
            A : nstate = (in[3]==1) ? B : A;
            B : begin
                nstate = (count==2) ? A : B;
            end
        endcase
    end
    
    assign done = (pstate==A && count==3) ? 1 : 0; 
endmodule

