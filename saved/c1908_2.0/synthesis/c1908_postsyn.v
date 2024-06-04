/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06-SP4
// Date      : Tue Jun  4 19:03:36 2024
/////////////////////////////////////////////////////////////


module c1908 ( N1, N4, N7, N10, N13, N16, N19, N22, N25, N28, N31, N34, N37, 
        N40, N43, N46, N49, N53, N56, N60, N63, N66, N69, N72, N76, N79, N82, 
        N85, N88, N91, N94, N99, N104, N2753, N2754, N2755, N2756, N2762, 
        N2767, N2768, N2779, N2780, N2781, N2782, N2783, N2784, N2785, N2786, 
        N2787, N2811, N2886, N2887, N2888, N2889, N2890, N2891, N2892, N2899
 );
  input N1, N4, N7, N10, N13, N16, N19, N22, N25, N28, N31, N34, N37, N40, N43,
         N46, N49, N53, N56, N60, N63, N66, N69, N72, N76, N79, N82, N85, N88,
         N91, N94, N99, N104;
  output N2753, N2754, N2755, N2756, N2762, N2767, N2768, N2779, N2780, N2781,
         N2782, N2783, N2784, N2785, N2786, N2787, N2811, N2886, N2887, N2888,
         N2889, N2890, N2891, N2892, N2899;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n102,
         n103, n104, n105, n106, n107, n108, n109, n110, n111, n112, n113,
         n114, n115, n116, n117, n118, n119, n120, n121, n122, n123, n124,
         n125, n126, n127, n128, n129, n130, n131, n132, n133, n134, n135,
         n136, n137, n138, n139, n140, n141, n142, n143, n144, n145, n146,
         n147, n148, n149, n150, n151, n152, n153, n154, n155, n174, n175;

  HS65_LL_XOR3X18 U5 ( .A(n28), .B(n29), .C(n30), .Z(N2892) );
  HS65_LL_XOR3X18 U10 ( .A(n35), .B(n36), .C(n37), .Z(N2891) );
  HS65_LL_NAND4ABX19 U47 ( .A(n77), .B(n78), .C(n79), .D(n76), .Z(N2811) );
  HS65_LL_XNOR2X18 U181 ( .A(N46), .B(n40), .Z(N2768) );
  HS65_LL_XNOR2X18 U182 ( .A(N7), .B(n45), .Z(N2755) );
  HS65_LL_XNOR2X18 U183 ( .A(N19), .B(n26), .Z(N2781) );
  HS65_LL_XNOR2X18 U184 ( .A(N4), .B(n46), .Z(N2754) );
  HS65_LL_XNOR2X18 U185 ( .A(N28), .B(n42), .Z(N2762) );
  HS65_LL_XNOR2X18 U186 ( .A(N1), .B(n47), .Z(N2753) );
  HS65_LL_XNOR2X18 U187 ( .A(N16), .B(n27), .Z(N2780) );
  HS65_LL_XNOR2X18 U188 ( .A(N13), .B(n43), .Z(N2779) );
  HS65_LL_XNOR2X18 U189 ( .A(N22), .B(n25), .Z(N2782) );
  HS65_LL_NAND3X5 U190 ( .A(n4), .B(n9), .C(n91), .Z(n24) );
  HS65_LL_NOR2X6 U191 ( .A(n23), .B(N99), .Z(n52) );
  HS65_LL_IVX9 U192 ( .A(n104), .Z(n5) );
  HS65_LL_IVX9 U194 ( .A(n94), .Z(n6) );
  HS65_LL_AND3X9 U196 ( .A(n84), .B(n9), .C(n83), .Z(n51) );
  HS65_LL_AND2X4 U197 ( .A(n38), .B(n31), .Z(n76) );
  HS65_LL_NOR2AX3 U198 ( .A(n103), .B(n113), .Z(n84) );
  HS65_LL_NOR2X6 U199 ( .A(n113), .B(n103), .Z(n104) );
  HS65_LL_IVX9 U200 ( .A(n117), .Z(n7) );
  HS65_LL_AOI33X5 U201 ( .A(n96), .B(n97), .C(n109), .D(n84), .E(n7), .F(n111), 
        .Z(n114) );
  HS65_LL_NOR3AX2 U202 ( .A(n83), .B(n86), .C(n6), .Z(n48) );
  HS65_LL_IVX9 U203 ( .A(n86), .Z(n9) );
  HS65_LL_IVX9 U204 ( .A(n65), .Z(n3) );
  HS65_LL_NOR2X6 U205 ( .A(n103), .B(n12), .Z(n94) );
  HS65_LL_NOR2AX3 U206 ( .A(n103), .B(n12), .Z(n82) );
  HS65_LL_NAND3X5 U207 ( .A(n85), .B(n102), .C(n84), .Z(n27) );
  HS65_LL_NAND3X5 U208 ( .A(n102), .B(n9), .C(n84), .Z(n43) );
  HS65_LL_IVX9 U209 ( .A(n89), .Z(n4) );
  HS65_LL_NAND3X5 U210 ( .A(n84), .B(n7), .C(n106), .Z(n47) );
  HS65_LL_NOR4ABX2 U211 ( .A(n80), .B(n81), .C(n50), .D(n49), .Z(n31) );
  HS65_LL_NOR2AX3 U212 ( .A(n42), .B(n51), .Z(n80) );
  HS65_LL_NOR4ABX2 U213 ( .A(n40), .B(n24), .C(n41), .D(n48), .Z(n81) );
  HS65_LL_NAND3X5 U214 ( .A(n7), .B(n94), .C(n106), .Z(n44) );
  HS65_LL_NAND3X5 U215 ( .A(n85), .B(n104), .C(n106), .Z(n45) );
  HS65_LL_NAND3X5 U216 ( .A(n82), .B(n102), .C(n7), .Z(n26) );
  HS65_LL_NAND3X5 U217 ( .A(n104), .B(n9), .C(n106), .Z(n46) );
  HS65_LL_IVX9 U219 ( .A(n113), .Z(n12) );
  HS65_LL_NOR4ABX2 U220 ( .A(n45), .B(n44), .C(n174), .D(n175), .Z(n38) );
  HS65_LL_NAND2X7 U221 ( .A(n47), .B(n46), .Z(n174) );
  HS65_LL_NAND4X9 U222 ( .A(n25), .B(n43), .C(n27), .D(n26), .Z(n175) );
  HS65_LL_NAND2X7 U223 ( .A(n95), .B(n85), .Z(n42) );
  HS65_LL_AO33X9 U225 ( .A(n111), .B(n94), .C(n7), .D(n111), .E(n104), .F(n85), 
        .Z(n110) );
  HS65_LL_AND2X4 U226 ( .A(n96), .B(n87), .Z(n83) );
  HS65_LL_IVX2 U227 ( .A(n111), .Z(n1) );
  HS65_LL_AND3X9 U228 ( .A(n82), .B(n4), .C(n87), .Z(n95) );
  HS65_LL_XOR2X18 U229 ( .A(n14), .B(n24), .Z(N2783) );
  HS65_LL_AND2ABX18 U230 ( .A(n52), .B(n58), .Z(N2890) );
  HS65_LLS_XNOR2X6 U231 ( .A(n59), .B(n60), .Z(n58) );
  HS65_LL_AND2ABX18 U233 ( .A(n52), .B(n53), .Z(N2899) );
  HS65_LL_AND2ABX18 U237 ( .A(n52), .B(n66), .Z(N2888) );
  HS65_LLS_XNOR2X6 U238 ( .A(n67), .B(n68), .Z(n66) );
  HS65_LL_NOR2X6 U239 ( .A(n19), .B(n3), .Z(n68) );
  HS65_LL_NOR3X4 U240 ( .A(n117), .B(n5), .C(n99), .Z(n109) );
  HS65_LL_AOI13X5 U242 ( .A(n96), .B(n108), .C(n109), .D(n110), .Z(n79) );
  HS65_LL_NOR3AX2 U243 ( .A(n109), .B(n93), .C(n118), .Z(n77) );
  HS65_LL_OAI311X5 U244 ( .A(n1), .B(n86), .C(n5), .D(n114), .E(n115), .Z(n78)
         );
  HS65_LL_NOR2AX3 U245 ( .A(n105), .B(n93), .Z(n102) );
  HS65_LL_NOR3AX2 U246 ( .A(n96), .B(n93), .C(n99), .Z(n111) );
  HS65_LL_NOR2X6 U247 ( .A(n112), .B(n90), .Z(n85) );
  HS65_LL_NOR2AX3 U248 ( .A(n119), .B(n118), .Z(n96) );
  HS65_LL_CBI4I1X5 U249 ( .A(n59), .B(n22), .C(n61), .D(n140), .Z(n113) );
  HS65_LL_NAND3X5 U250 ( .A(n61), .B(n22), .C(n59), .Z(n140) );
  HS65_LL_CBI4I1X5 U251 ( .A(n74), .B(n22), .C(n75), .D(n122), .Z(n118) );
  HS65_LL_NAND3X5 U252 ( .A(n75), .B(n22), .C(n74), .Z(n122) );
  HS65_LL_NAND2X7 U253 ( .A(n108), .B(n120), .Z(n93) );
  HS65_LL_CBI4I1X5 U254 ( .A(n135), .B(n22), .C(n18), .D(n136), .Z(n103) );
  HS65_LL_NAND3X5 U255 ( .A(n18), .B(n22), .C(n135), .Z(n136) );
  HS65_LLS_XOR2X6 U256 ( .A(n54), .B(n56), .Z(n135) );
  HS65_LL_IVX9 U257 ( .A(N104), .Z(n23) );
  HS65_LL_CBI4I1X5 U258 ( .A(n67), .B(n22), .C(n19), .D(n151), .Z(n112) );
  HS65_LL_NAND3X5 U259 ( .A(n19), .B(n22), .C(n67), .Z(n151) );
  HS65_LLS_XOR2X6 U260 ( .A(n14), .B(n126), .Z(n124) );
  HS65_LL_NAND2X7 U261 ( .A(n90), .B(n112), .Z(n86) );
  HS65_LL_NOR4ABX2 U264 ( .A(n96), .B(n2), .C(n5), .D(n117), .Z(n116) );
  HS65_LL_IVX7 U265 ( .A(n93), .Z(n2) );
  HS65_LL_NAND2X7 U266 ( .A(n118), .B(n119), .Z(n89) );
  HS65_LL_NAND2X7 U267 ( .A(n8), .B(n90), .Z(n117) );
  HS65_LL_NOR2AX3 U268 ( .A(n97), .B(n92), .Z(n87) );
  HS65_LL_NOR2AX3 U269 ( .A(n120), .B(n108), .Z(n97) );
  HS65_LL_NAND4ABX3 U270 ( .A(n90), .B(n8), .C(n104), .D(n102), .Z(n25) );
  HS65_LL_NOR3X4 U271 ( .A(n6), .B(n92), .C(n93), .Z(n91) );
  HS65_LL_AND2ABX18 U272 ( .A(n52), .B(n72), .Z(N2886) );
  HS65_LLS_XOR2X6 U273 ( .A(n73), .B(n74), .Z(n72) );
  HS65_LL_OR2X9 U274 ( .A(n75), .B(n3), .Z(n73) );
  HS65_LL_AND2X4 U275 ( .A(n97), .B(n105), .Z(n106) );
  HS65_LL_NOR3X4 U277 ( .A(n89), .B(n90), .C(n8), .Z(n88) );
  HS65_LL_OAI12X3 U278 ( .A(n15), .B(n21), .C(N104), .Z(n28) );
  HS65_LL_AOI12X2 U279 ( .A(N104), .B(n21), .C(n32), .Z(n29) );
  HS65_LL_XOR2X18 U281 ( .A(n11), .B(n44), .Z(N2756) );
  HS65_LLS_XOR2X6 U282 ( .A(n33), .B(n34), .Z(n32) );
  HS65_LLS_XNOR3X2 U283 ( .A(n141), .B(n142), .C(n143), .Z(n59) );
  HS65_LLS_XOR3X2 U285 ( .A(N37), .B(N28), .C(N19), .Z(n141) );
  HS65_LL_NOR3AX2 U286 ( .A(N60), .B(N104), .C(n16), .Z(n144) );
  HS65_LLS_XNOR3X2 U287 ( .A(N19), .B(N16), .C(N13), .Z(n128) );
  HS65_LLS_XNOR3X2 U288 ( .A(N1), .B(N7), .C(N4), .Z(n127) );
  HS65_LL_XOR2X18 U289 ( .A(N43), .B(n41), .Z(N2767) );
  HS65_LL_XOR2X18 U290 ( .A(N40), .B(n48), .Z(N2787) );
  HS65_LL_XOR2X18 U291 ( .A(N37), .B(n49), .Z(N2786) );
  HS65_LL_XOR2X18 U292 ( .A(N34), .B(n50), .Z(N2785) );
  HS65_LL_XOR2X18 U293 ( .A(N31), .B(n51), .Z(N2784) );
  HS65_LL_OAI32X5 U294 ( .A(n146), .B(N104), .C(n147), .D(n148), .E(n10), .Z(
        n63) );
  HS65_LL_NAND2X7 U295 ( .A(N69), .B(N56), .Z(n146) );
  HS65_LL_NOR3AX2 U296 ( .A(N56), .B(n16), .C(N104), .Z(n148) );
  HS65_LL_IVX9 U297 ( .A(n147), .Z(n10) );
  HS65_LLS_XOR2X6 U298 ( .A(n126), .B(n137), .Z(n34) );
  HS65_LLS_XOR3X2 U299 ( .A(N37), .B(N34), .C(N31), .Z(n137) );
  HS65_LL_NAND3X5 U301 ( .A(N1), .B(N49), .C(n138), .Z(n139) );
  HS65_LL_NOR2X6 U302 ( .A(N104), .B(N72), .Z(n138) );
  HS65_LL_IVX9 U303 ( .A(N94), .Z(n22) );
  HS65_LLS_XOR2X6 U304 ( .A(n39), .B(n123), .Z(n74) );
  HS65_LLS_XOR2X6 U308 ( .A(N25), .B(N40), .Z(n33) );
  HS65_LLS_XNOR2X6 U309 ( .A(N46), .B(n33), .Z(n143) );
  HS65_LL_NAND3X5 U310 ( .A(n107), .B(n23), .C(N99), .Z(n99) );
  HS65_LL_IVX9 U311 ( .A(N10), .Z(n11) );
  HS65_LL_CBI4I6X5 U312 ( .A(n98), .B(N88), .C(n99), .D(n89), .Z(n105) );
  HS65_LL_IVX9 U315 ( .A(N25), .Z(n14) );
  HS65_LLS_XOR3X2 U316 ( .A(n34), .B(n132), .C(n127), .Z(n71) );
  HS65_LL_CBI4I6X5 U317 ( .A(N104), .B(n15), .C(n133), .D(n134), .Z(n132) );
  HS65_LL_NOR3X4 U318 ( .A(n15), .B(N104), .C(n133), .Z(n134) );
  HS65_LLS_XNOR2X6 U319 ( .A(N40), .B(n11), .Z(n133) );
  HS65_LLS_XOR3X2 U320 ( .A(N28), .B(N43), .C(N46), .Z(n126) );
  HS65_LLS_XOR3X2 U321 ( .A(n143), .B(n152), .C(n153), .Z(n67) );
  HS65_LLS_XNOR3X2 U322 ( .A(N22), .B(N4), .C(N31), .Z(n153) );
  HS65_LLS_XNOR2X6 U323 ( .A(N13), .B(n154), .Z(n152) );
  HS65_LL_CBI4I1X5 U324 ( .A(n138), .B(N53), .C(N43), .D(n155), .Z(n154) );
  HS65_LLS_XOR3X2 U325 ( .A(n127), .B(n128), .C(n129), .Z(n39) );
  HS65_LLS_XOR2X6 U326 ( .A(n11), .B(N22), .Z(n129) );
  HS65_LL_NAND3X5 U329 ( .A(n20), .B(n22), .C(n63), .Z(n145) );
  HS65_LL_IVX9 U330 ( .A(N85), .Z(n20) );
  HS65_LL_IVX9 U331 ( .A(N66), .Z(n15) );
  HS65_LL_NAND2X7 U333 ( .A(N69), .B(n22), .Z(n130) );
  HS65_LL_NAND3X5 U335 ( .A(n17), .B(n22), .C(n71), .Z(n131) );
  HS65_LL_IVX9 U336 ( .A(N76), .Z(n17) );
  HS65_LLS_XOR3X2 U337 ( .A(n149), .B(n150), .C(N16), .Z(n147) );
  HS65_LLS_XOR3X2 U339 ( .A(N7), .B(N43), .C(N34), .Z(n149) );
  HS65_LL_AND2ABX18 U340 ( .A(n52), .B(n69), .Z(N2887) );
  HS65_LLS_XOR2X6 U341 ( .A(n70), .B(n71), .Z(n69) );
  HS65_LL_NAND2X7 U342 ( .A(n65), .B(N76), .Z(n70) );
  HS65_LL_NAND2AX7 U343 ( .A(N72), .B(n22), .Z(n121) );
  HS65_LL_AND2ABX18 U344 ( .A(n52), .B(n62), .Z(N2889) );
  HS65_LLS_XOR2X6 U345 ( .A(n63), .B(n64), .Z(n62) );
  HS65_LL_OAI21X3 U348 ( .A(N88), .B(n23), .C(n39), .Z(n35) );
  HS65_LL_OA12X9 U350 ( .A(N91), .B(n98), .C(n99), .Z(n92) );
  HS65_LL_IVX9 U351 ( .A(N79), .Z(n18) );
  HS65_LL_NAND3X5 U352 ( .A(N104), .B(n107), .C(N94), .Z(n98) );
  HS65_LL_NAND2X7 U353 ( .A(N72), .B(N69), .Z(n107) );
  HS65_LL_IVX9 U354 ( .A(N82), .Z(n19) );
  HS65_LL_IVX2 U355 ( .A(N91), .Z(n21) );
  HS65_LL_NAND2X7 U356 ( .A(N53), .B(n121), .Z(n119) );
  HS65_LL_NAND3X2 U193 ( .A(N43), .B(N53), .C(n138), .Z(n155) );
  HS65_LL_IVX2 U195 ( .A(N69), .Z(n16) );
  HS65_LL_NAND2X2 U218 ( .A(N63), .B(n23), .Z(n125) );
  HS65_LL_NOR3X1 U232 ( .A(n3), .B(n56), .C(n18), .Z(n57) );
  HS65_LL_NAND2X2 U234 ( .A(N56), .B(n130), .Z(n61) );
  HS65_LL_NOR2X2 U235 ( .A(n22), .B(n76), .Z(n65) );
  HS65_LL_NAND2X2 U236 ( .A(N49), .B(n121), .Z(n75) );
  HS65_LL_CBI4I6X2 U262 ( .A(n18), .B(n3), .C(n56), .D(n57), .Z(n55) );
  HS65_LL_NOR2X2 U306 ( .A(n61), .B(n3), .Z(n60) );
  HS65_LL_CB4I1X4 U313 ( .A(n71), .B(n22), .C(n17), .D(n131), .Z(n108) );
  HS65_LL_IVX2 U314 ( .A(n112), .Z(n8) );
  HS65_LLS_XOR2X3 U327 ( .A(n54), .B(n55), .Z(n53) );
  HS65_LL_AO12X4 U332 ( .A(N63), .B(N88), .C(n23), .Z(n37) );
  HS65_LL_AND3X4 U334 ( .A(n7), .B(n82), .C(n83), .Z(n49) );
  HS65_LL_NAND2X2 U347 ( .A(n95), .B(n9), .Z(n40) );
  HS65_LLS_XOR2X3 U224 ( .A(N28), .B(N22), .Z(n150) );
  HS65_LL_IVX2 U241 ( .A(n124), .Z(n13) );
  HS65_LLS_XOR2X3 U263 ( .A(n128), .B(n34), .Z(n56) );
  HS65_LLS_XOR2X3 U276 ( .A(N10), .B(n144), .Z(n142) );
  HS65_LL_AOI32X3 U280 ( .A(n124), .B(n23), .C(N63), .D(n13), .E(n125), .Z(
        n123) );
  HS65_LL_NAND2X2 U284 ( .A(N60), .B(n130), .Z(n120) );
  HS65_LL_CBI4I1X3 U300 ( .A(n138), .B(N49), .C(N1), .D(n139), .Z(n54) );
  HS65_LL_NAND2X2 U305 ( .A(n65), .B(N85), .Z(n64) );
  HS65_LL_AOI311X2 U307 ( .A(n4), .B(n2), .C(n109), .D(N104), .E(n116), .Z(
        n115) );
  HS65_LL_CB4I1X4 U328 ( .A(n63), .B(n22), .C(n20), .D(n145), .Z(n90) );
  HS65_LL_OR2X4 U338 ( .A(n31), .B(N104), .Z(n30) );
  HS65_LL_NOR2X2 U346 ( .A(n38), .B(N104), .Z(n36) );
  HS65_LL_AND3X4 U349 ( .A(n84), .B(n85), .C(n83), .Z(n50) );
  HS65_LL_AND3X4 U357 ( .A(n87), .B(n84), .C(n88), .Z(n41) );
endmodule

