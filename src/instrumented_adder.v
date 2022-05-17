`default_nettype none
`timescale 1ns/1ns
module instrumented_adder(

    input wire clk,
    input wire reset,
    input wire [7:0] input_a,
    input wire [7:0] xor_enable,
    input wire [7:0] add_enable,
    output wire [7:0] outputs

);

    initial begin
        $dumpfile ("instrumented_adder.vcd");
        $dumpvars (0, instrumented_adder);
        #1;
    end

    wire [7:0] input_b;
    wire [7:0] sum_output;

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
    
endmodule
