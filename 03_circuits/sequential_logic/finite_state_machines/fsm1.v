// ============================================================================
// Problem : Simple FSM 1 (asynchronous reset)
// Link    : https://hdlbits.01xz.net/wiki/fsm1
// ============================================================================

module top_module(
    input clk,
    input areset,    // Asynchronous reset to state B
    input in,
    output out);//  

    parameter A=0,B=1;
    reg state,next_state;
    
    always @(posedge clk or posedge areset)begin
        if(areset)
            state<=B;
        else
            state<=next_state;
    end
    
    always @(*)begin
        case(state)
            B:begin
                next_state=in ? B : A;
            end
            A : next_state = in ? A : B;
        endcase
    end
    
    assign out = (state==B);

endmodule
