onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /alu32_testbench/ALUop
add wave -noupdate /alu32_testbench/CLK
add wave -noupdate /alu32_testbench/inp1
add wave -noupdate /alu32_testbench/inp2
add wave -noupdate /alu32_testbench/out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {756 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 165
configure wave -valuecolwidth 177
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
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {2832 ps}
