import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, FallingEdge, ClockCycles, Timer

# for spice
@cocotb.test()
async def test_bypass_minimal(dut):

    clock = Clock(dut.clk, 100, units="ns")
    cocotb.fork(clock.start())
    await ClockCycles(dut.clk, 10)
    dut.reset = 1
    dut.stop_b = 0
    dut.extra_inverter = 1
    dut.a_input = 0
    dut.b_input = 0
    dut.s_output_bit_b     = 0b11111111
    dut.a_input_ring_bit_b = 0b00000000
    dut.a_input_ext_bit_b  = 0b11111111
    dut.control_b = 1
    dut.bypass_b = 0
    await ClockCycles(dut.clk, 2)
    dut.stop_b = 1
    await ClockCycles(dut.clk, 10)

@cocotb.test()
async def test_control_minimal(dut):

    clock = Clock(dut.clk, 100, units="ns")
    cocotb.fork(clock.start())
    dut.reset = 1
    dut.stop_b = 0
    dut.extra_inverter = 1
    dut.a_input = 0
    dut.b_input = 0
    dut.s_output_bit_b     = 0b11111111
    dut.a_input_ring_bit_b = 0b00000000
    dut.a_input_ext_bit_b  = 0b11111111
    dut.control_b = 0
    dut.bypass_b = 1
    await ClockCycles(dut.clk, 2)
    dut.stop_b = 1
    await ClockCycles(dut.clk, 10)

# for spice
@cocotb.test()
async def test_adder_minimal(dut):

    clock = Clock(dut.clk, 100, units="ns")
    cocotb.fork(clock.start())
    dut.reset = 1
    dut.stop_b = 0
    dut.extra_inverter = 1
    dut.a_input = 0
    dut.b_input = 0
    dut.s_output_bit_b     = 0b11111110
    dut.a_input_ring_bit_b = 0b11111110
    dut.a_input_ext_bit_b  = 0b00000001
    dut.control_b = 1
    dut.bypass_b = 1
    await ClockCycles(dut.clk, 2)
    dut.stop_b = 1
    await ClockCycles(dut.clk, 10)


@cocotb.test()
async def test_bypass(dut):

    clock = Clock(dut.clk, 100, units="ns")
    cocotb.fork(clock.start())
    
    # hold in reset
    dut.reset = 1
    # stop the ring
    dut.stop_b = 0
    # enable extra inverter
    dut.extra_inverter = 1
    # set b input to be 0
    dut.b_input = 0

    # disable control loop
    dut.control_b = 1

    # enable bypass loop
    dut.bypass_b = 0

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
    assert count == 80


@cocotb.test()
async def test_control(dut):

    clock = Clock(dut.clk, 100, units="ns")
    cocotb.fork(clock.start())
    
    # hold in reset
    dut.reset = 1
    # stop the ring
    dut.stop_b = 0
    # enable extra inverter
    dut.extra_inverter = 1
    # set b input to be 0
    dut.b_input = 0

    # enable control loop
    dut.control_b = 0

    # disable bypass loop
    dut.bypass_b = 1

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
    assert count == 71

@cocotb.test()
async def test_adder_in_loop(dut):

    clock = Clock(dut.clk, 100, units="ns")
    cocotb.fork(clock.start())
    
    # hold in reset
    dut.reset = 1
    # stop the ring
    dut.stop_b = 0
    # enable extra inverter now adder is in the loop and b input is set to 0
    dut.extra_inverter = 1

    # set b input to be 0
    dut.b_input = 0b00000000

    # disable control loop
    dut.control_b = 1

    # disable bypass loop
    dut.bypass_b = 1

    test_bit = 0
    # enable correct bit of adder, keep external a input disabled
    dut.s_output_bit_b     = 0xff ^ 1 << test_bit
    dut.a_input_ring_bit_b = 0xff ^ 1 << test_bit
    dut.a_input_ext_bit_b  = 1 << test_bit 
    dut.a_input = 0

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
    assert count == 30

@cocotb.test()
async def test_adder(dut):
    clock = Clock(dut.clk, 100, units="ns")
    cocotb.fork(clock.start())
    dut.reset  = 1
    dut.stop_b = 0
    # control inputs are all inverted
    dut.a_input_ext_bit_b  = 0b00000000
    dut.a_input_ring_bit_b = 0b11111111
    dut.s_output_bit_b     = 0b00000000
    await ClockCycles(dut.clk, 2)
    for a in range(0, 255, 10):
        for b in range(0, 255, 10):
            dut.a_input = a
            dut.b_input = b
            await ClockCycles(dut.clk, 1)
            assert (int(dut.sum_out) % 256) == ((a+b) % 256)


