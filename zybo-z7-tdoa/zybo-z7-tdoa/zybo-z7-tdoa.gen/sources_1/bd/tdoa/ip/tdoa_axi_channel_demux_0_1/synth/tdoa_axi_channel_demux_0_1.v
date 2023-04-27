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


// IP VLNV: user.org:user:axi_channel_demux:1.0
// IP Revision: 3

(* X_CORE_INFO = "axi_channel_demux,Vivado 2022.2" *)
(* CHECK_LICENSE_TYPE = "tdoa_axi_channel_demux_0_1,axi_channel_demux,{}" *)
(* IP_DEFINITION_SOURCE = "package_project" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module tdoa_axi_channel_demux_0_1 (
  i_axis_clk,
  i_axis_rst,
  i_axis_in_tvalid,
  o_axis_in_tready,
  i_axis_in_tdata,
  o_axis_out0_tvalid,
  i_axis_out0_tready,
  o_axis_out0_tdata,
  o_axis_out1_tvalid,
  i_axis_out1_tready,
  o_axis_out1_tdata,
  o_axis_out2_tvalid,
  i_axis_out2_tready,
  o_axis_out2_tdata,
  o_axis_out3_tvalid,
  i_axis_out3_tready,
  o_axis_out3_tdata
);

(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME i_axis_clk, ASSOCIATED_RESET i_axis_rst, ASSOCIATED_BUSIF axis_in:axis_out0:axis_out1:axis_out2:axis_out3, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN tdoa_processing_system7_0_2_FCLK_CLK0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 i_axis_clk CLK" *)
input wire i_axis_clk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME i_axis_rst, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 i_axis_rst RST" *)
input wire i_axis_rst;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 axis_in TVALID" *)
input wire i_axis_in_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 axis_in TREADY" *)
output wire o_axis_in_tready;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME axis_in, TDATA_NUM_BYTES 5, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN tdoa_processing_system7_0_2_FCLK_CLK0, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 axis_in TDATA" *)
input wire [39 : 0] i_axis_in_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 axis_out0 TVALID" *)
output wire o_axis_out0_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 axis_out0 TREADY" *)
input wire i_axis_out0_tready;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME axis_out0, TDATA_NUM_BYTES 5, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN tdoa_processing_system7_0_2_FCLK_CLK0, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 axis_out0 TDATA" *)
output wire [39 : 0] o_axis_out0_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 axis_out1 TVALID" *)
output wire o_axis_out1_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 axis_out1 TREADY" *)
input wire i_axis_out1_tready;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME axis_out1, TDATA_NUM_BYTES 5, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN tdoa_processing_system7_0_2_FCLK_CLK0, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 axis_out1 TDATA" *)
output wire [39 : 0] o_axis_out1_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 axis_out2 TVALID" *)
output wire o_axis_out2_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 axis_out2 TREADY" *)
input wire i_axis_out2_tready;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME axis_out2, TDATA_NUM_BYTES 5, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN tdoa_processing_system7_0_2_FCLK_CLK0, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 axis_out2 TDATA" *)
output wire [39 : 0] o_axis_out2_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 axis_out3 TVALID" *)
output wire o_axis_out3_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 axis_out3 TREADY" *)
input wire i_axis_out3_tready;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME axis_out3, TDATA_NUM_BYTES 5, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN tdoa_processing_system7_0_2_FCLK_CLK0, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 axis_out3 TDATA" *)
output wire [39 : 0] o_axis_out3_tdata;

  axi_channel_demux inst (
    .i_axis_clk(i_axis_clk),
    .i_axis_rst(i_axis_rst),
    .i_axis_in_tvalid(i_axis_in_tvalid),
    .o_axis_in_tready(o_axis_in_tready),
    .i_axis_in_tdata(i_axis_in_tdata),
    .o_axis_out0_tvalid(o_axis_out0_tvalid),
    .i_axis_out0_tready(i_axis_out0_tready),
    .o_axis_out0_tdata(o_axis_out0_tdata),
    .o_axis_out1_tvalid(o_axis_out1_tvalid),
    .i_axis_out1_tready(i_axis_out1_tready),
    .o_axis_out1_tdata(o_axis_out1_tdata),
    .o_axis_out2_tvalid(o_axis_out2_tvalid),
    .i_axis_out2_tready(i_axis_out2_tready),
    .o_axis_out2_tdata(o_axis_out2_tdata),
    .o_axis_out3_tvalid(o_axis_out3_tvalid),
    .i_axis_out3_tready(i_axis_out3_tready),
    .o_axis_out3_tdata(o_axis_out3_tdata)
  );
endmodule
