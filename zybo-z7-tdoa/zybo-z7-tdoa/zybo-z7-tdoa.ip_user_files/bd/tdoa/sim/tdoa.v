//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
//Date        : Thu Apr  6 19:10:23 2023
//Host        : theo-ubuntu running 64-bit Ubuntu 22.04.1 LTS
//Command     : generate_target tdoa.bd
//Design      : tdoa
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "tdoa,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=tdoa,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=7,numReposBlks=7,numNonXlnxBlks=6,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,da_axi4_cnt=3,da_axi4_s2mm_cnt=3,da_board_cnt=3,da_clkrst_cnt=7,da_ps7_cnt=3,synth_mode=Global}" *) (* HW_HANDOFF = "tdoa.hwdef" *) 
module tdoa
   (axis_out0_tdata,
    axis_out0_tready,
    axis_out0_tvalid,
    axis_out1_tdata,
    axis_out1_tready,
    axis_out1_tvalid,
    axis_out2_tdata,
    axis_out2_tready,
    axis_out2_tvalid,
    axis_out3_tdata,
    axis_out3_tready,
    axis_out3_tvalid,
    i_axis_clk,
    i_axis_rst,
    ja);
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 axis_out0 TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME axis_out0, CLK_DOMAIN tdoa_i_axis_clk, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) output [31:0]axis_out0_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 axis_out0 TREADY" *) input axis_out0_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 axis_out0 TVALID" *) output axis_out0_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 axis_out1 TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME axis_out1, CLK_DOMAIN tdoa_i_axis_clk, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) output [31:0]axis_out1_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 axis_out1 TREADY" *) input axis_out1_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 axis_out1 TVALID" *) output axis_out1_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 axis_out2 TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME axis_out2, CLK_DOMAIN tdoa_i_axis_clk, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) output [31:0]axis_out2_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 axis_out2 TREADY" *) input axis_out2_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 axis_out2 TVALID" *) output axis_out2_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 axis_out3 TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME axis_out3, CLK_DOMAIN tdoa_i_axis_clk, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) output [31:0]axis_out3_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 axis_out3 TREADY" *) input axis_out3_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 axis_out3 TVALID" *) output axis_out3_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.I_AXIS_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.I_AXIS_CLK, ASSOCIATED_BUSIF axis_out0:axis_out1:axis_out2:axis_out3, ASSOCIATED_RESET i_axis_rst, CLK_DOMAIN tdoa_i_axis_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input i_axis_clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.I_AXIS_RST RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.I_AXIS_RST, INSERT_VIP 0, POLARITY ACTIVE_HIGH" *) input i_axis_rst;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.JA DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.JA, LAYERED_METADATA undef" *) input [7:0]ja;

  wire [47:0]axi_channel_demux_0_axis_out0_TDATA;
  wire axi_channel_demux_0_axis_out0_TREADY;
  wire axi_channel_demux_0_axis_out0_TVALID;
  wire [47:0]axi_channel_demux_0_axis_out1_TDATA;
  wire axi_channel_demux_0_axis_out1_TREADY;
  wire axi_channel_demux_0_axis_out1_TVALID;
  wire [47:0]axi_channel_demux_0_axis_out2_TDATA;
  wire axi_channel_demux_0_axis_out2_TREADY;
  wire axi_channel_demux_0_axis_out2_TVALID;
  wire [47:0]axi_channel_demux_0_axis_out3_TDATA;
  wire axi_channel_demux_0_axis_out3_TREADY;
  wire axi_channel_demux_0_axis_out3_TVALID;
  wire [31:0]axi_fsk_demod_0_axis_out_TDATA;
  wire axi_fsk_demod_0_axis_out_TREADY;
  wire axi_fsk_demod_0_axis_out_TVALID;
  wire [31:0]axi_fsk_demod_1_axis_out_TDATA;
  wire axi_fsk_demod_1_axis_out_TREADY;
  wire axi_fsk_demod_1_axis_out_TVALID;
  wire [31:0]axi_fsk_demod_2_axis_out_TDATA;
  wire axi_fsk_demod_2_axis_out_TREADY;
  wire axi_fsk_demod_2_axis_out_TVALID;
  wire [31:0]axi_fsk_demod_3_axis_out_TDATA;
  wire axi_fsk_demod_3_axis_out_TREADY;
  wire axi_fsk_demod_3_axis_out_TVALID;
  wire [47:0]axi_xadc_sampler_0_o_axis_out_TDATA;
  wire axi_xadc_sampler_0_o_axis_out_TREADY;
  wire axi_xadc_sampler_0_o_axis_out_TVALID;
  wire i_axis_clk_1;
  wire i_axis_rst_1;
  wire [7:0]ja_1;
  wire [0:0]rst_i_axis_clk_100M_peripheral_aresetn;

  assign axi_fsk_demod_0_axis_out_TREADY = axis_out0_tready;
  assign axi_fsk_demod_1_axis_out_TREADY = axis_out1_tready;
  assign axi_fsk_demod_2_axis_out_TREADY = axis_out2_tready;
  assign axi_fsk_demod_3_axis_out_TREADY = axis_out3_tready;
  assign axis_out0_tdata[31:0] = axi_fsk_demod_0_axis_out_TDATA;
  assign axis_out0_tvalid = axi_fsk_demod_0_axis_out_TVALID;
  assign axis_out1_tdata[31:0] = axi_fsk_demod_1_axis_out_TDATA;
  assign axis_out1_tvalid = axi_fsk_demod_1_axis_out_TVALID;
  assign axis_out2_tdata[31:0] = axi_fsk_demod_2_axis_out_TDATA;
  assign axis_out2_tvalid = axi_fsk_demod_2_axis_out_TVALID;
  assign axis_out3_tdata[31:0] = axi_fsk_demod_3_axis_out_TDATA;
  assign axis_out3_tvalid = axi_fsk_demod_3_axis_out_TVALID;
  assign i_axis_clk_1 = i_axis_clk;
  assign i_axis_rst_1 = i_axis_rst;
  assign ja_1 = ja[7:0];
  tdoa_axi_channel_demux_0_0 axi_channel_demux_0
       (.i_axis_clk(i_axis_clk_1),
        .i_axis_in_tdata(axi_xadc_sampler_0_o_axis_out_TDATA),
        .i_axis_in_tvalid(axi_xadc_sampler_0_o_axis_out_TVALID),
        .i_axis_out0_tready(axi_channel_demux_0_axis_out0_TREADY),
        .i_axis_out1_tready(axi_channel_demux_0_axis_out1_TREADY),
        .i_axis_out2_tready(axi_channel_demux_0_axis_out2_TREADY),
        .i_axis_out3_tready(axi_channel_demux_0_axis_out3_TREADY),
        .i_axis_rst(i_axis_rst_1),
        .o_axis_in_tready(axi_xadc_sampler_0_o_axis_out_TREADY),
        .o_axis_out0_tdata(axi_channel_demux_0_axis_out0_TDATA),
        .o_axis_out0_tvalid(axi_channel_demux_0_axis_out0_TVALID),
        .o_axis_out1_tdata(axi_channel_demux_0_axis_out1_TDATA),
        .o_axis_out1_tvalid(axi_channel_demux_0_axis_out1_TVALID),
        .o_axis_out2_tdata(axi_channel_demux_0_axis_out2_TDATA),
        .o_axis_out2_tvalid(axi_channel_demux_0_axis_out2_TVALID),
        .o_axis_out3_tdata(axi_channel_demux_0_axis_out3_TDATA),
        .o_axis_out3_tvalid(axi_channel_demux_0_axis_out3_TVALID));
  tdoa_axi_fsk_demod_0_0 axi_fsk_demod_0
       (.i_axis_clk(i_axis_clk_1),
        .i_axis_in_tdata(axi_channel_demux_0_axis_out0_TDATA),
        .i_axis_in_tvalid(axi_channel_demux_0_axis_out0_TVALID),
        .i_axis_out_tready(axi_fsk_demod_0_axis_out_TREADY),
        .i_axis_rst(rst_i_axis_clk_100M_peripheral_aresetn),
        .o_axis_in_tready(axi_channel_demux_0_axis_out0_TREADY),
        .o_axis_out_tdata(axi_fsk_demod_0_axis_out_TDATA),
        .o_axis_out_tvalid(axi_fsk_demod_0_axis_out_TVALID));
  tdoa_axi_fsk_demod_0_1 axi_fsk_demod_1
       (.i_axis_clk(i_axis_clk_1),
        .i_axis_in_tdata(axi_channel_demux_0_axis_out1_TDATA),
        .i_axis_in_tvalid(axi_channel_demux_0_axis_out1_TVALID),
        .i_axis_out_tready(axi_fsk_demod_1_axis_out_TREADY),
        .i_axis_rst(rst_i_axis_clk_100M_peripheral_aresetn),
        .o_axis_in_tready(axi_channel_demux_0_axis_out1_TREADY),
        .o_axis_out_tdata(axi_fsk_demod_1_axis_out_TDATA),
        .o_axis_out_tvalid(axi_fsk_demod_1_axis_out_TVALID));
  tdoa_axi_fsk_demod_0_2 axi_fsk_demod_2
       (.i_axis_clk(i_axis_clk_1),
        .i_axis_in_tdata(axi_channel_demux_0_axis_out2_TDATA),
        .i_axis_in_tvalid(axi_channel_demux_0_axis_out2_TVALID),
        .i_axis_out_tready(axi_fsk_demod_2_axis_out_TREADY),
        .i_axis_rst(rst_i_axis_clk_100M_peripheral_aresetn),
        .o_axis_in_tready(axi_channel_demux_0_axis_out2_TREADY),
        .o_axis_out_tdata(axi_fsk_demod_2_axis_out_TDATA),
        .o_axis_out_tvalid(axi_fsk_demod_2_axis_out_TVALID));
  tdoa_axi_fsk_demod_0_3 axi_fsk_demod_3
       (.i_axis_clk(i_axis_clk_1),
        .i_axis_in_tdata(axi_channel_demux_0_axis_out3_TDATA),
        .i_axis_in_tvalid(axi_channel_demux_0_axis_out3_TVALID),
        .i_axis_out_tready(axi_fsk_demod_3_axis_out_TREADY),
        .i_axis_rst(rst_i_axis_clk_100M_peripheral_aresetn),
        .o_axis_in_tready(axi_channel_demux_0_axis_out3_TREADY),
        .o_axis_out_tdata(axi_fsk_demod_3_axis_out_TDATA),
        .o_axis_out_tvalid(axi_fsk_demod_3_axis_out_TVALID));
  tdoa_axi_xadc_sampler_0_2 axi_xadc_sampler_0
       (.i_axis_clk(i_axis_clk_1),
        .i_axis_out_tready(axi_xadc_sampler_0_o_axis_out_TREADY),
        .i_axis_rst(i_axis_rst_1),
        .ja(ja_1),
        .o_axis_out_tdata(axi_xadc_sampler_0_o_axis_out_TDATA),
        .o_axis_out_tvalid(axi_xadc_sampler_0_o_axis_out_TVALID));
  tdoa_rst_i_axis_clk_100M_0 rst_i_axis_clk_100M
       (.aux_reset_in(1'b1),
        .dcm_locked(1'b1),
        .ext_reset_in(i_axis_rst_1),
        .mb_debug_sys_rst(1'b0),
        .peripheral_aresetn(rst_i_axis_clk_100M_peripheral_aresetn),
        .slowest_sync_clk(i_axis_clk_1));
endmodule
