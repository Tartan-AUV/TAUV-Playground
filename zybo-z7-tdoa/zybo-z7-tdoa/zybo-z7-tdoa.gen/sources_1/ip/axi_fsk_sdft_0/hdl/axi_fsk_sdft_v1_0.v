
`timescale 1 ns / 1 ps

// Modeled after https://github.com/cospan/ip-cores/blob/main/cores/demo_axi_streams/hdl/demo_axi_streams.v

module axi_fsk_sdft_v1_0 #(
    parameter AXIS_DATA_WIDTH = 32
)(
    input wire i_axis_clk,
    input wire i_axis_rst,
    
    input wire i_axis_in_tuser,
    input wire i_axis_in_tvalid,
    output wire o_axis_in_tready,
    input wire i_axis_in_tlast,
    input wire [AXIS_DATA_WIDTH - 1:0] i_axis_in_tdata,
    
    output wire o_axis_out_tuser,
    output wire o_axis_out_tvalid,
    input wire i_axis_out_tready,
    output wire o_axis_out_tlast,
    output wire [AXIS_DATA_WIDTH - 1:0] o_axis_out_tdata
);

reg [AXIS_DATA_WIDTH-1:0] out_data;
reg out_valid;
reg in_ready;

initial out_data = 0;
initial out_valid = 0;

assign o_axis_out_tdata = out_data;
assign o_axis_out_tvalid = out_valid;
assign i_axis_in_tready = in_ready;

always @(posedge i_axis_clk)
if (i_axis_in_tvalid)
begin
    in_ready <= 1'b0;
    out_valid <= 1'b0;
    out_data <= i_axis_in_tdata;
    out_valid <= 1'b1;
    in_ready <= 1'b1;
end

endmodule
