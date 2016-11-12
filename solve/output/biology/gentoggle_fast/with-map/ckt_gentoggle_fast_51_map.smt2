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
; =  {(sc.switch[15].SUB/sc.switch[15].Kmod)} {1.}
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
; =  {sc.switch[15].PROD} {(sc.switch[15].Vmax/1.)}
(assert (= sc_13 (/ sc_12 1.)))
; 
; =  {of.switch[15].PROD} {0.}
(assert (= of_13 0.))
; 
; >=  {((sc.switch[15].n*1000.75)+of.switch[15].n)} {3300.}
(assert (<= (+ (* sc_9 1000.75) of_9) 3300.))
; 
; <=  {((sc.switch[15].n*1000.75)+of.switch[15].n)} {0.5}
(assert (>= (+ (* sc_9 1000.75) of_9) 0.5))
; 
; >=  {((sc.switch[15].SUB*337.632520764)+of.switch[15].SUB)} {10.}
(assert (<= (+ (* sc_10 337.632520764) of_10) 10.))
; 
; <=  {((sc.switch[15].SUB*337.632520764)+of.switch[15].SUB)} {0.0001}
(assert (>= (+ (* sc_10 337.632520764) of_10) 0.0001))
(declare-fun slbot_11 () Real)
(declare-fun sltop_11 () Real)
; 
; =  {(((sc.switch[15].Kmod*0.)+of.switch[15].Kmod)+sl.min.switch[15].Kmod)} {0.0001}
(assert (= (+ (+ (* sc_11 0.) of_11) slbot_11) 0.0001))
; 
; =  {(((sc.switch[15].Kmod*1.66666666667)+of.switch[15].Kmod)+sl.max.switch[15].Kmod)} {10.}
(assert (= (+ (+ (* sc_11 1.66666666667) of_11) sltop_11) 10.))
(declare-fun slbot_13 () Real)
(declare-fun sltop_13 () Real)
; 
; =  {(((sc.switch[15].PROD*0.)+of.switch[15].PROD)+sl.min.switch[15].PROD)} {9.99934002508e-38}
(assert (= (+ (+ (* sc_13 0.) of_13) slbot_13) 9.99934002508e-38))
; 
; =  {(((sc.switch[15].PROD*15.6)+of.switch[15].PROD)+sl.max.switch[15].PROD)} {9.9999999}
(assert (= (+ (+ (* sc_13 15.6) of_13) sltop_13) 9.9999999))
(declare-fun slbot_12 () Real)
(declare-fun sltop_12 () Real)
; 
; =  {(((sc.switch[15].Vmax*0.)+of.switch[15].Vmax)+sl.min.switch[15].Vmax)} {0.0001}
(assert (= (+ (+ (* sc_12 0.) of_12) slbot_12) 0.0001))
; 
; =  {(((sc.switch[15].Vmax*15.6)+of.switch[15].Vmax)+sl.max.switch[15].Vmax)} {10.}
(assert (= (+ (+ (* sc_12 15.6) of_12) sltop_12) 10.))
(declare-fun slbot_13 () Real)
(declare-fun sltop_13 () Real)
; 
; =  {(((sc.switch[15].PROD*0.)+of.switch[15].PROD)+sl.min.switch[15].PROD)} {9.99934002508e-38}
(assert (= (+ (+ (* sc_13 0.) of_13) slbot_13) 9.99934002508e-38))
; 
; =  {(((sc.switch[15].PROD*15.6)+of.switch[15].PROD)+sl.max.switch[15].PROD)} {9.9999999}
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
; =  {sc.input.I[20].O} {sc.input.I[20].X}
(assert (= sc_17 sc_16))
; 
; =  {of.input.I[20].O} {of.input.I[20].X}
(assert (= of_17 of_16))
; 
; >=  {((sc.input.I[20].X*1.)+of.input.I[20].X)} {10.}
(assert (<= (+ (* sc_16 1.) of_16) 10.))
; 
; <=  {((sc.input.I[20].X*1.)+of.input.I[20].X)} {0.}
(assert (>= (+ (* sc_16 1.) of_16) 0.))
; 
; >=  {((sc.input.I[20].O*1.)+of.input.I[20].O)} {10.}
(assert (<= (+ (* sc_17 1.) of_17) 10.))
; 
; <=  {((sc.input.I[20].O*1.)+of.input.I[20].O)} {0.}
(assert (>= (+ (* sc_17 1.) of_17) 0.))
(declare-fun sc_18 () Real)
(assert (> sc_18 1e-08))
(declare-fun of_18 () Real)
(declare-fun sc_19 () Real)
(assert (> sc_19 1e-08))
(declare-fun of_19 () Real)
; 
; =  {sc.input.I[8].O} {sc.input.I[8].X}
(assert (= sc_19 sc_18))
; 
; =  {of.input.I[8].O} {of.input.I[8].X}
(assert (= of_19 of_18))
; 
; >=  {((sc.input.I[8].X*0.)+of.input.I[8].X)} {10.}
(assert (<= (+ (* sc_18 0.) of_18) 10.))
; 
; <=  {((sc.input.I[8].X*0.)+of.input.I[8].X)} {0.}
(assert (>= (+ (* sc_18 0.) of_18) 0.))
; 
; >=  {((sc.input.I[8].O*0.)+of.input.I[8].O)} {10.}
(assert (<= (+ (* sc_19 0.) of_19) 10.))
; 
; <=  {((sc.input.I[8].O*0.)+of.input.I[8].O)} {0.}
(assert (>= (+ (* sc_19 0.) of_19) 0.))
(declare-fun sc_20 () Real)
(assert (> sc_20 1e-08))
(declare-fun of_20 () Real)
(declare-fun sc_21 () Real)
(assert (> sc_21 1e-08))
(declare-fun of_21 () Real)
; 
; =  {sc.input.I[7].O} {sc.input.I[7].X}
(assert (= sc_21 sc_20))
; 
; =  {of.input.I[7].O} {of.input.I[7].X}
(assert (= of_21 of_20))
; 
; >=  {((sc.input.I[7].X*0.)+of.input.I[7].X)} {10.}
(assert (<= (+ (* sc_20 0.) of_20) 10.))
; 
; <=  {((sc.input.I[7].X*0.)+of.input.I[7].X)} {0.}
(assert (>= (+ (* sc_20 0.) of_20) 0.))
; 
; >=  {((sc.input.I[7].O*0.)+of.input.I[7].O)} {10.}
(assert (<= (+ (* sc_21 0.) of_21) 10.))
; 
; <=  {((sc.input.I[7].O*0.)+of.input.I[7].O)} {0.}
(assert (>= (+ (* sc_21 0.) of_21) 0.))
(declare-fun sc_22 () Real)
(assert (> sc_22 1e-08))
(declare-fun of_22 () Real)
(declare-fun sc_23 () Real)
(assert (> sc_23 1e-08))
(declare-fun of_23 () Real)
; 
; =  {sc.input.I[13].O} {sc.input.I[13].X}
(assert (= sc_23 sc_22))
; 
; =  {of.input.I[13].O} {of.input.I[13].X}
(assert (= of_23 of_22))
; 
; >=  {((sc.input.I[13].X*0.)+of.input.I[13].X)} {10.}
(assert (<= (+ (* sc_22 0.) of_22) 10.))
; 
; <=  {((sc.input.I[13].X*0.)+of.input.I[13].X)} {0.}
(assert (>= (+ (* sc_22 0.) of_22) 0.))
; 
; >=  {((sc.input.I[13].O*0.)+of.input.I[13].O)} {10.}
(assert (<= (+ (* sc_23 0.) of_23) 10.))
; 
; <=  {((sc.input.I[13].O*0.)+of.input.I[13].O)} {0.}
(assert (>= (+ (* sc_23 0.) of_23) 0.))
(declare-fun sc_24 () Real)
(assert (> sc_24 1e-08))
(declare-fun of_24 () Real)
(declare-fun sc_25 () Real)
(assert (> sc_25 1e-08))
(declare-fun of_25 () Real)
; 
; =  {sc.input.I[12].O} {sc.input.I[12].X}
(assert (= sc_25 sc_24))
; 
; =  {of.input.I[12].O} {of.input.I[12].X}
(assert (= of_25 of_24))
; 
; >=  {((sc.input.I[12].X*0.)+of.input.I[12].X)} {10.}
(assert (<= (+ (* sc_24 0.) of_24) 10.))
; 
; <=  {((sc.input.I[12].X*0.)+of.input.I[12].X)} {0.}
(assert (>= (+ (* sc_24 0.) of_24) 0.))
; 
; >=  {((sc.input.I[12].O*0.)+of.input.I[12].O)} {10.}
(assert (<= (+ (* sc_25 0.) of_25) 10.))
; 
; <=  {((sc.input.I[12].O*0.)+of.input.I[12].O)} {0.}
(assert (>= (+ (* sc_25 0.) of_25) 0.))
(declare-fun sc_26 () Real)
(assert (> sc_26 1e-08))
(declare-fun of_26 () Real)
(declare-fun sc_27 () Real)
(assert (> sc_27 1e-08))
(declare-fun of_27 () Real)
; 
; =  {sc.input.I[9].O} {sc.input.I[9].X}
(assert (= sc_27 sc_26))
; 
; =  {of.input.I[9].O} {of.input.I[9].X}
(assert (= of_27 of_26))
; 
; >=  {((sc.input.I[9].X*0.)+of.input.I[9].X)} {10.}
(assert (<= (+ (* sc_26 0.) of_26) 10.))
; 
; <=  {((sc.input.I[9].X*0.)+of.input.I[9].X)} {0.}
(assert (>= (+ (* sc_26 0.) of_26) 0.))
; 
; >=  {((sc.input.I[9].O*0.)+of.input.I[9].O)} {10.}
(assert (<= (+ (* sc_27 0.) of_27) 10.))
; 
; <=  {((sc.input.I[9].O*0.)+of.input.I[9].O)} {0.}
(assert (>= (+ (* sc_27 0.) of_27) 0.))
(declare-fun sc_28 () Real)
(assert (> sc_28 1e-08))
(declare-fun of_28 () Real)
(declare-fun sc_29 () Real)
(assert (> sc_29 1e-08))
(declare-fun of_29 () Real)
; 
; =  {sc.input.I[0].O} {sc.input.I[0].X}
(assert (= sc_29 sc_28))
; 
; =  {of.input.I[0].O} {of.input.I[0].X}
(assert (= of_29 of_28))
; 
; >=  {((sc.input.I[0].X*156.25)+of.input.I[0].X)} {10.}
(assert (<= (+ (* sc_28 156.25) of_28) 10.))
; 
; <=  {((sc.input.I[0].X*156.25)+of.input.I[0].X)} {0.}
(assert (>= (+ (* sc_28 156.25) of_28) 0.))
; 
; >=  {((sc.input.I[0].O*156.25)+of.input.I[0].O)} {10.}
(assert (<= (+ (* sc_29 156.25) of_29) 10.))
; 
; <=  {((sc.input.I[0].O*156.25)+of.input.I[0].O)} {0.}
(assert (>= (+ (* sc_29 156.25) of_29) 0.))
(declare-fun sc_30 () Real)
(assert (> sc_30 1e-08))
(declare-fun of_30 () Real)
(declare-fun sc_31 () Real)
(assert (> sc_31 1e-08))
(declare-fun of_31 () Real)
; 
; =  {sc.input.I[11].O} {sc.input.I[11].X}
(assert (= sc_31 sc_30))
; 
; =  {of.input.I[11].O} {of.input.I[11].X}
(assert (= of_31 of_30))
; 
; >=  {((sc.input.I[11].X*0.)+of.input.I[11].X)} {10.}
(assert (<= (+ (* sc_30 0.) of_30) 10.))
; 
; <=  {((sc.input.I[11].X*0.)+of.input.I[11].X)} {0.}
(assert (>= (+ (* sc_30 0.) of_30) 0.))
; 
; >=  {((sc.input.I[11].O*0.)+of.input.I[11].O)} {10.}
(assert (<= (+ (* sc_31 0.) of_31) 10.))
; 
; <=  {((sc.input.I[11].O*0.)+of.input.I[11].O)} {0.}
(assert (>= (+ (* sc_31 0.) of_31) 0.))
(declare-fun sc_32 () Real)
(assert (> sc_32 1e-08))
(declare-fun of_32 () Real)
(declare-fun sc_33 () Real)
(assert (> sc_33 1e-08))
(declare-fun of_33 () Real)
; 
; =  {sc.input.I[26].O} {sc.input.I[26].X}
(assert (= sc_33 sc_32))
; 
; =  {of.input.I[26].O} {of.input.I[26].X}
(assert (= of_33 of_32))
; 
; >=  {((sc.input.I[26].X*0.)+of.input.I[26].X)} {10.}
(assert (<= (+ (* sc_32 0.) of_32) 10.))
; 
; <=  {((sc.input.I[26].X*0.)+of.input.I[26].X)} {0.}
(assert (>= (+ (* sc_32 0.) of_32) 0.))
; 
; >=  {((sc.input.I[26].O*0.)+of.input.I[26].O)} {10.}
(assert (<= (+ (* sc_33 0.) of_33) 10.))
; 
; <=  {((sc.input.I[26].O*0.)+of.input.I[26].O)} {0.}
(assert (>= (+ (* sc_33 0.) of_33) 0.))
(declare-fun sc_34 () Real)
(assert (> sc_34 1e-08))
(declare-fun of_34 () Real)
(declare-fun sc_35 () Real)
(assert (> sc_35 1e-08))
(declare-fun of_35 () Real)
; 
; =  {sc.input.I[10].O} {sc.input.I[10].X}
(assert (= sc_35 sc_34))
; 
; =  {of.input.I[10].O} {of.input.I[10].X}
(assert (= of_35 of_34))
; 
; >=  {((sc.input.I[10].X*0.)+of.input.I[10].X)} {10.}
(assert (<= (+ (* sc_34 0.) of_34) 10.))
; 
; <=  {((sc.input.I[10].X*0.)+of.input.I[10].X)} {0.}
(assert (>= (+ (* sc_34 0.) of_34) 0.))
; 
; >=  {((sc.input.I[10].O*0.)+of.input.I[10].O)} {10.}
(assert (<= (+ (* sc_35 0.) of_35) 10.))
; 
; <=  {((sc.input.I[10].O*0.)+of.input.I[10].O)} {0.}
(assert (>= (+ (* sc_35 0.) of_35) 0.))
(declare-fun sc_36 () Real)
(assert (> sc_36 1e-08))
(declare-fun of_36 () Real)
(declare-fun sc_37 () Real)
(assert (> sc_37 1e-08))
(declare-fun of_37 () Real)
; 
; =  {sc.input.I[15].O} {sc.input.I[15].X}
(assert (= sc_37 sc_36))
; 
; =  {of.input.I[15].O} {of.input.I[15].X}
(assert (= of_37 of_36))
; 
; >=  {((sc.input.I[15].X*337.632520764)+of.input.I[15].X)} {10.}
(assert (<= (+ (* sc_36 337.632520764) of_36) 10.))
; 
; <=  {((sc.input.I[15].X*337.632520764)+of.input.I[15].X)} {0.}
(assert (>= (+ (* sc_36 337.632520764) of_36) 0.))
; 
; >=  {((sc.input.I[15].O*337.632520764)+of.input.I[15].O)} {10.}
(assert (<= (+ (* sc_37 337.632520764) of_37) 10.))
; 
; <=  {((sc.input.I[15].O*337.632520764)+of.input.I[15].O)} {0.}
(assert (>= (+ (* sc_37 337.632520764) of_37) 0.))
(declare-fun sc_38 () Real)
(assert (> sc_38 1e-08))
(declare-fun of_38 () Real)
(declare-fun sc_39 () Real)
(assert (> sc_39 1e-08))
(declare-fun of_39 () Real)
; 
; =  {sc.input.I[6].O} {sc.input.I[6].X}
(assert (= sc_39 sc_38))
; 
; =  {of.input.I[6].O} {of.input.I[6].X}
(assert (= of_39 of_38))
; 
; >=  {((sc.input.I[6].X*0.)+of.input.I[6].X)} {10.}
(assert (<= (+ (* sc_38 0.) of_38) 10.))
; 
; <=  {((sc.input.I[6].X*0.)+of.input.I[6].X)} {0.}
(assert (>= (+ (* sc_38 0.) of_38) 0.))
; 
; >=  {((sc.input.I[6].O*0.)+of.input.I[6].O)} {10.}
(assert (<= (+ (* sc_39 0.) of_39) 10.))
; 
; <=  {((sc.input.I[6].O*0.)+of.input.I[6].O)} {0.}
(assert (>= (+ (* sc_39 0.) of_39) 0.))
(declare-fun sc_40 () Real)
(assert (> sc_40 1e-08))
(declare-fun of_40 () Real)
(declare-fun sc_41 () Real)
(assert (> sc_41 1e-08))
(declare-fun of_41 () Real)
; 
; =  {sc.input.I[14].O} {sc.input.I[14].X}
(assert (= sc_41 sc_40))
; 
; =  {of.input.I[14].O} {of.input.I[14].X}
(assert (= of_41 of_40))
; 
; >=  {((sc.input.I[14].X*0.)+of.input.I[14].X)} {10.}
(assert (<= (+ (* sc_40 0.) of_40) 10.))
; 
; <=  {((sc.input.I[14].X*0.)+of.input.I[14].X)} {0.}
(assert (>= (+ (* sc_40 0.) of_40) 0.))
; 
; >=  {((sc.input.I[14].O*0.)+of.input.I[14].O)} {10.}
(assert (<= (+ (* sc_41 0.) of_41) 10.))
; 
; <=  {((sc.input.I[14].O*0.)+of.input.I[14].O)} {0.}
(assert (>= (+ (* sc_41 0.) of_41) 0.))
(declare-fun sc_42 () Real)
(assert (> sc_42 1e-08))
(declare-fun of_42 () Real)
(declare-fun sc_43 () Real)
(assert (> sc_43 1e-08))
(declare-fun of_43 () Real)
; 
; =  {sc.input.I[21].O} {sc.input.I[21].X}
(assert (= sc_43 sc_42))
; 
; =  {of.input.I[21].O} {of.input.I[21].X}
(assert (= of_43 of_42))
; 
; >=  {((sc.input.I[21].X*1.)+of.input.I[21].X)} {10.}
(assert (<= (+ (* sc_42 1.) of_42) 10.))
; 
; <=  {((sc.input.I[21].X*1.)+of.input.I[21].X)} {0.}
(assert (>= (+ (* sc_42 1.) of_42) 0.))
; 
; >=  {((sc.input.I[21].O*1.)+of.input.I[21].O)} {10.}
(assert (<= (+ (* sc_43 1.) of_43) 10.))
; 
; <=  {((sc.input.I[21].O*1.)+of.input.I[21].O)} {0.}
(assert (>= (+ (* sc_43 1.) of_43) 0.))
(declare-fun sc_44 () Real)
(assert (> sc_44 1e-08))
(declare-fun of_44 () Real)
(declare-fun sc_45 () Real)
(assert (> sc_45 1e-08))
(declare-fun of_45 () Real)
; 
; =  {sc.input.I[24].O} {sc.input.I[24].X}
(assert (= sc_45 sc_44))
; 
; =  {of.input.I[24].O} {of.input.I[24].X}
(assert (= of_45 of_44))
; 
; >=  {((sc.input.I[24].X*0.)+of.input.I[24].X)} {10.}
(assert (<= (+ (* sc_44 0.) of_44) 10.))
; 
; <=  {((sc.input.I[24].X*0.)+of.input.I[24].X)} {0.}
(assert (>= (+ (* sc_44 0.) of_44) 0.))
; 
; >=  {((sc.input.I[24].O*0.)+of.input.I[24].O)} {10.}
(assert (<= (+ (* sc_45 0.) of_45) 10.))
; 
; <=  {((sc.input.I[24].O*0.)+of.input.I[24].O)} {0.}
(assert (>= (+ (* sc_45 0.) of_45) 0.))
(declare-fun sc_46 () Real)
(assert (> sc_46 1e-08))
(declare-fun of_46 () Real)
(declare-fun sc_47 () Real)
(assert (> sc_47 1e-08))
(declare-fun of_47 () Real)
; 
; =  {sc.input.I[16].O} {sc.input.I[16].X}
(assert (= sc_47 sc_46))
; 
; =  {of.input.I[16].O} {of.input.I[16].X}
(assert (= of_47 of_46))
; 
; >=  {((sc.input.I[16].X*15.6)+of.input.I[16].X)} {10.}
(assert (<= (+ (* sc_46 15.6) of_46) 10.))
; 
; <=  {((sc.input.I[16].X*15.6)+of.input.I[16].X)} {0.}
(assert (>= (+ (* sc_46 15.6) of_46) 0.))
; 
; >=  {((sc.input.I[16].O*15.6)+of.input.I[16].O)} {10.}
(assert (<= (+ (* sc_47 15.6) of_47) 10.))
; 
; <=  {((sc.input.I[16].O*15.6)+of.input.I[16].O)} {0.}
(assert (>= (+ (* sc_47 15.6) of_47) 0.))
(declare-fun sc_48 () Real)
(assert (> sc_48 1e-08))
(declare-fun of_48 () Real)
(declare-fun sc_49 () Real)
(assert (> sc_49 1e-08))
(declare-fun of_49 () Real)
; 
; =  {sc.input.I[3].O} {sc.input.I[3].X}
(assert (= sc_49 sc_48))
; 
; =  {of.input.I[3].O} {of.input.I[3].X}
(assert (= of_49 of_48))
; 
; >=  {((sc.input.I[3].X*0.)+of.input.I[3].X)} {10.}
(assert (<= (+ (* sc_48 0.) of_48) 10.))
; 
; <=  {((sc.input.I[3].X*0.)+of.input.I[3].X)} {0.}
(assert (>= (+ (* sc_48 0.) of_48) 0.))
; 
; >=  {((sc.input.I[3].O*0.)+of.input.I[3].O)} {10.}
(assert (<= (+ (* sc_49 0.) of_49) 10.))
; 
; <=  {((sc.input.I[3].O*0.)+of.input.I[3].O)} {0.}
(assert (>= (+ (* sc_49 0.) of_49) 0.))
(declare-fun sc_50 () Real)
(assert (> sc_50 1e-08))
(declare-fun of_50 () Real)
(declare-fun sc_51 () Real)
(assert (> sc_51 1e-08))
(declare-fun of_51 () Real)
; 
; =  {sc.input.I[4].O} {sc.input.I[4].X}
(assert (= sc_51 sc_50))
; 
; =  {of.input.I[4].O} {of.input.I[4].X}
(assert (= of_51 of_50))
; 
; >=  {((sc.input.I[4].X*0.)+of.input.I[4].X)} {10.}
(assert (<= (+ (* sc_50 0.) of_50) 10.))
; 
; <=  {((sc.input.I[4].X*0.)+of.input.I[4].X)} {0.}
(assert (>= (+ (* sc_50 0.) of_50) 0.))
; 
; >=  {((sc.input.I[4].O*0.)+of.input.I[4].O)} {10.}
(assert (<= (+ (* sc_51 0.) of_51) 10.))
; 
; <=  {((sc.input.I[4].O*0.)+of.input.I[4].O)} {0.}
(assert (>= (+ (* sc_51 0.) of_51) 0.))
(declare-fun sc_52 () Real)
(assert (> sc_52 1e-08))
(declare-fun of_52 () Real)
(declare-fun sc_53 () Real)
(assert (> sc_53 1e-08))
(declare-fun of_53 () Real)
; 
; =  {sc.input.I[5].O} {sc.input.I[5].X}
(assert (= sc_53 sc_52))
; 
; =  {of.input.I[5].O} {of.input.I[5].X}
(assert (= of_53 of_52))
; 
; >=  {((sc.input.I[5].X*0.)+of.input.I[5].X)} {10.}
(assert (<= (+ (* sc_52 0.) of_52) 10.))
; 
; <=  {((sc.input.I[5].X*0.)+of.input.I[5].X)} {0.}
(assert (>= (+ (* sc_52 0.) of_52) 0.))
; 
; >=  {((sc.input.I[5].O*0.)+of.input.I[5].O)} {10.}
(assert (<= (+ (* sc_53 0.) of_53) 10.))
; 
; <=  {((sc.input.I[5].O*0.)+of.input.I[5].O)} {0.}
(assert (>= (+ (* sc_53 0.) of_53) 0.))
(declare-fun sc_54 () Real)
(assert (> sc_54 1e-08))
(declare-fun of_54 () Real)
(declare-fun sc_55 () Real)
(assert (> sc_55 1e-08))
(declare-fun of_55 () Real)
; 
; =  {sc.input.I[25].O} {sc.input.I[25].X}
(assert (= sc_55 sc_54))
; 
; =  {of.input.I[25].O} {of.input.I[25].X}
(assert (= of_55 of_54))
; 
; >=  {((sc.input.I[25].X*0.)+of.input.I[25].X)} {10.}
(assert (<= (+ (* sc_54 0.) of_54) 10.))
; 
; <=  {((sc.input.I[25].X*0.)+of.input.I[25].X)} {0.}
(assert (>= (+ (* sc_54 0.) of_54) 0.))
; 
; >=  {((sc.input.I[25].O*0.)+of.input.I[25].O)} {10.}
(assert (<= (+ (* sc_55 0.) of_55) 10.))
; 
; <=  {((sc.input.I[25].O*0.)+of.input.I[25].O)} {0.}
(assert (>= (+ (* sc_55 0.) of_55) 0.))
(declare-fun sc_56 () Real)
(assert (> sc_56 1e-08))
(declare-fun of_56 () Real)
(declare-fun sc_57 () Real)
(assert (> sc_57 1e-08))
(declare-fun of_57 () Real)
; 
; =  {sc.input.I[23].O} {sc.input.I[23].X}
(assert (= sc_57 sc_56))
; 
; =  {of.input.I[23].O} {of.input.I[23].X}
(assert (= of_57 of_56))
; 
; >=  {((sc.input.I[23].X*1.)+of.input.I[23].X)} {10.}
(assert (<= (+ (* sc_56 1.) of_56) 10.))
; 
; <=  {((sc.input.I[23].X*1.)+of.input.I[23].X)} {0.}
(assert (>= (+ (* sc_56 1.) of_56) 0.))
; 
; >=  {((sc.input.I[23].O*1.)+of.input.I[23].O)} {10.}
(assert (<= (+ (* sc_57 1.) of_57) 10.))
; 
; <=  {((sc.input.I[23].O*1.)+of.input.I[23].O)} {0.}
(assert (>= (+ (* sc_57 1.) of_57) 0.))
(declare-fun sc_58 () Real)
(assert (> sc_58 1e-08))
(declare-fun of_58 () Real)
(declare-fun sc_59 () Real)
(assert (> sc_59 1e-08))
(declare-fun of_59 () Real)
; 
; =  {sc.input.I[1].O} {sc.input.I[1].X}
(assert (= sc_59 sc_58))
; 
; =  {of.input.I[1].O} {of.input.I[1].X}
(assert (= of_59 of_58))
; 
; >=  {((sc.input.I[1].X*0.)+of.input.I[1].X)} {10.}
(assert (<= (+ (* sc_58 0.) of_58) 10.))
; 
; <=  {((sc.input.I[1].X*0.)+of.input.I[1].X)} {0.}
(assert (>= (+ (* sc_58 0.) of_58) 0.))
; 
; >=  {((sc.input.I[1].O*0.)+of.input.I[1].O)} {10.}
(assert (<= (+ (* sc_59 0.) of_59) 10.))
; 
; <=  {((sc.input.I[1].O*0.)+of.input.I[1].O)} {0.}
(assert (>= (+ (* sc_59 0.) of_59) 0.))
(declare-fun sc_60 () Real)
(assert (> sc_60 1e-08))
(declare-fun of_60 () Real)
(declare-fun sc_61 () Real)
(assert (> sc_61 1e-08))
(declare-fun of_61 () Real)
; 
; =  {sc.input.I[17].O} {sc.input.I[17].X}
(assert (= sc_61 sc_60))
; 
; =  {of.input.I[17].O} {of.input.I[17].X}
(assert (= of_61 of_60))
; 
; >=  {((sc.input.I[17].X*4.)+of.input.I[17].X)} {10.}
(assert (<= (+ (* sc_60 4.) of_60) 10.))
; 
; <=  {((sc.input.I[17].X*4.)+of.input.I[17].X)} {0.}
(assert (>= (+ (* sc_60 4.) of_60) 0.))
; 
; >=  {((sc.input.I[17].O*4.)+of.input.I[17].O)} {10.}
(assert (<= (+ (* sc_61 4.) of_61) 10.))
; 
; <=  {((sc.input.I[17].O*4.)+of.input.I[17].O)} {0.}
(assert (>= (+ (* sc_61 4.) of_61) 0.))
(declare-fun sc_62 () Real)
(assert (> sc_62 1e-08))
(declare-fun of_62 () Real)
(declare-fun sc_63 () Real)
(assert (> sc_63 1e-08))
(declare-fun of_63 () Real)
; 
; =  {sc.input.I[18].O} {sc.input.I[18].X}
(assert (= sc_63 sc_62))
; 
; =  {of.input.I[18].O} {of.input.I[18].X}
(assert (= of_63 of_62))
; 
; >=  {((sc.input.I[18].X*4.)+of.input.I[18].X)} {10.}
(assert (<= (+ (* sc_62 4.) of_62) 10.))
; 
; <=  {((sc.input.I[18].X*4.)+of.input.I[18].X)} {0.}
(assert (>= (+ (* sc_62 4.) of_62) 0.))
; 
; >=  {((sc.input.I[18].O*4.)+of.input.I[18].O)} {10.}
(assert (<= (+ (* sc_63 4.) of_63) 10.))
; 
; <=  {((sc.input.I[18].O*4.)+of.input.I[18].O)} {0.}
(assert (>= (+ (* sc_63 4.) of_63) 0.))
(declare-fun sc_64 () Real)
(assert (> sc_64 1e-08))
(declare-fun of_64 () Real)
(declare-fun sc_65 () Real)
(assert (> sc_65 1e-08))
(declare-fun of_65 () Real)
; 
; =  {sc.input.I[19].O} {sc.input.I[19].X}
(assert (= sc_65 sc_64))
; 
; =  {of.input.I[19].O} {of.input.I[19].X}
(assert (= of_65 of_64))
; 
; >=  {((sc.input.I[19].X*1.)+of.input.I[19].X)} {10.}
(assert (<= (+ (* sc_64 1.) of_64) 10.))
; 
; <=  {((sc.input.I[19].X*1.)+of.input.I[19].X)} {0.}
(assert (>= (+ (* sc_64 1.) of_64) 0.))
; 
; >=  {((sc.input.I[19].O*1.)+of.input.I[19].O)} {10.}
(assert (<= (+ (* sc_65 1.) of_65) 10.))
; 
; <=  {((sc.input.I[19].O*1.)+of.input.I[19].O)} {0.}
(assert (>= (+ (* sc_65 1.) of_65) 0.))
(declare-fun sc_66 () Real)
(assert (> sc_66 1e-08))
(declare-fun of_66 () Real)
(declare-fun sc_67 () Real)
(assert (> sc_67 1e-08))
(declare-fun of_67 () Real)
; 
; =  {sc.input.I[22].O} {sc.input.I[22].X}
(assert (= sc_67 sc_66))
; 
; =  {of.input.I[22].O} {of.input.I[22].X}
(assert (= of_67 of_66))
; 
; >=  {((sc.input.I[22].X*1.)+of.input.I[22].X)} {10.}
(assert (<= (+ (* sc_66 1.) of_66) 10.))
; 
; <=  {((sc.input.I[22].X*1.)+of.input.I[22].X)} {0.}
(assert (>= (+ (* sc_66 1.) of_66) 0.))
; 
; >=  {((sc.input.I[22].O*1.)+of.input.I[22].O)} {10.}
(assert (<= (+ (* sc_67 1.) of_67) 10.))
; 
; <=  {((sc.input.I[22].O*1.)+of.input.I[22].O)} {0.}
(assert (>= (+ (* sc_67 1.) of_67) 0.))
(declare-fun sc_68 () Real)
(assert (> sc_68 1e-08))
(declare-fun of_68 () Real)
(declare-fun sc_69 () Real)
(assert (> sc_69 1e-08))
(declare-fun of_69 () Real)
; 
; =  {sc.output.V[0].O} {sc.output.V[0].X}
(assert (= sc_69 sc_68))
; 
; =  {of.output.V[0].O} {of.output.V[0].X}
(assert (= of_69 of_68))
(declare-fun slbot_68 () Real)
(declare-fun sltop_68 () Real)
; 
; =  {(((sc.output.V[0].X*0.)+of.output.V[0].X)+sl.min.output.V[0].X)} {0.0001}
(assert (= (+ (+ (* sc_68 0.) of_68) slbot_68) 0.0001))
; 
; =  {(((sc.output.V[0].X*156.25)+of.output.V[0].X)+sl.max.output.V[0].X)} {3300.}
(assert (= (+ (+ (* sc_68 156.25) of_68) sltop_68) 3300.))
(declare-fun slbot_69 () Real)
(declare-fun sltop_69 () Real)
; 
; =  {(((sc.output.V[0].O*0.)+of.output.V[0].O)+sl.min.output.V[0].O)} {0.0001}
(assert (= (+ (+ (* sc_69 0.) of_69) slbot_69) 0.0001))
; 
; =  {(((sc.output.V[0].O*156.25)+of.output.V[0].O)+sl.max.output.V[0].O)} {3300.}
(assert (= (+ (+ (* sc_69 156.25) of_69) sltop_69) 3300.))
(declare-fun sc_70 () Real)
(assert (> sc_70 1e-08))
(declare-fun of_70 () Real)
(declare-fun sc_71 () Real)
(assert (> sc_71 1e-08))
(declare-fun of_71 () Real)
; 
; =  {sc.output.V[1].O} {sc.output.V[1].X}
(assert (= sc_71 sc_70))
; 
; =  {of.output.V[1].O} {of.output.V[1].X}
(assert (= of_71 of_70))
(declare-fun slbot_70 () Real)
(declare-fun sltop_70 () Real)
; 
; =  {(((sc.output.V[1].X*0.)+of.output.V[1].X)+sl.min.output.V[1].X)} {0.0001}
(assert (= (+ (+ (* sc_70 0.) of_70) slbot_70) 0.0001))
; 
; =  {(((sc.output.V[1].X*15.6)+of.output.V[1].X)+sl.max.output.V[1].X)} {3300.}
(assert (= (+ (+ (* sc_70 15.6) of_70) sltop_70) 3300.))
(declare-fun slbot_71 () Real)
(declare-fun sltop_71 () Real)
; 
; =  {(((sc.output.V[1].O*0.)+of.output.V[1].O)+sl.min.output.V[1].O)} {0.0001}
(assert (= (+ (+ (* sc_71 0.) of_71) slbot_71) 0.0001))
; 
; =  {(((sc.output.V[1].O*15.6)+of.output.V[1].O)+sl.max.output.V[1].O)} {3300.}
(assert (= (+ (+ (* sc_71 15.6) of_71) sltop_71) 3300.))
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
(assert (= of_73 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_74 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_76 0.))
; 
; =  {sc.vadd[13].A} {(1.*sc.vadd[13].B)}
(assert (= sc_75 (* 1. sc_76)))
; 
; =  {sc.vadd[13].A} {(1.*sc.vadd[13].C)} {(1.*sc.vadd[13].D)}
(assert (and (= sc_75 (* 1. sc_74)) (= sc_75 (* 1. sc_73))))
; no offset
(assert (= (- (+ of_75 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[13].OUT} {(sc.vadd[13].A*1.)}
(assert (= sc_77 (* sc_75 1.)))
; 
; =  {of.vadd[13].OUT} {0.}
(assert (= of_77 0.))
; no scale
(assert (= sc_73 1.))
; no scale
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_73 0.))
; no offset
(assert (= of_78 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_74 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_76 0.))
; 
; =  {sc.vadd[13].A} {(1.*sc.vadd[13].B)}
(assert (= sc_75 (* 1. sc_76)))
; 
; =  {sc.vadd[13].A} {(1.*sc.vadd[13].C)} {(1.*sc.vadd[13].D*sc.vadd[13].OUT2)}
(assert (and (= sc_75 (* 1. sc_74)) (= sc_75 (* (* 1. sc_73) sc_78))))
; no offset
(assert (= (- (+ of_75 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[13].OUT2} {(sc.vadd[13].A*1.)}
(assert (= sc_78 (* sc_75 1.)))
; no offset
(assert (= of_78 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[13].OUT2_0} {(sc.vadd[13].A*1.)}
(assert (= sc_72 (* sc_75 1.)))
; 
; =  {of.vadd[13].OUT2_0} {0.}
(assert (= of_72 0.))
; 
; >=  {((sc.vadd[13].OUT2_0*0.)+of.vadd[13].OUT2_0)} {3300.}
(assert (<= (+ (* sc_72 0.) of_72) 3300.))
; 
; <=  {((sc.vadd[13].OUT2_0*0.)+of.vadd[13].OUT2_0)} {0.}
(assert (>= (+ (* sc_72 0.) of_72) 0.))
; 
; >=  {((sc.vadd[13].D*4.)+of.vadd[13].D)} {3300.}
(assert (<= (+ (* sc_73 4.) of_73) 3300.))
; 
; <=  {((sc.vadd[13].D*4.)+of.vadd[13].D)} {0.}
(assert (>= (+ (* sc_73 4.) of_73) 0.))
; 
; >=  {((sc.vadd[13].C*0.)+of.vadd[13].C)} {3300.}
(assert (<= (+ (* sc_74 0.) of_74) 3300.))
; 
; <=  {((sc.vadd[13].C*0.)+of.vadd[13].C)} {0.}
(assert (>= (+ (* sc_74 0.) of_74) 0.))
; 
; >=  {((sc.vadd[13].A*0.)+of.vadd[13].A)} {3300.}
(assert (<= (+ (* sc_75 0.) of_75) 3300.))
; 
; <=  {((sc.vadd[13].A*0.)+of.vadd[13].A)} {0.}
(assert (>= (+ (* sc_75 0.) of_75) 0.))
(declare-fun slbot_78 () Real)
(declare-fun sltop_78 () Real)
; 
; =  {(((sc.vadd[13].OUT2*0.)+of.vadd[13].OUT2)+sl.min.vadd[13].OUT2)} {0.}
(assert (= (+ (+ (* sc_78 0.) of_78) slbot_78) 0.))
; 
; =  {(((sc.vadd[13].OUT2*15.6)+of.vadd[13].OUT2)+sl.max.vadd[13].OUT2)} {3300.}
(assert (= (+ (+ (* sc_78 15.6) of_78) sltop_78) 3300.))
(declare-fun slbot_76 () Real)
(declare-fun sltop_76 () Real)
; 
; =  {(((sc.vadd[13].B*0.00204799328914)+of.vadd[13].B)+sl.min.vadd[13].B)} {0.}
(assert (= (+ (+ (* sc_76 0.00204799328914) of_76) slbot_76) 0.))
; 
; =  {(((sc.vadd[13].B*625.)+of.vadd[13].B)+sl.max.vadd[13].B)} {3300.}
(assert (= (+ (+ (* sc_76 625.) of_76) sltop_76) 3300.))
(declare-fun slbot_77 () Real)
(declare-fun sltop_77 () Real)
; 
; =  {(((sc.vadd[13].OUT*0.00204799328914)+of.vadd[13].OUT)+sl.min.vadd[13].OUT)} {-1650.}
(assert (= (+ (+ (* sc_77 0.00204799328914) of_77) slbot_77) -1650.))
; 
; =  {(((sc.vadd[13].OUT*625.)+of.vadd[13].OUT)+sl.max.vadd[13].OUT)} {1650.}
(assert (= (+ (+ (* sc_77 625.) of_77) sltop_77) 1650.))
(declare-fun slbot_78 () Real)
(declare-fun sltop_78 () Real)
; 
; =  {(((sc.vadd[13].OUT2*0.)+of.vadd[13].OUT2)+sl.min.vadd[13].OUT2)} {0.}
(assert (= (+ (+ (* sc_78 0.) of_78) slbot_78) 0.))
; 
; =  {(((sc.vadd[13].OUT2*15.6)+of.vadd[13].OUT2)+sl.max.vadd[13].OUT2)} {3300.}
(assert (= (+ (+ (* sc_78 15.6) of_78) sltop_78) 3300.))
(declare-fun sc_79 () Real)
(assert (> sc_79 1e-08))
(declare-fun of_79 () Real)
(declare-fun sc_80 () Real)
(assert (> sc_80 1e-08))
(declare-fun of_80 () Real)
(declare-fun sc_81 () Real)
(assert (> sc_81 1e-08))
(declare-fun of_81 () Real)
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
(assert (= 0. 0.))
; no offset
(assert (= of_80 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_81 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_83 0.))
; 
; =  {sc.vadd[1].A} {(1.*sc.vadd[1].B)}
(assert (= sc_82 (* 1. sc_83)))
; 
; =  {sc.vadd[1].A} {(1.*sc.vadd[1].C)} {(1.*sc.vadd[1].D)}
(assert (and (= sc_82 (* 1. sc_81)) (= sc_82 (* 1. sc_80))))
; no offset
(assert (= (- (+ of_82 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[1].OUT} {(sc.vadd[1].A*1.)}
(assert (= sc_84 (* sc_82 1.)))
; 
; =  {of.vadd[1].OUT} {0.}
(assert (= of_84 0.))
; no scale
(assert (= sc_80 1.))
; no scale
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_80 0.))
; no offset
(assert (= of_85 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_81 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_83 0.))
; 
; =  {sc.vadd[1].A} {(1.*sc.vadd[1].B)}
(assert (= sc_82 (* 1. sc_83)))
; 
; =  {sc.vadd[1].A} {(1.*sc.vadd[1].C)} {(1.*sc.vadd[1].D*sc.vadd[1].OUT2)}
(assert (and (= sc_82 (* 1. sc_81)) (= sc_82 (* (* 1. sc_80) sc_85))))
; no offset
(assert (= (- (+ of_82 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[1].OUT2} {(sc.vadd[1].A*1.)}
(assert (= sc_85 (* sc_82 1.)))
; no offset
(assert (= of_85 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[1].OUT2_0} {(sc.vadd[1].A*1.)}
(assert (= sc_79 (* sc_82 1.)))
; 
; =  {of.vadd[1].OUT2_0} {0.}
(assert (= of_79 0.))
; 
; >=  {((sc.vadd[1].OUT2_0*0.)+of.vadd[1].OUT2_0)} {3300.}
(assert (<= (+ (* sc_79 0.) of_79) 3300.))
; 
; <=  {((sc.vadd[1].OUT2_0*0.)+of.vadd[1].OUT2_0)} {0.}
(assert (>= (+ (* sc_79 0.) of_79) 0.))
; 
; >=  {((sc.vadd[1].D*4.)+of.vadd[1].D)} {3300.}
(assert (<= (+ (* sc_80 4.) of_80) 3300.))
; 
; <=  {((sc.vadd[1].D*4.)+of.vadd[1].D)} {0.}
(assert (>= (+ (* sc_80 4.) of_80) 0.))
; 
; >=  {((sc.vadd[1].C*0.)+of.vadd[1].C)} {3300.}
(assert (<= (+ (* sc_81 0.) of_81) 3300.))
; 
; <=  {((sc.vadd[1].C*0.)+of.vadd[1].C)} {0.}
(assert (>= (+ (* sc_81 0.) of_81) 0.))
; 
; >=  {((sc.vadd[1].A*0.)+of.vadd[1].A)} {3300.}
(assert (<= (+ (* sc_82 0.) of_82) 3300.))
; 
; <=  {((sc.vadd[1].A*0.)+of.vadd[1].A)} {0.}
(assert (>= (+ (* sc_82 0.) of_82) 0.))
(declare-fun slbot_85 () Real)
(declare-fun sltop_85 () Real)
; 
; =  {(((sc.vadd[1].OUT2*0.)+of.vadd[1].OUT2)+sl.min.vadd[1].OUT2)} {0.}
(assert (= (+ (+ (* sc_85 0.) of_85) slbot_85) 0.))
; 
; =  {(((sc.vadd[1].OUT2*156.25)+of.vadd[1].OUT2)+sl.max.vadd[1].OUT2)} {3300.}
(assert (= (+ (+ (* sc_85 156.25) of_85) sltop_85) 3300.))
(declare-fun slbot_83 () Real)
(declare-fun sltop_83 () Real)
; 
; =  {(((sc.vadd[1].B*3.75903614458)+of.vadd[1].B)+sl.min.vadd[1].B)} {0.}
(assert (= (+ (+ (* sc_83 3.75903614458) of_83) slbot_83) 0.))
; 
; =  {(((sc.vadd[1].B*62.4)+of.vadd[1].B)+sl.max.vadd[1].B)} {3300.}
(assert (= (+ (+ (* sc_83 62.4) of_83) sltop_83) 3300.))
(declare-fun slbot_84 () Real)
(declare-fun sltop_84 () Real)
; 
; =  {(((sc.vadd[1].OUT*3.75903614458)+of.vadd[1].OUT)+sl.min.vadd[1].OUT)} {-1650.}
(assert (= (+ (+ (* sc_84 3.75903614458) of_84) slbot_84) -1650.))
; 
; =  {(((sc.vadd[1].OUT*62.4)+of.vadd[1].OUT)+sl.max.vadd[1].OUT)} {1650.}
(assert (= (+ (+ (* sc_84 62.4) of_84) sltop_84) 1650.))
(declare-fun slbot_85 () Real)
(declare-fun sltop_85 () Real)
; 
; =  {(((sc.vadd[1].OUT2*0.)+of.vadd[1].OUT2)+sl.min.vadd[1].OUT2)} {0.}
(assert (= (+ (+ (* sc_85 0.) of_85) slbot_85) 0.))
; 
; =  {(((sc.vadd[1].OUT2*156.25)+of.vadd[1].OUT2)+sl.max.vadd[1].OUT2)} {3300.}
(assert (= (+ (+ (* sc_85 156.25) of_85) sltop_85) 3300.))
(declare-fun sc_86 () Real)
(assert (> sc_86 1e-08))
(declare-fun of_86 () Real)
(declare-fun sc_87 () Real)
(assert (> sc_87 1e-08))
(declare-fun of_87 () Real)
(declare-fun sc_88 () Real)
(assert (> sc_88 1e-08))
(declare-fun of_88 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_87 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_86 0.))
; 
; =  {sc.vtoi[7].Y} {((1./sc.vtoi[7].K)*sc.vtoi[7].X)}
(assert (= sc_88 (* (/ 1. sc_87) sc_86)))
; 
; =  {of.vtoi[7].Y} {0.}
(assert (= of_88 0.))
; 
; >=  {((sc.vtoi[7].X*1.)+of.vtoi[7].X)} {3300.}
(assert (<= (+ (* sc_86 1.) of_86) 3300.))
; 
; <=  {((sc.vtoi[7].X*1.)+of.vtoi[7].X)} {1.}
(assert (>= (+ (* sc_86 1.) of_86) 1.))
(declare-fun slbot_88 () Real)
(declare-fun sltop_88 () Real)
; 
; =  {(((sc.vtoi[7].Y*0.)+of.vtoi[7].Y)+sl.min.vtoi[7].Y)} {0.00030303030303}
(assert (= (+ (+ (* sc_88 0.) of_88) slbot_88) 0.00030303030303))
; 
; =  {(((sc.vtoi[7].Y*305175.78125)+of.vtoi[7].Y)+sl.max.vtoi[7].Y)} {3300.}
(assert (= (+ (+ (* sc_88 305175.78125) of_88) sltop_88) 3300.))
(declare-fun slbot_87 () Real)
(declare-fun sltop_87 () Real)
; 
; =  {(((sc.vtoi[7].K*0.)+of.vtoi[7].K)+sl.min.vtoi[7].K)} {1.}
(assert (= (+ (+ (* sc_87 0.) of_87) slbot_87) 1.))
; 
; =  {(((sc.vtoi[7].K*3.2768e-06)+of.vtoi[7].K)+sl.max.vtoi[7].K)} {3300.}
(assert (= (+ (+ (* sc_87 3.2768e-06) of_87) sltop_87) 3300.))
(declare-fun slbot_88 () Real)
(declare-fun sltop_88 () Real)
; 
; =  {(((sc.vtoi[7].Y*0.)+of.vtoi[7].Y)+sl.min.vtoi[7].Y)} {0.00030303030303}
(assert (= (+ (+ (* sc_88 0.) of_88) slbot_88) 0.00030303030303))
; 
; =  {(((sc.vtoi[7].Y*305175.78125)+of.vtoi[7].Y)+sl.max.vtoi[7].Y)} {3300.}
(assert (= (+ (+ (* sc_88 305175.78125) of_88) sltop_88) 3300.))
(declare-fun sc_89 () Real)
(assert (> sc_89 1e-08))
(declare-fun of_89 () Real)
(declare-fun sc_90 () Real)
(assert (> sc_90 1e-08))
(declare-fun of_90 () Real)
(declare-fun sc_91 () Real)
(assert (> sc_91 1e-08))
(declare-fun of_91 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_90 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_89 0.))
; 
; =  {sc.vtoi[14].Y} {((1./sc.vtoi[14].K)*sc.vtoi[14].X)}
(assert (= sc_91 (* (/ 1. sc_90) sc_89)))
; 
; =  {of.vtoi[14].Y} {0.}
(assert (= of_91 0.))
; 
; >=  {((sc.vtoi[14].X*1.)+of.vtoi[14].X)} {3300.}
(assert (<= (+ (* sc_89 1.) of_89) 3300.))
; 
; <=  {((sc.vtoi[14].X*1.)+of.vtoi[14].X)} {1.}
(assert (>= (+ (* sc_89 1.) of_89) 1.))
(declare-fun slbot_91 () Real)
(declare-fun sltop_91 () Real)
; 
; =  {(((sc.vtoi[14].Y*0.)+of.vtoi[14].Y)+sl.min.vtoi[14].Y)} {0.00030303030303}
(assert (= (+ (+ (* sc_91 0.) of_91) slbot_91) 0.00030303030303))
; 
; =  {(((sc.vtoi[14].Y*1.66666666667)+of.vtoi[14].Y)+sl.max.vtoi[14].Y)} {3300.}
(assert (= (+ (+ (* sc_91 1.66666666667) of_91) sltop_91) 3300.))
(declare-fun slbot_90 () Real)
(declare-fun sltop_90 () Real)
; 
; =  {(((sc.vtoi[14].K*0.)+of.vtoi[14].K)+sl.min.vtoi[14].K)} {1.}
(assert (= (+ (+ (* sc_90 0.) of_90) slbot_90) 1.))
; 
; =  {(((sc.vtoi[14].K*0.6)+of.vtoi[14].K)+sl.max.vtoi[14].K)} {3300.}
(assert (= (+ (+ (* sc_90 0.6) of_90) sltop_90) 3300.))
(declare-fun sc_92 () Real)
(assert (> sc_92 1e-08))
(declare-fun of_92 () Real)
(declare-fun sc_93 () Real)
(assert (> sc_93 1e-08))
(declare-fun of_93 () Real)
(declare-fun sc_94 () Real)
(assert (> sc_94 1e-08))
(declare-fun of_94 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_93 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_92 0.))
; 
; =  {sc.vtoi[3].Y} {((1./sc.vtoi[3].K)*sc.vtoi[3].X)}
(assert (= sc_94 (* (/ 1. sc_93) sc_92)))
; 
; =  {of.vtoi[3].Y} {0.}
(assert (= of_94 0.))
(declare-fun slbot_92 () Real)
(declare-fun sltop_92 () Real)
; 
; =  {(((sc.vtoi[3].X*0.)+of.vtoi[3].X)+sl.min.vtoi[3].X)} {1.}
(assert (= (+ (+ (* sc_92 0.) of_92) slbot_92) 1.))
; 
; =  {(((sc.vtoi[3].X*156.25)+of.vtoi[3].X)+sl.max.vtoi[3].X)} {3300.}
(assert (= (+ (+ (* sc_92 156.25) of_92) sltop_92) 3300.))
(declare-fun slbot_94 () Real)
(declare-fun sltop_94 () Real)
; 
; =  {(((sc.vtoi[3].Y*-156.25)+of.vtoi[3].Y)+sl.min.vtoi[3].Y)} {0.00030303030303}
(assert (= (+ (+ (* sc_94 -156.25) of_94) slbot_94) 0.00030303030303))
; 
; =  {(((sc.vtoi[3].Y*0.)+of.vtoi[3].Y)+sl.max.vtoi[3].Y)} {3300.}
(assert (= (+ (+ (* sc_94 0.) of_94) sltop_94) 3300.))
; 
; >=  {((sc.vtoi[3].K*-1.)+of.vtoi[3].K)} {3300.}
(assert (<= (+ (* sc_93 -1.) of_93) 3300.))
; 
; <=  {((sc.vtoi[3].K*-1.)+of.vtoi[3].K)} {1.}
(assert (>= (+ (* sc_93 -1.) of_93) 1.))
(declare-fun sc_95 () Real)
(assert (> sc_95 1e-08))
(declare-fun of_95 () Real)
(declare-fun sc_96 () Real)
(assert (> sc_96 1e-08))
(declare-fun of_96 () Real)
(declare-fun sc_97 () Real)
(assert (> sc_97 1e-08))
(declare-fun of_97 () Real)
(declare-fun sc_98 () Real)
(assert (> sc_98 1e-08))
(declare-fun of_98 () Real)
; no offset
(assert (= of_96 0.))
; no offset
(assert (= of_95 0.))
; 
; =  {1.} {(sc.igenebind[2].K*sc.igenebind[2].TF)}
(assert (= 1. (* sc_96 sc_95)))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_97 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.igenebind[2].GE} {(sc.igenebind[2].Vmax*(1./1.))}
(assert (= sc_98 (* sc_97 (/ 1. 1.))))
; 
; =  {of.igenebind[2].GE} {0.}
(assert (= of_98 0.))
; 
; >=  {((sc.igenebind[2].TF*1.)+of.igenebind[2].TF)} {10.}
(assert (<= (+ (* sc_95 1.) of_95) 10.))
; 
; <=  {((sc.igenebind[2].TF*1.)+of.igenebind[2].TF)} {0.0001}
(assert (>= (+ (* sc_95 1.) of_95) 0.0001))
(declare-fun slbot_96 () Real)
(declare-fun sltop_96 () Real)
; 
; =  {(((sc.igenebind[2].K*0.)+of.igenebind[2].K)+sl.min.igenebind[2].K)} {0.0001}
(assert (= (+ (+ (* sc_96 0.) of_96) slbot_96) 0.0001))
; 
; =  {(((sc.igenebind[2].K*15.6)+of.igenebind[2].K)+sl.max.igenebind[2].K)} {10.}
(assert (= (+ (+ (* sc_96 15.6) of_96) sltop_96) 10.))
(declare-fun slbot_98 () Real)
(declare-fun sltop_98 () Real)
; 
; =  {(((sc.igenebind[2].GE*0.939759036145)+of.igenebind[2].GE)+sl.min.igenebind[2].GE)} {9.90099009901e-07}
(assert (= (+ (+ (* sc_98 0.939759036145) of_98) slbot_98) 9.90099009901e-07))
; 
; =  {(((sc.igenebind[2].GE*15.6)+of.igenebind[2].GE)+sl.max.igenebind[2].GE)} {9.9999999}
(assert (= (+ (+ (* sc_98 15.6) of_98) sltop_98) 9.9999999))
; 
; >=  {((sc.igenebind[2].Vmax*15.6)+of.igenebind[2].Vmax)} {10.}
(assert (<= (+ (* sc_97 15.6) of_97) 10.))
; 
; <=  {((sc.igenebind[2].Vmax*15.6)+of.igenebind[2].Vmax)} {0.0001}
(assert (>= (+ (* sc_97 15.6) of_97) 0.0001))
(declare-fun sc_99 () Real)
(assert (> sc_99 1e-08))
(declare-fun of_99 () Real)
(declare-fun sc_100 () Real)
(assert (> sc_100 1e-08))
(declare-fun of_100 () Real)
(declare-fun sc_101 () Real)
(assert (> sc_101 1e-08))
(declare-fun of_101 () Real)
(declare-fun sc_102 () Real)
(assert (> sc_102 1e-08))
(declare-fun of_102 () Real)
; no offset
(assert (= of_100 0.))
; no offset
(assert (= of_99 0.))
; 
; =  {1.} {(sc.igenebind[4].K*sc.igenebind[4].TF)}
(assert (= 1. (* sc_100 sc_99)))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_101 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.igenebind[4].GE} {(sc.igenebind[4].Vmax*(1./1.))}
(assert (= sc_102 (* sc_101 (/ 1. 1.))))
; 
; =  {of.igenebind[4].GE} {0.}
(assert (= of_102 0.))
(declare-fun slbot_99 () Real)
(declare-fun sltop_99 () Real)
; 
; =  {(((sc.igenebind[4].TF*0.)+of.igenebind[4].TF)+sl.min.igenebind[4].TF)} {0.0001}
(assert (= (+ (+ (* sc_99 0.) of_99) slbot_99) 0.0001))
; 
; =  {(((sc.igenebind[4].TF*305175.78125)+of.igenebind[4].TF)+sl.max.igenebind[4].TF)} {10.}
(assert (= (+ (+ (* sc_99 305175.78125) of_99) sltop_99) 10.))
; 
; >=  {((sc.igenebind[4].K*1.)+of.igenebind[4].K)} {10.}
(assert (<= (+ (* sc_100 1.) of_100) 10.))
; 
; <=  {((sc.igenebind[4].K*1.)+of.igenebind[4].K)} {0.0001}
(assert (>= (+ (* sc_100 1.) of_100) 0.0001))
(declare-fun slbot_102 () Real)
(declare-fun sltop_102 () Real)
; 
; =  {(((sc.igenebind[4].GE*0.000511998322284)+of.igenebind[4].GE)+sl.min.igenebind[4].GE)} {9.90099009901e-07}
(assert (= (+ (+ (* sc_102 0.000511998322284) of_102) slbot_102) 9.90099009901e-07))
; 
; =  {(((sc.igenebind[4].GE*156.25)+of.igenebind[4].GE)+sl.max.igenebind[4].GE)} {9.9999999}
(assert (= (+ (+ (* sc_102 156.25) of_102) sltop_102) 9.9999999))
; 
; >=  {((sc.igenebind[4].Vmax*156.25)+of.igenebind[4].Vmax)} {10.}
(assert (<= (+ (* sc_101 156.25) of_101) 10.))
; 
; <=  {((sc.igenebind[4].Vmax*156.25)+of.igenebind[4].Vmax)} {0.0001}
(assert (>= (+ (* sc_101 156.25) of_101) 0.0001))
(declare-fun slbot_102 () Real)
(declare-fun sltop_102 () Real)
; 
; =  {(((sc.igenebind[4].GE*0.000511998322284)+of.igenebind[4].GE)+sl.min.igenebind[4].GE)} {9.90099009901e-07}
(assert (= (+ (+ (* sc_102 0.000511998322284) of_102) slbot_102) 9.90099009901e-07))
; 
; =  {(((sc.igenebind[4].GE*156.25)+of.igenebind[4].GE)+sl.max.igenebind[4].GE)} {9.9999999}
(assert (= (+ (+ (* sc_102 156.25) of_102) sltop_102) 9.9999999))
(declare-fun sc_103 () Real)
(assert (> sc_103 1e-08))
(declare-fun of_103 () Real)
(declare-fun sc_104 () Real)
(assert (> sc_104 1e-08))
(declare-fun of_104 () Real)
; 
; =  {sc.input.V[2].O} {sc.input.V[2].X}
(assert (= sc_104 sc_103))
; 
; =  {of.input.V[2].O} {of.input.V[2].X}
(assert (= of_104 of_103))
; 
; >=  {((sc.input.V[2].X*1250.)+of.input.V[2].X)} {3300.}
(assert (<= (+ (* sc_103 1250.) of_103) 3300.))
; 
; <=  {((sc.input.V[2].X*1250.)+of.input.V[2].X)} {0.}
(assert (>= (+ (* sc_103 1250.) of_103) 0.))
; 
; >=  {((sc.input.V[2].O*1250.)+of.input.V[2].O)} {3300.}
(assert (<= (+ (* sc_104 1250.) of_104) 3300.))
; 
; <=  {((sc.input.V[2].O*1250.)+of.input.V[2].O)} {0.}
(assert (>= (+ (* sc_104 1250.) of_104) 0.))
(declare-fun sc_105 () Real)
(assert (> sc_105 1e-08))
(declare-fun of_105 () Real)
(declare-fun sc_106 () Real)
(assert (> sc_106 1e-08))
(declare-fun of_106 () Real)
; 
; =  {sc.input.V[8].O} {sc.input.V[8].X}
(assert (= sc_106 sc_105))
; 
; =  {of.input.V[8].O} {of.input.V[8].X}
(assert (= of_106 of_105))
; 
; >=  {((sc.input.V[8].X*0.)+of.input.V[8].X)} {3300.}
(assert (<= (+ (* sc_105 0.) of_105) 3300.))
; 
; <=  {((sc.input.V[8].X*0.)+of.input.V[8].X)} {0.}
(assert (>= (+ (* sc_105 0.) of_105) 0.))
; 
; >=  {((sc.input.V[8].O*0.)+of.input.V[8].O)} {3300.}
(assert (<= (+ (* sc_106 0.) of_106) 3300.))
; 
; <=  {((sc.input.V[8].O*0.)+of.input.V[8].O)} {0.}
(assert (>= (+ (* sc_106 0.) of_106) 0.))
(declare-fun sc_107 () Real)
(assert (> sc_107 1e-08))
(declare-fun of_107 () Real)
(declare-fun sc_108 () Real)
(assert (> sc_108 1e-08))
(declare-fun of_108 () Real)
; 
; =  {sc.input.V[7].O} {sc.input.V[7].X}
(assert (= sc_108 sc_107))
; 
; =  {of.input.V[7].O} {of.input.V[7].X}
(assert (= of_108 of_107))
; 
; >=  {((sc.input.V[7].X*0.)+of.input.V[7].X)} {3300.}
(assert (<= (+ (* sc_107 0.) of_107) 3300.))
; 
; <=  {((sc.input.V[7].X*0.)+of.input.V[7].X)} {0.}
(assert (>= (+ (* sc_107 0.) of_107) 0.))
; 
; >=  {((sc.input.V[7].O*0.)+of.input.V[7].O)} {3300.}
(assert (<= (+ (* sc_108 0.) of_108) 3300.))
; 
; <=  {((sc.input.V[7].O*0.)+of.input.V[7].O)} {0.}
(assert (>= (+ (* sc_108 0.) of_108) 0.))
(declare-fun sc_109 () Real)
(assert (> sc_109 1e-08))
(declare-fun of_109 () Real)
(declare-fun sc_110 () Real)
(assert (> sc_110 1e-08))
(declare-fun of_110 () Real)
; 
; =  {sc.input.V[13].O} {sc.input.V[13].X}
(assert (= sc_110 sc_109))
; 
; =  {of.input.V[13].O} {of.input.V[13].X}
(assert (= of_110 of_109))
; 
; >=  {((sc.input.V[13].X*1.)+of.input.V[13].X)} {3300.}
(assert (<= (+ (* sc_109 1.) of_109) 3300.))
; 
; <=  {((sc.input.V[13].X*1.)+of.input.V[13].X)} {0.}
(assert (>= (+ (* sc_109 1.) of_109) 0.))
; 
; >=  {((sc.input.V[13].O*1.)+of.input.V[13].O)} {3300.}
(assert (<= (+ (* sc_110 1.) of_110) 3300.))
; 
; <=  {((sc.input.V[13].O*1.)+of.input.V[13].O)} {0.}
(assert (>= (+ (* sc_110 1.) of_110) 0.))
(declare-fun sc_111 () Real)
(assert (> sc_111 1e-08))
(declare-fun of_111 () Real)
(declare-fun sc_112 () Real)
(assert (> sc_112 1e-08))
(declare-fun of_112 () Real)
; 
; =  {sc.input.V[12].O} {sc.input.V[12].X}
(assert (= sc_112 sc_111))
; 
; =  {of.input.V[12].O} {of.input.V[12].X}
(assert (= of_112 of_111))
; 
; >=  {((sc.input.V[12].X*1000.75)+of.input.V[12].X)} {3300.}
(assert (<= (+ (* sc_111 1000.75) of_111) 3300.))
; 
; <=  {((sc.input.V[12].X*1000.75)+of.input.V[12].X)} {0.}
(assert (>= (+ (* sc_111 1000.75) of_111) 0.))
; 
; >=  {((sc.input.V[12].O*1000.75)+of.input.V[12].O)} {3300.}
(assert (<= (+ (* sc_112 1000.75) of_112) 3300.))
; 
; <=  {((sc.input.V[12].O*1000.75)+of.input.V[12].O)} {0.}
(assert (>= (+ (* sc_112 1000.75) of_112) 0.))
(declare-fun sc_113 () Real)
(assert (> sc_113 1e-08))
(declare-fun of_113 () Real)
(declare-fun sc_114 () Real)
(assert (> sc_114 1e-08))
(declare-fun of_114 () Real)
; 
; =  {sc.input.V[9].O} {sc.input.V[9].X}
(assert (= sc_114 sc_113))
; 
; =  {of.input.V[9].O} {of.input.V[9].X}
(assert (= of_114 of_113))
; 
; >=  {((sc.input.V[9].X*-1.)+of.input.V[9].X)} {3300.}
(assert (<= (+ (* sc_113 -1.) of_113) 3300.))
; 
; <=  {((sc.input.V[9].X*-1.)+of.input.V[9].X)} {0.}
(assert (>= (+ (* sc_113 -1.) of_113) 0.))
; 
; >=  {((sc.input.V[9].O*-1.)+of.input.V[9].O)} {3300.}
(assert (<= (+ (* sc_114 -1.) of_114) 3300.))
; 
; <=  {((sc.input.V[9].O*-1.)+of.input.V[9].O)} {0.}
(assert (>= (+ (* sc_114 -1.) of_114) 0.))
(declare-fun sc_115 () Real)
(assert (> sc_115 1e-08))
(declare-fun of_115 () Real)
(declare-fun sc_116 () Real)
(assert (> sc_116 1e-08))
(declare-fun of_116 () Real)
; 
; =  {sc.input.V[0].O} {sc.input.V[0].X}
(assert (= sc_116 sc_115))
; 
; =  {of.input.V[0].O} {of.input.V[0].X}
(assert (= of_116 of_115))
(declare-fun slbot_115 () Real)
(declare-fun sltop_115 () Real)
; 
; =  {(((sc.input.V[0].X*0.)+of.input.V[0].X)+sl.min.input.V[0].X)} {0.}
(assert (= (+ (+ (* sc_115 0.) of_115) slbot_115) 0.))
; 
; =  {(((sc.input.V[0].X*0.6)+of.input.V[0].X)+sl.max.input.V[0].X)} {3300.}
(assert (= (+ (+ (* sc_115 0.6) of_115) sltop_115) 3300.))
(declare-fun slbot_116 () Real)
(declare-fun sltop_116 () Real)
; 
; =  {(((sc.input.V[0].O*0.)+of.input.V[0].O)+sl.min.input.V[0].O)} {0.}
(assert (= (+ (+ (* sc_116 0.) of_116) slbot_116) 0.))
; 
; =  {(((sc.input.V[0].O*0.6)+of.input.V[0].O)+sl.max.input.V[0].O)} {3300.}
(assert (= (+ (+ (* sc_116 0.6) of_116) sltop_116) 3300.))
(declare-fun sc_117 () Real)
(assert (> sc_117 1e-08))
(declare-fun of_117 () Real)
(declare-fun sc_118 () Real)
(assert (> sc_118 1e-08))
(declare-fun of_118 () Real)
; 
; =  {sc.input.V[11].O} {sc.input.V[11].X}
(assert (= sc_118 sc_117))
; 
; =  {of.input.V[11].O} {of.input.V[11].X}
(assert (= of_118 of_117))
; 
; >=  {((sc.input.V[11].X*4.)+of.input.V[11].X)} {3300.}
(assert (<= (+ (* sc_117 4.) of_117) 3300.))
; 
; <=  {((sc.input.V[11].X*4.)+of.input.V[11].X)} {0.}
(assert (>= (+ (* sc_117 4.) of_117) 0.))
; 
; >=  {((sc.input.V[11].O*4.)+of.input.V[11].O)} {3300.}
(assert (<= (+ (* sc_118 4.) of_118) 3300.))
; 
; <=  {((sc.input.V[11].O*4.)+of.input.V[11].O)} {0.}
(assert (>= (+ (* sc_118 4.) of_118) 0.))
(declare-fun sc_119 () Real)
(assert (> sc_119 1e-08))
(declare-fun of_119 () Real)
(declare-fun sc_120 () Real)
(assert (> sc_120 1e-08))
(declare-fun of_120 () Real)
; 
; =  {sc.input.V[10].O} {sc.input.V[10].X}
(assert (= sc_120 sc_119))
; 
; =  {of.input.V[10].O} {of.input.V[10].X}
(assert (= of_120 of_119))
; 
; >=  {((sc.input.V[10].X*4.)+of.input.V[10].X)} {3300.}
(assert (<= (+ (* sc_119 4.) of_119) 3300.))
; 
; <=  {((sc.input.V[10].X*4.)+of.input.V[10].X)} {0.}
(assert (>= (+ (* sc_119 4.) of_119) 0.))
; 
; >=  {((sc.input.V[10].O*4.)+of.input.V[10].O)} {3300.}
(assert (<= (+ (* sc_120 4.) of_120) 3300.))
; 
; <=  {((sc.input.V[10].O*4.)+of.input.V[10].O)} {0.}
(assert (>= (+ (* sc_120 4.) of_120) 0.))
(declare-fun sc_121 () Real)
(assert (> sc_121 1e-08))
(declare-fun of_121 () Real)
(declare-fun sc_122 () Real)
(assert (> sc_122 1e-08))
(declare-fun of_122 () Real)
; 
; =  {sc.input.V[15].O} {sc.input.V[15].X}
(assert (= sc_122 sc_121))
; 
; =  {of.input.V[15].O} {of.input.V[15].X}
(assert (= of_122 of_121))
; 
; >=  {((sc.input.V[15].X*1.)+of.input.V[15].X)} {3300.}
(assert (<= (+ (* sc_121 1.) of_121) 3300.))
; 
; <=  {((sc.input.V[15].X*1.)+of.input.V[15].X)} {0.}
(assert (>= (+ (* sc_121 1.) of_121) 0.))
; 
; >=  {((sc.input.V[15].O*1.)+of.input.V[15].O)} {3300.}
(assert (<= (+ (* sc_122 1.) of_122) 3300.))
; 
; <=  {((sc.input.V[15].O*1.)+of.input.V[15].O)} {0.}
(assert (>= (+ (* sc_122 1.) of_122) 0.))
(declare-fun sc_123 () Real)
(assert (> sc_123 1e-08))
(declare-fun of_123 () Real)
(declare-fun sc_124 () Real)
(assert (> sc_124 1e-08))
(declare-fun of_124 () Real)
; 
; =  {sc.input.V[6].O} {sc.input.V[6].X}
(assert (= sc_124 sc_123))
; 
; =  {of.input.V[6].O} {of.input.V[6].X}
(assert (= of_124 of_123))
; 
; >=  {((sc.input.V[6].X*0.)+of.input.V[6].X)} {3300.}
(assert (<= (+ (* sc_123 0.) of_123) 3300.))
; 
; <=  {((sc.input.V[6].X*0.)+of.input.V[6].X)} {0.}
(assert (>= (+ (* sc_123 0.) of_123) 0.))
; 
; >=  {((sc.input.V[6].O*0.)+of.input.V[6].O)} {3300.}
(assert (<= (+ (* sc_124 0.) of_124) 3300.))
; 
; <=  {((sc.input.V[6].O*0.)+of.input.V[6].O)} {0.}
(assert (>= (+ (* sc_124 0.) of_124) 0.))
(declare-fun sc_125 () Real)
(assert (> sc_125 1e-08))
(declare-fun of_125 () Real)
(declare-fun sc_126 () Real)
(assert (> sc_126 1e-08))
(declare-fun of_126 () Real)
; 
; =  {sc.input.V[14].O} {sc.input.V[14].X}
(assert (= sc_126 sc_125))
; 
; =  {of.input.V[14].O} {of.input.V[14].X}
(assert (= of_126 of_125))
; 
; >=  {((sc.input.V[14].X*1.)+of.input.V[14].X)} {3300.}
(assert (<= (+ (* sc_125 1.) of_125) 3300.))
; 
; <=  {((sc.input.V[14].X*1.)+of.input.V[14].X)} {0.}
(assert (>= (+ (* sc_125 1.) of_125) 0.))
; 
; >=  {((sc.input.V[14].O*1.)+of.input.V[14].O)} {3300.}
(assert (<= (+ (* sc_126 1.) of_126) 3300.))
; 
; <=  {((sc.input.V[14].O*1.)+of.input.V[14].O)} {0.}
(assert (>= (+ (* sc_126 1.) of_126) 0.))
(declare-fun sc_127 () Real)
(assert (> sc_127 1e-08))
(declare-fun of_127 () Real)
(declare-fun sc_128 () Real)
(assert (> sc_128 1e-08))
(declare-fun of_128 () Real)
; 
; =  {sc.input.V[16].O} {sc.input.V[16].X}
(assert (= sc_128 sc_127))
; 
; =  {of.input.V[16].O} {of.input.V[16].X}
(assert (= of_128 of_127))
; 
; >=  {((sc.input.V[16].X*1.)+of.input.V[16].X)} {3300.}
(assert (<= (+ (* sc_127 1.) of_127) 3300.))
; 
; <=  {((sc.input.V[16].X*1.)+of.input.V[16].X)} {0.}
(assert (>= (+ (* sc_127 1.) of_127) 0.))
; 
; >=  {((sc.input.V[16].O*1.)+of.input.V[16].O)} {3300.}
(assert (<= (+ (* sc_128 1.) of_128) 3300.))
; 
; <=  {((sc.input.V[16].O*1.)+of.input.V[16].O)} {0.}
(assert (>= (+ (* sc_128 1.) of_128) 0.))
(declare-fun sc_129 () Real)
(assert (> sc_129 1e-08))
(declare-fun of_129 () Real)
(declare-fun sc_130 () Real)
(assert (> sc_130 1e-08))
(declare-fun of_130 () Real)
; 
; =  {sc.input.V[3].O} {sc.input.V[3].X}
(assert (= sc_130 sc_129))
; 
; =  {of.input.V[3].O} {of.input.V[3].X}
(assert (= of_130 of_129))
; 
; >=  {((sc.input.V[3].X*0.)+of.input.V[3].X)} {3300.}
(assert (<= (+ (* sc_129 0.) of_129) 3300.))
; 
; <=  {((sc.input.V[3].X*0.)+of.input.V[3].X)} {0.}
(assert (>= (+ (* sc_129 0.) of_129) 0.))
; 
; >=  {((sc.input.V[3].O*0.)+of.input.V[3].O)} {3300.}
(assert (<= (+ (* sc_130 0.) of_130) 3300.))
; 
; <=  {((sc.input.V[3].O*0.)+of.input.V[3].O)} {0.}
(assert (>= (+ (* sc_130 0.) of_130) 0.))
(declare-fun sc_131 () Real)
(assert (> sc_131 1e-08))
(declare-fun of_131 () Real)
(declare-fun sc_132 () Real)
(assert (> sc_132 1e-08))
(declare-fun of_132 () Real)
; 
; =  {sc.input.V[4].O} {sc.input.V[4].X}
(assert (= sc_132 sc_131))
; 
; =  {of.input.V[4].O} {of.input.V[4].X}
(assert (= of_132 of_131))
; 
; >=  {((sc.input.V[4].X*0.)+of.input.V[4].X)} {3300.}
(assert (<= (+ (* sc_131 0.) of_131) 3300.))
; 
; <=  {((sc.input.V[4].X*0.)+of.input.V[4].X)} {0.}
(assert (>= (+ (* sc_131 0.) of_131) 0.))
; 
; >=  {((sc.input.V[4].O*0.)+of.input.V[4].O)} {3300.}
(assert (<= (+ (* sc_132 0.) of_132) 3300.))
; 
; <=  {((sc.input.V[4].O*0.)+of.input.V[4].O)} {0.}
(assert (>= (+ (* sc_132 0.) of_132) 0.))
(declare-fun sc_133 () Real)
(assert (> sc_133 1e-08))
(declare-fun of_133 () Real)
(declare-fun sc_134 () Real)
(assert (> sc_134 1e-08))
(declare-fun of_134 () Real)
; 
; =  {sc.input.V[5].O} {sc.input.V[5].X}
(assert (= sc_134 sc_133))
; 
; =  {of.input.V[5].O} {of.input.V[5].X}
(assert (= of_134 of_133))
; 
; >=  {((sc.input.V[5].X*0.)+of.input.V[5].X)} {3300.}
(assert (<= (+ (* sc_133 0.) of_133) 3300.))
; 
; <=  {((sc.input.V[5].X*0.)+of.input.V[5].X)} {0.}
(assert (>= (+ (* sc_133 0.) of_133) 0.))
; 
; >=  {((sc.input.V[5].O*0.)+of.input.V[5].O)} {3300.}
(assert (<= (+ (* sc_134 0.) of_134) 3300.))
; 
; <=  {((sc.input.V[5].O*0.)+of.input.V[5].O)} {0.}
(assert (>= (+ (* sc_134 0.) of_134) 0.))
(declare-fun sc_135 () Real)
(assert (> sc_135 1e-08))
(declare-fun of_135 () Real)
(declare-fun sc_136 () Real)
(assert (> sc_136 1e-08))
(declare-fun of_136 () Real)
; 
; =  {sc.input.V[1].O} {sc.input.V[1].X}
(assert (= sc_136 sc_135))
; 
; =  {of.input.V[1].O} {of.input.V[1].X}
(assert (= of_136 of_135))
; 
; >=  {((sc.input.V[1].X*2.)+of.input.V[1].X)} {3300.}
(assert (<= (+ (* sc_135 2.) of_135) 3300.))
; 
; <=  {((sc.input.V[1].X*2.)+of.input.V[1].X)} {0.}
(assert (>= (+ (* sc_135 2.) of_135) 0.))
; 
; >=  {((sc.input.V[1].O*2.)+of.input.V[1].O)} {3300.}
(assert (<= (+ (* sc_136 2.) of_136) 3300.))
; 
; <=  {((sc.input.V[1].O*2.)+of.input.V[1].O)} {0.}
(assert (>= (+ (* sc_136 2.) of_136) 0.))
(declare-fun sc_137 () Real)
(assert (> sc_137 1e-08))
(declare-fun of_137 () Real)
(declare-fun sc_138 () Real)
(assert (> sc_138 1e-08))
(declare-fun of_138 () Real)
(declare-fun sc_139 () Real)
(assert (> sc_139 1e-08))
(declare-fun of_139 () Real)
; no offset
(assert (= of_138 0.))
; no offset
(assert (= of_137 0.))
; 
; =  {sc.itov[12].Y} {(sc.itov[12].K*sc.itov[12].X)}
(assert (= sc_139 (* sc_138 sc_137)))
; 
; =  {of.itov[12].Y} {0.}
(assert (= of_139 0.))
; 
; >=  {((sc.itov[12].X*4.)+of.itov[12].X)} {10.}
(assert (<= (+ (* sc_137 4.) of_137) 10.))
; 
; <=  {((sc.itov[12].X*4.)+of.itov[12].X)} {0.0001}
(assert (>= (+ (* sc_137 4.) of_137) 0.0001))
(declare-fun slbot_139 () Real)
(declare-fun sltop_139 () Real)
; 
; =  {(((sc.itov[12].Y*0.00204799328914)+of.itov[12].Y)+sl.min.itov[12].Y)} {0.0001}
(assert (= (+ (+ (* sc_139 0.00204799328914) of_139) slbot_139) 0.0001))
; 
; =  {(((sc.itov[12].Y*625.)+of.itov[12].Y)+sl.max.itov[12].Y)} {3300.}
(assert (= (+ (+ (* sc_139 625.) of_139) sltop_139) 3300.))
(declare-fun slbot_138 () Real)
(declare-fun sltop_138 () Real)
; 
; =  {(((sc.itov[12].K*0.000511998322284)+of.itov[12].K)+sl.min.itov[12].K)} {1.}
(assert (= (+ (+ (* sc_138 0.000511998322284) of_138) slbot_138) 1.))
; 
; =  {(((sc.itov[12].K*156.25)+of.itov[12].K)+sl.max.itov[12].K)} {330.}
(assert (= (+ (+ (* sc_138 156.25) of_138) sltop_138) 330.))
(declare-fun slbot_139 () Real)
(declare-fun sltop_139 () Real)
; 
; =  {(((sc.itov[12].Y*0.00204799328914)+of.itov[12].Y)+sl.min.itov[12].Y)} {0.0001}
(assert (= (+ (+ (* sc_139 0.00204799328914) of_139) slbot_139) 0.0001))
; 
; =  {(((sc.itov[12].Y*625.)+of.itov[12].Y)+sl.max.itov[12].Y)} {3300.}
(assert (= (+ (+ (* sc_139 625.) of_139) sltop_139) 3300.))
(declare-fun sc_140 () Real)
(assert (> sc_140 1e-08))
(declare-fun of_140 () Real)
(declare-fun sc_141 () Real)
(assert (> sc_141 1e-08))
(declare-fun of_141 () Real)
(declare-fun sc_142 () Real)
(assert (> sc_142 1e-08))
(declare-fun of_142 () Real)
; no offset
(assert (= of_141 0.))
; no offset
(assert (= of_140 0.))
; 
; =  {sc.itov[9].Y} {(sc.itov[9].K*sc.itov[9].X)}
(assert (= sc_142 (* sc_141 sc_140)))
; 
; =  {of.itov[9].Y} {0.}
(assert (= of_142 0.))
(declare-fun slbot_140 () Real)
(declare-fun sltop_140 () Real)
; 
; =  {(((sc.itov[9].X*0.)+of.itov[9].X)+sl.min.itov[9].X)} {0.0001}
(assert (= (+ (+ (* sc_140 0.) of_140) slbot_140) 0.0001))
; 
; =  {(((sc.itov[9].X*3.2768e-06)+of.itov[9].X)+sl.max.itov[9].X)} {10.}
(assert (= (+ (+ (* sc_140 3.2768e-06) of_140) sltop_140) 10.))
(declare-fun slbot_142 () Real)
(declare-fun sltop_142 () Real)
; 
; =  {(((sc.itov[9].Y*0.)+of.itov[9].Y)+sl.min.itov[9].Y)} {0.0001}
(assert (= (+ (+ (* sc_142 0.) of_142) slbot_142) 0.0001))
; 
; =  {(((sc.itov[9].Y*3.2768e-06)+of.itov[9].Y)+sl.max.itov[9].Y)} {3300.}
(assert (= (+ (+ (* sc_142 3.2768e-06) of_142) sltop_142) 3300.))
; 
; >=  {((sc.itov[9].K*1.)+of.itov[9].K)} {330.}
(assert (<= (+ (* sc_141 1.) of_141) 330.))
; 
; <=  {((sc.itov[9].K*1.)+of.itov[9].K)} {1.}
(assert (>= (+ (* sc_141 1.) of_141) 1.))
(declare-fun slbot_142 () Real)
(declare-fun sltop_142 () Real)
; 
; =  {(((sc.itov[9].Y*0.)+of.itov[9].Y)+sl.min.itov[9].Y)} {0.0001}
(assert (= (+ (+ (* sc_142 0.) of_142) slbot_142) 0.0001))
; 
; =  {(((sc.itov[9].Y*3.2768e-06)+of.itov[9].Y)+sl.max.itov[9].Y)} {3300.}
(assert (= (+ (+ (* sc_142 3.2768e-06) of_142) sltop_142) 3300.))
(declare-fun sc_143 () Real)
(assert (> sc_143 1e-08))
(declare-fun of_143 () Real)
(declare-fun sc_144 () Real)
(assert (> sc_144 1e-08))
(declare-fun of_144 () Real)
(declare-fun sc_145 () Real)
(assert (> sc_145 1e-08))
(declare-fun of_145 () Real)
; no offset
(assert (= of_144 0.))
; no offset
(assert (= of_143 0.))
; 
; =  {sc.itov[0].Y} {(sc.itov[0].K*sc.itov[0].X)}
(assert (= sc_145 (* sc_144 sc_143)))
; 
; =  {of.itov[0].Y} {0.}
(assert (= of_145 0.))
; 
; >=  {((sc.itov[0].X*4.)+of.itov[0].X)} {10.}
(assert (<= (+ (* sc_143 4.) of_143) 10.))
; 
; <=  {((sc.itov[0].X*4.)+of.itov[0].X)} {0.0001}
(assert (>= (+ (* sc_143 4.) of_143) 0.0001))
(declare-fun slbot_145 () Real)
(declare-fun sltop_145 () Real)
; 
; =  {(((sc.itov[0].Y*3.75903614458)+of.itov[0].Y)+sl.min.itov[0].Y)} {0.0001}
(assert (= (+ (+ (* sc_145 3.75903614458) of_145) slbot_145) 0.0001))
; 
; =  {(((sc.itov[0].Y*62.4)+of.itov[0].Y)+sl.max.itov[0].Y)} {3300.}
(assert (= (+ (+ (* sc_145 62.4) of_145) sltop_145) 3300.))
(declare-fun slbot_144 () Real)
(declare-fun sltop_144 () Real)
; 
; =  {(((sc.itov[0].K*0.939759036145)+of.itov[0].K)+sl.min.itov[0].K)} {1.}
(assert (= (+ (+ (* sc_144 0.939759036145) of_144) slbot_144) 1.))
; 
; =  {(((sc.itov[0].K*15.6)+of.itov[0].K)+sl.max.itov[0].K)} {330.}
(assert (= (+ (+ (* sc_144 15.6) of_144) sltop_144) 330.))
(declare-fun slbot_145 () Real)
(declare-fun sltop_145 () Real)
; 
; =  {(((sc.itov[0].Y*3.75903614458)+of.itov[0].Y)+sl.min.itov[0].Y)} {0.0001}
(assert (= (+ (+ (* sc_145 3.75903614458) of_145) slbot_145) 0.0001))
; 
; =  {(((sc.itov[0].Y*62.4)+of.itov[0].Y)+sl.max.itov[0].Y)} {3300.}
(assert (= (+ (+ (* sc_145 62.4) of_145) sltop_145) 3300.))
(declare-fun sc_146 () Real)
(assert (> sc_146 1e-08))
(declare-fun of_146 () Real)
(declare-fun sc_147 () Real)
(assert (> sc_147 1e-08))
(declare-fun of_147 () Real)
(declare-fun sc_148 () Real)
(assert (> sc_148 1e-08))
(declare-fun of_148 () Real)
(declare-fun sc_149 () Real)
(assert (> sc_149 1e-08))
(declare-fun of_149 () Real)
(declare-fun sc_150 () Real)
(assert (> sc_150 1e-08))
(declare-fun of_150 () Real)
; 
; =  {sc.iadd[11].A} {sc.iadd[11].B}
(assert (= sc_148 sc_149))
; 
; =  {sc.iadd[11].A} {sc.iadd[11].C} {sc.iadd[11].D}
(assert (and (= sc_148 sc_147) (= sc_148 sc_146)))
; 
; =  {sc.iadd[11].OUT} {sc.iadd[11].A}
(assert (= sc_150 sc_148))
; 
; =  {of.iadd[11].OUT} {((of.iadd[11].A+of.iadd[11].B)-of.iadd[11].C-of.iadd[11].D)}
(assert (= of_150 (- (+ of_148 of_149) (+ of_147 of_146))))
(declare-fun slbot_146 () Real)
(declare-fun sltop_146 () Real)
; 
; =  {(((sc.iadd[11].D*-156.25)+of.iadd[11].D)+sl.min.iadd[11].D)} {0.}
(assert (= (+ (+ (* sc_146 -156.25) of_146) slbot_146) 0.))
; 
; =  {(((sc.iadd[11].D*0.)+of.iadd[11].D)+sl.max.iadd[11].D)} {5.}
(assert (= (+ (+ (* sc_146 0.) of_146) sltop_146) 5.))
; 
; >=  {((sc.iadd[11].C*1.)+of.iadd[11].C)} {5.}
(assert (<= (+ (* sc_147 1.) of_147) 5.))
; 
; <=  {((sc.iadd[11].C*1.)+of.iadd[11].C)} {0.}
(assert (>= (+ (* sc_147 1.) of_147) 0.))
(declare-fun slbot_150 () Real)
(declare-fun sltop_150 () Real)
; 
; =  {(((sc.iadd[11].OUT*-1.)+of.iadd[11].OUT)+sl.min.iadd[11].OUT)} {-10.}
(assert (= (+ (+ (* sc_150 -1.) of_150) slbot_150) -10.))
; 
; =  {(((sc.iadd[11].OUT*155.25)+of.iadd[11].OUT)+sl.max.iadd[11].OUT)} {10.}
(assert (= (+ (+ (* sc_150 155.25) of_150) sltop_150) 10.))
; 
; >=  {((sc.iadd[11].A*0.)+of.iadd[11].A)} {5.}
(assert (<= (+ (* sc_148 0.) of_148) 5.))
; 
; <=  {((sc.iadd[11].A*0.)+of.iadd[11].A)} {0.}
(assert (>= (+ (* sc_148 0.) of_148) 0.))
; 
; >=  {((sc.iadd[11].B*0.)+of.iadd[11].B)} {5.}
(assert (<= (+ (* sc_149 0.) of_149) 5.))
; 
; <=  {((sc.iadd[11].B*0.)+of.iadd[11].B)} {0.}
(assert (>= (+ (* sc_149 0.) of_149) 0.))
(declare-fun slbot_150 () Real)
(declare-fun sltop_150 () Real)
; 
; =  {(((sc.iadd[11].OUT*-1.)+of.iadd[11].OUT)+sl.min.iadd[11].OUT)} {-10.}
(assert (= (+ (+ (* sc_150 -1.) of_150) slbot_150) -10.))
; 
; =  {(((sc.iadd[11].OUT*155.25)+of.iadd[11].OUT)+sl.max.iadd[11].OUT)} {10.}
(assert (= (+ (+ (* sc_150 155.25) of_150) sltop_150) 10.))
(declare-fun sc_151 () Real)
(assert (> sc_151 1e-08))
(declare-fun of_151 () Real)
(declare-fun sc_152 () Real)
(assert (> sc_152 1e-08))
(declare-fun of_152 () Real)
(declare-fun sc_153 () Real)
(assert (> sc_153 1e-08))
(declare-fun of_153 () Real)
(declare-fun sc_154 () Real)
(assert (> sc_154 1e-08))
(declare-fun of_154 () Real)
(declare-fun sc_155 () Real)
(assert (> sc_155 1e-08))
(declare-fun of_155 () Real)
; 
; =  {sc.iadd[6].A} {sc.iadd[6].B}
(assert (= sc_153 sc_154))
; 
; =  {sc.iadd[6].A} {sc.iadd[6].C} {sc.iadd[6].D}
(assert (and (= sc_153 sc_152) (= sc_153 sc_151)))
; 
; =  {sc.iadd[6].OUT} {sc.iadd[6].A}
(assert (= sc_155 sc_153))
; 
; =  {of.iadd[6].OUT} {((of.iadd[6].A+of.iadd[6].B)-of.iadd[6].C-of.iadd[6].D)}
(assert (= of_155 (- (+ of_153 of_154) (+ of_152 of_151))))
; 
; >=  {((sc.iadd[6].D*0.)+of.iadd[6].D)} {5.}
(assert (<= (+ (* sc_151 0.) of_151) 5.))
; 
; <=  {((sc.iadd[6].D*0.)+of.iadd[6].D)} {0.}
(assert (>= (+ (* sc_151 0.) of_151) 0.))
; 
; >=  {((sc.iadd[6].C*0.)+of.iadd[6].C)} {5.}
(assert (<= (+ (* sc_152 0.) of_152) 5.))
; 
; <=  {((sc.iadd[6].C*0.)+of.iadd[6].C)} {0.}
(assert (>= (+ (* sc_152 0.) of_152) 0.))
(declare-fun slbot_155 () Real)
(declare-fun sltop_155 () Real)
; 
; =  {(((sc.iadd[6].OUT*0.)+of.iadd[6].OUT)+sl.min.iadd[6].OUT)} {-10.}
(assert (= (+ (+ (* sc_155 0.) of_155) slbot_155) -10.))
; 
; =  {(((sc.iadd[6].OUT*305175.78125)+of.iadd[6].OUT)+sl.max.iadd[6].OUT)} {10.}
(assert (= (+ (+ (* sc_155 305175.78125) of_155) sltop_155) 10.))
; 
; >=  {((sc.iadd[6].A*0.)+of.iadd[6].A)} {5.}
(assert (<= (+ (* sc_153 0.) of_153) 5.))
; 
; <=  {((sc.iadd[6].A*0.)+of.iadd[6].A)} {0.}
(assert (>= (+ (* sc_153 0.) of_153) 0.))
(declare-fun slbot_154 () Real)
(declare-fun sltop_154 () Real)
; 
; =  {(((sc.iadd[6].B*0.)+of.iadd[6].B)+sl.min.iadd[6].B)} {0.}
(assert (= (+ (+ (* sc_154 0.) of_154) slbot_154) 0.))
; 
; =  {(((sc.iadd[6].B*305175.78125)+of.iadd[6].B)+sl.max.iadd[6].B)} {5.}
(assert (= (+ (+ (* sc_154 305175.78125) of_154) sltop_154) 5.))
(declare-fun slbot_155 () Real)
(declare-fun sltop_155 () Real)
; 
; =  {(((sc.iadd[6].OUT*0.)+of.iadd[6].OUT)+sl.min.iadd[6].OUT)} {-10.}
(assert (= (+ (+ (* sc_155 0.) of_155) slbot_155) -10.))
; 
; =  {(((sc.iadd[6].OUT*305175.78125)+of.iadd[6].OUT)+sl.max.iadd[6].OUT)} {10.}
(assert (= (+ (+ (* sc_155 305175.78125) of_155) sltop_155) 10.))
(declare-fun sc_156 () Real)
(assert (> sc_156 1e-08))
(declare-fun of_156 () Real)
(declare-fun sc_157 () Real)
(assert (> sc_157 1e-08))
(declare-fun of_157 () Real)
(declare-fun sc_158 () Real)
(assert (> sc_158 1e-08))
(declare-fun of_158 () Real)
(declare-fun sc_159 () Real)
(assert (> sc_159 1e-08))
(declare-fun of_159 () Real)
(declare-fun sc_160 () Real)
(assert (> sc_160 1e-08))
(declare-fun of_160 () Real)
; 
; =  {sc.iadd[16].A} {sc.iadd[16].B}
(assert (= sc_158 sc_159))
; 
; =  {sc.iadd[16].A} {sc.iadd[16].C} {sc.iadd[16].D}
(assert (and (= sc_158 sc_157) (= sc_158 sc_156)))
; 
; =  {sc.iadd[16].OUT} {sc.iadd[16].A}
(assert (= sc_160 sc_158))
; 
; =  {of.iadd[16].OUT} {((of.iadd[16].A+of.iadd[16].B)-of.iadd[16].C-of.iadd[16].D)}
(assert (= of_160 (- (+ of_158 of_159) (+ of_157 of_156))))
; 
; >=  {((sc.iadd[16].D*0.)+of.iadd[16].D)} {5.}
(assert (<= (+ (* sc_156 0.) of_156) 5.))
; 
; <=  {((sc.iadd[16].D*0.)+of.iadd[16].D)} {0.}
(assert (>= (+ (* sc_156 0.) of_156) 0.))
; 
; >=  {((sc.iadd[16].C*0.)+of.iadd[16].C)} {5.}
(assert (<= (+ (* sc_157 0.) of_157) 5.))
; 
; <=  {((sc.iadd[16].C*0.)+of.iadd[16].C)} {0.}
(assert (>= (+ (* sc_157 0.) of_157) 0.))
(declare-fun slbot_160 () Real)
(declare-fun sltop_160 () Real)
; 
; =  {(((sc.iadd[16].OUT*0.)+of.iadd[16].OUT)+sl.min.iadd[16].OUT)} {-10.}
(assert (= (+ (+ (* sc_160 0.) of_160) slbot_160) -10.))
; 
; =  {(((sc.iadd[16].OUT*1.66666666667)+of.iadd[16].OUT)+sl.max.iadd[16].OUT)} {10.}
(assert (= (+ (+ (* sc_160 1.66666666667) of_160) sltop_160) 10.))
; 
; >=  {((sc.iadd[16].A*0.)+of.iadd[16].A)} {5.}
(assert (<= (+ (* sc_158 0.) of_158) 5.))
; 
; <=  {((sc.iadd[16].A*0.)+of.iadd[16].A)} {0.}
(assert (>= (+ (* sc_158 0.) of_158) 0.))
(declare-fun slbot_159 () Real)
(declare-fun sltop_159 () Real)
; 
; =  {(((sc.iadd[16].B*0.)+of.iadd[16].B)+sl.min.iadd[16].B)} {0.}
(assert (= (+ (+ (* sc_159 0.) of_159) slbot_159) 0.))
; 
; =  {(((sc.iadd[16].B*1.66666666667)+of.iadd[16].B)+sl.max.iadd[16].B)} {5.}
(assert (= (+ (+ (* sc_159 1.66666666667) of_159) sltop_159) 5.))
(declare-fun slbot_160 () Real)
(declare-fun sltop_160 () Real)
; 
; =  {(((sc.iadd[16].OUT*0.)+of.iadd[16].OUT)+sl.min.iadd[16].OUT)} {-10.}
(assert (= (+ (+ (* sc_160 0.) of_160) slbot_160) -10.))
; 
; =  {(((sc.iadd[16].OUT*1.66666666667)+of.iadd[16].OUT)+sl.max.iadd[16].OUT)} {10.}
(assert (= (+ (+ (* sc_160 1.66666666667) of_160) sltop_160) 10.))
(declare-fun sc_161 () Real)
(assert (> sc_161 1e-08))
(declare-fun of_161 () Real)
(declare-fun sc_162 () Real)
(assert (> sc_162 1e-08))
(declare-fun of_162 () Real)
(declare-fun sc_163 () Real)
(assert (> sc_163 1e-08))
(declare-fun of_163 () Real)
(declare-fun sc_164 () Real)
(assert (> sc_164 1e-08))
(declare-fun of_164 () Real)
(declare-fun sc_165 () Real)
(assert (> sc_165 1e-08))
(declare-fun of_165 () Real)
; 
; =  {sc.iadd[5].A} {sc.iadd[5].B}
(assert (= sc_163 sc_164))
; 
; =  {sc.iadd[5].A} {sc.iadd[5].C} {sc.iadd[5].D}
(assert (and (= sc_163 sc_162) (= sc_163 sc_161)))
; 
; =  {sc.iadd[5].OUT} {sc.iadd[5].A}
(assert (= sc_165 sc_163))
; 
; =  {of.iadd[5].OUT} {((of.iadd[5].A+of.iadd[5].B)-of.iadd[5].C-of.iadd[5].D)}
(assert (= of_165 (- (+ of_163 of_164) (+ of_162 of_161))))
; 
; >=  {((sc.iadd[5].D*0.)+of.iadd[5].D)} {5.}
(assert (<= (+ (* sc_161 0.) of_161) 5.))
; 
; <=  {((sc.iadd[5].D*0.)+of.iadd[5].D)} {0.}
(assert (>= (+ (* sc_161 0.) of_161) 0.))
; 
; >=  {((sc.iadd[5].C*0.)+of.iadd[5].C)} {5.}
(assert (<= (+ (* sc_162 0.) of_162) 5.))
; 
; <=  {((sc.iadd[5].C*0.)+of.iadd[5].C)} {0.}
(assert (>= (+ (* sc_162 0.) of_162) 0.))
(declare-fun slbot_165 () Real)
(declare-fun sltop_165 () Real)
; 
; =  {(((sc.iadd[5].OUT*0.)+of.iadd[5].OUT)+sl.min.iadd[5].OUT)} {-10.}
(assert (= (+ (+ (* sc_165 0.) of_165) slbot_165) -10.))
; 
; =  {(((sc.iadd[5].OUT*305175.78125)+of.iadd[5].OUT)+sl.max.iadd[5].OUT)} {10.}
(assert (= (+ (+ (* sc_165 305175.78125) of_165) sltop_165) 10.))
; 
; >=  {((sc.iadd[5].A*0.)+of.iadd[5].A)} {5.}
(assert (<= (+ (* sc_163 0.) of_163) 5.))
; 
; <=  {((sc.iadd[5].A*0.)+of.iadd[5].A)} {0.}
(assert (>= (+ (* sc_163 0.) of_163) 0.))
(declare-fun slbot_164 () Real)
(declare-fun sltop_164 () Real)
; 
; =  {(((sc.iadd[5].B*0.)+of.iadd[5].B)+sl.min.iadd[5].B)} {0.}
(assert (= (+ (+ (* sc_164 0.) of_164) slbot_164) 0.))
; 
; =  {(((sc.iadd[5].B*305175.78125)+of.iadd[5].B)+sl.max.iadd[5].B)} {5.}
(assert (= (+ (+ (* sc_164 305175.78125) of_164) sltop_164) 5.))
(declare-fun slbot_165 () Real)
(declare-fun sltop_165 () Real)
; 
; =  {(((sc.iadd[5].OUT*0.)+of.iadd[5].OUT)+sl.min.iadd[5].OUT)} {-10.}
(assert (= (+ (+ (* sc_165 0.) of_165) slbot_165) -10.))
; 
; =  {(((sc.iadd[5].OUT*305175.78125)+of.iadd[5].OUT)+sl.max.iadd[5].OUT)} {10.}
(assert (= (+ (+ (* sc_165 305175.78125) of_165) sltop_165) 10.))
(declare-fun sc_166 () Real)
(assert (> sc_166 1e-08))
(declare-fun of_166 () Real)
(declare-fun sc_167 () Real)
(assert (> sc_167 1e-08))
(declare-fun of_167 () Real)
(declare-fun sc_168 () Real)
(assert (> sc_168 1e-08))
(declare-fun of_168 () Real)
(declare-fun sc_169 () Real)
(assert (> sc_169 1e-08))
(declare-fun of_169 () Real)
(declare-fun sc_170 () Real)
(assert (> sc_170 1e-08))
(declare-fun of_170 () Real)
; 
; =  {sc.iadd[17].A} {sc.iadd[17].B}
(assert (= sc_168 sc_169))
; 
; =  {sc.iadd[17].A} {sc.iadd[17].C} {sc.iadd[17].D}
(assert (and (= sc_168 sc_167) (= sc_168 sc_166)))
; 
; =  {sc.iadd[17].OUT} {sc.iadd[17].A}
(assert (= sc_170 sc_168))
; 
; =  {of.iadd[17].OUT} {((of.iadd[17].A+of.iadd[17].B)-of.iadd[17].C-of.iadd[17].D)}
(assert (= of_170 (- (+ of_168 of_169) (+ of_167 of_166))))
; 
; >=  {((sc.iadd[17].D*0.)+of.iadd[17].D)} {5.}
(assert (<= (+ (* sc_166 0.) of_166) 5.))
; 
; <=  {((sc.iadd[17].D*0.)+of.iadd[17].D)} {0.}
(assert (>= (+ (* sc_166 0.) of_166) 0.))
; 
; >=  {((sc.iadd[17].C*0.)+of.iadd[17].C)} {5.}
(assert (<= (+ (* sc_167 0.) of_167) 5.))
; 
; <=  {((sc.iadd[17].C*0.)+of.iadd[17].C)} {0.}
(assert (>= (+ (* sc_167 0.) of_167) 0.))
(declare-fun slbot_170 () Real)
(declare-fun sltop_170 () Real)
; 
; =  {(((sc.iadd[17].OUT*0.)+of.iadd[17].OUT)+sl.min.iadd[17].OUT)} {-10.}
(assert (= (+ (+ (* sc_170 0.) of_170) slbot_170) -10.))
; 
; =  {(((sc.iadd[17].OUT*1.66666666667)+of.iadd[17].OUT)+sl.max.iadd[17].OUT)} {10.}
(assert (= (+ (+ (* sc_170 1.66666666667) of_170) sltop_170) 10.))
; 
; >=  {((sc.iadd[17].A*0.)+of.iadd[17].A)} {5.}
(assert (<= (+ (* sc_168 0.) of_168) 5.))
; 
; <=  {((sc.iadd[17].A*0.)+of.iadd[17].A)} {0.}
(assert (>= (+ (* sc_168 0.) of_168) 0.))
(declare-fun slbot_169 () Real)
(declare-fun sltop_169 () Real)
; 
; =  {(((sc.iadd[17].B*0.)+of.iadd[17].B)+sl.min.iadd[17].B)} {0.}
(assert (= (+ (+ (* sc_169 0.) of_169) slbot_169) 0.))
; 
; =  {(((sc.iadd[17].B*1.66666666667)+of.iadd[17].B)+sl.max.iadd[17].B)} {5.}
(assert (= (+ (+ (* sc_169 1.66666666667) of_169) sltop_169) 5.))
(declare-fun slbot_170 () Real)
(declare-fun sltop_170 () Real)
; 
; =  {(((sc.iadd[17].OUT*0.)+of.iadd[17].OUT)+sl.min.iadd[17].OUT)} {-10.}
(assert (= (+ (+ (* sc_170 0.) of_170) slbot_170) -10.))
; 
; =  {(((sc.iadd[17].OUT*1.66666666667)+of.iadd[17].OUT)+sl.max.iadd[17].OUT)} {10.}
(assert (= (+ (+ (* sc_170 1.66666666667) of_170) sltop_170) 10.))
(declare-fun sc_171 () Real)
(assert (> sc_171 1e-08))
(declare-fun of_171 () Real)
(declare-fun sc_172 () Real)
(assert (> sc_172 1e-08))
(declare-fun of_172 () Real)
(declare-fun sc_173 () Real)
(assert (> sc_173 1e-08))
(declare-fun of_173 () Real)
(declare-fun sc_174 () Real)
(assert (> sc_174 1e-08))
(declare-fun of_174 () Real)
(declare-fun sc_175 () Real)
(assert (> sc_175 1e-08))
(declare-fun of_175 () Real)
; 
; =  {sc.iadd[18].A} {sc.iadd[18].B}
(assert (= sc_173 sc_174))
; 
; =  {sc.iadd[18].A} {sc.iadd[18].C} {sc.iadd[18].D}
(assert (and (= sc_173 sc_172) (= sc_173 sc_171)))
; 
; =  {sc.iadd[18].OUT} {sc.iadd[18].A}
(assert (= sc_175 sc_173))
; 
; =  {of.iadd[18].OUT} {((of.iadd[18].A+of.iadd[18].B)-of.iadd[18].C-of.iadd[18].D)}
(assert (= of_175 (- (+ of_173 of_174) (+ of_172 of_171))))
; 
; >=  {((sc.iadd[18].D*0.)+of.iadd[18].D)} {5.}
(assert (<= (+ (* sc_171 0.) of_171) 5.))
; 
; <=  {((sc.iadd[18].D*0.)+of.iadd[18].D)} {0.}
(assert (>= (+ (* sc_171 0.) of_171) 0.))
; 
; >=  {((sc.iadd[18].C*0.)+of.iadd[18].C)} {5.}
(assert (<= (+ (* sc_172 0.) of_172) 5.))
; 
; <=  {((sc.iadd[18].C*0.)+of.iadd[18].C)} {0.}
(assert (>= (+ (* sc_172 0.) of_172) 0.))
; 
; >=  {((sc.iadd[18].A*0.)+of.iadd[18].A)} {5.}
(assert (<= (+ (* sc_173 0.) of_173) 5.))
; 
; <=  {((sc.iadd[18].A*0.)+of.iadd[18].A)} {0.}
(assert (>= (+ (* sc_173 0.) of_173) 0.))
(declare-fun slbot_174 () Real)
(declare-fun sltop_174 () Real)
; 
; =  {(((sc.iadd[18].B*0.)+of.iadd[18].B)+sl.min.iadd[18].B)} {0.}
(assert (= (+ (+ (* sc_174 0.) of_174) slbot_174) 0.))
; 
; =  {(((sc.iadd[18].B*15.6)+of.iadd[18].B)+sl.max.iadd[18].B)} {5.}
(assert (= (+ (+ (* sc_174 15.6) of_174) sltop_174) 5.))
(declare-fun slbot_175 () Real)
(declare-fun sltop_175 () Real)
; 
; =  {(((sc.iadd[18].OUT*0.)+of.iadd[18].OUT)+sl.min.iadd[18].OUT)} {-10.}
(assert (= (+ (+ (* sc_175 0.) of_175) slbot_175) -10.))
; 
; =  {(((sc.iadd[18].OUT*15.6)+of.iadd[18].OUT)+sl.max.iadd[18].OUT)} {10.}
(assert (= (+ (+ (* sc_175 15.6) of_175) sltop_175) 10.))
; 
; =  {sc.igenebind[4].GE} {sc.itov[12].K}
(assert (= sc_102 sc_138))
; 
; =  {of.igenebind[4].GE} {of.itov[12].K}
(assert (= of_102 of_138))
; 
; =  {sc.igenebind[2].GE} {sc.itov[0].K}
(assert (= sc_98 sc_144))
; 
; =  {of.igenebind[2].GE} {of.itov[0].K}
(assert (= of_98 of_144))
; 
; =  {sc.itov[12].Y} {sc.vadd[13].B}
(assert (= sc_139 sc_76))
; 
; =  {of.itov[12].Y} {of.vadd[13].B}
(assert (= of_139 of_76))
; 
; =  {sc.input.I[6].O} {sc.iadd[6].C}
(assert (= sc_39 sc_152))
; 
; =  {of.input.I[6].O} {of.iadd[6].C}
(assert (= of_39 of_152))
; 
; =  {sc.iadd[6].OUT} {sc.iadd[5].B}
(assert (= sc_155 sc_164))
; 
; =  {of.iadd[6].OUT} {of.iadd[5].B}
(assert (= of_155 of_164))
; 
; =  {sc.vadd[1].OUT2} {sc.vtoi[3].X}
(assert (= sc_85 sc_92))
; 
; =  {of.vadd[1].OUT2} {of.vtoi[3].X}
(assert (= of_85 of_92))
; 
; =  {sc.vadd[1].OUT2} {sc.output.V[0].X}
(assert (= sc_85 sc_68))
; 
; =  {of.vadd[1].OUT2} {of.output.V[0].X}
(assert (= of_85 of_68))
; 
; =  {sc.vgain[8].P} {sc.vtoi[7].K}
(assert (= sc_3 sc_87))
; 
; =  {of.vgain[8].P} {of.vtoi[7].K}
(assert (= of_3 of_87))
; 
; =  {sc.vadd[13].OUT2} {sc.output.V[1].X}
(assert (= sc_78 sc_70))
; 
; =  {of.vadd[13].OUT2} {of.output.V[1].X}
(assert (= of_78 of_70))
; 
; =  {sc.vadd[13].OUT2} {sc.switch[15].Vmax}
(assert (= sc_78 sc_12))
; 
; =  {of.vadd[13].OUT2} {of.switch[15].Vmax}
(assert (= of_78 of_12))
; 
; =  {sc.input.I[0].O} {sc.igenebind[4].Vmax}
(assert (= sc_29 sc_101))
; 
; =  {of.input.I[0].O} {of.igenebind[4].Vmax}
(assert (= of_29 of_101))
; 
; =  {sc.vtoi[3].Y} {sc.iadd[11].D}
(assert (= sc_94 sc_146))
; 
; =  {of.vtoi[3].Y} {of.iadd[11].D}
(assert (= of_94 of_146))
; 
; =  {sc.input.V[9].O} {sc.vtoi[3].K}
(assert (= sc_114 sc_93))
; 
; =  {of.input.V[9].O} {of.vtoi[3].K}
(assert (= of_114 of_93))
; 
; =  {sc.input.V[15].O} {sc.itov[9].K}
(assert (= sc_122 sc_141))
; 
; =  {of.input.V[15].O} {of.itov[9].K}
(assert (= of_122 of_141))
; 
; =  {sc.input.I[22].O} {sc.switch[10].Vmax}
(assert (= sc_67 sc_7))
; 
; =  {of.input.I[22].O} {of.switch[10].Vmax}
(assert (= of_67 of_7))
; 
; =  {sc.input.I[25].O} {sc.iadd[18].D}
(assert (= sc_55 sc_171))
; 
; =  {of.input.I[25].O} {of.iadd[18].D}
(assert (= of_55 of_171))
; 
; =  {sc.input.I[26].O} {sc.iadd[18].A}
(assert (= sc_33 sc_173))
; 
; =  {of.input.I[26].O} {of.iadd[18].A}
(assert (= of_33 of_173))
; 
; =  {sc.input.I[18].O} {sc.itov[12].X}
(assert (= sc_63 sc_137))
; 
; =  {of.input.I[18].O} {of.itov[12].X}
(assert (= of_63 of_137))
; 
; =  {sc.input.I[9].O} {sc.iadd[16].D}
(assert (= sc_27 sc_156))
; 
; =  {of.input.I[9].O} {of.iadd[16].D}
(assert (= of_27 of_156))
; 
; =  {sc.input.I[16].O} {sc.igenebind[2].Vmax}
(assert (= sc_47 sc_97))
; 
; =  {of.input.I[16].O} {of.igenebind[2].Vmax}
(assert (= of_47 of_97))
; 
; =  {sc.input.V[13].O} {sc.vtoi[7].X}
(assert (= sc_110 sc_86))
; 
; =  {of.input.V[13].O} {of.vtoi[7].X}
(assert (= of_110 of_86))
; 
; =  {sc.input.I[4].O} {sc.iadd[6].D}
(assert (= sc_51 sc_151))
; 
; =  {of.input.I[4].O} {of.iadd[6].D}
(assert (= of_51 of_151))
; 
; =  {sc.input.I[3].O} {sc.iadd[5].C}
(assert (= sc_49 sc_162))
; 
; =  {of.input.I[3].O} {of.iadd[5].C}
(assert (= of_49 of_162))
; 
; =  {sc.vtoi[7].Y} {sc.iadd[6].B}
(assert (= sc_88 sc_154))
; 
; =  {of.vtoi[7].Y} {of.iadd[6].B}
(assert (= of_88 of_154))
; 
; =  {sc.input.I[5].O} {sc.iadd[6].A}
(assert (= sc_53 sc_153))
; 
; =  {of.input.I[5].O} {of.iadd[6].A}
(assert (= of_53 of_153))
; 
; =  {sc.input.V[14].O} {sc.vgain[8].Y}
(assert (= sc_126 sc_1))
; 
; =  {of.input.V[14].O} {of.vgain[8].Y}
(assert (= of_126 of_1))
; 
; =  {sc.switch[15].PROD} {sc.iadd[18].B}
(assert (= sc_13 sc_174))
; 
; =  {of.switch[15].PROD} {of.iadd[18].B}
(assert (= of_13 of_174))
; 
; =  {sc.input.V[11].O} {sc.vadd[13].D}
(assert (= sc_118 sc_73))
; 
; =  {of.input.V[11].O} {of.vadd[13].D}
(assert (= of_118 of_73))
; 
; =  {sc.input.I[14].O} {sc.iadd[17].A}
(assert (= sc_41 sc_168))
; 
; =  {of.input.I[14].O} {of.iadd[17].A}
(assert (= of_41 of_168))
; 
; =  {sc.input.V[8].O} {sc.vadd[1].OUT2_0}
(assert (= sc_106 sc_79))
; 
; =  {of.input.V[8].O} {of.vadd[1].OUT2_0}
(assert (= of_106 of_79))
; 
; =  {sc.input.V[12].O} {sc.switch[15].n}
(assert (= sc_112 sc_9))
; 
; =  {of.input.V[12].O} {of.switch[15].n}
(assert (= of_112 of_9))
; 
; =  {sc.input.I[2].O} {sc.iadd[5].A}
(assert (= sc_15 sc_163))
; 
; =  {of.input.I[2].O} {of.iadd[5].A}
(assert (= of_15 of_163))
; 
; =  {sc.input.V[2].O} {sc.switch[10].n}
(assert (= sc_104 sc_4))
; 
; =  {of.input.V[2].O} {of.switch[10].n}
(assert (= of_104 of_4))
; 
; =  {sc.input.V[3].O} {sc.vadd[1].A}
(assert (= sc_130 sc_82))
; 
; =  {of.input.V[3].O} {of.vadd[1].A}
(assert (= of_130 of_82))
; 
; =  {sc.input.I[20].O} {sc.igenebind[4].K}
(assert (= sc_17 sc_100))
; 
; =  {of.input.I[20].O} {of.igenebind[4].K}
(assert (= of_17 of_100))
; 
; =  {sc.iadd[5].OUT} {sc.igenebind[4].TF}
(assert (= sc_165 sc_99))
; 
; =  {of.iadd[5].OUT} {of.igenebind[4].TF}
(assert (= of_165 of_99))
; 
; =  {sc.vtoi[14].Y} {sc.iadd[17].B}
(assert (= sc_91 sc_169))
; 
; =  {of.vtoi[14].Y} {of.iadd[17].B}
(assert (= of_91 of_169))
; 
; =  {sc.itov[0].Y} {sc.vadd[1].B}
(assert (= sc_145 sc_83))
; 
; =  {of.itov[0].Y} {of.vadd[1].B}
(assert (= of_145 of_83))
; 
; =  {sc.input.I[24].O} {sc.iadd[18].C}
(assert (= sc_45 sc_172))
; 
; =  {of.input.I[24].O} {of.iadd[18].C}
(assert (= of_45 of_172))
; 
; =  {sc.input.I[15].O} {sc.switch[15].SUB}
(assert (= sc_37 sc_10))
; 
; =  {of.input.I[15].O} {of.switch[15].SUB}
(assert (= of_37 of_10))
; 
; =  {sc.input.I[10].O} {sc.iadd[16].A}
(assert (= sc_35 sc_158))
; 
; =  {of.input.I[10].O} {of.iadd[16].A}
(assert (= of_35 of_158))
; 
; =  {sc.input.I[1].O} {sc.iadd[5].D}
(assert (= sc_59 sc_161))
; 
; =  {of.input.I[1].O} {of.iadd[5].D}
(assert (= of_59 of_161))
; 
; =  {sc.input.I[12].O} {sc.iadd[17].D}
(assert (= sc_25 sc_166))
; 
; =  {of.input.I[12].O} {of.iadd[17].D}
(assert (= of_25 of_166))
; 
; =  {sc.iadd[11].OUT} {sc.switch[10].SUB}
(assert (= sc_150 sc_5))
; 
; =  {of.iadd[11].OUT} {of.switch[10].SUB}
(assert (= of_150 of_5))
; 
; =  {sc.input.I[13].O} {sc.iadd[17].C}
(assert (= sc_23 sc_167))
; 
; =  {of.input.I[13].O} {of.iadd[17].C}
(assert (= of_23 of_167))
; 
; =  {sc.input.V[1].O} {sc.vgain[8].X}
(assert (= sc_136 sc_0))
; 
; =  {of.input.V[1].O} {of.vgain[8].X}
(assert (= of_136 of_0))
; 
; =  {sc.input.I[7].O} {sc.iadd[11].A}
(assert (= sc_21 sc_148))
; 
; =  {of.input.I[7].O} {of.iadd[11].A}
(assert (= of_21 of_148))
; 
; =  {sc.iadd[17].OUT} {sc.iadd[16].B}
(assert (= sc_170 sc_159))
; 
; =  {of.iadd[17].OUT} {of.iadd[16].B}
(assert (= of_170 of_159))
; 
; =  {sc.iadd[18].OUT} {sc.igenebind[2].K}
(assert (= sc_175 sc_96))
; 
; =  {of.iadd[18].OUT} {of.igenebind[2].K}
(assert (= of_175 of_96))
; 
; =  {sc.input.I[17].O} {sc.itov[0].X}
(assert (= sc_61 sc_143))
; 
; =  {of.input.I[17].O} {of.itov[0].X}
(assert (= of_61 of_143))
; 
; =  {sc.input.V[7].O} {sc.vadd[13].OUT2_0}
(assert (= sc_108 sc_72))
; 
; =  {of.input.V[7].O} {of.vadd[13].OUT2_0}
(assert (= of_108 of_72))
; 
; =  {sc.input.I[8].O} {sc.iadd[11].B}
(assert (= sc_19 sc_149))
; 
; =  {of.input.I[8].O} {of.iadd[11].B}
(assert (= of_19 of_149))
; 
; =  {sc.input.I[21].O} {sc.switch[10].Kmod}
(assert (= sc_43 sc_6))
; 
; =  {of.input.I[21].O} {of.switch[10].Kmod}
(assert (= of_43 of_6))
; 
; =  {sc.input.I[23].O} {sc.iadd[11].C}
(assert (= sc_57 sc_147))
; 
; =  {of.input.I[23].O} {of.iadd[11].C}
(assert (= of_57 of_147))
; 
; =  {sc.input.V[0].O} {sc.vtoi[14].K}
(assert (= sc_116 sc_90))
; 
; =  {of.input.V[0].O} {of.vtoi[14].K}
(assert (= of_116 of_90))
; 
; =  {sc.input.V[10].O} {sc.vadd[1].D}
(assert (= sc_120 sc_80))
; 
; =  {of.input.V[10].O} {of.vadd[1].D}
(assert (= of_120 of_80))
; 
; =  {sc.input.V[16].O} {sc.vtoi[14].X}
(assert (= sc_128 sc_89))
; 
; =  {of.input.V[16].O} {of.vtoi[14].X}
(assert (= of_128 of_89))
; 
; =  {sc.itov[9].Y} {sc.vgain[8].Z}
(assert (= sc_142 sc_2))
; 
; =  {of.itov[9].Y} {of.vgain[8].Z}
(assert (= of_142 of_2))
; 
; =  {sc.input.I[19].O} {sc.igenebind[2].TF}
(assert (= sc_65 sc_95))
; 
; =  {of.input.I[19].O} {of.igenebind[2].TF}
(assert (= of_65 of_95))
; 
; =  {sc.input.V[4].O} {sc.vadd[1].C}
(assert (= sc_132 sc_81))
; 
; =  {of.input.V[4].O} {of.vadd[1].C}
(assert (= of_132 of_81))
; 
; =  {sc.input.V[5].O} {sc.vadd[13].A}
(assert (= sc_134 sc_75))
; 
; =  {of.input.V[5].O} {of.vadd[13].A}
(assert (= of_134 of_75))
; 
; =  {sc.switch[10].PROD} {sc.itov[9].X}
(assert (= sc_8 sc_140))
; 
; =  {of.switch[10].PROD} {of.itov[9].X}
(assert (= of_8 of_140))
; 
; =  {sc.iadd[16].OUT} {sc.switch[15].Kmod}
(assert (= sc_160 sc_11))
; 
; =  {of.iadd[16].OUT} {of.switch[15].Kmod}
(assert (= of_160 of_11))
; 
; =  {sc.input.V[6].O} {sc.vadd[13].C}
(assert (= sc_124 sc_74))
; 
; =  {of.input.V[6].O} {of.vadd[13].C}
(assert (= of_124 of_74))
; 
; =  {sc.input.I[11].O} {sc.iadd[16].C}
(assert (= sc_31 sc_157))
; 
; =  {of.input.I[11].O} {of.iadd[16].C}
(assert (= of_31 of_157))
(assert (<= (* (/ 1. sc_69) 0.001) 0.1))
(assert (<= (* (/ 1. sc_71) 0.001) 0.1))
; 
; =  {sc.vadd[1].OUT2} {sc.output.V[0].O} {sc.vadd[13].OUT2} {sc.output.V[1].O}
(assert (and (and (= sc_85 sc_69) (= sc_85 sc_78)) (= sc_85 sc_71)))
(assert (= __minima__ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (ite (>= sltop_77 0.) sltop_77 (- sltop_77)) (ite (>= slbot_92 0.) slbot_92 (- slbot_92))) (ite (>= sltop_96 0.) sltop_96 (- sltop_96))) (ite (>= sltop_87 0.) sltop_87 (- sltop_87))) (ite (>= sltop_91 0.) sltop_91 (- sltop_91))) (ite (>= slbot_175 0.) slbot_175 (- slbot_175))) (ite (>= sltop_90 0.) sltop_90 (- sltop_90))) (ite (>= sltop_76 0.) sltop_76 (- sltop_76))) (ite (>= slbot_3 0.) slbot_3 (- slbot_3))) (ite (>= slbot_84 0.) slbot_84 (- slbot_84))) (ite (>= sltop_164 0.) sltop_164 (- sltop_164))) (ite (>= slbot_159 0.) slbot_159 (- slbot_159))) (ite (>= slbot_2 0.) slbot_2 (- slbot_2))) (ite (>= slbot_76 0.) slbot_76 (- slbot_76))) (ite (>= slbot_150 0.) slbot_150 (- slbot_150))) (ite (>= sltop_138 0.) sltop_138 (- sltop_138))) (ite (>= sltop_150 0.) sltop_150 (- sltop_150))) (ite (>= slbot_85 0.) slbot_85 (- slbot_85))) (ite (>= slbot_96 0.) slbot_96 (- slbot_96))) (ite (>= slbot_99 0.) slbot_99 (- slbot_99))) (ite (>= sltop_2 0.) sltop_2 (- sltop_2))) (ite (>= sltop_8 0.) sltop_8 (- sltop_8))) (ite (>= sltop_13 0.) sltop_13 (- sltop_13))) (ite (>= sltop_94 0.) sltop_94 (- sltop_94))) (ite (>= sltop_146 0.) sltop_146 (- sltop_146))) (ite (>= sltop_85 0.) sltop_85 (- sltop_85))) (ite (>= slbot_115 0.) slbot_115 (- slbot_115))) (ite (>= slbot_116 0.) slbot_116 (- slbot_116))) (ite (>= slbot_91 0.) slbot_91 (- slbot_91))) (ite (>= slbot_98 0.) slbot_98 (- slbot_98))) (ite (>= slbot_138 0.) slbot_138 (- slbot_138))) (ite (>= sltop_154 0.) sltop_154 (- sltop_154))) (ite (>= slbot_174 0.) slbot_174 (- slbot_174))) (ite (>= slbot_5 0.) slbot_5 (- slbot_5))) (ite (>= slbot_68 0.) slbot_68 (- slbot_68))) (ite (>= slbot_170 0.) slbot_170 (- slbot_170))) (ite (>= slbot_87 0.) slbot_87 (- slbot_87))) (ite (>= sltop_115 0.) sltop_115 (- sltop_115))) (ite (>= sltop_165 0.) sltop_165 (- sltop_165))) (ite (>= sltop_68 0.) sltop_68 (- sltop_68))) (ite (>= slbot_77 0.) slbot_77 (- slbot_77))) (ite (>= sltop_159 0.) sltop_159 (- sltop_159))) (ite (>= sltop_3 0.) sltop_3 (- sltop_3))) (ite (>= slbot_139 0.) slbot_139 (- slbot_139))) (ite (>= slbot_69 0.) slbot_69 (- slbot_69))) (ite (>= sltop_84 0.) sltop_84 (- sltop_84))) (ite (>= sltop_99 0.) sltop_99 (- sltop_99))) (ite (>= slbot_155 0.) slbot_155 (- slbot_155))) (ite (>= sltop_175 0.) sltop_175 (- sltop_175))) (ite (>= slbot_12 0.) slbot_12 (- slbot_12))) (ite (>= sltop_139 0.) sltop_139 (- sltop_139))) (ite (>= slbot_13 0.) slbot_13 (- slbot_13))) (ite (>= slbot_78 0.) slbot_78 (- slbot_78))) (ite (>= slbot_11 0.) slbot_11 (- slbot_11))) (ite (>= slbot_88 0.) slbot_88 (- slbot_88))) (ite (>= slbot_144 0.) slbot_144 (- slbot_144))) (ite (>= slbot_165 0.) slbot_165 (- slbot_165))) (ite (>= sltop_11 0.) sltop_11 (- sltop_11))) (ite (>= sltop_70 0.) sltop_70 (- sltop_70))) (ite (>= slbot_83 0.) slbot_83 (- slbot_83))) (ite (>= sltop_88 0.) sltop_88 (- sltop_88))) (ite (>= slbot_140 0.) slbot_140 (- slbot_140))) (ite (>= sltop_116 0.) sltop_116 (- sltop_116))) (ite (>= slbot_160 0.) slbot_160 (- slbot_160))) (ite (>= sltop_71 0.) sltop_71 (- sltop_71))) (ite (>= slbot_154 0.) slbot_154 (- slbot_154))) (ite (>= sltop_92 0.) sltop_92 (- sltop_92))) (ite (>= slbot_169 0.) slbot_169 (- slbot_169))) (ite (>= sltop_174 0.) sltop_174 (- sltop_174))) (ite (>= sltop_12 0.) sltop_12 (- sltop_12))) (ite (>= slbot_71 0.) slbot_71 (- slbot_71))) (ite (>= slbot_90 0.) slbot_90 (- slbot_90))) (ite (>= sltop_5 0.) sltop_5 (- sltop_5))) (ite (>= sltop_98 0.) sltop_98 (- sltop_98))) (ite (>= slbot_164 0.) slbot_164 (- slbot_164))) (ite (>= sltop_102 0.) sltop_102 (- sltop_102))) (ite (>= sltop_140 0.) sltop_140 (- sltop_140))) (ite (>= sltop_155 0.) sltop_155 (- sltop_155))) (ite (>= slbot_142 0.) slbot_142 (- slbot_142))) (ite (>= slbot_70 0.) slbot_70 (- slbot_70))) (ite (>= sltop_142 0.) sltop_142 (- sltop_142))) (ite (>= sltop_145 0.) sltop_145 (- sltop_145))) (ite (>= sltop_78 0.) sltop_78 (- sltop_78))) (ite (>= slbot_94 0.) slbot_94 (- slbot_94))) (ite (>= sltop_83 0.) sltop_83 (- sltop_83))) (ite (>= slbot_145 0.) slbot_145 (- slbot_145))) (ite (>= slbot_146 0.) slbot_146 (- slbot_146))) (ite (>= sltop_69 0.) sltop_69 (- sltop_69))) (ite (>= sltop_169 0.) sltop_169 (- sltop_169))) (ite (>= sltop_160 0.) sltop_160 (- sltop_160))) (ite (>= slbot_8 0.) slbot_8 (- slbot_8))) (ite (>= slbot_102 0.) slbot_102 (- slbot_102))) (ite (>= sltop_144 0.) sltop_144 (- sltop_144))) (ite (>= sltop_170 0.) sltop_170 (- sltop_170)))))
(check-sat)
