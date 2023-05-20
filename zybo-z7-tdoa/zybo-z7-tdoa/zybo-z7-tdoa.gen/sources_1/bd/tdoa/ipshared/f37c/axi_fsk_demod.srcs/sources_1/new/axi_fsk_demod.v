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
    parameter integer DECIMAL_BITS = 10,
    parameter integer COEFF_A = 620,
    parameter integer COEFF_B_LO_RE_0 = -51,
    parameter integer COEFF_B_LO_IM_0 = 1021,
    parameter integer COEFF_B_LO_RE_1 = -64,
    parameter integer COEFF_B_LO_IM_1 = 1020,
    parameter integer COEFF_B_LO_RE_2 = -77,
    parameter integer COEFF_B_LO_IM_2 = 1020,
    parameter integer COEFF_B_HI_RE_0 = -216,
    parameter integer COEFF_B_HI_IM_0 = 999,
    parameter integer COEFF_B_HI_RE_1 = -229,
    parameter integer COEFF_B_HI_IM_1 = 996,
    parameter integer COEFF_B_HI_RE_2 = -241,
    parameter integer COEFF_B_HI_IM_2 = 993,
    parameter integer N = 500
) (
    input wire i_axis_clk,
    input wire i_axis_rst,
    
    input wire i_axis_in_tvalid,
    output wire o_axis_in_tready,
    input wire[39:0] i_axis_in_tdata,
    
    output wire o_axis_out_tvalid,
    output wire o_axis_out_tlast,
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
reg out_last;
assign o_axis_out_tdata = out_data;
assign o_axis_out_tvalid = out_valid;
assign o_axis_out_tlast = out_last;
initial out_data <= 0;
initial out_valid <= 0;
initial out_last <= 0;

reg [$clog2(N)-1:0] sample_index;
reg [$clog2(N)-1:0] prev_sample_index;
reg [7:0] sample_buffer [N-1:0];
reg sample_buffer_cleared;
initial sample_index <= 0;
initial sample_buffer_cleared <= 0;
initial prev_sample_index <= N - 1;

/*
integer i;
initial begin
    for (i = 0; i < N; i = i + 1)
        sample_buffer[i] <= {8{1'b0}};
end
*/

reg signed [15:0] s_lo_re_0 [1:0];
reg signed [15:0] s_lo_re_1 [1:0];
reg signed [15:0] s_lo_re_2 [1:0];
reg signed [15:0] s_lo_im_0 [1:0];
reg signed [15:0] s_lo_im_1 [1:0];
reg signed [15:0] s_lo_im_2 [1:0];
reg signed [15:0] s_hi_re_0 [1:0];
reg signed [15:0] s_hi_re_1 [1:0];
reg signed [15:0] s_hi_re_2 [1:0];
reg signed [15:0] s_hi_im_0 [1:0];
reg signed [15:0] s_hi_im_1 [1:0];
reg signed [15:0] s_hi_im_2 [1:0];
initial s_lo_re_0[0] <= 0;
initial s_lo_re_0[1] <= 0;
initial s_lo_re_1[0] <= 0;
initial s_lo_re_1[1] <= 0;
initial s_lo_re_2[0] <= 0;
initial s_lo_re_2[1] <= 0;
initial s_lo_im_0[0] <= 0;
initial s_lo_im_0[1] <= 0;
initial s_lo_im_1[0] <= 0;
initial s_lo_im_1[1] <= 0;
initial s_lo_im_2[0] <= 0;
initial s_lo_im_2[1] <= 0;
initial s_hi_re_0[0] <= 0;
initial s_hi_re_0[1] <= 0;
initial s_hi_re_1[0] <= 0;
initial s_hi_re_1[1] <= 0;
initial s_hi_re_2[0] <= 0;
initial s_hi_re_2[1] <= 0;
initial s_hi_im_0[0] <= 0;
initial s_hi_im_0[1] <= 0;
initial s_hi_im_1[0] <= 0;
initial s_hi_im_1[1] <= 0;
initial s_hi_im_2[0] <= 0;
initial s_hi_im_2[1] <= 0;

wire signed [31:0] cmult_lo_out_re_0;
wire signed [31:0] cmult_lo_out_im_0;
wire signed [31:0] cmult_lo_out_re_1;
wire signed [31:0] cmult_lo_out_im_1;
wire signed [31:0] cmult_lo_out_re_2;
wire signed [31:0] cmult_lo_out_im_2;
wire signed [31:0] cmult_hi_out_re_0;
wire signed [31:0] cmult_hi_out_im_0;
wire signed [31:0] cmult_hi_out_re_1;
wire signed [31:0] cmult_hi_out_im_1;
wire signed [31:0] cmult_hi_out_re_2;
wire signed [31:0] cmult_hi_out_im_2;
wire cmult_lo_busy_0;
wire cmult_lo_busy_1;
wire cmult_lo_busy_2;
wire cmult_hi_busy_0;
wire cmult_hi_busy_1;
wire cmult_hi_busy_2;

reg cmult_start;
initial cmult_start <= 0;

wire signed [15:0] coeff_a = COEFF_A;
wire signed [15:0] coeff_b_lo_re_0 = COEFF_B_LO_RE_0;
wire signed [15:0] coeff_b_lo_re_1 = COEFF_B_LO_RE_1;
wire signed [15:0] coeff_b_lo_re_2 = COEFF_B_LO_RE_2;
wire signed [15:0] coeff_b_lo_im_0 = COEFF_B_LO_IM_0;
wire signed [15:0] coeff_b_lo_im_1 = COEFF_B_LO_IM_1;
wire signed [15:0] coeff_b_lo_im_2 = COEFF_B_LO_IM_2;
wire signed [15:0] coeff_b_hi_re_0 = COEFF_B_HI_RE_0;
wire signed [15:0] coeff_b_hi_re_1 = COEFF_B_HI_RE_1;
wire signed [15:0] coeff_b_hi_re_2 = COEFF_B_HI_RE_2;
wire signed [15:0] coeff_b_hi_im_0 = COEFF_B_HI_IM_0;
wire signed [15:0] coeff_b_hi_im_1 = COEFF_B_HI_IM_1;
wire signed [15:0] coeff_b_hi_im_2 = COEFF_B_HI_IM_2;

cmult #(
    .AWIDTH(16),
    .BWIDTH(16)
) cmult_lo_0 (
    .clk(i_axis_clk),
    .start(cmult_start),
    .ar(s_lo_re_0[0]),
    .ai(s_lo_im_0[0]),
    .br(coeff_b_lo_re_0),
    .bi(coeff_b_lo_im_0),
    .pr(cmult_lo_out_re_0),
    .pi(cmult_lo_out_im_0),
    .busy(cmult_lo_busy_0)
);

