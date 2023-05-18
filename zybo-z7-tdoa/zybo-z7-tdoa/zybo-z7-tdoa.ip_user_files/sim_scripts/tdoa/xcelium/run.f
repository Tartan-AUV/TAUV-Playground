-makelib xcelium_lib/xilinx_vip -sv \
  "/home/theo/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
  "/home/theo/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
  "/home/theo/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
  "/home/theo/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
  "/home/theo/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
  "/home/theo/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
  "/home/theo/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
  "/home/theo/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
  "/home/theo/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/rst_vip_if.sv" \
-endlib
-makelib xcelium_lib/xpm -sv \
  "/home/theo/Xilinx/Vivado/2022.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "/home/theo/Xilinx/Vivado/2022.2/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
  "/home/theo/Xilinx/Vivado/2022.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib xcelium_lib/xpm \
  "/home/theo/Xilinx/Vivado/2022.2/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib xcelium_lib/axi_infrastructure_v1_1_0 \
  "../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_vip_v1_1_13 -sv \
  "../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/ffc2/hdl/axi_vip_v1_1_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/processing_system7_vip_v1_0_15 -sv \
  "../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/ee60/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/tdoa/ip/tdoa_processing_system7_0_2/sim/tdoa_processing_system7_0_2.v" \
  "../../../bd/tdoa/ipshared/aa00/axi_channel_demux.srcs/sources_1/new/axi_channel_demux.v" \
  "../../../bd/tdoa/ip/tdoa_axi_channel_demux_0_1/sim/tdoa_axi_channel_demux_0_1.v" \
  "../../../bd/tdoa/ip/tdoa_system_ila_0_0/bd_0/sim/bd_64f5.v" \
  "../../../bd/tdoa/ip/tdoa_system_ila_0_0/bd_0/ip/ip_0/sim/bd_64f5_ila_lib_0.v" \
-endlib
-makelib xcelium_lib/gigantic_mux \
  "../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/e87a/hdl/gigantic_mux_v1_0_cntr.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/tdoa/ip/tdoa_system_ila_0_0/bd_0/ip/ip_1/bd_64f5_g_inst_0_gigantic_mux.v" \
  "../../../bd/tdoa/ip/tdoa_system_ila_0_0/bd_0/ip/ip_1/sim/bd_64f5_g_inst_0.v" \
  "../../../bd/tdoa/ip/tdoa_system_ila_0_0/sim/tdoa_system_ila_0_0.v" \
-endlib
-makelib xcelium_lib/util_vector_logic_v2_0_2 \
  "../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/3d84/hdl/util_vector_logic_v2_0_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/tdoa/ip/tdoa_util_vector_logic_0_0/sim/tdoa_util_vector_logic_0_0.v" \
-endlib
-makelib xcelium_lib/lib_cdc_v1_0_2 \
  "../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \
-endlib
-makelib xcelium_lib/proc_sys_reset_v5_0_13 \
  "../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/tdoa/ip/tdoa_proc_sys_reset_0_0/sim/tdoa_proc_sys_reset_0_0.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/tdoa/ip/tdoa_axi_xadc_sampler_0_3/src/xadc_wiz_0_3/xadc_wiz_0.v" \
  "../../../bd/tdoa/ipshared/a97c/hdl/axi_xadc_sampler_v1_0.v" \
  "../../../bd/tdoa/ip/tdoa_axi_xadc_sampler_0_3/sim/tdoa_axi_xadc_sampler_0_3.v" \
-endlib
-makelib xcelium_lib/axis_infrastructure_v1_1_0 \
  "../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/8713/hdl/axis_infrastructure_v1_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/tdoa/ip/tdoa_axis_broadcaster_0_0/hdl/tdata_tdoa_axis_broadcaster_0_0.v" \
  "../../../bd/tdoa/ip/tdoa_axis_broadcaster_0_0/hdl/tuser_tdoa_axis_broadcaster_0_0.v" \
