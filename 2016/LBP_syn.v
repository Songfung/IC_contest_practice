/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : P-2019.03
// Date      : Mon Oct 10 22:39:03 2022
/////////////////////////////////////////////////////////////


module LBP_DW01_dec_0 ( A, SUM );
  input [13:0] A;
  output [13:0] SUM;
  wire   n25, n26, n27, n28, n29, n30, n1, n9, n10, n11, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24;

  OR2X1 U1 ( .A(n21), .B(A[2]), .Y(n20) );
  INVX12 U2 ( .A(A[0]), .Y(SUM[0]) );
  AOI21X1 U3 ( .A0(n13), .A1(A[9]), .B0(n14), .Y(n1) );
  INVX12 U4 ( .A(n1), .Y(SUM[9]) );
  XNOR2X1 U5 ( .A(A[13]), .B(n22), .Y(n25) );
  INVX12 U6 ( .A(n25), .Y(SUM[13]) );
  BUFX12 U7 ( .A(n26), .Y(SUM[11]) );
  OAI21XL U8 ( .A0(n9), .A1(n10), .B0(n23), .Y(n26) );
  BUFX12 U9 ( .A(n27), .Y(SUM[6]) );
  OAI2BB1X1 U10 ( .A0N(n17), .A1N(A[6]), .B0(n16), .Y(n27) );
  BUFX12 U11 ( .A(n28), .Y(SUM[3]) );
  OAI2BB1X1 U12 ( .A0N(n20), .A1N(A[3]), .B0(n19), .Y(n28) );
  BUFX12 U13 ( .A(n30), .Y(SUM[1]) );
  NAND2BX1 U14 ( .AN(A[1]), .B(SUM[0]), .Y(n21) );
  BUFX12 U15 ( .A(n29), .Y(SUM[2]) );
  OR2XL U16 ( .A(n20), .B(A[3]), .Y(n19) );
  NOR2X1 U17 ( .A(n13), .B(A[9]), .Y(n14) );
  CLKINVX1 U18 ( .A(n24), .Y(n9) );
  NAND2X1 U19 ( .A(n9), .B(n10), .Y(n23) );
  OR2X1 U20 ( .A(n16), .B(A[7]), .Y(n15) );
  OR2X1 U21 ( .A(n19), .B(A[4]), .Y(n18) );
  OR2X1 U22 ( .A(n15), .B(A[8]), .Y(n13) );
  OR2X1 U23 ( .A(n18), .B(A[5]), .Y(n17) );
  CLKINVX1 U24 ( .A(A[11]), .Y(n10) );
  CLKINVX1 U25 ( .A(A[10]), .Y(n11) );
  OAI2BB1XL U26 ( .A0N(n18), .A1N(A[5]), .B0(n17), .Y(SUM[5]) );
  OR2XL U27 ( .A(n17), .B(A[6]), .Y(n16) );
  OAI2BB1XL U28 ( .A0N(n16), .A1N(A[7]), .B0(n15), .Y(SUM[7]) );
  OAI2BB1XL U29 ( .A0N(n15), .A1N(A[8]), .B0(n13), .Y(SUM[8]) );
  NOR2XL U30 ( .A(A[12]), .B(n23), .Y(n22) );
  OAI2BB1X1 U31 ( .A0N(n19), .A1N(A[4]), .B0(n18), .Y(SUM[4]) );
  OAI2BB1X1 U32 ( .A0N(n21), .A1N(A[2]), .B0(n20), .Y(n29) );
  OAI2BB1X1 U33 ( .A0N(A[0]), .A1N(A[1]), .B0(n21), .Y(n30) );
  XNOR2X1 U34 ( .A(A[12]), .B(n23), .Y(SUM[12]) );
  OAI21XL U35 ( .A0(n14), .A1(n11), .B0(n24), .Y(SUM[10]) );
  NAND2X1 U36 ( .A(n14), .B(n11), .Y(n24) );
endmodule


module LBP_DW01_add_0 ( A, B, CI, SUM, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] SUM;
  input CI;
  output CO;
  wire   n1, n2;
  wire   [7:1] carry;

  ADDFXL U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFHX2 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFHX2 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFHX4 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFHX2 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFHX2 U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2XL U2 ( .A(B[7]), .B(A[7]), .Y(n2) );
  XOR2X4 U3 ( .A(carry[7]), .B(n2), .Y(SUM[7]) );
  XOR2XL U4 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module LBP_DW01_add_1 ( A, B, CI, SUM, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3;
  wire   [7:1] carry;

  ADDFHX2 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFHX4 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFHX2 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFHX2 U1_1 ( .A(A[1]), .B(B[1]), .CI(n2), .CO(carry[2]), .S(SUM[1]) );
  ADDFHX2 U1_2 ( .A(A[2]), .B(n1), .CI(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  CLKBUFX3 U1 ( .A(B[2]), .Y(n1) );
  XOR2X4 U2 ( .A(carry[7]), .B(n3), .Y(SUM[7]) );
  AND2X2 U3 ( .A(B[0]), .B(A[0]), .Y(n2) );
  XOR2XL U4 ( .A(B[7]), .B(A[7]), .Y(n3) );
  XOR2XL U5 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module LBP_DW01_inc_0 ( A, SUM );
  input [6:0] A;
  output [6:0] SUM;

  wire   [6:2] carry;

  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  INVXL U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[6]), .B(A[6]), .Y(SUM[6]) );
endmodule


module LBP_DW01_inc_1 ( A, SUM );
  input [6:0] A;
  output [6:0] SUM;

  wire   [6:2] carry;

  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  CLKINVX1 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[6]), .B(A[6]), .Y(SUM[6]) );
endmodule


module LBP_DW01_inc_2 ( A, SUM );
  input [13:0] A;
  output [13:0] SUM;

  wire   [13:2] carry;

  ADDHXL U1_1_12 ( .A(A[12]), .B(carry[12]), .CO(carry[13]), .S(SUM[12]) );
  ADDHXL U1_1_11 ( .A(A[11]), .B(carry[11]), .CO(carry[12]), .S(SUM[11]) );
  ADDHXL U1_1_10 ( .A(A[10]), .B(carry[10]), .CO(carry[11]), .S(SUM[10]) );
  ADDHXL U1_1_9 ( .A(A[9]), .B(carry[9]), .CO(carry[10]), .S(SUM[9]) );
  ADDHXL U1_1_8 ( .A(A[8]), .B(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADDHXL U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  CLKINVX1 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[13]), .B(A[13]), .Y(SUM[13]) );
endmodule