cmult #(
    .AWIDTH(16),
    .BWIDTH(16)
) cmult_lo_1 (
    .clk(i_axis_clk),
    .start(cmult_start),
    .ar(s_lo_re_1[0]),
    .ai(s_lo_im_1[0]),
    .br(coeff_b_lo_re_1),
    .bi(coeff_b_lo_im_1),
    .pr(cmult_lo_out_re_1),
    .pi(cmult_lo_out_im_1),
    .busy(cmult_lo_busy_1)
);

cmult #(
    .AWIDTH(16),
    .BWIDTH(16)
) cmult_lo_2 (
    .clk(i_axis_clk),
    .start(cmult_start),
    .ar(s_lo_re_2[0]),
    .ai(s_lo_im_2[0]),
    .br(coeff_b_lo_re_2),
    .bi(coeff_b_lo_im_2),
    .pr(cmult_lo_out_re_2),
    .pi(cmult_lo_out_im_2),
    .busy(cmult_lo_busy_2)
);

cmult #(
    .AWIDTH(16),
    .BWIDTH(16)
) cmult_hi_0 (
    .clk(i_axis_clk),
    .start(cmult_start),
    .ar(s_hi_re_0[0]),
    .ai(s_hi_im_0[0]),
    .br(coeff_b_hi_re_0),
    .bi(coeff_b_hi_im_0),
    .pr(cmult_hi_out_re_0),
    .pi(cmult_hi_out_im_0),
    .busy(cmult_hi_busy_0)
);

