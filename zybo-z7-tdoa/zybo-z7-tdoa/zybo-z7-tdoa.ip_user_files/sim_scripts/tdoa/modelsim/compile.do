vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xilinx_vip
vlib modelsim_lib/msim/xpm
vlib modelsim_lib/msim/axi_infrastructure_v1_1_0
vlib modelsim_lib/msim/axi_vip_v1_1_13
vlib modelsim_lib/msim/processing_system7_vip_v1_0_15
vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/gigantic_mux
vlib modelsim_lib/msim/util_vector_logic_v2_0_2
vlib modelsim_lib/msim/lib_cdc_v1_0_2
vlib modelsim_lib/msim/proc_sys_reset_v5_0_13
vlib modelsim_lib/msim/axis_infrastructure_v1_1_0
vlib modelsim_lib/msim/axis_broadcaster_v1_1_26
vlib modelsim_lib/msim/axi_lite_ipif_v3_0_4
vlib modelsim_lib/msim/lib_pkg_v1_0_2
vlib modelsim_lib/msim/fifo_generator_v13_2_7
vlib modelsim_lib/msim/lib_fifo_v1_0_16
vlib modelsim_lib/msim/axi_fifo_mm_s_v4_2_9
vlib modelsim_lib/msim/generic_baseblocks_v2_1_0
vlib modelsim_lib/msim/axi_register_slice_v2_1_27
vlib modelsim_lib/msim/axi_data_fifo_v2_1_26
vlib modelsim_lib/msim/axi_crossbar_v2_1_28
vlib modelsim_lib/msim/axi_protocol_converter_v2_1_27
vlib modelsim_lib/msim/axi_clock_converter_v2_1_26
vlib modelsim_lib/msim/blk_mem_gen_v8_4_5
vlib modelsim_lib/msim/axi_dwidth_converter_v2_1_27

vmap xilinx_vip modelsim_lib/msim/xilinx_vip
vmap xpm modelsim_lib/msim/xpm
vmap axi_infrastructure_v1_1_0 modelsim_lib/msim/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_13 modelsim_lib/msim/axi_vip_v1_1_13
vmap processing_system7_vip_v1_0_15 modelsim_lib/msim/processing_system7_vip_v1_0_15
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap gigantic_mux modelsim_lib/msim/gigantic_mux
vmap util_vector_logic_v2_0_2 modelsim_lib/msim/util_vector_logic_v2_0_2
vmap lib_cdc_v1_0_2 modelsim_lib/msim/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_13 modelsim_lib/msim/proc_sys_reset_v5_0_13
vmap axis_infrastructure_v1_1_0 modelsim_lib/msim/axis_infrastructure_v1_1_0
vmap axis_broadcaster_v1_1_26 modelsim_lib/msim/axis_broadcaster_v1_1_26
vmap axi_lite_ipif_v3_0_4 modelsim_lib/msim/axi_lite_ipif_v3_0_4
vmap lib_pkg_v1_0_2 modelsim_lib/msim/lib_pkg_v1_0_2
vmap fifo_generator_v13_2_7 modelsim_lib/msim/fifo_generator_v13_2_7
vmap lib_fifo_v1_0_16 modelsim_lib/msim/lib_fifo_v1_0_16
vmap axi_fifo_mm_s_v4_2_9 modelsim_lib/msim/axi_fifo_mm_s_v4_2_9
vmap generic_baseblocks_v2_1_0 modelsim_lib/msim/generic_baseblocks_v2_1_0
vmap axi_register_slice_v2_1_27 modelsim_lib/msim/axi_register_slice_v2_1_27
vmap axi_data_fifo_v2_1_26 modelsim_lib/msim/axi_data_fifo_v2_1_26
vmap axi_crossbar_v2_1_28 modelsim_lib/msim/axi_crossbar_v2_1_28
vmap axi_protocol_converter_v2_1_27 modelsim_lib/msim/axi_protocol_converter_v2_1_27
vmap axi_clock_converter_v2_1_26 modelsim_lib/msim/axi_clock_converter_v2_1_26
vmap blk_mem_gen_v8_4_5 modelsim_lib/msim/blk_mem_gen_v8_4_5
vmap axi_dwidth_converter_v2_1_27 modelsim_lib/msim/axi_dwidth_converter_v2_1_27

