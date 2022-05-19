`default_nettype none
`timescale 1ns/1ns

module instrumented_adder(

    input wire clk,
    input wire reset,
    output wire chain,
    output wire [3:0] outputs

);
    `ifdef COCOTB_SIM
    initial begin
        $dumpfile ("instrumented_adder.vcd");
        $dumpvars (0, instrumented_adder);
        #1;
    end
    `endif

    localparam NUM_INVERTERS = 200;

    reg [3:0] counter;
    assign chain = chain_out;
    assign outputs = counter;

    // counter, does nothing atm
    always @(posedge clk) begin
        if(reset)
            counter <= 0;
        else
            counter <= counter + 1'b1;
    end

    // setup loop of inverters
    // http://svn.clairexen.net/handicraft/2015/ringosc/ringosc.v
    wire chain_in, chain_out;
    wire [NUM_INVERTERS-1:0] buffers_in, buffers_out;
    assign buffers_in = {buffers_out[NUM_INVERTERS-2:0], chain_in};
    assign chain_out = buffers_out[NUM_INVERTERS-1];
    assign chain_in = reset ? 0: !chain_out;

    // instantiate the inverters
    inv_with_delay buffers [NUM_INVERTERS-1:0] (
        .A(buffers_in),
        .Y(buffers_out)
    );

endmodule

// do this so can use iverilog to check digital
module inv_with_delay(input A, output Y);
    wire Y;
    `ifdef COCOTB_SIM
    assign #1 Y = ~A;
    `else
    sky130_fd_sc_hd__inv_2 _0_ ( .A(A), .X(Y));
    `endif
endmodule
