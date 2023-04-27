`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/05/2023 04:25:00 PM
// Design Name: 
// Module Name: tdoa_tb
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


module tdoa_tb(

);
localparam ONE_NS = 1000;
localparam ONE_US = 1000 * ONE_NS;
localparam ONE_MS = 1000 * ONE_US;

reg clk;
reg rst;
reg [7:0] ja;
reg [2:0] leds;

initial clk <= 1'b0;
initial rst <= 1'b1;

always begin
    #(5 * ONE_NS); clk <= ~clk;
end

initial begin
    #(50 * ONE_NS) rst <= 1'b0;
end 

tdoa_wrapper tdoa (
    .i_axis_clk(clk),
    .i_axis_rst(rst),
    .ja(ja),
    .leds(leds)
);

endmodule
