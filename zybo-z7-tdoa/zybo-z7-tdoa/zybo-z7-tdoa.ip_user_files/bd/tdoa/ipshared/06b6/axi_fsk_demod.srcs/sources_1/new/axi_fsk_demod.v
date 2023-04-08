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
    parameter integer COEFF_A = 1,
    parameter integer COEFF_B_LO_RE = 1,
    parameter integer COEFF_B_LO_IM = 1,
    parameter integer COEFF_B_HI_RE = 1,
    parameter integer COEFF_B_HI_IM = 1,
    parameter integer N = 10
) (
    input wire i_axis_clk,
    input wire i_axis_rst,
    
    input wire i_axis_in_tvalid,
    output wire o_axis_in_tready,
    input wire[47:0] i_axis_in_tdata,
    
    output wire o_axis_out_tvalid,
    input wire i_axis_out_tready,
    output wire[31:0] o_axis_out_tdata
);

wire [1:0] channel;
wire [37:0] stamp;
wire [7:0] sample;

reg [37:0] last_stamp;

assign o_axis_in_tready = 1'b1;

assign channel = i_axis_in_tdata[37:36];
assign stamp = i_axis_in_tdata[35:8];
assign sample = i_axis_in_tdata[7:0];

reg [31:0] out_data;
reg out_valid;

assign o_axis_out_tdata = out_data;
assign o_axis_out_tvalid = out_valid;

reg [7:0] sample_buffer [N-1:0];

wire [15:0] result;

assign result = sample_buffer[N-1] * sample_buffer[0];

initial last_stamp <= {38{1'b0}};

integer i;
    
initial begin
    for (i = 0; i < N; i = i + 1) begin
        sample_buffer[i] <= {8{1'b0}};
    end
end

always @(posedge i_axis_clk) begin
    if (i_axis_in_tvalid && stamp != last_stamp) begin
        sample_buffer[0] <= sample;
        
        for (i = 1; i < N; i = i + 1) begin
            sample_buffer[i] <= sample_buffer[i - 1];
        end 
        
        last_stamp <= stamp;
    end
end

always @(posedge i_axis_clk) begin
    if (i_axis_out_tready) begin
        out_data <= {channel, result };
        out_valid <= 1'b1;
    end
end

endmodule
