
module sklansky(

	input [7:0] a_in,
	input [7:0] b_in,
	output [7:0] sum
	);

// adder_forest tree_7
	wire n29_tree_7, n30_tree_7, n31_tree_7, n32_tree_7, n33_tree_7, n34_tree_7, n35_tree_7, n36_tree_7, n37_tree_7, n38_tree_7, n39_tree_7, n40_tree_7, n41_tree_7, n42_tree_7, n43_tree_7, n44_tree_7, n45_tree_7, n46_tree_7, n47_tree_7, n48_tree_7, n49_tree_7, n50_tree_7, n51_tree_7;
    assign sum[7] = n30_tree_7^n29_tree_7;
    assign n29_tree_7 = a_in[7]^b_in[7];
    assign n30_tree_7 = (n41_tree_7&n32_tree_7)|n31_tree_7;
    assign n32_tree_7 = n34_tree_7&n36_tree_7;

    assign n31_tree_7 = (n35_tree_7&n34_tree_7)|n33_tree_7;
    assign n34_tree_7 = a_in[6]|b_in[6];

    assign n33_tree_7 = a_in[6]&b_in[6];
    assign n36_tree_7 = n38_tree_7&n40_tree_7;

    assign n35_tree_7 = (n39_tree_7&n38_tree_7)|n37_tree_7;
    assign n38_tree_7 = a_in[5]|b_in[5];

    assign n37_tree_7 = a_in[5]&b_in[5];
    assign n40_tree_7 = a_in[4]|b_in[4];

    assign n39_tree_7 = a_in[4]&b_in[4];
    assign n41_tree_7 = (n48_tree_7&n43_tree_7)|n42_tree_7;
    assign n43_tree_7 = n45_tree_7&n47_tree_7;

    assign n42_tree_7 = (n46_tree_7&n45_tree_7)|n44_tree_7;
    assign n45_tree_7 = a_in[3]|b_in[3];

    assign n44_tree_7 = a_in[3]&b_in[3];
    assign n47_tree_7 = a_in[2]|b_in[2];

    assign n46_tree_7 = a_in[2]&b_in[2];
    assign n48_tree_7 = (n51_tree_7&n50_tree_7)|n49_tree_7;
    assign n50_tree_7 = a_in[1]|b_in[1];

    assign n49_tree_7 = a_in[1]&b_in[1];
    assign n51_tree_7 = a_in[0]&b_in[0];

// adder_forest tree_6
	wire n25_tree_6, n26_tree_6, n27_tree_6, n28_tree_6, n29_tree_6, n30_tree_6, n31_tree_6, n32_tree_6, n33_tree_6, n34_tree_6, n35_tree_6, n36_tree_6, n37_tree_6, n38_tree_6, n39_tree_6, n40_tree_6, n41_tree_6, n42_tree_6, n43_tree_6;
    assign sum[6] = n26_tree_6^n25_tree_6;
    assign n25_tree_6 = a_in[6]^b_in[6];
    assign n26_tree_6 = (n33_tree_6&n28_tree_6)|n27_tree_6;
    assign n28_tree_6 = n30_tree_6&n32_tree_6;

    assign n27_tree_6 = (n31_tree_6&n30_tree_6)|n29_tree_6;
    assign n30_tree_6 = a_in[5]|b_in[5];

    assign n29_tree_6 = a_in[5]&b_in[5];
    assign n32_tree_6 = a_in[4]|b_in[4];

    assign n31_tree_6 = a_in[4]&b_in[4];
    assign n33_tree_6 = (n40_tree_6&n35_tree_6)|n34_tree_6;
    assign n35_tree_6 = n37_tree_6&n39_tree_6;

    assign n34_tree_6 = (n38_tree_6&n37_tree_6)|n36_tree_6;
    assign n37_tree_6 = a_in[3]|b_in[3];

    assign n36_tree_6 = a_in[3]&b_in[3];
    assign n39_tree_6 = a_in[2]|b_in[2];

    assign n38_tree_6 = a_in[2]&b_in[2];
    assign n40_tree_6 = (n43_tree_6&n42_tree_6)|n41_tree_6;
    assign n42_tree_6 = a_in[1]|b_in[1];

    assign n41_tree_6 = a_in[1]&b_in[1];
    assign n43_tree_6 = a_in[0]&b_in[0];

