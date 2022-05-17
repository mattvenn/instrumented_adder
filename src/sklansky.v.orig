module adder(cout, sum, a, b, cin);

	input [7:0] a, b;
	input cin;
	output [7:0] sum;
	output cout;

	wire g1, g0, p1, g3, p_lsb, p3, p2, p5, g6, p0, g4, g2, p4, p6, g_lsb, g5;
	wire n24, n25, n26, n27, n28, n30, n31, n33, n34, n35, n36, n37, n38, n41, n42, n45, n46, n47, n48, n49, n50, n51, n52, n54, n55, n57, n58, n60, n61, n63, n65, n67, n69, n71, n72, n73, n74;

// start of pre-processing logic

	ppa_first_pre ppa_first_pre_0_0 ( .cin( {cin} ), .pout( {p_lsb} ), .gout( {g_lsb} ) );
	ppa_pre ppa_pre_1_0 ( .a_in( {a[0]} ), .b_in( {b[0]} ), .pout( {p0} ), .gout( {g0} ) );
	ppa_pre ppa_pre_2_0 ( .a_in( {a[1]} ), .b_in( {b[1]} ), .pout( {p1} ), .gout( {g1} ) );
	ppa_pre ppa_pre_3_0 ( .a_in( {a[2]} ), .b_in( {b[2]} ), .pout( {p2} ), .gout( {g2} ) );
	ppa_pre ppa_pre_4_0 ( .a_in( {a[3]} ), .b_in( {b[3]} ), .pout( {p3} ), .gout( {g3} ) );
	ppa_pre ppa_pre_5_0 ( .a_in( {a[4]} ), .b_in( {b[4]} ), .pout( {p4} ), .gout( {g4} ) );
	ppa_pre ppa_pre_6_0 ( .a_in( {a[5]} ), .b_in( {b[5]} ), .pout( {p5} ), .gout( {g5} ) );
	ppa_pre ppa_pre_7_0 ( .a_in( {a[6]} ), .b_in( {b[6]} ), .pout( {p6} ), .gout( {g6} ) );

// start of post-processing logic

	ppa_post ppa_post_0_4 ( .gin( {n63} ), .pin( {p0} ), .sum( {sum[0]} ) );
	ppa_post ppa_post_1_4 ( .gin( {n65} ), .pin( {p1} ), .sum( {sum[1]} ) );
	ppa_post ppa_post_2_4 ( .gin( {n67} ), .pin( {p2} ), .sum( {sum[2]} ) );
	ppa_post ppa_post_3_4 ( .gin( {n69} ), .pin( {p3} ), .sum( {sum[3]} ) );
	ppa_post ppa_post_4_4 ( .gin( {n71} ), .pin( {p4} ), .sum( {sum[4]} ) );
	ppa_post ppa_post_5_4 ( .gin( {n72} ), .pin( {p5} ), .sum( {sum[5]} ) );
	ppa_post ppa_post_6_4 ( .gin( {n73} ), .pin( {p6} ), .sum( {sum[6]} ) );
	ppa_post ppa_post_7_4 ( .gin( {n74} ), .pin( {p7} ), .sum( {sum[7]} ) );

// start of custom pre/post logic

	ppa_pre ppa_pre_cout ( .a_in( a[7] ), .b_in( b[7] ), .pout ( p7 ), .gout ( g7 ) );
	ppa_grey ppa_grey_cout ( .gin ( {g7,n74} ), .pin ( p7 ), .gout ( cout ) );

// start of tree row 1

	assign n25 = p_lsb;
	assign n24 = g_lsb;
	ppa_grey ppa_grey_1_1 ( .gin( {g0,g_lsb} ), .pin( {p0} ), .gout( {n26} ) );
	assign n28 = p1;
	assign n27 = g1;
	ppa_black ppa_black_3_1 ( .gin( {g2,g1} ), .pin( {p2,p1} ), .gout( {n30} ), .pout( {n31} ) );
	assign n34 = p3;
	assign n33 = g3;
	ppa_black ppa_black_5_1 ( .gin( {g4,g3} ), .pin( {p4,p3} ), .gout( {n35} ), .pout( {n36} ) );
	assign n38 = p5;
	assign n37 = g5;
	ppa_black ppa_black_7_1 ( .gin( {g6,g5} ), .pin( {p6,p5} ), .gout( {n41} ), .pout( {n42} ) );

// start of tree row 2

	assign n46 = n25;
	assign n45 = n24;
	assign n48 = n0;
	assign n47 = n26;
	ppa_grey ppa_grey_2_2 ( .gin( {n27,n26} ), .pin( {n28} ), .gout( {n49} ) );
	ppa_grey ppa_grey_3_2 ( .gin( {n30,n26} ), .pin( {n31} ), .gout( {n50} ) );
	assign n52 = n34;
	assign n51 = n33;
	assign n55 = n36;
	assign n54 = n35;
	ppa_black ppa_black_6_2 ( .gin( {n37,n35} ), .pin( {n38,n36} ), .gout( {n57} ), .pout( {n58} ) );
	ppa_black ppa_black_7_2 ( .gin( {n41,n35} ), .pin( {n42,n36} ), .gout( {n60} ), .pout( {n61} ) );

// start of tree row 3

	assign n64 = n46;
	assign n63 = n45;
	assign n66 = n48;
	assign n65 = n47;
	assign n68 = n0;
	assign n67 = n49;
	assign n70 = n0;
	assign n69 = n50;
	ppa_grey ppa_grey_4_3 ( .gin( {n51,n50} ), .pin( {n52} ), .gout( {n71} ) );
	ppa_grey ppa_grey_5_3 ( .gin( {n54,n50} ), .pin( {n55} ), .gout( {n72} ) );
	ppa_grey ppa_grey_6_3 ( .gin( {n57,n50} ), .pin( {n58} ), .gout( {n73} ) );
	ppa_grey ppa_grey_7_3 ( .gin( {n60,n50} ), .pin( {n61} ), .gout( {n74} ) );

endmodule

module ppa_pre(a_in, b_in, pout, gout);

	input a_in, b_in;
	output pout, gout;

	xor2 U1(pout,a_in,b_in);
	and2 U2(gout,a_in,b_in);

endmodule

module ppa_post(pin, gin, sum);

	input pin, gin;
	output sum;

	xor2 U1(sum,pin,gin);

endmodule

module ppa_grey(gin, pin, gout);

	input[1:0] gin;
	input pin;
	output gout;

	ao21 U1(gout,gin[0],pin,gin[1]);

endmodule

module ppa_first_pre(cin, pout, gout);

	input cin;
	output pout, gout;

	assign pout=1'b0;
	assign gout=cin;

endmodule

module ppa_black(gin, pin, gout, pout);

	input [1:0] gin, pin;
	output gout, pout;

	and2 U1(pout,pin[1],pin[0]);
	ao21 U2(gout,gin[0],pin[1],gin[1]);

endmodule
