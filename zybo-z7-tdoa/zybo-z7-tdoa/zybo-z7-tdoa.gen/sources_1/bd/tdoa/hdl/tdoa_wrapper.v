//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
//Date        : Thu Apr  6 19:10:24 2023
//Host        : theo-ubuntu running 64-bit Ubuntu 22.04.1 LTS
//Command     : generate_target tdoa_wrapper.bd
//Design      : tdoa_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module tdoa_wrapper
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
  output [31:0]axis_out0_tdata;
  input axis_out0_tready;
  output axis_out0_tvalid;
  output [31:0]axis_out1_tdata;
  input axis_out1_tready;
  output axis_out1_tvalid;
  output [31:0]axis_out2_tdata;
  input axis_out2_tready;
  output axis_out2_tvalid;
  output [31:0]axis_out3_tdata;
  input axis_out3_tready;
  output axis_out3_tvalid;
  input i_axis_clk;
  input i_axis_rst;
  input [7:0]ja;

  wire [31:0]axis_out0_tdata;
  wire axis_out0_tready;
  wire axis_out0_tvalid;
  wire [31:0]axis_out1_tdata;
  wire axis_out1_tready;
  wire axis_out1_tvalid;
  wire [31:0]axis_out2_tdata;
  wire axis_out2_tready;
  wire axis_out2_tvalid;
  wire [31:0]axis_out3_tdata;
  wire axis_out3_tready;
  wire axis_out3_tvalid;
  wire i_axis_clk;
  wire i_axis_rst;
  wire [7:0]ja;

  tdoa tdoa_i
       (.axis_out0_tdata(axis_out0_tdata),
        .axis_out0_tready(axis_out0_tready),
        .axis_out0_tvalid(axis_out0_tvalid),
        .axis_out1_tdata(axis_out1_tdata),
        .axis_out1_tready(axis_out1_tready),
        .axis_out1_tvalid(axis_out1_tvalid),
        .axis_out2_tdata(axis_out2_tdata),
        .axis_out2_tready(axis_out2_tready),
        .axis_out2_tvalid(axis_out2_tvalid),
        .axis_out3_tdata(axis_out3_tdata),
        .axis_out3_tready(axis_out3_tready),
        .axis_out3_tvalid(axis_out3_tvalid),
        .i_axis_clk(i_axis_clk),
        .i_axis_rst(i_axis_rst),
        .ja(ja));
endmodule
