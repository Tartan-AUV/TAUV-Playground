vlib work
vlib activehdl

vlib activehdl/xil_defaultlib
vlib activehdl/lib_cdc_v1_0_2
vlib activehdl/proc_sys_reset_v5_0_13

vmap xil_defaultlib activehdl/xil_defaultlib
vmap lib_cdc_v1_0_2 activehdl/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_13 activehdl/proc_sys_reset_v5_0_13

vlog -work xil_defaultlib  -v2k5 \
"../../../bd/tdoa/ip/tdoa_axi_xadc_sampler_0_2/src/xadc_wiz_0_3/xadc_wiz_0.v" \
"../../../bd/tdoa/ipshared/7c2b/hdl/axi_xadc_sampler_v1_0.v" \
"../../../bd/tdoa/ip/tdoa_axi_xadc_sampler_0_2/sim/tdoa_axi_xadc_sampler_0_2.v" \
"../../../bd/tdoa/ipshared/3e43/axi_channel_demux.srcs/sources_1/new/axi_channel_demux.v" \
"../../../bd/tdoa/ip/tdoa_axi_channel_demux_0_0/sim/tdoa_axi_channel_demux_0_0.v" \
"../../../bd/tdoa/ipshared/06b6/axi_fsk_demod.srcs/sources_1/new/axi_fsk_demod.v" \
"../../../bd/tdoa/ip/tdoa_axi_fsk_demod_0_0/sim/tdoa_axi_fsk_demod_0_0.v" \
"../../../bd/tdoa/ip/tdoa_axi_fsk_demod_0_1/sim/tdoa_axi_fsk_demod_0_1.v" \
"../../../bd/tdoa/ip/tdoa_axi_fsk_demod_0_2/sim/tdoa_axi_fsk_demod_0_2.v" \
"../../../bd/tdoa/ip/tdoa_axi_fsk_demod_0_3/sim/tdoa_axi_fsk_demod_0_3.v" \

vcom -work lib_cdc_v1_0_2 -93  \
"../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_13 -93  \
"../../../../zybo-z7-tdoa.gen/sources_1/bd/tdoa/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  \
"../../../bd/tdoa/ip/tdoa_rst_i_axis_clk_100M_0/sim/tdoa_rst_i_axis_clk_100M_0.vhd" \

vlog -work xil_defaultlib  -v2k5 \
"../../../bd/tdoa/sim/tdoa.v" \

vlog -work xil_defaultlib \
"glbl.v"