vlog -work xilinx_vip -64 -incr -mfcu  -sv -L axi_vip_v1_1_13 -L processing_system7_vip_v1_0_15 -L xilinx_vip "+incdir+/home/theo/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"/home/theo/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"/home/theo/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"/home/theo/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"/home/theo/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"/home/theo/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"/home/theo/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"/home/theo/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
"/home/theo/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
"/home/theo/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm -64 -incr -mfcu  -sv -L axi_vip_v1_1_13 -L processing_system7_vip_v1_0_15 -L xilinx_vip "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/ec67/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/ee60/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/8713/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/1b7e/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/122e/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/b205/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/fd26/hdl/verilog" "+incdir+/home/theo/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"/home/theo/Xilinx/Vivado/2022.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/home/theo/Xilinx/Vivado/2022.2/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"/home/theo/Xilinx/Vivado/2022.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93  \
"/home/theo/Xilinx/Vivado/2022.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axi_infrastructure_v1_1_0 -64 -incr -mfcu  "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/ec67/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/ee60/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/8713/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/1b7e/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/122e/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/b205/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/fd26/hdl/verilog" "+incdir+/home/theo/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_13 -64 -incr -mfcu  -sv -L axi_vip_v1_1_13 -L processing_system7_vip_v1_0_15 -L xilinx_vip "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/ec67/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/ee60/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/8713/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/1b7e/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/122e/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/b205/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/fd26/hdl/verilog" "+incdir+/home/theo/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/ffc2/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work processing_system7_vip_v1_0_15 -64 -incr -mfcu  -sv -L axi_vip_v1_1_13 -L processing_system7_vip_v1_0_15 -L xilinx_vip "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/ec67/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/ee60/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/8713/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/1b7e/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/122e/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/b205/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/fd26/hdl/verilog" "+incdir+/home/theo/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/ee60/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/ec67/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/ee60/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/8713/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/1b7e/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/122e/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/b205/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/fd26/hdl/verilog" "+incdir+/home/theo/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../bd/tdoa/ip/tdoa_processing_system7_0_2/sim/tdoa_processing_system7_0_2.v" \
"../../../bd/tdoa/ipshared/aa00/axi_channel_demux.srcs/sources_1/new/axi_channel_demux.v" \
"../../../bd/tdoa/ip/tdoa_axi_channel_demux_0_1/sim/tdoa_axi_channel_demux_0_1.v" \
"../../../bd/tdoa/ip/tdoa_system_ila_0_0/bd_0/sim/bd_64f5.v" \
"../../../bd/tdoa/ip/tdoa_system_ila_0_0/bd_0/ip/ip_0/sim/bd_64f5_ila_lib_0.v" \

vlog -work gigantic_mux -64 -incr -mfcu  "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/ec67/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/ee60/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/8713/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/1b7e/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/122e/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/b205/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/fd26/hdl/verilog" "+incdir+/home/theo/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/e87a/hdl/gigantic_mux_v1_0_cntr.v" \

vlog -work xil_defaultlib -64 -incr -mfcu  "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/ec67/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/ee60/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/8713/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/1b7e/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/122e/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/b205/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/fd26/hdl/verilog" "+incdir+/home/theo/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../bd/tdoa/ip/tdoa_system_ila_0_0/bd_0/ip/ip_1/bd_64f5_g_inst_0_gigantic_mux.v" \
"../../../bd/tdoa/ip/tdoa_system_ila_0_0/bd_0/ip/ip_1/sim/bd_64f5_g_inst_0.v" \
"../../../bd/tdoa/ip/tdoa_system_ila_0_0/sim/tdoa_system_ila_0_0.v" \

vlog -work util_vector_logic_v2_0_2 -64 -incr -mfcu  "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/ec67/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/ee60/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/8713/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/1b7e/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/122e/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/b205/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/fd26/hdl/verilog" "+incdir+/home/theo/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/3d84/hdl/util_vector_logic_v2_0_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr -mfcu  "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/ec67/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/ee60/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/8713/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/1b7e/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/122e/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/b205/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/fd26/hdl/verilog" "+incdir+/home/theo/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../bd/tdoa/ip/tdoa_util_vector_logic_0_0/sim/tdoa_util_vector_logic_0_0.v" \

