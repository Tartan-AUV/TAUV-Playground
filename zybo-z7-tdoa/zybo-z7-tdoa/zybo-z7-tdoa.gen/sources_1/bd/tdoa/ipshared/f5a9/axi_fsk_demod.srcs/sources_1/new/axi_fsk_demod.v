`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/05/2023 06:49:02 PM
// Design Name: 
// Module Name: axi_fsk_demod
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


module axi_fsk_demod #(
    parameter integer COEFF_A = 11994,
    parameter integer COEFF_B_LO_RE = 1,
    parameter integer COEFF_B_LO_IM = 32440,
    parameter integer COEFF_B_HI_RE = -5632,
    parameter integer COEFF_B_HI_IM = 31947,
    parameter integer N = 100
) (
    input wire i_axis_clk,
    input wire i_axis_rst,
    
    input wire i_axis_in_tvalid,
    output wire o_axis_in_tready,
    input wire[39:0] i_axis_in_tdata,
    
    output wire o_axis_out_tvalid,
    input wire i_axis_out_tready,
    output wire[63:0] o_axis_out_tdata
);

reg ready;
assign o_axis_in_tready = ready;
initial ready <= 1;

reg [7:0] state;
initial state <= 0;

reg [1:0] channel;
reg [29:0] stamp;
reg [7:0] sample;
initial channel <= 0;
initial stamp <= 0;
initial sample <= 0;

wire [1:0] in_channel = i_axis_in_tdata[39:38];
wire [29:0] in_stamp = i_axis_in_tdata[37:8];
wire [7:0] in_sample = i_axis_in_tdata[7:0];

reg [63:0] out_data;
reg out_valid;
assign o_axis_out_tdata = out_data;
assign o_axis_out_tvalid = out_valid;
initial out_data <= 0;
initial out_valid <= 0;

reg [7:0] sample_index;
reg [7:0] prev_sample_index;
reg [7:0] sample_buffer [N-1:0];
initial sample_index <= 0;
initial prev_sample_index <= N - 1;

integer i;
initial begin
    for (i = 0; i < N; i = i + 1)
        sample_buffer[i] <= {8{1'b0}};
end

reg signed [31:0] s_lo_re [1:0];
reg signed [31:0] s_lo_im [1:0];
reg signed [31:0] s_hi_re [1:0];
reg signed [31:0] s_hi_im [1:0];
initial s_lo_re[0] <= 0;
initial s_lo_re[1] <= 0;
initial s_lo_im[0] <= 0;
initial s_lo_im[1] <= 0;
initial s_hi_re[0] <= 0;
initial s_hi_re[1] <= 0;
initial s_hi_im[0] <= 0;
initial s_hi_im[1] <= 0;

wire signed [63:0] cmult_lo_out_re;
wire signed [63:0] cmult_lo_out_im;
wire signed [63:0] cmult_hi_out_re;
wire signed [63:0] cmult_hi_out_im;
wire cmult_lo_busy;
wire cmult_hi_busy;

reg cmult_lo_start;
reg cmult_hi_start;
initial cmult_lo_start <= 0;
initial cmult_hi_start <= 0;

wire signed [31:0] coeff_a = COEFF_A;
wire signed [31:0] coeff_b_lo_re = COEFF_B_LO_RE;
wire signed [31:0] coeff_b_lo_im = COEFF_B_LO_IM;
wire signed [31:0] coeff_b_hi_re = COEFF_B_HI_RE;
wire signed [31:0] coeff_b_hi_im = COEFF_B_HI_IM;

cmult #(
    .AWIDTH(32),
    .BWIDTH(32)
) cmult_lo (
    .clk(i_axis_clk),
    .start(cmult_lo_start),
    .ar(s_lo_re[0]),
    .ai(s_lo_im[0]),
    .br(coeff_b_lo_re),
    .bi(coeff_b_lo_im),
    .pr(cmult_lo_out_re),
    .pi(cmult_lo_out_im),
    .busy(cmult_lo_busy)
);

cmult #(
    .AWIDTH(32),
    .BWIDTH(32)
) cmult_hi (
    .clk(i_axis_clk),
    .start(cmult_hi_start),
    .ar(s_hi_re[0]),
    .ai(s_hi_im[0]),
    .br(coeff_b_hi_re),
    .bi(coeff_b_hi_im),
    .pr(cmult_hi_out_re),
    .pi(cmult_hi_out_im),
    .busy(cmult_hi_busy)
);

reg signed [31:0] sample_first_rescaled;
reg signed [31:0] sample_last_rescaled;
reg signed [63:0] sample_last_damped;
wire signed [31:0] sample_last_damped_rescaled = sample_last_damped >>> 15;
initial sample_first_rescaled <= 0;
initial sample_last_rescaled <= 0;
initial sample_last_damped <= 0;

reg signed [63:0] s_lo_re_0_sq;
reg signed [63:0] s_lo_im_0_sq;
reg signed [63:0] s_hi_re_0_sq;
reg signed [63:0] s_hi_im_0_sq;
initial s_lo_re_0_sq <= 0;
initial s_lo_im_0_sq <= 0;
initial s_hi_re_0_sq <= 0;
initial s_hi_im_0_sq <= 0;

wire signed [31:0] s_lo_re_0_sq_rescaled = (s_lo_re_0_sq) >>> 15;
wire signed [31:0] s_lo_im_0_sq_rescaled = (s_lo_im_0_sq) >>> 15;
wire signed [31:0] s_hi_re_0_sq_rescaled = (s_hi_re_0_sq) >>> 15;
wire signed [31:0] s_hi_im_0_sq_rescaled = (s_hi_im_0_sq) >>> 15;
wire signed [31:0] mag_lo = s_lo_re_0_sq_rescaled + s_lo_im_0_sq_rescaled;
wire signed [31:0] mag_hi = s_hi_re_0_sq_rescaled + s_hi_im_0_sq_rescaled;
wire signed [15:0] mag_lo_rescaled = mag_lo >>> 16;
wire signed [15:0] mag_hi_rescaled = mag_hi >>> 16;

wire signed [31:0] cmult_lo_out_re_rescaled = (cmult_lo_out_re) >>> 15;
wire signed [31:0] cmult_lo_out_im_rescaled = (cmult_lo_out_im) >>> 15;
wire signed [31:0] cmult_hi_out_re_rescaled = (cmult_hi_out_re) >>> 15;
wire signed [31:0] cmult_hi_out_im_rescaled = (cmult_hi_out_im) >>> 15;


always @(posedge i_axis_clk) begin
    if (i_axis_rst) begin
        ready <= 1;
        state <= 0;
        channel <= 0;
        stamp <= 0;
        sample <= 0;
        out_data <= 0;
        out_valid <= 0;
        sample_index <= 0;
        prev_sample_index <= N - 1;
        s_lo_re[0] <= 0;
        s_lo_re[1] <= 0;
        s_lo_im[0] <= 0;
        s_lo_im[1] <= 0;
        s_hi_re[0] <= 0;
        s_hi_re[1] <= 0;
        s_hi_im[0] <= 0;
        s_hi_im[1] <= 0;
        cmult_lo_start <= 0;
        cmult_hi_start <= 0;
        sample_first_rescaled <= 0;
        sample_last_rescaled <= 0;
        sample_last_damped <= 0;
        s_lo_re_0_sq <= 0;
        s_lo_im_0_sq <= 0;
        s_hi_re_0_sq <= 0;
        s_hi_im_0_sq <= 0;
        
        for (i = 0; i < N; i = i + 1)
            sample_buffer[i] <= 0;    
    end else begin
        if (state == 0 && ready && i_axis_in_tvalid && in_stamp != stamp) begin
            ready <= 0;
            out_valid <= 0;
        
            channel <= in_channel;
            stamp <= in_stamp;
            sample <= in_sample;
            
            sample_buffer[sample_index] <= in_sample;
            prev_sample_index <= sample_index;
            sample_index <= (sample_index + 1) % N;
            
            state <= 1;        
        end
        else if (state == 1) begin
            sample_first_rescaled <= sample_buffer[prev_sample_index] * 32'h80;
            sample_last_rescaled <= sample_buffer[sample_index] * 32'h80;
            
            state <= 2;
        end
        else if (state == 2) begin
            sample_last_damped <= coeff_a * sample_last_rescaled;
            
            cmult_lo_start <= 1;
            cmult_hi_start <= 1;
            
            state <= 3;
        end
        else if (state == 3 && !cmult_lo_busy && !cmult_hi_busy) begin
            cmult_lo_start <= 0;
            cmult_hi_start <= 0;
            
            s_lo_re[1] <= s_lo_re[0];
            s_lo_im[1] <= s_lo_im[0];
            s_hi_re[1] <= s_hi_re[0];
            s_hi_im[1] <= s_hi_im[0];
            
            s_lo_re[0] <= (cmult_lo_out_re_rescaled + sample_first_rescaled) - sample_last_damped_rescaled;
            s_lo_im[0] <= cmult_lo_out_im_rescaled;
            
            s_hi_re[0] <= (cmult_hi_out_re_rescaled + (sample_first_rescaled) - sample_last_damped_rescaled);
            s_hi_im[0] <= cmult_hi_out_im_rescaled;
            
            state <= 4;
        end
        else if (state == 4) begin
            s_lo_re_0_sq <= s_lo_re[0] * s_lo_re[0];
            s_lo_im_0_sq <= s_lo_im[0] * s_lo_im[0];
            s_hi_re_0_sq <= s_hi_re[0] * s_hi_re[0];
            s_hi_im_0_sq <= s_hi_im[0] * s_hi_im[0];
            
            state <= 5;
        end
        else if (state == 5) begin
            if (i_axis_out_tready) begin
                out_data <= {channel, stamp, mag_lo_rescaled, mag_hi_rescaled};
                out_valid <= 1;
            end
            
            state <= 0;
            ready <= 1;
        end
    end
end

endmodule
