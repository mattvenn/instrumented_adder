import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, FallingEdge, ClockCycles, Timer


@cocotb.test()
async def test_all(dut):

    clock = Clock(dut.clk, 100, units="ns")
    cocotb.fork(clock.start())
    
    # reset
    dut.reset = 1
    dut.b = 1 << 7
    dut.counter_end = 10
    dut.run  = 0
    dut.bypass = 0
    dut.extra_inverter = 0
    await ClockCycles(dut.clk, 3)

    # run the ring oscillator for a bit
    dut.reset = 0
    dut.run  = 1
    await RisingEdge(dut.time_count_overflow)
    count = int(dut.ring_osc_counter_out.value)
    await ClockCycles(dut.clk, 5)
    print("adder    : %d" % count)
#    assert count == 10

    # this part trying to run in ../spice/simulation.spice
    # then run, reset and connect in the adder
    dut.run   = 0
    dut.reset  = 1
    dut.bypass = 1
    dut.extra_inverter = 1
    await ClockCycles(dut.clk, 2)
    dut.run   = 1
    dut.reset  = 0
    await RisingEdge(dut.time_count_overflow)
    count = int(dut.ring_osc_counter_out.value)
    await ClockCycles(dut.clk, 5)
    print("no adder : %d" % count)
#    assert count == 33

