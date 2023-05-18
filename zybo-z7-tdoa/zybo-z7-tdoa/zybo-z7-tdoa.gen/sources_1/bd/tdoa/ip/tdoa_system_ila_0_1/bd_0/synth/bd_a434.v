//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Command: generate_target bd_a434.bd
//Design : bd_a434
//Purpose: IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "bd_a434,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=bd_a434,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=12,numReposBlks=12,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=SBD,synth_mode=Global}" *) (* HW_HANDOFF = "tdoa_system_ila_0_1.hwdef" *) 
module bd_a434
   (SLOT_0_AXIS_tdata,
    SLOT_0_AXIS_tlast,
    SLOT_0_AXIS_tready,
    SLOT_0_AXIS_tvalid,
    SLOT_1_AXIS_tdata,
    SLOT_1_AXIS_tlast,
    SLOT_1_AXIS_tready,
    SLOT_1_AXIS_tvalid,
    SLOT_2_AXIS_tdata,
    SLOT_2_AXIS_tlast,
    SLOT_2_AXIS_tready,
    SLOT_2_AXIS_tvalid,
    SLOT_3_AXIS_tdata,
    SLOT_3_AXIS_tlast,
    SLOT_3_AXIS_tready,
    SLOT_3_AXIS_tvalid,
    SLOT_4_AXIS_tdata,
    SLOT_4_AXIS_tlast,
    SLOT_4_AXIS_tready,
    SLOT_4_AXIS_tvalid,
    SLOT_5_AXIS_tdata,
    SLOT_5_AXIS_tlast,
    SLOT_5_AXIS_tready,
    SLOT_5_AXIS_tvalid,
    SLOT_6_AXI_araddr,
    SLOT_6_AXI_arready,
    SLOT_6_AXI_arvalid,
    SLOT_6_AXI_awaddr,
    SLOT_6_AXI_awready,
    SLOT_6_AXI_awvalid,
    SLOT_6_AXI_bready,
    SLOT_6_AXI_bresp,
    SLOT_6_AXI_bvalid,
    SLOT_6_AXI_rdata,
    SLOT_6_AXI_rready,
    SLOT_6_AXI_rresp,
    SLOT_6_AXI_rvalid,
    SLOT_6_AXI_wdata,
    SLOT_6_AXI_wready,
    SLOT_6_AXI_wstrb,
    SLOT_6_AXI_wvalid,
    SLOT_7_AXI_araddr,
    SLOT_7_AXI_arburst,
    SLOT_7_AXI_arcache,
    SLOT_7_AXI_arid,
    SLOT_7_AXI_arlen,
    SLOT_7_AXI_arlock,
    SLOT_7_AXI_arprot,
    SLOT_7_AXI_arqos,
    SLOT_7_AXI_arready,
    SLOT_7_AXI_arsize,
    SLOT_7_AXI_arvalid,
    SLOT_7_AXI_awaddr,
    SLOT_7_AXI_awburst,
    SLOT_7_AXI_awcache,
    SLOT_7_AXI_awid,
    SLOT_7_AXI_awlen,
    SLOT_7_AXI_awlock,
    SLOT_7_AXI_awprot,
    SLOT_7_AXI_awready,
    SLOT_7_AXI_awsize,
    SLOT_7_AXI_awvalid,
    SLOT_7_AXI_bid,
    SLOT_7_AXI_bready,
    SLOT_7_AXI_bresp,
    SLOT_7_AXI_bvalid,
    SLOT_7_AXI_rdata,
    SLOT_7_AXI_rid,
    SLOT_7_AXI_rlast,
    SLOT_7_AXI_rready,
    SLOT_7_AXI_rresp,
    SLOT_7_AXI_rvalid,
    SLOT_7_AXI_wdata,
    SLOT_7_AXI_wlast,
    SLOT_7_AXI_wready,
    SLOT_7_AXI_wstrb,
    SLOT_7_AXI_wvalid,
    clk,
    resetn);
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_0_AXIS TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME SLOT_0_AXIS, CLK_DOMAIN tdoa_processing_system7_0_2_FCLK_CLK0, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 1, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) input [63:0]SLOT_0_AXIS_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_0_AXIS TLAST" *) input SLOT_0_AXIS_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_0_AXIS TREADY" *) input SLOT_0_AXIS_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_0_AXIS TVALID" *) input SLOT_0_AXIS_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_1_AXIS TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME SLOT_1_AXIS, CLK_DOMAIN tdoa_processing_system7_0_2_FCLK_CLK0, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 1, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) input [63:0]SLOT_1_AXIS_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_1_AXIS TLAST" *) input SLOT_1_AXIS_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_1_AXIS TREADY" *) input SLOT_1_AXIS_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_1_AXIS TVALID" *) input SLOT_1_AXIS_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_2_AXIS TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME SLOT_2_AXIS, CLK_DOMAIN tdoa_processing_system7_0_2_FCLK_CLK0, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 1, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) input [63:0]SLOT_2_AXIS_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_2_AXIS TLAST" *) input SLOT_2_AXIS_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_2_AXIS TREADY" *) input SLOT_2_AXIS_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_2_AXIS TVALID" *) input SLOT_2_AXIS_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_3_AXIS TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME SLOT_3_AXIS, CLK_DOMAIN tdoa_processing_system7_0_2_FCLK_CLK0, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 1, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) input [63:0]SLOT_3_AXIS_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_3_AXIS TLAST" *) input SLOT_3_AXIS_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_3_AXIS TREADY" *) input SLOT_3_AXIS_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_3_AXIS TVALID" *) input SLOT_3_AXIS_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_4_AXIS TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME SLOT_4_AXIS, CLK_DOMAIN tdoa_processing_system7_0_2_FCLK_CLK0, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 5, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) input [39:0]SLOT_4_AXIS_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_4_AXIS TLAST" *) input SLOT_4_AXIS_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_4_AXIS TREADY" *) input SLOT_4_AXIS_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_4_AXIS TVALID" *) input SLOT_4_AXIS_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_5_AXIS TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME SLOT_5_AXIS, CLK_DOMAIN tdoa_processing_system7_0_2_FCLK_CLK0, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 1, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) input [31:0]SLOT_5_AXIS_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_5_AXIS TLAST" *) input SLOT_5_AXIS_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_5_AXIS TREADY" *) input SLOT_5_AXIS_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_5_AXIS TVALID" *) input SLOT_5_AXIS_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_6_AXI ARADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME SLOT_6_AXI, ADDR_WIDTH 32, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN tdoa_processing_system7_0_2_FCLK_CLK0, DATA_WIDTH 32, FREQ_HZ 100000000, HAS_BRESP 1, HAS_BURST 0, HAS_CACHE 0, HAS_LOCK 0, HAS_PROT 0, HAS_QOS 0, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 1, NUM_READ_OUTSTANDING 8, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 8, NUM_WRITE_THREADS 1, PHASE 0.0, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0" *) input [31:0]SLOT_6_AXI_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_6_AXI ARREADY" *) input SLOT_6_AXI_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_6_AXI ARVALID" *) input SLOT_6_AXI_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_6_AXI AWADDR" *) input [31:0]SLOT_6_AXI_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_6_AXI AWREADY" *) input SLOT_6_AXI_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_6_AXI AWVALID" *) input SLOT_6_AXI_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_6_AXI BREADY" *) input SLOT_6_AXI_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_6_AXI BRESP" *) input [1:0]SLOT_6_AXI_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_6_AXI BVALID" *) input SLOT_6_AXI_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_6_AXI RDATA" *) input [31:0]SLOT_6_AXI_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_6_AXI RREADY" *) input SLOT_6_AXI_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_6_AXI RRESP" *) input [1:0]SLOT_6_AXI_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_6_AXI RVALID" *) input SLOT_6_AXI_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_6_AXI WDATA" *) input [31:0]SLOT_6_AXI_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_6_AXI WREADY" *) input SLOT_6_AXI_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_6_AXI WSTRB" *) input [3:0]SLOT_6_AXI_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_6_AXI WVALID" *) input SLOT_6_AXI_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_7_AXI ARADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME SLOT_7_AXI, ADDR_WIDTH 32, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN tdoa_processing_system7_0_2_FCLK_CLK0, DATA_WIDTH 32, FREQ_HZ 100000000, HAS_BRESP 1, HAS_BURST 1, HAS_CACHE 1, HAS_LOCK 1, HAS_PROT 1, HAS_QOS 1, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 12, INSERT_VIP 0, MAX_BURST_LENGTH 16, NUM_READ_OUTSTANDING 8, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 8, NUM_WRITE_THREADS 1, PHASE 0.0, PROTOCOL AXI4, READ_WRITE_MODE READ_ONLY, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0" *) input [31:0]SLOT_7_AXI_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_7_AXI ARBURST" *) input [1:0]SLOT_7_AXI_arburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_7_AXI ARCACHE" *) input [1:0]SLOT_7_AXI_arcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_7_AXI ARID" *) input [11:0]SLOT_7_AXI_arid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_7_AXI ARLEN" *) input [7:0]SLOT_7_AXI_arlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_7_AXI ARLOCK" *) input [0:0]SLOT_7_AXI_arlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_7_AXI ARPROT" *) input [2:0]SLOT_7_AXI_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_7_AXI ARQOS" *) input [3:0]SLOT_7_AXI_arqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_7_AXI ARREADY" *) input SLOT_7_AXI_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_7_AXI ARSIZE" *) input [2:0]SLOT_7_AXI_arsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_7_AXI ARVALID" *) input SLOT_7_AXI_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_7_AXI AWADDR" *) input [31:0]SLOT_7_AXI_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_7_AXI AWBURST" *) input [1:0]SLOT_7_AXI_awburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_7_AXI AWCACHE" *) input [3:0]SLOT_7_AXI_awcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_7_AXI AWID" *) input [11:0]SLOT_7_AXI_awid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_7_AXI AWLEN" *) input [7:0]SLOT_7_AXI_awlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_7_AXI AWLOCK" *) input [0:0]SLOT_7_AXI_awlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_7_AXI AWPROT" *) input [2:0]SLOT_7_AXI_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_7_AXI AWREADY" *) input SLOT_7_AXI_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_7_AXI AWSIZE" *) input [2:0]SLOT_7_AXI_awsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_7_AXI AWVALID" *) input SLOT_7_AXI_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_7_AXI BID" *) input [11:0]SLOT_7_AXI_bid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_7_AXI BREADY" *) input SLOT_7_AXI_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_7_AXI BRESP" *) input [1:0]SLOT_7_AXI_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_7_AXI BVALID" *) input SLOT_7_AXI_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_7_AXI RDATA" *) input [31:0]SLOT_7_AXI_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_7_AXI RID" *) input [11:0]SLOT_7_AXI_rid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_7_AXI RLAST" *) input SLOT_7_AXI_rlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_7_AXI RREADY" *) input SLOT_7_AXI_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_7_AXI RRESP" *) input [1:0]SLOT_7_AXI_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_7_AXI RVALID" *) input SLOT_7_AXI_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_7_AXI WDATA" *) input [31:0]SLOT_7_AXI_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_7_AXI WLAST" *) input SLOT_7_AXI_wlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_7_AXI WREADY" *) input SLOT_7_AXI_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_7_AXI WSTRB" *) input [3:0]SLOT_7_AXI_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_7_AXI WVALID" *) input SLOT_7_AXI_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK, ASSOCIATED_BUSIF SLOT_0_AXIS:SLOT_1_AXIS:SLOT_2_AXIS:SLOT_3_AXIS:SLOT_4_AXIS:SLOT_5_AXIS:SLOT_6_AXI:SLOT_7_AXI, ASSOCIATED_RESET resetn, CLK_DOMAIN tdoa_processing_system7_0_2_FCLK_CLK0, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RESETN RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RESETN, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input resetn;

  wire [63:0]Conn1_TDATA;
  wire Conn1_TLAST;
  wire Conn1_TREADY;
  wire Conn1_TVALID;
  wire [63:0]Conn2_TDATA;
  wire Conn2_TLAST;
  wire Conn2_TREADY;
  wire Conn2_TVALID;
  wire [63:0]Conn3_TDATA;
  wire Conn3_TLAST;
  wire Conn3_TREADY;
  wire Conn3_TVALID;
  wire [39:0]Conn4_TDATA;
  wire Conn4_TLAST;
  wire Conn4_TREADY;
  wire Conn4_TVALID;
  wire [31:0]Conn5_TDATA;
  wire Conn5_TLAST;
  wire Conn5_TREADY;
  wire Conn5_TVALID;
  wire [31:0]Conn6_ARADDR;
  wire Conn6_ARREADY;
  wire Conn6_ARVALID;
  wire [31:0]Conn6_AWADDR;
  wire Conn6_AWREADY;
  wire Conn6_AWVALID;
  wire Conn6_BREADY;
  wire [1:0]Conn6_BRESP;
  wire Conn6_BVALID;
  wire [31:0]Conn6_RDATA;
  wire Conn6_RREADY;
  wire [1:0]Conn6_RRESP;
  wire Conn6_RVALID;
  wire [31:0]Conn6_WDATA;
  wire Conn6_WREADY;
  wire [3:0]Conn6_WSTRB;
  wire Conn6_WVALID;
  wire [31:0]Conn7_ARADDR;
  wire [1:0]Conn7_ARBURST;
  wire [1:0]Conn7_ARCACHE;
  wire [11:0]Conn7_ARID;
  wire [7:0]Conn7_ARLEN;
  wire [0:0]Conn7_ARLOCK;
  wire [2:0]Conn7_ARPROT;
  wire [3:0]Conn7_ARQOS;
  wire Conn7_ARREADY;
  wire [2:0]Conn7_ARSIZE;
  wire Conn7_ARVALID;
  wire [31:0]Conn7_AWADDR;
  wire [1:0]Conn7_AWBURST;
  wire [3:0]Conn7_AWCACHE;
  wire [11:0]Conn7_AWID;
  wire [7:0]Conn7_AWLEN;
  wire [0:0]Conn7_AWLOCK;
  wire [2:0]Conn7_AWPROT;
  wire Conn7_AWREADY;
  wire [2:0]Conn7_AWSIZE;
  wire Conn7_AWVALID;
  wire [11:0]Conn7_BID;
  wire Conn7_BREADY;
  wire [1:0]Conn7_BRESP;
  wire Conn7_BVALID;
  wire [31:0]Conn7_RDATA;
  wire [11:0]Conn7_RID;
  wire Conn7_RLAST;
  wire Conn7_RREADY;
  wire [1:0]Conn7_RRESP;
  wire Conn7_RVALID;
  wire [31:0]Conn7_WDATA;
  wire Conn7_WLAST;
  wire Conn7_WREADY;
  wire [3:0]Conn7_WSTRB;
  wire Conn7_WVALID;
  wire [63:0]Conn_TDATA;
  wire Conn_TLAST;
  wire Conn_TREADY;
  wire Conn_TVALID;
  wire clk_1;
  wire [63:0]net_slot_0_axis_tdata;
  wire net_slot_0_axis_tlast;
  wire net_slot_0_axis_tready;
  wire net_slot_0_axis_tvalid;
  wire [63:0]net_slot_1_axis_tdata;
  wire net_slot_1_axis_tlast;
  wire net_slot_1_axis_tready;
  wire net_slot_1_axis_tvalid;
  wire [63:0]net_slot_2_axis_tdata;
  wire net_slot_2_axis_tlast;
  wire net_slot_2_axis_tready;
  wire net_slot_2_axis_tvalid;
  wire [63:0]net_slot_3_axis_tdata;
  wire net_slot_3_axis_tlast;
  wire net_slot_3_axis_tready;
  wire net_slot_3_axis_tvalid;
  wire [39:0]net_slot_4_axis_tdata;
  wire net_slot_4_axis_tlast;
  wire net_slot_4_axis_tready;
  wire net_slot_4_axis_tvalid;
  wire [31:0]net_slot_5_axis_tdata;
  wire net_slot_5_axis_tlast;
  wire net_slot_5_axis_tready;
  wire net_slot_5_axis_tvalid;
  wire [1:0]net_slot_6_axi_ar_cnt;
  wire [1:0]net_slot_6_axi_ar_ctrl;
  wire [31:0]net_slot_6_axi_araddr;
  wire net_slot_6_axi_arready;
  wire net_slot_6_axi_arvalid;
  wire [1:0]net_slot_6_axi_aw_cnt;
  wire [1:0]net_slot_6_axi_aw_ctrl;
  wire [31:0]net_slot_6_axi_awaddr;
  wire net_slot_6_axi_awready;
  wire net_slot_6_axi_awvalid;
  wire [1:0]net_slot_6_axi_b_cnt;
  wire [1:0]net_slot_6_axi_b_ctrl;
  wire net_slot_6_axi_bready;
  wire [1:0]net_slot_6_axi_bresp;
  wire net_slot_6_axi_bvalid;
  wire [1:0]net_slot_6_axi_r_cnt;
  wire [1:0]net_slot_6_axi_r_ctrl;
  wire [31:0]net_slot_6_axi_rdata;
  wire net_slot_6_axi_rready;
  wire [1:0]net_slot_6_axi_rresp;
  wire net_slot_6_axi_rvalid;
  wire [1:0]net_slot_6_axi_w_ctrl;
  wire [31:0]net_slot_6_axi_wdata;
  wire net_slot_6_axi_wready;
  wire [3:0]net_slot_6_axi_wstrb;
  wire net_slot_6_axi_wvalid;
  wire [1:0]net_slot_7_axi_ar_cnt;
  wire [1:0]net_slot_7_axi_ar_ctrl;
  wire [31:0]net_slot_7_axi_araddr;
  wire [1:0]net_slot_7_axi_arburst;
  wire [3:0]net_slot_7_axi_arcache;
  wire [11:0]net_slot_7_axi_arid;
  wire [7:0]net_slot_7_axi_arlen;
  wire [0:0]net_slot_7_axi_arlock;
  wire [2:0]net_slot_7_axi_arprot;
  wire [3:0]net_slot_7_axi_arqos;
  wire net_slot_7_axi_arready;
  wire [2:0]net_slot_7_axi_arsize;
  wire net_slot_7_axi_arvalid;
  wire [1:0]net_slot_7_axi_aw_cnt;
  wire [1:0]net_slot_7_axi_aw_ctrl;
  wire [11:0]net_slot_7_axi_awid;
  wire net_slot_7_axi_awready;
  wire net_slot_7_axi_awvalid;
  wire [1:0]net_slot_7_axi_b_cnt;
  wire [1:0]net_slot_7_axi_b_ctrl;
  wire [11:0]net_slot_7_axi_bid;
  wire net_slot_7_axi_bready;
  wire net_slot_7_axi_bvalid;
  wire [1:0]net_slot_7_axi_r_cnt;
  wire [2:0]net_slot_7_axi_r_ctrl;
  wire [31:0]net_slot_7_axi_rdata;
  wire [11:0]net_slot_7_axi_rid;
  wire net_slot_7_axi_rlast;
  wire net_slot_7_axi_rready;
  wire [1:0]net_slot_7_axi_rresp;
  wire net_slot_7_axi_rvalid;
  wire [2:0]net_slot_7_axi_w_ctrl;
  wire net_slot_7_axi_wlast;
  wire net_slot_7_axi_wready;
  wire net_slot_7_axi_wvalid;
  wire resetn_1;

  assign Conn1_TDATA = SLOT_1_AXIS_tdata[63:0];
  assign Conn1_TLAST = SLOT_1_AXIS_tlast;
  assign Conn1_TREADY = SLOT_1_AXIS_tready;
  assign Conn1_TVALID = SLOT_1_AXIS_tvalid;
  assign Conn2_TDATA = SLOT_2_AXIS_tdata[63:0];
  assign Conn2_TLAST = SLOT_2_AXIS_tlast;
  assign Conn2_TREADY = SLOT_2_AXIS_tready;
  assign Conn2_TVALID = SLOT_2_AXIS_tvalid;
  assign Conn3_TDATA = SLOT_3_AXIS_tdata[63:0];
  assign Conn3_TLAST = SLOT_3_AXIS_tlast;
  assign Conn3_TREADY = SLOT_3_AXIS_tready;
  assign Conn3_TVALID = SLOT_3_AXIS_tvalid;
  assign Conn4_TDATA = SLOT_4_AXIS_tdata[39:0];
  assign Conn4_TLAST = SLOT_4_AXIS_tlast;
  assign Conn4_TREADY = SLOT_4_AXIS_tready;
  assign Conn4_TVALID = SLOT_4_AXIS_tvalid;
  assign Conn5_TDATA = SLOT_5_AXIS_tdata[31:0];
  assign Conn5_TLAST = SLOT_5_AXIS_tlast;
  assign Conn5_TREADY = SLOT_5_AXIS_tready;
  assign Conn5_TVALID = SLOT_5_AXIS_tvalid;
  assign Conn6_ARADDR = SLOT_6_AXI_araddr[31:0];
  assign Conn6_ARREADY = SLOT_6_AXI_arready;
  assign Conn6_ARVALID = SLOT_6_AXI_arvalid;
  assign Conn6_AWADDR = SLOT_6_AXI_awaddr[31:0];
  assign Conn6_AWREADY = SLOT_6_AXI_awready;
  assign Conn6_AWVALID = SLOT_6_AXI_awvalid;
  assign Conn6_BREADY = SLOT_6_AXI_bready;
  assign Conn6_BRESP = SLOT_6_AXI_bresp[1:0];
  assign Conn6_BVALID = SLOT_6_AXI_bvalid;
  assign Conn6_RDATA = SLOT_6_AXI_rdata[31:0];
  assign Conn6_RREADY = SLOT_6_AXI_rready;
  assign Conn6_RRESP = SLOT_6_AXI_rresp[1:0];
  assign Conn6_RVALID = SLOT_6_AXI_rvalid;
  assign Conn6_WDATA = SLOT_6_AXI_wdata[31:0];
  assign Conn6_WREADY = SLOT_6_AXI_wready;
  assign Conn6_WSTRB = SLOT_6_AXI_wstrb[3:0];
  assign Conn6_WVALID = SLOT_6_AXI_wvalid;
  assign Conn7_ARADDR = SLOT_7_AXI_araddr[31:0];
  assign Conn7_ARBURST = SLOT_7_AXI_arburst[1:0];
  assign Conn7_ARCACHE = SLOT_7_AXI_arcache[1:0];
  assign Conn7_ARID = SLOT_7_AXI_arid[11:0];
  assign Conn7_ARLEN = SLOT_7_AXI_arlen[7:0];
  assign Conn7_ARLOCK = SLOT_7_AXI_arlock[0];
  assign Conn7_ARPROT = SLOT_7_AXI_arprot[2:0];
  assign Conn7_ARQOS = SLOT_7_AXI_arqos[3:0];
  assign Conn7_ARREADY = SLOT_7_AXI_arready;
  assign Conn7_ARSIZE = SLOT_7_AXI_arsize[2:0];
  assign Conn7_ARVALID = SLOT_7_AXI_arvalid;
  assign Conn7_AWADDR = SLOT_7_AXI_awaddr[31:0];
  assign Conn7_AWBURST = SLOT_7_AXI_awburst[1:0];
  assign Conn7_AWCACHE = SLOT_7_AXI_awcache[3:0];
  assign Conn7_AWID = SLOT_7_AXI_awid[11:0];
  assign Conn7_AWLEN = SLOT_7_AXI_awlen[7:0];
  assign Conn7_AWLOCK = SLOT_7_AXI_awlock[0];
  assign Conn7_AWPROT = SLOT_7_AXI_awprot[2:0];
  assign Conn7_AWREADY = SLOT_7_AXI_awready;
  assign Conn7_AWSIZE = SLOT_7_AXI_awsize[2:0];
  assign Conn7_AWVALID = SLOT_7_AXI_awvalid;
  assign Conn7_BID = SLOT_7_AXI_bid[11:0];
  assign Conn7_BREADY = SLOT_7_AXI_bready;
  assign Conn7_BRESP = SLOT_7_AXI_bresp[1:0];
  assign Conn7_BVALID = SLOT_7_AXI_bvalid;
  assign Conn7_RDATA = SLOT_7_AXI_rdata[31:0];
  assign Conn7_RID = SLOT_7_AXI_rid[11:0];
  assign Conn7_RLAST = SLOT_7_AXI_rlast;
  assign Conn7_RREADY = SLOT_7_AXI_rready;
  assign Conn7_RRESP = SLOT_7_AXI_rresp[1:0];
  assign Conn7_RVALID = SLOT_7_AXI_rvalid;
  assign Conn7_WDATA = SLOT_7_AXI_wdata[31:0];
  assign Conn7_WLAST = SLOT_7_AXI_wlast;
  assign Conn7_WREADY = SLOT_7_AXI_wready;
  assign Conn7_WSTRB = SLOT_7_AXI_wstrb[3:0];
  assign Conn7_WVALID = SLOT_7_AXI_wvalid;
  assign Conn_TDATA = SLOT_0_AXIS_tdata[63:0];
  assign Conn_TLAST = SLOT_0_AXIS_tlast;
  assign Conn_TREADY = SLOT_0_AXIS_tready;
  assign Conn_TVALID = SLOT_0_AXIS_tvalid;
  assign clk_1 = clk;
  assign resetn_1 = resetn;
  bd_a434_g_inst_0 g_inst
       (.aclk(clk_1),
        .aresetn(resetn_1),
        .m_slot_0_axis_tdata(net_slot_0_axis_tdata),
        .m_slot_0_axis_tlast(net_slot_0_axis_tlast),
        .m_slot_0_axis_tready(net_slot_0_axis_tready),
        .m_slot_0_axis_tvalid(net_slot_0_axis_tvalid),
        .m_slot_1_axis_tdata(net_slot_1_axis_tdata),
        .m_slot_1_axis_tlast(net_slot_1_axis_tlast),
        .m_slot_1_axis_tready(net_slot_1_axis_tready),
        .m_slot_1_axis_tvalid(net_slot_1_axis_tvalid),
        .m_slot_2_axis_tdata(net_slot_2_axis_tdata),
        .m_slot_2_axis_tlast(net_slot_2_axis_tlast),
        .m_slot_2_axis_tready(net_slot_2_axis_tready),
        .m_slot_2_axis_tvalid(net_slot_2_axis_tvalid),
        .m_slot_3_axis_tdata(net_slot_3_axis_tdata),
        .m_slot_3_axis_tlast(net_slot_3_axis_tlast),
        .m_slot_3_axis_tready(net_slot_3_axis_tready),
        .m_slot_3_axis_tvalid(net_slot_3_axis_tvalid),
        .m_slot_4_axis_tdata(net_slot_4_axis_tdata),
        .m_slot_4_axis_tlast(net_slot_4_axis_tlast),
        .m_slot_4_axis_tready(net_slot_4_axis_tready),
        .m_slot_4_axis_tvalid(net_slot_4_axis_tvalid),
        .m_slot_5_axis_tdata(net_slot_5_axis_tdata),
        .m_slot_5_axis_tlast(net_slot_5_axis_tlast),
        .m_slot_5_axis_tready(net_slot_5_axis_tready),
        .m_slot_5_axis_tvalid(net_slot_5_axis_tvalid),
        .m_slot_6_axi_ar_cnt(net_slot_6_axi_ar_cnt),
        .m_slot_6_axi_araddr(net_slot_6_axi_araddr),
        .m_slot_6_axi_arready(net_slot_6_axi_arready),
        .m_slot_6_axi_arvalid(net_slot_6_axi_arvalid),
        .m_slot_6_axi_aw_cnt(net_slot_6_axi_aw_cnt),
        .m_slot_6_axi_awaddr(net_slot_6_axi_awaddr),
        .m_slot_6_axi_awready(net_slot_6_axi_awready),
        .m_slot_6_axi_awvalid(net_slot_6_axi_awvalid),
        .m_slot_6_axi_b_cnt(net_slot_6_axi_b_cnt),
        .m_slot_6_axi_bready(net_slot_6_axi_bready),
        .m_slot_6_axi_bresp(net_slot_6_axi_bresp),
        .m_slot_6_axi_bvalid(net_slot_6_axi_bvalid),
        .m_slot_6_axi_r_cnt(net_slot_6_axi_r_cnt),
        .m_slot_6_axi_rdata(net_slot_6_axi_rdata),
        .m_slot_6_axi_rready(net_slot_6_axi_rready),
        .m_slot_6_axi_rresp(net_slot_6_axi_rresp),
        .m_slot_6_axi_rvalid(net_slot_6_axi_rvalid),
        .m_slot_6_axi_wdata(net_slot_6_axi_wdata),
        .m_slot_6_axi_wready(net_slot_6_axi_wready),
        .m_slot_6_axi_wstrb(net_slot_6_axi_wstrb),
        .m_slot_6_axi_wvalid(net_slot_6_axi_wvalid),
        .m_slot_7_axi_ar_cnt(net_slot_7_axi_ar_cnt),
        .m_slot_7_axi_araddr(net_slot_7_axi_araddr),
        .m_slot_7_axi_arburst(net_slot_7_axi_arburst),
        .m_slot_7_axi_arcache(net_slot_7_axi_arcache),
        .m_slot_7_axi_arid(net_slot_7_axi_arid),
        .m_slot_7_axi_arlen(net_slot_7_axi_arlen),
        .m_slot_7_axi_arlock(net_slot_7_axi_arlock),
        .m_slot_7_axi_arprot(net_slot_7_axi_arprot),
        .m_slot_7_axi_arqos(net_slot_7_axi_arqos),
        .m_slot_7_axi_arready(net_slot_7_axi_arready),
        .m_slot_7_axi_arsize(net_slot_7_axi_arsize),
        .m_slot_7_axi_arvalid(net_slot_7_axi_arvalid),
        .m_slot_7_axi_aw_cnt(net_slot_7_axi_aw_cnt),
        .m_slot_7_axi_awid(net_slot_7_axi_awid),
        .m_slot_7_axi_awready(net_slot_7_axi_awready),
        .m_slot_7_axi_awvalid(net_slot_7_axi_awvalid),
        .m_slot_7_axi_b_cnt(net_slot_7_axi_b_cnt),
        .m_slot_7_axi_bid(net_slot_7_axi_bid),
        .m_slot_7_axi_bready(net_slot_7_axi_bready),
        .m_slot_7_axi_bvalid(net_slot_7_axi_bvalid),
        .m_slot_7_axi_r_cnt(net_slot_7_axi_r_cnt),
        .m_slot_7_axi_rdata(net_slot_7_axi_rdata),
        .m_slot_7_axi_rid(net_slot_7_axi_rid),
        .m_slot_7_axi_rlast(net_slot_7_axi_rlast),
        .m_slot_7_axi_rready(net_slot_7_axi_rready),
        .m_slot_7_axi_rresp(net_slot_7_axi_rresp),
        .m_slot_7_axi_rvalid(net_slot_7_axi_rvalid),
        .m_slot_7_axi_wlast(net_slot_7_axi_wlast),
        .m_slot_7_axi_wready(net_slot_7_axi_wready),
        .m_slot_7_axi_wvalid(net_slot_7_axi_wvalid),
        .slot_0_axis_tdata(Conn_TDATA),
        .slot_0_axis_tlast(Conn_TLAST),
        .slot_0_axis_tready(Conn_TREADY),
        .slot_0_axis_tvalid(Conn_TVALID),
        .slot_1_axis_tdata(Conn1_TDATA),
        .slot_1_axis_tlast(Conn1_TLAST),
        .slot_1_axis_tready(Conn1_TREADY),
        .slot_1_axis_tvalid(Conn1_TVALID),
        .slot_2_axis_tdata(Conn2_TDATA),
        .slot_2_axis_tlast(Conn2_TLAST),
        .slot_2_axis_tready(Conn2_TREADY),
        .slot_2_axis_tvalid(Conn2_TVALID),
        .slot_3_axis_tdata(Conn3_TDATA),
        .slot_3_axis_tlast(Conn3_TLAST),
        .slot_3_axis_tready(Conn3_TREADY),
        .slot_3_axis_tvalid(Conn3_TVALID),
        .slot_4_axis_tdata(Conn4_TDATA),
        .slot_4_axis_tlast(Conn4_TLAST),
        .slot_4_axis_tready(Conn4_TREADY),
        .slot_4_axis_tvalid(Conn4_TVALID),
        .slot_5_axis_tdata(Conn5_TDATA),
        .slot_5_axis_tlast(Conn5_TLAST),
        .slot_5_axis_tready(Conn5_TREADY),
        .slot_5_axis_tvalid(Conn5_TVALID),
        .slot_6_axi_araddr(Conn6_ARADDR),
        .slot_6_axi_arready(Conn6_ARREADY),
        .slot_6_axi_arvalid(Conn6_ARVALID),
        .slot_6_axi_awaddr(Conn6_AWADDR),
        .slot_6_axi_awready(Conn6_AWREADY),
        .slot_6_axi_awvalid(Conn6_AWVALID),
        .slot_6_axi_bready(Conn6_BREADY),
        .slot_6_axi_bresp(Conn6_BRESP),
        .slot_6_axi_bvalid(Conn6_BVALID),
        .slot_6_axi_rdata(Conn6_RDATA),
        .slot_6_axi_rready(Conn6_RREADY),
        .slot_6_axi_rresp(Conn6_RRESP),
        .slot_6_axi_rvalid(Conn6_RVALID),
        .slot_6_axi_wdata(Conn6_WDATA),
        .slot_6_axi_wready(Conn6_WREADY),
        .slot_6_axi_wstrb(Conn6_WSTRB),
        .slot_6_axi_wvalid(Conn6_WVALID),
        .slot_7_axi_araddr(Conn7_ARADDR),
        .slot_7_axi_arburst(Conn7_ARBURST),
        .slot_7_axi_arcache(Conn7_ARCACHE),
        .slot_7_axi_arid(Conn7_ARID),
        .slot_7_axi_arlen(Conn7_ARLEN),
        .slot_7_axi_arlock(Conn7_ARLOCK),
        .slot_7_axi_arprot(Conn7_ARPROT),
        .slot_7_axi_arqos(Conn7_ARQOS),
        .slot_7_axi_arready(Conn7_ARREADY),
        .slot_7_axi_arsize(Conn7_ARSIZE),
        .slot_7_axi_arvalid(Conn7_ARVALID),
        .slot_7_axi_awaddr(Conn7_AWADDR),
        .slot_7_axi_awburst(Conn7_AWBURST),
        .slot_7_axi_awcache(Conn7_AWCACHE),
        .slot_7_axi_awid(Conn7_AWID),
        .slot_7_axi_awlen(Conn7_AWLEN),
        .slot_7_axi_awlock(Conn7_AWLOCK),
        .slot_7_axi_awprot(Conn7_AWPROT),
        .slot_7_axi_awready(Conn7_AWREADY),
        .slot_7_axi_awsize(Conn7_AWSIZE),
        .slot_7_axi_awvalid(Conn7_AWVALID),
        .slot_7_axi_bid(Conn7_BID),
        .slot_7_axi_bready(Conn7_BREADY),
        .slot_7_axi_bresp(Conn7_BRESP),
        .slot_7_axi_bvalid(Conn7_BVALID),
        .slot_7_axi_rdata(Conn7_RDATA),
        .slot_7_axi_rid(Conn7_RID),
        .slot_7_axi_rlast(Conn7_RLAST),
        .slot_7_axi_rready(Conn7_RREADY),
        .slot_7_axi_rresp(Conn7_RRESP),
        .slot_7_axi_rvalid(Conn7_RVALID),
        .slot_7_axi_wdata(Conn7_WDATA),
        .slot_7_axi_wlast(Conn7_WLAST),
        .slot_7_axi_wready(Conn7_WREADY),
        .slot_7_axi_wstrb(Conn7_WSTRB),
        .slot_7_axi_wvalid(Conn7_WVALID));
  bd_a434_ila_lib_0 ila_lib
       (.clk(clk_1),
        .probe0(net_slot_0_axis_tdata),
        .probe1(net_slot_0_axis_tvalid),
        .probe10(net_slot_2_axis_tready),
        .probe11(net_slot_2_axis_tlast),
        .probe12(net_slot_3_axis_tdata),
        .probe13(net_slot_3_axis_tvalid),
        .probe14(net_slot_3_axis_tready),
        .probe15(net_slot_3_axis_tlast),
        .probe16(net_slot_4_axis_tdata),
        .probe17(net_slot_4_axis_tvalid),
        .probe18(net_slot_4_axis_tready),
        .probe19(net_slot_4_axis_tlast),
        .probe2(net_slot_0_axis_tready),
        .probe20(net_slot_5_axis_tdata),
        .probe21(net_slot_5_axis_tvalid),
        .probe22(net_slot_5_axis_tready),
        .probe23(net_slot_5_axis_tlast),
        .probe24(net_slot_6_axi_ar_cnt),
        .probe25(net_slot_6_axi_araddr),
        .probe26(net_slot_6_axi_aw_cnt),
        .probe27(net_slot_6_axi_awaddr),
        .probe28(net_slot_6_axi_b_cnt),
        .probe29(net_slot_6_axi_bresp),
        .probe3(net_slot_0_axis_tlast),
        .probe30(net_slot_6_axi_r_cnt),
        .probe31(net_slot_6_axi_rdata),
        .probe32(net_slot_6_axi_rresp),
        .probe33(net_slot_6_axi_wdata),
        .probe34(net_slot_6_axi_wstrb),
        .probe35(net_slot_6_axi_aw_ctrl),
        .probe36(net_slot_6_axi_w_ctrl),
        .probe37(net_slot_6_axi_b_ctrl),
        .probe38(net_slot_6_axi_ar_ctrl),
        .probe39(net_slot_6_axi_r_ctrl),
        .probe4(net_slot_1_axis_tdata),
        .probe40(net_slot_7_axi_ar_cnt),
        .probe41(net_slot_7_axi_araddr),
        .probe42(net_slot_7_axi_arburst),
        .probe43(net_slot_7_axi_arcache),
        .probe44(net_slot_7_axi_arid),
        .probe45(net_slot_7_axi_arlen),
        .probe46(net_slot_7_axi_arlock),
        .probe47(net_slot_7_axi_arprot),
        .probe48(net_slot_7_axi_arqos),
        .probe49(net_slot_7_axi_arsize),
        .probe5(net_slot_1_axis_tvalid),
        .probe50(net_slot_7_axi_aw_cnt),
        .probe51(net_slot_7_axi_awid),
        .probe52(net_slot_7_axi_b_cnt),
        .probe53(net_slot_7_axi_bid),
        .probe54(net_slot_7_axi_r_cnt),
        .probe55(net_slot_7_axi_rdata),
        .probe56(net_slot_7_axi_rid),
        .probe57(net_slot_7_axi_rresp),
        .probe58(net_slot_7_axi_aw_ctrl),
        .probe59(net_slot_7_axi_w_ctrl),
        .probe6(net_slot_1_axis_tready),
        .probe60(net_slot_7_axi_b_ctrl),
        .probe61(net_slot_7_axi_ar_ctrl),
        .probe62(net_slot_7_axi_r_ctrl),
        .probe7(net_slot_1_axis_tlast),
        .probe8(net_slot_2_axis_tdata),
        .probe9(net_slot_2_axis_tvalid));
  bd_a434_slot_6_ar_0 slot_6_ar
       (.In0(net_slot_6_axi_arvalid),
        .In1(net_slot_6_axi_arready),
        .dout(net_slot_6_axi_ar_ctrl));
  bd_a434_slot_6_aw_0 slot_6_aw
       (.In0(net_slot_6_axi_awvalid),
        .In1(net_slot_6_axi_awready),
        .dout(net_slot_6_axi_aw_ctrl));
  bd_a434_slot_6_b_0 slot_6_b
       (.In0(net_slot_6_axi_bvalid),
        .In1(net_slot_6_axi_bready),
        .dout(net_slot_6_axi_b_ctrl));
  bd_a434_slot_6_r_0 slot_6_r
       (.In0(net_slot_6_axi_rvalid),
        .In1(net_slot_6_axi_rready),
        .dout(net_slot_6_axi_r_ctrl));
  bd_a434_slot_6_w_0 slot_6_w
       (.In0(net_slot_6_axi_wvalid),
        .In1(net_slot_6_axi_wready),
        .dout(net_slot_6_axi_w_ctrl));
  bd_a434_slot_7_ar_0 slot_7_ar
       (.In0(net_slot_7_axi_arvalid),
        .In1(net_slot_7_axi_arready),
        .dout(net_slot_7_axi_ar_ctrl));
  bd_a434_slot_7_aw_0 slot_7_aw
       (.In0(net_slot_7_axi_awvalid),
        .In1(net_slot_7_axi_awready),
        .dout(net_slot_7_axi_aw_ctrl));
  bd_a434_slot_7_b_0 slot_7_b
       (.In0(net_slot_7_axi_bvalid),
        .In1(net_slot_7_axi_bready),
        .dout(net_slot_7_axi_b_ctrl));
  bd_a434_slot_7_r_0 slot_7_r
       (.In0(net_slot_7_axi_rvalid),
        .In1(net_slot_7_axi_rready),
        .In2(net_slot_7_axi_rlast),
        .dout(net_slot_7_axi_r_ctrl));
  bd_a434_slot_7_w_0 slot_7_w
       (.In0(net_slot_7_axi_wvalid),
        .In1(net_slot_7_axi_wready),
        .In2(net_slot_7_axi_wlast),
        .dout(net_slot_7_axi_w_ctrl));
endmodule
