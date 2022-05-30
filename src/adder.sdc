create_clock [get_ports clk]  -name clk  -period 50
create_clock [get_nets {counters|ring_osc}] -name ring_osc -period 50
set_clock_groups -asynchronous -group [get_clocks {clk}] -group [get_clocks {ring_osc}]
