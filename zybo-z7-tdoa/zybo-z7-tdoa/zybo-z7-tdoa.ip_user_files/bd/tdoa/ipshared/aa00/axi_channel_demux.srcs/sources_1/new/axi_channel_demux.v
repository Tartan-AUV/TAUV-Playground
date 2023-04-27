`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/05/2023 05:05:35 PM
// Design Name: 
// Module Name: axi_channel_demux
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


module axi_channel_demux #(
    localparam CHANNEL_WIDTH = 2,
    localparam NUM_CHANNELS = 4,
    localparam STAMP_WIDTH = 30,
    localparam SAMPLE_WIDTH = 8,
    localparam AXIS_DATA_WIDTH = 40
) (
    input wire i_axis_clk,
    input wire i_axis_rst,
    
    input wire i_axis_in_tvalid,
    output wire o_axis_in_tready,
    input wire [AXIS_DATA_WIDTH-1:0] i_axis_in_tdata,
    
    output wire o_axis_out0_tvalid,
    input wire i_axis_out0_tready,
    output wire [AXIS_DATA_WIDTH-1:0] o_axis_out0_tdata,
    
    output wire o_axis_out1_tvalid,
    input wire i_axis_out1_tready,
    output wire [AXIS_DATA_WIDTH-1:0] o_axis_out1_tdata,
    
    output wire o_axis_out2_tvalid,
    input wire i_axis_out2_tready,
    output wire [AXIS_DATA_WIDTH-1:0] o_axis_out2_tdata,
    
    output wire o_axis_out3_tvalid,
    input wire i_axis_out3_tready,
    output wire [AXIS_DATA_WIDTH-1:0] o_axis_out3_tdata
);

reg axis_in_tready = 1'b1;
reg axis_out0_tvalid;
reg [AXIS_DATA_WIDTH-1:0] axis_out0_tdata;
reg axis_out1_tvalid;
reg [AXIS_DATA_WIDTH-1:0] axis_out1_tdata;
reg axis_out2_tvalid;
reg [AXIS_DATA_WIDTH-1:0] axis_out2_tdata;
reg axis_out3_tvalid;
reg [AXIS_DATA_WIDTH-1:0] axis_out3_tdata;

assign o_axis_in_tready = axis_in_tready;
assign o_axis_out0_tvalid = axis_out0_tvalid;
assign o_axis_out0_tdata = axis_out0_tdata;
assign o_axis_out1_tvalid = axis_out1_tvalid;
assign o_axis_out1_tdata = axis_out1_tdata;
assign o_axis_out2_tvalid = axis_out2_tvalid;
assign o_axis_out2_tdata = axis_out2_tdata;
assign o_axis_out3_tvalid = axis_out3_tvalid;
assign o_axis_out3_tdata = axis_out3_tdata;

always @(posedge i_axis_clk) begin
    if (i_axis_in_tvalid) begin
        if (i_axis_in_tdata[39:38] == 2'h0 && i_axis_out0_tready) begin
            axis_out0_tdata <= i_axis_in_tdata;
            axis_out0_tvalid <= 1'b1;
        end
        
        if (i_axis_in_tdata[39:38] == 2'h1 && i_axis_out1_tready) begin
            axis_out1_tdata <= i_axis_in_tdata;
            axis_out1_tvalid <= 1'b1;
        end
        
        if (i_axis_in_tdata[39:38] == 2'h2 && i_axis_out2_tready) begin
            axis_out2_tdata <= i_axis_in_tdata;
            axis_out2_tvalid <= 1'b1;
        end
        
        if (i_axis_in_tdata[39:38] == 2'h3 && i_axis_out3_tready) begin
            axis_out3_tdata <= i_axis_in_tdata;
            axis_out3_tvalid <= 1'b1;
        end
            
    end
end

endmodule


