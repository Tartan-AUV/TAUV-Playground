#!/bin/sh

# 
# Vivado(TM)
# runme.sh: a Vivado-generated Runs Script for UNIX
# Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
# 

if [ -z "$PATH" ]; then
  PATH=/home/theo/Xilinx/Vitis/2022.2/bin:/home/theo/Xilinx/Vivado/2022.2/ids_lite/ISE/bin/lin64:/home/theo/Xilinx/Vivado/2022.2/bin
else
  PATH=/home/theo/Xilinx/Vitis/2022.2/bin:/home/theo/Xilinx/Vivado/2022.2/ids_lite/ISE/bin/lin64:/home/theo/Xilinx/Vivado/2022.2/bin:$PATH
fi
export PATH

if [ -z "$LD_LIBRARY_PATH" ]; then
  LD_LIBRARY_PATH=
else
  LD_LIBRARY_PATH=:$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH

HD_PWD='/media/psf/TAUV-Playground/zybo-z7-tdoa/ip_repo/axi_fsk_demod/axi_fsk_demod.runs/impl_1'
cd "$HD_PWD"

HD_LOG=runme.log
/bin/touch $HD_LOG

ISEStep="./ISEWrap.sh"
EAStep()
{
     $ISEStep $HD_LOG "$@" >> $HD_LOG 2>&1
     if [ $? -ne 0 ]
     then
         exit
     fi
}

# pre-commands:
/bin/touch .init_design.begin.rst
EAStep vivado -log axi_fsk_demod.vdi -applog -m64 -product Vivado -messageDb vivado.pb -mode batch -source axi_fsk_demod.tcl -notrace

