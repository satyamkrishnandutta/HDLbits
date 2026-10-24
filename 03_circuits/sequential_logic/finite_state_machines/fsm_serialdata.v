// ============================================================================
// Problem : Serial receiver and datapath
// Link    : https://hdlbits.01xz.net/wiki/fsm_serialdata
// ============================================================================

module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output [7:0] out_byte,
    output done
); //

    // Use FSM from Fsm_serial

    // New: Datapath to latch input bits.
    
    parameter A=0,B=1,C=2,D=3,E=4;
    reg [2:0] pstate , nstate;
    reg [3:0] count;
    reg [7:0] temp;
    
    always @(posedge clk)begin
        if(reset)
            pstate<=0;
        else
            pstate<=nstate;
    end
    
    always @(posedge clk) begin
        if(reset)
            count<=0;
        else begin
            if(pstate==A)
                count<=0;
            else if(pstate==B)
                count<=count+1;
            else
                count<=0;
        end
    end
    
    always @(posedge clk)begin
        if(reset)
            temp<=0;
        else begin
            temp[count]<=in;
        end
    end
    
    always @(*)begin
        case(pstate)
            A : nstate = ~in ? B : A;
            B : nstate = (count==7) ?  C : B;
            C : nstate = in ? E : D;
            D : nstate = in ? A : D;
            E : nstate = ~in ? B : A;
            default : nstate=A;
        endcase
    end
    
    assign done = (pstate==E) ? 1 : 0;
    assign out_byte = (pstate==E) ? temp : 0;

endmodule

