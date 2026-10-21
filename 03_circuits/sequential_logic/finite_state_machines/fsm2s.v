// ============================================================================
// Problem : Simple FSM 2 (synchronous reset)
// Link    : https://hdlbits.01xz.net/wiki/fsm2s
// ============================================================================

module top_module(
    input clk,
    input reset,    // Synchronous reset to OFF
    input j,
    input k,
    output out); //  

    parameter OFF=0,ON=1;
    reg present_state,next_state;

    always@(posedge clk)begin
        if(reset)
            present_state<=OFF;
        else
            present_state<=next_state;
    end

    always @(*)begin
        case(present_state)
            OFF : next_state = j ? ON : OFF;
            ON : next_state = k ? OFF : ON; 
        endcase
    end

    assign out = present_state;

endmodule
