
`timescale 1 ps / 1 ps

module axi_xadc_sampler_v1_0 #(
    localparam CHANNEL_WIDTH = 2,
    localparam CLOCK_COUNTER_WIDTH = 30,
    localparam SAMPLE_WIDTH = 8,
    localparam RESET_DELAY = 4,
    localparam AXIS_DATA_WIDTH = 40
) (
    input wire i_axis_clk,
    input wire i_axis_rst,
    
    output wire o_axis_out_tvalid,
    input wire i_axis_out_tready,
    output wire [AXIS_DATA_WIDTH-1:0] o_axis_out_tdata,
    
    input wire [7:0] ja
);
localparam CHANNEL_ADDRESS_0 = 7'h1E;
localparam CHANNEL_ADDRESS_1 = 7'h17;
localparam CHANNEL_ADDRESS_2 = 7'h1F;
localparam CHANNEL_ADDRESS_3 = 7'h16;
localparam XADC_ADDRESS_WIDTH = 7;
localparam XADC_DATA_WIDTH = 16;

wire xadc_end;

reg o_valid;
reg [AXIS_DATA_WIDTH-1:0] o_data;

reg [CHANNEL_WIDTH-1:0] channel;
reg [CLOCK_COUNTER_WIDTH-1:0] clock_counter;

reg [XADC_ADDRESS_WIDTH-1:0] xadc_address;
wire [XADC_DATA_WIDTH-1:0] xadc_data;
wire xadc_data_ready;
reg [1:0] xadc_data_ready_history;
wire xadc_reset;
reg [3:0] reset;

initial o_valid = 0;
initial o_data = 0;
initial channel = 0;
initial clock_counter = 0;
initial xadc_address = 0;
initial xadc_data_ready_history = 0;
initial reset = 0;

assign xadc_reset = reset != 0;
assign o_axis_out_tvalid = o_valid;
assign o_axis_out_tdata = o_data;

xadc_wiz_0 xadc (
    .dclk_in(i_axis_clk),
    .den_in(xadc_end),
    .eoc_out(xadc_end),
    .dwe_in(0),
    .daddr_in(xadc_address),
    .di_in(0),
    .do_out(xadc_data),
    .drdy_out(xadc_data_ready),
    .reset_in(xadc_reset),
    .vp_in(0),
    .vn_in(0),
    .vauxn6(ja[7]),
    .vauxp6(ja[3]),
    .vauxn7(ja[5]),
    .vauxp7(ja[1]),
    .vauxn14(ja[4]),
    .vauxp14(ja[0]),
    .vauxn15(ja[6]),
    .vauxp15(ja[2])
);

always @(channel)
    case (channel)
    0: xadc_address = CHANNEL_ADDRESS_0;
    1: xadc_address = CHANNEL_ADDRESS_1;
    2: xadc_address = CHANNEL_ADDRESS_2;
    3: xadc_address = CHANNEL_ADDRESS_3;
    endcase
    
 always @(posedge i_axis_clk)
    xadc_data_ready_history <= {xadc_data_ready_history[0], xadc_data_ready};

always @(posedge i_axis_clk)
   clock_counter <= clock_counter + 1;
   
always @(posedge i_axis_clk) begin
    if (i_axis_out_tready && xadc_data_ready_history == 2'b01) begin
        if (o_valid) begin
            o_valid <= 0;
        end else begin
            o_data <= {channel, clock_counter, xadc_data[XADC_DATA_WIDTH-1:XADC_DATA_WIDTH-SAMPLE_WIDTH]};
            o_valid <= 1;
            channel <= channel + 1;
        end
    end
end 
        
always @(posedge i_axis_clk) begin
   if (i_axis_rst) begin
        reset <= RESET_DELAY;
   end else if (reset > 0) begin
    reset <= reset - 1;
   end
end
      
endmodule
