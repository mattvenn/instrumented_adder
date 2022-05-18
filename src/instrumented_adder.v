`default_nettype none
`timescale 1ns/1ns

module instrumented_adder(

    input wire clk,
    input wire reset,
//    input wire [7:0] input_a,
//    input wire [7:0] xor_enable,
 //   input wire [7:0] add_enable,
    output wire chain,
    output wire [7:0] outputs

);

    assign chain = chain_out;
 //   assign outputs[0] = chain_out;
    assign outputs = counter;
    initial begin
        $dumpfile ("instrumented_adder.vcd");
        $dumpvars (0, instrumented_adder);
        #1;
    end

    reg [7:0] counter;

    always @(posedge clk) begin
        if(reset)
            counter <= 0;
        else
            counter <= counter + 1'b1;
    end

    localparam NUM_INVERTERS = 10;
// http://svn.clairexen.net/handicraft/2015/ringosc/ringosc.v
    wire chain_in, chain_out;
    wire [NUM_INVERTERS-1:0] buffers_in, buffers_out;
    assign buffers_in = {buffers_out[NUM_INVERTERS-2:0], chain_in};
    assign chain_out = buffers_out[NUM_INVERTERS-1];
    assign chain_in = reset ? 0: !chain_out;


  sky130_fd_sc_hd__inv_2 buffers [NUM_INVERTERS-1:0] (
    .A(buffers_in),
    .Y(buffers_out)
  );

    wire [7:0] input_b;
    wire [7:0] sum_output;

    /*
    adder sklansky (
        .a(input_a),
        .b(input_b),
        .sum(sum_output)
        );

    
    wire [7:0] mux_input_a = inverter_loop;
    wire [7:0] mux_output = add_enable ? sum_output : inverter_loop;
    wire [7:0] inverter_loop;

    assign inverter_loop = reset ? 0 : !outputs;
    assign outputs = mux_output ^ xor_enable;
    assign input_b = inverter_loop;
    */
    
endmodule
