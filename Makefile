# COCOTB variables
export COCOTB_REDUCED_LOG_FMT=1
export PYTHONPATH := test:$(PYTHONPATH)
export LIBPYTHON_LOC=$(shell cocotb-config --libpython)

MODULE = test_adder
TOPLEVEL = wrapped_instrumented_adder
#VERILOG_SOURCES = src/instrumented_adder.v
VERILOG_SOURCES = runs/RUN_2022.05.18_09.39.00/results/final/verilog/gl/wrapped_instrumented_adder.v
COMPILE_ARGS=-I $(PDK_ROOT)/sky130A/

#include $(shell cocotb-config --makefiles)/Makefile.sim

all: test_adder

analog_sim:
	ngspice spice/simulation.spice

# if you run rules with NOASSERT=1 it will set PYTHONOPTIMIZE, which turns off assertions in the tests
test_adder:
	rm -rf sim_build/
	mkdir sim_build/
	iverilog -DCOCOTB_SIM -o sim_build/sim.vvp -s instrumented_adder -g2012 src/instrumented_adder.v src/sklansky.v src/behavioral_map.v
	PYTHONOPTIMIZE=${NOASSERT} MODULE=test.test_adder vvp -M $$(cocotb-config --prefix)/cocotb/libs -m libcocotbvpi_icarus sim_build/sim.vvp
	! grep failure results.xml

install_adder:
	pip3 install git+https://github.com/tdene/synth_opt_adders.git --user

src/sklansky.v src/behavioral_map.v:
	python3 -c 'from pptrees.adder_tree import adder_tree as tree; g = tree(8, network = "sklansky"); g.hdl("sklansky.v")'
	mv behavioral_map.v sklansky.v src

show_synth_%: src/%.v
	yosys -p "read_verilog $<; proc; opt; show -colors 2 -width -signed"

lint:
	verible-verilog-lint src/*v --rules_config verible.rules

clean::
	rm -rf *vcd sim_build test/__pycache__

.PHONY: clean
