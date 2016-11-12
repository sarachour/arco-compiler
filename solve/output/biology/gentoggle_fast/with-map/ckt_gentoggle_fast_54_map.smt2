(set-logic QF_NRA)
(declare-fun __minima__ () Real)
(declare-fun sc_0 () Real)
(assert (> sc_0 1e-08))
(declare-fun of_0 () Real)
(declare-fun sc_1 () Real)
(assert (> sc_1 1e-08))
(declare-fun of_1 () Real)
(declare-fun sc_2 () Real)
(assert (> sc_2 1e-08))
(declare-fun of_2 () Real)
(declare-fun sc_3 () Real)
(assert (> sc_3 1e-08))
(declare-fun of_3 () Real)
; no offset
(assert (= of_0 0.))
; no offset
(assert (= of_1 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_2 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vgain[8].P} {((sc.vgain[8].X/sc.vgain[8].Y)*sc.vgain[8].Z*1.)}
(assert (= sc_3 (* (* (/ sc_0 sc_1) sc_2) 1.)))
; 
; =  {of.vgain[8].P} {0.}
(assert (= of_3 0.))
; 
; >=  {((sc.vgain[8].X*2.)+of.vgain[8].X)} {3300.}
(assert (<= (+ (* sc_0 2.) of_0) 3300.))
; 
; <=  {((sc.vgain[8].X*2.)+of.vgain[8].X)} {0.0001}
(assert (>= (+ (* sc_0 2.) of_0) 0.0001))
; 
; >=  {((sc.vgain[8].Y*1.)+of.vgain[8].Y)} {3300.}
(assert (<= (+ (* sc_1 1.) of_1) 3300.))
; 
; <=  {((sc.vgain[8].Y*1.)+of.vgain[8].Y)} {1.}
(assert (>= (+ (* sc_1 1.) of_1) 1.))
(declare-fun slbot_3 () Real)
(declare-fun sltop_3 () Real)
; 
; =  {(((sc.vgain[8].P*0.)+of.vgain[8].P)+sl.min.vgain[8].P)} {1.51515151515e-12}
(assert (= (+ (+ (* sc_3 0.) of_3) slbot_3) 1.51515151515e-12))
; 
; =  {(((sc.vgain[8].P*3.2768e-06)+of.vgain[8].P)+sl.max.vgain[8].P)} {5445000.}
(assert (= (+ (+ (* sc_3 3.2768e-06) of_3) sltop_3) 5445000.))
(declare-fun slbot_2 () Real)
(declare-fun sltop_2 () Real)
; 
; =  {(((sc.vgain[8].Z*0.)+of.vgain[8].Z)+sl.min.vgain[8].Z)} {0.0001}
(assert (= (+ (+ (* sc_2 0.) of_2) slbot_2) 0.0001))
; 
; =  {(((sc.vgain[8].Z*3.2768e-06)+of.vgain[8].Z)+sl.max.vgain[8].Z)} {3300.}
(assert (= (+ (+ (* sc_2 3.2768e-06) of_2) sltop_2) 3300.))
(declare-fun slbot_3 () Real)
(declare-fun sltop_3 () Real)
; 
; =  {(((sc.vgain[8].P*0.)+of.vgain[8].P)+sl.min.vgain[8].P)} {1.51515151515e-12}
(assert (= (+ (+ (* sc_3 0.) of_3) slbot_3) 1.51515151515e-12))
; 
; =  {(((sc.vgain[8].P*3.2768e-06)+of.vgain[8].P)+sl.max.vgain[8].P)} {5445000.}
(assert (= (+ (+ (* sc_3 3.2768e-06) of_3) sltop_3) 5445000.))
(declare-fun sc_4 () Real)
(assert (> sc_4 1e-08))
(declare-fun of_4 () Real)
(declare-fun sc_5 () Real)
(assert (> sc_5 1e-08))
(declare-fun of_5 () Real)
(declare-fun sc_6 () Real)
(assert (> sc_6 1e-08))
(declare-fun of_6 () Real)
(declare-fun sc_7 () Real)
(assert (> sc_7 1e-08))
(declare-fun of_7 () Real)
(declare-fun sc_8 () Real)
(assert (> sc_8 1e-08))
(declare-fun of_8 () Real)
; no offset
(assert (= of_4 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_5 0.))
; no offset
(assert (= of_6 0.))
; 
; =  {(sc.switch[10].SUB/sc.switch[10].Kmod)} {1.}
(assert (= (/ sc_5 sc_6) 1.))
; no scale
(assert (= (/ sc_5 sc_6) 1.))
; no scale
(assert (= (/ sc_4 1.) 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_7 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.switch[10].PROD} {(sc.switch[10].Vmax/1.)}
(assert (= sc_8 (/ sc_7 1.)))
; 
; =  {of.switch[10].PROD} {0.}
(assert (= of_8 0.))
; 
; >=  {((sc.switch[10].n*1250.)+of.switch[10].n)} {3300.}
(assert (<= (+ (* sc_4 1250.) of_4) 3300.))
; 
; <=  {((sc.switch[10].n*1250.)+of.switch[10].n)} {0.5}
(assert (>= (+ (* sc_4 1250.) of_4) 0.5))
(declare-fun slbot_5 () Real)
(declare-fun sltop_5 () Real)
; 
; =  {(((sc.switch[10].SUB*-1.)+of.switch[10].SUB)+sl.min.switch[10].SUB)} {0.0001}
(assert (= (+ (+ (* sc_5 -1.) of_5) slbot_5) 0.0001))
; 
; =  {(((sc.switch[10].SUB*155.25)+of.switch[10].SUB)+sl.max.switch[10].SUB)} {10.}
(assert (= (+ (+ (* sc_5 155.25) of_5) sltop_5) 10.))
; 
; >=  {((sc.switch[10].Kmod*1.)+of.switch[10].Kmod)} {10.}
(assert (<= (+ (* sc_6 1.) of_6) 10.))
; 
; <=  {((sc.switch[10].Kmod*1.)+of.switch[10].Kmod)} {0.0001}
(assert (>= (+ (* sc_6 1.) of_6) 0.0001))
(declare-fun slbot_8 () Real)
(declare-fun sltop_8 () Real)
; 
; =  {(((sc.switch[10].PROD*0.)+of.switch[10].PROD)+sl.min.switch[10].PROD)} {9.99934002508e-38}
(assert (= (+ (+ (* sc_8 0.) of_8) slbot_8) 9.99934002508e-38))
; 
; =  {(((sc.switch[10].PROD*3.2768e-06)+of.switch[10].PROD)+sl.max.switch[10].PROD)} {9.9999999}
(assert (= (+ (+ (* sc_8 3.2768e-06) of_8) sltop_8) 9.9999999))
; 
; >=  {((sc.switch[10].Vmax*1.)+of.switch[10].Vmax)} {10.}
(assert (<= (+ (* sc_7 1.) of_7) 10.))
; 
; <=  {((sc.switch[10].Vmax*1.)+of.switch[10].Vmax)} {0.0001}
(assert (>= (+ (* sc_7 1.) of_7) 0.0001))
(declare-fun slbot_8 () Real)
(declare-fun sltop_8 () Real)
; 
; =  {(((sc.switch[10].PROD*0.)+of.switch[10].PROD)+sl.min.switch[10].PROD)} {9.99934002508e-38}
(assert (= (+ (+ (* sc_8 0.) of_8) slbot_8) 9.99934002508e-38))
; 
; =  {(((sc.switch[10].PROD*3.2768e-06)+of.switch[10].PROD)+sl.max.switch[10].PROD)} {9.9999999}
(assert (= (+ (+ (* sc_8 3.2768e-06) of_8) sltop_8) 9.9999999))
(declare-fun sc_9 () Real)
(assert (> sc_9 1e-08))
(declare-fun of_9 () Real)
(declare-fun sc_10 () Real)
(assert (> sc_10 1e-08))
(declare-fun of_10 () Real)
(declare-fun sc_11 () Real)
(assert (> sc_11 1e-08))
(declare-fun of_11 () Real)
(declare-fun sc_12 () Real)
(assert (> sc_12 1e-08))
(declare-fun of_12 () Real)
(declare-fun sc_13 () Real)
(assert (> sc_13 1e-08))
(declare-fun of_13 () Real)
; no offset
(assert (= of_9 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_10 0.))
; no offset
(assert (= of_11 0.))
; 
; =  {(sc.switch[14].SUB/sc.switch[14].Kmod)} {1.}
(assert (= (/ sc_10 sc_11) 1.))
; no scale
(assert (= (/ sc_10 sc_11) 1.))
; no scale
(assert (= (/ sc_9 1.) 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_12 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.switch[14].PROD} {(sc.switch[14].Vmax/1.)}
(assert (= sc_13 (/ sc_12 1.)))
; 
; =  {of.switch[14].PROD} {0.}
(assert (= of_13 0.))
; 
; >=  {((sc.switch[14].n*1000.75)+of.switch[14].n)} {3300.}
(assert (<= (+ (* sc_9 1000.75) of_9) 3300.))
; 
; <=  {((sc.switch[14].n*1000.75)+of.switch[14].n)} {0.5}
(assert (>= (+ (* sc_9 1000.75) of_9) 0.5))
(declare-fun slbot_10 () Real)
(declare-fun sltop_10 () Real)
; 
; =  {(((sc.switch[14].SUB*0.)+of.switch[14].SUB)+sl.min.switch[14].SUB)} {0.0001}
(assert (= (+ (+ (* sc_10 0.) of_10) slbot_10) 0.0001))
; 
; =  {(((sc.switch[14].SUB*0.6)+of.switch[14].SUB)+sl.max.switch[14].SUB)} {10.}
(assert (= (+ (+ (* sc_10 0.6) of_10) sltop_10) 10.))
; 
; >=  {((sc.switch[14].Kmod*0.0029618)+of.switch[14].Kmod)} {10.}
(assert (<= (+ (* sc_11 0.0029618) of_11) 10.))
; 
; <=  {((sc.switch[14].Kmod*0.0029618)+of.switch[14].Kmod)} {0.0001}
(assert (>= (+ (* sc_11 0.0029618) of_11) 0.0001))
(declare-fun slbot_13 () Real)
(declare-fun sltop_13 () Real)
; 
; =  {(((sc.switch[14].PROD*0.)+of.switch[14].PROD)+sl.min.switch[14].PROD)} {9.99934002508e-38}
(assert (= (+ (+ (* sc_13 0.) of_13) slbot_13) 9.99934002508e-38))
; 
; =  {(((sc.switch[14].PROD*15.6)+of.switch[14].PROD)+sl.max.switch[14].PROD)} {9.9999999}
(assert (= (+ (+ (* sc_13 15.6) of_13) sltop_13) 9.9999999))
(declare-fun slbot_12 () Real)
(declare-fun sltop_12 () Real)
; 
; =  {(((sc.switch[14].Vmax*0.)+of.switch[14].Vmax)+sl.min.switch[14].Vmax)} {0.0001}
(assert (= (+ (+ (* sc_12 0.) of_12) slbot_12) 0.0001))
; 
; =  {(((sc.switch[14].Vmax*15.6)+of.switch[14].Vmax)+sl.max.switch[14].Vmax)} {10.}
(assert (= (+ (+ (* sc_12 15.6) of_12) sltop_12) 10.))
(declare-fun slbot_13 () Real)
(declare-fun sltop_13 () Real)
; 
; =  {(((sc.switch[14].PROD*0.)+of.switch[14].PROD)+sl.min.switch[14].PROD)} {9.99934002508e-38}
(assert (= (+ (+ (* sc_13 0.) of_13) slbot_13) 9.99934002508e-38))
; 
; =  {(((sc.switch[14].PROD*15.6)+of.switch[14].PROD)+sl.max.switch[14].PROD)} {9.9999999}
(assert (= (+ (+ (* sc_13 15.6) of_13) sltop_13) 9.9999999))
(declare-fun sc_14 () Real)
(assert (> sc_14 1e-08))
(declare-fun of_14 () Real)
(declare-fun sc_15 () Real)
(assert (> sc_15 1e-08))
(declare-fun of_15 () Real)
; 
; =  {sc.input.I[2].O} {sc.input.I[2].X}
(assert (= sc_15 sc_14))
; 
; =  {of.input.I[2].O} {of.input.I[2].X}
(assert (= of_15 of_14))
; 
; >=  {((sc.input.I[2].X*0.)+of.input.I[2].X)} {10.}
(assert (<= (+ (* sc_14 0.) of_14) 10.))
; 
; <=  {((sc.input.I[2].X*0.)+of.input.I[2].X)} {0.}
(assert (>= (+ (* sc_14 0.) of_14) 0.))
; 
; >=  {((sc.input.I[2].O*0.)+of.input.I[2].O)} {10.}
(assert (<= (+ (* sc_15 0.) of_15) 10.))
; 
; <=  {((sc.input.I[2].O*0.)+of.input.I[2].O)} {0.}
(assert (>= (+ (* sc_15 0.) of_15) 0.))
(declare-fun sc_16 () Real)
(assert (> sc_16 1e-08))
(declare-fun of_16 () Real)
(declare-fun sc_17 () Real)
(assert (> sc_17 1e-08))
(declare-fun of_17 () Real)
; 
; =  {sc.input.I[8].O} {sc.input.I[8].X}
(assert (= sc_17 sc_16))
; 
; =  {of.input.I[8].O} {of.input.I[8].X}
(assert (= of_17 of_16))
; 
; >=  {((sc.input.I[8].X*0.)+of.input.I[8].X)} {10.}
(assert (<= (+ (* sc_16 0.) of_16) 10.))
; 
; <=  {((sc.input.I[8].X*0.)+of.input.I[8].X)} {0.}
(assert (>= (+ (* sc_16 0.) of_16) 0.))
; 
; >=  {((sc.input.I[8].O*0.)+of.input.I[8].O)} {10.}
(assert (<= (+ (* sc_17 0.) of_17) 10.))
; 
; <=  {((sc.input.I[8].O*0.)+of.input.I[8].O)} {0.}
(assert (>= (+ (* sc_17 0.) of_17) 0.))
(declare-fun sc_18 () Real)
(assert (> sc_18 1e-08))
(declare-fun of_18 () Real)
(declare-fun sc_19 () Real)
(assert (> sc_19 1e-08))
(declare-fun of_19 () Real)
; 
; =  {sc.input.I[7].O} {sc.input.I[7].X}
(assert (= sc_19 sc_18))
; 
; =  {of.input.I[7].O} {of.input.I[7].X}
(assert (= of_19 of_18))
; 
; >=  {((sc.input.I[7].X*0.)+of.input.I[7].X)} {10.}
(assert (<= (+ (* sc_18 0.) of_18) 10.))
; 
; <=  {((sc.input.I[7].X*0.)+of.input.I[7].X)} {0.}
(assert (>= (+ (* sc_18 0.) of_18) 0.))
; 
; >=  {((sc.input.I[7].O*0.)+of.input.I[7].O)} {10.}
(assert (<= (+ (* sc_19 0.) of_19) 10.))
; 
; <=  {((sc.input.I[7].O*0.)+of.input.I[7].O)} {0.}
(assert (>= (+ (* sc_19 0.) of_19) 0.))
(declare-fun sc_20 () Real)
(assert (> sc_20 1e-08))
(declare-fun of_20 () Real)
(declare-fun sc_21 () Real)
(assert (> sc_21 1e-08))
(declare-fun of_21 () Real)
; 
; =  {sc.input.I[13].O} {sc.input.I[13].X}
(assert (= sc_21 sc_20))
; 
; =  {of.input.I[13].O} {of.input.I[13].X}
(assert (= of_21 of_20))
; 
; >=  {((sc.input.I[13].X*0.0029618)+of.input.I[13].X)} {10.}
(assert (<= (+ (* sc_20 0.0029618) of_20) 10.))
; 
; <=  {((sc.input.I[13].X*0.0029618)+of.input.I[13].X)} {0.}
(assert (>= (+ (* sc_20 0.0029618) of_20) 0.))
; 
; >=  {((sc.input.I[13].O*0.0029618)+of.input.I[13].O)} {10.}
(assert (<= (+ (* sc_21 0.0029618) of_21) 10.))
; 
; <=  {((sc.input.I[13].O*0.0029618)+of.input.I[13].O)} {0.}
(assert (>= (+ (* sc_21 0.0029618) of_21) 0.))
(declare-fun sc_22 () Real)
(assert (> sc_22 1e-08))
(declare-fun of_22 () Real)
(declare-fun sc_23 () Real)
(assert (> sc_23 1e-08))
(declare-fun of_23 () Real)
; 
; =  {sc.input.I[12].O} {sc.input.I[12].X}
(assert (= sc_23 sc_22))
; 
; =  {of.input.I[12].O} {of.input.I[12].X}
(assert (= of_23 of_22))
; 
; >=  {((sc.input.I[12].X*4.)+of.input.I[12].X)} {10.}
(assert (<= (+ (* sc_22 4.) of_22) 10.))
; 
; <=  {((sc.input.I[12].X*4.)+of.input.I[12].X)} {0.}
(assert (>= (+ (* sc_22 4.) of_22) 0.))
; 
; >=  {((sc.input.I[12].O*4.)+of.input.I[12].O)} {10.}
(assert (<= (+ (* sc_23 4.) of_23) 10.))
; 
; <=  {((sc.input.I[12].O*4.)+of.input.I[12].O)} {0.}
(assert (>= (+ (* sc_23 4.) of_23) 0.))
(declare-fun sc_24 () Real)
(assert (> sc_24 1e-08))
(declare-fun of_24 () Real)
(declare-fun sc_25 () Real)
(assert (> sc_25 1e-08))
(declare-fun of_25 () Real)
; 
; =  {sc.input.I[9].O} {sc.input.I[9].X}
(assert (= sc_25 sc_24))
; 
; =  {of.input.I[9].O} {of.input.I[9].X}
(assert (= of_25 of_24))
; 
; >=  {((sc.input.I[9].X*0.)+of.input.I[9].X)} {10.}
(assert (<= (+ (* sc_24 0.) of_24) 10.))
; 
; <=  {((sc.input.I[9].X*0.)+of.input.I[9].X)} {0.}
(assert (>= (+ (* sc_24 0.) of_24) 0.))
; 
; >=  {((sc.input.I[9].O*0.)+of.input.I[9].O)} {10.}
(assert (<= (+ (* sc_25 0.) of_25) 10.))
; 
; <=  {((sc.input.I[9].O*0.)+of.input.I[9].O)} {0.}
(assert (>= (+ (* sc_25 0.) of_25) 0.))
(declare-fun sc_26 () Real)
(assert (> sc_26 1e-08))
(declare-fun of_26 () Real)
(declare-fun sc_27 () Real)
(assert (> sc_27 1e-08))
(declare-fun of_27 () Real)
; 
; =  {sc.input.I[0].O} {sc.input.I[0].X}
(assert (= sc_27 sc_26))
; 
; =  {of.input.I[0].O} {of.input.I[0].X}
(assert (= of_27 of_26))
(declare-fun slbot_26 () Real)
(declare-fun sltop_26 () Real)
; 
; =  {(((sc.input.I[0].X*0.)+of.input.I[0].X)+sl.min.input.I[0].X)} {0.}
(assert (= (+ (+ (* sc_26 0.) of_26) slbot_26) 0.))
; 
; =  {(((sc.input.I[0].X*0.6)+of.input.I[0].X)+sl.max.input.I[0].X)} {10.}
(assert (= (+ (+ (* sc_26 0.6) of_26) sltop_26) 10.))
(declare-fun slbot_27 () Real)
(declare-fun sltop_27 () Real)
; 
; =  {(((sc.input.I[0].O*0.)+of.input.I[0].O)+sl.min.input.I[0].O)} {0.}
(assert (= (+ (+ (* sc_27 0.) of_27) slbot_27) 0.))
; 
; =  {(((sc.input.I[0].O*0.6)+of.input.I[0].O)+sl.max.input.I[0].O)} {10.}
(assert (= (+ (+ (* sc_27 0.6) of_27) sltop_27) 10.))
(declare-fun sc_28 () Real)
(assert (> sc_28 1e-08))
(declare-fun of_28 () Real)
(declare-fun sc_29 () Real)
(assert (> sc_29 1e-08))
(declare-fun of_29 () Real)
; 
; =  {sc.input.I[11].O} {sc.input.I[11].X}
(assert (= sc_29 sc_28))
; 
; =  {of.input.I[11].O} {of.input.I[11].X}
(assert (= of_29 of_28))
; 
; >=  {((sc.input.I[11].X*4.)+of.input.I[11].X)} {10.}
(assert (<= (+ (* sc_28 4.) of_28) 10.))
; 
; <=  {((sc.input.I[11].X*4.)+of.input.I[11].X)} {0.}
(assert (>= (+ (* sc_28 4.) of_28) 0.))
; 
; >=  {((sc.input.I[11].O*4.)+of.input.I[11].O)} {10.}
(assert (<= (+ (* sc_29 4.) of_29) 10.))
; 
; <=  {((sc.input.I[11].O*4.)+of.input.I[11].O)} {0.}
(assert (>= (+ (* sc_29 4.) of_29) 0.))
(declare-fun sc_30 () Real)
(assert (> sc_30 1e-08))
(declare-fun of_30 () Real)
(declare-fun sc_31 () Real)
(assert (> sc_31 1e-08))
(declare-fun of_31 () Real)
; 
; =  {sc.input.I[10].O} {sc.input.I[10].X}
(assert (= sc_31 sc_30))
; 
; =  {of.input.I[10].O} {of.input.I[10].X}
(assert (= of_31 of_30))
; 
; >=  {((sc.input.I[10].X*15.6)+of.input.I[10].X)} {10.}
(assert (<= (+ (* sc_30 15.6) of_30) 10.))
; 
; <=  {((sc.input.I[10].X*15.6)+of.input.I[10].X)} {0.}
(assert (>= (+ (* sc_30 15.6) of_30) 0.))
; 
; >=  {((sc.input.I[10].O*15.6)+of.input.I[10].O)} {10.}
(assert (<= (+ (* sc_31 15.6) of_31) 10.))
; 
; <=  {((sc.input.I[10].O*15.6)+of.input.I[10].O)} {0.}
(assert (>= (+ (* sc_31 15.6) of_31) 0.))
(declare-fun sc_32 () Real)
(assert (> sc_32 1e-08))
(declare-fun of_32 () Real)
(declare-fun sc_33 () Real)
(assert (> sc_33 1e-08))
(declare-fun of_33 () Real)
; 
; =  {sc.input.I[15].O} {sc.input.I[15].X}
(assert (= sc_33 sc_32))
; 
; =  {of.input.I[15].O} {of.input.I[15].X}
(assert (= of_33 of_32))
; 
; >=  {((sc.input.I[15].X*1.)+of.input.I[15].X)} {10.}
(assert (<= (+ (* sc_32 1.) of_32) 10.))
; 
; <=  {((sc.input.I[15].X*1.)+of.input.I[15].X)} {0.}
(assert (>= (+ (* sc_32 1.) of_32) 0.))
; 
; >=  {((sc.input.I[15].O*1.)+of.input.I[15].O)} {10.}
(assert (<= (+ (* sc_33 1.) of_33) 10.))
; 
; <=  {((sc.input.I[15].O*1.)+of.input.I[15].O)} {0.}
(assert (>= (+ (* sc_33 1.) of_33) 0.))
(declare-fun sc_34 () Real)
(assert (> sc_34 1e-08))
(declare-fun of_34 () Real)
(declare-fun sc_35 () Real)
(assert (> sc_35 1e-08))
(declare-fun of_35 () Real)
; 
; =  {sc.input.I[6].O} {sc.input.I[6].X}
(assert (= sc_35 sc_34))
; 
; =  {of.input.I[6].O} {of.input.I[6].X}
(assert (= of_35 of_34))
; 
; >=  {((sc.input.I[6].X*0.)+of.input.I[6].X)} {10.}
(assert (<= (+ (* sc_34 0.) of_34) 10.))
; 
; <=  {((sc.input.I[6].X*0.)+of.input.I[6].X)} {0.}
(assert (>= (+ (* sc_34 0.) of_34) 0.))
; 
; >=  {((sc.input.I[6].O*0.)+of.input.I[6].O)} {10.}
(assert (<= (+ (* sc_35 0.) of_35) 10.))
; 
; <=  {((sc.input.I[6].O*0.)+of.input.I[6].O)} {0.}
(assert (>= (+ (* sc_35 0.) of_35) 0.))
(declare-fun sc_36 () Real)
(assert (> sc_36 1e-08))
(declare-fun of_36 () Real)
(declare-fun sc_37 () Real)
(assert (> sc_37 1e-08))
(declare-fun of_37 () Real)
; 
; =  {sc.input.I[14].O} {sc.input.I[14].X}
(assert (= sc_37 sc_36))
; 
; =  {of.input.I[14].O} {of.input.I[14].X}
(assert (= of_37 of_36))
; 
; >=  {((sc.input.I[14].X*1.)+of.input.I[14].X)} {10.}
(assert (<= (+ (* sc_36 1.) of_36) 10.))
; 
; <=  {((sc.input.I[14].X*1.)+of.input.I[14].X)} {0.}
(assert (>= (+ (* sc_36 1.) of_36) 0.))
; 
; >=  {((sc.input.I[14].O*1.)+of.input.I[14].O)} {10.}
(assert (<= (+ (* sc_37 1.) of_37) 10.))
; 
; <=  {((sc.input.I[14].O*1.)+of.input.I[14].O)} {0.}
(assert (>= (+ (* sc_37 1.) of_37) 0.))
(declare-fun sc_38 () Real)
(assert (> sc_38 1e-08))
(declare-fun of_38 () Real)
(declare-fun sc_39 () Real)
(assert (> sc_39 1e-08))
(declare-fun of_39 () Real)
; 
; =  {sc.input.I[24].O} {sc.input.I[24].X}
(assert (= sc_39 sc_38))
; 
; =  {of.input.I[24].O} {of.input.I[24].X}
(assert (= of_39 of_38))
; 
; >=  {((sc.input.I[24].X*0.)+of.input.I[24].X)} {10.}
(assert (<= (+ (* sc_38 0.) of_38) 10.))
; 
; <=  {((sc.input.I[24].X*0.)+of.input.I[24].X)} {0.}
(assert (>= (+ (* sc_38 0.) of_38) 0.))
; 
; >=  {((sc.input.I[24].O*0.)+of.input.I[24].O)} {10.}
(assert (<= (+ (* sc_39 0.) of_39) 10.))
; 
; <=  {((sc.input.I[24].O*0.)+of.input.I[24].O)} {0.}
(assert (>= (+ (* sc_39 0.) of_39) 0.))
(declare-fun sc_40 () Real)
(assert (> sc_40 1e-08))
(declare-fun of_40 () Real)
(declare-fun sc_41 () Real)
(assert (> sc_41 1e-08))
(declare-fun of_41 () Real)
; 
; =  {sc.input.I[16].O} {sc.input.I[16].X}
(assert (= sc_41 sc_40))
; 
; =  {of.input.I[16].O} {of.input.I[16].X}
(assert (= of_41 of_40))
; 
; >=  {((sc.input.I[16].X*1.)+of.input.I[16].X)} {10.}
(assert (<= (+ (* sc_40 1.) of_40) 10.))
; 
; <=  {((sc.input.I[16].X*1.)+of.input.I[16].X)} {0.}
(assert (>= (+ (* sc_40 1.) of_40) 0.))
; 
; >=  {((sc.input.I[16].O*1.)+of.input.I[16].O)} {10.}
(assert (<= (+ (* sc_41 1.) of_41) 10.))
; 
; <=  {((sc.input.I[16].O*1.)+of.input.I[16].O)} {0.}
(assert (>= (+ (* sc_41 1.) of_41) 0.))
(declare-fun sc_42 () Real)
(assert (> sc_42 1e-08))
(declare-fun of_42 () Real)
(declare-fun sc_43 () Real)
(assert (> sc_43 1e-08))
(declare-fun of_43 () Real)
; 
; =  {sc.input.I[3].O} {sc.input.I[3].X}
(assert (= sc_43 sc_42))
; 
; =  {of.input.I[3].O} {of.input.I[3].X}
(assert (= of_43 of_42))
; 
; >=  {((sc.input.I[3].X*0.)+of.input.I[3].X)} {10.}
(assert (<= (+ (* sc_42 0.) of_42) 10.))
; 
; <=  {((sc.input.I[3].X*0.)+of.input.I[3].X)} {0.}
(assert (>= (+ (* sc_42 0.) of_42) 0.))
; 
; >=  {((sc.input.I[3].O*0.)+of.input.I[3].O)} {10.}
(assert (<= (+ (* sc_43 0.) of_43) 10.))
; 
; <=  {((sc.input.I[3].O*0.)+of.input.I[3].O)} {0.}
(assert (>= (+ (* sc_43 0.) of_43) 0.))
(declare-fun sc_44 () Real)
(assert (> sc_44 1e-08))
(declare-fun of_44 () Real)
(declare-fun sc_45 () Real)
(assert (> sc_45 1e-08))
(declare-fun of_45 () Real)
; 
; =  {sc.input.I[4].O} {sc.input.I[4].X}
(assert (= sc_45 sc_44))
; 
; =  {of.input.I[4].O} {of.input.I[4].X}
(assert (= of_45 of_44))
; 
; >=  {((sc.input.I[4].X*0.)+of.input.I[4].X)} {10.}
(assert (<= (+ (* sc_44 0.) of_44) 10.))
; 
; <=  {((sc.input.I[4].X*0.)+of.input.I[4].X)} {0.}
(assert (>= (+ (* sc_44 0.) of_44) 0.))
; 
; >=  {((sc.input.I[4].O*0.)+of.input.I[4].O)} {10.}
(assert (<= (+ (* sc_45 0.) of_45) 10.))
; 
; <=  {((sc.input.I[4].O*0.)+of.input.I[4].O)} {0.}
(assert (>= (+ (* sc_45 0.) of_45) 0.))
(declare-fun sc_46 () Real)
(assert (> sc_46 1e-08))
(declare-fun of_46 () Real)
(declare-fun sc_47 () Real)
(assert (> sc_47 1e-08))
(declare-fun of_47 () Real)
; 
; =  {sc.input.I[5].O} {sc.input.I[5].X}
(assert (= sc_47 sc_46))
; 
; =  {of.input.I[5].O} {of.input.I[5].X}
(assert (= of_47 of_46))
; 
; >=  {((sc.input.I[5].X*0.)+of.input.I[5].X)} {10.}
(assert (<= (+ (* sc_46 0.) of_46) 10.))
; 
; <=  {((sc.input.I[5].X*0.)+of.input.I[5].X)} {0.}
(assert (>= (+ (* sc_46 0.) of_46) 0.))
; 
; >=  {((sc.input.I[5].O*0.)+of.input.I[5].O)} {10.}
(assert (<= (+ (* sc_47 0.) of_47) 10.))
; 
; <=  {((sc.input.I[5].O*0.)+of.input.I[5].O)} {0.}
(assert (>= (+ (* sc_47 0.) of_47) 0.))
(declare-fun sc_48 () Real)
(assert (> sc_48 1e-08))
(declare-fun of_48 () Real)
(declare-fun sc_49 () Real)
(assert (> sc_49 1e-08))
(declare-fun of_49 () Real)
; 
; =  {sc.input.I[23].O} {sc.input.I[23].X}
(assert (= sc_49 sc_48))
; 
; =  {of.input.I[23].O} {of.input.I[23].X}
(assert (= of_49 of_48))
; 
; >=  {((sc.input.I[23].X*0.)+of.input.I[23].X)} {10.}
(assert (<= (+ (* sc_48 0.) of_48) 10.))
; 
; <=  {((sc.input.I[23].X*0.)+of.input.I[23].X)} {0.}
(assert (>= (+ (* sc_48 0.) of_48) 0.))
; 
; >=  {((sc.input.I[23].O*0.)+of.input.I[23].O)} {10.}
(assert (<= (+ (* sc_49 0.) of_49) 10.))
; 
; <=  {((sc.input.I[23].O*0.)+of.input.I[23].O)} {0.}
(assert (>= (+ (* sc_49 0.) of_49) 0.))
(declare-fun sc_50 () Real)
(assert (> sc_50 1e-08))
(declare-fun of_50 () Real)
(declare-fun sc_51 () Real)
(assert (> sc_51 1e-08))
(declare-fun of_51 () Real)
; 
; =  {sc.input.I[1].O} {sc.input.I[1].X}
(assert (= sc_51 sc_50))
; 
; =  {of.input.I[1].O} {of.input.I[1].X}
(assert (= of_51 of_50))
; 
; >=  {((sc.input.I[1].X*156.25)+of.input.I[1].X)} {10.}
(assert (<= (+ (* sc_50 156.25) of_50) 10.))
; 
; <=  {((sc.input.I[1].X*156.25)+of.input.I[1].X)} {0.}
(assert (>= (+ (* sc_50 156.25) of_50) 0.))
; 
; >=  {((sc.input.I[1].O*156.25)+of.input.I[1].O)} {10.}
(assert (<= (+ (* sc_51 156.25) of_51) 10.))
; 
; <=  {((sc.input.I[1].O*156.25)+of.input.I[1].O)} {0.}
(assert (>= (+ (* sc_51 156.25) of_51) 0.))
(declare-fun sc_52 () Real)
(assert (> sc_52 1e-08))
(declare-fun of_52 () Real)
(declare-fun sc_53 () Real)
(assert (> sc_53 1e-08))
(declare-fun of_53 () Real)
; 
; =  {sc.input.I[17].O} {sc.input.I[17].X}
(assert (= sc_53 sc_52))
; 
; =  {of.input.I[17].O} {of.input.I[17].X}
(assert (= of_53 of_52))
; 
; >=  {((sc.input.I[17].X*1.)+of.input.I[17].X)} {10.}
(assert (<= (+ (* sc_52 1.) of_52) 10.))
; 
; <=  {((sc.input.I[17].X*1.)+of.input.I[17].X)} {0.}
(assert (>= (+ (* sc_52 1.) of_52) 0.))
; 
; >=  {((sc.input.I[17].O*1.)+of.input.I[17].O)} {10.}
(assert (<= (+ (* sc_53 1.) of_53) 10.))
; 
; <=  {((sc.input.I[17].O*1.)+of.input.I[17].O)} {0.}
(assert (>= (+ (* sc_53 1.) of_53) 0.))
(declare-fun sc_54 () Real)
(assert (> sc_54 1e-08))
(declare-fun of_54 () Real)
(declare-fun sc_55 () Real)
(assert (> sc_55 1e-08))
(declare-fun of_55 () Real)
; 
; =  {sc.input.I[18].O} {sc.input.I[18].X}
(assert (= sc_55 sc_54))
; 
; =  {of.input.I[18].O} {of.input.I[18].X}
(assert (= of_55 of_54))
; 
; >=  {((sc.input.I[18].X*1.)+of.input.I[18].X)} {10.}
(assert (<= (+ (* sc_54 1.) of_54) 10.))
; 
; <=  {((sc.input.I[18].X*1.)+of.input.I[18].X)} {0.}
(assert (>= (+ (* sc_54 1.) of_54) 0.))
; 
; >=  {((sc.input.I[18].O*1.)+of.input.I[18].O)} {10.}
(assert (<= (+ (* sc_55 1.) of_55) 10.))
; 
; <=  {((sc.input.I[18].O*1.)+of.input.I[18].O)} {0.}
(assert (>= (+ (* sc_55 1.) of_55) 0.))
(declare-fun sc_56 () Real)
(assert (> sc_56 1e-08))
(declare-fun of_56 () Real)
(declare-fun sc_57 () Real)
(assert (> sc_57 1e-08))
(declare-fun of_57 () Real)
; 
; =  {sc.input.I[22].O} {sc.input.I[22].X}
(assert (= sc_57 sc_56))
; 
; =  {of.input.I[22].O} {of.input.I[22].X}
(assert (= of_57 of_56))
; 
; >=  {((sc.input.I[22].X*0.)+of.input.I[22].X)} {10.}
(assert (<= (+ (* sc_56 0.) of_56) 10.))
; 
; <=  {((sc.input.I[22].X*0.)+of.input.I[22].X)} {0.}
(assert (>= (+ (* sc_56 0.) of_56) 0.))
; 
; >=  {((sc.input.I[22].O*0.)+of.input.I[22].O)} {10.}
(assert (<= (+ (* sc_57 0.) of_57) 10.))
; 
; <=  {((sc.input.I[22].O*0.)+of.input.I[22].O)} {0.}
(assert (>= (+ (* sc_57 0.) of_57) 0.))
(declare-fun sc_58 () Real)
(assert (> sc_58 1e-08))
(declare-fun of_58 () Real)
(declare-fun sc_59 () Real)
(assert (> sc_59 1e-08))
(declare-fun of_59 () Real)
; 
; =  {sc.output.V[0].O} {sc.output.V[0].X}
(assert (= sc_59 sc_58))
; 
; =  {of.output.V[0].O} {of.output.V[0].X}
(assert (= of_59 of_58))
(declare-fun slbot_58 () Real)
(declare-fun sltop_58 () Real)
; 
; =  {(((sc.output.V[0].X*0.)+of.output.V[0].X)+sl.min.output.V[0].X)} {0.0001}
(assert (= (+ (+ (* sc_58 0.) of_58) slbot_58) 0.0001))
; 
; =  {(((sc.output.V[0].X*156.25)+of.output.V[0].X)+sl.max.output.V[0].X)} {3300.}
(assert (= (+ (+ (* sc_58 156.25) of_58) sltop_58) 3300.))
(declare-fun slbot_59 () Real)
(declare-fun sltop_59 () Real)
; 
; =  {(((sc.output.V[0].O*0.)+of.output.V[0].O)+sl.min.output.V[0].O)} {0.0001}
(assert (= (+ (+ (* sc_59 0.) of_59) slbot_59) 0.0001))
; 
; =  {(((sc.output.V[0].O*156.25)+of.output.V[0].O)+sl.max.output.V[0].O)} {3300.}
(assert (= (+ (+ (* sc_59 156.25) of_59) sltop_59) 3300.))
(declare-fun sc_60 () Real)
(assert (> sc_60 1e-08))
(declare-fun of_60 () Real)
(declare-fun sc_61 () Real)
(assert (> sc_61 1e-08))
(declare-fun of_61 () Real)
; 
; =  {sc.output.V[1].O} {sc.output.V[1].X}
(assert (= sc_61 sc_60))
; 
; =  {of.output.V[1].O} {of.output.V[1].X}
(assert (= of_61 of_60))
(declare-fun slbot_60 () Real)
(declare-fun sltop_60 () Real)
; 
; =  {(((sc.output.V[1].X*0.)+of.output.V[1].X)+sl.min.output.V[1].X)} {0.0001}
(assert (= (+ (+ (* sc_60 0.) of_60) slbot_60) 0.0001))
; 
; =  {(((sc.output.V[1].X*15.6)+of.output.V[1].X)+sl.max.output.V[1].X)} {3300.}
(assert (= (+ (+ (* sc_60 15.6) of_60) sltop_60) 3300.))
(declare-fun slbot_61 () Real)
(declare-fun sltop_61 () Real)
; 
; =  {(((sc.output.V[1].O*0.)+of.output.V[1].O)+sl.min.output.V[1].O)} {0.0001}
(assert (= (+ (+ (* sc_61 0.) of_61) slbot_61) 0.0001))
; 
; =  {(((sc.output.V[1].O*15.6)+of.output.V[1].O)+sl.max.output.V[1].O)} {3300.}
(assert (= (+ (+ (* sc_61 15.6) of_61) sltop_61) 3300.))
(declare-fun sc_62 () Real)
(assert (> sc_62 1e-08))
(declare-fun of_62 () Real)
(declare-fun sc_63 () Real)
(assert (> sc_63 1e-08))
(declare-fun of_63 () Real)
(declare-fun sc_64 () Real)
(assert (> sc_64 1e-08))
(declare-fun of_64 () Real)
(declare-fun sc_65 () Real)
(assert (> sc_65 1e-08))
(declare-fun of_65 () Real)
(declare-fun sc_66 () Real)
(assert (> sc_66 1e-08))
(declare-fun of_66 () Real)
(declare-fun sc_67 () Real)
(assert (> sc_67 1e-08))
(declare-fun of_67 () Real)
(declare-fun sc_68 () Real)
(assert (> sc_68 1e-08))
(declare-fun of_68 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_63 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_64 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_66 0.))
; 
; =  {sc.vadd[13].A} {(1.*sc.vadd[13].B)}
(assert (= sc_65 (* 1. sc_66)))
; 
; =  {sc.vadd[13].A} {(1.*sc.vadd[13].C)} {(1.*sc.vadd[13].D)}
(assert (and (= sc_65 (* 1. sc_64)) (= sc_65 (* 1. sc_63))))
; no offset
(assert (= (- (+ of_65 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[13].OUT} {(sc.vadd[13].A*1.)}
(assert (= sc_67 (* sc_65 1.)))
; 
; =  {of.vadd[13].OUT} {0.}
(assert (= of_67 0.))
; no scale
(assert (= sc_63 1.))
; no scale
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_63 0.))
; no offset
(assert (= of_68 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_64 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_66 0.))
; 
; =  {sc.vadd[13].A} {(1.*sc.vadd[13].B)}
(assert (= sc_65 (* 1. sc_66)))
; 
; =  {sc.vadd[13].A} {(1.*sc.vadd[13].C)} {(1.*sc.vadd[13].D*sc.vadd[13].OUT2)}
(assert (and (= sc_65 (* 1. sc_64)) (= sc_65 (* (* 1. sc_63) sc_68))))
; no offset
(assert (= (- (+ of_65 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[13].OUT2} {(sc.vadd[13].A*1.)}
(assert (= sc_68 (* sc_65 1.)))
; no offset
(assert (= of_68 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[13].OUT2_0} {(sc.vadd[13].A*1.)}
(assert (= sc_62 (* sc_65 1.)))
; 
; =  {of.vadd[13].OUT2_0} {0.}
(assert (= of_62 0.))
; 
; >=  {((sc.vadd[13].OUT2_0*0.)+of.vadd[13].OUT2_0)} {3300.}
(assert (<= (+ (* sc_62 0.) of_62) 3300.))
; 
; <=  {((sc.vadd[13].OUT2_0*0.)+of.vadd[13].OUT2_0)} {0.}
(assert (>= (+ (* sc_62 0.) of_62) 0.))
; 
; >=  {((sc.vadd[13].D*4.)+of.vadd[13].D)} {3300.}
(assert (<= (+ (* sc_63 4.) of_63) 3300.))
; 
; <=  {((sc.vadd[13].D*4.)+of.vadd[13].D)} {0.}
(assert (>= (+ (* sc_63 4.) of_63) 0.))
; 
; >=  {((sc.vadd[13].C*0.)+of.vadd[13].C)} {3300.}
(assert (<= (+ (* sc_64 0.) of_64) 3300.))
; 
; <=  {((sc.vadd[13].C*0.)+of.vadd[13].C)} {0.}
(assert (>= (+ (* sc_64 0.) of_64) 0.))
; 
; >=  {((sc.vadd[13].A*0.)+of.vadd[13].A)} {3300.}
(assert (<= (+ (* sc_65 0.) of_65) 3300.))
; 
; <=  {((sc.vadd[13].A*0.)+of.vadd[13].A)} {0.}
(assert (>= (+ (* sc_65 0.) of_65) 0.))
(declare-fun slbot_68 () Real)
(declare-fun sltop_68 () Real)
; 
; =  {(((sc.vadd[13].OUT2*0.)+of.vadd[13].OUT2)+sl.min.vadd[13].OUT2)} {0.}
(assert (= (+ (+ (* sc_68 0.) of_68) slbot_68) 0.))
; 
; =  {(((sc.vadd[13].OUT2*15.6)+of.vadd[13].OUT2)+sl.max.vadd[13].OUT2)} {3300.}
(assert (= (+ (+ (* sc_68 15.6) of_68) sltop_68) 3300.))
(declare-fun slbot_66 () Real)
(declare-fun sltop_66 () Real)
; 
; =  {(((sc.vadd[13].B*0.00204799328914)+of.vadd[13].B)+sl.min.vadd[13].B)} {0.}
(assert (= (+ (+ (* sc_66 0.00204799328914) of_66) slbot_66) 0.))
; 
; =  {(((sc.vadd[13].B*625.)+of.vadd[13].B)+sl.max.vadd[13].B)} {3300.}
(assert (= (+ (+ (* sc_66 625.) of_66) sltop_66) 3300.))
(declare-fun slbot_67 () Real)
(declare-fun sltop_67 () Real)
; 
; =  {(((sc.vadd[13].OUT*0.00204799328914)+of.vadd[13].OUT)+sl.min.vadd[13].OUT)} {-1650.}
(assert (= (+ (+ (* sc_67 0.00204799328914) of_67) slbot_67) -1650.))
; 
; =  {(((sc.vadd[13].OUT*625.)+of.vadd[13].OUT)+sl.max.vadd[13].OUT)} {1650.}
(assert (= (+ (+ (* sc_67 625.) of_67) sltop_67) 1650.))
(declare-fun slbot_68 () Real)
(declare-fun sltop_68 () Real)
; 
; =  {(((sc.vadd[13].OUT2*0.)+of.vadd[13].OUT2)+sl.min.vadd[13].OUT2)} {0.}
(assert (= (+ (+ (* sc_68 0.) of_68) slbot_68) 0.))
; 
; =  {(((sc.vadd[13].OUT2*15.6)+of.vadd[13].OUT2)+sl.max.vadd[13].OUT2)} {3300.}
(assert (= (+ (+ (* sc_68 15.6) of_68) sltop_68) 3300.))
(declare-fun sc_69 () Real)
(assert (> sc_69 1e-08))
(declare-fun of_69 () Real)
(declare-fun sc_70 () Real)
(assert (> sc_70 1e-08))
(declare-fun of_70 () Real)
(declare-fun sc_71 () Real)
(assert (> sc_71 1e-08))
(declare-fun of_71 () Real)
(declare-fun sc_72 () Real)
(assert (> sc_72 1e-08))
(declare-fun of_72 () Real)
(declare-fun sc_73 () Real)
(assert (> sc_73 1e-08))
(declare-fun of_73 () Real)
(declare-fun sc_74 () Real)
(assert (> sc_74 1e-08))
(declare-fun of_74 () Real)
(declare-fun sc_75 () Real)
(assert (> sc_75 1e-08))
(declare-fun of_75 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_70 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_71 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_73 0.))
; 
; =  {sc.vadd[1].A} {(1.*sc.vadd[1].B)}
(assert (= sc_72 (* 1. sc_73)))
; 
; =  {sc.vadd[1].A} {(1.*sc.vadd[1].C)} {(1.*sc.vadd[1].D)}
(assert (and (= sc_72 (* 1. sc_71)) (= sc_72 (* 1. sc_70))))
; no offset
(assert (= (- (+ of_72 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[1].OUT} {(sc.vadd[1].A*1.)}
(assert (= sc_74 (* sc_72 1.)))
; 
; =  {of.vadd[1].OUT} {0.}
(assert (= of_74 0.))
; no scale
(assert (= sc_70 1.))
; no scale
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_70 0.))
; no offset
(assert (= of_75 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_71 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_73 0.))
; 
; =  {sc.vadd[1].A} {(1.*sc.vadd[1].B)}
(assert (= sc_72 (* 1. sc_73)))
; 
; =  {sc.vadd[1].A} {(1.*sc.vadd[1].C)} {(1.*sc.vadd[1].D*sc.vadd[1].OUT2)}
(assert (and (= sc_72 (* 1. sc_71)) (= sc_72 (* (* 1. sc_70) sc_75))))
; no offset
(assert (= (- (+ of_72 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[1].OUT2} {(sc.vadd[1].A*1.)}
(assert (= sc_75 (* sc_72 1.)))
; no offset
(assert (= of_75 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[1].OUT2_0} {(sc.vadd[1].A*1.)}
(assert (= sc_69 (* sc_72 1.)))
; 
; =  {of.vadd[1].OUT2_0} {0.}
(assert (= of_69 0.))
; 
; >=  {((sc.vadd[1].OUT2_0*0.)+of.vadd[1].OUT2_0)} {3300.}
(assert (<= (+ (* sc_69 0.) of_69) 3300.))
; 
; <=  {((sc.vadd[1].OUT2_0*0.)+of.vadd[1].OUT2_0)} {0.}
(assert (>= (+ (* sc_69 0.) of_69) 0.))
; 
; >=  {((sc.vadd[1].D*4.)+of.vadd[1].D)} {3300.}
(assert (<= (+ (* sc_70 4.) of_70) 3300.))
; 
; <=  {((sc.vadd[1].D*4.)+of.vadd[1].D)} {0.}
(assert (>= (+ (* sc_70 4.) of_70) 0.))
; 
; >=  {((sc.vadd[1].C*0.)+of.vadd[1].C)} {3300.}
(assert (<= (+ (* sc_71 0.) of_71) 3300.))
; 
; <=  {((sc.vadd[1].C*0.)+of.vadd[1].C)} {0.}
(assert (>= (+ (* sc_71 0.) of_71) 0.))
; 
; >=  {((sc.vadd[1].A*0.)+of.vadd[1].A)} {3300.}
(assert (<= (+ (* sc_72 0.) of_72) 3300.))
; 
; <=  {((sc.vadd[1].A*0.)+of.vadd[1].A)} {0.}
(assert (>= (+ (* sc_72 0.) of_72) 0.))
(declare-fun slbot_75 () Real)
(declare-fun sltop_75 () Real)
; 
; =  {(((sc.vadd[1].OUT2*0.)+of.vadd[1].OUT2)+sl.min.vadd[1].OUT2)} {0.}
(assert (= (+ (+ (* sc_75 0.) of_75) slbot_75) 0.))
; 
; =  {(((sc.vadd[1].OUT2*156.25)+of.vadd[1].OUT2)+sl.max.vadd[1].OUT2)} {3300.}
(assert (= (+ (+ (* sc_75 156.25) of_75) sltop_75) 3300.))
(declare-fun slbot_73 () Real)
(declare-fun sltop_73 () Real)
; 
; =  {(((sc.vadd[1].B*3.75903614458)+of.vadd[1].B)+sl.min.vadd[1].B)} {0.}
(assert (= (+ (+ (* sc_73 3.75903614458) of_73) slbot_73) 0.))
; 
; =  {(((sc.vadd[1].B*62.4)+of.vadd[1].B)+sl.max.vadd[1].B)} {3300.}
(assert (= (+ (+ (* sc_73 62.4) of_73) sltop_73) 3300.))
(declare-fun slbot_74 () Real)
(declare-fun sltop_74 () Real)
; 
; =  {(((sc.vadd[1].OUT*3.75903614458)+of.vadd[1].OUT)+sl.min.vadd[1].OUT)} {-1650.}
(assert (= (+ (+ (* sc_74 3.75903614458) of_74) slbot_74) -1650.))
; 
; =  {(((sc.vadd[1].OUT*62.4)+of.vadd[1].OUT)+sl.max.vadd[1].OUT)} {1650.}
(assert (= (+ (+ (* sc_74 62.4) of_74) sltop_74) 1650.))
(declare-fun slbot_75 () Real)
(declare-fun sltop_75 () Real)
; 
; =  {(((sc.vadd[1].OUT2*0.)+of.vadd[1].OUT2)+sl.min.vadd[1].OUT2)} {0.}
(assert (= (+ (+ (* sc_75 0.) of_75) slbot_75) 0.))
; 
; =  {(((sc.vadd[1].OUT2*156.25)+of.vadd[1].OUT2)+sl.max.vadd[1].OUT2)} {3300.}
(assert (= (+ (+ (* sc_75 156.25) of_75) sltop_75) 3300.))
(declare-fun sc_76 () Real)
(assert (> sc_76 1e-08))
(declare-fun of_76 () Real)
(declare-fun sc_77 () Real)
(assert (> sc_77 1e-08))
(declare-fun of_77 () Real)
(declare-fun sc_78 () Real)
(assert (> sc_78 1e-08))
(declare-fun of_78 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_77 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_76 0.))
; 
; =  {sc.vtoi[7].Y} {((1./sc.vtoi[7].K)*sc.vtoi[7].X)}
(assert (= sc_78 (* (/ 1. sc_77) sc_76)))
; 
; =  {of.vtoi[7].Y} {0.}
(assert (= of_78 0.))
; 
; >=  {((sc.vtoi[7].X*1.)+of.vtoi[7].X)} {3300.}
(assert (<= (+ (* sc_76 1.) of_76) 3300.))
; 
; <=  {((sc.vtoi[7].X*1.)+of.vtoi[7].X)} {1.}
(assert (>= (+ (* sc_76 1.) of_76) 1.))
(declare-fun slbot_78 () Real)
(declare-fun sltop_78 () Real)
; 
; =  {(((sc.vtoi[7].Y*0.)+of.vtoi[7].Y)+sl.min.vtoi[7].Y)} {0.00030303030303}
(assert (= (+ (+ (* sc_78 0.) of_78) slbot_78) 0.00030303030303))
; 
; =  {(((sc.vtoi[7].Y*305175.78125)+of.vtoi[7].Y)+sl.max.vtoi[7].Y)} {3300.}
(assert (= (+ (+ (* sc_78 305175.78125) of_78) sltop_78) 3300.))
(declare-fun slbot_77 () Real)
(declare-fun sltop_77 () Real)
; 
; =  {(((sc.vtoi[7].K*0.)+of.vtoi[7].K)+sl.min.vtoi[7].K)} {1.}
(assert (= (+ (+ (* sc_77 0.) of_77) slbot_77) 1.))
; 
; =  {(((sc.vtoi[7].K*3.2768e-06)+of.vtoi[7].K)+sl.max.vtoi[7].K)} {3300.}
(assert (= (+ (+ (* sc_77 3.2768e-06) of_77) sltop_77) 3300.))
(declare-fun slbot_78 () Real)
(declare-fun sltop_78 () Real)
; 
; =  {(((sc.vtoi[7].Y*0.)+of.vtoi[7].Y)+sl.min.vtoi[7].Y)} {0.00030303030303}
(assert (= (+ (+ (* sc_78 0.) of_78) slbot_78) 0.00030303030303))
; 
; =  {(((sc.vtoi[7].Y*305175.78125)+of.vtoi[7].Y)+sl.max.vtoi[7].Y)} {3300.}
(assert (= (+ (+ (* sc_78 305175.78125) of_78) sltop_78) 3300.))
(declare-fun sc_79 () Real)
(assert (> sc_79 1e-08))
(declare-fun of_79 () Real)
(declare-fun sc_80 () Real)
(assert (> sc_80 1e-08))
(declare-fun of_80 () Real)
(declare-fun sc_81 () Real)
(assert (> sc_81 1e-08))
(declare-fun of_81 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_80 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_79 0.))
; 
; =  {sc.vtoi[3].Y} {((1./sc.vtoi[3].K)*sc.vtoi[3].X)}
(assert (= sc_81 (* (/ 1. sc_80) sc_79)))
; 
; =  {of.vtoi[3].Y} {0.}
(assert (= of_81 0.))
(declare-fun slbot_79 () Real)
(declare-fun sltop_79 () Real)
; 
; =  {(((sc.vtoi[3].X*0.)+of.vtoi[3].X)+sl.min.vtoi[3].X)} {1.}
(assert (= (+ (+ (* sc_79 0.) of_79) slbot_79) 1.))
; 
; =  {(((sc.vtoi[3].X*156.25)+of.vtoi[3].X)+sl.max.vtoi[3].X)} {3300.}
(assert (= (+ (+ (* sc_79 156.25) of_79) sltop_79) 3300.))
(declare-fun slbot_81 () Real)
(declare-fun sltop_81 () Real)
; 
; =  {(((sc.vtoi[3].Y*-156.25)+of.vtoi[3].Y)+sl.min.vtoi[3].Y)} {0.00030303030303}
(assert (= (+ (+ (* sc_81 -156.25) of_81) slbot_81) 0.00030303030303))
; 
; =  {(((sc.vtoi[3].Y*0.)+of.vtoi[3].Y)+sl.max.vtoi[3].Y)} {3300.}
(assert (= (+ (+ (* sc_81 0.) of_81) sltop_81) 3300.))
; 
; >=  {((sc.vtoi[3].K*-1.)+of.vtoi[3].K)} {3300.}
(assert (<= (+ (* sc_80 -1.) of_80) 3300.))
; 
; <=  {((sc.vtoi[3].K*-1.)+of.vtoi[3].K)} {1.}
(assert (>= (+ (* sc_80 -1.) of_80) 1.))
(declare-fun sc_82 () Real)
(assert (> sc_82 1e-08))
(declare-fun of_82 () Real)
(declare-fun sc_83 () Real)
(assert (> sc_83 1e-08))
(declare-fun of_83 () Real)
(declare-fun sc_84 () Real)
(assert (> sc_84 1e-08))
(declare-fun of_84 () Real)
(declare-fun sc_85 () Real)
(assert (> sc_85 1e-08))
(declare-fun of_85 () Real)
; no offset
(assert (= of_83 0.))
; no offset
(assert (= of_82 0.))
; 
; =  {1.} {(sc.igenebind[2].K*sc.igenebind[2].TF)}
(assert (= 1. (* sc_83 sc_82)))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_84 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.igenebind[2].GE} {(sc.igenebind[2].Vmax*(1./1.))}
(assert (= sc_85 (* sc_84 (/ 1. 1.))))
; 
; =  {of.igenebind[2].GE} {0.}
(assert (= of_85 0.))
; 
; >=  {((sc.igenebind[2].TF*1.)+of.igenebind[2].TF)} {10.}
(assert (<= (+ (* sc_82 1.) of_82) 10.))
; 
; <=  {((sc.igenebind[2].TF*1.)+of.igenebind[2].TF)} {0.0001}
(assert (>= (+ (* sc_82 1.) of_82) 0.0001))
(declare-fun slbot_83 () Real)
(declare-fun sltop_83 () Real)
; 
; =  {(((sc.igenebind[2].K*0.)+of.igenebind[2].K)+sl.min.igenebind[2].K)} {0.0001}
(assert (= (+ (+ (* sc_83 0.) of_83) slbot_83) 0.0001))
; 
; =  {(((sc.igenebind[2].K*15.6)+of.igenebind[2].K)+sl.max.igenebind[2].K)} {10.}
(assert (= (+ (+ (* sc_83 15.6) of_83) sltop_83) 10.))
(declare-fun slbot_85 () Real)
(declare-fun sltop_85 () Real)
; 
; =  {(((sc.igenebind[2].GE*0.939759036145)+of.igenebind[2].GE)+sl.min.igenebind[2].GE)} {9.90099009901e-07}
(assert (= (+ (+ (* sc_85 0.939759036145) of_85) slbot_85) 9.90099009901e-07))
; 
; =  {(((sc.igenebind[2].GE*15.6)+of.igenebind[2].GE)+sl.max.igenebind[2].GE)} {9.9999999}
(assert (= (+ (+ (* sc_85 15.6) of_85) sltop_85) 9.9999999))
; 
; >=  {((sc.igenebind[2].Vmax*15.6)+of.igenebind[2].Vmax)} {10.}
(assert (<= (+ (* sc_84 15.6) of_84) 10.))
; 
; <=  {((sc.igenebind[2].Vmax*15.6)+of.igenebind[2].Vmax)} {0.0001}
(assert (>= (+ (* sc_84 15.6) of_84) 0.0001))
(declare-fun sc_86 () Real)
(assert (> sc_86 1e-08))
(declare-fun of_86 () Real)
(declare-fun sc_87 () Real)
(assert (> sc_87 1e-08))
(declare-fun of_87 () Real)
(declare-fun sc_88 () Real)
(assert (> sc_88 1e-08))
(declare-fun of_88 () Real)
(declare-fun sc_89 () Real)
(assert (> sc_89 1e-08))
(declare-fun of_89 () Real)
; no offset
(assert (= of_87 0.))
; no offset
(assert (= of_86 0.))
; 
; =  {1.} {(sc.igenebind[4].K*sc.igenebind[4].TF)}
(assert (= 1. (* sc_87 sc_86)))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_88 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.igenebind[4].GE} {(sc.igenebind[4].Vmax*(1./1.))}
(assert (= sc_89 (* sc_88 (/ 1. 1.))))
; 
; =  {of.igenebind[4].GE} {0.}
(assert (= of_89 0.))
(declare-fun slbot_86 () Real)
(declare-fun sltop_86 () Real)
; 
; =  {(((sc.igenebind[4].TF*0.)+of.igenebind[4].TF)+sl.min.igenebind[4].TF)} {0.0001}
(assert (= (+ (+ (* sc_86 0.) of_86) slbot_86) 0.0001))
; 
; =  {(((sc.igenebind[4].TF*305175.78125)+of.igenebind[4].TF)+sl.max.igenebind[4].TF)} {10.}
(assert (= (+ (+ (* sc_86 305175.78125) of_86) sltop_86) 10.))
; 
; >=  {((sc.igenebind[4].K*1.)+of.igenebind[4].K)} {10.}
(assert (<= (+ (* sc_87 1.) of_87) 10.))
; 
; <=  {((sc.igenebind[4].K*1.)+of.igenebind[4].K)} {0.0001}
(assert (>= (+ (* sc_87 1.) of_87) 0.0001))
(declare-fun slbot_89 () Real)
(declare-fun sltop_89 () Real)
; 
; =  {(((sc.igenebind[4].GE*0.000511998322284)+of.igenebind[4].GE)+sl.min.igenebind[4].GE)} {9.90099009901e-07}
(assert (= (+ (+ (* sc_89 0.000511998322284) of_89) slbot_89) 9.90099009901e-07))
; 
; =  {(((sc.igenebind[4].GE*156.25)+of.igenebind[4].GE)+sl.max.igenebind[4].GE)} {9.9999999}
(assert (= (+ (+ (* sc_89 156.25) of_89) sltop_89) 9.9999999))
; 
; >=  {((sc.igenebind[4].Vmax*156.25)+of.igenebind[4].Vmax)} {10.}
(assert (<= (+ (* sc_88 156.25) of_88) 10.))
; 
; <=  {((sc.igenebind[4].Vmax*156.25)+of.igenebind[4].Vmax)} {0.0001}
(assert (>= (+ (* sc_88 156.25) of_88) 0.0001))
(declare-fun slbot_89 () Real)
(declare-fun sltop_89 () Real)
; 
; =  {(((sc.igenebind[4].GE*0.000511998322284)+of.igenebind[4].GE)+sl.min.igenebind[4].GE)} {9.90099009901e-07}
(assert (= (+ (+ (* sc_89 0.000511998322284) of_89) slbot_89) 9.90099009901e-07))
; 
; =  {(((sc.igenebind[4].GE*156.25)+of.igenebind[4].GE)+sl.max.igenebind[4].GE)} {9.9999999}
(assert (= (+ (+ (* sc_89 156.25) of_89) sltop_89) 9.9999999))
(declare-fun sc_90 () Real)
(assert (> sc_90 1e-08))
(declare-fun of_90 () Real)
(declare-fun sc_91 () Real)
(assert (> sc_91 1e-08))
(declare-fun of_91 () Real)
; 
; =  {sc.input.V[2].O} {sc.input.V[2].X}
(assert (= sc_91 sc_90))
; 
; =  {of.input.V[2].O} {of.input.V[2].X}
(assert (= of_91 of_90))
; 
; >=  {((sc.input.V[2].X*0.)+of.input.V[2].X)} {3300.}
(assert (<= (+ (* sc_90 0.) of_90) 3300.))
; 
; <=  {((sc.input.V[2].X*0.)+of.input.V[2].X)} {0.}
(assert (>= (+ (* sc_90 0.) of_90) 0.))
; 
; >=  {((sc.input.V[2].O*0.)+of.input.V[2].O)} {3300.}
(assert (<= (+ (* sc_91 0.) of_91) 3300.))
; 
; <=  {((sc.input.V[2].O*0.)+of.input.V[2].O)} {0.}
(assert (>= (+ (* sc_91 0.) of_91) 0.))
(declare-fun sc_92 () Real)
(assert (> sc_92 1e-08))
(declare-fun of_92 () Real)
(declare-fun sc_93 () Real)
(assert (> sc_93 1e-08))
(declare-fun of_93 () Real)
; 
; =  {sc.input.V[8].O} {sc.input.V[8].X}
(assert (= sc_93 sc_92))
; 
; =  {of.input.V[8].O} {of.input.V[8].X}
(assert (= of_93 of_92))
; 
; >=  {((sc.input.V[8].X*-1.)+of.input.V[8].X)} {3300.}
(assert (<= (+ (* sc_92 -1.) of_92) 3300.))
; 
; <=  {((sc.input.V[8].X*-1.)+of.input.V[8].X)} {0.}
(assert (>= (+ (* sc_92 -1.) of_92) 0.))
; 
; >=  {((sc.input.V[8].O*-1.)+of.input.V[8].O)} {3300.}
(assert (<= (+ (* sc_93 -1.) of_93) 3300.))
; 
; <=  {((sc.input.V[8].O*-1.)+of.input.V[8].O)} {0.}
(assert (>= (+ (* sc_93 -1.) of_93) 0.))
(declare-fun sc_94 () Real)
(assert (> sc_94 1e-08))
(declare-fun of_94 () Real)
(declare-fun sc_95 () Real)
(assert (> sc_95 1e-08))
(declare-fun of_95 () Real)
; 
; =  {sc.input.V[7].O} {sc.input.V[7].X}
(assert (= sc_95 sc_94))
; 
; =  {of.input.V[7].O} {of.input.V[7].X}
(assert (= of_95 of_94))
; 
; >=  {((sc.input.V[7].X*0.)+of.input.V[7].X)} {3300.}
(assert (<= (+ (* sc_94 0.) of_94) 3300.))
; 
; <=  {((sc.input.V[7].X*0.)+of.input.V[7].X)} {0.}
(assert (>= (+ (* sc_94 0.) of_94) 0.))
; 
; >=  {((sc.input.V[7].O*0.)+of.input.V[7].O)} {3300.}
(assert (<= (+ (* sc_95 0.) of_95) 3300.))
; 
; <=  {((sc.input.V[7].O*0.)+of.input.V[7].O)} {0.}
(assert (>= (+ (* sc_95 0.) of_95) 0.))
(declare-fun sc_96 () Real)
(assert (> sc_96 1e-08))
(declare-fun of_96 () Real)
(declare-fun sc_97 () Real)
(assert (> sc_97 1e-08))
(declare-fun of_97 () Real)
; 
; =  {sc.input.V[13].O} {sc.input.V[13].X}
(assert (= sc_97 sc_96))
; 
; =  {of.input.V[13].O} {of.input.V[13].X}
(assert (= of_97 of_96))
; 
; >=  {((sc.input.V[13].X*1.)+of.input.V[13].X)} {3300.}
(assert (<= (+ (* sc_96 1.) of_96) 3300.))
; 
; <=  {((sc.input.V[13].X*1.)+of.input.V[13].X)} {0.}
(assert (>= (+ (* sc_96 1.) of_96) 0.))
; 
; >=  {((sc.input.V[13].O*1.)+of.input.V[13].O)} {3300.}
(assert (<= (+ (* sc_97 1.) of_97) 3300.))
; 
; <=  {((sc.input.V[13].O*1.)+of.input.V[13].O)} {0.}
(assert (>= (+ (* sc_97 1.) of_97) 0.))
(declare-fun sc_98 () Real)
(assert (> sc_98 1e-08))
(declare-fun of_98 () Real)
(declare-fun sc_99 () Real)
(assert (> sc_99 1e-08))
(declare-fun of_99 () Real)
; 
; =  {sc.input.V[12].O} {sc.input.V[12].X}
(assert (= sc_99 sc_98))
; 
; =  {of.input.V[12].O} {of.input.V[12].X}
(assert (= of_99 of_98))
; 
; >=  {((sc.input.V[12].X*1.)+of.input.V[12].X)} {3300.}
(assert (<= (+ (* sc_98 1.) of_98) 3300.))
; 
; <=  {((sc.input.V[12].X*1.)+of.input.V[12].X)} {0.}
(assert (>= (+ (* sc_98 1.) of_98) 0.))
; 
; >=  {((sc.input.V[12].O*1.)+of.input.V[12].O)} {3300.}
(assert (<= (+ (* sc_99 1.) of_99) 3300.))
; 
; <=  {((sc.input.V[12].O*1.)+of.input.V[12].O)} {0.}
(assert (>= (+ (* sc_99 1.) of_99) 0.))
(declare-fun sc_100 () Real)
(assert (> sc_100 1e-08))
(declare-fun of_100 () Real)
(declare-fun sc_101 () Real)
(assert (> sc_101 1e-08))
(declare-fun of_101 () Real)
; 
; =  {sc.input.V[9].O} {sc.input.V[9].X}
(assert (= sc_101 sc_100))
; 
; =  {of.input.V[9].O} {of.input.V[9].X}
(assert (= of_101 of_100))
; 
; >=  {((sc.input.V[9].X*4.)+of.input.V[9].X)} {3300.}
(assert (<= (+ (* sc_100 4.) of_100) 3300.))
; 
; <=  {((sc.input.V[9].X*4.)+of.input.V[9].X)} {0.}
(assert (>= (+ (* sc_100 4.) of_100) 0.))
; 
; >=  {((sc.input.V[9].O*4.)+of.input.V[9].O)} {3300.}
(assert (<= (+ (* sc_101 4.) of_101) 3300.))
; 
; <=  {((sc.input.V[9].O*4.)+of.input.V[9].O)} {0.}
(assert (>= (+ (* sc_101 4.) of_101) 0.))
(declare-fun sc_102 () Real)
(assert (> sc_102 1e-08))
(declare-fun of_102 () Real)
(declare-fun sc_103 () Real)
(assert (> sc_103 1e-08))
(declare-fun of_103 () Real)
; 
; =  {sc.input.V[0].O} {sc.input.V[0].X}
(assert (= sc_103 sc_102))
; 
; =  {of.input.V[0].O} {of.input.V[0].X}
(assert (= of_103 of_102))
; 
; >=  {((sc.input.V[0].X*2.)+of.input.V[0].X)} {3300.}
(assert (<= (+ (* sc_102 2.) of_102) 3300.))
; 
; <=  {((sc.input.V[0].X*2.)+of.input.V[0].X)} {0.}
(assert (>= (+ (* sc_102 2.) of_102) 0.))
; 
; >=  {((sc.input.V[0].O*2.)+of.input.V[0].O)} {3300.}
(assert (<= (+ (* sc_103 2.) of_103) 3300.))
; 
; <=  {((sc.input.V[0].O*2.)+of.input.V[0].O)} {0.}
(assert (>= (+ (* sc_103 2.) of_103) 0.))
(declare-fun sc_104 () Real)
(assert (> sc_104 1e-08))
(declare-fun of_104 () Real)
(declare-fun sc_105 () Real)
(assert (> sc_105 1e-08))
(declare-fun of_105 () Real)
; 
; =  {sc.input.V[11].O} {sc.input.V[11].X}
(assert (= sc_105 sc_104))
; 
; =  {of.input.V[11].O} {of.input.V[11].X}
(assert (= of_105 of_104))
; 
; >=  {((sc.input.V[11].X*1000.75)+of.input.V[11].X)} {3300.}
(assert (<= (+ (* sc_104 1000.75) of_104) 3300.))
; 
; <=  {((sc.input.V[11].X*1000.75)+of.input.V[11].X)} {0.}
(assert (>= (+ (* sc_104 1000.75) of_104) 0.))
; 
; >=  {((sc.input.V[11].O*1000.75)+of.input.V[11].O)} {3300.}
(assert (<= (+ (* sc_105 1000.75) of_105) 3300.))
; 
; <=  {((sc.input.V[11].O*1000.75)+of.input.V[11].O)} {0.}
(assert (>= (+ (* sc_105 1000.75) of_105) 0.))
(declare-fun sc_106 () Real)
(assert (> sc_106 1e-08))
(declare-fun of_106 () Real)
(declare-fun sc_107 () Real)
(assert (> sc_107 1e-08))
(declare-fun of_107 () Real)
; 
; =  {sc.input.V[10].O} {sc.input.V[10].X}
(assert (= sc_107 sc_106))
; 
; =  {of.input.V[10].O} {of.input.V[10].X}
(assert (= of_107 of_106))
; 
; >=  {((sc.input.V[10].X*4.)+of.input.V[10].X)} {3300.}
(assert (<= (+ (* sc_106 4.) of_106) 3300.))
; 
; <=  {((sc.input.V[10].X*4.)+of.input.V[10].X)} {0.}
(assert (>= (+ (* sc_106 4.) of_106) 0.))
; 
; >=  {((sc.input.V[10].O*4.)+of.input.V[10].O)} {3300.}
(assert (<= (+ (* sc_107 4.) of_107) 3300.))
; 
; <=  {((sc.input.V[10].O*4.)+of.input.V[10].O)} {0.}
(assert (>= (+ (* sc_107 4.) of_107) 0.))
(declare-fun sc_108 () Real)
(assert (> sc_108 1e-08))
(declare-fun of_108 () Real)
(declare-fun sc_109 () Real)
(assert (> sc_109 1e-08))
(declare-fun of_109 () Real)
; 
; =  {sc.input.V[6].O} {sc.input.V[6].X}
(assert (= sc_109 sc_108))
; 
; =  {of.input.V[6].O} {of.input.V[6].X}
(assert (= of_109 of_108))
; 
; >=  {((sc.input.V[6].X*0.)+of.input.V[6].X)} {3300.}
(assert (<= (+ (* sc_108 0.) of_108) 3300.))
; 
; <=  {((sc.input.V[6].X*0.)+of.input.V[6].X)} {0.}
(assert (>= (+ (* sc_108 0.) of_108) 0.))
; 
; >=  {((sc.input.V[6].O*0.)+of.input.V[6].O)} {3300.}
(assert (<= (+ (* sc_109 0.) of_109) 3300.))
; 
; <=  {((sc.input.V[6].O*0.)+of.input.V[6].O)} {0.}
(assert (>= (+ (* sc_109 0.) of_109) 0.))
(declare-fun sc_110 () Real)
(assert (> sc_110 1e-08))
(declare-fun of_110 () Real)
(declare-fun sc_111 () Real)
(assert (> sc_111 1e-08))
(declare-fun of_111 () Real)
; 
; =  {sc.input.V[14].O} {sc.input.V[14].X}
(assert (= sc_111 sc_110))
; 
; =  {of.input.V[14].O} {of.input.V[14].X}
(assert (= of_111 of_110))
; 
; >=  {((sc.input.V[14].X*1.)+of.input.V[14].X)} {3300.}
(assert (<= (+ (* sc_110 1.) of_110) 3300.))
; 
; <=  {((sc.input.V[14].X*1.)+of.input.V[14].X)} {0.}
(assert (>= (+ (* sc_110 1.) of_110) 0.))
; 
; >=  {((sc.input.V[14].O*1.)+of.input.V[14].O)} {3300.}
(assert (<= (+ (* sc_111 1.) of_111) 3300.))
; 
; <=  {((sc.input.V[14].O*1.)+of.input.V[14].O)} {0.}
(assert (>= (+ (* sc_111 1.) of_111) 0.))
(declare-fun sc_112 () Real)
(assert (> sc_112 1e-08))
(declare-fun of_112 () Real)
(declare-fun sc_113 () Real)
(assert (> sc_113 1e-08))
(declare-fun of_113 () Real)
; 
; =  {sc.input.V[3].O} {sc.input.V[3].X}
(assert (= sc_113 sc_112))
; 
; =  {of.input.V[3].O} {of.input.V[3].X}
(assert (= of_113 of_112))
; 
; >=  {((sc.input.V[3].X*0.)+of.input.V[3].X)} {3300.}
(assert (<= (+ (* sc_112 0.) of_112) 3300.))
; 
; <=  {((sc.input.V[3].X*0.)+of.input.V[3].X)} {0.}
(assert (>= (+ (* sc_112 0.) of_112) 0.))
; 
; >=  {((sc.input.V[3].O*0.)+of.input.V[3].O)} {3300.}
(assert (<= (+ (* sc_113 0.) of_113) 3300.))
; 
; <=  {((sc.input.V[3].O*0.)+of.input.V[3].O)} {0.}
(assert (>= (+ (* sc_113 0.) of_113) 0.))
(declare-fun sc_114 () Real)
(assert (> sc_114 1e-08))
(declare-fun of_114 () Real)
(declare-fun sc_115 () Real)
(assert (> sc_115 1e-08))
(declare-fun of_115 () Real)
; 
; =  {sc.input.V[4].O} {sc.input.V[4].X}
(assert (= sc_115 sc_114))
; 
; =  {of.input.V[4].O} {of.input.V[4].X}
(assert (= of_115 of_114))
; 
; >=  {((sc.input.V[4].X*0.)+of.input.V[4].X)} {3300.}
(assert (<= (+ (* sc_114 0.) of_114) 3300.))
; 
; <=  {((sc.input.V[4].X*0.)+of.input.V[4].X)} {0.}
(assert (>= (+ (* sc_114 0.) of_114) 0.))
; 
; >=  {((sc.input.V[4].O*0.)+of.input.V[4].O)} {3300.}
(assert (<= (+ (* sc_115 0.) of_115) 3300.))
; 
; <=  {((sc.input.V[4].O*0.)+of.input.V[4].O)} {0.}
(assert (>= (+ (* sc_115 0.) of_115) 0.))
(declare-fun sc_116 () Real)
(assert (> sc_116 1e-08))
(declare-fun of_116 () Real)
(declare-fun sc_117 () Real)
(assert (> sc_117 1e-08))
(declare-fun of_117 () Real)
; 
; =  {sc.input.V[5].O} {sc.input.V[5].X}
(assert (= sc_117 sc_116))
; 
; =  {of.input.V[5].O} {of.input.V[5].X}
(assert (= of_117 of_116))
; 
; >=  {((sc.input.V[5].X*0.)+of.input.V[5].X)} {3300.}
(assert (<= (+ (* sc_116 0.) of_116) 3300.))
; 
; <=  {((sc.input.V[5].X*0.)+of.input.V[5].X)} {0.}
(assert (>= (+ (* sc_116 0.) of_116) 0.))
; 
; >=  {((sc.input.V[5].O*0.)+of.input.V[5].O)} {3300.}
(assert (<= (+ (* sc_117 0.) of_117) 3300.))
; 
; <=  {((sc.input.V[5].O*0.)+of.input.V[5].O)} {0.}
(assert (>= (+ (* sc_117 0.) of_117) 0.))
(declare-fun sc_118 () Real)
(assert (> sc_118 1e-08))
(declare-fun of_118 () Real)
(declare-fun sc_119 () Real)
(assert (> sc_119 1e-08))
(declare-fun of_119 () Real)
; 
; =  {sc.input.V[1].O} {sc.input.V[1].X}
(assert (= sc_119 sc_118))
; 
; =  {of.input.V[1].O} {of.input.V[1].X}
(assert (= of_119 of_118))
; 
; >=  {((sc.input.V[1].X*1250.)+of.input.V[1].X)} {3300.}
(assert (<= (+ (* sc_118 1250.) of_118) 3300.))
; 
; <=  {((sc.input.V[1].X*1250.)+of.input.V[1].X)} {0.}
(assert (>= (+ (* sc_118 1250.) of_118) 0.))
; 
; >=  {((sc.input.V[1].O*1250.)+of.input.V[1].O)} {3300.}
(assert (<= (+ (* sc_119 1250.) of_119) 3300.))
; 
; <=  {((sc.input.V[1].O*1250.)+of.input.V[1].O)} {0.}
(assert (>= (+ (* sc_119 1250.) of_119) 0.))
(declare-fun sc_120 () Real)
(assert (> sc_120 1e-08))
(declare-fun of_120 () Real)
(declare-fun sc_121 () Real)
(assert (> sc_121 1e-08))
(declare-fun of_121 () Real)
(declare-fun sc_122 () Real)
(assert (> sc_122 1e-08))
(declare-fun of_122 () Real)
; no offset
(assert (= of_121 0.))
; no offset
(assert (= of_120 0.))
; 
; =  {sc.itov[12].Y} {(sc.itov[12].K*sc.itov[12].X)}
(assert (= sc_122 (* sc_121 sc_120)))
; 
; =  {of.itov[12].Y} {0.}
(assert (= of_122 0.))
; 
; >=  {((sc.itov[12].X*4.)+of.itov[12].X)} {10.}
(assert (<= (+ (* sc_120 4.) of_120) 10.))
; 
; <=  {((sc.itov[12].X*4.)+of.itov[12].X)} {0.0001}
(assert (>= (+ (* sc_120 4.) of_120) 0.0001))
(declare-fun slbot_122 () Real)
(declare-fun sltop_122 () Real)
; 
; =  {(((sc.itov[12].Y*0.00204799328914)+of.itov[12].Y)+sl.min.itov[12].Y)} {0.0001}
(assert (= (+ (+ (* sc_122 0.00204799328914) of_122) slbot_122) 0.0001))
; 
; =  {(((sc.itov[12].Y*625.)+of.itov[12].Y)+sl.max.itov[12].Y)} {3300.}
(assert (= (+ (+ (* sc_122 625.) of_122) sltop_122) 3300.))
(declare-fun slbot_121 () Real)
(declare-fun sltop_121 () Real)
; 
; =  {(((sc.itov[12].K*0.000511998322284)+of.itov[12].K)+sl.min.itov[12].K)} {1.}
(assert (= (+ (+ (* sc_121 0.000511998322284) of_121) slbot_121) 1.))
; 
; =  {(((sc.itov[12].K*156.25)+of.itov[12].K)+sl.max.itov[12].K)} {330.}
(assert (= (+ (+ (* sc_121 156.25) of_121) sltop_121) 330.))
(declare-fun slbot_122 () Real)
(declare-fun sltop_122 () Real)
; 
; =  {(((sc.itov[12].Y*0.00204799328914)+of.itov[12].Y)+sl.min.itov[12].Y)} {0.0001}
(assert (= (+ (+ (* sc_122 0.00204799328914) of_122) slbot_122) 0.0001))
; 
; =  {(((sc.itov[12].Y*625.)+of.itov[12].Y)+sl.max.itov[12].Y)} {3300.}
(assert (= (+ (+ (* sc_122 625.) of_122) sltop_122) 3300.))
(declare-fun sc_123 () Real)
(assert (> sc_123 1e-08))
(declare-fun of_123 () Real)
(declare-fun sc_124 () Real)
(assert (> sc_124 1e-08))
(declare-fun of_124 () Real)
(declare-fun sc_125 () Real)
(assert (> sc_125 1e-08))
(declare-fun of_125 () Real)
; no offset
(assert (= of_124 0.))
; no offset
(assert (= of_123 0.))
; 
; =  {sc.itov[9].Y} {(sc.itov[9].K*sc.itov[9].X)}
(assert (= sc_125 (* sc_124 sc_123)))
; 
; =  {of.itov[9].Y} {0.}
(assert (= of_125 0.))
(declare-fun slbot_123 () Real)
(declare-fun sltop_123 () Real)
; 
; =  {(((sc.itov[9].X*0.)+of.itov[9].X)+sl.min.itov[9].X)} {0.0001}
(assert (= (+ (+ (* sc_123 0.) of_123) slbot_123) 0.0001))
; 
; =  {(((sc.itov[9].X*3.2768e-06)+of.itov[9].X)+sl.max.itov[9].X)} {10.}
(assert (= (+ (+ (* sc_123 3.2768e-06) of_123) sltop_123) 10.))
(declare-fun slbot_125 () Real)
(declare-fun sltop_125 () Real)
; 
; =  {(((sc.itov[9].Y*0.)+of.itov[9].Y)+sl.min.itov[9].Y)} {0.0001}
(assert (= (+ (+ (* sc_125 0.) of_125) slbot_125) 0.0001))
; 
; =  {(((sc.itov[9].Y*3.2768e-06)+of.itov[9].Y)+sl.max.itov[9].Y)} {3300.}
(assert (= (+ (+ (* sc_125 3.2768e-06) of_125) sltop_125) 3300.))
; 
; >=  {((sc.itov[9].K*1.)+of.itov[9].K)} {330.}
(assert (<= (+ (* sc_124 1.) of_124) 330.))
; 
; <=  {((sc.itov[9].K*1.)+of.itov[9].K)} {1.}
(assert (>= (+ (* sc_124 1.) of_124) 1.))
(declare-fun slbot_125 () Real)
(declare-fun sltop_125 () Real)
; 
; =  {(((sc.itov[9].Y*0.)+of.itov[9].Y)+sl.min.itov[9].Y)} {0.0001}
(assert (= (+ (+ (* sc_125 0.) of_125) slbot_125) 0.0001))
; 
; =  {(((sc.itov[9].Y*3.2768e-06)+of.itov[9].Y)+sl.max.itov[9].Y)} {3300.}
(assert (= (+ (+ (* sc_125 3.2768e-06) of_125) sltop_125) 3300.))
(declare-fun sc_126 () Real)
(assert (> sc_126 1e-08))
(declare-fun of_126 () Real)
(declare-fun sc_127 () Real)
(assert (> sc_127 1e-08))
(declare-fun of_127 () Real)
(declare-fun sc_128 () Real)
(assert (> sc_128 1e-08))
(declare-fun of_128 () Real)
; no offset
(assert (= of_127 0.))
; no offset
(assert (= of_126 0.))
; 
; =  {sc.itov[0].Y} {(sc.itov[0].K*sc.itov[0].X)}
(assert (= sc_128 (* sc_127 sc_126)))
; 
; =  {of.itov[0].Y} {0.}
(assert (= of_128 0.))
; 
; >=  {((sc.itov[0].X*4.)+of.itov[0].X)} {10.}
(assert (<= (+ (* sc_126 4.) of_126) 10.))
; 
; <=  {((sc.itov[0].X*4.)+of.itov[0].X)} {0.0001}
(assert (>= (+ (* sc_126 4.) of_126) 0.0001))
(declare-fun slbot_128 () Real)
(declare-fun sltop_128 () Real)
; 
; =  {(((sc.itov[0].Y*3.75903614458)+of.itov[0].Y)+sl.min.itov[0].Y)} {0.0001}
(assert (= (+ (+ (* sc_128 3.75903614458) of_128) slbot_128) 0.0001))
; 
; =  {(((sc.itov[0].Y*62.4)+of.itov[0].Y)+sl.max.itov[0].Y)} {3300.}
(assert (= (+ (+ (* sc_128 62.4) of_128) sltop_128) 3300.))
(declare-fun slbot_127 () Real)
(declare-fun sltop_127 () Real)
; 
; =  {(((sc.itov[0].K*0.939759036145)+of.itov[0].K)+sl.min.itov[0].K)} {1.}
(assert (= (+ (+ (* sc_127 0.939759036145) of_127) slbot_127) 1.))
; 
; =  {(((sc.itov[0].K*15.6)+of.itov[0].K)+sl.max.itov[0].K)} {330.}
(assert (= (+ (+ (* sc_127 15.6) of_127) sltop_127) 330.))
(declare-fun slbot_128 () Real)
(declare-fun sltop_128 () Real)
; 
; =  {(((sc.itov[0].Y*3.75903614458)+of.itov[0].Y)+sl.min.itov[0].Y)} {0.0001}
(assert (= (+ (+ (* sc_128 3.75903614458) of_128) slbot_128) 0.0001))
; 
; =  {(((sc.itov[0].Y*62.4)+of.itov[0].Y)+sl.max.itov[0].Y)} {3300.}
(assert (= (+ (+ (* sc_128 62.4) of_128) sltop_128) 3300.))
(declare-fun sc_129 () Real)
(assert (> sc_129 1e-08))
(declare-fun of_129 () Real)
(declare-fun sc_130 () Real)
(assert (> sc_130 1e-08))
(declare-fun of_130 () Real)
(declare-fun sc_131 () Real)
(assert (> sc_131 1e-08))
(declare-fun of_131 () Real)
(declare-fun sc_132 () Real)
(assert (> sc_132 1e-08))
(declare-fun of_132 () Real)
(declare-fun sc_133 () Real)
(assert (> sc_133 1e-08))
(declare-fun of_133 () Real)
; 
; =  {sc.iadd[12].A} {sc.iadd[12].B}
(assert (= sc_131 sc_132))
; 
; =  {sc.iadd[12].A} {sc.iadd[12].C} {sc.iadd[12].D}
(assert (and (= sc_131 sc_130) (= sc_131 sc_129)))
; 
; =  {sc.iadd[12].OUT} {sc.iadd[12].A}
(assert (= sc_133 sc_131))
; 
; =  {of.iadd[12].OUT} {((of.iadd[12].A+of.iadd[12].B)-of.iadd[12].C-of.iadd[12].D)}
(assert (= of_133 (- (+ of_131 of_132) (+ of_130 of_129))))
; 
; >=  {((sc.iadd[12].D*0.)+of.iadd[12].D)} {5.}
(assert (<= (+ (* sc_129 0.) of_129) 5.))
; 
; <=  {((sc.iadd[12].D*0.)+of.iadd[12].D)} {0.}
(assert (>= (+ (* sc_129 0.) of_129) 0.))
; 
; >=  {((sc.iadd[12].C*0.)+of.iadd[12].C)} {5.}
(assert (<= (+ (* sc_130 0.) of_130) 5.))
; 
; <=  {((sc.iadd[12].C*0.)+of.iadd[12].C)} {0.}
(assert (>= (+ (* sc_130 0.) of_130) 0.))
(declare-fun slbot_131 () Real)
(declare-fun sltop_131 () Real)
; 
; =  {(((sc.iadd[12].A*0.)+of.iadd[12].A)+sl.min.iadd[12].A)} {0.}
(assert (= (+ (+ (* sc_131 0.) of_131) slbot_131) 0.))
; 
; =  {(((sc.iadd[12].A*15.6)+of.iadd[12].A)+sl.max.iadd[12].A)} {5.}
(assert (= (+ (+ (* sc_131 15.6) of_131) sltop_131) 5.))
; 
; >=  {((sc.iadd[12].B*0.)+of.iadd[12].B)} {5.}
(assert (<= (+ (* sc_132 0.) of_132) 5.))
; 
; <=  {((sc.iadd[12].B*0.)+of.iadd[12].B)} {0.}
(assert (>= (+ (* sc_132 0.) of_132) 0.))
(declare-fun slbot_133 () Real)
(declare-fun sltop_133 () Real)
; 
; =  {(((sc.iadd[12].OUT*0.)+of.iadd[12].OUT)+sl.min.iadd[12].OUT)} {-10.}
(assert (= (+ (+ (* sc_133 0.) of_133) slbot_133) -10.))
; 
; =  {(((sc.iadd[12].OUT*15.6)+of.iadd[12].OUT)+sl.max.iadd[12].OUT)} {10.}
(assert (= (+ (+ (* sc_133 15.6) of_133) sltop_133) 10.))
(declare-fun sc_134 () Real)
(assert (> sc_134 1e-08))
(declare-fun of_134 () Real)
(declare-fun sc_135 () Real)
(assert (> sc_135 1e-08))
(declare-fun of_135 () Real)
(declare-fun sc_136 () Real)
(assert (> sc_136 1e-08))
(declare-fun of_136 () Real)
(declare-fun sc_137 () Real)
(assert (> sc_137 1e-08))
(declare-fun of_137 () Real)
(declare-fun sc_138 () Real)
(assert (> sc_138 1e-08))
(declare-fun of_138 () Real)
; 
; =  {sc.iadd[11].A} {sc.iadd[11].B}
(assert (= sc_136 sc_137))
; 
; =  {sc.iadd[11].A} {sc.iadd[11].C} {sc.iadd[11].D}
(assert (and (= sc_136 sc_135) (= sc_136 sc_134)))
; 
; =  {sc.iadd[11].OUT} {sc.iadd[11].A}
(assert (= sc_138 sc_136))
; 
; =  {of.iadd[11].OUT} {((of.iadd[11].A+of.iadd[11].B)-of.iadd[11].C-of.iadd[11].D)}
(assert (= of_138 (- (+ of_136 of_137) (+ of_135 of_134))))
(declare-fun slbot_134 () Real)
(declare-fun sltop_134 () Real)
; 
; =  {(((sc.iadd[11].D*-156.25)+of.iadd[11].D)+sl.min.iadd[11].D)} {0.}
(assert (= (+ (+ (* sc_134 -156.25) of_134) slbot_134) 0.))
; 
; =  {(((sc.iadd[11].D*0.)+of.iadd[11].D)+sl.max.iadd[11].D)} {5.}
(assert (= (+ (+ (* sc_134 0.) of_134) sltop_134) 5.))
; 
; >=  {((sc.iadd[11].C*1.)+of.iadd[11].C)} {5.}
(assert (<= (+ (* sc_135 1.) of_135) 5.))
; 
; <=  {((sc.iadd[11].C*1.)+of.iadd[11].C)} {0.}
(assert (>= (+ (* sc_135 1.) of_135) 0.))
(declare-fun slbot_138 () Real)
(declare-fun sltop_138 () Real)
; 
; =  {(((sc.iadd[11].OUT*-1.)+of.iadd[11].OUT)+sl.min.iadd[11].OUT)} {-10.}
(assert (= (+ (+ (* sc_138 -1.) of_138) slbot_138) -10.))
; 
; =  {(((sc.iadd[11].OUT*155.25)+of.iadd[11].OUT)+sl.max.iadd[11].OUT)} {10.}
(assert (= (+ (+ (* sc_138 155.25) of_138) sltop_138) 10.))
; 
; >=  {((sc.iadd[11].A*0.)+of.iadd[11].A)} {5.}
(assert (<= (+ (* sc_136 0.) of_136) 5.))
; 
; <=  {((sc.iadd[11].A*0.)+of.iadd[11].A)} {0.}
(assert (>= (+ (* sc_136 0.) of_136) 0.))
; 
; >=  {((sc.iadd[11].B*0.)+of.iadd[11].B)} {5.}
(assert (<= (+ (* sc_137 0.) of_137) 5.))
; 
; <=  {((sc.iadd[11].B*0.)+of.iadd[11].B)} {0.}
(assert (>= (+ (* sc_137 0.) of_137) 0.))
(declare-fun slbot_138 () Real)
(declare-fun sltop_138 () Real)
; 
; =  {(((sc.iadd[11].OUT*-1.)+of.iadd[11].OUT)+sl.min.iadd[11].OUT)} {-10.}
(assert (= (+ (+ (* sc_138 -1.) of_138) slbot_138) -10.))
; 
; =  {(((sc.iadd[11].OUT*155.25)+of.iadd[11].OUT)+sl.max.iadd[11].OUT)} {10.}
(assert (= (+ (+ (* sc_138 155.25) of_138) sltop_138) 10.))
(declare-fun sc_139 () Real)
(assert (> sc_139 1e-08))
(declare-fun of_139 () Real)
(declare-fun sc_140 () Real)
(assert (> sc_140 1e-08))
(declare-fun of_140 () Real)
(declare-fun sc_141 () Real)
(assert (> sc_141 1e-08))
(declare-fun of_141 () Real)
(declare-fun sc_142 () Real)
(assert (> sc_142 1e-08))
(declare-fun of_142 () Real)
(declare-fun sc_143 () Real)
(assert (> sc_143 1e-08))
(declare-fun of_143 () Real)
; 
; =  {sc.iadd[6].A} {sc.iadd[6].B}
(assert (= sc_141 sc_142))
; 
; =  {sc.iadd[6].A} {sc.iadd[6].C} {sc.iadd[6].D}
(assert (and (= sc_141 sc_140) (= sc_141 sc_139)))
; 
; =  {sc.iadd[6].OUT} {sc.iadd[6].A}
(assert (= sc_143 sc_141))
; 
; =  {of.iadd[6].OUT} {((of.iadd[6].A+of.iadd[6].B)-of.iadd[6].C-of.iadd[6].D)}
(assert (= of_143 (- (+ of_141 of_142) (+ of_140 of_139))))
; 
; >=  {((sc.iadd[6].D*0.)+of.iadd[6].D)} {5.}
(assert (<= (+ (* sc_139 0.) of_139) 5.))
; 
; <=  {((sc.iadd[6].D*0.)+of.iadd[6].D)} {0.}
(assert (>= (+ (* sc_139 0.) of_139) 0.))
; 
; >=  {((sc.iadd[6].C*0.)+of.iadd[6].C)} {5.}
(assert (<= (+ (* sc_140 0.) of_140) 5.))
; 
; <=  {((sc.iadd[6].C*0.)+of.iadd[6].C)} {0.}
(assert (>= (+ (* sc_140 0.) of_140) 0.))
(declare-fun slbot_143 () Real)
(declare-fun sltop_143 () Real)
; 
; =  {(((sc.iadd[6].OUT*0.)+of.iadd[6].OUT)+sl.min.iadd[6].OUT)} {-10.}
(assert (= (+ (+ (* sc_143 0.) of_143) slbot_143) -10.))
; 
; =  {(((sc.iadd[6].OUT*305175.78125)+of.iadd[6].OUT)+sl.max.iadd[6].OUT)} {10.}
(assert (= (+ (+ (* sc_143 305175.78125) of_143) sltop_143) 10.))
; 
; >=  {((sc.iadd[6].A*0.)+of.iadd[6].A)} {5.}
(assert (<= (+ (* sc_141 0.) of_141) 5.))
; 
; <=  {((sc.iadd[6].A*0.)+of.iadd[6].A)} {0.}
(assert (>= (+ (* sc_141 0.) of_141) 0.))
(declare-fun slbot_142 () Real)
(declare-fun sltop_142 () Real)
; 
; =  {(((sc.iadd[6].B*0.)+of.iadd[6].B)+sl.min.iadd[6].B)} {0.}
(assert (= (+ (+ (* sc_142 0.) of_142) slbot_142) 0.))
; 
; =  {(((sc.iadd[6].B*305175.78125)+of.iadd[6].B)+sl.max.iadd[6].B)} {5.}
(assert (= (+ (+ (* sc_142 305175.78125) of_142) sltop_142) 5.))
(declare-fun slbot_143 () Real)
(declare-fun sltop_143 () Real)
; 
; =  {(((sc.iadd[6].OUT*0.)+of.iadd[6].OUT)+sl.min.iadd[6].OUT)} {-10.}
(assert (= (+ (+ (* sc_143 0.) of_143) slbot_143) -10.))
; 
; =  {(((sc.iadd[6].OUT*305175.78125)+of.iadd[6].OUT)+sl.max.iadd[6].OUT)} {10.}
(assert (= (+ (+ (* sc_143 305175.78125) of_143) sltop_143) 10.))
(declare-fun sc_144 () Real)
(assert (> sc_144 1e-08))
(declare-fun of_144 () Real)
(declare-fun sc_145 () Real)
(assert (> sc_145 1e-08))
(declare-fun of_145 () Real)
(declare-fun sc_146 () Real)
(assert (> sc_146 1e-08))
(declare-fun of_146 () Real)
(declare-fun sc_147 () Real)
(assert (> sc_147 1e-08))
(declare-fun of_147 () Real)
(declare-fun sc_148 () Real)
(assert (> sc_148 1e-08))
(declare-fun of_148 () Real)
; 
; =  {sc.iadd[5].A} {sc.iadd[5].B}
(assert (= sc_146 sc_147))
; 
; =  {sc.iadd[5].A} {sc.iadd[5].C} {sc.iadd[5].D}
(assert (and (= sc_146 sc_145) (= sc_146 sc_144)))
; 
; =  {sc.iadd[5].OUT} {sc.iadd[5].A}
(assert (= sc_148 sc_146))
; 
; =  {of.iadd[5].OUT} {((of.iadd[5].A+of.iadd[5].B)-of.iadd[5].C-of.iadd[5].D)}
(assert (= of_148 (- (+ of_146 of_147) (+ of_145 of_144))))
; 
; >=  {((sc.iadd[5].D*0.)+of.iadd[5].D)} {5.}
(assert (<= (+ (* sc_144 0.) of_144) 5.))
; 
; <=  {((sc.iadd[5].D*0.)+of.iadd[5].D)} {0.}
(assert (>= (+ (* sc_144 0.) of_144) 0.))
; 
; >=  {((sc.iadd[5].C*0.)+of.iadd[5].C)} {5.}
(assert (<= (+ (* sc_145 0.) of_145) 5.))
; 
; <=  {((sc.iadd[5].C*0.)+of.iadd[5].C)} {0.}
(assert (>= (+ (* sc_145 0.) of_145) 0.))
(declare-fun slbot_148 () Real)
(declare-fun sltop_148 () Real)
; 
; =  {(((sc.iadd[5].OUT*0.)+of.iadd[5].OUT)+sl.min.iadd[5].OUT)} {-10.}
(assert (= (+ (+ (* sc_148 0.) of_148) slbot_148) -10.))
; 
; =  {(((sc.iadd[5].OUT*305175.78125)+of.iadd[5].OUT)+sl.max.iadd[5].OUT)} {10.}
(assert (= (+ (+ (* sc_148 305175.78125) of_148) sltop_148) 10.))
; 
; >=  {((sc.iadd[5].A*0.)+of.iadd[5].A)} {5.}
(assert (<= (+ (* sc_146 0.) of_146) 5.))
; 
; <=  {((sc.iadd[5].A*0.)+of.iadd[5].A)} {0.}
(assert (>= (+ (* sc_146 0.) of_146) 0.))
(declare-fun slbot_147 () Real)
(declare-fun sltop_147 () Real)
; 
; =  {(((sc.iadd[5].B*0.)+of.iadd[5].B)+sl.min.iadd[5].B)} {0.}
(assert (= (+ (+ (* sc_147 0.) of_147) slbot_147) 0.))
; 
; =  {(((sc.iadd[5].B*305175.78125)+of.iadd[5].B)+sl.max.iadd[5].B)} {5.}
(assert (= (+ (+ (* sc_147 305175.78125) of_147) sltop_147) 5.))
(declare-fun slbot_148 () Real)
(declare-fun sltop_148 () Real)
; 
; =  {(((sc.iadd[5].OUT*0.)+of.iadd[5].OUT)+sl.min.iadd[5].OUT)} {-10.}
(assert (= (+ (+ (* sc_148 0.) of_148) slbot_148) -10.))
; 
; =  {(((sc.iadd[5].OUT*305175.78125)+of.iadd[5].OUT)+sl.max.iadd[5].OUT)} {10.}
(assert (= (+ (+ (* sc_148 305175.78125) of_148) sltop_148) 10.))
; 
; =  {sc.igenebind[4].GE} {sc.itov[12].K}
(assert (= sc_89 sc_121))
; 
; =  {of.igenebind[4].GE} {of.itov[12].K}
(assert (= of_89 of_121))
; 
; =  {sc.igenebind[2].GE} {sc.itov[0].K}
(assert (= sc_85 sc_127))
; 
; =  {of.igenebind[2].GE} {of.itov[0].K}
(assert (= of_85 of_127))
; 
; =  {sc.itov[12].Y} {sc.vadd[13].B}
(assert (= sc_122 sc_66))
; 
; =  {of.itov[12].Y} {of.vadd[13].B}
(assert (= of_122 of_66))
; 
; =  {sc.input.I[6].O} {sc.iadd[6].A}
(assert (= sc_35 sc_141))
; 
; =  {of.input.I[6].O} {of.iadd[6].A}
(assert (= of_35 of_141))
; 
; =  {sc.iadd[6].OUT} {sc.iadd[5].B}
(assert (= sc_143 sc_147))
; 
; =  {of.iadd[6].OUT} {of.iadd[5].B}
(assert (= of_143 of_147))
; 
; =  {sc.vadd[1].OUT2} {sc.vtoi[3].X}
(assert (= sc_75 sc_79))
; 
; =  {of.vadd[1].OUT2} {of.vtoi[3].X}
(assert (= of_75 of_79))
; 
; =  {sc.vadd[1].OUT2} {sc.output.V[0].X}
(assert (= sc_75 sc_58))
; 
; =  {of.vadd[1].OUT2} {of.output.V[0].X}
(assert (= of_75 of_58))
; 
; =  {sc.vgain[8].P} {sc.vtoi[7].K}
(assert (= sc_3 sc_77))
; 
; =  {of.vgain[8].P} {of.vtoi[7].K}
(assert (= of_3 of_77))
; 
; =  {sc.input.I[0].O} {sc.switch[14].SUB}
(assert (= sc_27 sc_10))
; 
; =  {of.input.I[0].O} {of.switch[14].SUB}
(assert (= of_27 of_10))
; 
; =  {sc.vadd[13].OUT2} {sc.output.V[1].X}
(assert (= sc_68 sc_60))
; 
; =  {of.vadd[13].OUT2} {of.output.V[1].X}
(assert (= of_68 of_60))
; 
; =  {sc.vadd[13].OUT2} {sc.switch[14].Vmax}
(assert (= sc_68 sc_12))
; 
; =  {of.vadd[13].OUT2} {of.switch[14].Vmax}
(assert (= of_68 of_12))
; 
; =  {sc.vtoi[3].Y} {sc.iadd[11].D}
(assert (= sc_81 sc_134))
; 
; =  {of.vtoi[3].Y} {of.iadd[11].D}
(assert (= of_81 of_134))
; 
; =  {sc.input.V[9].O} {sc.vadd[1].D}
(assert (= sc_101 sc_70))
; 
; =  {of.input.V[9].O} {of.vadd[1].D}
(assert (= of_101 of_70))
; 
; =  {sc.input.I[22].O} {sc.iadd[12].C}
(assert (= sc_57 sc_130))
; 
; =  {of.input.I[22].O} {of.iadd[12].C}
(assert (= of_57 of_130))
; 
; =  {sc.input.I[18].O} {sc.switch[10].Vmax}
(assert (= sc_55 sc_7))
; 
; =  {of.input.I[18].O} {of.switch[10].Vmax}
(assert (= of_55 of_7))
; 
; =  {sc.input.I[9].O} {sc.iadd[11].B}
(assert (= sc_25 sc_137))
; 
; =  {of.input.I[9].O} {of.iadd[11].B}
(assert (= of_25 of_137))
; 
; =  {sc.input.I[16].O} {sc.switch[10].Kmod}
(assert (= sc_41 sc_6))
; 
; =  {of.input.I[16].O} {of.switch[10].Kmod}
(assert (= of_41 of_6))
; 
; =  {sc.input.V[13].O} {sc.vgain[8].Y}
(assert (= sc_97 sc_1))
; 
; =  {of.input.V[13].O} {of.vgain[8].Y}
(assert (= of_97 of_1))
; 
; =  {sc.input.I[4].O} {sc.iadd[5].C}
(assert (= sc_45 sc_145))
; 
; =  {of.input.I[4].O} {of.iadd[5].C}
(assert (= of_45 of_145))
; 
; =  {sc.input.I[3].O} {sc.iadd[5].A}
(assert (= sc_43 sc_146))
; 
; =  {of.input.I[3].O} {of.iadd[5].A}
(assert (= of_43 of_146))
; 
; =  {sc.vtoi[7].Y} {sc.iadd[6].B}
(assert (= sc_78 sc_142))
; 
; =  {of.vtoi[7].Y} {of.iadd[6].B}
(assert (= of_78 of_142))
; 
; =  {sc.input.I[5].O} {sc.iadd[6].D}
(assert (= sc_47 sc_139))
; 
; =  {of.input.I[5].O} {of.iadd[6].D}
(assert (= of_47 of_139))
; 
; =  {sc.input.V[14].O} {sc.itov[9].K}
(assert (= sc_111 sc_124))
; 
; =  {of.input.V[14].O} {of.itov[9].K}
(assert (= of_111 of_124))
; 
; =  {sc.iadd[12].OUT} {sc.igenebind[2].K}
(assert (= sc_133 sc_83))
; 
; =  {of.iadd[12].OUT} {of.igenebind[2].K}
(assert (= of_133 of_83))
; 
; =  {sc.input.I[14].O} {sc.igenebind[2].TF}
(assert (= sc_37 sc_82))
; 
; =  {of.input.I[14].O} {of.igenebind[2].TF}
(assert (= of_37 of_82))
; 
; =  {sc.input.V[11].O} {sc.switch[14].n}
(assert (= sc_105 sc_9))
; 
; =  {of.input.V[11].O} {of.switch[14].n}
(assert (= of_105 of_9))
; 
; =  {sc.input.V[8].O} {sc.vtoi[3].K}
(assert (= sc_93 sc_80))
; 
; =  {of.input.V[8].O} {of.vtoi[3].K}
(assert (= of_93 of_80))
; 
; =  {sc.input.I[2].O} {sc.iadd[5].D}
(assert (= sc_15 sc_144))
; 
; =  {of.input.I[2].O} {of.iadd[5].D}
(assert (= of_15 of_144))
; 
; =  {sc.input.V[12].O} {sc.vtoi[7].X}
(assert (= sc_99 sc_76))
; 
; =  {of.input.V[12].O} {of.vtoi[7].X}
(assert (= of_99 of_76))
; 
; =  {sc.input.V[2].O} {sc.vadd[1].A}
(assert (= sc_91 sc_72))
; 
; =  {of.input.V[2].O} {of.vadd[1].A}
(assert (= of_91 of_72))
; 
; =  {sc.input.V[3].O} {sc.vadd[1].C}
(assert (= sc_113 sc_71))
; 
; =  {of.input.V[3].O} {of.vadd[1].C}
(assert (= of_113 of_71))
; 
; =  {sc.iadd[5].OUT} {sc.igenebind[4].TF}
(assert (= sc_148 sc_86))
; 
; =  {of.iadd[5].OUT} {of.igenebind[4].TF}
(assert (= of_148 of_86))
; 
; =  {sc.itov[0].Y} {sc.vadd[1].B}
(assert (= sc_128 sc_73))
; 
; =  {of.itov[0].Y} {of.vadd[1].B}
(assert (= of_128 of_73))
; 
; =  {sc.input.I[24].O} {sc.iadd[12].D}
(assert (= sc_39 sc_129))
; 
; =  {of.input.I[24].O} {of.iadd[12].D}
(assert (= of_39 of_129))
; 
; =  {sc.input.I[15].O} {sc.igenebind[4].K}
(assert (= sc_33 sc_87))
; 
; =  {of.input.I[15].O} {of.igenebind[4].K}
(assert (= of_33 of_87))
; 
; =  {sc.input.I[12].O} {sc.itov[12].X}
(assert (= sc_23 sc_120))
; 
; =  {of.input.I[12].O} {of.itov[12].X}
(assert (= of_23 of_120))
; 
; =  {sc.input.I[1].O} {sc.igenebind[4].Vmax}
(assert (= sc_51 sc_88))
; 
; =  {of.input.I[1].O} {of.igenebind[4].Vmax}
(assert (= of_51 of_88))
; 
; =  {sc.input.I[10].O} {sc.igenebind[2].Vmax}
(assert (= sc_31 sc_84))
; 
; =  {of.input.I[10].O} {of.igenebind[2].Vmax}
(assert (= of_31 of_84))
; 
; =  {sc.iadd[11].OUT} {sc.switch[10].SUB}
(assert (= sc_138 sc_5))
; 
; =  {of.iadd[11].OUT} {of.switch[10].SUB}
(assert (= of_138 of_5))
; 
; =  {sc.input.V[1].O} {sc.switch[10].n}
(assert (= sc_119 sc_4))
; 
; =  {of.input.V[1].O} {of.switch[10].n}
(assert (= of_119 of_4))
; 
; =  {sc.input.I[13].O} {sc.switch[14].Kmod}
(assert (= sc_21 sc_11))
; 
; =  {of.input.I[13].O} {of.switch[14].Kmod}
(assert (= of_21 of_11))
; 
; =  {sc.input.I[7].O} {sc.iadd[6].C}
(assert (= sc_19 sc_140))
; 
; =  {of.input.I[7].O} {of.iadd[6].C}
(assert (= of_19 of_140))
; 
; =  {sc.input.V[7].O} {sc.vadd[1].OUT2_0}
(assert (= sc_95 sc_69))
; 
; =  {of.input.V[7].O} {of.vadd[1].OUT2_0}
(assert (= of_95 of_69))
; 
; =  {sc.input.I[17].O} {sc.iadd[11].C}
(assert (= sc_53 sc_135))
; 
; =  {of.input.I[17].O} {of.iadd[11].C}
(assert (= of_53 of_135))
; 
; =  {sc.input.I[8].O} {sc.iadd[11].A}
(assert (= sc_17 sc_136))
; 
; =  {of.input.I[8].O} {of.iadd[11].A}
(assert (= of_17 of_136))
; 
; =  {sc.switch[14].PROD} {sc.iadd[12].A}
(assert (= sc_13 sc_131))
; 
; =  {of.switch[14].PROD} {of.iadd[12].A}
(assert (= of_13 of_131))
; 
; =  {sc.input.I[23].O} {sc.iadd[12].B}
(assert (= sc_49 sc_132))
; 
; =  {of.input.I[23].O} {of.iadd[12].B}
(assert (= of_49 of_132))
; 
; =  {sc.input.V[0].O} {sc.vgain[8].X}
(assert (= sc_103 sc_0))
; 
; =  {of.input.V[0].O} {of.vgain[8].X}
(assert (= of_103 of_0))
; 
; =  {sc.input.V[10].O} {sc.vadd[13].D}
(assert (= sc_107 sc_63))
; 
; =  {of.input.V[10].O} {of.vadd[13].D}
(assert (= of_107 of_63))
; 
; =  {sc.itov[9].Y} {sc.vgain[8].Z}
(assert (= sc_125 sc_2))
; 
; =  {of.itov[9].Y} {of.vgain[8].Z}
(assert (= of_125 of_2))
; 
; =  {sc.input.V[5].O} {sc.vadd[13].A}
(assert (= sc_117 sc_65))
; 
; =  {of.input.V[5].O} {of.vadd[13].A}
(assert (= of_117 of_65))
; 
; =  {sc.input.V[4].O} {sc.vadd[13].C}
(assert (= sc_115 sc_64))
; 
; =  {of.input.V[4].O} {of.vadd[13].C}
(assert (= of_115 of_64))
; 
; =  {sc.switch[10].PROD} {sc.itov[9].X}
(assert (= sc_8 sc_123))
; 
; =  {of.switch[10].PROD} {of.itov[9].X}
(assert (= of_8 of_123))
; 
; =  {sc.input.V[6].O} {sc.vadd[13].OUT2_0}
(assert (= sc_109 sc_62))
; 
; =  {of.input.V[6].O} {of.vadd[13].OUT2_0}
(assert (= of_109 of_62))
; 
; =  {sc.input.I[11].O} {sc.itov[0].X}
(assert (= sc_29 sc_126))
; 
; =  {of.input.I[11].O} {of.itov[0].X}
(assert (= of_29 of_126))
(assert (<= (* (/ 1. sc_59) 0.001) 0.1))
(assert (<= (* (/ 1. sc_61) 0.001) 0.1))
; 
; =  {sc.vadd[1].OUT2} {sc.output.V[0].O} {sc.vadd[13].OUT2} {sc.output.V[1].O}
(assert (and (and (= sc_75 sc_59) (= sc_75 sc_68)) (= sc_75 sc_61)))
(assert (= __minima__ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (ite (>= sltop_77 0.) sltop_77 (- sltop_77)) (ite (>= slbot_128 0.) slbot_128 (- slbot_128))) (ite (>= sltop_125 0.) sltop_125 (- sltop_125))) (ite (>= slbot_10 0.) slbot_10 (- slbot_10))) (ite (>= sltop_27 0.) sltop_27 (- sltop_27))) (ite (>= sltop_66 0.) sltop_66 (- sltop_66))) (ite (>= slbot_3 0.) slbot_3 (- slbot_3))) (ite (>= slbot_133 0.) slbot_133 (- slbot_133))) (ite (>= slbot_26 0.) slbot_26 (- slbot_26))) (ite (>= slbot_59 0.) slbot_59 (- slbot_59))) (ite (>= slbot_2 0.) slbot_2 (- slbot_2))) (ite (>= sltop_10 0.) sltop_10 (- sltop_10))) (ite (>= sltop_58 0.) sltop_58 (- sltop_58))) (ite (>= slbot_122 0.) slbot_122 (- slbot_122))) (ite (>= sltop_138 0.) sltop_138 (- sltop_138))) (ite (>= slbot_143 0.) slbot_143 (- slbot_143))) (ite (>= slbot_85 0.) slbot_85 (- slbot_85))) (ite (>= sltop_121 0.) sltop_121 (- sltop_121))) (ite (>= slbot_127 0.) slbot_127 (- slbot_127))) (ite (>= slbot_125 0.) slbot_125 (- slbot_125))) (ite (>= sltop_128 0.) sltop_128 (- sltop_128))) (ite (>= sltop_2 0.) sltop_2 (- sltop_2))) (ite (>= sltop_8 0.) sltop_8 (- sltop_8))) (ite (>= sltop_13 0.) sltop_13 (- sltop_13))) (ite (>= sltop_85 0.) sltop_85 (- sltop_85))) (ite (>= slbot_131 0.) slbot_131 (- slbot_131))) (ite (>= sltop_74 0.) sltop_74 (- sltop_74))) (ite (>= sltop_133 0.) sltop_133 (- sltop_133))) (ite (>= slbot_81 0.) slbot_81 (- slbot_81))) (ite (>= sltop_131 0.) sltop_131 (- sltop_131))) (ite (>= slbot_138 0.) slbot_138 (- slbot_138))) (ite (>= slbot_5 0.) slbot_5 (- slbot_5))) (ite (>= slbot_68 0.) slbot_68 (- slbot_68))) (ite (>= sltop_86 0.) sltop_86 (- sltop_86))) (ite (>= slbot_121 0.) slbot_121 (- slbot_121))) (ite (>= sltop_68 0.) sltop_68 (- sltop_68))) (ite (>= sltop_75 0.) sltop_75 (- sltop_75))) (ite (>= slbot_77 0.) slbot_77 (- slbot_77))) (ite (>= slbot_75 0.) slbot_75 (- slbot_75))) (ite (>= slbot_79 0.) slbot_79 (- slbot_79))) (ite (>= sltop_3 0.) sltop_3 (- sltop_3))) (ite (>= slbot_27 0.) slbot_27 (- slbot_27))) (ite (>= sltop_143 0.) sltop_143 (- sltop_143))) (ite (>= slbot_12 0.) slbot_12 (- slbot_12))) (ite (>= slbot_66 0.) slbot_66 (- slbot_66))) (ite (>= slbot_89 0.) slbot_89 (- slbot_89))) (ite (>= slbot_13 0.) slbot_13 (- slbot_13))) (ite (>= slbot_78 0.) slbot_78 (- slbot_78))) (ite (>= sltop_127 0.) sltop_127 (- sltop_127))) (ite (>= slbot_134 0.) slbot_134 (- slbot_134))) (ite (>= slbot_60 0.) slbot_60 (- slbot_60))) (ite (>= sltop_81 0.) sltop_81 (- sltop_81))) (ite (>= slbot_83 0.) slbot_83 (- slbot_83))) (ite (>= sltop_79 0.) sltop_79 (- sltop_79))) (ite (>= sltop_123 0.) sltop_123 (- sltop_123))) (ite (>= sltop_147 0.) sltop_147 (- sltop_147))) (ite (>= slbot_61 0.) slbot_61 (- slbot_61))) (ite (>= sltop_67 0.) sltop_67 (- sltop_67))) (ite (>= sltop_89 0.) sltop_89 (- sltop_89))) (ite (>= sltop_12 0.) sltop_12 (- sltop_12))) (ite (>= sltop_5 0.) sltop_5 (- sltop_5))) (ite (>= slbot_67 0.) slbot_67 (- slbot_67))) (ite (>= sltop_60 0.) sltop_60 (- sltop_60))) (ite (>= slbot_142 0.) slbot_142 (- slbot_142))) (ite (>= slbot_73 0.) slbot_73 (- slbot_73))) (ite (>= slbot_86 0.) slbot_86 (- slbot_86))) (ite (>= sltop_142 0.) sltop_142 (- sltop_142))) (ite (>= sltop_78 0.) sltop_78 (- sltop_78))) (ite (>= slbot_147 0.) slbot_147 (- slbot_147))) (ite (>= sltop_134 0.) sltop_134 (- sltop_134))) (ite (>= sltop_83 0.) sltop_83 (- sltop_83))) (ite (>= slbot_123 0.) slbot_123 (- slbot_123))) (ite (>= sltop_148 0.) sltop_148 (- sltop_148))) (ite (>= sltop_61 0.) sltop_61 (- sltop_61))) (ite (>= slbot_74 0.) slbot_74 (- slbot_74))) (ite (>= sltop_122 0.) sltop_122 (- sltop_122))) (ite (>= slbot_148 0.) slbot_148 (- slbot_148))) (ite (>= sltop_73 0.) sltop_73 (- sltop_73))) (ite (>= sltop_26 0.) sltop_26 (- sltop_26))) (ite (>= slbot_58 0.) slbot_58 (- slbot_58))) (ite (>= slbot_8 0.) slbot_8 (- slbot_8))) (ite (>= sltop_59 0.) sltop_59 (- sltop_59)))))
(check-sat)
