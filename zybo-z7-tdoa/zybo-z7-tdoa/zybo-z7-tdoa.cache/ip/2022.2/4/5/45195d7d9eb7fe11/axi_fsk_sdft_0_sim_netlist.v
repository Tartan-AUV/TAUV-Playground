// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
// Date        : Tue Apr  4 15:59:15 2023
// Host        : theo-ubuntu running 64-bit Ubuntu 22.04.1 LTS
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ axi_fsk_sdft_0_sim_netlist.v
// Design      : axi_fsk_sdft_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "axi_fsk_sdft_0,axi_fsk_sdft_v1_0,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "axi_fsk_sdft_v1_0,Vivado 2022.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (i_axis_clk,
    i_axis_rst,
    i_axis_in_tuser,
    i_axis_in_tvalid,
    o_axis_in_tready,
    i_axis_in_tlast,
    i_axis_in_tdata,
    o_axis_out_tuser,
    o_axis_out_tvalid,
    i_axis_out_tready,
    o_axis_out_tlast,
    o_axis_out_tdata);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 i_axis_clk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME i_axis_clk, ASSOCIATED_RESET i_axis_rst, ASSOCIATED_BUSIF AXIS_IN:AXIS_OUT, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input i_axis_clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 i_axis_rst RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME i_axis_rst, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input i_axis_rst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 AXIS_IN TUSER" *) input i_axis_in_tuser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 AXIS_IN TVALID" *) input i_axis_in_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 AXIS_IN TREADY" *) output o_axis_in_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 AXIS_IN TLAST" *) input i_axis_in_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 AXIS_IN TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME AXIS_IN, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 1, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.0, LAYERED_METADATA undef, INSERT_VIP 0" *) input [31:0]i_axis_in_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 AXIS_OUT TUSER" *) output o_axis_out_tuser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 AXIS_OUT TVALID" *) output o_axis_out_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 AXIS_OUT TREADY" *) input i_axis_out_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 AXIS_OUT TLAST" *) output o_axis_out_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 AXIS_OUT TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME AXIS_OUT, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 1, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.0, LAYERED_METADATA undef, INSERT_VIP 0" *) output [31:0]o_axis_out_tdata;

  wire \<const0> ;
  wire i_axis_clk;
  wire [31:0]i_axis_in_tdata;
  wire i_axis_in_tvalid;
  wire [31:0]o_axis_out_tdata;
  wire o_axis_out_tvalid;

  assign o_axis_in_tready = \<const0> ;
  assign o_axis_out_tlast = \<const0> ;
  assign o_axis_out_tuser = \<const0> ;
  GND GND
       (.G(\<const0> ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_fsk_sdft_v1_0 inst
       (.i_axis_clk(i_axis_clk),
        .i_axis_in_tdata(i_axis_in_tdata),
        .i_axis_in_tvalid(i_axis_in_tvalid),
        .o_axis_out_tdata(o_axis_out_tdata),
        .o_axis_out_tvalid(o_axis_out_tvalid));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_fsk_sdft_v1_0
   (o_axis_out_tdata,
    o_axis_out_tvalid,
    i_axis_in_tvalid,
    i_axis_in_tdata,
    i_axis_clk);
  output [31:0]o_axis_out_tdata;
  output o_axis_out_tvalid;
  input i_axis_in_tvalid;
  input [31:0]i_axis_in_tdata;
  input i_axis_clk;

  wire i_axis_clk;
  wire [31:0]i_axis_in_tdata;
  wire i_axis_in_tvalid;
  wire [31:0]o_axis_out_tdata;
  wire o_axis_out_tvalid;
  wire out_valid_i_1_n_0;

  FDRE #(
    .INIT(1'b0)) 
    \out_data_reg[0] 
       (.C(i_axis_clk),
        .CE(i_axis_in_tvalid),
        .D(i_axis_in_tdata[0]),
        .Q(o_axis_out_tdata[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \out_data_reg[10] 
       (.C(i_axis_clk),
        .CE(i_axis_in_tvalid),
        .D(i_axis_in_tdata[10]),
        .Q(o_axis_out_tdata[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \out_data_reg[11] 
       (.C(i_axis_clk),
        .CE(i_axis_in_tvalid),
        .D(i_axis_in_tdata[11]),
        .Q(o_axis_out_tdata[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \out_data_reg[12] 
       (.C(i_axis_clk),
        .CE(i_axis_in_tvalid),
        .D(i_axis_in_tdata[12]),
        .Q(o_axis_out_tdata[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \out_data_reg[13] 
       (.C(i_axis_clk),
        .CE(i_axis_in_tvalid),
        .D(i_axis_in_tdata[13]),
        .Q(o_axis_out_tdata[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \out_data_reg[14] 
       (.C(i_axis_clk),
        .CE(i_axis_in_tvalid),
        .D(i_axis_in_tdata[14]),
        .Q(o_axis_out_tdata[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \out_data_reg[15] 
       (.C(i_axis_clk),
        .CE(i_axis_in_tvalid),
        .D(i_axis_in_tdata[15]),
        .Q(o_axis_out_tdata[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \out_data_reg[16] 
       (.C(i_axis_clk),
        .CE(i_axis_in_tvalid),
        .D(i_axis_in_tdata[16]),
        .Q(o_axis_out_tdata[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \out_data_reg[17] 
       (.C(i_axis_clk),
        .CE(i_axis_in_tvalid),
        .D(i_axis_in_tdata[17]),
        .Q(o_axis_out_tdata[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \out_data_reg[18] 
       (.C(i_axis_clk),
        .CE(i_axis_in_tvalid),
        .D(i_axis_in_tdata[18]),
        .Q(o_axis_out_tdata[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \out_data_reg[19] 
       (.C(i_axis_clk),
        .CE(i_axis_in_tvalid),
        .D(i_axis_in_tdata[19]),
        .Q(o_axis_out_tdata[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \out_data_reg[1] 
       (.C(i_axis_clk),
        .CE(i_axis_in_tvalid),
        .D(i_axis_in_tdata[1]),
        .Q(o_axis_out_tdata[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \out_data_reg[20] 
       (.C(i_axis_clk),
        .CE(i_axis_in_tvalid),
        .D(i_axis_in_tdata[20]),
        .Q(o_axis_out_tdata[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \out_data_reg[21] 
       (.C(i_axis_clk),
        .CE(i_axis_in_tvalid),
        .D(i_axis_in_tdata[21]),
        .Q(o_axis_out_tdata[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \out_data_reg[22] 
       (.C(i_axis_clk),
        .CE(i_axis_in_tvalid),
        .D(i_axis_in_tdata[22]),
        .Q(o_axis_out_tdata[22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \out_data_reg[23] 
       (.C(i_axis_clk),
        .CE(i_axis_in_tvalid),
        .D(i_axis_in_tdata[23]),
        .Q(o_axis_out_tdata[23]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \out_data_reg[24] 
       (.C(i_axis_clk),
        .CE(i_axis_in_tvalid),
        .D(i_axis_in_tdata[24]),
        .Q(o_axis_out_tdata[24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \out_data_reg[25] 
       (.C(i_axis_clk),
        .CE(i_axis_in_tvalid),
        .D(i_axis_in_tdata[25]),
        .Q(o_axis_out_tdata[25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \out_data_reg[26] 
       (.C(i_axis_clk),
        .CE(i_axis_in_tvalid),
        .D(i_axis_in_tdata[26]),
        .Q(o_axis_out_tdata[26]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \out_data_reg[27] 
       (.C(i_axis_clk),
        .CE(i_axis_in_tvalid),
        .D(i_axis_in_tdata[27]),
        .Q(o_axis_out_tdata[27]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \out_data_reg[28] 
       (.C(i_axis_clk),
        .CE(i_axis_in_tvalid),
        .D(i_axis_in_tdata[28]),
        .Q(o_axis_out_tdata[28]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \out_data_reg[29] 
       (.C(i_axis_clk),
        .CE(i_axis_in_tvalid),
        .D(i_axis_in_tdata[29]),
        .Q(o_axis_out_tdata[29]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \out_data_reg[2] 
       (.C(i_axis_clk),
        .CE(i_axis_in_tvalid),
        .D(i_axis_in_tdata[2]),
        .Q(o_axis_out_tdata[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \out_data_reg[30] 
       (.C(i_axis_clk),
        .CE(i_axis_in_tvalid),
        .D(i_axis_in_tdata[30]),
        .Q(o_axis_out_tdata[30]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \out_data_reg[31] 
       (.C(i_axis_clk),
        .CE(i_axis_in_tvalid),
        .D(i_axis_in_tdata[31]),
        .Q(o_axis_out_tdata[31]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \out_data_reg[3] 
       (.C(i_axis_clk),
        .CE(i_axis_in_tvalid),
        .D(i_axis_in_tdata[3]),
        .Q(o_axis_out_tdata[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \out_data_reg[4] 
       (.C(i_axis_clk),
        .CE(i_axis_in_tvalid),
        .D(i_axis_in_tdata[4]),
        .Q(o_axis_out_tdata[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \out_data_reg[5] 
       (.C(i_axis_clk),
        .CE(i_axis_in_tvalid),
        .D(i_axis_in_tdata[5]),
        .Q(o_axis_out_tdata[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \out_data_reg[6] 
       (.C(i_axis_clk),
        .CE(i_axis_in_tvalid),
        .D(i_axis_in_tdata[6]),
        .Q(o_axis_out_tdata[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \out_data_reg[7] 
       (.C(i_axis_clk),
        .CE(i_axis_in_tvalid),
        .D(i_axis_in_tdata[7]),
        .Q(o_axis_out_tdata[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \out_data_reg[8] 
       (.C(i_axis_clk),
        .CE(i_axis_in_tvalid),
        .D(i_axis_in_tdata[8]),
        .Q(o_axis_out_tdata[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \out_data_reg[9] 
       (.C(i_axis_clk),
        .CE(i_axis_in_tvalid),
        .D(i_axis_in_tdata[9]),
        .Q(o_axis_out_tdata[9]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'hE)) 
    out_valid_i_1
       (.I0(o_axis_out_tvalid),
        .I1(i_axis_in_tvalid),
        .O(out_valid_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    out_valid_reg
       (.C(i_axis_clk),
        .CE(1'b1),
        .D(out_valid_i_1_n_0),
        .Q(o_axis_out_tvalid),
        .R(1'b0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