cmult #(
    .AWIDTH(16),
    .BWIDTH(16)
) cmult_hi_1 (
    .clk(i_axis_clk),
    .start(cmult_start),
    .ar(s_hi_re_1[0]),
    .ai(s_hi_im_1[0]),
    .br(coeff_b_hi_re_1),
    .bi(coeff_b_hi_im_1),
    .pr(cmult_hi_out_re_1),
    .pi(cmult_hi_out_im_1),
    .busy(cmult_hi_busy_1)
);

cmult #(
    .AWIDTH(16),
    .BWIDTH(16)
) cmult_hi_2 (
    .clk(i_axis_clk),
    .start(cmult_start),
    .ar(s_hi_re_2[0]),
    .ai(s_hi_im_2[0]),
    .br(coeff_b_hi_re_2),
    .bi(coeff_b_hi_im_2),
    .pr(cmult_hi_out_re_2),
    .pi(cmult_hi_out_im_2),
    .busy(cmult_hi_busy_2)
);

reg signed [15:0] sample_first_rescaled;
reg signed [15:0] sample_last_rescaled;
reg signed [31:0] sample_last_damped;
wire signed [15:0] sample_last_damped_rescaled = sample_last_damped >>> DECIMAL_BITS;
initial sample_first_rescaled <= 0;
initial sample_last_rescaled <= 0;
initial sample_last_damped <= 0;

reg signed [15:0] s_lo_re;
reg signed [15:0] s_lo_im;
reg signed [15:0] s_hi_re;
reg signed [15:0] s_hi_im;
initial s_lo_re <= 0;
initial s_lo_im <= 0;
initial s_hi_re <= 0;
initial s_hi_im <= 0;

reg signed [31:0] s_lo_re_sq;
reg signed [31:0] s_lo_im_sq;
reg signed [31:0] s_hi_re_sq;
reg signed [31:0] s_hi_im_sq;
initial s_lo_re_sq <= 0;
initial s_lo_im_sq <= 0;
initial s_hi_re_sq <= 0;
initial s_hi_im_sq <= 0;

wire signed [15:0] s_lo_re_sq_rescaled = (s_lo_re_sq) >>> DECIMAL_BITS;
wire signed [15:0] s_lo_im_sq_rescaled = (s_lo_im_sq) >>> DECIMAL_BITS;
wire signed [15:0] s_hi_re_sq_rescaled = (s_hi_re_sq) >>> DECIMAL_BITS;
wire signed [15:0] s_hi_im_sq_rescaled = (s_hi_im_sq) >>> DECIMAL_BITS;
reg signed [15:0] mag_lo;
reg signed [15:0] mag_hi;
initial mag_lo = 0;
initial mag_hi = 0;

// wire signed [15:0] mag_lo_rescaled = mag_lo >>> 16;
// wire signed [15:0] mag_hi_rescaled = mag_hi >>> 16;

wire signed [15:0] cmult_lo_out_re_rescaled_0 = (cmult_lo_out_re_0) >>> DECIMAL_BITS;
wire signed [15:0] cmult_lo_out_im_rescaled_0 = (cmult_lo_out_im_0) >>> DECIMAL_BITS;
wire signed [15:0] cmult_lo_out_re_rescaled_1 = (cmult_lo_out_re_1) >>> DECIMAL_BITS;
wire signed [15:0] cmult_lo_out_im_rescaled_1 = (cmult_lo_out_im_1) >>> DECIMAL_BITS;
wire signed [15:0] cmult_lo_out_re_rescaled_2 = (cmult_lo_out_re_2) >>> DECIMAL_BITS;
wire signed [15:0] cmult_lo_out_im_rescaled_2 = (cmult_lo_out_im_2) >>> DECIMAL_BITS;
wire signed [15:0] cmult_hi_out_re_rescaled_0 = (cmult_hi_out_re_0) >>> DECIMAL_BITS;
wire signed [15:0] cmult_hi_out_im_rescaled_0 = (cmult_hi_out_im_0) >>> DECIMAL_BITS;
wire signed [15:0] cmult_hi_out_re_rescaled_1 = (cmult_hi_out_re_1) >>> DECIMAL_BITS;
wire signed [15:0] cmult_hi_out_im_rescaled_1 = (cmult_hi_out_im_1) >>> DECIMAL_BITS;
wire signed [15:0] cmult_hi_out_re_rescaled_2 = (cmult_hi_out_re_2) >>> DECIMAL_BITS;
wire signed [15:0] cmult_hi_out_im_rescaled_2 = (cmult_hi_out_im_2) >>> DECIMAL_BITS;


