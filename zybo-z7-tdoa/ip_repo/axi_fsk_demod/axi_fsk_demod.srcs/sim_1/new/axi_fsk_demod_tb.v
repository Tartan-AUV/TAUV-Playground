`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/05/2023 07:03:32 PM
// Design Name: 
// Module Name: axi_fsk_demod_tb
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


module axi_fsk_demod_tb(

);
localparam ONE_NS = 1000;
localparam ONE_US = 1000 * ONE_NS;
localparam ONE_MS = 1000 * ONE_US;

reg clk;
reg rst;

reg [1:0] channel;
reg [37:0] counter;
reg [7:0] sample;

reg [47:0] in_data;
reg in_valid = 1'b1;

initial in_data <= 48'b0;
initial in_valid <= 1'b1;

reg update;
initial update <= 1'b0;

initial channel <= 2'b00;
initial counter <= {38{1'b0}};
initial sample <= {8{1'b0}};

initial clk <= 1'b0;
initial rst <= 1'b1;

always begin
    #(5 * ONE_NS); clk <= ~clk;
end

initial begin
    #(50 * ONE_NS) rst <= 1'b0;
end

axi_fsk_demod #(
    .COEFF_A(11994),
    .COEFF_B_LO_RE(1),
    .COEFF_B_LO_IM(32440),
    .COEFF_B_HI_RE(-5632),
    .COEFF_B_HI_IM(31947),
    .N(100)
) axi_fsk_demod (
    .i_axis_clk(clk),
    .i_axis_rst(rst),
    .i_axis_out_tready(1'b1),
    .i_axis_in_tdata(in_data),
    .i_axis_in_tvalid(in_valid)
);

always begin
    #(5 * ONE_US) update <= 1'b1;
end

reg update_sample = 0;

always begin
    #(2 * ONE_US) update_sample <= 1'b1;
end

reg bit = 0;

always begin
    #(10 * ONE_MS) bit <= ~bit;
end

always @(posedge clk) begin
    counter <= counter + 1;
end

reg [7:0] signal_step;
initial signal_step = 0;

always @(posedge clk) begin
    if (update) begin
        
        in_data <= {channel, counter, sample};
        update <= 1'b0;
    end
end

always @(posedge clk) begin
    if (update_sample) begin
        update_sample <= 0;
        
        if ((signal_step >= 9 && ~bit) || (signal_step >= 8 && bit)) begin
            signal_step <= 0;
        end else begin
            signal_step <= signal_step + 1;
        end
        
        if (~bit) begin
            case(signal_step)
                0: sample <= 127;
                1: sample <= 201;
                2: sample <= 247;
                3: sample <= 247;
                4: sample <= 201;
                5: sample <= 127;
                6: sample <= 52;
                7: sample <= 6;
                8: sample <= 6;
                9: sample <= 52;
            endcase
        end else begin
        case(signal_step)
                0: sample <= 127;
                1: sample <= 208;
                2: sample <= 252;
                3: sample <= 236;
                4: sample <= 170;
                5: sample <= 83;
                6: sample <= 17;
                7: sample <= 2;
                8: sample <= 45;
            endcase
        end
    end
end

endmodule