vcom -work lib_cdc_v1_0_2 -64 -93  \
"../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_13 -64 -93  \
"../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93  \
"../../../bd/tdoa/ip/tdoa_proc_sys_reset_0_0/sim/tdoa_proc_sys_reset_0_0.vhd" \

vlog -work xil_defaultlib -64 -incr -mfcu  "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/ec67/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/ee60/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/8713/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/1b7e/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/122e/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/b205/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/fd26/hdl/verilog" "+incdir+/home/theo/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../bd/tdoa/ip/tdoa_axi_xadc_sampler_0_3/src/xadc_wiz_0_3/xadc_wiz_0.v" \
"../../../bd/tdoa/ipshared/a97c/hdl/axi_xadc_sampler_v1_0.v" \
"../../../bd/tdoa/ip/tdoa_axi_xadc_sampler_0_3/sim/tdoa_axi_xadc_sampler_0_3.v" \

vlog -work axis_infrastructure_v1_1_0 -64 -incr -mfcu  "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/ec67/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/ee60/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/8713/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/1b7e/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/122e/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/b205/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/fd26/hdl/verilog" "+incdir+/home/theo/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/8713/hdl/axis_infrastructure_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr -mfcu  "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/ec67/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/ee60/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/8713/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/1b7e/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/122e/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/b205/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/fd26/hdl/verilog" "+incdir+/home/theo/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../bd/tdoa/ip/tdoa_axis_broadcaster_0_0/hdl/tdata_tdoa_axis_broadcaster_0_0.v" \
"../../../bd/tdoa/ip/tdoa_axis_broadcaster_0_0/hdl/tuser_tdoa_axis_broadcaster_0_0.v" \

vlog -work axis_broadcaster_v1_1_26 -64 -incr -mfcu  "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/ec67/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/ee60/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/8713/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/1b7e/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/122e/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/b205/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/fd26/hdl/verilog" "+incdir+/home/theo/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/81d6/hdl/axis_broadcaster_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr -mfcu  "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/ec67/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/ee60/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/8713/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/1b7e/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/122e/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/b205/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/fd26/hdl/verilog" "+incdir+/home/theo/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../bd/tdoa/ip/tdoa_axis_broadcaster_0_0/hdl/top_tdoa_axis_broadcaster_0_0.v" \
"../../../bd/tdoa/ip/tdoa_axis_broadcaster_0_0/sim/tdoa_axis_broadcaster_0_0.v" \

vcom -work axi_lite_ipif_v3_0_4 -64 -93  \
"../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work lib_pkg_v1_0_2 -64 -93  \
"../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/0513/hdl/lib_pkg_v1_0_rfs.vhd" \

vlog -work fifo_generator_v13_2_7 -64 -incr -mfcu  "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/ec67/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/ee60/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/8713/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/1b7e/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/122e/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/b205/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/fd26/hdl/verilog" "+incdir+/home/theo/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/83df/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_7 -64 -93  \
"../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/83df/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_7 -64 -incr -mfcu  "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/ec67/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/ee60/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/8713/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/1b7e/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/122e/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/b205/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/fd26/hdl/verilog" "+incdir+/home/theo/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/83df/hdl/fifo_generator_v13_2_rfs.v" \

vcom -work lib_fifo_v1_0_16 -64 -93  \
"../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/6c82/hdl/lib_fifo_v1_0_rfs.vhd" \

vcom -work axi_fifo_mm_s_v4_2_9 -64 -93  \
"../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/4fc8/hdl/axi_fifo_mm_s_v4_2_rfs.vhd" \

vcom -work xil_defaultlib -64 -93  \
"../../../bd/tdoa/ip/tdoa_axi_fifo_mm_s_0_0/sim/tdoa_axi_fifo_mm_s_0_0.vhd" \

