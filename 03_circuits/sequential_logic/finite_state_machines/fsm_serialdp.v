// ============================================================================
// Problem : Serial receiver with parity checking
// Link    : https://hdlbits.01xz.net/wiki/fsm_serialdp
// ============================================================================

module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output [7:0] out_byte,
    output done
); //

    // Modify FSM and datapath from Fsm_serialdata

    // New: Add parity checking.
    
    parameter A=0,B=1,C=2,D=3,E=4,F=5;
    reg [2:0] pstate , nstate;
    reg [3:0] count;
    reg [7:0] temp;
    
    wire r;
    wire s;
    
    assign r = reset || (pstate != B && pstate != F);
    
    always @(posedge clk)begin
        if(reset) begin
            pstate<=0;
        end
        else
            pstate<=nstate;
    end
    
    always @(posedge clk) begin
        if(reset)
            count<=0;
        else begin
            if(pstate==A)begin
                count<=0;
            end
            else if(pstate==B)
                count<=count+1;
            else
                count<=0;
        end
    end
    
    always @(posedge clk)begin
        if(reset)
            temp<=0;
        else if(pstate==B && count<8)begin
            temp[count]<=in;
        end
    end
    
    parity ins1(.clk(clk),.reset(r),.in(in),.odd(s));
    
    always @(*)begin
        case(pstate)
            A : nstate = ~in ? B : A;
            B : nstate = (count==7) ?  F : B;
            F : nstate = (count==8) ? C : D;
            C : begin
                if (in == 1) begin
                    nstate = (s == 1) ? E : A;
                end else begin
                    nstate = D;
                end
            end
            D : nstate = in ? A : D;
            E : nstate = ~in ? B : A;
            default : nstate=A;
        endcase
    end
    
    
    
    assign done = (pstate==E) ? 1 : 0;
    assign out_byte = (pstate==E) ? temp : 0;


endmodule
