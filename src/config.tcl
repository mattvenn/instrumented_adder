# User config
set script_dir [file dirname [file normalize [info script]]]

# name of your project, should also match the name of the top module
set ::env(DESIGN_NAME) instrumented_adder

# save some time
set ::env(RUN_KLAYOUT_XOR) 0
set ::env(RUN_KLAYOUT_DRC) 0

# add your source files here
set ::env(VERILOG_FILES) "$::env(DESIGN_DIR)/instrumented_adder.v \
    $::env(DESIGN_DIR)/sklansky.v \
    $::env(DESIGN_DIR)/ripple_carry.v \
    $::env(DESIGN_DIR)/kogge_stone.v"

set ::env(SYNTH_READ_BLACKBOX_LIB) 1

# target density, change this if you can't get your design to fit
#set ::env(PL_TARGET_DENSITY) 0.4
set ::env(FP_CORE_UTIL) 35
set ::env(PL_TARGET_DENSITY) [ expr ($::env(FP_CORE_UTIL)+5) / 100.0 ]

# don't put clock buffers on the outputs, need tristates to be the final cells
set ::env(PL_RESIZER_BUFFER_OUTPUT_PORTS) 0

# set absolute size of the die to 300 x 300 um
#set ::env(DIE_AREA) "0 0 50 50"
#set ::env(FP_SIZING) absolute

# define number of IO pads
set ::env(SYNTH_DEFINES) "MPRJ_IO_PADS=38"

# clock period is ns
# want 10MHz, go for 20M to be safe, so period is 50ns
set ::env(CLOCK_PERIOD) "50"
set ::env(CLOCK_PORT) "clk"
# also use the ring_bot net as it clocks the ring osc counter
set ::env(CLOCK_NET) "clk"
set ::env(BASE_SDC_FILE) "$::env(DESIGN_DIR)/adder.sdc"

# macro needs to work inside Caravel, so can't be core and can't use metal 5
set ::env(DESIGN_IS_CORE) 0
set ::env(RT_MAX_LAYER) {met4}

# define power straps so the macro works inside Caravel's PDN
set ::env(VDD_NETS) [list {vccd1}]
set ::env(GND_NETS) [list {vssd1}]

# turn off CVC as we have multiple power domains
set ::env(RUN_CVC) 0

# make pins wider to solve routing issues
set ::env(FP_IO_VTHICKNESS_MULT) 4
set ::env(FP_IO_HTHICKNESS_MULT) 4