// adder_forest tree_5
	wire n20_tree_5, n21_tree_5, n22_tree_5, n23_tree_5, n24_tree_5, n25_tree_5, n26_tree_5, n27_tree_5, n28_tree_5, n29_tree_5, n30_tree_5, n31_tree_5, n32_tree_5, n33_tree_5, n34_tree_5;
    assign sum[5] = n21_tree_5^n20_tree_5;
    assign n20_tree_5 = a_in[5]^b_in[5];
    assign n21_tree_5 = (n24_tree_5&n23_tree_5)|n22_tree_5;
    assign n23_tree_5 = a_in[4]|b_in[4];

    assign n22_tree_5 = a_in[4]&b_in[4];
    assign n24_tree_5 = (n31_tree_5&n26_tree_5)|n25_tree_5;
    assign n26_tree_5 = n28_tree_5&n30_tree_5;

    assign n25_tree_5 = (n29_tree_5&n28_tree_5)|n27_tree_5;
    assign n28_tree_5 = a_in[3]|b_in[3];

    assign n27_tree_5 = a_in[3]&b_in[3];
    assign n30_tree_5 = a_in[2]|b_in[2];

    assign n29_tree_5 = a_in[2]&b_in[2];
    assign n31_tree_5 = (n34_tree_5&n33_tree_5)|n32_tree_5;
    assign n33_tree_5 = a_in[1]|b_in[1];

    assign n32_tree_5 = a_in[1]&b_in[1];
    assign n34_tree_5 = a_in[0]&b_in[0];

// adder_forest tree_4
	wire n17_tree_4, n18_tree_4, n19_tree_4, n20_tree_4, n21_tree_4, n22_tree_4, n23_tree_4, n24_tree_4, n25_tree_4, n26_tree_4, n27_tree_4, n28_tree_4;
    assign sum[4] = n18_tree_4^n17_tree_4;
    assign n17_tree_4 = a_in[4]^b_in[4];
    assign n18_tree_4 = (n25_tree_4&n20_tree_4)|n19_tree_4;
    assign n20_tree_4 = n22_tree_4&n24_tree_4;

    assign n19_tree_4 = (n23_tree_4&n22_tree_4)|n21_tree_4;
    assign n22_tree_4 = a_in[3]|b_in[3];

    assign n21_tree_4 = a_in[3]&b_in[3];
    assign n24_tree_4 = a_in[2]|b_in[2];

    assign n23_tree_4 = a_in[2]&b_in[2];
    assign n25_tree_4 = (n28_tree_4&n27_tree_4)|n26_tree_4;
    assign n27_tree_4 = a_in[1]|b_in[1];

    assign n26_tree_4 = a_in[1]&b_in[1];
    assign n28_tree_4 = a_in[0]&b_in[0];

// adder_forest tree_3
	wire n12_tree_3, n13_tree_3, n14_tree_3, n15_tree_3, n16_tree_3, n17_tree_3, n18_tree_3, n19_tree_3;
    assign sum[3] = n13_tree_3^n12_tree_3;
    assign n12_tree_3 = a_in[3]^b_in[3];
    assign n13_tree_3 = (n16_tree_3&n15_tree_3)|n14_tree_3;
    assign n15_tree_3 = a_in[2]|b_in[2];

    assign n14_tree_3 = a_in[2]&b_in[2];
    assign n16_tree_3 = (n19_tree_3&n18_tree_3)|n17_tree_3;
    assign n18_tree_3 = a_in[1]|b_in[1];

    assign n17_tree_3 = a_in[1]&b_in[1];
    assign n19_tree_3 = a_in[0]&b_in[0];

// adder_forest tree_2
	wire n8_tree_2, n9_tree_2, n10_tree_2, n11_tree_2, n12_tree_2;
    assign sum[2] = n9_tree_2^n8_tree_2;
    assign n8_tree_2 = a_in[2]^b_in[2];
    assign n9_tree_2 = (n12_tree_2&n11_tree_2)|n10_tree_2;
    assign n11_tree_2 = a_in[1]|b_in[1];

    assign n10_tree_2 = a_in[1]&b_in[1];
    assign n12_tree_2 = a_in[0]&b_in[0];

// adder_forest tree_1
	wire n4_tree_1, n5_tree_1;
    assign sum[1] = n5_tree_1^n4_tree_1;
    assign n4_tree_1 = a_in[1]^b_in[1];
    assign n5_tree_1 = a_in[0]&b_in[0];

// adder_forest tree_0
	wire n3_tree_0;
	assign sum[0] = n3_tree_0;
    assign n3_tree_0 = a_in[0]^b_in[0];

endmodule // sklansky
