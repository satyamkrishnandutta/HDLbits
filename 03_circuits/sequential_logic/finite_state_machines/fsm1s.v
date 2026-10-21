// ============================================================================
// Problem : Simple FSM 1 (synchronous reset)
// Link    : https://hdlbits.01xz.net/wiki/fsm1s
// ============================================================================

// Note the Verilog-1995 module declaration syntax here:
module top_module(clk, reset, in, out);
    input clk;
    input reset;    // Synchronous reset to state B
    input in;
    output out;//  
    reg out;

    parameter A=0,B=1;
    reg pstate,nstate;
    
    always @(posedge clk)begin
        if(reset)
            pstate<=B;
        else
            pstate<=nstate;
    end
    
    always@(*)begin
        case(pstate)
            B : nstate = in ? B : A;
            A : nstate = in ? A : B;
        endcase
    end
    
    assign out = (pstate);

endmodule

