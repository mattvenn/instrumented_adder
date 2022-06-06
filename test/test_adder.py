import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, FallingEdge, ClockCycles, Timer
from rich.progress import Progress 
import random

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
    dut.s_output_bit_b     = 0xFFFFFFFF
    dut.a_input_ring_bit_b = 0x00000000
    dut.a_input_ext_bit_b  = 0xFFFFFFFF
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
    dut.s_output_bit_b     = 0xFFFFFFFF
    dut.a_input_ring_bit_b = 0x00000000
    dut.a_input_ext_bit_b  = 0xFFFFFFFF
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
    dut.s_output_bit_b     = 0xFFFFFFFE
    dut.a_input_ring_bit_b = 0xFFFFFFFE
    dut.a_input_ext_bit_b  = 0x00000001
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
    dut.s_output_bit_b     = 0xFFFFFFFF
    dut.a_input_ring_bit_b = 0xFFFFFFFF
    dut.a_input_ext_bit_b  = 0xFFFFFFFF

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
    dut.s_output_bit_b     = 0xFFFFFFFF
    dut.a_input_ring_bit_b = 0xFFFFFFFF
    dut.a_input_ext_bit_b  = 0xFFFFFFFF

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

    for test_bit in range(32):
    
        # hold in reset
        dut.reset = 1
        # stop the ring
        dut.stop_b = 0
        # enable extra inverter now adder is in the loop and b input is set to 0
        dut.extra_inverter = 1

        # set b input to be 0
        dut.b_input = 0x00000000

        # disable control loop
        dut.control_b = 1

        # disable bypass loop
        dut.bypass_b = 1

        # enable correct bit of adder, keep external a input disabled
        dut.s_output_bit_b     = 0xFFFFFFFF ^ 1 << test_bit
        dut.a_input_ring_bit_b = 0xFFFFFFFF ^ 1 << test_bit
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
        # hack to handle if its the behavioral adder or one of the 1 cycle adders
        assert(count == 30 or count == 80)

# constrained random
@cocotb.test()
async def test_adder(dut):
    clock = Clock(dut.clk, 100, units="ns")
    cocotb.fork(clock.start())
    dut.reset  = 1
    dut.stop_b = 0
    # control inputs are all inverted
    dut.a_input_ext_bit_b  = 0x00000000
    dut.a_input_ring_bit_b = 0xFFFFFFFF
    dut.s_output_bit_b     = 0x00000000
    await ClockCycles(dut.clk, 2)
    num_tests = 10000
    with Progress() as progress:
        test_progress = progress.add_task("[green]Processing...", total=num_tests)
        for test in range(num_tests):
            a = random.randint(0, 0xFFFFFFF)
            b = random.randint(0, 0xFFFFFFF)
            dut.a_input = a
            dut.b_input = b
            await ClockCycles(dut.clk, 1)
            assert (int(dut.sum_out) == (a+b))
            progress.update(test_progress, advance=1)


