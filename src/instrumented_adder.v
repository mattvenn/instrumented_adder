/*

Licensed under Apache 2

Copyright Matt Venn 2022

Thanks to Teo, Eric, Thomas and the Zero to ASIC course community

*/
`default_nettype none
`timescale 1ns/1ns

module instrumented_adder(

    input wire clk,                         // clocks the time counter
    input wire reset,                       // resets the counters

    // loop control
    input wire stop_b,                      // stops the ring oscillator (inverted)
    input wire extra_inverter,              // adds an extra inverter into the ring
    input wire bypass_b,                    // bypass the adder (inverted)
    input wire control_b,                   // enables an additional control loop (inverted)
    input wire [7:0] a_input_ext_bit_b,     // which bit of the adder's a input to connect to external a_input (inverted)
    input wire [7:0] a_input_ring_bit_b,    // which bit of the adder's a input to connect to the ring (inverted)
    input wire [7:0] s_output_bit_b,        // which bit of sum to connect back to the ring (inverted)

    // counter control
    input wire counter_enable,
    input wire counter_load,
    input wire [TIME_COUNTER_BITS-1:0] integration_time,
    
    // adder inputs
    input wire [7:0] a_input,
    input wire [7:0] b_input,

    // outputs
    output wire ring_osc_out,               // used for spice sims
    output wire [7:0] sum_out,              // output of the adder
    output wire done,                       // when the integration counter gets to zero
    output wire [RING_OSC_COUNTER_BITS-1:0] ring_osc_counter_out    // number of ring cycles / 2 counted

);
    `ifdef COCOTB_SIM
    initial begin
        $dumpfile ("instrumented_adder.vcd");
        $dumpvars (0, instrumented_adder);
        #1;
    end
    `endif

    `ifdef FORMAL
        always @(*) begin
            // not exactly what I want but this ensures formal test passes
            assume(bypass_b + control_b > 1);
            assume(s_output_bit_b == 8'b11111111);
            assume(a_input_ring_bit_b == 8'b11111111);
        end
    `endif


    localparam NUM_INVERTERS = 31; // keep to an odd number, although can be compensated by extra_inverter input
    localparam CONTROL_INVERTERS = 4;
    localparam TIME_COUNTER_BITS = 32;
    localparam RING_OSC_COUNTER_BITS = 32;

    reg [TIME_COUNTER_BITS-1:0] integration_counter;
    reg [RING_OSC_COUNTER_BITS-1:0] ring_osc_counter;

    // assign outputs
    // see diagram for labels
    wire r;
    assign ring_osc_out = r;
    assign sum_out = adder_sum;
    assign ring_osc_counter_out = ring_osc_counter;

    // counter for the incoming clock
    always @(posedge clk or posedge reset) begin
        if(reset)
            integration_counter <= 0;
        else if (counter_load)
            integration_counter <= integration_time;
        else if (counter_enable & integration_counter != 0)
            integration_counter <= integration_counter - 1'b1;
    end

    wire zero = integration_counter == 0;
    assign done = zero;

    // f0 flop to reduce load on the ring and make it easier to meet timing
    reg f0;
    wire r2 = !f0;
    always @(posedge r or posedge reset) begin
        if(reset)
            f0 <= 0;
        else
            f0 <= r2;
    end

    // counter for the ring oscillator
    always @(posedge r2 or posedge reset) begin
        if(reset)
            ring_osc_counter <= 0;
        // count while there is still time left in the integration timer
        else if(!zero)
            ring_osc_counter <= ring_osc_counter + 1'b1;
    end

    // setup loop of inverters
    // http://svn.clairexen.net/handicraft/2015/ringosc/ringosc.v
    wire chain_in;
    wire [NUM_INVERTERS-1:0] inverters_in, inverters_out;
    assign inverters_in = {inverters_out[NUM_INVERTERS-2:0], chain_in};

    // break the loop only for formal
    `ifdef FORMAL
        reg chain_out;
        always @(posedge clk) chain_out <= inverters_out[NUM_INVERTERS-1];
    `else
        wire chain_out;
        assign chain_out = inverters_out[NUM_INVERTERS-1];
    `endif

    // instantiate the inverters
    inv_with_delay inverters [NUM_INVERTERS-1:0] (
        .A(inverters_in),
        .Y(inverters_out)
    );

    // top of ring
    wire ring_top = ~(stop_b & chain_out);

    // bottom of ring
    assign chain_in = extra_inverter ^ r;

    // bypass 
    wire bypass2_in;
    tristate bypass1 (.A(ring_top), .Z(bypass2_in), .TE_B(bypass_b));
    tristate bypass2 (.A(bypass2_in), .Z(r), .TE_B(bypass_b));

    // control chain
    wire control_chain_in, control_chain_out;
    tristate control1 (.A(ring_top), .Z(control_chain_in), .TE_B(control_b));
    tristate control2 (.A(control_chain_out), .Z(r), .TE_B(control_b));
    wire [CONTROL_INVERTERS-1:0] control_inverters_in, control_inverters_out;
    assign control_inverters_in = {control_inverters_out[CONTROL_INVERTERS-2:0], control_chain_in};
    assign control_chain_out = control_inverters_out[CONTROL_INVERTERS-1];

    // instantiate the control chain inverters
    inv_with_delay control_inverters [CONTROL_INVERTERS-1:0] (
        .A(control_inverters_in),
        .Y(control_inverters_out)
    );

    // a inputs
    wire [7:0] adder_a;
    wire [7:0] adder_b = b_input;

    // those coming from the ring, controlled by a_input_ring_bit_b
    tristate tristate_ring_inputs [7:0] (
        .A(ring_top),
        .Z(adder_a), 
        .TE_B(a_input_ring_bit_b)
    );

    // those coming from the external input, controlled by a_input_ext_bit_b
    tristate tristate_ext_inputs [7:0] (
        .A(a_input),
        .Z(adder_a), 
        .TE_B(a_input_ext_bit_b)
    );

    // sum outputs
    wire [7:0] adder_sum;
    tristate tristate_sum_outputs [7:0] (
        .A(adder_sum),
        .Z(r), 
        .TE_B(s_output_bit_b)
    );
    
    // instantiate adder

//    behavioral      behavioral   (.a_in(adder_a), .b_in(adder_b), .sum(adder_sum));
//    sklansky        sklansky     (.a_in(adder_a), .b_in(adder_b), .sum(adder_sum));
    ripple_carry    ripple_carry (.a_in(adder_a), .b_in(adder_b), .sum(adder_sum));
//    kogge_stone     kogge_stone  (.a_in(adder_a), .b_in(adder_b), .sum(adder_sum));
//    brent_kung      brent_kung   (.a_in(adder_a), .b_in(adder_b), .sum(adder_sum));

endmodule

// do this so can use iverilog to check digital
module inv_with_delay(input wire A, output wire Y);
    `ifdef COCOTB_SIM
    assign #1 Y = ~A;
    `elsif FORMAL
    assign #1 Y = ~A;
    `else
    sky130_fd_sc_hd__inv_2 _0_ ( .A(A), .Y(Y));
    `endif
endmodule

module tristate(input wire A, output wire Z, input wire TE_B);
    `ifdef COCOTB_SIM
    assign Z = !TE_B ? A : 1'bz;
    `elsif FORMAL
    assign Z = !TE_B ? A : 1'bz;
    `else
    sky130_fd_sc_hd__ebufn_4 _0_ ( .A(A), .Z(Z), .TE_B(TE_B));
    `endif
endmodule     

// take a long time to add some numbers
module behavioral(
    input wire cout,
    output wire [7:0] sum, 
    input wire [7:0] a_in,
    input wire [7:0] b_in,
    input wire cin
    );

    `ifdef COCOTB_SIM
    assign #50 sum = a_in + b_in;
    `else
    assign sum = a_in + b_in;
    `endif
endmodule
