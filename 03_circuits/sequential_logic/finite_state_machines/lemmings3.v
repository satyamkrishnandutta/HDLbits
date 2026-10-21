// ============================================================================
// Problem : Lemmings 3
// Link    : https://hdlbits.01xz.net/wiki/lemmings3
// ============================================================================

module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging ); 
	parameter L=0,R=1,FL=2,FR=3,DL=4,DR=5;
    reg [2:0] pstate,nstate;
    
    always @(posedge clk or posedge areset)begin
        if(areset)
            pstate<=L;
        else
            pstate<=nstate;
    end
    
    always @(*) begin
        case(pstate)
            L : begin
                if(~ground) nstate=FL;
                else if(dig) nstate=DL;
                else if(bump_left) nstate=R;
                else nstate=L;
            end
            R : begin
                if(~ground) nstate=FR;
                else if(dig) nstate=DR;
                else if(bump_right) nstate=L;
                else nstate=R;
            end
            DL : begin
                if(~ground) nstate=FL;
                else nstate=DL;
            end
            DR : begin
                if(~ground) nstate=FR;
                else nstate=DR;
            end
            FL : nstate = ground ? L : FL;
            FR : nstate = ground ? R : FR;
            default nstate=L;
        endcase
    end
    
    always @(*)begin
        case(pstate)
            L : {walk_left,walk_right,aaah,digging}=4'b1000;
            R : {walk_left,walk_right,aaah,digging}=4'b0100;
            FL : {walk_left,walk_right,aaah,digging}=4'b0010;
            FR : {walk_left,walk_right,aaah,digging}=4'b0010;
            DL : {walk_left,walk_right,aaah,digging}=4'b0001;
            DR : {walk_left,walk_right,aaah,digging}=4'b0001;
        endcase
    end
endmodule

