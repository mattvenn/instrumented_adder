import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, FallingEdge, ClockCycles, Timer


@cocotb.test()
async def test_all(dut):

    clock = Clock(dut.clk, 10, units="us")
    cocotb.fork(clock.start())
    
    dut.reset = 1

    await ClockCycles(dut.clk, 10)
    dut.reset = 0
    await ClockCycles(dut.clk, 500)
