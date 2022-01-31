transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/QuartusLite/Projet/PROC-ECE-main/Test/db {D:/QuartusLite/Projet/PROC-ECE-main/Test/db/pll_altpll.v}
vcom -93 -work work {D:/QuartusLite/Projet/PROC-ECE-main/Test/Top.vhd}
vcom -93 -work work {D:/QuartusLite/Projet/PROC-ECE-main/Test/RegisterFile.vhd}
vcom -93 -work work {D:/QuartusLite/Projet/PROC-ECE-main/Test/ProgramCounter.vhd}
vcom -93 -work work {D:/QuartusLite/Projet/PROC-ECE-main/Test/Processor.vhd}
vcom -93 -work work {D:/QuartusLite/Projet/PROC-ECE-main/Test/InstructionMemory.vhd}
vcom -93 -work work {D:/QuartusLite/Projet/PROC-ECE-main/Test/InstructionDecoder.vhd}
vcom -93 -work work {D:/QuartusLite/Projet/PROC-ECE-main/Test/Displays.vhd}
vcom -93 -work work {D:/QuartusLite/Projet/PROC-ECE-main/Test/DataMemory.vhd}
vcom -93 -work work {D:/QuartusLite/Projet/PROC-ECE-main/Test/Counter.vhd}
vcom -93 -work work {D:/QuartusLite/Projet/PROC-ECE-main/Test/Alu.vhd}
vcom -93 -work work {D:/QuartusLite/Projet/PROC-ECE-main/Test/PLL.vhd}
vcom -93 -work work {D:/QuartusLite/Projet/PROC-ECE-main/Test/RAM00.vhd}
vcom -93 -work work {D:/QuartusLite/Projet/PROC-ECE-main/Test/RAM08.vhd}
vcom -93 -work work {D:/QuartusLite/Projet/PROC-ECE-main/Test/RAM16.vhd}
vcom -93 -work work {D:/QuartusLite/Projet/PROC-ECE-main/Test/RAM24.vhd}

vcom -93 -work work {D:/QuartusLite/Projet/PROC-ECE-main/Test/TestBenchTop.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L fiftyfivenm -L rtl_work -L work -voptargs="+acc"  TestBenchTop

add wave *
view structure
view signals
run -all
