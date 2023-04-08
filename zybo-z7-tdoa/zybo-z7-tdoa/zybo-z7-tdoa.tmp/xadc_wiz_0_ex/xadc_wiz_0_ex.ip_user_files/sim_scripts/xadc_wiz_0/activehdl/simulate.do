onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+xadc_wiz_0  -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.xadc_wiz_0 xil_defaultlib.glbl

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure

do {xadc_wiz_0.udo}

run

endsim

quit -force