-endlib
-makelib xcelium_lib/axis_broadcaster_v1_1_26 \
  "../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/81d6/hdl/axis_broadcaster_v1_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/tdoa/ip/tdoa_axis_broadcaster_0_0/hdl/top_tdoa_axis_broadcaster_0_0.v" \
  "../../../bd/tdoa/ip/tdoa_axis_broadcaster_0_0/sim/tdoa_axis_broadcaster_0_0.v" \
-endlib
-makelib xcelium_lib/axi_lite_ipif_v3_0_4 \
  "../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/lib_pkg_v1_0_2 \
  "../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/0513/hdl/lib_pkg_v1_0_rfs.vhd" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_7 \
  "../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/83df/simulation/fifo_generator_vlog_beh.v" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_7 \
  "../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/83df/hdl/fifo_generator_v13_2_rfs.vhd" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_7 \
  "../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/83df/hdl/fifo_generator_v13_2_rfs.v" \
-endlib
-makelib xcelium_lib/lib_fifo_v1_0_16 \
  "../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/6c82/hdl/lib_fifo_v1_0_rfs.vhd" \
-endlib
-makelib xcelium_lib/axi_fifo_mm_s_v4_2_9 \
  "../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/4fc8/hdl/axi_fifo_mm_s_v4_2_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/tdoa/ip/tdoa_axi_fifo_mm_s_0_0/sim/tdoa_axi_fifo_mm_s_0_0.vhd" \
-endlib
-makelib xcelium_lib/generic_baseblocks_v2_1_0 \
  "../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_register_slice_v2_1_27 \
  "../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/f0b4/hdl/axi_register_slice_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_data_fifo_v2_1_26 \
  "../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/3111/hdl/axi_data_fifo_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_crossbar_v2_1_28 \
  "../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/c40e/hdl/axi_crossbar_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/tdoa/ip/tdoa_xbar_1/sim/tdoa_xbar_1.v" \
  "../../../bd/tdoa/ipshared/7335/led_debug.v" \
  "../../../bd/tdoa/ip/tdoa_led_debug_0_0/sim/tdoa_led_debug_0_0.v" \
  "../../../bd/tdoa/ipshared/e0dc/axi_fsk_demod.srcs/sources_1/new/cmult.v" \
  "../../../bd/tdoa/ipshared/e0dc/axi_fsk_demod.srcs/sources_1/new/axi_fsk_demod.v" \
  "../../../bd/tdoa/ip/tdoa_axi_fsk_demod_0_4/sim/tdoa_axi_fsk_demod_0_4.v" \
  "../../../bd/tdoa/ip/tdoa_axi_fsk_demod_0_5/sim/tdoa_axi_fsk_demod_0_5.v" \
  "../../../bd/tdoa/ip/tdoa_axi_fsk_demod_0_6/sim/tdoa_axi_fsk_demod_0_6.v" \
  "../../../bd/tdoa/ip/tdoa_axi_fsk_demod_0_7/sim/tdoa_axi_fsk_demod_0_7.v" \
-endlib
-makelib xcelium_lib/axi_protocol_converter_v2_1_27 \
  "../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/aeb3/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/tdoa/ip/tdoa_auto_pc_1/sim/tdoa_auto_pc_1.v" \
-endlib
-makelib xcelium_lib/axi_clock_converter_v2_1_26 \
  "../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/b8be/hdl/axi_clock_converter_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/blk_mem_gen_v8_4_5 \
  "../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/25a8/simulation/blk_mem_gen_v8_4.v" \
-endlib
-makelib xcelium_lib/axi_dwidth_converter_v2_1_27 \
  "../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/4675/hdl/axi_dwidth_converter_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/tdoa/ip/tdoa_auto_us_0/sim/tdoa_auto_us_0.v" \
  "../../../bd/tdoa/ip/tdoa_auto_ds_0/sim/tdoa_auto_ds_0.v" \
  "../../../bd/tdoa/ip/tdoa_auto_pc_0/sim/tdoa_auto_pc_0.v" \
  "../../../bd/tdoa/sim/tdoa.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib

