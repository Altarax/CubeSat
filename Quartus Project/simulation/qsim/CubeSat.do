onerror {quit -f}
vlib work
vlog -work work CubeSat.vo
vlog -work work CubeSat.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.accelerometer_vlg_vec_tst
vcd file -direction CubeSat.msim.vcd
vcd add -internal accelerometer_vlg_vec_tst/*
vcd add -internal accelerometer_vlg_vec_tst/i1/*
add wave /*
run -all
