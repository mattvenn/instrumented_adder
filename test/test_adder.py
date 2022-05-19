import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, FallingEdge, ClockCycles, Timer


@cocotb.test()
async def test_all(dut):

    clock = Clock(dut.clk, 100, units="ns")
    cocotb.fork(clock.start())
    
    # reset
    dut.reset = 1
    dut.b = 1
    dut.run  = 0
    dut.bypass = 1
    dut.extra_inverter = 0
    await ClockCycles(dut.clk, 3)

    # run the ring oscillator for a bit
    dut.reset = 0
    dut.run  = 1
    await RisingEdge(dut.time_count_overflow)
    print("ring osc: %d" % int(dut.ring_osc_counter_out.value))

    # then run, reset and connect in the adder
    dut.run   = 0
    dut.reset  = 1
    dut.bypass = 0
    dut.extra_inverter = 1
    await ClockCycles(dut.clk, 5)
    dut.run   = 1
    dut.reset  = 0
    await RisingEdge(dut.time_count_overflow)
    print("adder   : %d" % int(dut.ring_osc_counter_out.value))

