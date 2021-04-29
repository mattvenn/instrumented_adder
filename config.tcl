# User config
set script_dir [file dirname [file normalize [info script]]]

set ::env(DESIGN_NAME) project_name

# Change if needed
set ::env(VERILOG_FILES) "$::env(DESIGN_DIR)/wrapper.v \
    $::env(DESIGN_DIR)/other source files.v"

set ::env(PL_TARGET_DENSITY) 0.4
set ::env(DIE_AREA) "0 0 300 300"
set ::env(FP_SIZING) absolute

set ::env(SYNTH_DEFINES) "MPRJ_IO_PADS=38"

# Fill this
set ::env(CLOCK_PERIOD) "10"
set ::env(CLOCK_PORT) "wb_clk_i"

set ::env(DESIGN_IS_CORE) 0
set ::env(GLB_RT_MAXLAYER) 5



set ::env(VDD_NETS) [list {vccd1} {vccd2} {vdda1} {vdda2}]
set ::env(GND_NETS) [list {vssd1} {vssd2} {vssa1} {vssa2}]

set ::env(FP_PIN_ORDER_CFG) $script_dir/pin_order.cfg

set ::env(RUN_CVC) 0
