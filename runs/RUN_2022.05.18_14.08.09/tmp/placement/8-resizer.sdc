###############################################################################
# Created by write_sdc
# Wed May 18 14:08:15 2022
###############################################################################
current_design instrumented_adder
###############################################################################
# Timing Constraints
###############################################################################
create_clock -name clk -period 10.0000 [get_ports {clk}]
set_clock_transition 0.1500 [get_clocks {clk}]
set_clock_uncertainty 0.2500 clk
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {reset}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {chain}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {outputs[0]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {outputs[1]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {outputs[2]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {outputs[3]}]
###############################################################################
# Environment
###############################################################################
set_load -pin_load 0.0334 [get_ports {chain}]
set_load -pin_load 0.0334 [get_ports {outputs[3]}]
set_load -pin_load 0.0334 [get_ports {outputs[2]}]
set_load -pin_load 0.0334 [get_ports {outputs[1]}]
set_load -pin_load 0.0334 [get_ports {outputs[0]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {clk}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {reset}]
set_timing_derate -early 0.9500
set_timing_derate -late 1.0500
###############################################################################
# Design Rules
###############################################################################
set_max_fanout 5.0000 [current_design]
