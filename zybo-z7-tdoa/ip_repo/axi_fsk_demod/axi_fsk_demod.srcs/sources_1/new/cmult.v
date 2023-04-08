`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/07/2023 12:00:55 AM
// Design Name: 
// Module Name: cmult
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

// From UG901 Vivado Synthesis Examples

module cmult # (parameter AWIDTH = 16, BWIDTH = 18)
   (
    input clk,
    input start,
    input signed [AWIDTH-1:0]      ar, ai,
    input signed [BWIDTH-1:0]      br, bi,
    output signed [AWIDTH+BWIDTH:0] pr, pi,
    output busy
   );

reg signed [AWIDTH-1:0] ai_d, ai_dd, ai_ddd, ai_dddd   ; 
reg signed [AWIDTH-1:0] ar_d, ar_dd, ar_ddd, ar_dddd   ; 
reg signed [BWIDTH-1:0] bi_d, bi_dd, bi_ddd, br_d, br_dd, br_ddd ; 
reg signed [AWIDTH:0]  addcommon     ; 
reg signed [BWIDTH:0]  addr, addi     ; 
reg signed [AWIDTH+BWIDTH:0] mult0, multr, multi, pr_int, pi_int  ; 
reg signed [AWIDTH+BWIDTH:0] common, commonr1, commonr2   ;

localparam N_STEPS = 6;

reg [2:0] steps_remaining;
initial steps_remaining = N_STEPS;

reg last_start;

always @(posedge clk) begin
    if ({last_start, start} == 2'b01) begin
        steps_remaining <= N_STEPS;
    end
    
    last_start <= start;
end

always @(posedge clk) begin
    if (steps_remaining > 0) begin
        steps_remaining <= steps_remaining - 1;
    end
end
  
always @(posedge clk)
 begin
  ar_d   <= ar;
  ar_dd  <= ar_d;
  ai_d   <= ai;
  ai_dd  <= ai_d;
  br_d   <= br;
  br_dd  <= br_d;
  br_ddd <= br_dd;
  bi_d   <= bi;
  bi_dd  <= bi_d;
  bi_ddd <= bi_dd;
 end
 
// Common factor (ar ai) x bi, shared for the calculations of the real and imaginary final products
// 
always @(posedge clk)
 begin
  addcommon <= ar_d - ai_d;
  mult0     <= addcommon * bi_dd;
  common    <= mult0;
 end

// Real product
//
always @(posedge clk)
 begin
   ar_ddd   <= ar_dd;
   ar_dddd  <= ar_ddd;
   addr     <= br_ddd - bi_ddd;
   multr    <= addr * ar_dddd;
   commonr1 <= common;
   pr_int   <= multr + commonr1;
 end

// Imaginary product
//
always @(posedge clk)
 begin
  ai_ddd   <= ai_dd;
  ai_dddd  <= ai_ddd;
  addi     <= br_ddd + bi_ddd;
  multi    <= addi * ai_dddd;
  commonr2 <= common;
  pi_int   <= multi + commonr2;
 end
 
 

assign pr = pr_int;
assign pi = pi_int;
assign busy = steps_remaining > 0;
   
endmodule // cmult

