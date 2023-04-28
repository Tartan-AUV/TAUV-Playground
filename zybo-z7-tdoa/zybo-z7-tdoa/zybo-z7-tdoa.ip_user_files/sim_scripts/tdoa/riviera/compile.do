vlib work
vlib riviera

vlib riviera/xilinx_vip
vlib riviera/xpm
vlib riviera/axi_infrastructure_v1_1_0
vlib riviera/axi_vip_v1_1_13
vlib riviera/processing_system7_vip_v1_0_15
vlib riviera/xil_defaultlib
vlib riviera/gigantic_mux
vlib riviera/util_vector_logic_v2_0_2
vlib riviera/lib_cdc_v1_0_2
vlib riviera/proc_sys_reset_v5_0_13

vmap xilinx_vip riviera/xilinx_vip
vmap xpm riviera/xpm
vmap axi_infrastructure_v1_1_0 riviera/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_13 riviera/axi_vip_v1_1_13
vmap processing_system7_vip_v1_0_15 riviera/processing_system7_vip_v1_0_15
vmap xil_defaultlib riviera/xil_defaultlib
vmap gigantic_mux riviera/gigantic_mux
vmap util_vector_logic_v2_0_2 riviera/util_vector_logic_v2_0_2
vmap lib_cdc_v1_0_2 riviera/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_13 riviera/proc_sys_reset_v5_0_13

vlog -work xilinx_vip  -sv2k12 "+incdir+/home/theo/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"/home/theo/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"/home/theo/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"/home/theo/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"/home/theo/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"/home/theo/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"/home/theo/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"/home/theo/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
"/home/theo/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
"/home/theo/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm  -sv2k12 "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/ec67/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/ee60/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/1b7e/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/122e/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/b205/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/fd26/hdl/verilog" "+incdir+/home/theo/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"/home/theo/Xilinx/Vivado/2022.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/home/theo/Xilinx/Vivado/2022.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93  \
"/home/theo/Xilinx/Vivado/2022.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axi_infrastructure_v1_1_0  -v2k5 "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/ec67/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/ee60/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/1b7e/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/122e/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/b205/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/fd26/hdl/verilog" "+incdir+/home/theo/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_13  -sv2k12 "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/ec67/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/ee60/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/1b7e/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/122e/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/b205/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/fd26/hdl/verilog" "+incdir+/home/theo/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/ffc2/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work processing_system7_vip_v1_0_15  -sv2k12 "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/ec67/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/ee60/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/1b7e/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/122e/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/b205/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/fd26/hdl/verilog" "+incdir+/home/theo/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/ee60/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/ec67/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/ee60/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/1b7e/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/122e/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/b205/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/fd26/hdl/verilog" "+incdir+/home/theo/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../bd/tdoa/ip/tdoa_processing_system7_0_2/sim/tdoa_processing_system7_0_2.v" \
"../../../bd/tdoa/ipshared/aa00/axi_channel_demux.srcs/sources_1/new/axi_channel_demux.v" \
"../../../bd/tdoa/ip/tdoa_axi_channel_demux_0_1/sim/tdoa_axi_channel_demux_0_1.v" \
"../../../bd/tdoa/ip/tdoa_system_ila_0_0/bd_0/sim/bd_64f5.v" \
"../../../bd/tdoa/ip/tdoa_system_ila_0_0/bd_0/ip/ip_0/sim/bd_64f5_ila_lib_0.v" \

vlog -work gigantic_mux  -v2k5 "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/ec67/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/ee60/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/1b7e/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/122e/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/b205/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/fd26/hdl/verilog" "+incdir+/home/theo/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/e87a/hdl/gigantic_mux_v1_0_cntr.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/ec67/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/ee60/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/1b7e/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/122e/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/b205/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/fd26/hdl/verilog" "+incdir+/home/theo/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../bd/tdoa/ip/tdoa_system_ila_0_0/bd_0/ip/ip_1/bd_64f5_g_inst_0_gigantic_mux.v" \
"../../../bd/tdoa/ip/tdoa_system_ila_0_0/bd_0/ip/ip_1/sim/bd_64f5_g_inst_0.v" \
"../../../bd/tdoa/ip/tdoa_system_ila_0_0/sim/tdoa_system_ila_0_0.v" \

vlog -work util_vector_logic_v2_0_2  -v2k5 "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/ec67/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/ee60/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/1b7e/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/122e/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/b205/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/fd26/hdl/verilog" "+incdir+/home/theo/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/3d84/hdl/util_vector_logic_v2_0_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/ec67/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/ee60/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/1b7e/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/122e/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/b205/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/fd26/hdl/verilog" "+incdir+/home/theo/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../bd/tdoa/ip/tdoa_util_vector_logic_0_0/sim/tdoa_util_vector_logic_0_0.v" \

vcom -work lib_cdc_v1_0_2 -93  \
"../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_13 -93  \
"../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  \
"../../../bd/tdoa/ip/tdoa_proc_sys_reset_0_0/sim/tdoa_proc_sys_reset_0_0.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/ec67/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/ee60/hdl" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/1b7e/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/122e/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/b205/hdl/verilog" "+incdir+../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/fd26/hdl/verilog" "+incdir+/home/theo/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../bd/tdoa/ip/tdoa_axi_xadc_sampler_0_3/src/xadc_wiz_0_3/xadc_wiz_0.v" \
"../../../bd/tdoa/ipshared/a97c/hdl/axi_xadc_sampler_v1_0.v" \
"../../../bd/tdoa/ip/tdoa_axi_xadc_sampler_0_3/sim/tdoa_axi_xadc_sampler_0_3.v" \
"../../../bd/tdoa/ipshared/7335/led_debug.v" \
"../../../bd/tdoa/ip/tdoa_led_debug_0_0/sim/tdoa_led_debug_0_0.v" \
"../../../bd/tdoa/ipshared/f5a9/axi_fsk_demod.srcs/sources_1/new/cmult.v" \
"../../../bd/tdoa/ipshared/f5a9/axi_fsk_demod.srcs/sources_1/new/axi_fsk_demod.v" \
"../../../bd/tdoa/ip/tdoa_axi_fsk_demod_0_4/sim/tdoa_axi_fsk_demod_0_4.v" \
"../../../bd/tdoa/ip/tdoa_axi_fsk_demod_0_5/sim/tdoa_axi_fsk_demod_0_5.v" \
"../../../bd/tdoa/ip/tdoa_axi_fsk_demod_0_6/sim/tdoa_axi_fsk_demod_0_6.v" \
"../../../bd/tdoa/ip/tdoa_axi_fsk_demod_0_7/sim/tdoa_axi_fsk_demod_0_7.v" \
"../../../bd/tdoa/sim/tdoa.v" \

vlog -work xil_defaultlib \
"glbl.v"

