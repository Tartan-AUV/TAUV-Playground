// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
// Date        : Tue Apr  4 16:03:38 2023
// Host        : theo-ubuntu running 64-bit Ubuntu 22.04.1 LTS
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ tdoa_axi_fsk_sdft_0_3_stub.v
// Design      : tdoa_axi_fsk_sdft_0_3
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "axi_fsk_sdft_v1_0,Vivado 2022.2" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(i_axis_clk, i_axis_rst, i_axis_in_tuser, 
  i_axis_in_tvalid, o_axis_in_tready, i_axis_in_tlast, i_axis_in_tdata, o_axis_out_tuser, 
  o_axis_out_tvalid, i_axis_out_tready, o_axis_out_tlast, o_axis_out_tdata)
/* synthesis syn_black_box black_box_pad_pin="i_axis_clk,i_axis_rst,i_axis_in_tuser,i_axis_in_tvalid,o_axis_in_tready,i_axis_in_tlast,i_axis_in_tdata[31:0],o_axis_out_tuser,o_axis_out_tvalid,i_axis_out_tready,o_axis_out_tlast,o_axis_out_tdata[31:0]" */;
  input i_axis_clk;
  input i_axis_rst;
  input i_axis_in_tuser;
  input i_axis_in_tvalid;
  output o_axis_in_tready;
  input i_axis_in_tlast;
  input [31:0]i_axis_in_tdata;
  output o_axis_out_tuser;
  output o_axis_out_tvalid;
  input i_axis_out_tready;
  output o_axis_out_tlast;
  output [31:0]o_axis_out_tdata;
endmodule
