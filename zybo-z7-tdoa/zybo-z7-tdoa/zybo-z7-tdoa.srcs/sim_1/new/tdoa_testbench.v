`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/05/2023 12:39:00 AM
// Design Name: 
// Module Name: tdoa_testbench
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


module tdoa_testbench;

    reg clk, rst;
    
    always begin
        clk = 1; #5;
        clk = 0; #5;
    end
    
    always begin
        rst = 1; #40;
        rst = 0; #100000000;
    end 
    
    axi_xadc_sampler_0 axi_xadc_sampler_0 (
        .i_clk(clk),
        .i_axis_clk(clk),
        .i_axis_rst(rst)
    );
endmodule
