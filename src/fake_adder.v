`default_nettype none
// take a long time to add some numbers
module fake_adder(cout, sum, a, b, cin);

	input [7:0] a, b;
	input cin;
	output [7:0] sum;
	output cout;

    assign #100 sum = a + b;
endmodule
