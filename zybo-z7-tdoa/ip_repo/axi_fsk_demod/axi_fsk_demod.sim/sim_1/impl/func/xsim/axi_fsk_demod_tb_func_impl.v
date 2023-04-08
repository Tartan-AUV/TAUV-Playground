// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
// Date        : Fri Apr  7 14:39:17 2023
// Host        : theo-ubuntu running 64-bit Ubuntu 22.04.1 LTS
// Command     : write_verilog -mode funcsim -nolib -force -file
//               /media/psf/TAUV-Playground/zybo-z7-tdoa/ip_repo/axi_fsk_demod/axi_fsk_demod.sim/sim_1/impl/func/xsim/axi_fsk_demod_tb_func_impl.v
// Design      : axi_fsk_demod
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* COEFF_A = "1" *) (* COEFF_B_HI_IM = "1" *) (* COEFF_B_HI_RE = "1" *) 
(* COEFF_B_LO_IM = "1" *) (* COEFF_B_LO_RE = "1" *) (* ECO_CHECKSUM = "5ef12727" *) 
(* N = "10" *) 
(* NotValidForBitStream *)
module axi_fsk_demod
   (i_axis_clk,
    i_axis_rst,
    i_axis_in_tvalid,
    o_axis_in_tready,
    i_axis_in_tdata,
    o_axis_out_tvalid,
    i_axis_out_tready,
    o_axis_out_tdata);
  input i_axis_clk;
  input i_axis_rst;
  input i_axis_in_tvalid;
  output o_axis_in_tready;
  input [47:0]i_axis_in_tdata;
  output o_axis_out_tvalid;
  input i_axis_out_tready;
  output [31:0]o_axis_out_tdata;

  wire o_axis_in_tready;
  wire [31:0]o_axis_out_tdata;
  wire o_axis_out_tvalid;

  OBUF o_axis_in_tready_OBUF_inst
       (.I(1'b0),
        .O(o_axis_in_tready));
  OBUF \o_axis_out_tdata_OBUF[0]_inst 
       (.I(1'b0),
        .O(o_axis_out_tdata[0]));
  OBUF \o_axis_out_tdata_OBUF[10]_inst 
       (.I(1'b0),
        .O(o_axis_out_tdata[10]));
  OBUF \o_axis_out_tdata_OBUF[11]_inst 
       (.I(1'b0),
        .O(o_axis_out_tdata[11]));
  OBUF \o_axis_out_tdata_OBUF[12]_inst 
       (.I(1'b0),
        .O(o_axis_out_tdata[12]));
  OBUF \o_axis_out_tdata_OBUF[13]_inst 
       (.I(1'b0),
        .O(o_axis_out_tdata[13]));
  OBUF \o_axis_out_tdata_OBUF[14]_inst 
       (.I(1'b0),
        .O(o_axis_out_tdata[14]));
  OBUF \o_axis_out_tdata_OBUF[15]_inst 
       (.I(1'b0),
        .O(o_axis_out_tdata[15]));
  OBUF \o_axis_out_tdata_OBUF[16]_inst 
       (.I(1'b0),
        .O(o_axis_out_tdata[16]));
  OBUF \o_axis_out_tdata_OBUF[17]_inst 
       (.I(1'b0),
        .O(o_axis_out_tdata[17]));
  OBUF \o_axis_out_tdata_OBUF[18]_inst 
       (.I(1'b0),
        .O(o_axis_out_tdata[18]));
  OBUF \o_axis_out_tdata_OBUF[19]_inst 
       (.I(1'b0),
        .O(o_axis_out_tdata[19]));
  OBUF \o_axis_out_tdata_OBUF[1]_inst 
       (.I(1'b0),
        .O(o_axis_out_tdata[1]));
  OBUF \o_axis_out_tdata_OBUF[20]_inst 
       (.I(1'b0),
        .O(o_axis_out_tdata[20]));
  OBUF \o_axis_out_tdata_OBUF[21]_inst 
       (.I(1'b0),
        .O(o_axis_out_tdata[21]));
  OBUF \o_axis_out_tdata_OBUF[22]_inst 
       (.I(1'b0),
        .O(o_axis_out_tdata[22]));
  OBUF \o_axis_out_tdata_OBUF[23]_inst 
       (.I(1'b0),
        .O(o_axis_out_tdata[23]));
  OBUF \o_axis_out_tdata_OBUF[24]_inst 
       (.I(1'b0),
        .O(o_axis_out_tdata[24]));
  OBUF \o_axis_out_tdata_OBUF[25]_inst 
       (.I(1'b0),
        .O(o_axis_out_tdata[25]));
  OBUF \o_axis_out_tdata_OBUF[26]_inst 
       (.I(1'b0),
        .O(o_axis_out_tdata[26]));
  OBUF \o_axis_out_tdata_OBUF[27]_inst 
       (.I(1'b0),
        .O(o_axis_out_tdata[27]));
  OBUF \o_axis_out_tdata_OBUF[28]_inst 
       (.I(1'b0),
        .O(o_axis_out_tdata[28]));
  OBUF \o_axis_out_tdata_OBUF[29]_inst 
       (.I(1'b0),
        .O(o_axis_out_tdata[29]));
  OBUF \o_axis_out_tdata_OBUF[2]_inst 
       (.I(1'b0),
        .O(o_axis_out_tdata[2]));
  OBUF \o_axis_out_tdata_OBUF[30]_inst 
       (.I(1'b0),
        .O(o_axis_out_tdata[30]));
  OBUF \o_axis_out_tdata_OBUF[31]_inst 
       (.I(1'b0),
        .O(o_axis_out_tdata[31]));
  OBUF \o_axis_out_tdata_OBUF[3]_inst 
       (.I(1'b0),
        .O(o_axis_out_tdata[3]));
  OBUF \o_axis_out_tdata_OBUF[4]_inst 
       (.I(1'b0),
        .O(o_axis_out_tdata[4]));
  OBUF \o_axis_out_tdata_OBUF[5]_inst 
       (.I(1'b0),
        .O(o_axis_out_tdata[5]));
  OBUF \o_axis_out_tdata_OBUF[6]_inst 
       (.I(1'b0),
        .O(o_axis_out_tdata[6]));
  OBUF \o_axis_out_tdata_OBUF[7]_inst 
       (.I(1'b0),
        .O(o_axis_out_tdata[7]));
  OBUF \o_axis_out_tdata_OBUF[8]_inst 
       (.I(1'b0),
        .O(o_axis_out_tdata[8]));
  OBUF \o_axis_out_tdata_OBUF[9]_inst 
       (.I(1'b0),
        .O(o_axis_out_tdata[9]));
  OBUF o_axis_out_tvalid_OBUF_inst
       (.I(1'b0),
        .O(o_axis_out_tvalid));
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
