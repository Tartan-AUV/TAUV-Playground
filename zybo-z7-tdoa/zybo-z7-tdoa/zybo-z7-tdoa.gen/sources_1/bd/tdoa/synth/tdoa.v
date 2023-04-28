//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
//Date        : Fri Apr 28 02:32:30 2023
//Host        : theo-ubuntu running 64-bit Ubuntu 22.04.1 LTS
//Command     : generate_target tdoa.bd
//Design      : tdoa
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "tdoa,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=tdoa,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=11,numReposBlks=11,numNonXlnxBlks=7,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,da_axi4_cnt=3,da_axi4_s2mm_cnt=3,da_board_cnt=9,da_clkrst_cnt=12,da_ps7_cnt=6,synth_mode=Global}" *) (* HW_HANDOFF = "tdoa.hwdef" *) 
module tdoa
   (DDR_addr,
    DDR_ba,
    DDR_cas_n,
    DDR_ck_n,
    DDR_ck_p,
    DDR_cke,
    DDR_cs_n,
    DDR_dm,
    DDR_dq,
    DDR_dqs_n,
    DDR_dqs_p,
    DDR_odt,
    DDR_ras_n,
    DDR_reset_n,
    DDR_we_n,
    FIXED_IO_ddr_vrn,
    FIXED_IO_ddr_vrp,
    FIXED_IO_mio,
    FIXED_IO_ps_clk,
    FIXED_IO_ps_porb,
    FIXED_IO_ps_srstb,
    ja,
    leds);
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR ADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DDR, AXI_ARBITRATION_SCHEME TDM, BURST_LENGTH 8, CAN_DEBUG false, CAS_LATENCY 11, CAS_WRITE_LATENCY 11, CS_ENABLED true, DATA_MASK_ENABLED true, DATA_WIDTH 8, MEMORY_TYPE COMPONENTS, MEM_ADDR_MAP ROW_COLUMN_BANK, SLOT Single, TIMEPERIOD_PS 1250" *) inout [14:0]DDR_addr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR BA" *) inout [2:0]DDR_ba;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR CAS_N" *) inout DDR_cas_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR CK_N" *) inout DDR_ck_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR CK_P" *) inout DDR_ck_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR CKE" *) inout DDR_cke;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR CS_N" *) inout DDR_cs_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR DM" *) inout [3:0]DDR_dm;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR DQ" *) inout [31:0]DDR_dq;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR DQS_N" *) inout [3:0]DDR_dqs_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR DQS_P" *) inout [3:0]DDR_dqs_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR ODT" *) inout DDR_odt;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR RAS_N" *) inout DDR_ras_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR RESET_N" *) inout DDR_reset_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR WE_N" *) inout DDR_we_n;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO DDR_VRN" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME FIXED_IO, CAN_DEBUG false" *) inout FIXED_IO_ddr_vrn;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO DDR_VRP" *) inout FIXED_IO_ddr_vrp;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO MIO" *) inout [53:0]FIXED_IO_mio;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO PS_CLK" *) inout FIXED_IO_ps_clk;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO PS_PORB" *) inout FIXED_IO_ps_porb;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO PS_SRSTB" *) inout FIXED_IO_ps_srstb;
  input [7:0]ja;
  output [3:0]leds;

  (* CONN_BUS_INFO = "axi_channel_demux_0_axis_out0 xilinx.com:interface:axis:1.0 None TDATA" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [39:0]axi_channel_demux_0_axis_out0_TDATA;
  (* CONN_BUS_INFO = "axi_channel_demux_0_axis_out0 xilinx.com:interface:axis:1.0 None TREADY" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire axi_channel_demux_0_axis_out0_TREADY;
  (* CONN_BUS_INFO = "axi_channel_demux_0_axis_out0 xilinx.com:interface:axis:1.0 None TVALID" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire axi_channel_demux_0_axis_out0_TVALID;
  wire [39:0]axi_channel_demux_0_axis_out1_TDATA;
  wire axi_channel_demux_0_axis_out1_TREADY;
  wire axi_channel_demux_0_axis_out1_TVALID;
  wire [39:0]axi_channel_demux_0_axis_out2_TDATA;
  wire axi_channel_demux_0_axis_out2_TREADY;
  wire axi_channel_demux_0_axis_out2_TVALID;
  wire [39:0]axi_channel_demux_0_axis_out3_TDATA;
  wire axi_channel_demux_0_axis_out3_TREADY;
  wire axi_channel_demux_0_axis_out3_TVALID;
  (* CONN_BUS_INFO = "axi_fsk_demod_0_axis_out xilinx.com:interface:axis:1.0 None TDATA" *) (* DONT_TOUCH *) wire [63:0]axi_fsk_demod_0_axis_out_TDATA;
  (* CONN_BUS_INFO = "axi_fsk_demod_0_axis_out xilinx.com:interface:axis:1.0 None TVALID" *) (* DONT_TOUCH *) wire axi_fsk_demod_0_axis_out_TVALID;
  (* CONN_BUS_INFO = "axi_fsk_demod_1_axis_out xilinx.com:interface:axis:1.0 None TDATA" *) (* DONT_TOUCH *) wire [63:0]axi_fsk_demod_1_axis_out_TDATA;
  (* CONN_BUS_INFO = "axi_fsk_demod_1_axis_out xilinx.com:interface:axis:1.0 None TVALID" *) (* DONT_TOUCH *) wire axi_fsk_demod_1_axis_out_TVALID;
  (* CONN_BUS_INFO = "axi_fsk_demod_2_axis_out xilinx.com:interface:axis:1.0 None TDATA" *) (* DONT_TOUCH *) wire [63:0]axi_fsk_demod_2_axis_out_TDATA;
  (* CONN_BUS_INFO = "axi_fsk_demod_2_axis_out xilinx.com:interface:axis:1.0 None TVALID" *) (* DONT_TOUCH *) wire axi_fsk_demod_2_axis_out_TVALID;
  (* CONN_BUS_INFO = "axi_fsk_demod_3_axis_out xilinx.com:interface:axis:1.0 None TDATA" *) (* DONT_TOUCH *) wire [63:0]axi_fsk_demod_3_axis_out_TDATA;
  (* CONN_BUS_INFO = "axi_fsk_demod_3_axis_out xilinx.com:interface:axis:1.0 None TVALID" *) (* DONT_TOUCH *) wire axi_fsk_demod_3_axis_out_TVALID;
  (* CONN_BUS_INFO = "axi_xadc_sampler_0_o_axis_out xilinx.com:interface:axis:1.0 None TDATA" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [39:0]axi_xadc_sampler_0_o_axis_out_TDATA;
  (* CONN_BUS_INFO = "axi_xadc_sampler_0_o_axis_out xilinx.com:interface:axis:1.0 None TREADY" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire axi_xadc_sampler_0_o_axis_out_TREADY;
  (* CONN_BUS_INFO = "axi_xadc_sampler_0_o_axis_out xilinx.com:interface:axis:1.0 None TVALID" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire axi_xadc_sampler_0_o_axis_out_TVALID;
  wire [7:0]ja_0_1;
  wire [3:0]led_debug_0_o_leds;
  (* DEBUG = "true" *) (* MARK_DEBUG *) wire [0:0]proc_sys_reset_0_peripheral_aresetn;
  wire [0:0]proc_sys_reset_0_peripheral_aresetn1;
  wire [14:0]processing_system7_0_DDR_ADDR;
  wire [2:0]processing_system7_0_DDR_BA;
  wire processing_system7_0_DDR_CAS_N;
  wire processing_system7_0_DDR_CKE;
  wire processing_system7_0_DDR_CK_N;
  wire processing_system7_0_DDR_CK_P;
  wire processing_system7_0_DDR_CS_N;
  wire [3:0]processing_system7_0_DDR_DM;
  wire [31:0]processing_system7_0_DDR_DQ;
  wire [3:0]processing_system7_0_DDR_DQS_N;
  wire [3:0]processing_system7_0_DDR_DQS_P;
  wire processing_system7_0_DDR_ODT;
  wire processing_system7_0_DDR_RAS_N;
  wire processing_system7_0_DDR_RESET_N;
  wire processing_system7_0_DDR_WE_N;
  wire processing_system7_0_FCLK_CLK0;
  wire processing_system7_0_FCLK_RESET0_N;
  wire processing_system7_0_FIXED_IO_DDR_VRN;
  wire processing_system7_0_FIXED_IO_DDR_VRP;
  wire [53:0]processing_system7_0_FIXED_IO_MIO;
  wire processing_system7_0_FIXED_IO_PS_CLK;
  wire processing_system7_0_FIXED_IO_PS_PORB;
  wire processing_system7_0_FIXED_IO_PS_SRSTB;

  assign ja_0_1 = ja[7:0];
  assign leds[3:0] = led_debug_0_o_leds;
  tdoa_axi_channel_demux_0_1 axi_channel_demux_0
       (.i_axis_clk(processing_system7_0_FCLK_CLK0),
        .i_axis_in_tdata(axi_xadc_sampler_0_o_axis_out_TDATA),
        .i_axis_in_tvalid(axi_xadc_sampler_0_o_axis_out_TVALID),
        .i_axis_out0_tready(axi_channel_demux_0_axis_out0_TREADY),
        .i_axis_out1_tready(axi_channel_demux_0_axis_out1_TREADY),
        .i_axis_out2_tready(axi_channel_demux_0_axis_out2_TREADY),
        .i_axis_out3_tready(axi_channel_demux_0_axis_out3_TREADY),
        .i_axis_rst(proc_sys_reset_0_peripheral_aresetn),
        .o_axis_in_tready(axi_xadc_sampler_0_o_axis_out_TREADY),
        .o_axis_out0_tdata(axi_channel_demux_0_axis_out0_TDATA),
        .o_axis_out0_tvalid(axi_channel_demux_0_axis_out0_TVALID),
        .o_axis_out1_tdata(axi_channel_demux_0_axis_out1_TDATA),
        .o_axis_out1_tvalid(axi_channel_demux_0_axis_out1_TVALID),
        .o_axis_out2_tdata(axi_channel_demux_0_axis_out2_TDATA),
        .o_axis_out2_tvalid(axi_channel_demux_0_axis_out2_TVALID),
        .o_axis_out3_tdata(axi_channel_demux_0_axis_out3_TDATA),
        .o_axis_out3_tvalid(axi_channel_demux_0_axis_out3_TVALID));
  tdoa_axi_fsk_demod_0_4 axi_fsk_demod_0
       (.i_axis_clk(processing_system7_0_FCLK_CLK0),
        .i_axis_in_tdata(axi_channel_demux_0_axis_out0_TDATA),
        .i_axis_in_tvalid(axi_channel_demux_0_axis_out0_TVALID),
        .i_axis_out_tready(1'b1),
        .i_axis_rst(proc_sys_reset_0_peripheral_aresetn),
        .o_axis_in_tready(axi_channel_demux_0_axis_out0_TREADY),
        .o_axis_out_tdata(axi_fsk_demod_0_axis_out_TDATA),
        .o_axis_out_tvalid(axi_fsk_demod_0_axis_out_TVALID));
  tdoa_axi_fsk_demod_0_5 axi_fsk_demod_1
       (.i_axis_clk(processing_system7_0_FCLK_CLK0),
        .i_axis_in_tdata(axi_channel_demux_0_axis_out1_TDATA),
        .i_axis_in_tvalid(axi_channel_demux_0_axis_out1_TVALID),
        .i_axis_out_tready(1'b1),
        .i_axis_rst(proc_sys_reset_0_peripheral_aresetn),
        .o_axis_in_tready(axi_channel_demux_0_axis_out1_TREADY),
        .o_axis_out_tdata(axi_fsk_demod_1_axis_out_TDATA),
        .o_axis_out_tvalid(axi_fsk_demod_1_axis_out_TVALID));
  tdoa_axi_fsk_demod_0_6 axi_fsk_demod_2
       (.i_axis_clk(processing_system7_0_FCLK_CLK0),
        .i_axis_in_tdata(axi_channel_demux_0_axis_out2_TDATA),
        .i_axis_in_tvalid(axi_channel_demux_0_axis_out2_TVALID),
        .i_axis_out_tready(1'b1),
        .i_axis_rst(proc_sys_reset_0_peripheral_aresetn),
        .o_axis_in_tready(axi_channel_demux_0_axis_out2_TREADY),
        .o_axis_out_tdata(axi_fsk_demod_2_axis_out_TDATA),
        .o_axis_out_tvalid(axi_fsk_demod_2_axis_out_TVALID));
  tdoa_axi_fsk_demod_0_7 axi_fsk_demod_3
       (.i_axis_clk(processing_system7_0_FCLK_CLK0),
        .i_axis_in_tdata(axi_channel_demux_0_axis_out3_TDATA),
        .i_axis_in_tvalid(axi_channel_demux_0_axis_out3_TVALID),
        .i_axis_out_tready(1'b1),
        .i_axis_rst(proc_sys_reset_0_peripheral_aresetn),
        .o_axis_in_tready(axi_channel_demux_0_axis_out3_TREADY),
        .o_axis_out_tdata(axi_fsk_demod_3_axis_out_TDATA),
        .o_axis_out_tvalid(axi_fsk_demod_3_axis_out_TVALID));
  tdoa_axi_xadc_sampler_0_3 axi_xadc_sampler_0
       (.i_axis_clk(processing_system7_0_FCLK_CLK0),
        .i_axis_out_tready(axi_xadc_sampler_0_o_axis_out_TREADY),
        .i_axis_rst(proc_sys_reset_0_peripheral_aresetn),
        .ja(ja_0_1),
        .o_axis_out_tdata(axi_xadc_sampler_0_o_axis_out_TDATA),
        .o_axis_out_tvalid(axi_xadc_sampler_0_o_axis_out_TVALID));
  tdoa_led_debug_0_0 led_debug_0
       (.i_axis_0_tdata(axi_fsk_demod_0_axis_out_TDATA),
        .i_axis_0_tvalid(axi_fsk_demod_0_axis_out_TVALID),
        .i_axis_1_tdata(axi_fsk_demod_1_axis_out_TDATA),
        .i_axis_1_tvalid(axi_fsk_demod_1_axis_out_TVALID),
        .i_axis_2_tdata(axi_fsk_demod_2_axis_out_TDATA),
        .i_axis_2_tvalid(axi_fsk_demod_2_axis_out_TVALID),
        .i_axis_3_tdata(axi_fsk_demod_3_axis_out_TDATA),
        .i_axis_3_tvalid(axi_fsk_demod_3_axis_out_TVALID),
        .i_axis_clk(processing_system7_0_FCLK_CLK0),
        .i_axis_rst(proc_sys_reset_0_peripheral_aresetn),
        .o_leds(led_debug_0_o_leds));
  tdoa_proc_sys_reset_0_0 proc_sys_reset_0
       (.aux_reset_in(1'b1),
        .dcm_locked(1'b1),
        .ext_reset_in(processing_system7_0_FCLK_RESET0_N),
        .mb_debug_sys_rst(1'b0),
        .peripheral_aresetn(proc_sys_reset_0_peripheral_aresetn1),
        .slowest_sync_clk(processing_system7_0_FCLK_CLK0));
  tdoa_processing_system7_0_2 processing_system7_0
       (.DDR_Addr(DDR_addr[14:0]),
        .DDR_BankAddr(DDR_ba[2:0]),
        .DDR_CAS_n(DDR_cas_n),
        .DDR_CKE(DDR_cke),
        .DDR_CS_n(DDR_cs_n),
        .DDR_Clk(DDR_ck_p),
        .DDR_Clk_n(DDR_ck_n),
        .DDR_DM(DDR_dm[3:0]),
        .DDR_DQ(DDR_dq[31:0]),
        .DDR_DQS(DDR_dqs_p[3:0]),
        .DDR_DQS_n(DDR_dqs_n[3:0]),
        .DDR_DRSTB(DDR_reset_n),
        .DDR_ODT(DDR_odt),
        .DDR_RAS_n(DDR_ras_n),
        .DDR_VRN(FIXED_IO_ddr_vrn),
        .DDR_VRP(FIXED_IO_ddr_vrp),
        .DDR_WEB(DDR_we_n),
        .FCLK_CLK0(processing_system7_0_FCLK_CLK0),
        .FCLK_RESET0_N(processing_system7_0_FCLK_RESET0_N),
        .IRQ_F2P(1'b0),
        .MIO(FIXED_IO_mio[53:0]),
        .M_AXI_GP0_ACLK(processing_system7_0_FCLK_CLK0),
        .M_AXI_GP0_ARREADY(1'b0),
        .M_AXI_GP0_AWREADY(1'b0),
        .M_AXI_GP0_BID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .M_AXI_GP0_BRESP({1'b0,1'b0}),
        .M_AXI_GP0_BVALID(1'b0),
        .M_AXI_GP0_RDATA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .M_AXI_GP0_RID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .M_AXI_GP0_RLAST(1'b0),
        .M_AXI_GP0_RRESP({1'b0,1'b0}),
        .M_AXI_GP0_RVALID(1'b0),
        .M_AXI_GP0_WREADY(1'b0),
        .PS_CLK(FIXED_IO_ps_clk),
        .PS_PORB(FIXED_IO_ps_porb),
        .PS_SRSTB(FIXED_IO_ps_srstb),
        .USB0_VBUS_PWRFAULT(1'b0));
  tdoa_system_ila_0_0 system_ila_0
       (.SLOT_0_AXIS_tdata(axi_fsk_demod_0_axis_out_TDATA),
        .SLOT_0_AXIS_tlast(1'b0),
        .SLOT_0_AXIS_tready(1'b1),
        .SLOT_0_AXIS_tvalid(axi_fsk_demod_0_axis_out_TVALID),
        .SLOT_1_AXIS_tdata(axi_fsk_demod_1_axis_out_TDATA),
        .SLOT_1_AXIS_tlast(1'b0),
        .SLOT_1_AXIS_tready(1'b1),
        .SLOT_1_AXIS_tvalid(axi_fsk_demod_1_axis_out_TVALID),
        .SLOT_2_AXIS_tdata(axi_fsk_demod_2_axis_out_TDATA),
        .SLOT_2_AXIS_tlast(1'b0),
        .SLOT_2_AXIS_tready(1'b1),
        .SLOT_2_AXIS_tvalid(axi_fsk_demod_2_axis_out_TVALID),
        .SLOT_3_AXIS_tdata(axi_fsk_demod_3_axis_out_TDATA),
        .SLOT_3_AXIS_tlast(1'b0),
        .SLOT_3_AXIS_tready(1'b1),
        .SLOT_3_AXIS_tvalid(axi_fsk_demod_3_axis_out_TVALID),
        .SLOT_4_AXIS_tdata(axi_xadc_sampler_0_o_axis_out_TDATA),
        .SLOT_4_AXIS_tlast(1'b0),
        .SLOT_4_AXIS_tready(axi_xadc_sampler_0_o_axis_out_TREADY),
        .SLOT_4_AXIS_tvalid(axi_xadc_sampler_0_o_axis_out_TVALID),
        .SLOT_5_AXIS_tdata(axi_channel_demux_0_axis_out0_TDATA),
        .SLOT_5_AXIS_tlast(1'b0),
        .SLOT_5_AXIS_tready(axi_channel_demux_0_axis_out0_TREADY),
        .SLOT_5_AXIS_tvalid(axi_channel_demux_0_axis_out0_TVALID),
        .clk(processing_system7_0_FCLK_CLK0),
        .probe0(proc_sys_reset_0_peripheral_aresetn),
        .resetn(proc_sys_reset_0_peripheral_aresetn1));
  tdoa_util_vector_logic_0_0 util_vector_logic_0
       (.Op1(proc_sys_reset_0_peripheral_aresetn1),
        .Res(proc_sys_reset_0_peripheral_aresetn));
endmodule
