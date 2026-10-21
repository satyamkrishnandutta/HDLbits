// ============================================================================
// Problem : Simple FSM 3 (synchronous reset)
// Link    : https://hdlbits.01xz.net/wiki/fsm3s
// ============================================================================

module top_module(
    input clk,
    input in,
    input reset,
    output out); 

    parameter A=0,B=1,C=2,D=3;
    reg [1:0] present_state,next_state;

    always@(posedge clk)begin
        if(reset)
            present_state<=A;
        else
            present_state<=next_state;
    end

    always@(*)begin
        case(present_state)
            A : next_state = in ? B : A;
            B : next_state = in ? B : C;
            C : next_state = in ? D : A;
            D : next_state = in ? B : C;
        endcase
        case(present_state)
            D : out =1;
            default : out=0;
        endcase
    end

    

endmodule