`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/17/2023 08:17:44 PM
// Design Name: 
// Module Name: edge_detector
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


module edge_detector(
    input wire i_axis_clk,
    input wire i_axis_rst,
    
    input wire i_axis_0_tvalid,
    output wire o_axis_0_tready,
    input wire [63:0] i_axis_0_tdata,
    
    input wire i_axis_1_tvalid,
    output wire o_axis_1_tready,
    input wire [63:0] i_axis_1_tdata,
    
    input wire i_axis_2_tvalid,
    output wire o_axis_2_tready,
    input wire [63:0] i_axis_2_tdata,
    
    input wire i_axis_3_tvalid,
    output wire o_axis_3_tready,
    input wire [63:0] i_axis_3_tdata,
    
    output wire o_axis_out_tvalid,
    output wire o_axis_out_tlast,
    input wire i_axis_out_tready,
    output wire [31:0] o_axis_out_tdata
);

reg ready;
initial ready <= 1;
assign o_axis_0_tready = ready;
assign o_axis_1_tready = ready;
assign o_axis_2_tready = ready;
assign o_axis_3_tready = ready;

reg last_bits[3:0];
reg [29:0] last_stamps[3:0];
initial last_bits[0] = 1'b0;
initial last_bits[1] = 1'b0;
initial last_bits[2] = 1'b0;
initial last_bits[3] = 1'b0;
initial last_stamps[0] = {30{1'b0}};
initial last_stamps[1] = {30{1'b0}};
initial last_stamps[2] = {30{1'b0}};
initial last_stamps[3] = {30{1'b0}};

reg [31:0] out_data;
reg out_valid;
initial out_data = {32{1'b0}};
initial out_valid = 1'b0;
assign o_axis_out_tdata = out_data;
assign o_axis_out_tvalid = out_valid;
assign o_axis_out_tlast = 1'b1;

wire bits[3:0];
assign bits[0] = i_axis_0_tdata[15:0] > i_axis_0_tdata[31:16];
assign bits[1] = i_axis_1_tdata[15:0] > i_axis_1_tdata[31:16];
assign bits[2] = i_axis_2_tdata[15:0] > i_axis_2_tdata[31:16];
assign bits[3] = i_axis_3_tdata[15:0] > i_axis_3_tdata[31:16];

wire [29:0] stamps [3:0];
assign stamps[0] = i_axis_0_tdata[61:32];
assign stamps[1] = i_axis_1_tdata[61:32];
assign stamps[2] = i_axis_2_tdata[61:32];
assign stamps[3] = i_axis_3_tdata[61:32];

always @(posedge i_axis_clk) begin
    if (i_axis_0_tvalid && stamps[0] != last_stamps[0]) begin        
        if (bits[0] && !last_bits[0]) begin
            out_data <= { 2'd0, stamps[0] };
            out_valid <= 1'b1;
        end
        
        last_bits[0] <= bits[0];
        last_stamps[0] <= stamps[0];
    end else if (i_axis_1_tvalid && stamps[1] != last_stamps[1]) begin
        if (bits[1] && !last_bits[1]) begin
            out_data <= { 2'd1, stamps[1] };
            out_valid <= 1'b1;
        end
        
        last_bits[1] <= bits[1];
        last_stamps[1] <= stamps[1];
    end else if (i_axis_2_tvalid && stamps[2] != last_stamps[2]) begin
        if (bits[2] && !last_bits[2]) begin
            out_data <= { 2'd2, stamps[2] };
            out_valid <= 1'b1;
        end
        
        last_bits[2] <= bits[2];
        last_stamps[2] <= stamps[2];
    end else if (i_axis_3_tvalid && stamps[3] != last_stamps[3]) begin
        if (bits[3] && !last_bits[3]) begin
            out_data <= { 2'd3, stamps[3] };
            out_valid <= 1'b1;
        end
        
        last_bits[3] <= bits[3];
        last_stamps[3] <= stamps[3];
    end
end

endmodule
