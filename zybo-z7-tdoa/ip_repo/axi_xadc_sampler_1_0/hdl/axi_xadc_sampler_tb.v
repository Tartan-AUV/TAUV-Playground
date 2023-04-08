`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/05/2023 12:48:31 AM
// Design Name: 
// Module Name: axi_xadc_sampler_tb
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


module axi_xadc_sampler_tb;

    reg clk, rst;
    
    always begin
        clk = 1; #5000;
        clk = 0; #5000;
    end
    
    always begin
        rst = 1; #40000;
        rst = 0; #100000000;
    end 
    
    axi_xadc_sampler_v1_0 axi_xadc_sampler (
        .i_axis_clk(clk),
        .i_axis_rst(rst),
        .i_axis_out_tready(1),
        .ja(0)
    );
endmodule
