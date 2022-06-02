# COCOTB variables
export COCOTB_REDUCED_LOG_FMT=1
export PYTHONPATH := test:$(PYTHONPATH)
export LIBPYTHON_LOC=$(shell cocotb-config --libpython)

# PDK defaults
#INSTALL_DIR=/home/matt/work/asic-workshop/shuttle6
OPENLANE_TAG ?= 2021.11.23_01.42.34
OPENLANE_IMAGE_NAME ?= efabless/openlane:$(OPENLANE_TAG)
#PDK_ROOT ?= $(INSTALL_DIR)/pdk
#OPENLANE_ROOT ?= $(INSTALL_DIR)/openlane

COMPILE_ARGS=-I $(PDK_ROOT)/sky130A/

all: test_adder

spice/instrumented_adder.spice: harden
	cp runs/adder/results/finishing/instrumented_adder.spice spice/instrumented_adder.spice
    
analog_bypass:
	cd spice
	ngspice spice/simulation-bypass-behavioral.spice

analog_control:
	cd spice
	ngspice spice/simulation-control-behavioral.spice

analog_adder:
	cd spice
	ngspice spice/simulation-adder-behavioral.spice

# if you run rules with NOASSERT=1 it will set PYTHONOPTIMIZE, which turns off assertions in the tests
test_adder:
	rm -rf sim_build/
	mkdir sim_build/
	iverilog -DCOCOTB_SIM -o sim_build/sim.vvp -s instrumented_adder -g2012 src/instrumented_adder.v src/sklansky.v src/kogge_stone.v src/ripple_carry.v src/brent_kung.v
	PYTHONOPTIMIZE=${NOASSERT} MODULE=test.test_adder vvp -M $$(cocotb-config --prefix)/cocotb/libs -m libcocotbvpi_icarus sim_build/sim.vvp
	! grep failure results.xml

install_adder:
	pip3 install --upgrade git+https://github.com/tdene/synth_opt_adders.git

all_adders: src/sklansky.v src/kogge_stone.v src/ripple_carry.v src/brent_kung.v

src/sklansky.v:
	python3 -c 'from pptrees.AdderForest import AdderForest as forest; f = forest(8, alias = "sklansky"); f.hdl("sklansky.v", module_name="sklansky", optimization = 1)'
	mv sklansky.v src

src/kogge_stone.v:
	python3 -c 'from pptrees.AdderForest import AdderForest as forest; f = forest(8, alias = "kogge-stone"); f.hdl("kogge_stone.v", module_name="kogge_stone", optimization = 1)'
	mv kogge_stone.v src

src/brent_kung.v:
	python3 -c 'from pptrees.AdderForest import AdderForest as forest; f = forest(8, alias = "brent-kung"); f.hdl("brent_kung.v", module_name="brent_kung", optimization = 1)'
	mv brent_kung.v src


src/ripple_carry.v:
	python3 -c 'from pptrees.AdderForest import AdderForest as forest; f = forest(8, alias = "ripple"); f.hdl("ripple_carry.v", module_name="ripple_carry", optimization = 1)'
	mv ripple_carry.v src

show_synth_%: src/%.v
	yosys -p "read_verilog $<; proc; opt; show -colors 2 -width -signed"

lint:
	verible-verilog-lint src/*v --rules_config verible.rules

clean::
	rm -rf *vcd sim_build test/__pycache__

# needs PDK_ROOT and OPENLANE_ROOT set from your environment
harden:
	docker run --rm \
	-v $(OPENLANE_ROOT):/openlane \
	-v $(PDK_ROOT):$(PDK_ROOT) \
	-v $(CURDIR):/work \
	-e PDK_ROOT=$(PDK_ROOT) \
	-u $(shell id -u $(USER)):$(shell id -g $(USER)) \
	$(OPENLANE_IMAGE_NAME) \
	/bin/bash -c "./flow.tcl -overwrite -design /work/src -run_path /work/runs -tag adder"

.PHONY: clean harden
