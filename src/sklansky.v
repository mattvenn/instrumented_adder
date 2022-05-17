module adder(cout, sum, a, b, cin);

	input [7:0] a, b;
	input cin;
	output [7:0] sum;
	output cout;

    assign sum = a + b;

endmodule;
