# COCOTB variables
export COCOTB_REDUCED_LOG_FMT=1
export PYTHONPATH := test:$(PYTHONPATH)
export LIBPYTHON_LOC=$(shell cocotb-config --libpython)

COMPILE_ARGS=-I $(PDK_ROOT)/sky130A/

#include $(shell cocotb-config --makefiles)/Makefile.sim

all: test_adder

analog_sim:
	cd spice
	ngspice spice/simulation.spice

# if you run rules with NOASSERT=1 it will set PYTHONOPTIMIZE, which turns off assertions in the tests
test_adder:
	rm -rf sim_build/
	mkdir sim_build/
	iverilog -DCOCOTB_SIM -o sim_build/sim.vvp -s instrumented_adder -g2012 src/instrumented_adder.v src/sklansky.v  src/behavioral_map.v
	PYTHONOPTIMIZE=${NOASSERT} MODULE=test.test_adder vvp -M $$(cocotb-config --prefix)/cocotb/libs -m libcocotbvpi_icarus sim_build/sim.vvp
	! grep failure results.xml

install_adder:
	pip3 install --upgrade --no-deps --force-reinstall git+https://github.com/tdene/synth_opt_adders.git@forest --user

#	python3 -c 'from pptrees.AdderForest import AdderForest as forest; f = forest(8, start_point = "sklansky"); f.optimize_nodes(); f.hdl("sklansky.v")'
src/sklansky.v src/behavioral_map.v:
	python3 -c 'from pptrees.AdderForest import AdderForest as forest; f = forest(8, start_point = "sklansky"); f.calculate_fanout(); f.calculate_tracks(); f.optimize_nodes(); f.add_best_blocks(); f.hdl("sklansky.v")'
	mv sklansky.v src

show_synth_%: src/%.v
	yosys -p "read_verilog $<; proc; opt; show -colors 2 -width -signed"

lint:
	verible-verilog-lint src/*v --rules_config verible.rules

clean::
	rm -rf *vcd sim_build test/__pycache__

.PHONY: clean
