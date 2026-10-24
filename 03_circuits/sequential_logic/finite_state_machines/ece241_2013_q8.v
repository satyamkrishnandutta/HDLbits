// ============================================================================
// Problem : ece241_2013_q8
// Link    : https://hdlbits.01xz.net/wiki/ece241_2013_q8
// ============================================================================

module top_module (
    input clk,
    input aresetn,    // Asynchronous active-low reset
    input x,
    output z ); 
	
    parameter A=0,B=1,C=2;
    reg [1:0]pstate,nstate;
    
    always @(posedge clk or negedge aresetn)begin
        if(~aresetn)
            pstate<=A;
        else
            pstate<=nstate;
    end
    
    always @(*)begin
        case(pstate)
            A : nstate = x ? B : A;
            B : nstate = x ? B : C;
            C : nstate = x ? B : A;
        endcase
    end
    
    assign z= (pstate==C && x==1);
endmodule
