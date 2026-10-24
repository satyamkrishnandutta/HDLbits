// ============================================================================
// Problem : PS/2 packet parser and datapath
// Link    : https://hdlbits.01xz.net/wiki/fsm_ps2data
// ============================================================================

module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output [23:0] out_bytes,
    output done); //

    // FSM from fsm_ps2

    // New: Datapath to store incoming bytes.
    
    parameter A=0,B=1;
    reg pstate,nstate;
    reg [1:0] count=1;
    reg [23:0] temp;
    
    always @(posedge clk)begin
        if(reset)
            pstate<=A;
        else
            pstate<=nstate;
    end
    
    always @(posedge clk) begin
        if(reset)
            count<=1;
        else begin
            if(pstate==A)
                count<=1;
            else begin
                count<=count+1;
            end
        end
    end
    
    always @(posedge clk) begin
        if(reset)
            temp[23:16]<=in;
        else begin
            if(pstate==A)
                temp[23:16]<=in;
            else begin
                if(count==1) temp[15:8]<=in;
                else if(count==2) temp[7:0]<=in;
            end
        end
    end
    
    always @(*) begin
        case(pstate)
            A : nstate = (in[3]==1) ? B : A ;
            B : nstate = (count==2) ? A : B ;
        endcase
    end
    
    assign done = (pstate==A && count==3) ? 1 : 0;
    assign out_bytes = (done==1) ? temp : 0;
endmodule
 

