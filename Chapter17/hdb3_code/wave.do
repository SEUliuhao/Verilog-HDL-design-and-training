onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /hdb3_code_tb/r_rst_n
add wave -noupdate /hdb3_code_tb/r_clk
add wave -noupdate /hdb3_code_tb/r_data
add wave -noupdate /hdb3_code_tb/w_hdb3_code
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {11 ns} 0} {{Cursor 2} {13 ns} 0} {{Cursor 3} {19 ns} 0} {{Cursor 4} {17 ns} 0} {{Cursor 5} {25 ns} 0}
configure wave -namecolwidth 198
configure wave -valuecolwidth 40
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {6 ns} {39 ns}
