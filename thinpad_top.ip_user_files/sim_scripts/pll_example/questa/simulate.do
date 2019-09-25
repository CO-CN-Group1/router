onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib pll_example_opt

do {wave.do}

view wave
view structure
view signals

do {pll_example.udo}

run -all

quit -force
