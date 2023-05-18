//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Command: generate_target bd_a434_wrapper.bd
//Design : bd_a434_wrapper
//Purpose: IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module bd_a434_wrapper
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
  input [63:0]SLOT_0_AXIS_tdata;
  input SLOT_0_AXIS_tlast;
  input SLOT_0_AXIS_tready;
  input SLOT_0_AXIS_tvalid;
  input [63:0]SLOT_1_AXIS_tdata;
  input SLOT_1_AXIS_tlast;
  input SLOT_1_AXIS_tready;
  input SLOT_1_AXIS_tvalid;
  input [63:0]SLOT_2_AXIS_tdata;
  input SLOT_2_AXIS_tlast;
  input SLOT_2_AXIS_tready;
  input SLOT_2_AXIS_tvalid;
  input [63:0]SLOT_3_AXIS_tdata;
  input SLOT_3_AXIS_tlast;
  input SLOT_3_AXIS_tready;
  input SLOT_3_AXIS_tvalid;
  input [39:0]SLOT_4_AXIS_tdata;
  input SLOT_4_AXIS_tlast;
  input SLOT_4_AXIS_tready;
  input SLOT_4_AXIS_tvalid;
  input [31:0]SLOT_5_AXIS_tdata;
  input SLOT_5_AXIS_tlast;
  input SLOT_5_AXIS_tready;
  input SLOT_5_AXIS_tvalid;
  input [31:0]SLOT_6_AXI_araddr;
  input SLOT_6_AXI_arready;
  input SLOT_6_AXI_arvalid;
  input [31:0]SLOT_6_AXI_awaddr;
  input SLOT_6_AXI_awready;
  input SLOT_6_AXI_awvalid;
  input SLOT_6_AXI_bready;
  input [1:0]SLOT_6_AXI_bresp;
  input SLOT_6_AXI_bvalid;
  input [31:0]SLOT_6_AXI_rdata;
  input SLOT_6_AXI_rready;
  input [1:0]SLOT_6_AXI_rresp;
  input SLOT_6_AXI_rvalid;
  input [31:0]SLOT_6_AXI_wdata;
  input SLOT_6_AXI_wready;
  input [3:0]SLOT_6_AXI_wstrb;
  input SLOT_6_AXI_wvalid;
  input [31:0]SLOT_7_AXI_araddr;
  input [1:0]SLOT_7_AXI_arburst;
  input [1:0]SLOT_7_AXI_arcache;
  input [11:0]SLOT_7_AXI_arid;
  input [7:0]SLOT_7_AXI_arlen;
  input [0:0]SLOT_7_AXI_arlock;
  input [2:0]SLOT_7_AXI_arprot;
  input [3:0]SLOT_7_AXI_arqos;
  input SLOT_7_AXI_arready;
  input [2:0]SLOT_7_AXI_arsize;
  input SLOT_7_AXI_arvalid;
  input [31:0]SLOT_7_AXI_awaddr;
  input [1:0]SLOT_7_AXI_awburst;
  input [3:0]SLOT_7_AXI_awcache;
  input [11:0]SLOT_7_AXI_awid;
  input [7:0]SLOT_7_AXI_awlen;
  input [0:0]SLOT_7_AXI_awlock;
  input [2:0]SLOT_7_AXI_awprot;
  input SLOT_7_AXI_awready;
  input [2:0]SLOT_7_AXI_awsize;
  input SLOT_7_AXI_awvalid;
  input [11:0]SLOT_7_AXI_bid;
  input SLOT_7_AXI_bready;
  input [1:0]SLOT_7_AXI_bresp;
  input SLOT_7_AXI_bvalid;
  input [31:0]SLOT_7_AXI_rdata;
  input [11:0]SLOT_7_AXI_rid;
  input SLOT_7_AXI_rlast;
  input SLOT_7_AXI_rready;
  input [1:0]SLOT_7_AXI_rresp;
  input SLOT_7_AXI_rvalid;
  input [31:0]SLOT_7_AXI_wdata;
  input SLOT_7_AXI_wlast;
  input SLOT_7_AXI_wready;
  input [3:0]SLOT_7_AXI_wstrb;
  input SLOT_7_AXI_wvalid;
  input clk;
  input resetn;

  wire [63:0]SLOT_0_AXIS_tdata;
  wire SLOT_0_AXIS_tlast;
  wire SLOT_0_AXIS_tready;
  wire SLOT_0_AXIS_tvalid;
  wire [63:0]SLOT_1_AXIS_tdata;
  wire SLOT_1_AXIS_tlast;
  wire SLOT_1_AXIS_tready;
  wire SLOT_1_AXIS_tvalid;
  wire [63:0]SLOT_2_AXIS_tdata;
  wire SLOT_2_AXIS_tlast;
  wire SLOT_2_AXIS_tready;
  wire SLOT_2_AXIS_tvalid;
  wire [63:0]SLOT_3_AXIS_tdata;
  wire SLOT_3_AXIS_tlast;
  wire SLOT_3_AXIS_tready;
  wire SLOT_3_AXIS_tvalid;
  wire [39:0]SLOT_4_AXIS_tdata;
  wire SLOT_4_AXIS_tlast;
  wire SLOT_4_AXIS_tready;
  wire SLOT_4_AXIS_tvalid;
  wire [31:0]SLOT_5_AXIS_tdata;
  wire SLOT_5_AXIS_tlast;
  wire SLOT_5_AXIS_tready;
  wire SLOT_5_AXIS_tvalid;
  wire [31:0]SLOT_6_AXI_araddr;
  wire SLOT_6_AXI_arready;
  wire SLOT_6_AXI_arvalid;
  wire [31:0]SLOT_6_AXI_awaddr;
  wire SLOT_6_AXI_awready;
  wire SLOT_6_AXI_awvalid;
  wire SLOT_6_AXI_bready;
  wire [1:0]SLOT_6_AXI_bresp;
  wire SLOT_6_AXI_bvalid;
  wire [31:0]SLOT_6_AXI_rdata;
  wire SLOT_6_AXI_rready;
  wire [1:0]SLOT_6_AXI_rresp;
  wire SLOT_6_AXI_rvalid;
  wire [31:0]SLOT_6_AXI_wdata;
  wire SLOT_6_AXI_wready;
  wire [3:0]SLOT_6_AXI_wstrb;
  wire SLOT_6_AXI_wvalid;
  wire [31:0]SLOT_7_AXI_araddr;
  wire [1:0]SLOT_7_AXI_arburst;
  wire [1:0]SLOT_7_AXI_arcache;
  wire [11:0]SLOT_7_AXI_arid;
  wire [7:0]SLOT_7_AXI_arlen;
  wire [0:0]SLOT_7_AXI_arlock;
  wire [2:0]SLOT_7_AXI_arprot;
  wire [3:0]SLOT_7_AXI_arqos;
  wire SLOT_7_AXI_arready;
  wire [2:0]SLOT_7_AXI_arsize;
  wire SLOT_7_AXI_arvalid;
  wire [31:0]SLOT_7_AXI_awaddr;
  wire [1:0]SLOT_7_AXI_awburst;
  wire [3:0]SLOT_7_AXI_awcache;
  wire [11:0]SLOT_7_AXI_awid;
  wire [7:0]SLOT_7_AXI_awlen;
  wire [0:0]SLOT_7_AXI_awlock;
  wire [2:0]SLOT_7_AXI_awprot;
  wire SLOT_7_AXI_awready;
  wire [2:0]SLOT_7_AXI_awsize;
  wire SLOT_7_AXI_awvalid;
  wire [11:0]SLOT_7_AXI_bid;
  wire SLOT_7_AXI_bready;
  wire [1:0]SLOT_7_AXI_bresp;
  wire SLOT_7_AXI_bvalid;
  wire [31:0]SLOT_7_AXI_rdata;
  wire [11:0]SLOT_7_AXI_rid;
  wire SLOT_7_AXI_rlast;
  wire SLOT_7_AXI_rready;
  wire [1:0]SLOT_7_AXI_rresp;
  wire SLOT_7_AXI_rvalid;
  wire [31:0]SLOT_7_AXI_wdata;
  wire SLOT_7_AXI_wlast;
  wire SLOT_7_AXI_wready;
  wire [3:0]SLOT_7_AXI_wstrb;
  wire SLOT_7_AXI_wvalid;
  wire clk;
  wire resetn;

  bd_a434 bd_a434_i
       (.SLOT_0_AXIS_tdata(SLOT_0_AXIS_tdata),
        .SLOT_0_AXIS_tlast(SLOT_0_AXIS_tlast),
        .SLOT_0_AXIS_tready(SLOT_0_AXIS_tready),
        .SLOT_0_AXIS_tvalid(SLOT_0_AXIS_tvalid),
        .SLOT_1_AXIS_tdata(SLOT_1_AXIS_tdata),
        .SLOT_1_AXIS_tlast(SLOT_1_AXIS_tlast),
        .SLOT_1_AXIS_tready(SLOT_1_AXIS_tready),
        .SLOT_1_AXIS_tvalid(SLOT_1_AXIS_tvalid),
        .SLOT_2_AXIS_tdata(SLOT_2_AXIS_tdata),
        .SLOT_2_AXIS_tlast(SLOT_2_AXIS_tlast),
        .SLOT_2_AXIS_tready(SLOT_2_AXIS_tready),
        .SLOT_2_AXIS_tvalid(SLOT_2_AXIS_tvalid),
        .SLOT_3_AXIS_tdata(SLOT_3_AXIS_tdata),
        .SLOT_3_AXIS_tlast(SLOT_3_AXIS_tlast),
        .SLOT_3_AXIS_tready(SLOT_3_AXIS_tready),
        .SLOT_3_AXIS_tvalid(SLOT_3_AXIS_tvalid),
        .SLOT_4_AXIS_tdata(SLOT_4_AXIS_tdata),
        .SLOT_4_AXIS_tlast(SLOT_4_AXIS_tlast),
        .SLOT_4_AXIS_tready(SLOT_4_AXIS_tready),
        .SLOT_4_AXIS_tvalid(SLOT_4_AXIS_tvalid),
        .SLOT_5_AXIS_tdata(SLOT_5_AXIS_tdata),
        .SLOT_5_AXIS_tlast(SLOT_5_AXIS_tlast),
        .SLOT_5_AXIS_tready(SLOT_5_AXIS_tready),
        .SLOT_5_AXIS_tvalid(SLOT_5_AXIS_tvalid),
        .SLOT_6_AXI_araddr(SLOT_6_AXI_araddr),
        .SLOT_6_AXI_arready(SLOT_6_AXI_arready),
        .SLOT_6_AXI_arvalid(SLOT_6_AXI_arvalid),
        .SLOT_6_AXI_awaddr(SLOT_6_AXI_awaddr),
        .SLOT_6_AXI_awready(SLOT_6_AXI_awready),
        .SLOT_6_AXI_awvalid(SLOT_6_AXI_awvalid),
        .SLOT_6_AXI_bready(SLOT_6_AXI_bready),
        .SLOT_6_AXI_bresp(SLOT_6_AXI_bresp),
        .SLOT_6_AXI_bvalid(SLOT_6_AXI_bvalid),
        .SLOT_6_AXI_rdata(SLOT_6_AXI_rdata),
        .SLOT_6_AXI_rready(SLOT_6_AXI_rready),
        .SLOT_6_AXI_rresp(SLOT_6_AXI_rresp),
        .SLOT_6_AXI_rvalid(SLOT_6_AXI_rvalid),
        .SLOT_6_AXI_wdata(SLOT_6_AXI_wdata),
        .SLOT_6_AXI_wready(SLOT_6_AXI_wready),
        .SLOT_6_AXI_wstrb(SLOT_6_AXI_wstrb),
        .SLOT_6_AXI_wvalid(SLOT_6_AXI_wvalid),
        .SLOT_7_AXI_araddr(SLOT_7_AXI_araddr),
        .SLOT_7_AXI_arburst(SLOT_7_AXI_arburst),
        .SLOT_7_AXI_arcache(SLOT_7_AXI_arcache),
        .SLOT_7_AXI_arid(SLOT_7_AXI_arid),
        .SLOT_7_AXI_arlen(SLOT_7_AXI_arlen),
        .SLOT_7_AXI_arlock(SLOT_7_AXI_arlock),
        .SLOT_7_AXI_arprot(SLOT_7_AXI_arprot),
        .SLOT_7_AXI_arqos(SLOT_7_AXI_arqos),
        .SLOT_7_AXI_arready(SLOT_7_AXI_arready),
        .SLOT_7_AXI_arsize(SLOT_7_AXI_arsize),
        .SLOT_7_AXI_arvalid(SLOT_7_AXI_arvalid),
        .SLOT_7_AXI_awaddr(SLOT_7_AXI_awaddr),
        .SLOT_7_AXI_awburst(SLOT_7_AXI_awburst),
        .SLOT_7_AXI_awcache(SLOT_7_AXI_awcache),
        .SLOT_7_AXI_awid(SLOT_7_AXI_awid),
        .SLOT_7_AXI_awlen(SLOT_7_AXI_awlen),
        .SLOT_7_AXI_awlock(SLOT_7_AXI_awlock),
        .SLOT_7_AXI_awprot(SLOT_7_AXI_awprot),
        .SLOT_7_AXI_awready(SLOT_7_AXI_awready),
        .SLOT_7_AXI_awsize(SLOT_7_AXI_awsize),
        .SLOT_7_AXI_awvalid(SLOT_7_AXI_awvalid),
        .SLOT_7_AXI_bid(SLOT_7_AXI_bid),
        .SLOT_7_AXI_bready(SLOT_7_AXI_bready),
        .SLOT_7_AXI_bresp(SLOT_7_AXI_bresp),
        .SLOT_7_AXI_bvalid(SLOT_7_AXI_bvalid),
        .SLOT_7_AXI_rdata(SLOT_7_AXI_rdata),
        .SLOT_7_AXI_rid(SLOT_7_AXI_rid),
        .SLOT_7_AXI_rlast(SLOT_7_AXI_rlast),
        .SLOT_7_AXI_rready(SLOT_7_AXI_rready),
        .SLOT_7_AXI_rresp(SLOT_7_AXI_rresp),
        .SLOT_7_AXI_rvalid(SLOT_7_AXI_rvalid),
        .SLOT_7_AXI_wdata(SLOT_7_AXI_wdata),
        .SLOT_7_AXI_wlast(SLOT_7_AXI_wlast),
        .SLOT_7_AXI_wready(SLOT_7_AXI_wready),
        .SLOT_7_AXI_wstrb(SLOT_7_AXI_wstrb),
        .SLOT_7_AXI_wvalid(SLOT_7_AXI_wvalid),
        .clk(clk),
        .resetn(resetn));
endmodule
