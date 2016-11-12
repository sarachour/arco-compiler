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
; =  {sc.vgain[10].P} {((sc.vgain[10].X/sc.vgain[10].Y)*sc.vgain[10].Z*1.)}
(assert (= sc_3 (* (* (/ sc_0 sc_1) sc_2) 1.)))
; 
; =  {of.vgain[10].P} {0.}
(assert (= of_3 0.))
; 
; >=  {((sc.vgain[10].X*2.)+of.vgain[10].X)} {3300.}
(assert (<= (+ (* sc_0 2.) of_0) 3300.))
; 
; <=  {((sc.vgain[10].X*2.)+of.vgain[10].X)} {0.0001}
(assert (>= (+ (* sc_0 2.) of_0) 0.0001))
; 
; >=  {((sc.vgain[10].Y*1.)+of.vgain[10].Y)} {3300.}
(assert (<= (+ (* sc_1 1.) of_1) 3300.))
; 
; <=  {((sc.vgain[10].Y*1.)+of.vgain[10].Y)} {1.}
(assert (>= (+ (* sc_1 1.) of_1) 1.))
(declare-fun slbot_3 () Real)
(declare-fun sltop_3 () Real)
; 
; =  {(((sc.vgain[10].P*0.)+of.vgain[10].P)+sl.min.vgain[10].P)} {1.51515151515e-12}
(assert (= (+ (+ (* sc_3 0.) of_3) slbot_3) 1.51515151515e-12))
; 
; =  {(((sc.vgain[10].P*3.2768e-06)+of.vgain[10].P)+sl.max.vgain[10].P)} {5445000.}
(assert (= (+ (+ (* sc_3 3.2768e-06) of_3) sltop_3) 5445000.))
(declare-fun slbot_2 () Real)
(declare-fun sltop_2 () Real)
; 
; =  {(((sc.vgain[10].Z*0.)+of.vgain[10].Z)+sl.min.vgain[10].Z)} {0.0001}
(assert (= (+ (+ (* sc_2 0.) of_2) slbot_2) 0.0001))
; 
; =  {(((sc.vgain[10].Z*3.2768e-06)+of.vgain[10].Z)+sl.max.vgain[10].Z)} {3300.}
(assert (= (+ (+ (* sc_2 3.2768e-06) of_2) sltop_2) 3300.))
(declare-fun slbot_3 () Real)
(declare-fun sltop_3 () Real)
; 
; =  {(((sc.vgain[10].P*0.)+of.vgain[10].P)+sl.min.vgain[10].P)} {1.51515151515e-12}
(assert (= (+ (+ (* sc_3 0.) of_3) slbot_3) 1.51515151515e-12))
; 
; =  {(((sc.vgain[10].P*3.2768e-06)+of.vgain[10].P)+sl.max.vgain[10].P)} {5445000.}
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
; =  {(sc.switch[12].SUB/sc.switch[12].Kmod)} {1.}
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
; =  {sc.switch[12].PROD} {(sc.switch[12].Vmax/1.)}
(assert (= sc_8 (/ sc_7 1.)))
; 
; =  {of.switch[12].PROD} {0.}
(assert (= of_8 0.))
; 
; >=  {((sc.switch[12].n*1250.)+of.switch[12].n)} {3300.}
(assert (<= (+ (* sc_4 1250.) of_4) 3300.))
; 
; <=  {((sc.switch[12].n*1250.)+of.switch[12].n)} {0.5}
(assert (>= (+ (* sc_4 1250.) of_4) 0.5))
(declare-fun slbot_5 () Real)
(declare-fun sltop_5 () Real)
; 
; =  {(((sc.switch[12].SUB*-1.)+of.switch[12].SUB)+sl.min.switch[12].SUB)} {0.0001}
(assert (= (+ (+ (* sc_5 -1.) of_5) slbot_5) 0.0001))
; 
; =  {(((sc.switch[12].SUB*155.25)+of.switch[12].SUB)+sl.max.switch[12].SUB)} {10.}
(assert (= (+ (+ (* sc_5 155.25) of_5) sltop_5) 10.))
; 
; >=  {((sc.switch[12].Kmod*1.)+of.switch[12].Kmod)} {10.}
(assert (<= (+ (* sc_6 1.) of_6) 10.))
; 
; <=  {((sc.switch[12].Kmod*1.)+of.switch[12].Kmod)} {0.0001}
(assert (>= (+ (* sc_6 1.) of_6) 0.0001))
(declare-fun slbot_8 () Real)
(declare-fun sltop_8 () Real)
; 
; =  {(((sc.switch[12].PROD*0.)+of.switch[12].PROD)+sl.min.switch[12].PROD)} {9.99934002508e-38}
(assert (= (+ (+ (* sc_8 0.) of_8) slbot_8) 9.99934002508e-38))
; 
; =  {(((sc.switch[12].PROD*3.2768e-06)+of.switch[12].PROD)+sl.max.switch[12].PROD)} {9.9999999}
(assert (= (+ (+ (* sc_8 3.2768e-06) of_8) sltop_8) 9.9999999))
; 
; >=  {((sc.switch[12].Vmax*1.)+of.switch[12].Vmax)} {10.}
(assert (<= (+ (* sc_7 1.) of_7) 10.))
; 
; <=  {((sc.switch[12].Vmax*1.)+of.switch[12].Vmax)} {0.0001}
(assert (>= (+ (* sc_7 1.) of_7) 0.0001))
(declare-fun slbot_8 () Real)
(declare-fun sltop_8 () Real)
; 
; =  {(((sc.switch[12].PROD*0.)+of.switch[12].PROD)+sl.min.switch[12].PROD)} {9.99934002508e-38}
(assert (= (+ (+ (* sc_8 0.) of_8) slbot_8) 9.99934002508e-38))
; 
; =  {(((sc.switch[12].PROD*3.2768e-06)+of.switch[12].PROD)+sl.max.switch[12].PROD)} {9.9999999}
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
; =  {(sc.switch[4].SUB/sc.switch[4].Kmod)} {1.}
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
; =  {sc.switch[4].PROD} {(sc.switch[4].Vmax/1.)}
(assert (= sc_13 (/ sc_12 1.)))
; 
; =  {of.switch[4].PROD} {0.}
(assert (= of_13 0.))
; 
; >=  {((sc.switch[4].n*1000.75)+of.switch[4].n)} {3300.}
(assert (<= (+ (* sc_9 1000.75) of_9) 3300.))
; 
; <=  {((sc.switch[4].n*1000.75)+of.switch[4].n)} {0.5}
(assert (>= (+ (* sc_9 1000.75) of_9) 0.5))
; 
; >=  {((sc.switch[4].SUB*337.632520764)+of.switch[4].SUB)} {10.}
(assert (<= (+ (* sc_10 337.632520764) of_10) 10.))
; 
; <=  {((sc.switch[4].SUB*337.632520764)+of.switch[4].SUB)} {0.0001}
(assert (>= (+ (* sc_10 337.632520764) of_10) 0.0001))
(declare-fun slbot_11 () Real)
(declare-fun sltop_11 () Real)
; 
; =  {(((sc.switch[4].Kmod*0.)+of.switch[4].Kmod)+sl.min.switch[4].Kmod)} {0.0001}
(assert (= (+ (+ (* sc_11 0.) of_11) slbot_11) 0.0001))
; 
; =  {(((sc.switch[4].Kmod*1.66666666667)+of.switch[4].Kmod)+sl.max.switch[4].Kmod)} {10.}
(assert (= (+ (+ (* sc_11 1.66666666667) of_11) sltop_11) 10.))
(declare-fun slbot_13 () Real)
(declare-fun sltop_13 () Real)
; 
; =  {(((sc.switch[4].PROD*0.)+of.switch[4].PROD)+sl.min.switch[4].PROD)} {9.99934002508e-38}
(assert (= (+ (+ (* sc_13 0.) of_13) slbot_13) 9.99934002508e-38))
; 
; =  {(((sc.switch[4].PROD*15.6)+of.switch[4].PROD)+sl.max.switch[4].PROD)} {9.9999999}
(assert (= (+ (+ (* sc_13 15.6) of_13) sltop_13) 9.9999999))
(declare-fun slbot_12 () Real)
(declare-fun sltop_12 () Real)
; 
; =  {(((sc.switch[4].Vmax*0.)+of.switch[4].Vmax)+sl.min.switch[4].Vmax)} {0.0001}
(assert (= (+ (+ (* sc_12 0.) of_12) slbot_12) 0.0001))
; 
; =  {(((sc.switch[4].Vmax*15.6)+of.switch[4].Vmax)+sl.max.switch[4].Vmax)} {10.}
(assert (= (+ (+ (* sc_12 15.6) of_12) sltop_12) 10.))
(declare-fun slbot_13 () Real)
(declare-fun sltop_13 () Real)
; 
; =  {(((sc.switch[4].PROD*0.)+of.switch[4].PROD)+sl.min.switch[4].PROD)} {9.99934002508e-38}
(assert (= (+ (+ (* sc_13 0.) of_13) slbot_13) 9.99934002508e-38))
; 
; =  {(((sc.switch[4].PROD*15.6)+of.switch[4].PROD)+sl.max.switch[4].PROD)} {9.9999999}
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
; >=  {((sc.input.I[13].X*1.)+of.input.I[13].X)} {10.}
(assert (<= (+ (* sc_20 1.) of_20) 10.))
; 
; <=  {((sc.input.I[13].X*1.)+of.input.I[13].X)} {0.}
(assert (>= (+ (* sc_20 1.) of_20) 0.))
; 
; >=  {((sc.input.I[13].O*1.)+of.input.I[13].O)} {10.}
(assert (<= (+ (* sc_21 1.) of_21) 10.))
; 
; <=  {((sc.input.I[13].O*1.)+of.input.I[13].O)} {0.}
(assert (>= (+ (* sc_21 1.) of_21) 0.))
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
; >=  {((sc.input.I[9].X*337.632520764)+of.input.I[9].X)} {10.}
(assert (<= (+ (* sc_24 337.632520764) of_24) 10.))
; 
; <=  {((sc.input.I[9].X*337.632520764)+of.input.I[9].X)} {0.}
(assert (>= (+ (* sc_24 337.632520764) of_24) 0.))
; 
; >=  {((sc.input.I[9].O*337.632520764)+of.input.I[9].O)} {10.}
(assert (<= (+ (* sc_25 337.632520764) of_25) 10.))
; 
; <=  {((sc.input.I[9].O*337.632520764)+of.input.I[9].O)} {0.}
(assert (>= (+ (* sc_25 337.632520764) of_25) 0.))
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
; 
; >=  {((sc.input.I[0].X*156.25)+of.input.I[0].X)} {10.}
(assert (<= (+ (* sc_26 156.25) of_26) 10.))
; 
; <=  {((sc.input.I[0].X*156.25)+of.input.I[0].X)} {0.}
(assert (>= (+ (* sc_26 156.25) of_26) 0.))
; 
; >=  {((sc.input.I[0].O*156.25)+of.input.I[0].O)} {10.}
(assert (<= (+ (* sc_27 156.25) of_27) 10.))
; 
; <=  {((sc.input.I[0].O*156.25)+of.input.I[0].O)} {0.}
(assert (>= (+ (* sc_27 156.25) of_27) 0.))
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
; =  {sc.input.I[21].O} {sc.input.I[21].X}
(assert (= sc_37 sc_36))
; 
; =  {of.input.I[21].O} {of.input.I[21].X}
(assert (= of_37 of_36))
; 
; >=  {((sc.input.I[21].X*0.)+of.input.I[21].X)} {10.}
(assert (<= (+ (* sc_36 0.) of_36) 10.))
; 
; <=  {((sc.input.I[21].X*0.)+of.input.I[21].X)} {0.}
(assert (>= (+ (* sc_36 0.) of_36) 0.))
; 
; >=  {((sc.input.I[21].O*0.)+of.input.I[21].O)} {10.}
(assert (<= (+ (* sc_37 0.) of_37) 10.))
; 
; <=  {((sc.input.I[21].O*0.)+of.input.I[21].O)} {0.}
(assert (>= (+ (* sc_37 0.) of_37) 0.))
(declare-fun sc_38 () Real)
(assert (> sc_38 1e-08))
(declare-fun of_38 () Real)
(declare-fun sc_39 () Real)
(assert (> sc_39 1e-08))
(declare-fun of_39 () Real)
; 
; =  {sc.input.I[14].O} {sc.input.I[14].X}
(assert (= sc_39 sc_38))
; 
; =  {of.input.I[14].O} {of.input.I[14].X}
(assert (= of_39 of_38))
; 
; >=  {((sc.input.I[14].X*1.)+of.input.I[14].X)} {10.}
(assert (<= (+ (* sc_38 1.) of_38) 10.))
; 
; <=  {((sc.input.I[14].X*1.)+of.input.I[14].X)} {0.}
(assert (>= (+ (* sc_38 1.) of_38) 0.))
; 
; >=  {((sc.input.I[14].O*1.)+of.input.I[14].O)} {10.}
(assert (<= (+ (* sc_39 1.) of_39) 10.))
; 
; <=  {((sc.input.I[14].O*1.)+of.input.I[14].O)} {0.}
(assert (>= (+ (* sc_39 1.) of_39) 0.))
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
; >=  {((sc.input.I[1].X*0.)+of.input.I[1].X)} {10.}
(assert (<= (+ (* sc_50 0.) of_50) 10.))
; 
; <=  {((sc.input.I[1].X*0.)+of.input.I[1].X)} {0.}
(assert (>= (+ (* sc_50 0.) of_50) 0.))
; 
; >=  {((sc.input.I[1].O*0.)+of.input.I[1].O)} {10.}
(assert (<= (+ (* sc_51 0.) of_51) 10.))
; 
; <=  {((sc.input.I[1].O*0.)+of.input.I[1].O)} {0.}
(assert (>= (+ (* sc_51 0.) of_51) 0.))
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
; =  {sc.input.I[22].O} {sc.input.I[22].X}
(assert (= sc_55 sc_54))
; 
; =  {of.input.I[22].O} {of.input.I[22].X}
(assert (= of_55 of_54))
; 
; >=  {((sc.input.I[22].X*0.)+of.input.I[22].X)} {10.}
(assert (<= (+ (* sc_54 0.) of_54) 10.))
; 
; <=  {((sc.input.I[22].X*0.)+of.input.I[22].X)} {0.}
(assert (>= (+ (* sc_54 0.) of_54) 0.))
; 
; >=  {((sc.input.I[22].O*0.)+of.input.I[22].O)} {10.}
(assert (<= (+ (* sc_55 0.) of_55) 10.))
; 
; <=  {((sc.input.I[22].O*0.)+of.input.I[22].O)} {0.}
(assert (>= (+ (* sc_55 0.) of_55) 0.))
(declare-fun sc_56 () Real)
(assert (> sc_56 1e-08))
(declare-fun of_56 () Real)
(declare-fun sc_57 () Real)
(assert (> sc_57 1e-08))
(declare-fun of_57 () Real)
; 
; =  {sc.output.V[0].O} {sc.output.V[0].X}
(assert (= sc_57 sc_56))
; 
; =  {of.output.V[0].O} {of.output.V[0].X}
(assert (= of_57 of_56))
(declare-fun slbot_56 () Real)
(declare-fun sltop_56 () Real)
; 
; =  {(((sc.output.V[0].X*0.)+of.output.V[0].X)+sl.min.output.V[0].X)} {0.0001}
(assert (= (+ (+ (* sc_56 0.) of_56) slbot_56) 0.0001))
; 
; =  {(((sc.output.V[0].X*156.25)+of.output.V[0].X)+sl.max.output.V[0].X)} {3300.}
(assert (= (+ (+ (* sc_56 156.25) of_56) sltop_56) 3300.))
(declare-fun slbot_57 () Real)
(declare-fun sltop_57 () Real)
; 
; =  {(((sc.output.V[0].O*0.)+of.output.V[0].O)+sl.min.output.V[0].O)} {0.0001}
(assert (= (+ (+ (* sc_57 0.) of_57) slbot_57) 0.0001))
; 
; =  {(((sc.output.V[0].O*156.25)+of.output.V[0].O)+sl.max.output.V[0].O)} {3300.}
(assert (= (+ (+ (* sc_57 156.25) of_57) sltop_57) 3300.))
(declare-fun sc_58 () Real)
(assert (> sc_58 1e-08))
(declare-fun of_58 () Real)
(declare-fun sc_59 () Real)
(assert (> sc_59 1e-08))
(declare-fun of_59 () Real)
; 
; =  {sc.output.V[1].O} {sc.output.V[1].X}
(assert (= sc_59 sc_58))
; 
; =  {of.output.V[1].O} {of.output.V[1].X}
(assert (= of_59 of_58))
(declare-fun slbot_58 () Real)
(declare-fun sltop_58 () Real)
; 
; =  {(((sc.output.V[1].X*0.)+of.output.V[1].X)+sl.min.output.V[1].X)} {0.0001}
(assert (= (+ (+ (* sc_58 0.) of_58) slbot_58) 0.0001))
; 
; =  {(((sc.output.V[1].X*15.6)+of.output.V[1].X)+sl.max.output.V[1].X)} {3300.}
(assert (= (+ (+ (* sc_58 15.6) of_58) sltop_58) 3300.))
(declare-fun slbot_59 () Real)
(declare-fun sltop_59 () Real)
; 
; =  {(((sc.output.V[1].O*0.)+of.output.V[1].O)+sl.min.output.V[1].O)} {0.0001}
(assert (= (+ (+ (* sc_59 0.) of_59) slbot_59) 0.0001))
; 
; =  {(((sc.output.V[1].O*15.6)+of.output.V[1].O)+sl.max.output.V[1].O)} {3300.}
(assert (= (+ (+ (* sc_59 15.6) of_59) sltop_59) 3300.))
(declare-fun sc_60 () Real)
(assert (> sc_60 1e-08))
(declare-fun of_60 () Real)
(declare-fun sc_61 () Real)
(assert (> sc_61 1e-08))
(declare-fun of_61 () Real)
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
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_61 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_62 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_64 0.))
; 
; =  {sc.vadd[15].A} {(1.*sc.vadd[15].B)}
(assert (= sc_63 (* 1. sc_64)))
; 
; =  {sc.vadd[15].A} {(1.*sc.vadd[15].C)} {(1.*sc.vadd[15].D)}
(assert (and (= sc_63 (* 1. sc_62)) (= sc_63 (* 1. sc_61))))
; no offset
(assert (= (- (+ of_63 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[15].OUT} {(sc.vadd[15].A*1.)}
(assert (= sc_65 (* sc_63 1.)))
; 
; =  {of.vadd[15].OUT} {0.}
(assert (= of_65 0.))
; no scale
(assert (= sc_61 1.))
; no scale
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_61 0.))
; no offset
(assert (= of_66 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_62 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_64 0.))
; 
; =  {sc.vadd[15].A} {(1.*sc.vadd[15].B)}
(assert (= sc_63 (* 1. sc_64)))
; 
; =  {sc.vadd[15].A} {(1.*sc.vadd[15].C)} {(1.*sc.vadd[15].D*sc.vadd[15].OUT2)}
(assert (and (= sc_63 (* 1. sc_62)) (= sc_63 (* (* 1. sc_61) sc_66))))
; no offset
(assert (= (- (+ of_63 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[15].OUT2} {(sc.vadd[15].A*1.)}
(assert (= sc_66 (* sc_63 1.)))
; no offset
(assert (= of_66 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[15].OUT2_0} {(sc.vadd[15].A*1.)}
(assert (= sc_60 (* sc_63 1.)))
; 
; =  {of.vadd[15].OUT2_0} {0.}
(assert (= of_60 0.))
; 
; >=  {((sc.vadd[15].OUT2_0*0.)+of.vadd[15].OUT2_0)} {3300.}
(assert (<= (+ (* sc_60 0.) of_60) 3300.))
; 
; <=  {((sc.vadd[15].OUT2_0*0.)+of.vadd[15].OUT2_0)} {0.}
(assert (>= (+ (* sc_60 0.) of_60) 0.))
; 
; >=  {((sc.vadd[15].D*4.)+of.vadd[15].D)} {3300.}
(assert (<= (+ (* sc_61 4.) of_61) 3300.))
; 
; <=  {((sc.vadd[15].D*4.)+of.vadd[15].D)} {0.}
(assert (>= (+ (* sc_61 4.) of_61) 0.))
; 
; >=  {((sc.vadd[15].C*0.)+of.vadd[15].C)} {3300.}
(assert (<= (+ (* sc_62 0.) of_62) 3300.))
; 
; <=  {((sc.vadd[15].C*0.)+of.vadd[15].C)} {0.}
(assert (>= (+ (* sc_62 0.) of_62) 0.))
; 
; >=  {((sc.vadd[15].A*0.)+of.vadd[15].A)} {3300.}
(assert (<= (+ (* sc_63 0.) of_63) 3300.))
; 
; <=  {((sc.vadd[15].A*0.)+of.vadd[15].A)} {0.}
(assert (>= (+ (* sc_63 0.) of_63) 0.))
(declare-fun slbot_66 () Real)
(declare-fun sltop_66 () Real)
; 
; =  {(((sc.vadd[15].OUT2*0.)+of.vadd[15].OUT2)+sl.min.vadd[15].OUT2)} {0.}
(assert (= (+ (+ (* sc_66 0.) of_66) slbot_66) 0.))
; 
; =  {(((sc.vadd[15].OUT2*15.6)+of.vadd[15].OUT2)+sl.max.vadd[15].OUT2)} {3300.}
(assert (= (+ (+ (* sc_66 15.6) of_66) sltop_66) 3300.))
(declare-fun slbot_64 () Real)
(declare-fun sltop_64 () Real)
; 
; =  {(((sc.vadd[15].B*0.00204799328914)+of.vadd[15].B)+sl.min.vadd[15].B)} {0.}
(assert (= (+ (+ (* sc_64 0.00204799328914) of_64) slbot_64) 0.))
; 
; =  {(((sc.vadd[15].B*625.)+of.vadd[15].B)+sl.max.vadd[15].B)} {3300.}
(assert (= (+ (+ (* sc_64 625.) of_64) sltop_64) 3300.))
(declare-fun slbot_65 () Real)
(declare-fun sltop_65 () Real)
; 
; =  {(((sc.vadd[15].OUT*0.00204799328914)+of.vadd[15].OUT)+sl.min.vadd[15].OUT)} {-1650.}
(assert (= (+ (+ (* sc_65 0.00204799328914) of_65) slbot_65) -1650.))
; 
; =  {(((sc.vadd[15].OUT*625.)+of.vadd[15].OUT)+sl.max.vadd[15].OUT)} {1650.}
(assert (= (+ (+ (* sc_65 625.) of_65) sltop_65) 1650.))
(declare-fun slbot_66 () Real)
(declare-fun sltop_66 () Real)
; 
; =  {(((sc.vadd[15].OUT2*0.)+of.vadd[15].OUT2)+sl.min.vadd[15].OUT2)} {0.}
(assert (= (+ (+ (* sc_66 0.) of_66) slbot_66) 0.))
; 
; =  {(((sc.vadd[15].OUT2*15.6)+of.vadd[15].OUT2)+sl.max.vadd[15].OUT2)} {3300.}
(assert (= (+ (+ (* sc_66 15.6) of_66) sltop_66) 3300.))
(declare-fun sc_67 () Real)
(assert (> sc_67 1e-08))
(declare-fun of_67 () Real)
(declare-fun sc_68 () Real)
(assert (> sc_68 1e-08))
(declare-fun of_68 () Real)
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
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_68 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_69 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_71 0.))
; 
; =  {sc.vadd[1].A} {(1.*sc.vadd[1].B)}
(assert (= sc_70 (* 1. sc_71)))
; 
; =  {sc.vadd[1].A} {(1.*sc.vadd[1].C)} {(1.*sc.vadd[1].D)}
(assert (and (= sc_70 (* 1. sc_69)) (= sc_70 (* 1. sc_68))))
; no offset
(assert (= (- (+ of_70 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[1].OUT} {(sc.vadd[1].A*1.)}
(assert (= sc_72 (* sc_70 1.)))
; 
; =  {of.vadd[1].OUT} {0.}
(assert (= of_72 0.))
; no scale
(assert (= sc_68 1.))
; no scale
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_68 0.))
; no offset
(assert (= of_73 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_69 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_71 0.))
; 
; =  {sc.vadd[1].A} {(1.*sc.vadd[1].B)}
(assert (= sc_70 (* 1. sc_71)))
; 
; =  {sc.vadd[1].A} {(1.*sc.vadd[1].C)} {(1.*sc.vadd[1].D*sc.vadd[1].OUT2)}
(assert (and (= sc_70 (* 1. sc_69)) (= sc_70 (* (* 1. sc_68) sc_73))))
; no offset
(assert (= (- (+ of_70 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[1].OUT2} {(sc.vadd[1].A*1.)}
(assert (= sc_73 (* sc_70 1.)))
; no offset
(assert (= of_73 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[1].OUT2_0} {(sc.vadd[1].A*1.)}
(assert (= sc_67 (* sc_70 1.)))
; 
; =  {of.vadd[1].OUT2_0} {0.}
(assert (= of_67 0.))
; 
; >=  {((sc.vadd[1].OUT2_0*0.)+of.vadd[1].OUT2_0)} {3300.}
(assert (<= (+ (* sc_67 0.) of_67) 3300.))
; 
; <=  {((sc.vadd[1].OUT2_0*0.)+of.vadd[1].OUT2_0)} {0.}
(assert (>= (+ (* sc_67 0.) of_67) 0.))
; 
; >=  {((sc.vadd[1].D*4.)+of.vadd[1].D)} {3300.}
(assert (<= (+ (* sc_68 4.) of_68) 3300.))
; 
; <=  {((sc.vadd[1].D*4.)+of.vadd[1].D)} {0.}
(assert (>= (+ (* sc_68 4.) of_68) 0.))
; 
; >=  {((sc.vadd[1].C*0.)+of.vadd[1].C)} {3300.}
(assert (<= (+ (* sc_69 0.) of_69) 3300.))
; 
; <=  {((sc.vadd[1].C*0.)+of.vadd[1].C)} {0.}
(assert (>= (+ (* sc_69 0.) of_69) 0.))
; 
; >=  {((sc.vadd[1].A*0.)+of.vadd[1].A)} {3300.}
(assert (<= (+ (* sc_70 0.) of_70) 3300.))
; 
; <=  {((sc.vadd[1].A*0.)+of.vadd[1].A)} {0.}
(assert (>= (+ (* sc_70 0.) of_70) 0.))
(declare-fun slbot_73 () Real)
(declare-fun sltop_73 () Real)
; 
; =  {(((sc.vadd[1].OUT2*0.)+of.vadd[1].OUT2)+sl.min.vadd[1].OUT2)} {0.}
(assert (= (+ (+ (* sc_73 0.) of_73) slbot_73) 0.))
; 
; =  {(((sc.vadd[1].OUT2*156.25)+of.vadd[1].OUT2)+sl.max.vadd[1].OUT2)} {3300.}
(assert (= (+ (+ (* sc_73 156.25) of_73) sltop_73) 3300.))
(declare-fun slbot_71 () Real)
(declare-fun sltop_71 () Real)
; 
; =  {(((sc.vadd[1].B*3.75903614458)+of.vadd[1].B)+sl.min.vadd[1].B)} {0.}
(assert (= (+ (+ (* sc_71 3.75903614458) of_71) slbot_71) 0.))
; 
; =  {(((sc.vadd[1].B*62.4)+of.vadd[1].B)+sl.max.vadd[1].B)} {3300.}
(assert (= (+ (+ (* sc_71 62.4) of_71) sltop_71) 3300.))
(declare-fun slbot_72 () Real)
(declare-fun sltop_72 () Real)
; 
; =  {(((sc.vadd[1].OUT*3.75903614458)+of.vadd[1].OUT)+sl.min.vadd[1].OUT)} {-1650.}
(assert (= (+ (+ (* sc_72 3.75903614458) of_72) slbot_72) -1650.))
; 
; =  {(((sc.vadd[1].OUT*62.4)+of.vadd[1].OUT)+sl.max.vadd[1].OUT)} {1650.}
(assert (= (+ (+ (* sc_72 62.4) of_72) sltop_72) 1650.))
(declare-fun slbot_73 () Real)
(declare-fun sltop_73 () Real)
; 
; =  {(((sc.vadd[1].OUT2*0.)+of.vadd[1].OUT2)+sl.min.vadd[1].OUT2)} {0.}
(assert (= (+ (+ (* sc_73 0.) of_73) slbot_73) 0.))
; 
; =  {(((sc.vadd[1].OUT2*156.25)+of.vadd[1].OUT2)+sl.max.vadd[1].OUT2)} {3300.}
(assert (= (+ (+ (* sc_73 156.25) of_73) sltop_73) 3300.))
(declare-fun sc_74 () Real)
(assert (> sc_74 1e-08))
(declare-fun of_74 () Real)
(declare-fun sc_75 () Real)
(assert (> sc_75 1e-08))
(declare-fun of_75 () Real)
(declare-fun sc_76 () Real)
(assert (> sc_76 1e-08))
(declare-fun of_76 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_75 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_74 0.))
; 
; =  {sc.vtoi[9].Y} {((1./sc.vtoi[9].K)*sc.vtoi[9].X)}
(assert (= sc_76 (* (/ 1. sc_75) sc_74)))
; 
; =  {of.vtoi[9].Y} {0.}
(assert (= of_76 0.))
; 
; >=  {((sc.vtoi[9].X*1.)+of.vtoi[9].X)} {3300.}
(assert (<= (+ (* sc_74 1.) of_74) 3300.))
; 
; <=  {((sc.vtoi[9].X*1.)+of.vtoi[9].X)} {1.}
(assert (>= (+ (* sc_74 1.) of_74) 1.))
(declare-fun slbot_76 () Real)
(declare-fun sltop_76 () Real)
; 
; =  {(((sc.vtoi[9].Y*0.)+of.vtoi[9].Y)+sl.min.vtoi[9].Y)} {0.00030303030303}
(assert (= (+ (+ (* sc_76 0.) of_76) slbot_76) 0.00030303030303))
; 
; =  {(((sc.vtoi[9].Y*305175.78125)+of.vtoi[9].Y)+sl.max.vtoi[9].Y)} {3300.}
(assert (= (+ (+ (* sc_76 305175.78125) of_76) sltop_76) 3300.))
(declare-fun slbot_75 () Real)
(declare-fun sltop_75 () Real)
; 
; =  {(((sc.vtoi[9].K*0.)+of.vtoi[9].K)+sl.min.vtoi[9].K)} {1.}
(assert (= (+ (+ (* sc_75 0.) of_75) slbot_75) 1.))
; 
; =  {(((sc.vtoi[9].K*3.2768e-06)+of.vtoi[9].K)+sl.max.vtoi[9].K)} {3300.}
(assert (= (+ (+ (* sc_75 3.2768e-06) of_75) sltop_75) 3300.))
(declare-fun slbot_76 () Real)
(declare-fun sltop_76 () Real)
; 
; =  {(((sc.vtoi[9].Y*0.)+of.vtoi[9].Y)+sl.min.vtoi[9].Y)} {0.00030303030303}
(assert (= (+ (+ (* sc_76 0.) of_76) slbot_76) 0.00030303030303))
; 
; =  {(((sc.vtoi[9].Y*305175.78125)+of.vtoi[9].Y)+sl.max.vtoi[9].Y)} {3300.}
(assert (= (+ (+ (* sc_76 305175.78125) of_76) sltop_76) 3300.))
(declare-fun sc_77 () Real)
(assert (> sc_77 1e-08))
(declare-fun of_77 () Real)
(declare-fun sc_78 () Real)
(assert (> sc_78 1e-08))
(declare-fun of_78 () Real)
(declare-fun sc_79 () Real)
(assert (> sc_79 1e-08))
(declare-fun of_79 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_78 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_77 0.))
; 
; =  {sc.vtoi[3].Y} {((1./sc.vtoi[3].K)*sc.vtoi[3].X)}
(assert (= sc_79 (* (/ 1. sc_78) sc_77)))
; 
; =  {of.vtoi[3].Y} {0.}
(assert (= of_79 0.))
; 
; >=  {((sc.vtoi[3].X*1.)+of.vtoi[3].X)} {3300.}
(assert (<= (+ (* sc_77 1.) of_77) 3300.))
; 
; <=  {((sc.vtoi[3].X*1.)+of.vtoi[3].X)} {1.}
(assert (>= (+ (* sc_77 1.) of_77) 1.))
(declare-fun slbot_79 () Real)
(declare-fun sltop_79 () Real)
; 
; =  {(((sc.vtoi[3].Y*0.)+of.vtoi[3].Y)+sl.min.vtoi[3].Y)} {0.00030303030303}
(assert (= (+ (+ (* sc_79 0.) of_79) slbot_79) 0.00030303030303))
; 
; =  {(((sc.vtoi[3].Y*1.66666666667)+of.vtoi[3].Y)+sl.max.vtoi[3].Y)} {3300.}
(assert (= (+ (+ (* sc_79 1.66666666667) of_79) sltop_79) 3300.))
(declare-fun slbot_78 () Real)
(declare-fun sltop_78 () Real)
; 
; =  {(((sc.vtoi[3].K*0.)+of.vtoi[3].K)+sl.min.vtoi[3].K)} {1.}
(assert (= (+ (+ (* sc_78 0.) of_78) slbot_78) 1.))
; 
; =  {(((sc.vtoi[3].K*0.6)+of.vtoi[3].K)+sl.max.vtoi[3].K)} {3300.}
(assert (= (+ (+ (* sc_78 0.6) of_78) sltop_78) 3300.))
(declare-fun sc_80 () Real)
(assert (> sc_80 1e-08))
(declare-fun of_80 () Real)
(declare-fun sc_81 () Real)
(assert (> sc_81 1e-08))
(declare-fun of_81 () Real)
(declare-fun sc_82 () Real)
(assert (> sc_82 1e-08))
(declare-fun of_82 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_81 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_80 0.))
; 
; =  {sc.vtoi[5].Y} {((1./sc.vtoi[5].K)*sc.vtoi[5].X)}
(assert (= sc_82 (* (/ 1. sc_81) sc_80)))
; 
; =  {of.vtoi[5].Y} {0.}
(assert (= of_82 0.))
(declare-fun slbot_80 () Real)
(declare-fun sltop_80 () Real)
; 
; =  {(((sc.vtoi[5].X*0.)+of.vtoi[5].X)+sl.min.vtoi[5].X)} {1.}
(assert (= (+ (+ (* sc_80 0.) of_80) slbot_80) 1.))
; 
; =  {(((sc.vtoi[5].X*156.25)+of.vtoi[5].X)+sl.max.vtoi[5].X)} {3300.}
(assert (= (+ (+ (* sc_80 156.25) of_80) sltop_80) 3300.))
(declare-fun slbot_82 () Real)
(declare-fun sltop_82 () Real)
; 
; =  {(((sc.vtoi[5].Y*-156.25)+of.vtoi[5].Y)+sl.min.vtoi[5].Y)} {0.00030303030303}
(assert (= (+ (+ (* sc_82 -156.25) of_82) slbot_82) 0.00030303030303))
; 
; =  {(((sc.vtoi[5].Y*0.)+of.vtoi[5].Y)+sl.max.vtoi[5].Y)} {3300.}
(assert (= (+ (+ (* sc_82 0.) of_82) sltop_82) 3300.))
; 
; >=  {((sc.vtoi[5].K*-1.)+of.vtoi[5].K)} {3300.}
(assert (<= (+ (* sc_81 -1.) of_81) 3300.))
; 
; <=  {((sc.vtoi[5].K*-1.)+of.vtoi[5].K)} {1.}
(assert (>= (+ (* sc_81 -1.) of_81) 1.))
(declare-fun sc_83 () Real)
(assert (> sc_83 1e-08))
(declare-fun of_83 () Real)
(declare-fun sc_84 () Real)
(assert (> sc_84 1e-08))
(declare-fun of_84 () Real)
(declare-fun sc_85 () Real)
(assert (> sc_85 1e-08))
(declare-fun of_85 () Real)
(declare-fun sc_86 () Real)
(assert (> sc_86 1e-08))
(declare-fun of_86 () Real)
; no offset
(assert (= of_84 0.))
; no offset
(assert (= of_83 0.))
; 
; =  {1.} {(sc.igenebind[2].K*sc.igenebind[2].TF)}
(assert (= 1. (* sc_84 sc_83)))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_85 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.igenebind[2].GE} {(sc.igenebind[2].Vmax*(1./1.))}
(assert (= sc_86 (* sc_85 (/ 1. 1.))))
; 
; =  {of.igenebind[2].GE} {0.}
(assert (= of_86 0.))
; 
; >=  {((sc.igenebind[2].TF*1.)+of.igenebind[2].TF)} {10.}
(assert (<= (+ (* sc_83 1.) of_83) 10.))
; 
; <=  {((sc.igenebind[2].TF*1.)+of.igenebind[2].TF)} {0.0001}
(assert (>= (+ (* sc_83 1.) of_83) 0.0001))
(declare-fun slbot_84 () Real)
(declare-fun sltop_84 () Real)
; 
; =  {(((sc.igenebind[2].K*0.)+of.igenebind[2].K)+sl.min.igenebind[2].K)} {0.0001}
(assert (= (+ (+ (* sc_84 0.) of_84) slbot_84) 0.0001))
; 
; =  {(((sc.igenebind[2].K*15.6)+of.igenebind[2].K)+sl.max.igenebind[2].K)} {10.}
(assert (= (+ (+ (* sc_84 15.6) of_84) sltop_84) 10.))
(declare-fun slbot_86 () Real)
(declare-fun sltop_86 () Real)
; 
; =  {(((sc.igenebind[2].GE*0.939759036145)+of.igenebind[2].GE)+sl.min.igenebind[2].GE)} {9.90099009901e-07}
(assert (= (+ (+ (* sc_86 0.939759036145) of_86) slbot_86) 9.90099009901e-07))
; 
; =  {(((sc.igenebind[2].GE*15.6)+of.igenebind[2].GE)+sl.max.igenebind[2].GE)} {9.9999999}
(assert (= (+ (+ (* sc_86 15.6) of_86) sltop_86) 9.9999999))
; 
; >=  {((sc.igenebind[2].Vmax*15.6)+of.igenebind[2].Vmax)} {10.}
(assert (<= (+ (* sc_85 15.6) of_85) 10.))
; 
; <=  {((sc.igenebind[2].Vmax*15.6)+of.igenebind[2].Vmax)} {0.0001}
(assert (>= (+ (* sc_85 15.6) of_85) 0.0001))
(declare-fun sc_87 () Real)
(assert (> sc_87 1e-08))
(declare-fun of_87 () Real)
(declare-fun sc_88 () Real)
(assert (> sc_88 1e-08))
(declare-fun of_88 () Real)
(declare-fun sc_89 () Real)
(assert (> sc_89 1e-08))
(declare-fun of_89 () Real)
(declare-fun sc_90 () Real)
(assert (> sc_90 1e-08))
(declare-fun of_90 () Real)
; no offset
(assert (= of_88 0.))
; no offset
(assert (= of_87 0.))
; 
; =  {1.} {(sc.igenebind[6].K*sc.igenebind[6].TF)}
(assert (= 1. (* sc_88 sc_87)))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_89 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.igenebind[6].GE} {(sc.igenebind[6].Vmax*(1./1.))}
(assert (= sc_90 (* sc_89 (/ 1. 1.))))
; 
; =  {of.igenebind[6].GE} {0.}
(assert (= of_90 0.))
(declare-fun slbot_87 () Real)
(declare-fun sltop_87 () Real)
; 
; =  {(((sc.igenebind[6].TF*0.)+of.igenebind[6].TF)+sl.min.igenebind[6].TF)} {0.0001}
(assert (= (+ (+ (* sc_87 0.) of_87) slbot_87) 0.0001))
; 
; =  {(((sc.igenebind[6].TF*305175.78125)+of.igenebind[6].TF)+sl.max.igenebind[6].TF)} {10.}
(assert (= (+ (+ (* sc_87 305175.78125) of_87) sltop_87) 10.))
; 
; >=  {((sc.igenebind[6].K*1.)+of.igenebind[6].K)} {10.}
(assert (<= (+ (* sc_88 1.) of_88) 10.))
; 
; <=  {((sc.igenebind[6].K*1.)+of.igenebind[6].K)} {0.0001}
(assert (>= (+ (* sc_88 1.) of_88) 0.0001))
(declare-fun slbot_90 () Real)
(declare-fun sltop_90 () Real)
; 
; =  {(((sc.igenebind[6].GE*0.000511998322284)+of.igenebind[6].GE)+sl.min.igenebind[6].GE)} {9.90099009901e-07}
(assert (= (+ (+ (* sc_90 0.000511998322284) of_90) slbot_90) 9.90099009901e-07))
; 
; =  {(((sc.igenebind[6].GE*156.25)+of.igenebind[6].GE)+sl.max.igenebind[6].GE)} {9.9999999}
(assert (= (+ (+ (* sc_90 156.25) of_90) sltop_90) 9.9999999))
; 
; >=  {((sc.igenebind[6].Vmax*156.25)+of.igenebind[6].Vmax)} {10.}
(assert (<= (+ (* sc_89 156.25) of_89) 10.))
; 
; <=  {((sc.igenebind[6].Vmax*156.25)+of.igenebind[6].Vmax)} {0.0001}
(assert (>= (+ (* sc_89 156.25) of_89) 0.0001))
(declare-fun slbot_90 () Real)
(declare-fun sltop_90 () Real)
; 
; =  {(((sc.igenebind[6].GE*0.000511998322284)+of.igenebind[6].GE)+sl.min.igenebind[6].GE)} {9.90099009901e-07}
(assert (= (+ (+ (* sc_90 0.000511998322284) of_90) slbot_90) 9.90099009901e-07))
; 
; =  {(((sc.igenebind[6].GE*156.25)+of.igenebind[6].GE)+sl.max.igenebind[6].GE)} {9.9999999}
(assert (= (+ (+ (* sc_90 156.25) of_90) sltop_90) 9.9999999))
(declare-fun sc_91 () Real)
(assert (> sc_91 1e-08))
(declare-fun of_91 () Real)
(declare-fun sc_92 () Real)
(assert (> sc_92 1e-08))
(declare-fun of_92 () Real)
; 
; =  {sc.input.V[2].O} {sc.input.V[2].X}
(assert (= sc_92 sc_91))
; 
; =  {of.input.V[2].O} {of.input.V[2].X}
(assert (= of_92 of_91))
; 
; >=  {((sc.input.V[2].X*1250.)+of.input.V[2].X)} {3300.}
(assert (<= (+ (* sc_91 1250.) of_91) 3300.))
; 
; <=  {((sc.input.V[2].X*1250.)+of.input.V[2].X)} {0.}
(assert (>= (+ (* sc_91 1250.) of_91) 0.))
; 
; >=  {((sc.input.V[2].O*1250.)+of.input.V[2].O)} {3300.}
(assert (<= (+ (* sc_92 1250.) of_92) 3300.))
; 
; <=  {((sc.input.V[2].O*1250.)+of.input.V[2].O)} {0.}
(assert (>= (+ (* sc_92 1250.) of_92) 0.))
(declare-fun sc_93 () Real)
(assert (> sc_93 1e-08))
(declare-fun of_93 () Real)
(declare-fun sc_94 () Real)
(assert (> sc_94 1e-08))
(declare-fun of_94 () Real)
; 
; =  {sc.input.V[8].O} {sc.input.V[8].X}
(assert (= sc_94 sc_93))
; 
; =  {of.input.V[8].O} {of.input.V[8].X}
(assert (= of_94 of_93))
; 
; >=  {((sc.input.V[8].X*0.)+of.input.V[8].X)} {3300.}
(assert (<= (+ (* sc_93 0.) of_93) 3300.))
; 
; <=  {((sc.input.V[8].X*0.)+of.input.V[8].X)} {0.}
(assert (>= (+ (* sc_93 0.) of_93) 0.))
; 
; >=  {((sc.input.V[8].O*0.)+of.input.V[8].O)} {3300.}
(assert (<= (+ (* sc_94 0.) of_94) 3300.))
; 
; <=  {((sc.input.V[8].O*0.)+of.input.V[8].O)} {0.}
(assert (>= (+ (* sc_94 0.) of_94) 0.))
(declare-fun sc_95 () Real)
(assert (> sc_95 1e-08))
(declare-fun of_95 () Real)
(declare-fun sc_96 () Real)
(assert (> sc_96 1e-08))
(declare-fun of_96 () Real)
; 
; =  {sc.input.V[7].O} {sc.input.V[7].X}
(assert (= sc_96 sc_95))
; 
; =  {of.input.V[7].O} {of.input.V[7].X}
(assert (= of_96 of_95))
; 
; >=  {((sc.input.V[7].X*0.)+of.input.V[7].X)} {3300.}
(assert (<= (+ (* sc_95 0.) of_95) 3300.))
; 
; <=  {((sc.input.V[7].X*0.)+of.input.V[7].X)} {0.}
(assert (>= (+ (* sc_95 0.) of_95) 0.))
; 
; >=  {((sc.input.V[7].O*0.)+of.input.V[7].O)} {3300.}
(assert (<= (+ (* sc_96 0.) of_96) 3300.))
; 
; <=  {((sc.input.V[7].O*0.)+of.input.V[7].O)} {0.}
(assert (>= (+ (* sc_96 0.) of_96) 0.))
(declare-fun sc_97 () Real)
(assert (> sc_97 1e-08))
(declare-fun of_97 () Real)
(declare-fun sc_98 () Real)
(assert (> sc_98 1e-08))
(declare-fun of_98 () Real)
; 
; =  {sc.input.V[13].O} {sc.input.V[13].X}
(assert (= sc_98 sc_97))
; 
; =  {of.input.V[13].O} {of.input.V[13].X}
(assert (= of_98 of_97))
; 
; >=  {((sc.input.V[13].X*1.)+of.input.V[13].X)} {3300.}
(assert (<= (+ (* sc_97 1.) of_97) 3300.))
; 
; <=  {((sc.input.V[13].X*1.)+of.input.V[13].X)} {0.}
(assert (>= (+ (* sc_97 1.) of_97) 0.))
; 
; >=  {((sc.input.V[13].O*1.)+of.input.V[13].O)} {3300.}
(assert (<= (+ (* sc_98 1.) of_98) 3300.))
; 
; <=  {((sc.input.V[13].O*1.)+of.input.V[13].O)} {0.}
(assert (>= (+ (* sc_98 1.) of_98) 0.))
(declare-fun sc_99 () Real)
(assert (> sc_99 1e-08))
(declare-fun of_99 () Real)
(declare-fun sc_100 () Real)
(assert (> sc_100 1e-08))
(declare-fun of_100 () Real)
; 
; =  {sc.input.V[12].O} {sc.input.V[12].X}
(assert (= sc_100 sc_99))
; 
; =  {of.input.V[12].O} {of.input.V[12].X}
(assert (= of_100 of_99))
; 
; >=  {((sc.input.V[12].X*1000.75)+of.input.V[12].X)} {3300.}
(assert (<= (+ (* sc_99 1000.75) of_99) 3300.))
; 
; <=  {((sc.input.V[12].X*1000.75)+of.input.V[12].X)} {0.}
(assert (>= (+ (* sc_99 1000.75) of_99) 0.))
; 
; >=  {((sc.input.V[12].O*1000.75)+of.input.V[12].O)} {3300.}
(assert (<= (+ (* sc_100 1000.75) of_100) 3300.))
; 
; <=  {((sc.input.V[12].O*1000.75)+of.input.V[12].O)} {0.}
(assert (>= (+ (* sc_100 1000.75) of_100) 0.))
(declare-fun sc_101 () Real)
(assert (> sc_101 1e-08))
(declare-fun of_101 () Real)
(declare-fun sc_102 () Real)
(assert (> sc_102 1e-08))
(declare-fun of_102 () Real)
; 
; =  {sc.input.V[9].O} {sc.input.V[9].X}
(assert (= sc_102 sc_101))
; 
; =  {of.input.V[9].O} {of.input.V[9].X}
(assert (= of_102 of_101))
; 
; >=  {((sc.input.V[9].X*-1.)+of.input.V[9].X)} {3300.}
(assert (<= (+ (* sc_101 -1.) of_101) 3300.))
; 
; <=  {((sc.input.V[9].X*-1.)+of.input.V[9].X)} {0.}
(assert (>= (+ (* sc_101 -1.) of_101) 0.))
; 
; >=  {((sc.input.V[9].O*-1.)+of.input.V[9].O)} {3300.}
(assert (<= (+ (* sc_102 -1.) of_102) 3300.))
; 
; <=  {((sc.input.V[9].O*-1.)+of.input.V[9].O)} {0.}
(assert (>= (+ (* sc_102 -1.) of_102) 0.))
(declare-fun sc_103 () Real)
(assert (> sc_103 1e-08))
(declare-fun of_103 () Real)
(declare-fun sc_104 () Real)
(assert (> sc_104 1e-08))
(declare-fun of_104 () Real)
; 
; =  {sc.input.V[0].O} {sc.input.V[0].X}
(assert (= sc_104 sc_103))
; 
; =  {of.input.V[0].O} {of.input.V[0].X}
(assert (= of_104 of_103))
(declare-fun slbot_103 () Real)
(declare-fun sltop_103 () Real)
; 
; =  {(((sc.input.V[0].X*0.)+of.input.V[0].X)+sl.min.input.V[0].X)} {0.}
(assert (= (+ (+ (* sc_103 0.) of_103) slbot_103) 0.))
; 
; =  {(((sc.input.V[0].X*0.6)+of.input.V[0].X)+sl.max.input.V[0].X)} {3300.}
(assert (= (+ (+ (* sc_103 0.6) of_103) sltop_103) 3300.))
(declare-fun slbot_104 () Real)
(declare-fun sltop_104 () Real)
; 
; =  {(((sc.input.V[0].O*0.)+of.input.V[0].O)+sl.min.input.V[0].O)} {0.}
(assert (= (+ (+ (* sc_104 0.) of_104) slbot_104) 0.))
; 
; =  {(((sc.input.V[0].O*0.6)+of.input.V[0].O)+sl.max.input.V[0].O)} {3300.}
(assert (= (+ (+ (* sc_104 0.6) of_104) sltop_104) 3300.))
(declare-fun sc_105 () Real)
(assert (> sc_105 1e-08))
(declare-fun of_105 () Real)
(declare-fun sc_106 () Real)
(assert (> sc_106 1e-08))
(declare-fun of_106 () Real)
; 
; =  {sc.input.V[11].O} {sc.input.V[11].X}
(assert (= sc_106 sc_105))
; 
; =  {of.input.V[11].O} {of.input.V[11].X}
(assert (= of_106 of_105))
; 
; >=  {((sc.input.V[11].X*4.)+of.input.V[11].X)} {3300.}
(assert (<= (+ (* sc_105 4.) of_105) 3300.))
; 
; <=  {((sc.input.V[11].X*4.)+of.input.V[11].X)} {0.}
(assert (>= (+ (* sc_105 4.) of_105) 0.))
; 
; >=  {((sc.input.V[11].O*4.)+of.input.V[11].O)} {3300.}
(assert (<= (+ (* sc_106 4.) of_106) 3300.))
; 
; <=  {((sc.input.V[11].O*4.)+of.input.V[11].O)} {0.}
(assert (>= (+ (* sc_106 4.) of_106) 0.))
(declare-fun sc_107 () Real)
(assert (> sc_107 1e-08))
(declare-fun of_107 () Real)
(declare-fun sc_108 () Real)
(assert (> sc_108 1e-08))
(declare-fun of_108 () Real)
; 
; =  {sc.input.V[10].O} {sc.input.V[10].X}
(assert (= sc_108 sc_107))
; 
; =  {of.input.V[10].O} {of.input.V[10].X}
(assert (= of_108 of_107))
; 
; >=  {((sc.input.V[10].X*4.)+of.input.V[10].X)} {3300.}
(assert (<= (+ (* sc_107 4.) of_107) 3300.))
; 
; <=  {((sc.input.V[10].X*4.)+of.input.V[10].X)} {0.}
(assert (>= (+ (* sc_107 4.) of_107) 0.))
; 
; >=  {((sc.input.V[10].O*4.)+of.input.V[10].O)} {3300.}
(assert (<= (+ (* sc_108 4.) of_108) 3300.))
; 
; <=  {((sc.input.V[10].O*4.)+of.input.V[10].O)} {0.}
(assert (>= (+ (* sc_108 4.) of_108) 0.))
(declare-fun sc_109 () Real)
(assert (> sc_109 1e-08))
(declare-fun of_109 () Real)
(declare-fun sc_110 () Real)
(assert (> sc_110 1e-08))
(declare-fun of_110 () Real)
; 
; =  {sc.input.V[15].O} {sc.input.V[15].X}
(assert (= sc_110 sc_109))
; 
; =  {of.input.V[15].O} {of.input.V[15].X}
(assert (= of_110 of_109))
; 
; >=  {((sc.input.V[15].X*1.)+of.input.V[15].X)} {3300.}
(assert (<= (+ (* sc_109 1.) of_109) 3300.))
; 
; <=  {((sc.input.V[15].X*1.)+of.input.V[15].X)} {0.}
(assert (>= (+ (* sc_109 1.) of_109) 0.))
; 
; >=  {((sc.input.V[15].O*1.)+of.input.V[15].O)} {3300.}
(assert (<= (+ (* sc_110 1.) of_110) 3300.))
; 
; <=  {((sc.input.V[15].O*1.)+of.input.V[15].O)} {0.}
(assert (>= (+ (* sc_110 1.) of_110) 0.))
(declare-fun sc_111 () Real)
(assert (> sc_111 1e-08))
(declare-fun of_111 () Real)
(declare-fun sc_112 () Real)
(assert (> sc_112 1e-08))
(declare-fun of_112 () Real)
; 
; =  {sc.input.V[6].O} {sc.input.V[6].X}
(assert (= sc_112 sc_111))
; 
; =  {of.input.V[6].O} {of.input.V[6].X}
(assert (= of_112 of_111))
; 
; >=  {((sc.input.V[6].X*0.)+of.input.V[6].X)} {3300.}
(assert (<= (+ (* sc_111 0.) of_111) 3300.))
; 
; <=  {((sc.input.V[6].X*0.)+of.input.V[6].X)} {0.}
(assert (>= (+ (* sc_111 0.) of_111) 0.))
; 
; >=  {((sc.input.V[6].O*0.)+of.input.V[6].O)} {3300.}
(assert (<= (+ (* sc_112 0.) of_112) 3300.))
; 
; <=  {((sc.input.V[6].O*0.)+of.input.V[6].O)} {0.}
(assert (>= (+ (* sc_112 0.) of_112) 0.))
(declare-fun sc_113 () Real)
(assert (> sc_113 1e-08))
(declare-fun of_113 () Real)
(declare-fun sc_114 () Real)
(assert (> sc_114 1e-08))
(declare-fun of_114 () Real)
; 
; =  {sc.input.V[14].O} {sc.input.V[14].X}
(assert (= sc_114 sc_113))
; 
; =  {of.input.V[14].O} {of.input.V[14].X}
(assert (= of_114 of_113))
; 
; >=  {((sc.input.V[14].X*1.)+of.input.V[14].X)} {3300.}
(assert (<= (+ (* sc_113 1.) of_113) 3300.))
; 
; <=  {((sc.input.V[14].X*1.)+of.input.V[14].X)} {0.}
(assert (>= (+ (* sc_113 1.) of_113) 0.))
; 
; >=  {((sc.input.V[14].O*1.)+of.input.V[14].O)} {3300.}
(assert (<= (+ (* sc_114 1.) of_114) 3300.))
; 
; <=  {((sc.input.V[14].O*1.)+of.input.V[14].O)} {0.}
(assert (>= (+ (* sc_114 1.) of_114) 0.))
(declare-fun sc_115 () Real)
(assert (> sc_115 1e-08))
(declare-fun of_115 () Real)
(declare-fun sc_116 () Real)
(assert (> sc_116 1e-08))
(declare-fun of_116 () Real)
; 
; =  {sc.input.V[16].O} {sc.input.V[16].X}
(assert (= sc_116 sc_115))
; 
; =  {of.input.V[16].O} {of.input.V[16].X}
(assert (= of_116 of_115))
; 
; >=  {((sc.input.V[16].X*1.)+of.input.V[16].X)} {3300.}
(assert (<= (+ (* sc_115 1.) of_115) 3300.))
; 
; <=  {((sc.input.V[16].X*1.)+of.input.V[16].X)} {0.}
(assert (>= (+ (* sc_115 1.) of_115) 0.))
; 
; >=  {((sc.input.V[16].O*1.)+of.input.V[16].O)} {3300.}
(assert (<= (+ (* sc_116 1.) of_116) 3300.))
; 
; <=  {((sc.input.V[16].O*1.)+of.input.V[16].O)} {0.}
(assert (>= (+ (* sc_116 1.) of_116) 0.))
(declare-fun sc_117 () Real)
(assert (> sc_117 1e-08))
(declare-fun of_117 () Real)
(declare-fun sc_118 () Real)
(assert (> sc_118 1e-08))
(declare-fun of_118 () Real)
; 
; =  {sc.input.V[3].O} {sc.input.V[3].X}
(assert (= sc_118 sc_117))
; 
; =  {of.input.V[3].O} {of.input.V[3].X}
(assert (= of_118 of_117))
; 
; >=  {((sc.input.V[3].X*0.)+of.input.V[3].X)} {3300.}
(assert (<= (+ (* sc_117 0.) of_117) 3300.))
; 
; <=  {((sc.input.V[3].X*0.)+of.input.V[3].X)} {0.}
(assert (>= (+ (* sc_117 0.) of_117) 0.))
; 
; >=  {((sc.input.V[3].O*0.)+of.input.V[3].O)} {3300.}
(assert (<= (+ (* sc_118 0.) of_118) 3300.))
; 
; <=  {((sc.input.V[3].O*0.)+of.input.V[3].O)} {0.}
(assert (>= (+ (* sc_118 0.) of_118) 0.))
(declare-fun sc_119 () Real)
(assert (> sc_119 1e-08))
(declare-fun of_119 () Real)
(declare-fun sc_120 () Real)
(assert (> sc_120 1e-08))
(declare-fun of_120 () Real)
; 
; =  {sc.input.V[4].O} {sc.input.V[4].X}
(assert (= sc_120 sc_119))
; 
; =  {of.input.V[4].O} {of.input.V[4].X}
(assert (= of_120 of_119))
; 
; >=  {((sc.input.V[4].X*0.)+of.input.V[4].X)} {3300.}
(assert (<= (+ (* sc_119 0.) of_119) 3300.))
; 
; <=  {((sc.input.V[4].X*0.)+of.input.V[4].X)} {0.}
(assert (>= (+ (* sc_119 0.) of_119) 0.))
; 
; >=  {((sc.input.V[4].O*0.)+of.input.V[4].O)} {3300.}
(assert (<= (+ (* sc_120 0.) of_120) 3300.))
; 
; <=  {((sc.input.V[4].O*0.)+of.input.V[4].O)} {0.}
(assert (>= (+ (* sc_120 0.) of_120) 0.))
(declare-fun sc_121 () Real)
(assert (> sc_121 1e-08))
(declare-fun of_121 () Real)
(declare-fun sc_122 () Real)
(assert (> sc_122 1e-08))
(declare-fun of_122 () Real)
; 
; =  {sc.input.V[5].O} {sc.input.V[5].X}
(assert (= sc_122 sc_121))
; 
; =  {of.input.V[5].O} {of.input.V[5].X}
(assert (= of_122 of_121))
; 
; >=  {((sc.input.V[5].X*0.)+of.input.V[5].X)} {3300.}
(assert (<= (+ (* sc_121 0.) of_121) 3300.))
; 
; <=  {((sc.input.V[5].X*0.)+of.input.V[5].X)} {0.}
(assert (>= (+ (* sc_121 0.) of_121) 0.))
; 
; >=  {((sc.input.V[5].O*0.)+of.input.V[5].O)} {3300.}
(assert (<= (+ (* sc_122 0.) of_122) 3300.))
; 
; <=  {((sc.input.V[5].O*0.)+of.input.V[5].O)} {0.}
(assert (>= (+ (* sc_122 0.) of_122) 0.))
(declare-fun sc_123 () Real)
(assert (> sc_123 1e-08))
(declare-fun of_123 () Real)
(declare-fun sc_124 () Real)
(assert (> sc_124 1e-08))
(declare-fun of_124 () Real)
; 
; =  {sc.input.V[1].O} {sc.input.V[1].X}
(assert (= sc_124 sc_123))
; 
; =  {of.input.V[1].O} {of.input.V[1].X}
(assert (= of_124 of_123))
; 
; >=  {((sc.input.V[1].X*2.)+of.input.V[1].X)} {3300.}
(assert (<= (+ (* sc_123 2.) of_123) 3300.))
; 
; <=  {((sc.input.V[1].X*2.)+of.input.V[1].X)} {0.}
(assert (>= (+ (* sc_123 2.) of_123) 0.))
; 
; >=  {((sc.input.V[1].O*2.)+of.input.V[1].O)} {3300.}
(assert (<= (+ (* sc_124 2.) of_124) 3300.))
; 
; <=  {((sc.input.V[1].O*2.)+of.input.V[1].O)} {0.}
(assert (>= (+ (* sc_124 2.) of_124) 0.))
(declare-fun sc_125 () Real)
(assert (> sc_125 1e-08))
(declare-fun of_125 () Real)
(declare-fun sc_126 () Real)
(assert (> sc_126 1e-08))
(declare-fun of_126 () Real)
(declare-fun sc_127 () Real)
(assert (> sc_127 1e-08))
(declare-fun of_127 () Real)
; no offset
(assert (= of_126 0.))
; no offset
(assert (= of_125 0.))
; 
; =  {sc.itov[0].Y} {(sc.itov[0].K*sc.itov[0].X)}
(assert (= sc_127 (* sc_126 sc_125)))
; 
; =  {of.itov[0].Y} {0.}
(assert (= of_127 0.))
; 
; >=  {((sc.itov[0].X*4.)+of.itov[0].X)} {10.}
(assert (<= (+ (* sc_125 4.) of_125) 10.))
; 
; <=  {((sc.itov[0].X*4.)+of.itov[0].X)} {0.0001}
(assert (>= (+ (* sc_125 4.) of_125) 0.0001))
(declare-fun slbot_127 () Real)
(declare-fun sltop_127 () Real)
; 
; =  {(((sc.itov[0].Y*3.75903614458)+of.itov[0].Y)+sl.min.itov[0].Y)} {0.0001}
(assert (= (+ (+ (* sc_127 3.75903614458) of_127) slbot_127) 0.0001))
; 
; =  {(((sc.itov[0].Y*62.4)+of.itov[0].Y)+sl.max.itov[0].Y)} {3300.}
(assert (= (+ (+ (* sc_127 62.4) of_127) sltop_127) 3300.))
(declare-fun slbot_126 () Real)
(declare-fun sltop_126 () Real)
; 
; =  {(((sc.itov[0].K*0.939759036145)+of.itov[0].K)+sl.min.itov[0].K)} {1.}
(assert (= (+ (+ (* sc_126 0.939759036145) of_126) slbot_126) 1.))
; 
; =  {(((sc.itov[0].K*15.6)+of.itov[0].K)+sl.max.itov[0].K)} {330.}
(assert (= (+ (+ (* sc_126 15.6) of_126) sltop_126) 330.))
(declare-fun slbot_127 () Real)
(declare-fun sltop_127 () Real)
; 
; =  {(((sc.itov[0].Y*3.75903614458)+of.itov[0].Y)+sl.min.itov[0].Y)} {0.0001}
(assert (= (+ (+ (* sc_127 3.75903614458) of_127) slbot_127) 0.0001))
; 
; =  {(((sc.itov[0].Y*62.4)+of.itov[0].Y)+sl.max.itov[0].Y)} {3300.}
(assert (= (+ (+ (* sc_127 62.4) of_127) sltop_127) 3300.))
(declare-fun sc_128 () Real)
(assert (> sc_128 1e-08))
(declare-fun of_128 () Real)
(declare-fun sc_129 () Real)
(assert (> sc_129 1e-08))
(declare-fun of_129 () Real)
(declare-fun sc_130 () Real)
(assert (> sc_130 1e-08))
(declare-fun of_130 () Real)
; no offset
(assert (= of_129 0.))
; no offset
(assert (= of_128 0.))
; 
; =  {sc.itov[11].Y} {(sc.itov[11].K*sc.itov[11].X)}
(assert (= sc_130 (* sc_129 sc_128)))
; 
; =  {of.itov[11].Y} {0.}
(assert (= of_130 0.))
(declare-fun slbot_128 () Real)
(declare-fun sltop_128 () Real)
; 
; =  {(((sc.itov[11].X*0.)+of.itov[11].X)+sl.min.itov[11].X)} {0.0001}
(assert (= (+ (+ (* sc_128 0.) of_128) slbot_128) 0.0001))
; 
; =  {(((sc.itov[11].X*3.2768e-06)+of.itov[11].X)+sl.max.itov[11].X)} {10.}
(assert (= (+ (+ (* sc_128 3.2768e-06) of_128) sltop_128) 10.))
(declare-fun slbot_130 () Real)
(declare-fun sltop_130 () Real)
; 
; =  {(((sc.itov[11].Y*0.)+of.itov[11].Y)+sl.min.itov[11].Y)} {0.0001}
(assert (= (+ (+ (* sc_130 0.) of_130) slbot_130) 0.0001))
; 
; =  {(((sc.itov[11].Y*3.2768e-06)+of.itov[11].Y)+sl.max.itov[11].Y)} {3300.}
(assert (= (+ (+ (* sc_130 3.2768e-06) of_130) sltop_130) 3300.))
; 
; >=  {((sc.itov[11].K*1.)+of.itov[11].K)} {330.}
(assert (<= (+ (* sc_129 1.) of_129) 330.))
; 
; <=  {((sc.itov[11].K*1.)+of.itov[11].K)} {1.}
(assert (>= (+ (* sc_129 1.) of_129) 1.))
(declare-fun slbot_130 () Real)
(declare-fun sltop_130 () Real)
; 
; =  {(((sc.itov[11].Y*0.)+of.itov[11].Y)+sl.min.itov[11].Y)} {0.0001}
(assert (= (+ (+ (* sc_130 0.) of_130) slbot_130) 0.0001))
; 
; =  {(((sc.itov[11].Y*3.2768e-06)+of.itov[11].Y)+sl.max.itov[11].Y)} {3300.}
(assert (= (+ (+ (* sc_130 3.2768e-06) of_130) sltop_130) 3300.))
(declare-fun sc_131 () Real)
(assert (> sc_131 1e-08))
(declare-fun of_131 () Real)
(declare-fun sc_132 () Real)
(assert (> sc_132 1e-08))
(declare-fun of_132 () Real)
(declare-fun sc_133 () Real)
(assert (> sc_133 1e-08))
(declare-fun of_133 () Real)
; no offset
(assert (= of_132 0.))
; no offset
(assert (= of_131 0.))
; 
; =  {sc.itov[14].Y} {(sc.itov[14].K*sc.itov[14].X)}
(assert (= sc_133 (* sc_132 sc_131)))
; 
; =  {of.itov[14].Y} {0.}
(assert (= of_133 0.))
; 
; >=  {((sc.itov[14].X*4.)+of.itov[14].X)} {10.}
(assert (<= (+ (* sc_131 4.) of_131) 10.))
; 
; <=  {((sc.itov[14].X*4.)+of.itov[14].X)} {0.0001}
(assert (>= (+ (* sc_131 4.) of_131) 0.0001))
(declare-fun slbot_133 () Real)
(declare-fun sltop_133 () Real)
; 
; =  {(((sc.itov[14].Y*0.00204799328914)+of.itov[14].Y)+sl.min.itov[14].Y)} {0.0001}
(assert (= (+ (+ (* sc_133 0.00204799328914) of_133) slbot_133) 0.0001))
; 
; =  {(((sc.itov[14].Y*625.)+of.itov[14].Y)+sl.max.itov[14].Y)} {3300.}
(assert (= (+ (+ (* sc_133 625.) of_133) sltop_133) 3300.))
(declare-fun slbot_132 () Real)
(declare-fun sltop_132 () Real)
; 
; =  {(((sc.itov[14].K*0.000511998322284)+of.itov[14].K)+sl.min.itov[14].K)} {1.}
(assert (= (+ (+ (* sc_132 0.000511998322284) of_132) slbot_132) 1.))
; 
; =  {(((sc.itov[14].K*156.25)+of.itov[14].K)+sl.max.itov[14].K)} {330.}
(assert (= (+ (+ (* sc_132 156.25) of_132) sltop_132) 330.))
(declare-fun slbot_133 () Real)
(declare-fun sltop_133 () Real)
; 
; =  {(((sc.itov[14].Y*0.00204799328914)+of.itov[14].Y)+sl.min.itov[14].Y)} {0.0001}
(assert (= (+ (+ (* sc_133 0.00204799328914) of_133) slbot_133) 0.0001))
; 
; =  {(((sc.itov[14].Y*625.)+of.itov[14].Y)+sl.max.itov[14].Y)} {3300.}
(assert (= (+ (+ (* sc_133 625.) of_133) sltop_133) 3300.))
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
; =  {sc.iadd[8].A} {sc.iadd[8].B}
(assert (= sc_136 sc_137))
; 
; =  {sc.iadd[8].A} {sc.iadd[8].C} {sc.iadd[8].D}
(assert (and (= sc_136 sc_135) (= sc_136 sc_134)))
; 
; =  {sc.iadd[8].OUT} {sc.iadd[8].A}
(assert (= sc_138 sc_136))
; 
; =  {of.iadd[8].OUT} {((of.iadd[8].A+of.iadd[8].B)-of.iadd[8].C-of.iadd[8].D)}
(assert (= of_138 (- (+ of_136 of_137) (+ of_135 of_134))))
; 
; >=  {((sc.iadd[8].D*0.)+of.iadd[8].D)} {5.}
(assert (<= (+ (* sc_134 0.) of_134) 5.))
; 
; <=  {((sc.iadd[8].D*0.)+of.iadd[8].D)} {0.}
(assert (>= (+ (* sc_134 0.) of_134) 0.))
; 
; >=  {((sc.iadd[8].C*0.)+of.iadd[8].C)} {5.}
(assert (<= (+ (* sc_135 0.) of_135) 5.))
; 
; <=  {((sc.iadd[8].C*0.)+of.iadd[8].C)} {0.}
(assert (>= (+ (* sc_135 0.) of_135) 0.))
(declare-fun slbot_138 () Real)
(declare-fun sltop_138 () Real)
; 
; =  {(((sc.iadd[8].OUT*0.)+of.iadd[8].OUT)+sl.min.iadd[8].OUT)} {-10.}
(assert (= (+ (+ (* sc_138 0.) of_138) slbot_138) -10.))
; 
; =  {(((sc.iadd[8].OUT*305175.78125)+of.iadd[8].OUT)+sl.max.iadd[8].OUT)} {10.}
(assert (= (+ (+ (* sc_138 305175.78125) of_138) sltop_138) 10.))
; 
; >=  {((sc.iadd[8].A*0.)+of.iadd[8].A)} {5.}
(assert (<= (+ (* sc_136 0.) of_136) 5.))
; 
; <=  {((sc.iadd[8].A*0.)+of.iadd[8].A)} {0.}
(assert (>= (+ (* sc_136 0.) of_136) 0.))
(declare-fun slbot_137 () Real)
(declare-fun sltop_137 () Real)
; 
; =  {(((sc.iadd[8].B*0.)+of.iadd[8].B)+sl.min.iadd[8].B)} {0.}
(assert (= (+ (+ (* sc_137 0.) of_137) slbot_137) 0.))
; 
; =  {(((sc.iadd[8].B*305175.78125)+of.iadd[8].B)+sl.max.iadd[8].B)} {5.}
(assert (= (+ (+ (* sc_137 305175.78125) of_137) sltop_137) 5.))
(declare-fun slbot_138 () Real)
(declare-fun sltop_138 () Real)
; 
; =  {(((sc.iadd[8].OUT*0.)+of.iadd[8].OUT)+sl.min.iadd[8].OUT)} {-10.}
(assert (= (+ (+ (* sc_138 0.) of_138) slbot_138) -10.))
; 
; =  {(((sc.iadd[8].OUT*305175.78125)+of.iadd[8].OUT)+sl.max.iadd[8].OUT)} {10.}
(assert (= (+ (+ (* sc_138 305175.78125) of_138) sltop_138) 10.))
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
; =  {sc.iadd[7].A} {sc.iadd[7].B}
(assert (= sc_141 sc_142))
; 
; =  {sc.iadd[7].A} {sc.iadd[7].C} {sc.iadd[7].D}
(assert (and (= sc_141 sc_140) (= sc_141 sc_139)))
; 
; =  {sc.iadd[7].OUT} {sc.iadd[7].A}
(assert (= sc_143 sc_141))
; 
; =  {of.iadd[7].OUT} {((of.iadd[7].A+of.iadd[7].B)-of.iadd[7].C-of.iadd[7].D)}
(assert (= of_143 (- (+ of_141 of_142) (+ of_140 of_139))))
; 
; >=  {((sc.iadd[7].D*0.)+of.iadd[7].D)} {5.}
(assert (<= (+ (* sc_139 0.) of_139) 5.))
; 
; <=  {((sc.iadd[7].D*0.)+of.iadd[7].D)} {0.}
(assert (>= (+ (* sc_139 0.) of_139) 0.))
; 
; >=  {((sc.iadd[7].C*0.)+of.iadd[7].C)} {5.}
(assert (<= (+ (* sc_140 0.) of_140) 5.))
; 
; <=  {((sc.iadd[7].C*0.)+of.iadd[7].C)} {0.}
(assert (>= (+ (* sc_140 0.) of_140) 0.))
(declare-fun slbot_143 () Real)
(declare-fun sltop_143 () Real)
; 
; =  {(((sc.iadd[7].OUT*0.)+of.iadd[7].OUT)+sl.min.iadd[7].OUT)} {-10.}
(assert (= (+ (+ (* sc_143 0.) of_143) slbot_143) -10.))
; 
; =  {(((sc.iadd[7].OUT*305175.78125)+of.iadd[7].OUT)+sl.max.iadd[7].OUT)} {10.}
(assert (= (+ (+ (* sc_143 305175.78125) of_143) sltop_143) 10.))
; 
; >=  {((sc.iadd[7].A*0.)+of.iadd[7].A)} {5.}
(assert (<= (+ (* sc_141 0.) of_141) 5.))
; 
; <=  {((sc.iadd[7].A*0.)+of.iadd[7].A)} {0.}
(assert (>= (+ (* sc_141 0.) of_141) 0.))
(declare-fun slbot_142 () Real)
(declare-fun sltop_142 () Real)
; 
; =  {(((sc.iadd[7].B*0.)+of.iadd[7].B)+sl.min.iadd[7].B)} {0.}
(assert (= (+ (+ (* sc_142 0.) of_142) slbot_142) 0.))
; 
; =  {(((sc.iadd[7].B*305175.78125)+of.iadd[7].B)+sl.max.iadd[7].B)} {5.}
(assert (= (+ (+ (* sc_142 305175.78125) of_142) sltop_142) 5.))
(declare-fun slbot_143 () Real)
(declare-fun sltop_143 () Real)
; 
; =  {(((sc.iadd[7].OUT*0.)+of.iadd[7].OUT)+sl.min.iadd[7].OUT)} {-10.}
(assert (= (+ (+ (* sc_143 0.) of_143) slbot_143) -10.))
; 
; =  {(((sc.iadd[7].OUT*305175.78125)+of.iadd[7].OUT)+sl.max.iadd[7].OUT)} {10.}
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
; =  {sc.iadd[13].A} {sc.iadd[13].B}
(assert (= sc_146 sc_147))
; 
; =  {sc.iadd[13].A} {sc.iadd[13].C} {sc.iadd[13].D}
(assert (and (= sc_146 sc_145) (= sc_146 sc_144)))
; 
; =  {sc.iadd[13].OUT} {sc.iadd[13].A}
(assert (= sc_148 sc_146))
; 
; =  {of.iadd[13].OUT} {((of.iadd[13].A+of.iadd[13].B)-of.iadd[13].C-of.iadd[13].D)}
(assert (= of_148 (- (+ of_146 of_147) (+ of_145 of_144))))
(declare-fun slbot_144 () Real)
(declare-fun sltop_144 () Real)
; 
; =  {(((sc.iadd[13].D*-156.25)+of.iadd[13].D)+sl.min.iadd[13].D)} {0.}
(assert (= (+ (+ (* sc_144 -156.25) of_144) slbot_144) 0.))
; 
; =  {(((sc.iadd[13].D*0.)+of.iadd[13].D)+sl.max.iadd[13].D)} {5.}
(assert (= (+ (+ (* sc_144 0.) of_144) sltop_144) 5.))
; 
; >=  {((sc.iadd[13].C*1.)+of.iadd[13].C)} {5.}
(assert (<= (+ (* sc_145 1.) of_145) 5.))
; 
; <=  {((sc.iadd[13].C*1.)+of.iadd[13].C)} {0.}
(assert (>= (+ (* sc_145 1.) of_145) 0.))
(declare-fun slbot_148 () Real)
(declare-fun sltop_148 () Real)
; 
; =  {(((sc.iadd[13].OUT*-1.)+of.iadd[13].OUT)+sl.min.iadd[13].OUT)} {-10.}
(assert (= (+ (+ (* sc_148 -1.) of_148) slbot_148) -10.))
; 
; =  {(((sc.iadd[13].OUT*155.25)+of.iadd[13].OUT)+sl.max.iadd[13].OUT)} {10.}
(assert (= (+ (+ (* sc_148 155.25) of_148) sltop_148) 10.))
; 
; >=  {((sc.iadd[13].A*0.)+of.iadd[13].A)} {5.}
(assert (<= (+ (* sc_146 0.) of_146) 5.))
; 
; <=  {((sc.iadd[13].A*0.)+of.iadd[13].A)} {0.}
(assert (>= (+ (* sc_146 0.) of_146) 0.))
; 
; >=  {((sc.iadd[13].B*0.)+of.iadd[13].B)} {5.}
(assert (<= (+ (* sc_147 0.) of_147) 5.))
; 
; <=  {((sc.iadd[13].B*0.)+of.iadd[13].B)} {0.}
(assert (>= (+ (* sc_147 0.) of_147) 0.))
(declare-fun slbot_148 () Real)
(declare-fun sltop_148 () Real)
; 
; =  {(((sc.iadd[13].OUT*-1.)+of.iadd[13].OUT)+sl.min.iadd[13].OUT)} {-10.}
(assert (= (+ (+ (* sc_148 -1.) of_148) slbot_148) -10.))
; 
; =  {(((sc.iadd[13].OUT*155.25)+of.iadd[13].OUT)+sl.max.iadd[13].OUT)} {10.}
(assert (= (+ (+ (* sc_148 155.25) of_148) sltop_148) 10.))
(declare-fun sc_149 () Real)
(assert (> sc_149 1e-08))
(declare-fun of_149 () Real)
(declare-fun sc_150 () Real)
(assert (> sc_150 1e-08))
(declare-fun of_150 () Real)
(declare-fun sc_151 () Real)
(assert (> sc_151 1e-08))
(declare-fun of_151 () Real)
(declare-fun sc_152 () Real)
(assert (> sc_152 1e-08))
(declare-fun of_152 () Real)
(declare-fun sc_153 () Real)
(assert (> sc_153 1e-08))
(declare-fun of_153 () Real)
; 
; =  {sc.iadd[14].A} {sc.iadd[14].B}
(assert (= sc_151 sc_152))
; 
; =  {sc.iadd[14].A} {sc.iadd[14].C} {sc.iadd[14].D}
(assert (and (= sc_151 sc_150) (= sc_151 sc_149)))
; 
; =  {sc.iadd[14].OUT} {sc.iadd[14].A}
(assert (= sc_153 sc_151))
; 
; =  {of.iadd[14].OUT} {((of.iadd[14].A+of.iadd[14].B)-of.iadd[14].C-of.iadd[14].D)}
(assert (= of_153 (- (+ of_151 of_152) (+ of_150 of_149))))
; 
; >=  {((sc.iadd[14].D*0.)+of.iadd[14].D)} {5.}
(assert (<= (+ (* sc_149 0.) of_149) 5.))
; 
; <=  {((sc.iadd[14].D*0.)+of.iadd[14].D)} {0.}
(assert (>= (+ (* sc_149 0.) of_149) 0.))
; 
; >=  {((sc.iadd[14].C*0.)+of.iadd[14].C)} {5.}
(assert (<= (+ (* sc_150 0.) of_150) 5.))
; 
; <=  {((sc.iadd[14].C*0.)+of.iadd[14].C)} {0.}
(assert (>= (+ (* sc_150 0.) of_150) 0.))
(declare-fun slbot_151 () Real)
(declare-fun sltop_151 () Real)
; 
; =  {(((sc.iadd[14].A*0.)+of.iadd[14].A)+sl.min.iadd[14].A)} {0.}
(assert (= (+ (+ (* sc_151 0.) of_151) slbot_151) 0.))
; 
; =  {(((sc.iadd[14].A*15.6)+of.iadd[14].A)+sl.max.iadd[14].A)} {5.}
(assert (= (+ (+ (* sc_151 15.6) of_151) sltop_151) 5.))
; 
; >=  {((sc.iadd[14].B*0.)+of.iadd[14].B)} {5.}
(assert (<= (+ (* sc_152 0.) of_152) 5.))
; 
; <=  {((sc.iadd[14].B*0.)+of.iadd[14].B)} {0.}
(assert (>= (+ (* sc_152 0.) of_152) 0.))
(declare-fun slbot_153 () Real)
(declare-fun sltop_153 () Real)
; 
; =  {(((sc.iadd[14].OUT*0.)+of.iadd[14].OUT)+sl.min.iadd[14].OUT)} {-10.}
(assert (= (+ (+ (* sc_153 0.) of_153) slbot_153) -10.))
; 
; =  {(((sc.iadd[14].OUT*15.6)+of.iadd[14].OUT)+sl.max.iadd[14].OUT)} {10.}
(assert (= (+ (+ (* sc_153 15.6) of_153) sltop_153) 10.))
; 
; =  {sc.igenebind[2].GE} {sc.itov[0].K}
(assert (= sc_86 sc_126))
; 
; =  {of.igenebind[2].GE} {of.itov[0].K}
(assert (= of_86 of_126))
; 
; =  {sc.input.I[6].O} {sc.iadd[8].C}
(assert (= sc_35 sc_135))
; 
; =  {of.input.I[6].O} {of.iadd[8].C}
(assert (= of_35 of_135))
; 
; =  {sc.vadd[1].OUT2} {sc.vtoi[5].X}
(assert (= sc_73 sc_80))
; 
; =  {of.vadd[1].OUT2} {of.vtoi[5].X}
(assert (= of_73 of_80))
; 
; =  {sc.vadd[1].OUT2} {sc.output.V[0].X}
(assert (= sc_73 sc_56))
; 
; =  {of.vadd[1].OUT2} {of.output.V[0].X}
(assert (= of_73 of_56))
; 
; =  {sc.input.I[0].O} {sc.igenebind[6].Vmax}
(assert (= sc_27 sc_89))
; 
; =  {of.input.I[0].O} {of.igenebind[6].Vmax}
(assert (= of_27 of_89))
; 
; =  {sc.vtoi[3].Y} {sc.switch[4].Kmod}
(assert (= sc_79 sc_11))
; 
; =  {of.vtoi[3].Y} {of.switch[4].Kmod}
(assert (= of_79 of_11))
; 
; =  {sc.input.V[9].O} {sc.vtoi[5].K}
(assert (= sc_102 sc_81))
; 
; =  {of.input.V[9].O} {of.vtoi[5].K}
(assert (= of_102 of_81))
; 
; =  {sc.itov[11].Y} {sc.vgain[10].Z}
(assert (= sc_130 sc_2))
; 
; =  {of.itov[11].Y} {of.vgain[10].Z}
(assert (= of_130 of_2))
; 
; =  {sc.input.I[22].O} {sc.iadd[14].B}
(assert (= sc_55 sc_152))
; 
; =  {of.input.I[22].O} {of.iadd[14].B}
(assert (= of_55 of_152))
; 
; =  {sc.input.V[15].O} {sc.vgain[10].Y}
(assert (= sc_110 sc_1))
; 
; =  {of.input.V[15].O} {of.vgain[10].Y}
(assert (= of_110 of_1))
; 
; =  {sc.iadd[13].OUT} {sc.switch[12].SUB}
(assert (= sc_148 sc_5))
; 
; =  {of.iadd[13].OUT} {of.switch[12].SUB}
(assert (= of_148 of_5))
; 
; =  {sc.itov[14].Y} {sc.vadd[15].B}
(assert (= sc_133 sc_64))
; 
; =  {of.itov[14].Y} {of.vadd[15].B}
(assert (= of_133 of_64))
; 
; =  {sc.vtoi[5].Y} {sc.iadd[13].D}
(assert (= sc_82 sc_144))
; 
; =  {of.vtoi[5].Y} {of.iadd[13].D}
(assert (= of_82 of_144))
; 
; =  {sc.input.I[9].O} {sc.switch[4].SUB}
(assert (= sc_25 sc_10))
; 
; =  {of.input.I[9].O} {of.switch[4].SUB}
(assert (= of_25 of_10))
; 
; =  {sc.input.I[16].O} {sc.iadd[13].C}
(assert (= sc_41 sc_145))
; 
; =  {of.input.I[16].O} {of.iadd[13].C}
(assert (= of_41 of_145))
; 
; =  {sc.input.I[4].O} {sc.iadd[8].D}
(assert (= sc_45 sc_134))
; 
; =  {of.input.I[4].O} {of.iadd[8].D}
(assert (= of_45 of_134))
; 
; =  {sc.input.V[13].O} {sc.vtoi[3].X}
(assert (= sc_98 sc_77))
; 
; =  {of.input.V[13].O} {of.vtoi[3].X}
(assert (= of_98 of_77))
; 
; =  {sc.input.I[3].O} {sc.iadd[7].C}
(assert (= sc_43 sc_140))
; 
; =  {of.input.I[3].O} {of.iadd[7].C}
(assert (= of_43 of_140))
; 
; =  {sc.input.I[5].O} {sc.iadd[8].A}
(assert (= sc_47 sc_136))
; 
; =  {of.input.I[5].O} {of.iadd[8].A}
(assert (= of_47 of_136))
; 
; =  {sc.input.V[14].O} {sc.vtoi[9].X}
(assert (= sc_114 sc_74))
; 
; =  {of.input.V[14].O} {of.vtoi[9].X}
(assert (= of_114 of_74))
; 
; =  {sc.vadd[15].OUT2} {sc.switch[4].Vmax}
(assert (= sc_66 sc_12))
; 
; =  {of.vadd[15].OUT2} {of.switch[4].Vmax}
(assert (= of_66 of_12))
; 
; =  {sc.vadd[15].OUT2} {sc.output.V[1].X}
(assert (= sc_66 sc_58))
; 
; =  {of.vadd[15].OUT2} {of.output.V[1].X}
(assert (= of_66 of_58))
; 
; =  {sc.input.I[14].O} {sc.igenebind[6].K}
(assert (= sc_39 sc_88))
; 
; =  {of.input.I[14].O} {of.igenebind[6].K}
(assert (= of_39 of_88))
; 
; =  {sc.input.V[11].O} {sc.vadd[15].D}
(assert (= sc_106 sc_61))
; 
; =  {of.input.V[11].O} {of.vadd[15].D}
(assert (= of_106 of_61))
; 
; =  {sc.input.V[8].O} {sc.vadd[1].OUT2_0}
(assert (= sc_94 sc_67))
; 
; =  {of.input.V[8].O} {of.vadd[1].OUT2_0}
(assert (= of_94 of_67))
; 
; =  {sc.input.V[12].O} {sc.switch[4].n}
(assert (= sc_100 sc_9))
; 
; =  {of.input.V[12].O} {of.switch[4].n}
(assert (= of_100 of_9))
; 
; =  {sc.input.I[2].O} {sc.iadd[7].A}
(assert (= sc_15 sc_141))
; 
; =  {of.input.I[2].O} {of.iadd[7].A}
(assert (= of_15 of_141))
; 
; =  {sc.input.V[3].O} {sc.vadd[1].A}
(assert (= sc_118 sc_70))
; 
; =  {of.input.V[3].O} {of.vadd[1].A}
(assert (= of_118 of_70))
; 
; =  {sc.input.V[2].O} {sc.switch[12].n}
(assert (= sc_92 sc_4))
; 
; =  {of.input.V[2].O} {of.switch[12].n}
(assert (= of_92 of_4))
; 
; =  {sc.itov[0].Y} {sc.vadd[1].B}
(assert (= sc_127 sc_71))
; 
; =  {of.itov[0].Y} {of.vadd[1].B}
(assert (= of_127 of_71))
; 
; =  {sc.input.I[15].O} {sc.switch[12].Kmod}
(assert (= sc_33 sc_6))
; 
; =  {of.input.I[15].O} {of.switch[12].Kmod}
(assert (= of_33 of_6))
; 
; =  {sc.input.I[1].O} {sc.iadd[7].D}
(assert (= sc_51 sc_139))
; 
; =  {of.input.I[1].O} {of.iadd[7].D}
(assert (= of_51 of_139))
; 
; =  {sc.input.I[12].O} {sc.itov[14].X}
(assert (= sc_23 sc_131))
; 
; =  {of.input.I[12].O} {of.itov[14].X}
(assert (= of_23 of_131))
; 
; =  {sc.igenebind[6].GE} {sc.itov[14].K}
(assert (= sc_90 sc_132))
; 
; =  {of.igenebind[6].GE} {of.itov[14].K}
(assert (= of_90 of_132))
; 
; =  {sc.input.I[10].O} {sc.igenebind[2].Vmax}
(assert (= sc_31 sc_85))
; 
; =  {of.input.I[10].O} {of.igenebind[2].Vmax}
(assert (= of_31 of_85))
; 
; =  {sc.iadd[7].OUT} {sc.igenebind[6].TF}
(assert (= sc_143 sc_87))
; 
; =  {of.iadd[7].OUT} {of.igenebind[6].TF}
(assert (= of_143 of_87))
; 
; =  {sc.input.I[13].O} {sc.igenebind[2].TF}
(assert (= sc_21 sc_83))
; 
; =  {of.input.I[13].O} {of.igenebind[2].TF}
(assert (= of_21 of_83))
; 
; =  {sc.input.V[1].O} {sc.vgain[10].X}
(assert (= sc_124 sc_0))
; 
; =  {of.input.V[1].O} {of.vgain[10].X}
(assert (= of_124 of_0))
; 
; =  {sc.input.I[7].O} {sc.iadd[13].A}
(assert (= sc_19 sc_146))
; 
; =  {of.input.I[7].O} {of.iadd[13].A}
(assert (= of_19 of_146))
; 
; =  {sc.input.I[17].O} {sc.switch[12].Vmax}
(assert (= sc_53 sc_7))
; 
; =  {of.input.I[17].O} {of.switch[12].Vmax}
(assert (= of_53 of_7))
; 
; =  {sc.input.V[7].O} {sc.vadd[15].OUT2_0}
(assert (= sc_96 sc_60))
; 
; =  {of.input.V[7].O} {of.vadd[15].OUT2_0}
(assert (= of_96 of_60))
; 
; =  {sc.input.I[8].O} {sc.iadd[13].B}
(assert (= sc_17 sc_147))
; 
; =  {of.input.I[8].O} {of.iadd[13].B}
(assert (= of_17 of_147))
; 
; =  {sc.vgain[10].P} {sc.vtoi[9].K}
(assert (= sc_3 sc_75))
; 
; =  {of.vgain[10].P} {of.vtoi[9].K}
(assert (= of_3 of_75))
; 
; =  {sc.input.I[21].O} {sc.iadd[14].C}
(assert (= sc_37 sc_150))
; 
; =  {of.input.I[21].O} {of.iadd[14].C}
(assert (= of_37 of_150))
; 
; =  {sc.input.I[23].O} {sc.iadd[14].D}
(assert (= sc_49 sc_149))
; 
; =  {of.input.I[23].O} {of.iadd[14].D}
(assert (= of_49 of_149))
; 
; =  {sc.switch[4].PROD} {sc.iadd[14].A}
(assert (= sc_13 sc_151))
; 
; =  {of.switch[4].PROD} {of.iadd[14].A}
(assert (= of_13 of_151))
; 
; =  {sc.input.V[0].O} {sc.vtoi[3].K}
(assert (= sc_104 sc_78))
; 
; =  {of.input.V[0].O} {of.vtoi[3].K}
(assert (= of_104 of_78))
; 
; =  {sc.input.V[10].O} {sc.vadd[1].D}
(assert (= sc_108 sc_68))
; 
; =  {of.input.V[10].O} {of.vadd[1].D}
(assert (= of_108 of_68))
; 
; =  {sc.input.V[16].O} {sc.itov[11].K}
(assert (= sc_116 sc_129))
; 
; =  {of.input.V[16].O} {of.itov[11].K}
(assert (= of_116 of_129))
; 
; =  {sc.iadd[8].OUT} {sc.iadd[7].B}
(assert (= sc_138 sc_142))
; 
; =  {of.iadd[8].OUT} {of.iadd[7].B}
(assert (= of_138 of_142))
; 
; =  {sc.input.V[5].O} {sc.vadd[15].C}
(assert (= sc_122 sc_62))
; 
; =  {of.input.V[5].O} {of.vadd[15].C}
(assert (= of_122 of_62))
; 
; =  {sc.input.V[4].O} {sc.vadd[1].C}
(assert (= sc_120 sc_69))
; 
; =  {of.input.V[4].O} {of.vadd[1].C}
(assert (= of_120 of_69))
; 
; =  {sc.vtoi[9].Y} {sc.iadd[8].B}
(assert (= sc_76 sc_137))
; 
; =  {of.vtoi[9].Y} {of.iadd[8].B}
(assert (= of_76 of_137))
; 
; =  {sc.iadd[14].OUT} {sc.igenebind[2].K}
(assert (= sc_153 sc_84))
; 
; =  {of.iadd[14].OUT} {of.igenebind[2].K}
(assert (= of_153 of_84))
; 
; =  {sc.input.V[6].O} {sc.vadd[15].A}
(assert (= sc_112 sc_63))
; 
; =  {of.input.V[6].O} {of.vadd[15].A}
(assert (= of_112 of_63))
; 
; =  {sc.switch[12].PROD} {sc.itov[11].X}
(assert (= sc_8 sc_128))
; 
; =  {of.switch[12].PROD} {of.itov[11].X}
(assert (= of_8 of_128))
; 
; =  {sc.input.I[11].O} {sc.itov[0].X}
(assert (= sc_29 sc_125))
; 
; =  {of.input.I[11].O} {of.itov[0].X}
(assert (= of_29 of_125))
(assert (<= (* (/ 1. sc_57) 0.001) 0.1))
(assert (<= (* (/ 1. sc_59) 0.001) 0.1))
; 
; =  {sc.vadd[1].OUT2} {sc.output.V[0].O} {sc.vadd[15].OUT2} {sc.output.V[1].O}
(assert (and (and (= sc_73 sc_57) (= sc_73 sc_66)) (= sc_73 sc_59)))
(assert (= __minima__ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (ite (>= sltop_130 0.) sltop_130 (- sltop_130)) (ite (>= slbot_128 0.) slbot_128 (- slbot_128))) (ite (>= slbot_80 0.) slbot_80 (- slbot_80))) (ite (>= sltop_87 0.) sltop_87 (- sltop_87))) (ite (>= slbot_72 0.) slbot_72 (- slbot_72))) (ite (>= sltop_90 0.) sltop_90 (- sltop_90))) (ite (>= sltop_66 0.) sltop_66 (- sltop_66))) (ite (>= sltop_65 0.) sltop_65 (- sltop_65))) (ite (>= sltop_76 0.) sltop_76 (- sltop_76))) (ite (>= slbot_103 0.) slbot_103 (- slbot_103))) (ite (>= slbot_126 0.) slbot_126 (- slbot_126))) (ite (>= slbot_3 0.) slbot_3 (- slbot_3))) (ite (>= slbot_84 0.) slbot_84 (- slbot_84))) (ite (>= sltop_104 0.) sltop_104 (- sltop_104))) (ite (>= slbot_133 0.) slbot_133 (- slbot_133))) (ite (>= slbot_151 0.) slbot_151 (- slbot_151))) (ite (>= slbot_59 0.) slbot_59 (- slbot_59))) (ite (>= slbot_2 0.) slbot_2 (- slbot_2))) (ite (>= slbot_76 0.) slbot_76 (- slbot_76))) (ite (>= slbot_130 0.) slbot_130 (- slbot_130))) (ite (>= sltop_58 0.) sltop_58 (- sltop_58))) (ite (>= sltop_138 0.) sltop_138 (- sltop_138))) (ite (>= slbot_143 0.) slbot_143 (- slbot_143))) (ite (>= sltop_82 0.) sltop_82 (- sltop_82))) (ite (>= slbot_127 0.) slbot_127 (- slbot_127))) (ite (>= sltop_128 0.) sltop_128 (- sltop_128))) (ite (>= sltop_2 0.) sltop_2 (- sltop_2))) (ite (>= sltop_8 0.) sltop_8 (- sltop_8))) (ite (>= sltop_13 0.) sltop_13 (- sltop_13))) (ite (>= sltop_137 0.) sltop_137 (- sltop_137))) (ite (>= sltop_132 0.) sltop_132 (- sltop_132))) (ite (>= slbot_104 0.) slbot_104 (- slbot_104))) (ite (>= slbot_56 0.) slbot_56 (- slbot_56))) (ite (>= sltop_133 0.) sltop_133 (- sltop_133))) (ite (>= slbot_138 0.) slbot_138 (- slbot_138))) (ite (>= slbot_5 0.) slbot_5 (- slbot_5))) (ite (>= slbot_87 0.) slbot_87 (- slbot_87))) (ite (>= sltop_64 0.) sltop_64 (- sltop_64))) (ite (>= sltop_86 0.) sltop_86 (- sltop_86))) (ite (>= sltop_153 0.) sltop_153 (- sltop_153))) (ite (>= sltop_75 0.) sltop_75 (- sltop_75))) (ite (>= sltop_151 0.) sltop_151 (- sltop_151))) (ite (>= slbot_75 0.) slbot_75 (- slbot_75))) (ite (>= slbot_79 0.) slbot_79 (- slbot_79))) (ite (>= sltop_3 0.) sltop_3 (- sltop_3))) (ite (>= sltop_84 0.) sltop_84 (- sltop_84))) (ite (>= sltop_143 0.) sltop_143 (- sltop_143))) (ite (>= slbot_153 0.) slbot_153 (- slbot_153))) (ite (>= slbot_12 0.) slbot_12 (- slbot_12))) (ite (>= slbot_66 0.) slbot_66 (- slbot_66))) (ite (>= slbot_13 0.) slbot_13 (- slbot_13))) (ite (>= sltop_72 0.) sltop_72 (- sltop_72))) (ite (>= slbot_78 0.) slbot_78 (- slbot_78))) (ite (>= sltop_127 0.) sltop_127 (- sltop_127))) (ite (>= slbot_132 0.) slbot_132 (- slbot_132))) (ite (>= slbot_11 0.) slbot_11 (- slbot_11))) (ite (>= slbot_144 0.) slbot_144 (- slbot_144))) (ite (>= sltop_11 0.) sltop_11 (- sltop_11))) (ite (>= sltop_80 0.) sltop_80 (- sltop_80))) (ite (>= sltop_79 0.) sltop_79 (- sltop_79))) (ite (>= slbot_64 0.) slbot_64 (- slbot_64))) (ite (>= sltop_71 0.) sltop_71 (- sltop_71))) (ite (>= sltop_12 0.) sltop_12 (- sltop_12))) (ite (>= slbot_71 0.) slbot_71 (- slbot_71))) (ite (>= slbot_90 0.) slbot_90 (- slbot_90))) (ite (>= slbot_82 0.) slbot_82 (- slbot_82))) (ite (>= sltop_5 0.) sltop_5 (- sltop_5))) (ite (>= sltop_103 0.) sltop_103 (- sltop_103))) (ite (>= sltop_57 0.) sltop_57 (- sltop_57))) (ite (>= slbot_57 0.) slbot_57 (- slbot_57))) (ite (>= slbot_65 0.) slbot_65 (- slbot_65))) (ite (>= sltop_56 0.) sltop_56 (- sltop_56))) (ite (>= slbot_142 0.) slbot_142 (- slbot_142))) (ite (>= slbot_73 0.) slbot_73 (- slbot_73))) (ite (>= slbot_86 0.) slbot_86 (- slbot_86))) (ite (>= sltop_142 0.) sltop_142 (- sltop_142))) (ite (>= sltop_78 0.) sltop_78 (- sltop_78))) (ite (>= sltop_126 0.) sltop_126 (- sltop_126))) (ite (>= slbot_137 0.) slbot_137 (- slbot_137))) (ite (>= sltop_148 0.) sltop_148 (- sltop_148))) (ite (>= slbot_148 0.) slbot_148 (- slbot_148))) (ite (>= sltop_73 0.) sltop_73 (- sltop_73))) (ite (>= slbot_58 0.) slbot_58 (- slbot_58))) (ite (>= slbot_8 0.) slbot_8 (- slbot_8))) (ite (>= sltop_59 0.) sltop_59 (- sltop_59))) (ite (>= sltop_144 0.) sltop_144 (- sltop_144)))))
(check-sat)
