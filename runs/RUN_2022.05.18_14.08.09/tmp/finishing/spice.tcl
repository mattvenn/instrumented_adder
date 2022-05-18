
if { [info exist ::env(MAGIC_EXT_USE_GDS)] && $::env(MAGIC_EXT_USE_GDS) } {
	gds read $::env(CURRENT_GDS)
} else {
	lef read /home/matt/work/asic-workshop/shuttle5/pdk/sky130A/libs.ref/sky130_fd_sc_hd/techlef/sky130_fd_sc_hd.tlef
	if {  [info exist ::env(EXTRA_LEFS)] } {
		set lefs_in $::env(EXTRA_LEFS)
		foreach lef_file $lefs_in {
			lef read $lef_file
		}
	}
	def read /openlane/designs/wrapped_instrumented_adder/runs/RUN_2022.05.18_14.08.09/results/routing/instrumented_adder.def
}
load instrumented_adder -dereference
cd /openlane/designs/wrapped_instrumented_adder/runs/RUN_2022.05.18_14.08.09/results/finishing/
extract do local
extract no capacitance
extract no coupling
extract no resistance
extract no adjust
if { ! 0 } {
	extract unique
}
# extract warn all
extract

ext2spice lvs
ext2spice -o /openlane/designs/wrapped_instrumented_adder/runs/RUN_2022.05.18_14.08.09/results/finishing/instrumented_adder.spice instrumented_adder.ext
feedback save /openlane/designs/wrapped_instrumented_adder/runs/RUN_2022.05.18_14.08.09/logs/finishing/28-ext2spice.feedback.txt
# exec cp instrumented_adder.spice /openlane/designs/wrapped_instrumented_adder/runs/RUN_2022.05.18_14.08.09/results/finishing/instrumented_adder.spice

