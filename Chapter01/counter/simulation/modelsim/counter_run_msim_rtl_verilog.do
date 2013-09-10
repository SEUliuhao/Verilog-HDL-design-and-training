transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+H:/fourbook/FB/code/Chapter01/counter/src {H:/fourbook/FB/code/Chapter01/counter/src/counter.v}

vlog -vlog01compat -work work +incdir+H:/fourbook/FB/code/Chapter01/counter/simulation/modelsim {H:/fourbook/FB/code/Chapter01/counter/simulation/modelsim/counter_tb.vt}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L cycloneii_ver -L rtl_work -L work -voptargs="+acc" counter_tb.vt

add wave *
view structure
view signals
run -all
