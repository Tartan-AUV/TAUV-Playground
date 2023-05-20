// (c) Copyright 1995-2023 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: user.org:user:edge_detector:1.0
// IP Revision: 9

`timescale 1ns/1ps

(* IP_DEFINITION_SOURCE = "package_project" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module tdoa_edge_detector_0_0 (
  i_axis_clk,
  i_axis_rst,
  i_axis_0_tvalid,
  o_axis_0_tready,
  i_axis_0_tdata,
  i_axis_1_tvalid,
  o_axis_1_tready,
  i_axis_1_tdata,
  i_axis_2_tvalid,
  o_axis_2_tready,
  i_axis_2_tdata,
  i_axis_3_tvalid,
  o_axis_3_tready,
  i_axis_3_tdata,
  o_axis_out_tvalid,
  o_axis_out_tlast,
  i_axis_out_tready,
  o_axis_out_tdata
);

(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME i_axis_clk, ASSOCIATED_RESET i_axis_rst, ASSOCIATED_BUSIF axis_0:axis_1:axis_2:axis_3:axis_out, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN tdoa_processing_system7_0_2_FCLK_CLK0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 i_axis_clk CLK" *)
input wire i_axis_clk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME i_axis_rst, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 i_axis_rst RST" *)
input wire i_axis_rst;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 axis_0 TVALID" *)
input wire i_axis_0_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 axis_0 TREADY" *)
output wire o_axis_0_tready;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME axis_0, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN tdoa_processing_system7_0_2_FCLK_CLK0, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 axis_0 TDATA" *)
input wire [63 : 0] i_axis_0_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 axis_1 TVALID" *)
input wire i_axis_1_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 axis_1 TREADY" *)
output wire o_axis_1_tready;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME axis_1, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN tdoa_processing_system7_0_2_FCLK_CLK0, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 axis_1 TDATA" *)
input wire [63 : 0] i_axis_1_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 axis_2 TVALID" *)
input wire i_axis_2_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 axis_2 TREADY" *)
output wire o_axis_2_tready;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME axis_2, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN tdoa_processing_system7_0_2_FCLK_CLK0, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 axis_2 TDATA" *)
input wire [63 : 0] i_axis_2_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 axis_3 TVALID" *)
input wire i_axis_3_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 axis_3 TREADY" *)
output wire o_axis_3_tready;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME axis_3, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN tdoa_processing_system7_0_2_FCLK_CLK0, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 axis_3 TDATA" *)
input wire [63 : 0] i_axis_3_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 axis_out TVALID" *)
output wire o_axis_out_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 axis_out TLAST" *)
output wire o_axis_out_tlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 axis_out TREADY" *)
input wire i_axis_out_tready;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME axis_out, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN tdoa_processing_system7_0_2_FCLK_CLK0, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 axis_out TDATA" *)
output wire [31 : 0] o_axis_out_tdata;

  edge_detector #(
    .THRESHOLD(1000)
  ) inst (
    .i_axis_clk(i_axis_clk),
    .i_axis_rst(i_axis_rst),
    .i_axis_0_tvalid(i_axis_0_tvalid),
    .o_axis_0_tready(o_axis_0_tready),
    .i_axis_0_tdata(i_axis_0_tdata),
    .i_axis_1_tvalid(i_axis_1_tvalid),
    .o_axis_1_tready(o_axis_1_tready),
    .i_axis_1_tdata(i_axis_1_tdata),
    .i_axis_2_tvalid(i_axis_2_tvalid),
    .o_axis_2_tready(o_axis_2_tready),
    .i_axis_2_tdata(i_axis_2_tdata),
    .i_axis_3_tvalid(i_axis_3_tvalid),
    .o_axis_3_tready(o_axis_3_tready),
    .i_axis_3_tdata(i_axis_3_tdata),
    .o_axis_out_tvalid(o_axis_out_tvalid),
    .o_axis_out_tlast(o_axis_out_tlast),
    .i_axis_out_tready(i_axis_out_tready),
    .o_axis_out_tdata(o_axis_out_tdata)
  );
endmodule