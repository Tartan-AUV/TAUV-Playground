`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/26/2023 10:33:25 PM
// Design Name: 
// Module Name: led_debug
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


module led_debug(
    input wire i_axis_clk,
    input wire i_axis_rst,
    input wire i_axis_0_tvalid,
    input wire [63:0] i_axis_0_tdata,
    input wire i_axis_1_tvalid,
    input wire [63:0] i_axis_1_tdata,
    input wire i_axis_2_tvalid,
    input wire [63:0] i_axis_2_tdata,
    input wire i_axis_3_tvalid,
    input wire [63:0] i_axis_3_tdata, 
    output wire [3:0] o_leds
);

wire hi_0 = i_axis_0_tdata[15:0] > i_axis_0_tdata[31:16];
wire hi_1 = i_axis_1_tdata[15:0] > i_axis_1_tdata[31:16];
wire hi_2 = i_axis_2_tdata[15:0] > i_axis_2_tdata[31:16];
wire hi_3 = i_axis_3_tdata[15:0] > i_axis_3_tdata[31:16];

reg [3:0] leds;
initial leds = {4{1'b0}};
assign o_leds = leds;

always @(posedge i_axis_clk) begin
    if (i_axis_rst) begin
        leds <= {4{1'b0}};
    end else begin
        if (i_axis_0_tvalid)
            leds[0] <= hi_0;
        if (i_axis_1_tvalid)
            leds[1] <= hi_1;
        if (i_axis_2_tvalid)
            leds[2] <= hi_2;
        if (i_axis_3_tvalid)
            leds[3] <= hi_3;
    end
end

endmodule
