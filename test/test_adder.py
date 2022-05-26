import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, FallingEdge, ClockCycles, Timer


@cocotb.test()
async def test_bypass(dut):

    clock = Clock(dut.clk, 100, units="ns")
    cocotb.fork(clock.start())
    
    # hold in reset
    dut.reset = 1
    # stop the ring
    dut.stop_b = 0
    # enable extra inverter
    dut.extra_inverter = 0
    # set b input to be 0
    dut.b_input = 0

    # enable bypass loop
    dut.bypass_b = 0

    # disable control loop
    dut.control_b = 1

    # disable adder sum connection and inputs
    dut.s_output_bit_b     = 0b11111111
    dut.a_input_ring_bit_b = 0b11111111
    dut.a_input_ext_bit_b  = 0b11111111

    await ClockCycles(dut.clk, 3)

    # load the integration counter
    dut.integration_time = 100
    dut.counter_load = 1
    dut.reset = 0
    
    await ClockCycles(dut.clk, 1)

    dut.counter_load = 0
    # start the loop
    dut.stop_b = 1
    dut.counter_enable = 1

    await RisingEdge(dut.done)
    count = int(dut.ring_osc_counter_out.value)
    await ClockCycles(dut.clk, 5)
    print("cycles    : %d" % count)


@cocotb.test(skip=True)
async def test_adder(dut):
    dut.reset  = 1
    dut.stop_b = 0
    # control inputs are all inverted
    dut.a_input_ext_bit_b = 0b00000000
    dut.a_input_ring_bit_b = 0b11111111
    dut.s_output_bit_b = 0b00000000
    await ClockCycles(dut.clk, 2)

    for a in range(255):
        for b in range(255):
            dut.a_input = a
            dut.b_input = b
            await ClockCycles(dut.clk, 1)
            assert (int(dut.sum_out) % 256) == ((a+b) % 256)


