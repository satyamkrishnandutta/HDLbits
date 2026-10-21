// ============================================================================
// Problem : Lemmings 2
// Link    : https://hdlbits.01xz.net/wiki/lemmings2
// ============================================================================

module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah ); 
	parameter L=0,R=1,FL=2,FR=3;
    reg [1:0] pstate,nstate;
    
    always @(posedge clk or posedge areset)begin
        if(areset)
            pstate<=L;
        else
            pstate<=nstate;
    end
    
    always @(*)begin
        case(pstate)
            L :begin
                if(~ground) nstate=FL;
                else if(bump_left) nstate=R;
                else nstate=L;
            end
            R : begin
                if(~ground) nstate=FR;
                else if(bump_right) nstate=L;
                else nstate=R;
            end
            FL : nstate = ground ? L : FL;
            FR : nstate = ground ? R : FR;
        endcase
    end
    
    always @(*)begin
        case(pstate)
            L : begin 
                walk_left=1;walk_right=0;aaah=0;
            end
            R : begin
                walk_left=0;walk_right=1;aaah=0;
            end
            FL : begin
                walk_left=0;walk_right=0;aaah=1;
            end
            FR : begin
                walk_left=0;walk_right=0;aaah=1;
            end
        endcase
    end
endmodule
