import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, FallingEdge, ClockCycles, Timer


@cocotb.test()
async def test_all(dut):

    dut.vssd1 <= 0
    dut.vccd1 <= 1
    dut.active <= 1

    clock = Clock(dut.wb_clk_i, 10, units="us")
    cocotb.fork(clock.start())
    
#    dut.input_a = 0
#    dut.xor_enable = 0
#    dut.add_enable = 0
    dut.wb_rst_i = 1

    await ClockCycles(dut.wb_clk_i, 10)
#    dut.wb_rst_i = 0
    await ClockCycles(dut.wb_clk_i, 500)
