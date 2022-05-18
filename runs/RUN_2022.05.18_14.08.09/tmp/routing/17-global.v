module instrumented_adder (chain,
    clk,
    reset,
    vccd1,
    vssd1,
    outputs);
 output chain;
 input clk;
 input reset;
 input vccd1;
 input vssd1;
 output [3:0] outputs;

 wire _00_;
 wire _01_;
 wire _02_;
 wire _03_;
 wire _04_;
 wire _05_;
 wire _06_;
 wire _07_;
 wire _08_;
 wire _09_;
 wire _10_;
 wire _11_;
 wire \buffers_in[0] ;
 wire \buffers_in[1] ;
 wire \buffers_in[2] ;
 wire \buffers_in[3] ;
 wire \buffers_in[4] ;
 wire \buffers_in[5] ;
 wire \buffers_in[6] ;
 wire \buffers_in[7] ;
 wire \buffers_in[8] ;
 wire \buffers_in[9] ;
 wire clknet_0_clk;
 wire clknet_1_0_0_clk;
 wire clknet_1_1_0_clk;
 wire net1;

 sky130_fd_sc_hd__decap_4 FILLER_0_13 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_4 FILLER_0_23 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__fill_1 FILLER_0_27 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_6 FILLER_0_3 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_12 FILLER_0_32 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_12 FILLER_0_44 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_12 FILLER_0_57 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_4 FILLER_0_69 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_4 FILLER_0_77 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_4 FILLER_1_22 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__fill_2 FILLER_1_3 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_8 FILLER_1_45 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_3 FILLER_1_53 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_12 FILLER_1_57 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_12 FILLER_1_69 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_4 FILLER_2_10 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_4 FILLER_2_24 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_3 FILLER_2_3 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_12 FILLER_2_39 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_12 FILLER_2_51 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_12 FILLER_2_63 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_6 FILLER_2_75 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_4 FILLER_3_28 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_6 FILLER_3_3 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_4 FILLER_3_52 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_4 FILLER_3_57 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_12 FILLER_3_65 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_4 FILLER_3_77 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_4 FILLER_4_13 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_4 FILLER_4_24 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_6 FILLER_4_3 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_4 FILLER_4_37 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__fill_1 FILLER_4_41 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_4 FILLER_4_45 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_12 FILLER_4_66 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_3 FILLER_4_78 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__fill_1 FILLER_4_9 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__fill_1 FILLER_5_15 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_8 FILLER_5_20 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__fill_2 FILLER_5_28 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_12 FILLER_5_3 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_4 FILLER_5_37 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_8 FILLER_5_47 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__fill_1 FILLER_5_55 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_4 FILLER_5_57 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_4 FILLER_5_64 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_8 FILLER_5_71 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__fill_2 FILLER_5_79 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_12 FILLER_6_15 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__fill_1 FILLER_6_27 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_12 FILLER_6_29 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_12 FILLER_6_3 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_12 FILLER_6_41 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_6 FILLER_6_53 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__fill_1 FILLER_6_59 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_4 FILLER_6_63 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_4 FILLER_6_70 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_4 FILLER_6_77 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_12 FILLER_7_15 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_12 FILLER_7_27 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_12 FILLER_7_3 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_8 FILLER_7_39 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__fill_2 FILLER_7_47 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_4 FILLER_7_52 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_4 FILLER_7_57 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_4 FILLER_7_64 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_8 FILLER_7_71 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__fill_2 FILLER_7_79 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_12 FILLER_8_15 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__fill_1 FILLER_8_27 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_12 FILLER_8_29 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_12 FILLER_8_3 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_12 FILLER_8_41 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_8 FILLER_8_53 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_4 FILLER_8_64 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_8 FILLER_8_71 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__fill_2 FILLER_8_79 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_12 FILLER_9_15 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__fill_1 FILLER_9_27 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_12 FILLER_9_29 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_12 FILLER_9_3 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_12 FILLER_9_41 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_3 FILLER_9_53 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_8 FILLER_9_57 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_3 FILLER_9_65 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_8 FILLER_9_71 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__fill_2 FILLER_9_79 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_3 PHY_0 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_3 PHY_1 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_3 PHY_10 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_3 PHY_11 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_3 PHY_12 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_3 PHY_13 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_3 PHY_14 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_3 PHY_15 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_3 PHY_16 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_3 PHY_17 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_3 PHY_18 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_3 PHY_19 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_3 PHY_2 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_3 PHY_3 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_3 PHY_4 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_3 PHY_5 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_3 PHY_6 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_3 PHY_7 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_3 PHY_8 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__decap_3 PHY_9 (.VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_20 (.VGND(vssd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_21 (.VGND(vssd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_22 (.VGND(vssd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_23 (.VGND(vssd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_24 (.VGND(vssd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_25 (.VGND(vssd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_26 (.VGND(vssd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_27 (.VGND(vssd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_28 (.VGND(vssd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_29 (.VGND(vssd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_30 (.VGND(vssd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_31 (.VGND(vssd1),
    .VPWR(vccd1));
 sky130_fd_sc_hd__nor2_1 _12_ (.A(net1),
    .B(chain),
    .VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1),
    .Y(\buffers_in[0] ));
 sky130_fd_sc_hd__dlymetal6s2s_1 _13_ (.A(outputs[0]),
    .VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1),
    .X(_04_));
 sky130_fd_sc_hd__nor2_1 _14_ (.A(net1),
    .B(_04_),
    .VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1),
    .Y(_00_));
 sky130_fd_sc_hd__dlymetal6s2s_1 _15_ (.A(outputs[1]),
    .VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1),
    .X(_05_));
 sky130_fd_sc_hd__a21oi_1 _16_ (.A1(_04_),
    .A2(_05_),
    .B1(net1),
    .VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1),
    .Y(_06_));
 sky130_fd_sc_hd__o21a_1 _17_ (.A1(_04_),
    .A2(_05_),
    .B1(_06_),
    .VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1),
    .X(_01_));
 sky130_fd_sc_hd__a21oi_1 _18_ (.A1(_04_),
    .A2(_05_),
    .B1(outputs[2]),
    .VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1),
    .Y(_07_));
 sky130_fd_sc_hd__a31o_1 _19_ (.A1(_04_),
    .A2(_05_),
    .A3(outputs[2]),
    .B1(net1),
    .VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1),
    .X(_08_));
 sky130_fd_sc_hd__nor2_1 _20_ (.A(_07_),
    .B(_08_),
    .VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1),
    .Y(_02_));
 sky130_fd_sc_hd__a41o_1 _21_ (.A1(outputs[0]),
    .A2(outputs[1]),
    .A3(outputs[2]),
    .A4(outputs[3]),
    .B1(net1),
    .VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1),
    .X(_09_));
 sky130_fd_sc_hd__a31o_1 _22_ (.A1(outputs[0]),
    .A2(_05_),
    .A3(outputs[2]),
    .B1(outputs[3]),
    .VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1),
    .X(_10_));
 sky130_fd_sc_hd__and2b_1 _23_ (.A_N(_09_),
    .B(_10_),
    .VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1),
    .X(_11_));
 sky130_fd_sc_hd__clkbuf_1 _24_ (.A(_11_),
    .VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1),
    .X(_03_));
 sky130_fd_sc_hd__dfxtp_4 _25_ (.CLK(clknet_1_1_0_clk),
    .D(_00_),
    .VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1),
    .Q(outputs[0]));
 sky130_fd_sc_hd__dfxtp_2 _26_ (.CLK(clknet_1_0_0_clk),
    .D(_01_),
    .VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1),
    .Q(outputs[1]));
 sky130_fd_sc_hd__dfxtp_4 _27_ (.CLK(clknet_1_0_0_clk),
    .D(_02_),
    .VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1),
    .Q(outputs[2]));
 sky130_fd_sc_hd__dfxtp_2 _28_ (.CLK(clknet_1_1_0_clk),
    .D(_03_),
    .VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1),
    .Q(outputs[3]));
 sky130_fd_sc_hd__inv_2 \buffers[0]  (.A(\buffers_in[0] ),
    .VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1),
    .Y(\buffers_in[1] ));
 sky130_fd_sc_hd__inv_2 \buffers[1]  (.A(\buffers_in[1] ),
    .VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1),
    .Y(\buffers_in[2] ));
 sky130_fd_sc_hd__inv_2 \buffers[2]  (.A(\buffers_in[2] ),
    .VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1),
    .Y(\buffers_in[3] ));
 sky130_fd_sc_hd__inv_2 \buffers[3]  (.A(\buffers_in[3] ),
    .VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1),
    .Y(\buffers_in[4] ));
 sky130_fd_sc_hd__inv_2 \buffers[4]  (.A(\buffers_in[4] ),
    .VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1),
    .Y(\buffers_in[5] ));
 sky130_fd_sc_hd__inv_2 \buffers[5]  (.A(\buffers_in[5] ),
    .VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1),
    .Y(\buffers_in[6] ));
 sky130_fd_sc_hd__inv_2 \buffers[6]  (.A(\buffers_in[6] ),
    .VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1),
    .Y(\buffers_in[7] ));
 sky130_fd_sc_hd__inv_2 \buffers[7]  (.A(\buffers_in[7] ),
    .VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1),
    .Y(\buffers_in[8] ));
 sky130_fd_sc_hd__inv_2 \buffers[8]  (.A(\buffers_in[8] ),
    .VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1),
    .Y(\buffers_in[9] ));
 sky130_fd_sc_hd__inv_2 \buffers[9]  (.A(\buffers_in[9] ),
    .VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1),
    .Y(chain));
 sky130_fd_sc_hd__clkbuf_16 clkbuf_0_clk (.A(clk),
    .VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1),
    .X(clknet_0_clk));
 sky130_fd_sc_hd__clkbuf_2 clkbuf_1_0_0_clk (.A(clknet_0_clk),
    .VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1),
    .X(clknet_1_0_0_clk));
 sky130_fd_sc_hd__clkbuf_2 clkbuf_1_1_0_clk (.A(clknet_0_clk),
    .VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1),
    .X(clknet_1_1_0_clk));
 sky130_fd_sc_hd__clkbuf_2 input1 (.A(reset),
    .VGND(vssd1),
    .VNB(vssd1),
    .VPB(vccd1),
    .VPWR(vccd1),
    .X(net1));
endmodule