vlog -work generic_baseblocks_v2_1_0 -64 -incr -mfcu  "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/ec67/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/ee60/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/8713/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/1b7e/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/122e/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/b205/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/fd26/hdl/verilog" "+incdir+/home/theo/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_27 -64 -incr -mfcu  "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/ec67/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/ee60/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/8713/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/1b7e/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/122e/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/b205/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/fd26/hdl/verilog" "+incdir+/home/theo/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/f0b4/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work axi_data_fifo_v2_1_26 -64 -incr -mfcu  "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/ec67/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/ee60/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/8713/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/1b7e/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/122e/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/b205/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/fd26/hdl/verilog" "+incdir+/home/theo/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/3111/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_crossbar_v2_1_28 -64 -incr -mfcu  "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/ec67/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/ee60/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/8713/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/1b7e/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/122e/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/b205/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/fd26/hdl/verilog" "+incdir+/home/theo/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/c40e/hdl/axi_crossbar_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr -mfcu  "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/ec67/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/ee60/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/8713/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/1b7e/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/122e/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/b205/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/fd26/hdl/verilog" "+incdir+/home/theo/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../bd/tdoa/ip/tdoa_xbar_1/sim/tdoa_xbar_1.v" \
"../../../bd/tdoa/ipshared/7335/led_debug.v" \
"../../../bd/tdoa/ip/tdoa_led_debug_0_0/sim/tdoa_led_debug_0_0.v" \
"../../../bd/tdoa/ipshared/e0dc/axi_fsk_demod.srcs/sources_1/new/cmult.v" \
"../../../bd/tdoa/ipshared/e0dc/axi_fsk_demod.srcs/sources_1/new/axi_fsk_demod.v" \
"../../../bd/tdoa/ip/tdoa_axi_fsk_demod_0_4/sim/tdoa_axi_fsk_demod_0_4.v" \
"../../../bd/tdoa/ip/tdoa_axi_fsk_demod_0_5/sim/tdoa_axi_fsk_demod_0_5.v" \
"../../../bd/tdoa/ip/tdoa_axi_fsk_demod_0_6/sim/tdoa_axi_fsk_demod_0_6.v" \
"../../../bd/tdoa/ip/tdoa_axi_fsk_demod_0_7/sim/tdoa_axi_fsk_demod_0_7.v" \

vlog -work axi_protocol_converter_v2_1_27 -64 -incr -mfcu  "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/ec67/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/ee60/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/8713/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/1b7e/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/122e/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/b205/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/fd26/hdl/verilog" "+incdir+/home/theo/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/aeb3/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr -mfcu  "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/ec67/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/ee60/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/8713/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/1b7e/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/122e/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/b205/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/fd26/hdl/verilog" "+incdir+/home/theo/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../bd/tdoa/ip/tdoa_auto_pc_1/sim/tdoa_auto_pc_1.v" \

vlog -work axi_clock_converter_v2_1_26 -64 -incr -mfcu  "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/ec67/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/ee60/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/8713/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/1b7e/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/122e/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/b205/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/fd26/hdl/verilog" "+incdir+/home/theo/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/b8be/hdl/axi_clock_converter_v2_1_vl_rfs.v" \

vlog -work blk_mem_gen_v8_4_5 -64 -incr -mfcu  "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/ec67/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/ee60/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/8713/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/1b7e/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/122e/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/b205/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/fd26/hdl/verilog" "+incdir+/home/theo/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/25a8/simulation/blk_mem_gen_v8_4.v" \

vlog -work axi_dwidth_converter_v2_1_27 -64 -incr -mfcu  "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/ec67/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/ee60/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/8713/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/1b7e/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/122e/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/b205/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/fd26/hdl/verilog" "+incdir+/home/theo/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/4675/hdl/axi_dwidth_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr -mfcu  "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/ec67/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/ee60/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/8713/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/1b7e/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/122e/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/b205/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/fd26/hdl/verilog" "+incdir+/home/theo/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../bd/tdoa/ip/tdoa_auto_us_0/sim/tdoa_auto_us_0.v" \
"../../../bd/tdoa/ip/tdoa_auto_ds_0/sim/tdoa_auto_ds_0.v" \
"../../../bd/tdoa/ip/tdoa_auto_pc_0/sim/tdoa_auto_pc_0.v" \
"../../../bd/tdoa/sim/tdoa.v" \

vlog -work xil_defaultlib \
"glbl.v"

