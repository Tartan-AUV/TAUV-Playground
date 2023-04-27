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
    output wire[63:0] o_axis_out_tdata,
    output wire [7:0] sample_buf_last
);

wire [1:0] in_channel;
wire [29:0] in_stamp;
wire [7:0] in_sample;
assign in_channel = i_axis_in_tdata[39:38];
assign in_stamp = i_axis_in_tdata[37:8];
assign in_sample = i_axis_in_tdata[7:0];

reg in_ready;
initial in_ready <= 1'b1;
assign o_axis_in_tready = in_ready;

reg [63:0] out_data;
reg out_valid;
initial out_data <= 64'b0;
initial out_valid <= 1'b0;
assign o_axis_out_tdata = out_data;
assign o_axis_out_tvalid = out_valid;

reg [29:0] last_stamp;
initial last_stamp <= {30{1'b0}};

reg [7:0] sample_index;
initial sample_index = 0;
reg [7:0] sample_buffer [N-1:0];

assign sample_buf_last = sample_buffer[N - 1];

genvar i;

generate
    for (i = 0; i < N; i = i + 1) begin
        initial sample_buffer[i] <= {8{1'b0}};
    end
endgenerate

reg signed [31:0] s_lo_re [1:0];
reg signed [31:0] s_lo_im [1:0];
reg signed [31:0] s_hi_re [1:0];
reg signed [31:0] s_hi_im [1:0];

generate
    for (i = 0; i < 2; i = i + 1) begin
        initial begin
            s_lo_re[i] <= {32{1'b0}};
            s_lo_im[i] <= {32{1'b0}};
            s_hi_re[i] <= {32{1'b0}};
            s_hi_im[i] <= {32{1'b0}};
        end
    end
endgenerate

wire signed [63:0] cmult_lo_out_re;
wire signed [63:0] cmult_lo_out_im;
wire signed [63:0] cmult_hi_out_re;
wire signed [63:0] cmult_hi_out_im;
wire cmult_lo_busy;
wire cmult_hi_busy;
reg last_cmult_lo_busy;
reg last_cmult_hi_busy;
initial last_cmult_lo_busy <= 1'b0;
initial last_cmult_hi_busy <= 1'b0;

reg cmult_lo_start;
reg cmult_hi_start;
initial cmult_lo_start = 1'b0;
initial cmult_hi_start = 1'b0;

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

wire signed [31:0] sample_first;
// wire signed [31:0] sample_last;
wire signed [63:0] sample_last_damped;
wire signed [31:0] sample_last_damped_rescaled;
assign sample_first = sample_buffer[sample_index] * 32'h80;
assign sample_last = sample_buffer[(sample_index + 1) % N] * 32'h80;
assign sample_last_damped = coeff_a * sample_last;
assign sample_last_damped_rescaled = (sample_last_damped) >>> 15; // TODO round this better

reg signed [63:0] s_lo_re_0_sq;
reg signed [63:0] s_lo_im_0_sq;
reg signed [63:0] s_hi_re_0_sq;
reg signed [63:0] s_hi_im_0_sq;
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

reg [7:0] state;
initial state = 0;

wire can_start = i_axis_in_tvalid && in_stamp != last_stamp && in_ready;

always @(posedge i_axis_clk) begin
    if (state == 0 && can_start) begin
        sample_buffer[sample_index] <= in_sample;
        
        last_stamp <= in_stamp;
        in_ready <= 1'b0;
        
        cmult_lo_start <= 1'b1;
        cmult_hi_start <= 1'b1;
        
        state <= 1;
        
        sample_index = (sample_index + 1) % N;
    end
    else if (state == 1 && cmult_lo_start && cmult_hi_start) begin
        cmult_lo_start <= 1'b0;
        cmult_hi_start <= 1'b0;
        state <= 2;
    end
    else if (state == 2 && !cmult_lo_busy && !cmult_hi_busy) begin
        s_lo_re[1] <= s_lo_re[0];
        s_lo_im[1] <= s_lo_im[0];
        
        s_lo_re[0] <= cmult_lo_out_re_rescaled + sample_first - sample_last_damped_rescaled;
        s_lo_im[0] <= cmult_lo_out_im_rescaled;
        
        s_hi_re[1] <= s_hi_re[0];
        s_hi_im[1] <= s_hi_im[0];
    
        s_hi_re[0] <= cmult_hi_out_re_rescaled + sample_first - sample_last_damped_rescaled;
        s_hi_im[0] <= cmult_hi_out_im_rescaled;
        
        if (~in_ready) begin
           in_ready <= 1'b1;
        end
        
        state <= 3;
    end
    else if (state == 3) begin
        s_lo_re_0_sq <= s_lo_re[0] * s_lo_re[0];
        s_lo_im_0_sq <= s_lo_im[0] * s_lo_im[0];
        s_hi_re_0_sq <= s_hi_re[0] * s_hi_re[0];
        s_hi_im_0_sq <= s_hi_im[0] * s_hi_im[0];
        
        state <= 4;
    end
    else if (4 <= state && state <= 14) begin
        state <= state + 1;
    end
    else if (state == 15) begin
        if (i_axis_out_tready) begin
            out_data <= {in_channel, in_stamp, mag_lo_rescaled, mag_hi_rescaled};
            out_valid <= 1'b1;
        end   
        
        state <= 0;
    end
end

always @(posedge i_axis_clk) begin
    last_cmult_lo_busy <= cmult_lo_busy;
    last_cmult_hi_busy <= cmult_hi_busy;
end

endmodule
