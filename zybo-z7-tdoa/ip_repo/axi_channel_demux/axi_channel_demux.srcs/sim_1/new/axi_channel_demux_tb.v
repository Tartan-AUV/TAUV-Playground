`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/05/2023 05:24:11 PM
// Design Name: 
// Module Name: axi_channel_demux_tb
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


module axi_channel_demux_tb(

);
localparam ONE_NS = 1000;
localparam ONE_US = 1000 * ONE_NS;
localparam ONE_MS = 1000 * ONE_US;

reg clk;
reg rst;

reg [47:0] in_data;
reg in_valid;

reg [1:0] channel;
reg [37:0] counter;
reg [7:0] sample;

reg update;

initial clk <= 1'b0;
initial rst <= 1'b1;
initial in_data <= {48{1'b1}};
initial in_valid <= 1'b0;
initial channel <= 2'b0;
initial counter <= 38'b0;
initial sample <= 8'b0;

always begin
    #(5 * ONE_NS); clk <= ~clk;
end

always begin
    #(50 * ONE_NS) rst <= 1'b0;
    #(ONE_MS) rst <= 1'b1;
end

axi_channel_demux axi_channel_demux(
    .i_axis_clk(clk),
    .i_axis_rst(rst),
    .i_axis_in_tdata(in_data),
    .i_axis_in_tvalid(in_valid),
    .i_axis_out0_tready(1'b1),
    .i_axis_out1_tready(1'b1),
    .i_axis_out2_tready(1'b1),
    .i_axis_out3_tready(1'b1)
);

always begin
    #(100 * ONE_NS) update <= 1'b1;
end

always @(posedge clk) begin
    if (update) begin
        channel <= channel + 1;
        in_valid <= 1'b0;
        update <= 1'b0;
    end
end 

always @(posedge clk) begin
    if (~in_valid) begin
        in_data <= {channel, counter, sample};
        in_valid <= 1'b1;
    end
end 

always @(posedge clk) begin
    counter <= counter + 1'b1;
end

endmodule
