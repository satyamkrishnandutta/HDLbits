// ============================================================================
// Problem : Lemmings 1
// Link    : https://hdlbits.01xz.net/wiki/lemmings1
// ============================================================================

module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    output walk_left,
    output walk_right); //  

    parameter L=0,R=1;
    reg present_state,next_state;
    
    always @(posedge clk or posedge areset)begin
        if(areset)
            present_state<=L;
        else
            present_state<=next_state;
    end
    
    always @(*)begin
        case(present_state)
            L : next_state=bump_left ? R : L;
            R :  next_state=bump_right ? L : R;
        endcase
    end
    
    assign walk_left = (present_state==L) ? 1 : 0;
    assign walk_right = (present_state==R) ? 1 : 0;

endmodule