always @(posedge i_axis_clk) begin
    if (i_axis_rst) begin
        ready <= 1;
        state <= 0;
        channel <= 0;
        stamp <= 0;
        sample <= 0;
        out_data <= 0;
        out_valid <= 0;
        out_last <= 0;
        sample_index <= 0;
        prev_sample_index <= N - 1;
        s_lo_re_0[0] <= 0;
        s_lo_re_0[1] <= 0;
        s_lo_re_1[0] <= 0;
        s_lo_re_1[1] <= 0;
        s_lo_re_2[0] <= 0;
        s_lo_re_2[1] <= 0;
        s_lo_im_0[0] <= 0;
        s_lo_im_0[1] <= 0;
        s_lo_im_1[0] <= 0;
        s_lo_im_1[1] <= 0;
        s_lo_im_2[0] <= 0;
        s_lo_im_2[1] <= 0;
        s_hi_re_0[0] <= 0;
        s_hi_re_0[1] <= 0;
        s_hi_re_1[0] <= 0;
        s_hi_re_1[1] <= 0;
        s_hi_re_2[0] <= 0;
        s_hi_re_2[1] <= 0;
        s_hi_im_0[0] <= 0;
        s_hi_im_0[1] <= 0;
        s_hi_im_1[0] <= 0;
        s_hi_im_1[1] <= 0;
        s_hi_im_2[0] <= 0;
        s_hi_im_2[1] <= 0;
        cmult_start <= 0;
        sample_first_rescaled <= 0;
        sample_last_rescaled <= 0;
        sample_last_damped <= 0;
        s_lo_re <= 0;
        s_lo_im <= 0;
        s_hi_re <= 0;
        s_hi_im <= 0;
        s_lo_re_sq <= 0;
        s_lo_im_sq <= 0;
        s_hi_re_sq <= 0;
        s_hi_im_sq <= 0;
        
        /*
        for (i = 0; i < N; i = i + 1)
            sample_buffer[i] <= 0;   
        */
    end else begin
        if (state == 0 && ready && i_axis_in_tvalid && in_stamp != stamp) begin
            ready <= 0;
            out_valid <= 0;
            out_last <= 0;
        
            channel <= in_channel;
            stamp <= in_stamp;
            sample <= in_sample;
            
            sample_buffer[sample_index] <= in_sample;
            prev_sample_index <= sample_index;
            sample_index <= (sample_index + 1) % N;
            
            if (sample_index == N - 1) begin
                sample_buffer_cleared <= 1;
            end
            
            state <= 1;        
        end
        else if (state == 1 && !sample_buffer_cleared) begin
            state <= 0;
            ready <= 1;
        end
        else if (state == 1 && sample_buffer_cleared) begin
            // TODO: FIX THIS
            sample_first_rescaled <= sample_buffer[prev_sample_index] << (DECIMAL_BITS - 8);// <<< 8 + sample_buffer[prev_sample_index];
            sample_last_rescaled <= sample_buffer[sample_index] << (DECIMAL_BITS) - 8;// <<< 8 + sample_buffer[prev_sample_index];
            
            state <= 2;
        end
        else if (state == 2) begin
            sample_last_damped <= coeff_a * sample_last_rescaled;
            
            cmult_start <= 1;
            
            state <= 3;
        end
        else if (state == 3 && !cmult_lo_busy_0 && !cmult_lo_busy_1 && !cmult_lo_busy_2 && !cmult_hi_busy_0 && !cmult_hi_busy_1 && !cmult_hi_busy_2) begin
            cmult_start <= 0;
            
            s_lo_re_0[1] <= s_lo_re_0[0];
            s_lo_im_0[1] <= s_lo_im_0[0];
            s_lo_re_1[1] <= s_lo_re_1[0];
            s_lo_im_1[1] <= s_lo_im_1[0];
            s_lo_re_2[1] <= s_lo_re_2[0];
            s_lo_im_2[1] <= s_lo_im_2[0];
            s_hi_re_0[1] <= s_hi_re_0[0];
            s_hi_im_0[1] <= s_hi_im_0[0];
            s_hi_re_1[1] <= s_hi_re_1[0];
            s_hi_im_1[1] <= s_hi_im_1[0];
            s_hi_re_2[1] <= s_hi_re_2[0];
            s_hi_im_2[1] <= s_hi_im_2[0];
           
            s_lo_re_0[0] <= (cmult_lo_out_re_rescaled_0 + sample_first_rescaled) - sample_last_damped_rescaled;
            s_lo_im_0[0] <= cmult_lo_out_im_rescaled_0;
            s_lo_re_1[0] <= (cmult_lo_out_re_rescaled_1 + sample_first_rescaled) - sample_last_damped_rescaled;
            s_lo_im_1[0] <= cmult_lo_out_im_rescaled_1;
            s_lo_re_2[0] <= (cmult_lo_out_re_rescaled_2 + sample_first_rescaled) - sample_last_damped_rescaled;
            s_lo_im_2[0] <= cmult_lo_out_im_rescaled_2;
            
            s_hi_re_0[0] <= (cmult_hi_out_re_rescaled_0 + (sample_first_rescaled) - sample_last_damped_rescaled);
            s_hi_im_0[0] <= cmult_hi_out_im_rescaled_0;
            s_hi_re_1[0] <= (cmult_hi_out_re_rescaled_1 + (sample_first_rescaled) - sample_last_damped_rescaled);
            s_hi_im_1[0] <= cmult_hi_out_im_rescaled_1;
            s_hi_re_2[0] <= (cmult_hi_out_re_rescaled_2 + (sample_first_rescaled) - sample_last_damped_rescaled);
            s_hi_im_2[0] <= cmult_hi_out_im_rescaled_2;
            
            state <= 4;
        end
        else if (state == 4) begin
            s_lo_re <= (s_lo_re_1[0] >>> 1) - (s_lo_re_0[0] >>> 2) - (s_lo_re_2[0] >>> 2);
            s_lo_im <= (s_lo_im_1[0] >>> 1) - (s_lo_im_0[0] >>> 2) - (s_lo_im_2[0] >>> 2);
            s_hi_re <= (s_hi_re_1[0] >>> 1) - (s_hi_re_0[0] >>> 2) - (s_hi_re_2[0] >>> 2);
            s_hi_im <= (s_hi_im_1[0] >>> 1) - (s_hi_im_0[0] >>> 2) - (s_hi_im_2[0] >>> 2);
            
            state <= 5;
        end
        else if (state == 5) begin
            s_lo_re_sq <= s_lo_re * s_lo_re;
            s_lo_im_sq <= s_lo_im * s_lo_im;
            s_hi_re_sq <= s_hi_re * s_hi_re;
            s_hi_im_sq <= s_hi_im * s_hi_im;
            
            state <= 6;
        end
        else if (state == 6) begin
            mag_lo <= s_lo_re_sq_rescaled + s_lo_im_sq_rescaled;
            mag_hi <= s_hi_re_sq_rescaled + s_hi_im_sq_rescaled;
            
            state <= 7;
        end
        else if (state == 7) begin
            if (i_axis_out_tready) begin
                out_data <= {channel, stamp, mag_lo, mag_hi};
                out_valid <= 1;
                out_last <= 1;
            end
            
            state <= 0;
            ready <= 1;
        end
    end
end

endmodule