module LBP ( clk, reset, gray_addr, gray_req, gray_ready, gray_data, lbp_addr, 
        lbp_valid, lbp_data, finish );
  output [13:0] gray_addr;
  input [7:0] gray_data;
  output [13:0] lbp_addr;
  output [7:0] lbp_data;
  input clk, reset, gray_ready;
  output gray_req, lbp_valid, finish;
  wire   n352, n353, n354, n355, n356, n357, n358, n359, n360, n361, n362,
         n363, n364, n365, n366, n367, n368, N2, N5, N6, N8, N9, N10, N24, N25,
         N26, N27, N35, N36, N37, N38, N39, N40, N41, N44, N45, N46, N47, N48,
         N49, N50, N67, N68, N69, N70, N71, N72, N73, N74, N75, N76, N77, N78,
         N79, N80, N83, N84, N85, N86, N87, N88, N89, N90, N91, N92, N93, N94,
         N95, N98, N99, N100, N101, N102, N103, N105, N106, N107, N108, N109,
         N110, N113, N114, N115, N116, N117, N118, N119, N120, N121, N122,
         N123, N124, N125, N158, N159, N160, N161, N162, N163, N164, N165,
         N166, N167, N168, N169, N170, N180, N181, N182, N183, N184, N185,
         N188, N189, N190, N191, N192, N193, N194, N195, N196, N197, N198,
         N199, N200, N215, N216, N217, N218, N219, N220, N221, N222, N223,
         N224, N225, N226, N227, N228, N257, N259, N260, N261, N262, N263,
         N264, N265, N266, N268, N269, N270, N271, N272, N273, N274, N275,
         N294, n41, n42, n43, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54,
         n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n68, n69, n70,
         n71, n72, n73, n75, n76, n78, n81, n82, n83, n84, n85, n87, n88, n89,
         n90, n91, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103,
         n104, n105, n106, n107, n108, n109, n110, n111, n112, n113, n114,
         n115, n116, n117, n118, n119, n120, n121, n122, n123, n124, n125,
         n126, n127, n128, n129, n130, n131, n132, n133, n134, n135, n136,
         n137, n138, n139, n140, n141, n142, n143, n144, n147, n148, n149,
         n150, n151, n152, n153, n154, n155, n156, n157, n158, n159, n160,
         n161, n162, n163, n164, n165, n166, n167, n168, n169, n170, n171,
         n172, n173, n175, n176, n177, n178, n179, n180, n181, n182, n183,
         n184, n185, n186, n187, n188, n189, n190, n191, n192, n193, n194,
         n195, n196, n197, n198, n199, n200, n201, n202, n203, n204, n205,
         n206, n208, n209, \sll_39/SH[0] , \add_105/carry[2] ,
         \add_105/carry[3] , \add_105/carry[4] , \add_105/carry[5] ,
         \add_105/carry[6] , \add_105/carry[7] , \add_105/carry[8] ,
         \add_105/carry[9] , \add_105/carry[10] , \add_105/carry[11] ,
         \add_105/carry[12] , \add_105/carry[13] , \add_101/carry[2] ,
         \add_101/carry[3] , \add_101/carry[4] , \add_101/carry[5] ,
         \add_101/carry[6] , \add_101/carry[7] , \add_101/carry[8] ,
         \add_101/carry[9] , \add_101/carry[10] , \add_101/carry[11] ,
         \add_101/carry[12] , \add_101/carry[13] , \sub_95/carry[2] ,
         \sub_95/carry[3] , \sub_95/carry[4] , \sub_95/carry[5] ,
         \sub_95/carry[6] , \sub_95/carry[7] , \sub_95/carry[8] ,
         \sub_95/carry[9] , \sub_95/carry[10] , \sub_95/carry[11] ,
         \sub_95/carry[12] , \sub_95/carry[13] , \sub_91/carry[2] ,
         \sub_91/carry[3] , \sub_91/carry[4] , \sub_91/carry[5] ,
         \sub_91/carry[6] , \sub_91/carry[7] , \sub_91/carry[8] ,
         \sub_91/carry[9] , \sub_91/carry[10] , \sub_91/carry[11] ,
         \sub_91/carry[12] , \sub_91/carry[13] , n213, n214, n217, n219, n221,
         n223, n225, n227, n229, n231, n233, n235, n237, n239, n241, n243,
         n246, n255, n256, n257, n258, n259, n260, n267, n268, n269, n270,
         n271, n272, n273, n274, n275, n276, n277, n278, n279, n280, n281,
         n282, n283, n284, n285, n286, n287, n288, n289, n290, n291, n292,
         n293, n294, n295, n296, n297, n298, n299, n300, n301, n302, n303,
         n304, n305, n306, n307, n308, n309, n310, n311, n312, n313, n314,
         n315, n316, n317, n318, n319, n320, n321, n322, n323, n324, n325,
         n326, n327, n328, n329, n330, n331, n332, n333, n334, n335, n336,
         n337, n338, n339, n340, n341, n342, n343, n344, n345, n346, n347,
         n348, n349, n350, n351;
  wire   [13:0] center_cnr;
  wire   [3:0] pix_cnr;
  wire   [7:0] center_data;
  wire   [7:0] add_four;
  wire   [7:0] add_zero;
  wire   [13:1] \add_103/carry ;
  wire   [14:0] \sub_93/carry ;

  LBP_DW01_dec_0 sub_166 ( .A({n283, n284, n285, n286, n287, n288, n289, n277, 
        n278, n279, n280, n281, n282, n256}), .SUM({lbp_addr[13], n353, 
        lbp_addr[11], n354, lbp_addr[9], n355, n356, lbp_addr[6], n357, n358, 
        lbp_addr[3:0]}) );
  LBP_DW01_add_0 add_160 ( .A({n360, n361, n362, n363, n364, n365, n366, n367}), .B(add_four), .CI(1'b0), .SUM({N275, N274, N273, N272, N271, N270, N269, 
        N268}) );
  LBP_DW01_add_1 add_158 ( .A({n360, n361, n362, n363, n364, n365, n366, n367}), .B(add_zero), .CI(1'b0), .SUM({N266, N265, N264, N263, N262, N261, N260, 
        N259}) );
  LBP_DW01_inc_0 add_80 ( .A({n277, n278, n279, n280, n281, n282, n256}), 
        .SUM({N50, N49, N48, N47, N46, N45, N44}) );
  LBP_DW01_inc_1 add_73 ( .A({n283, n284, n285, n286, n287, n288, n289}), 
        .SUM({N41, N40, N39, N38, N37, N36, N35}) );
  LBP_DW01_inc_2 r429 ( .A({n283, n284, n285, n286, n287, n288, n289, n277, 
        n278, n279, n280, n281, n282, n256}), .SUM({N80, N79, N78, N77, N76, 
        N75, N74, N73, N72, N71, N70, N69, N68, N67}) );
  DFFRX1 \center_data_reg[7]  ( .D(n192), .CK(clk), .RN(n291), .Q(
        center_data[7]), .QN(n167) );
  DFFRX1 \row_cnr_reg[5]  ( .D(n199), .CK(clk), .RN(n290), .Q(center_cnr[12])
         );
  DFFRX1 \row_cnr_reg[6]  ( .D(n198), .CK(clk), .RN(n290), .Q(center_cnr[13])
         );
  DFFRX1 \center_data_reg[5]  ( .D(n190), .CK(clk), .RN(n291), .Q(
        center_data[5]), .QN(n165) );
  DFFRX1 \center_data_reg[4]  ( .D(n189), .CK(clk), .RN(n291), .Q(
        center_data[4]), .QN(n164) );
  DFFRX1 \center_data_reg[6]  ( .D(n191), .CK(clk), .RN(n291), .Q(
        center_data[6]), .QN(n166) );
  DFFRX1 \center_data_reg[3]  ( .D(n188), .CK(clk), .RN(n291), .Q(
        center_data[3]), .QN(n163) );
  DFFRX1 \row_cnr_reg[3]  ( .D(n201), .CK(clk), .RN(n290), .Q(center_cnr[10])
         );
  DFFRX1 \row_cnr_reg[4]  ( .D(n200), .CK(clk), .RN(n290), .Q(center_cnr[11])
         );
  DFFRX1 \center_data_reg[1]  ( .D(n186), .CK(clk), .RN(n291), .Q(
        center_data[1]), .QN(n161) );
  DFFRX1 \center_data_reg[0]  ( .D(n185), .CK(clk), .RN(n291), .Q(
        center_data[0]), .QN(n160) );
  DFFRX1 \center_data_reg[2]  ( .D(n187), .CK(clk), .RN(n291), .Q(
        center_data[2]), .QN(n162) );
  DFFRX1 \row_cnr_reg[2]  ( .D(n202), .CK(clk), .RN(n290), .Q(center_cnr[9])
         );
  DFFSX1 \col_cnr_reg[4]  ( .D(n195), .CK(clk), .SN(n292), .Q(N101), .QN(n172)
         );
  DFFSX1 \col_cnr_reg[5]  ( .D(n194), .CK(clk), .SN(n292), .Q(N102), .QN(n173)
         );
  DFFSX1 \col_cnr_reg[6]  ( .D(n193), .CK(clk), .SN(n292), .Q(N103), .QN(n171)
         );
  DFFRX1 \row_cnr_reg[0]  ( .D(n204), .CK(clk), .RN(n290), .Q(center_cnr[7]), 
        .QN(n214) );
  DFFRX1 \row_cnr_reg[1]  ( .D(n203), .CK(clk), .RN(n290), .Q(center_cnr[8])
         );
  DFFSX1 \col_cnr_reg[1]  ( .D(n205), .CK(clk), .SN(n326), .Q(N98), .QN(n170)
         );
  DFFSX1 \col_cnr_reg[2]  ( .D(n197), .CK(clk), .SN(n292), .Q(N99), .QN(n169)
         );
  DFFSX1 \col_cnr_reg[3]  ( .D(n196), .CK(clk), .SN(n292), .Q(N100), .QN(n168)
         );
  DFFSX1 \pix_cnr_reg[3]  ( .D(N27), .CK(clk), .SN(n292), .Q(n259), .QN(n209)
         );
  DFFRX1 \pix_cnr_reg[2]  ( .D(N26), .CK(clk), .RN(n290), .Q(pix_cnr[2]) );
  DFFRX1 \pix_cnr_reg[0]  ( .D(N24), .CK(clk), .RN(n290), .Q(N2), .QN(
        \sll_39/SH[0] ) );
  DFFSHQX4 \col_cnr_reg[0]  ( .D(n206), .CK(clk), .SN(n326), .Q(n256) );
  DFFRX1 \lbp_data_reg[0]  ( .D(n184), .CK(clk), .RN(n291), .Q(n367), .QN(n159) );
  DFFRX2 \lbp_data_reg[6]  ( .D(n177), .CK(clk), .RN(n292), .Q(n361), .QN(n152) );
  DFFRX1 \lbp_data_reg[3]  ( .D(n180), .CK(clk), .RN(n292), .Q(n364), .QN(n155) );
  DFFRX1 \lbp_data_reg[2]  ( .D(n181), .CK(clk), .RN(n292), .Q(n365), .QN(n156) );
  DFFRX1 lbp_valid_reg ( .D(N294), .CK(clk), .RN(n292), .Q(n359), .QN(n246) );
  DFFRX1 gray_req_reg ( .D(n208), .CK(clk), .RN(n290), .Q(n352), .QN(n175) );
  DFFRX1 \gray_addr_reg[0]  ( .D(N215), .CK(clk), .RN(n291), .QN(n243) );
  DFFRX1 \gray_addr_reg[1]  ( .D(N216), .CK(clk), .RN(n291), .QN(n241) );
  DFFRX1 \gray_addr_reg[2]  ( .D(N217), .CK(clk), .RN(n290), .QN(n239) );
  DFFRX1 \gray_addr_reg[3]  ( .D(N218), .CK(clk), .RN(n292), .QN(n237) );
  DFFRX1 \gray_addr_reg[4]  ( .D(N219), .CK(clk), .RN(n291), .QN(n235) );
  DFFRX1 \gray_addr_reg[5]  ( .D(N220), .CK(clk), .RN(n290), .QN(n233) );
  DFFRX1 \gray_addr_reg[6]  ( .D(N221), .CK(clk), .RN(n292), .QN(n231) );
  DFFRX1 \gray_addr_reg[7]  ( .D(N222), .CK(clk), .RN(n291), .QN(n229) );
  DFFRX1 \gray_addr_reg[8]  ( .D(N223), .CK(clk), .RN(n290), .QN(n227) );
  DFFRX1 \gray_addr_reg[9]  ( .D(N224), .CK(clk), .RN(n292), .QN(n225) );
  DFFRX1 \gray_addr_reg[10]  ( .D(N225), .CK(clk), .RN(n291), .QN(n223) );
  DFFRX1 \gray_addr_reg[11]  ( .D(N226), .CK(clk), .RN(n290), .QN(n221) );
  DFFRX1 \gray_addr_reg[12]  ( .D(N227), .CK(clk), .RN(n326), .QN(n219) );
  DFFRX1 \gray_addr_reg[13]  ( .D(N228), .CK(clk), .RN(n290), .QN(n217) );
  DFFRX1 \lbp_data_reg[1]  ( .D(n182), .CK(clk), .RN(n291), .Q(n366), .QN(n157) );
  DFFRX1 finish_reg ( .D(n176), .CK(clk), .RN(n292), .Q(n368), .QN(n151) );
  DFFRX1 \pix_cnr_reg[1]  ( .D(N25), .CK(clk), .RN(n290), .Q(pix_cnr[1]), .QN(
        n213) );
  DFFRX2 \lbp_data_reg[7]  ( .D(n183), .CK(clk), .RN(n291), .Q(n360), .QN(n158) );
  DFFRX1 \lbp_data_reg[5]  ( .D(n178), .CK(clk), .RN(n292), .Q(n362), .QN(n153) );
  DFFRX1 \lbp_data_reg[4]  ( .D(n179), .CK(clk), .RN(n292), .Q(n363), .QN(n154) );
  NOR2X2 U181 ( .A(n345), .B(n347), .Y(add_zero[0]) );
  NOR2X2 U182 ( .A(n160), .B(gray_data[0]), .Y(n294) );
  AO21X2 U183 ( .A0(n321), .A1(n294), .B0(center_data[1]), .Y(n293) );
  OR2X4 U184 ( .A(gray_data[2]), .B(n162), .Y(n296) );
  CLKINVX1 U185 ( .A(gray_data[6]), .Y(n323) );
  NAND2X1 U186 ( .A(center_data[6]), .B(n323), .Y(n301) );
  CLKINVX1 U187 ( .A(gray_data[7]), .Y(n325) );
  CLKINVX1 U188 ( .A(gray_data[3]), .Y(n322) );
  NAND2X1 U189 ( .A(N9), .B(N6), .Y(n346) );
  NOR2BX1 U190 ( .AN(center_data[5]), .B(gray_data[5]), .Y(n313) );
  NAND2BX1 U191 ( .AN(n319), .B(n301), .Y(n314) );
  NAND2X1 U192 ( .A(center_data[7]), .B(n325), .Y(n317) );
  NOR2X1 U193 ( .A(n325), .B(center_data[7]), .Y(n320) );
  NAND2BX2 U194 ( .AN(center_data[2]), .B(gray_data[2]), .Y(n306) );
  NAND3BX2 U195 ( .AN(N10), .B(n346), .C(N6), .Y(n345) );
  CLKBUFX3 U196 ( .A(N99), .Y(n281) );
  CLKBUFX3 U197 ( .A(N98), .Y(n282) );
  NOR2X1 U198 ( .A(n340), .B(n338), .Y(add_four[0]) );
  OAI21XL U199 ( .A0(n154), .A1(n46), .B0(n51), .Y(n179) );
  OAI21XL U200 ( .A0(n153), .A1(n46), .B0(n50), .Y(n178) );
  OAI21X1 U201 ( .A0(n152), .A1(n46), .B0(n47), .Y(n177) );
  NAND2X1 U202 ( .A(n258), .B(n62), .Y(n183) );
  AOI22X1 U203 ( .A0(N275), .A1(n48), .B0(N266), .B1(n49), .Y(n62) );
  CLKBUFX3 U204 ( .A(center_cnr[7]), .Y(n289) );
  AND2X4 U205 ( .A(n296), .B(n306), .Y(n303) );
  NOR2X1 U206 ( .A(n351), .B(n349), .Y(add_zero[6]) );
  NOR2X1 U207 ( .A(n344), .B(n342), .Y(add_four[6]) );
  BUFX12 U208 ( .A(n368), .Y(finish) );
  BUFX12 U209 ( .A(n366), .Y(lbp_data[1]) );
  INVX12 U210 ( .A(n217), .Y(gray_addr[13]) );
  INVX12 U211 ( .A(n219), .Y(gray_addr[12]) );
  INVX12 U212 ( .A(n221), .Y(gray_addr[11]) );
  INVX12 U213 ( .A(n223), .Y(gray_addr[10]) );
  INVX12 U214 ( .A(n225), .Y(gray_addr[9]) );
  INVX12 U215 ( .A(n227), .Y(gray_addr[8]) );
  INVX12 U216 ( .A(n229), .Y(gray_addr[7]) );
  INVX12 U217 ( .A(n231), .Y(gray_addr[6]) );
  INVX12 U218 ( .A(n233), .Y(gray_addr[5]) );
  INVX12 U219 ( .A(n235), .Y(gray_addr[4]) );
  INVX12 U220 ( .A(n237), .Y(gray_addr[3]) );
  INVX12 U221 ( .A(n239), .Y(gray_addr[2]) );
  INVX12 U222 ( .A(n241), .Y(gray_addr[1]) );
  INVX12 U223 ( .A(n243), .Y(gray_addr[0]) );
  BUFX12 U224 ( .A(n352), .Y(gray_req) );
  INVX12 U225 ( .A(n246), .Y(lbp_valid) );
  INVX12 U226 ( .A(n158), .Y(lbp_data[7]) );
  BUFX12 U227 ( .A(n365), .Y(lbp_data[2]) );
  INVX12 U228 ( .A(n154), .Y(lbp_data[4]) );
  INVX12 U229 ( .A(n153), .Y(lbp_data[5]) );
  BUFX12 U230 ( .A(n364), .Y(lbp_data[3]) );
  INVX12 U231 ( .A(n152), .Y(lbp_data[6]) );
  BUFX12 U232 ( .A(n367), .Y(lbp_data[0]) );
  NOR2X1 U233 ( .A(n348), .B(n345), .Y(add_zero[1]) );
  AND3X8 U234 ( .A(n324), .B(n301), .C(n317), .Y(n255) );
  NOR2X8 U235 ( .A(n255), .B(n320), .Y(n302) );
  INVX4 U236 ( .A(n300), .Y(n324) );
  CLKINVX12 U237 ( .A(n302), .Y(N6) );
  AOI22X2 U238 ( .A0(N274), .A1(n48), .B0(N265), .B1(n49), .Y(n47) );
  NOR3BX2 U239 ( .AN(n315), .B(n299), .C(n314), .Y(n300) );
  NOR2X2 U240 ( .A(n297), .B(n309), .Y(n310) );
  OR2X1 U241 ( .A(n339), .B(N5), .Y(n344) );
  NAND2X4 U242 ( .A(n337), .B(N6), .Y(n339) );
  NAND2BX1 U243 ( .AN(center_data[5]), .B(gray_data[5]), .Y(n315) );
  AOI31XL U244 ( .A0(n312), .A1(n311), .A2(n310), .B0(n309), .Y(n316) );
  NAND3BXL U245 ( .AN(n308), .B(n307), .C(n306), .Y(n312) );
  INVX1 U246 ( .A(n256), .Y(n257) );
  AOI211X2 U247 ( .A0(n310), .A1(n298), .B0(n297), .C0(n313), .Y(n299) );
  INVX3 U248 ( .A(gray_data[1]), .Y(n321) );
  CLKBUFX3 U249 ( .A(N100), .Y(n280) );
  OAI211X2 U250 ( .A0(n294), .A1(n321), .B0(n293), .C0(n303), .Y(n295) );
  NAND3BX4 U251 ( .AN(N5), .B(n339), .C(N6), .Y(n338) );
  NOR2XL U252 ( .A(n351), .B(n350), .Y(add_zero[7]) );
  NOR2XL U253 ( .A(n344), .B(n343), .Y(add_four[7]) );
  OR2XL U254 ( .A(n281), .B(\sub_91/carry[2] ), .Y(\sub_91/carry[3] ) );
  OR2XL U255 ( .A(n281), .B(\add_101/carry[2] ), .Y(\add_101/carry[3] ) );
  AND2XL U256 ( .A(\sub_95/carry[2] ), .B(n281), .Y(\sub_95/carry[3] ) );
  AND2XL U257 ( .A(\add_105/carry[2] ), .B(n281), .Y(\add_105/carry[3] ) );
  NOR3XL U258 ( .A(n281), .B(n279), .C(n280), .Y(n58) );
  XNOR2XL U259 ( .A(\add_101/carry[2] ), .B(n281), .Y(N159) );
  XOR2XL U260 ( .A(n281), .B(\add_105/carry[2] ), .Y(N189) );
  AND4XL U261 ( .A(n281), .B(n280), .C(n279), .D(n278), .Y(n45) );
  NOR2XL U262 ( .A(n344), .B(n341), .Y(add_four[5]) );
  NOR2XL U263 ( .A(n350), .B(n345), .Y(add_zero[3]) );
  NOR2XL U264 ( .A(n349), .B(n345), .Y(add_zero[2]) );
  NOR2XL U265 ( .A(n351), .B(n348), .Y(add_zero[5]) );
  CLKBUFX3 U266 ( .A(N102), .Y(n278) );
  CLKBUFX3 U267 ( .A(N101), .Y(n279) );
  OAI21XL U268 ( .A0(n209), .A1(n331), .B0(n73), .Y(N10) );
  OAI2BB2XL U269 ( .B0(n209), .B1(n82), .A0N(n71), .A1N(n337), .Y(N5) );
  CLKBUFX3 U270 ( .A(center_cnr[12]), .Y(n284) );
  CLKBUFX3 U271 ( .A(center_cnr[9]), .Y(n287) );
  CLKBUFX3 U272 ( .A(center_cnr[8]), .Y(n288) );
  CLKBUFX3 U273 ( .A(center_cnr[11]), .Y(n285) );
  CLKBUFX3 U274 ( .A(center_cnr[10]), .Y(n286) );
  CLKBUFX3 U275 ( .A(n72), .Y(n276) );
  NAND2X1 U276 ( .A(n209), .B(pix_cnr[1]), .Y(n91) );
  NAND4XL U277 ( .A(n282), .B(n283), .C(n284), .D(n285), .Y(n43) );
  CLKINVX1 U278 ( .A(reset), .Y(n326) );
  AOI31X2 U279 ( .A0(n295), .A1(n296), .A2(n311), .B0(n308), .Y(n298) );
  OR2X1 U280 ( .A(n158), .B(n46), .Y(n258) );
  NAND2X2 U281 ( .A(n69), .B(n70), .Y(n46) );
  CLKINVX1 U282 ( .A(n275), .Y(n327) );
  CLKINVX1 U283 ( .A(n81), .Y(n331) );
  CLKINVX1 U284 ( .A(n68), .Y(n329) );
  NAND2X1 U285 ( .A(n69), .B(n141), .Y(n143) );
  CLKBUFX3 U286 ( .A(n98), .Y(n274) );
  NOR2BX1 U287 ( .AN(n69), .B(n141), .Y(n98) );
  CLKINVX1 U288 ( .A(N8), .Y(n333) );
  CLKBUFX3 U289 ( .A(n95), .Y(n272) );
  NOR2X1 U290 ( .A(n144), .B(n81), .Y(n95) );
  CLKBUFX3 U291 ( .A(n75), .Y(n275) );
  NAND2X1 U292 ( .A(n329), .B(n85), .Y(n75) );
  OR2X1 U293 ( .A(n346), .B(N10), .Y(n351) );
  OAI21XL U294 ( .A0(n332), .A1(n336), .B0(n81), .Y(N9) );
  NAND2X1 U295 ( .A(n93), .B(n94), .Y(N228) );
  AOI222XL U296 ( .A0(N185), .A1(n268), .B0(N80), .B1(n269), .C0(N170), .C1(
        n270), .Y(n93) );
  AOI221XL U297 ( .A0(N95), .A1(n271), .B0(N200), .B1(n272), .C0(n96), .Y(n94)
         );
  NAND2X1 U298 ( .A(n108), .B(n109), .Y(N225) );
  AOI222XL U299 ( .A0(N182), .A1(n268), .B0(N77), .B1(n269), .C0(N167), .C1(
        n270), .Y(n108) );
  AOI221XL U300 ( .A0(N92), .A1(n271), .B0(N197), .B1(n272), .C0(n110), .Y(
        n109) );
  NAND2X1 U301 ( .A(n105), .B(n106), .Y(N226) );
  AOI222XL U302 ( .A0(N183), .A1(n268), .B0(N78), .B1(n269), .C0(N168), .C1(
        n270), .Y(n105) );
  AOI221XL U303 ( .A0(N93), .A1(n271), .B0(N198), .B1(n272), .C0(n107), .Y(
        n106) );
  NAND2X1 U304 ( .A(n102), .B(n103), .Y(N227) );
  AOI222XL U305 ( .A0(N184), .A1(n268), .B0(N79), .B1(n269), .C0(N169), .C1(
        n270), .Y(n102) );
  AOI221XL U306 ( .A0(N94), .A1(n271), .B0(N199), .B1(n272), .C0(n104), .Y(
        n103) );
  AO22X1 U307 ( .A0(N125), .A1(n273), .B0(N110), .B1(n274), .Y(n96) );
  AO22X1 U308 ( .A0(N123), .A1(n273), .B0(N108), .B1(n274), .Y(n107) );
  AO22X1 U309 ( .A0(N124), .A1(n273), .B0(N109), .B1(n274), .Y(n104) );
  NAND2X1 U310 ( .A(n332), .B(n336), .Y(n81) );
  CLKINVX1 U311 ( .A(n83), .Y(n337) );
  CLKINVX1 U312 ( .A(n65), .Y(n332) );
  NAND2X1 U313 ( .A(n114), .B(n115), .Y(N223) );
  AOI221XL U314 ( .A0(N90), .A1(n271), .B0(N195), .B1(n272), .C0(n116), .Y(
        n115) );
  AOI222XL U315 ( .A0(N180), .A1(n268), .B0(N75), .B1(n269), .C0(N165), .C1(
        n270), .Y(n114) );
  NAND2X1 U316 ( .A(n111), .B(n112), .Y(N224) );
  AOI221XL U317 ( .A0(N91), .A1(n271), .B0(N196), .B1(n272), .C0(n113), .Y(
        n112) );
  AOI222XL U318 ( .A0(N181), .A1(n268), .B0(N76), .B1(n269), .C0(N166), .C1(
        n270), .Y(n111) );
  AO22X1 U319 ( .A0(N120), .A1(n273), .B0(N105), .B1(n274), .Y(n116) );
  AO22X1 U320 ( .A0(N121), .A1(n273), .B0(N106), .B1(n274), .Y(n113) );
  AO22X1 U321 ( .A0(N122), .A1(n273), .B0(N107), .B1(n274), .Y(n110) );
  OAI211X1 U322 ( .A0(n147), .A1(n148), .B0(n84), .C0(n330), .Y(n68) );
  NAND3X1 U323 ( .A(n284), .B(n285), .C(n283), .Y(n148) );
  NAND4X1 U324 ( .A(n286), .B(n287), .C(n288), .D(n289), .Y(n147) );
  AO22X1 U325 ( .A0(N118), .A1(n273), .B0(n277), .B1(n274), .Y(n122) );
  AO22X1 U326 ( .A0(N119), .A1(n273), .B0(n214), .B1(n274), .Y(n119) );
  NOR2X2 U327 ( .A(n327), .B(n267), .Y(n76) );
  OAI21X1 U328 ( .A0(n334), .A1(n91), .B0(n328), .Y(n144) );
  CLKINVX1 U329 ( .A(n143), .Y(n328) );
  NAND2X1 U330 ( .A(n65), .B(n90), .Y(N8) );
  INVX3 U331 ( .A(n267), .Y(n330) );
  NAND2X1 U332 ( .A(N8), .B(n334), .Y(n349) );
  NOR2BX1 U333 ( .AN(n46), .B(n68), .Y(n64) );
  NAND2X1 U334 ( .A(n334), .B(n333), .Y(n347) );
  CLKBUFX3 U335 ( .A(n99), .Y(n268) );
  NOR2BX1 U336 ( .AN(n87), .B(n144), .Y(n99) );
  AND2X2 U337 ( .A(n73), .B(n329), .Y(n69) );
  NAND2X1 U338 ( .A(n138), .B(n139), .Y(N215) );
  AOI221XL U339 ( .A0(n257), .A1(n271), .B0(n257), .B1(n272), .C0(n140), .Y(
        n139) );
  AOI222XL U340 ( .A0(n256), .A1(n268), .B0(N67), .B1(n269), .C0(n257), .C1(
        n270), .Y(n138) );
  NAND2X1 U341 ( .A(n135), .B(n136), .Y(N216) );
  AOI221XL U342 ( .A0(N83), .A1(n271), .B0(N188), .B1(n272), .C0(n137), .Y(
        n136) );
  AOI222XL U343 ( .A0(n282), .A1(n268), .B0(N68), .B1(n269), .C0(N158), .C1(
        n270), .Y(n135) );
  NAND2X1 U344 ( .A(n132), .B(n133), .Y(N217) );
  AOI221XL U345 ( .A0(N84), .A1(n271), .B0(N189), .B1(n272), .C0(n134), .Y(
        n133) );
  AOI222XL U346 ( .A0(n281), .A1(n268), .B0(N69), .B1(n269), .C0(N159), .C1(
        n270), .Y(n132) );
  NAND2X1 U347 ( .A(n129), .B(n130), .Y(N218) );
  AOI221XL U348 ( .A0(N85), .A1(n271), .B0(N190), .B1(n272), .C0(n131), .Y(
        n130) );
  AOI222XL U349 ( .A0(n280), .A1(n268), .B0(N70), .B1(n269), .C0(N160), .C1(
        n270), .Y(n129) );
  NAND2X1 U350 ( .A(n126), .B(n127), .Y(N219) );
  AOI221XL U351 ( .A0(N86), .A1(n271), .B0(N191), .B1(n272), .C0(n128), .Y(
        n127) );
  AOI222XL U352 ( .A0(n279), .A1(n268), .B0(N71), .B1(n269), .C0(N161), .C1(
        n270), .Y(n126) );
  NAND2X1 U353 ( .A(n123), .B(n124), .Y(N220) );
  AOI221XL U354 ( .A0(N87), .A1(n271), .B0(N192), .B1(n272), .C0(n125), .Y(
        n124) );
  AOI222XL U355 ( .A0(n278), .A1(n268), .B0(N72), .B1(n269), .C0(N162), .C1(
        n270), .Y(n123) );
  NAND2X1 U356 ( .A(n120), .B(n121), .Y(N221) );
  AOI221XL U357 ( .A0(N88), .A1(n271), .B0(N193), .B1(n272), .C0(n122), .Y(
        n121) );
  AOI222XL U358 ( .A0(n277), .A1(n268), .B0(N73), .B1(n269), .C0(N163), .C1(
        n270), .Y(n120) );
  NAND2X1 U359 ( .A(n117), .B(n118), .Y(N222) );
  AOI221XL U360 ( .A0(N89), .A1(n271), .B0(N194), .B1(n272), .C0(n119), .Y(
        n118) );
  AOI222XL U361 ( .A0(n214), .A1(n268), .B0(N74), .B1(n269), .C0(N164), .C1(
        n270), .Y(n117) );
  CLKBUFX3 U362 ( .A(n100), .Y(n269) );
  OAI31XL U363 ( .A0(n144), .A1(n331), .A2(n87), .B0(n329), .Y(n100) );
  CLKBUFX3 U364 ( .A(n101), .Y(n270) );
  NOR4X1 U365 ( .A(n143), .B(n91), .C(n334), .D(n142), .Y(n101) );
  CLKBUFX3 U366 ( .A(n97), .Y(n273) );
  NOR2BX1 U367 ( .AN(n142), .B(n143), .Y(n97) );
  AO22X1 U368 ( .A0(N114), .A1(n273), .B0(n281), .B1(n274), .Y(n134) );
  AO22X1 U369 ( .A0(N115), .A1(n273), .B0(n280), .B1(n274), .Y(n131) );
  AO22X1 U370 ( .A0(N116), .A1(n273), .B0(n279), .B1(n274), .Y(n128) );
  AO22X1 U371 ( .A0(N117), .A1(n273), .B0(n278), .B1(n274), .Y(n125) );
  AO22X1 U372 ( .A0(N113), .A1(n273), .B0(n282), .B1(n274), .Y(n137) );
  AO22X1 U373 ( .A0(n257), .A1(n273), .B0(n256), .B1(n274), .Y(n140) );
  NAND2X1 U374 ( .A(n327), .B(n336), .Y(n88) );
  NAND4X1 U375 ( .A(n334), .B(n259), .C(n213), .D(n336), .Y(n85) );
  OAI22XL U376 ( .A0(N8), .A1(n275), .B0(n91), .B1(n88), .Y(N25) );
  OAI22XL U377 ( .A0(n336), .A1(n89), .B0(n90), .B1(n88), .Y(N26) );
  NAND2X1 U378 ( .A(n71), .B(n336), .Y(n141) );
  NAND2X1 U379 ( .A(n213), .B(n335), .Y(n342) );
  NAND2X1 U380 ( .A(n327), .B(n90), .Y(n89) );
  NOR2X1 U381 ( .A(n334), .B(n275), .Y(N24) );
  CLKBUFX3 U382 ( .A(n54), .Y(n271) );
  NOR2X1 U383 ( .A(n73), .B(n68), .Y(n54) );
  OAI2BB1X1 U384 ( .A0N(n84), .A1N(n68), .B0(n85), .Y(N294) );
  NOR4X1 U385 ( .A(n287), .B(n288), .C(n277), .D(n278), .Y(n59) );
  NOR4X1 U386 ( .A(n282), .B(n283), .C(n284), .D(n285), .Y(n57) );
  NOR3X1 U387 ( .A(n214), .B(n286), .C(n256), .Y(n56) );
  CLKBUFX3 U388 ( .A(n326), .Y(n292) );
  CLKBUFX3 U389 ( .A(n326), .Y(n291) );
  CLKBUFX3 U390 ( .A(n326), .Y(n290) );
  OAI211X1 U391 ( .A0(n155), .A1(n46), .B0(n52), .C0(n53), .Y(n180) );
  NAND2X1 U392 ( .A(N262), .B(n49), .Y(n52) );
  AOI32X1 U393 ( .A0(n271), .A1(n55), .A2(N257), .B0(N271), .B1(n48), .Y(n53)
         );
  NAND4X1 U394 ( .A(n56), .B(n57), .C(n58), .D(n59), .Y(n55) );
  AOI22X1 U395 ( .A0(N273), .A1(n48), .B0(N264), .B1(n49), .Y(n50) );
  AOI22X1 U396 ( .A0(N272), .A1(n48), .B0(N263), .B1(n49), .Y(n51) );
  OAI21XL U397 ( .A0(n156), .A1(n46), .B0(n60), .Y(n181) );
  AOI22X1 U398 ( .A0(N270), .A1(n48), .B0(N261), .B1(n49), .Y(n60) );
  NOR2X1 U399 ( .A(n341), .B(n338), .Y(add_four[1]) );
  NOR2X1 U400 ( .A(n342), .B(n338), .Y(add_four[2]) );
  NOR2X1 U401 ( .A(n343), .B(n338), .Y(add_four[3]) );
  NOR2X1 U402 ( .A(n351), .B(n347), .Y(add_zero[4]) );
  NOR2X1 U403 ( .A(n344), .B(n340), .Y(add_four[4]) );
  OAI21XL U404 ( .A0(n157), .A1(n46), .B0(n61), .Y(n182) );
  AOI22X1 U405 ( .A0(N269), .A1(n48), .B0(N260), .B1(n49), .Y(n61) );
  OAI21XL U406 ( .A0(n159), .A1(n46), .B0(n63), .Y(n184) );
  AOI22X1 U407 ( .A0(N268), .A1(n48), .B0(N259), .B1(n49), .Y(n63) );
  CLKBUFX3 U408 ( .A(N103), .Y(n277) );
  OAI2BB2XL U409 ( .B0(n160), .B1(n276), .A0N(gray_data[0]), .A1N(n276), .Y(
        n185) );
  OAI2BB2XL U410 ( .B0(n161), .B1(n276), .A0N(gray_data[1]), .A1N(n276), .Y(
        n186) );
  OAI2BB2XL U411 ( .B0(n162), .B1(n276), .A0N(gray_data[2]), .A1N(n276), .Y(
        n187) );
  OAI2BB2XL U412 ( .B0(n163), .B1(n276), .A0N(gray_data[3]), .A1N(n276), .Y(
        n188) );
  OAI2BB2XL U413 ( .B0(n164), .B1(n276), .A0N(gray_data[4]), .A1N(n276), .Y(
        n189) );
  OAI2BB2XL U414 ( .B0(n165), .B1(n276), .A0N(gray_data[5]), .A1N(n276), .Y(
        n190) );
  OAI2BB2XL U415 ( .B0(n166), .B1(n276), .A0N(gray_data[6]), .A1N(n276), .Y(
        n191) );
  OAI2BB2XL U416 ( .B0(n167), .B1(n276), .A0N(gray_data[7]), .A1N(n276), .Y(
        n192) );
  NAND2BX1 U417 ( .AN(gray_ready), .B(n175), .Y(n208) );
  INVX3 U418 ( .A(pix_cnr[2]), .Y(n336) );
  XNOR2X1 U419 ( .A(n213), .B(pix_cnr[2]), .Y(n83) );
  NAND2X1 U420 ( .A(n209), .B(n331), .Y(n73) );
  NOR2X1 U421 ( .A(pix_cnr[1]), .B(n83), .Y(n82) );
  NAND2X1 U422 ( .A(\sll_39/SH[0] ), .B(n213), .Y(n65) );
  AND4X2 U423 ( .A(n64), .B(n209), .C(n65), .D(n336), .Y(n49) );
  OA21X2 U424 ( .A0(pix_cnr[2]), .A1(n259), .B0(n64), .Y(n48) );
  INVX3 U425 ( .A(\sll_39/SH[0] ), .Y(n334) );
  AO21X1 U426 ( .A0(n71), .A1(pix_cnr[2]), .B0(n175), .Y(n70) );
  NAND2X1 U427 ( .A(pix_cnr[1]), .B(n334), .Y(n90) );
  NOR2X1 U428 ( .A(n259), .B(pix_cnr[1]), .Y(n71) );
  NAND2X1 U429 ( .A(n335), .B(pix_cnr[1]), .Y(n340) );
  NAND2X1 U430 ( .A(N8), .B(\sll_39/SH[0] ), .Y(n350) );
  NAND2X1 U431 ( .A(\sll_39/SH[0] ), .B(n333), .Y(n348) );
  NAND4X1 U432 ( .A(n169), .B(n170), .C(n168), .D(n150), .Y(n84) );
  AND4X1 U433 ( .A(n257), .B(n173), .C(n172), .D(n171), .Y(n150) );
  OAI2BB2XL U434 ( .B0(n172), .B1(n275), .A0N(N48), .A1N(n76), .Y(n195) );
  OAI2BB2XL U435 ( .B0(n173), .B1(n275), .A0N(N49), .A1N(n76), .Y(n194) );
  OAI2BB2XL U436 ( .B0(n257), .B1(n275), .A0N(N44), .A1N(n76), .Y(n206) );
  OAI2BB2XL U437 ( .B0(n170), .B1(n275), .A0N(N45), .A1N(n76), .Y(n205) );
  OAI2BB2XL U438 ( .B0(n168), .B1(n275), .A0N(N47), .A1N(n76), .Y(n196) );
  OAI2BB2XL U439 ( .B0(n169), .B1(n275), .A0N(N46), .A1N(n76), .Y(n197) );
  OAI2BB2XL U440 ( .B0(n171), .B1(n275), .A0N(N50), .A1N(n76), .Y(n193) );
  CLKBUFX3 U441 ( .A(center_cnr[13]), .Y(n283) );
  CLKBUFX3 U442 ( .A(n78), .Y(n267) );
  NOR4X1 U443 ( .A(n173), .B(n172), .C(n257), .D(n149), .Y(n78) );
  OR4X1 U444 ( .A(n168), .B(n169), .C(n170), .D(n171), .Y(n149) );
  OAI31XL U445 ( .A0(n41), .A1(n42), .A2(n43), .B0(n151), .Y(n176) );
  NAND4X1 U446 ( .A(n288), .B(n277), .C(n287), .D(n45), .Y(n41) );
  NAND4XL U447 ( .A(n286), .B(n256), .C(n214), .D(n359), .Y(n42) );
  NOR3X1 U448 ( .A(n334), .B(pix_cnr[2]), .C(n91), .Y(n142) );
  NOR3X1 U449 ( .A(n336), .B(\sll_39/SH[0] ), .C(n91), .Y(n87) );
  NAND2X1 U450 ( .A(N2), .B(pix_cnr[1]), .Y(n341) );
  NAND2X1 U451 ( .A(n213), .B(N2), .Y(n343) );
  AO22X1 U452 ( .A0(n259), .A1(n260), .B0(n327), .B1(n87), .Y(N27) );
  NAND2X1 U453 ( .A(n88), .B(n89), .Y(n260) );
  OAI21XL U454 ( .A0(n175), .A1(n73), .B0(n329), .Y(n72) );
  CLKINVX1 U455 ( .A(N2), .Y(n335) );
  AO22X1 U456 ( .A0(n330), .A1(n283), .B0(N41), .B1(n267), .Y(n198) );
  AO22X1 U457 ( .A0(n330), .A1(n289), .B0(N35), .B1(n267), .Y(n204) );
  AO22X1 U458 ( .A0(n330), .A1(n284), .B0(N40), .B1(n267), .Y(n199) );
  AO22X1 U459 ( .A0(n330), .A1(n285), .B0(N39), .B1(n267), .Y(n200) );
  AO22X1 U460 ( .A0(n330), .A1(n286), .B0(N38), .B1(n267), .Y(n201) );
  AO22X1 U461 ( .A0(n330), .A1(n287), .B0(N37), .B1(n267), .Y(n202) );
  AO22X1 U462 ( .A0(n330), .A1(n288), .B0(N36), .B1(n267), .Y(n203) );
  BUFX12 U463 ( .A(n358), .Y(lbp_addr[4]) );
  BUFX12 U464 ( .A(n357), .Y(lbp_addr[5]) );
  BUFX12 U465 ( .A(n356), .Y(lbp_addr[7]) );
  BUFX12 U466 ( .A(n355), .Y(lbp_addr[8]) );
  BUFX12 U467 ( .A(n353), .Y(lbp_addr[12]) );
  BUFX12 U468 ( .A(n354), .Y(lbp_addr[10]) );
  XNOR2X1 U469 ( .A(n283), .B(\sub_93/carry [13]), .Y(N110) );
  OR2X1 U470 ( .A(n284), .B(\sub_93/carry [12]), .Y(\sub_93/carry [13]) );
  XNOR2X1 U471 ( .A(\sub_93/carry [12]), .B(n284), .Y(N109) );
  OR2X1 U472 ( .A(n285), .B(\sub_93/carry [11]), .Y(\sub_93/carry [12]) );
  XNOR2X1 U473 ( .A(\sub_93/carry [11]), .B(n285), .Y(N108) );
  OR2X1 U474 ( .A(n286), .B(\sub_93/carry [10]), .Y(\sub_93/carry [11]) );
  XNOR2X1 U475 ( .A(\sub_93/carry [10]), .B(n286), .Y(N107) );
  OR2X1 U476 ( .A(n287), .B(\sub_93/carry [9]), .Y(\sub_93/carry [10]) );
  XNOR2X1 U477 ( .A(\sub_93/carry [9]), .B(n287), .Y(N106) );
  OR2X1 U478 ( .A(n288), .B(n289), .Y(\sub_93/carry [9]) );
  XNOR2X1 U479 ( .A(n289), .B(n288), .Y(N105) );
  XNOR2X1 U480 ( .A(n283), .B(\sub_95/carry[13] ), .Y(N125) );
  OR2X1 U481 ( .A(n284), .B(\sub_95/carry[12] ), .Y(\sub_95/carry[13] ) );
  XNOR2X1 U482 ( .A(\sub_95/carry[12] ), .B(n284), .Y(N124) );
  OR2X1 U483 ( .A(n285), .B(\sub_95/carry[11] ), .Y(\sub_95/carry[12] ) );
  XNOR2X1 U484 ( .A(\sub_95/carry[11] ), .B(n285), .Y(N123) );
  OR2X1 U485 ( .A(n286), .B(\sub_95/carry[10] ), .Y(\sub_95/carry[11] ) );
  XNOR2X1 U486 ( .A(\sub_95/carry[10] ), .B(n286), .Y(N122) );
  OR2X1 U487 ( .A(n287), .B(\sub_95/carry[9] ), .Y(\sub_95/carry[10] ) );
  XNOR2X1 U488 ( .A(\sub_95/carry[9] ), .B(n287), .Y(N121) );
  OR2X1 U489 ( .A(n288), .B(\sub_95/carry[8] ), .Y(\sub_95/carry[9] ) );
  XNOR2X1 U490 ( .A(\sub_95/carry[8] ), .B(n288), .Y(N120) );
  OR2X1 U491 ( .A(n289), .B(\sub_95/carry[7] ), .Y(\sub_95/carry[8] ) );
  XNOR2X1 U492 ( .A(\sub_95/carry[7] ), .B(n289), .Y(N119) );
  AND2X1 U493 ( .A(\sub_95/carry[6] ), .B(n277), .Y(\sub_95/carry[7] ) );
  XOR2X1 U494 ( .A(n277), .B(\sub_95/carry[6] ), .Y(N118) );
  AND2X1 U495 ( .A(\sub_95/carry[5] ), .B(n278), .Y(\sub_95/carry[6] ) );
  XOR2X1 U496 ( .A(n278), .B(\sub_95/carry[5] ), .Y(N117) );
  AND2X1 U497 ( .A(\sub_95/carry[4] ), .B(n279), .Y(\sub_95/carry[5] ) );
  XOR2X1 U498 ( .A(n279), .B(\sub_95/carry[4] ), .Y(N116) );
  AND2X1 U499 ( .A(\sub_95/carry[3] ), .B(n280), .Y(\sub_95/carry[4] ) );
  XOR2X1 U500 ( .A(n280), .B(\sub_95/carry[3] ), .Y(N115) );
  XOR2X1 U501 ( .A(n281), .B(\sub_95/carry[2] ), .Y(N114) );
  AND2X1 U502 ( .A(n256), .B(n282), .Y(\sub_95/carry[2] ) );
  XOR2X1 U503 ( .A(n282), .B(n256), .Y(N113) );
  XOR2X1 U504 ( .A(n283), .B(\add_105/carry[13] ), .Y(N200) );
  AND2X1 U505 ( .A(\add_105/carry[12] ), .B(n284), .Y(\add_105/carry[13] ) );
  XOR2X1 U506 ( .A(n284), .B(\add_105/carry[12] ), .Y(N199) );
  AND2X1 U507 ( .A(\add_105/carry[11] ), .B(n285), .Y(\add_105/carry[12] ) );
  XOR2X1 U508 ( .A(n285), .B(\add_105/carry[11] ), .Y(N198) );
  AND2X1 U509 ( .A(\add_105/carry[10] ), .B(n286), .Y(\add_105/carry[11] ) );
  XOR2X1 U510 ( .A(n286), .B(\add_105/carry[10] ), .Y(N197) );
  AND2X1 U511 ( .A(\add_105/carry[9] ), .B(n287), .Y(\add_105/carry[10] ) );
  XOR2X1 U512 ( .A(n287), .B(\add_105/carry[9] ), .Y(N196) );
  AND2X1 U513 ( .A(\add_105/carry[8] ), .B(n288), .Y(\add_105/carry[9] ) );
  XOR2X1 U514 ( .A(n288), .B(\add_105/carry[8] ), .Y(N195) );
  OR2X1 U515 ( .A(n289), .B(\add_105/carry[7] ), .Y(\add_105/carry[8] ) );
  XNOR2X1 U516 ( .A(\add_105/carry[7] ), .B(n289), .Y(N194) );
  AND2X1 U517 ( .A(\add_105/carry[6] ), .B(n277), .Y(\add_105/carry[7] ) );
  XOR2X1 U518 ( .A(n277), .B(\add_105/carry[6] ), .Y(N193) );
  AND2X1 U519 ( .A(\add_105/carry[5] ), .B(n278), .Y(\add_105/carry[6] ) );
  XOR2X1 U520 ( .A(n278), .B(\add_105/carry[5] ), .Y(N192) );
  AND2X1 U521 ( .A(\add_105/carry[4] ), .B(n279), .Y(\add_105/carry[5] ) );
  XOR2X1 U522 ( .A(n279), .B(\add_105/carry[4] ), .Y(N191) );
  AND2X1 U523 ( .A(\add_105/carry[3] ), .B(n280), .Y(\add_105/carry[4] ) );
  XOR2X1 U524 ( .A(n280), .B(\add_105/carry[3] ), .Y(N190) );
  AND2X1 U525 ( .A(n256), .B(n282), .Y(\add_105/carry[2] ) );
  XOR2X1 U526 ( .A(n282), .B(n256), .Y(N188) );
  XNOR2X1 U527 ( .A(n283), .B(\sub_91/carry[13] ), .Y(N95) );
  OR2X1 U528 ( .A(n284), .B(\sub_91/carry[12] ), .Y(\sub_91/carry[13] ) );
  XNOR2X1 U529 ( .A(\sub_91/carry[12] ), .B(n284), .Y(N94) );
  OR2X1 U530 ( .A(n285), .B(\sub_91/carry[11] ), .Y(\sub_91/carry[12] ) );
  XNOR2X1 U531 ( .A(\sub_91/carry[11] ), .B(n285), .Y(N93) );
  OR2X1 U532 ( .A(n286), .B(\sub_91/carry[10] ), .Y(\sub_91/carry[11] ) );
  XNOR2X1 U533 ( .A(\sub_91/carry[10] ), .B(n286), .Y(N92) );
  OR2X1 U534 ( .A(n287), .B(\sub_91/carry[9] ), .Y(\sub_91/carry[10] ) );
  XNOR2X1 U535 ( .A(\sub_91/carry[9] ), .B(n287), .Y(N91) );
  OR2X1 U536 ( .A(n288), .B(\sub_91/carry[8] ), .Y(\sub_91/carry[9] ) );
  XNOR2X1 U537 ( .A(\sub_91/carry[8] ), .B(n288), .Y(N90) );
  AND2X1 U538 ( .A(\sub_91/carry[7] ), .B(n289), .Y(\sub_91/carry[8] ) );
  XOR2X1 U539 ( .A(n289), .B(\sub_91/carry[7] ), .Y(N89) );
  OR2X1 U540 ( .A(n277), .B(\sub_91/carry[6] ), .Y(\sub_91/carry[7] ) );
  XNOR2X1 U541 ( .A(\sub_91/carry[6] ), .B(n277), .Y(N88) );
  OR2X1 U542 ( .A(n278), .B(\sub_91/carry[5] ), .Y(\sub_91/carry[6] ) );
  XNOR2X1 U543 ( .A(\sub_91/carry[5] ), .B(n278), .Y(N87) );
  OR2X1 U544 ( .A(n279), .B(\sub_91/carry[4] ), .Y(\sub_91/carry[5] ) );
  XNOR2X1 U545 ( .A(\sub_91/carry[4] ), .B(n279), .Y(N86) );
  OR2X1 U546 ( .A(n280), .B(\sub_91/carry[3] ), .Y(\sub_91/carry[4] ) );
  XNOR2X1 U547 ( .A(\sub_91/carry[3] ), .B(n280), .Y(N85) );
  XNOR2X1 U548 ( .A(\sub_91/carry[2] ), .B(n281), .Y(N84) );
  OR2X1 U549 ( .A(n282), .B(n256), .Y(\sub_91/carry[2] ) );
  XNOR2X1 U550 ( .A(n256), .B(n282), .Y(N83) );
  XOR2X1 U551 ( .A(n283), .B(\add_101/carry[13] ), .Y(N170) );
  AND2X1 U552 ( .A(\add_101/carry[12] ), .B(n284), .Y(\add_101/carry[13] ) );
  XOR2X1 U553 ( .A(n284), .B(\add_101/carry[12] ), .Y(N169) );
  AND2X1 U554 ( .A(\add_101/carry[11] ), .B(n285), .Y(\add_101/carry[12] ) );
  XOR2X1 U555 ( .A(n285), .B(\add_101/carry[11] ), .Y(N168) );
  AND2X1 U556 ( .A(\add_101/carry[10] ), .B(n286), .Y(\add_101/carry[11] ) );
  XOR2X1 U557 ( .A(n286), .B(\add_101/carry[10] ), .Y(N167) );
  AND2X1 U558 ( .A(\add_101/carry[9] ), .B(n287), .Y(\add_101/carry[10] ) );
  XOR2X1 U559 ( .A(n287), .B(\add_101/carry[9] ), .Y(N166) );
  AND2X1 U560 ( .A(\add_101/carry[8] ), .B(n288), .Y(\add_101/carry[9] ) );
  XOR2X1 U561 ( .A(n288), .B(\add_101/carry[8] ), .Y(N165) );
  AND2X1 U562 ( .A(\add_101/carry[7] ), .B(n289), .Y(\add_101/carry[8] ) );
  XOR2X1 U563 ( .A(n289), .B(\add_101/carry[7] ), .Y(N164) );
  OR2X1 U564 ( .A(n277), .B(\add_101/carry[6] ), .Y(\add_101/carry[7] ) );
  XNOR2X1 U565 ( .A(\add_101/carry[6] ), .B(n277), .Y(N163) );
  OR2X1 U566 ( .A(n278), .B(\add_101/carry[5] ), .Y(\add_101/carry[6] ) );
  XNOR2X1 U567 ( .A(\add_101/carry[5] ), .B(n278), .Y(N162) );
  OR2X1 U568 ( .A(n279), .B(\add_101/carry[4] ), .Y(\add_101/carry[5] ) );
  XNOR2X1 U569 ( .A(\add_101/carry[4] ), .B(n279), .Y(N161) );
  OR2X1 U570 ( .A(n280), .B(\add_101/carry[3] ), .Y(\add_101/carry[4] ) );
  XNOR2X1 U571 ( .A(\add_101/carry[3] ), .B(n280), .Y(N160) );
  OR2X1 U572 ( .A(n282), .B(n256), .Y(\add_101/carry[2] ) );
  XNOR2X1 U573 ( .A(n256), .B(n282), .Y(N158) );
  XOR2X1 U574 ( .A(n283), .B(\add_103/carry [13]), .Y(N185) );
  AND2X1 U575 ( .A(\add_103/carry [12]), .B(n284), .Y(\add_103/carry [13]) );
  XOR2X1 U576 ( .A(n284), .B(\add_103/carry [12]), .Y(N184) );
  AND2X1 U577 ( .A(\add_103/carry [11]), .B(n285), .Y(\add_103/carry [12]) );
  XOR2X1 U578 ( .A(n285), .B(\add_103/carry [11]), .Y(N183) );
  AND2X1 U579 ( .A(\add_103/carry [10]), .B(n286), .Y(\add_103/carry [11]) );
  XOR2X1 U580 ( .A(n286), .B(\add_103/carry [10]), .Y(N182) );
  AND2X1 U581 ( .A(\add_103/carry [9]), .B(n287), .Y(\add_103/carry [10]) );
  XOR2X1 U582 ( .A(n287), .B(\add_103/carry [9]), .Y(N181) );
  AND2X1 U583 ( .A(n289), .B(n288), .Y(\add_103/carry [9]) );
  XOR2X1 U584 ( .A(n288), .B(n289), .Y(N180) );
  NOR2X1 U585 ( .A(n323), .B(center_data[6]), .Y(n319) );
  NAND2X1 U586 ( .A(center_data[3]), .B(n322), .Y(n311) );
  NOR2X1 U587 ( .A(n322), .B(center_data[3]), .Y(n308) );
  NOR2BX1 U588 ( .AN(center_data[4]), .B(gray_data[4]), .Y(n297) );
  NOR2BX1 U589 ( .AN(gray_data[4]), .B(center_data[4]), .Y(n309) );
  NOR2BX1 U590 ( .AN(gray_data[0]), .B(center_data[0]), .Y(n305) );
  OAI2BB1X1 U591 ( .A0N(n305), .A1N(gray_data[1]), .B0(center_data[1]), .Y(
        n304) );
  OAI211X1 U592 ( .A0(gray_data[1]), .A1(n305), .B0(n304), .C0(n303), .Y(n307)
         );
  AOI211X1 U593 ( .A0(n316), .A1(n315), .B0(n314), .C0(n313), .Y(n318) );
  OAI31XL U594 ( .A0(n320), .A1(n319), .A2(n318), .B0(n317), .Y(N257) );
endmodule

