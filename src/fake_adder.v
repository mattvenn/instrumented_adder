`default_nettype none

module adder(cout, sum, a, b, cin);

	input [7:0] a, b;
	input cin;
	output [7:0] sum;
	output cout;

    assign #10 sum = a + b;
endmodule
