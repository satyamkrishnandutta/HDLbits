// ============================================================================
// Problem : 4-digit decimal counter
// Link    : https://hdlbits.01xz.net/wiki/countclock
// ============================================================================

module top_module (
    input clk,
    input reset,
    input ena,
    output reg pm,
    output reg [7:0] hh,
    output reg [7:0] mm,
    output reg [7:0] ss
);

    wire ena_mm = ena && (ss == 8'h59);
    wire ena_hh = ena && (ss == 8'h59) && (mm == 8'h59);
    wire pm_toggle = ena_hh && (hh == 8'h11);

    always @(posedge clk) begin
        if (reset) begin
            ss <= 8'h00;
        end else if (ena) begin
            if (ss == 8'h59) begin
                ss <= 8'h00;
            end else if (ss[3:0] == 4'd9) begin
                ss[3:0] <= 4'd0;
                ss[7:4] <= ss[7:4] + 1'b1;
            end else begin
                ss[3:0] <= ss[3:0] + 1'b1;
            end
        end
    end

    always @(posedge clk) begin
        if (reset) begin
            mm <= 8'h00;
        end else if (ena_mm) begin
            if (mm == 8'h59) begin
                mm <= 8'h00;
            end else if (mm[3:0] == 4'd9) begin
                mm[3:0] <= 4'd0;
                mm[7:4] <= mm[7:4] + 1'b1;
            end else begin
                mm[3:0] <= mm[3:0] + 1'b1;
            end
        end
    end

    always @(posedge clk) begin
        if (reset) begin
            hh <= 8'h12; // Resets to 12
        end else if (ena_hh) begin
            if (hh == 8'h12) begin
                hh <= 8'h01;
            end else if (hh == 8'h09) begin
                hh <= 8'h10;
            end else begin
                hh[3:0] <= hh[3:0] + 1'b1;
            end
        end
    end


    always @(posedge clk) begin
        if (reset) begin
            pm <= 1'b0; 
        end else if (pm_toggle) begin
            pm <= ~pm; 
        end
    end

endmodule