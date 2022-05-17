import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, FallingEdge, ClockCycles


@cocotb.test()
async def test_all(dut):

    clock = Clock(dut.clk, 10, units="us")
    cocotb.fork(clock.start())
    
    dut.input_a = 0
    dut.xor_enable = 0
    dut.add_enable = 0
    dut.reset = 1

    await ClockCycles(dut.clk, 1)

    dut.reset = 0

    await ClockCycles(dut.clk, 5)
