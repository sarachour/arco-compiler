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
; =  {sc.vgain[5].P} {((sc.vgain[5].X/sc.vgain[5].Y)*sc.vgain[5].Z*1.)}
(assert (= sc_3 (* (* (/ sc_0 sc_1) sc_2) 1.)))
; 
; =  {of.vgain[5].P} {0.}
(assert (= of_3 0.))
; 
; >=  {((sc.vgain[5].X*2.)+of.vgain[5].X)} {3300.}
(assert (<= (+ (* sc_0 2.) of_0) 3300.))
; 
; <=  {((sc.vgain[5].X*2.)+of.vgain[5].X)} {0.0001}
(assert (>= (+ (* sc_0 2.) of_0) 0.0001))
; 
; >=  {((sc.vgain[5].Y*1.)+of.vgain[5].Y)} {3300.}
(assert (<= (+ (* sc_1 1.) of_1) 3300.))
; 
; <=  {((sc.vgain[5].Y*1.)+of.vgain[5].Y)} {1.}
(assert (>= (+ (* sc_1 1.) of_1) 1.))
(declare-fun slbot_3 () Real)
(declare-fun sltop_3 () Real)
; 
; =  {(((sc.vgain[5].P*0.)+of.vgain[5].P)+sl.min.vgain[5].P)} {1.51515151515e-12}
(assert (= (+ (+ (* sc_3 0.) of_3) slbot_3) 1.51515151515e-12))
; 
; =  {(((sc.vgain[5].P*103.621514368)+of.vgain[5].P)+sl.max.vgain[5].P)} {5445000.}
(assert (= (+ (+ (* sc_3 103.621514368) of_3) sltop_3) 5445000.))
(declare-fun slbot_2 () Real)
(declare-fun sltop_2 () Real)
; 
; =  {(((sc.vgain[5].Z*0.)+of.vgain[5].Z)+sl.min.vgain[5].Z)} {0.0001}
(assert (= (+ (+ (* sc_2 0.) of_2) slbot_2) 0.0001))
; 
; =  {(((sc.vgain[5].Z*103.621514368)+of.vgain[5].Z)+sl.max.vgain[5].Z)} {3300.}
(assert (= (+ (+ (* sc_2 103.621514368) of_2) sltop_2) 3300.))
(declare-fun slbot_3 () Real)
(declare-fun sltop_3 () Real)
; 
; =  {(((sc.vgain[5].P*0.)+of.vgain[5].P)+sl.min.vgain[5].P)} {1.51515151515e-12}
(assert (= (+ (+ (* sc_3 0.) of_3) slbot_3) 1.51515151515e-12))
; 
; =  {(((sc.vgain[5].P*103.621514368)+of.vgain[5].P)+sl.max.vgain[5].P)} {5445000.}
(assert (= (+ (+ (* sc_3 103.621514368) of_3) sltop_3) 5445000.))
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
; =  {(sc.switch[7].SUB/sc.switch[7].Kmod)} {1.}
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
; =  {sc.switch[7].PROD} {(sc.switch[7].Vmax/1.)}
(assert (= sc_8 (/ sc_7 1.)))
; 
; =  {of.switch[7].PROD} {0.}
(assert (= of_8 0.))
; 
; >=  {((sc.switch[7].n*1250.)+of.switch[7].n)} {3300.}
(assert (<= (+ (* sc_4 1250.) of_4) 3300.))
; 
; <=  {((sc.switch[7].n*1250.)+of.switch[7].n)} {0.5}
(assert (>= (+ (* sc_4 1250.) of_4) 0.5))
(declare-fun slbot_5 () Real)
(declare-fun sltop_5 () Real)
; 
; =  {(((sc.switch[7].SUB*-1.)+of.switch[7].SUB)+sl.min.switch[7].SUB)} {0.0001}
(assert (= (+ (+ (* sc_5 -1.) of_5) slbot_5) 0.0001))
; 
; =  {(((sc.switch[7].SUB*-0.84375)+of.switch[7].SUB)+sl.max.switch[7].SUB)} {10.}
(assert (= (+ (+ (* sc_5 -0.84375) of_5) sltop_5) 10.))
; 
; >=  {((sc.switch[7].Kmod*1.)+of.switch[7].Kmod)} {10.}
(assert (<= (+ (* sc_6 1.) of_6) 10.))
; 
; <=  {((sc.switch[7].Kmod*1.)+of.switch[7].Kmod)} {0.0001}
(assert (>= (+ (* sc_6 1.) of_6) 0.0001))
(declare-fun slbot_8 () Real)
(declare-fun sltop_8 () Real)
; 
; =  {(((sc.switch[7].PROD*0.)+of.switch[7].PROD)+sl.min.switch[7].PROD)} {9.99934002508e-38}
(assert (= (+ (+ (* sc_8 0.) of_8) slbot_8) 9.99934002508e-38))
; 
; =  {(((sc.switch[7].PROD*103.621514368)+of.switch[7].PROD)+sl.max.switch[7].PROD)} {9.9999999}
(assert (= (+ (+ (* sc_8 103.621514368) of_8) sltop_8) 9.9999999))
; 
; >=  {((sc.switch[7].Vmax*1.)+of.switch[7].Vmax)} {10.}
(assert (<= (+ (* sc_7 1.) of_7) 10.))
; 
; <=  {((sc.switch[7].Vmax*1.)+of.switch[7].Vmax)} {0.0001}
(assert (>= (+ (* sc_7 1.) of_7) 0.0001))
(declare-fun slbot_8 () Real)
(declare-fun sltop_8 () Real)
; 
; =  {(((sc.switch[7].PROD*0.)+of.switch[7].PROD)+sl.min.switch[7].PROD)} {9.99934002508e-38}
(assert (= (+ (+ (* sc_8 0.) of_8) slbot_8) 9.99934002508e-38))
; 
; =  {(((sc.switch[7].PROD*103.621514368)+of.switch[7].PROD)+sl.max.switch[7].PROD)} {9.9999999}
(assert (= (+ (+ (* sc_8 103.621514368) of_8) sltop_8) 9.9999999))
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
; =  {(((sc.switch[15].PROD*0.0156)+of.switch[15].PROD)+sl.max.switch[15].PROD)} {9.9999999}
(assert (= (+ (+ (* sc_13 0.0156) of_13) sltop_13) 9.9999999))
(declare-fun slbot_12 () Real)
(declare-fun sltop_12 () Real)
; 
; =  {(((sc.switch[15].Vmax*0.)+of.switch[15].Vmax)+sl.min.switch[15].Vmax)} {0.0001}
(assert (= (+ (+ (* sc_12 0.) of_12) slbot_12) 0.0001))
; 
; =  {(((sc.switch[15].Vmax*0.0156)+of.switch[15].Vmax)+sl.max.switch[15].Vmax)} {10.}
(assert (= (+ (+ (* sc_12 0.0156) of_12) sltop_12) 10.))
(declare-fun slbot_13 () Real)
(declare-fun sltop_13 () Real)
; 
; =  {(((sc.switch[15].PROD*0.)+of.switch[15].PROD)+sl.min.switch[15].PROD)} {9.99934002508e-38}
(assert (= (+ (+ (* sc_13 0.) of_13) slbot_13) 9.99934002508e-38))
; 
; =  {(((sc.switch[15].PROD*0.0156)+of.switch[15].PROD)+sl.max.switch[15].PROD)} {9.9999999}
(assert (= (+ (+ (* sc_13 0.0156) of_13) sltop_13) 9.9999999))
(declare-fun sc_14 () Real)
(assert (> sc_14 1e-08))
(declare-fun of_14 () Real)
(declare-fun sc_15 () Real)
(assert (> sc_15 1e-08))
(declare-fun of_15 () Real)
; 
; =  {sc.input.I[20].O} {sc.input.I[20].X}
(assert (= sc_15 sc_14))
; 
; =  {of.input.I[20].O} {of.input.I[20].X}
(assert (= of_15 of_14))
; 
; >=  {((sc.input.I[20].X*0.)+of.input.I[20].X)} {10.}
(assert (<= (+ (* sc_14 0.) of_14) 10.))
; 
; <=  {((sc.input.I[20].X*0.)+of.input.I[20].X)} {0.}
(assert (>= (+ (* sc_14 0.) of_14) 0.))
; 
; >=  {((sc.input.I[20].O*0.)+of.input.I[20].O)} {10.}
(assert (<= (+ (* sc_15 0.) of_15) 10.))
; 
; <=  {((sc.input.I[20].O*0.)+of.input.I[20].O)} {0.}
(assert (>= (+ (* sc_15 0.) of_15) 0.))
(declare-fun sc_16 () Real)
(assert (> sc_16 1e-08))
(declare-fun of_16 () Real)
(declare-fun sc_17 () Real)
(assert (> sc_17 1e-08))
(declare-fun of_17 () Real)
; 
; =  {sc.input.I[2].O} {sc.input.I[2].X}
(assert (= sc_17 sc_16))
; 
; =  {of.input.I[2].O} {of.input.I[2].X}
(assert (= of_17 of_16))
; 
; >=  {((sc.input.I[2].X*0.)+of.input.I[2].X)} {10.}
(assert (<= (+ (* sc_16 0.) of_16) 10.))
; 
; <=  {((sc.input.I[2].X*0.)+of.input.I[2].X)} {0.}
(assert (>= (+ (* sc_16 0.) of_16) 0.))
; 
; >=  {((sc.input.I[2].O*0.)+of.input.I[2].O)} {10.}
(assert (<= (+ (* sc_17 0.) of_17) 10.))
; 
; <=  {((sc.input.I[2].O*0.)+of.input.I[2].O)} {0.}
(assert (>= (+ (* sc_17 0.) of_17) 0.))
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
; >=  {((sc.input.I[8].X*400.)+of.input.I[8].X)} {10.}
(assert (<= (+ (* sc_18 400.) of_18) 10.))
; 
; <=  {((sc.input.I[8].X*400.)+of.input.I[8].X)} {0.}
(assert (>= (+ (* sc_18 400.) of_18) 0.))
; 
; >=  {((sc.input.I[8].O*400.)+of.input.I[8].O)} {10.}
(assert (<= (+ (* sc_19 400.) of_19) 10.))
; 
; <=  {((sc.input.I[8].O*400.)+of.input.I[8].O)} {0.}
(assert (>= (+ (* sc_19 400.) of_19) 0.))
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
; >=  {((sc.input.I[13].X*1.)+of.input.I[13].X)} {10.}
(assert (<= (+ (* sc_22 1.) of_22) 10.))
; 
; <=  {((sc.input.I[13].X*1.)+of.input.I[13].X)} {0.}
(assert (>= (+ (* sc_22 1.) of_22) 0.))
; 
; >=  {((sc.input.I[13].O*1.)+of.input.I[13].O)} {10.}
(assert (<= (+ (* sc_23 1.) of_23) 10.))
; 
; <=  {((sc.input.I[13].O*1.)+of.input.I[13].O)} {0.}
(assert (>= (+ (* sc_23 1.) of_23) 0.))
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
; >=  {((sc.input.I[12].X*1.)+of.input.I[12].X)} {10.}
(assert (<= (+ (* sc_24 1.) of_24) 10.))
; 
; <=  {((sc.input.I[12].X*1.)+of.input.I[12].X)} {0.}
(assert (>= (+ (* sc_24 1.) of_24) 0.))
; 
; >=  {((sc.input.I[12].O*1.)+of.input.I[12].O)} {10.}
(assert (<= (+ (* sc_25 1.) of_25) 10.))
; 
; <=  {((sc.input.I[12].O*1.)+of.input.I[12].O)} {0.}
(assert (>= (+ (* sc_25 1.) of_25) 0.))
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
; >=  {((sc.input.I[9].X*337.632520764)+of.input.I[9].X)} {10.}
(assert (<= (+ (* sc_26 337.632520764) of_26) 10.))
; 
; <=  {((sc.input.I[9].X*337.632520764)+of.input.I[9].X)} {0.}
(assert (>= (+ (* sc_26 337.632520764) of_26) 0.))
; 
; >=  {((sc.input.I[9].O*337.632520764)+of.input.I[9].O)} {10.}
(assert (<= (+ (* sc_27 337.632520764) of_27) 10.))
; 
; <=  {((sc.input.I[9].O*337.632520764)+of.input.I[9].O)} {0.}
(assert (>= (+ (* sc_27 337.632520764) of_27) 0.))
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
; >=  {((sc.input.I[0].X*0.)+of.input.I[0].X)} {10.}
(assert (<= (+ (* sc_28 0.) of_28) 10.))
; 
; <=  {((sc.input.I[0].X*0.)+of.input.I[0].X)} {0.}
(assert (>= (+ (* sc_28 0.) of_28) 0.))
; 
; >=  {((sc.input.I[0].O*0.)+of.input.I[0].O)} {10.}
(assert (<= (+ (* sc_29 0.) of_29) 10.))
; 
; <=  {((sc.input.I[0].O*0.)+of.input.I[0].O)} {0.}
(assert (>= (+ (* sc_29 0.) of_29) 0.))
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
; >=  {((sc.input.I[11].X*1.5625)+of.input.I[11].X)} {10.}
(assert (<= (+ (* sc_30 1.5625) of_30) 10.))
; 
; <=  {((sc.input.I[11].X*1.5625)+of.input.I[11].X)} {0.}
(assert (>= (+ (* sc_30 1.5625) of_30) 0.))
; 
; >=  {((sc.input.I[11].O*1.5625)+of.input.I[11].O)} {10.}
(assert (<= (+ (* sc_31 1.5625) of_31) 10.))
; 
; <=  {((sc.input.I[11].O*1.5625)+of.input.I[11].O)} {0.}
(assert (>= (+ (* sc_31 1.5625) of_31) 0.))
(declare-fun sc_32 () Real)
(assert (> sc_32 1e-08))
(declare-fun of_32 () Real)
(declare-fun sc_33 () Real)
(assert (> sc_33 1e-08))
(declare-fun of_33 () Real)
; 
; =  {sc.input.I[10].O} {sc.input.I[10].X}
(assert (= sc_33 sc_32))
; 
; =  {of.input.I[10].O} {of.input.I[10].X}
(assert (= of_33 of_32))
; 
; >=  {((sc.input.I[10].X*0.156)+of.input.I[10].X)} {10.}
(assert (<= (+ (* sc_32 0.156) of_32) 10.))
; 
; <=  {((sc.input.I[10].X*0.156)+of.input.I[10].X)} {0.}
(assert (>= (+ (* sc_32 0.156) of_32) 0.))
; 
; >=  {((sc.input.I[10].O*0.156)+of.input.I[10].O)} {10.}
(assert (<= (+ (* sc_33 0.156) of_33) 10.))
; 
; <=  {((sc.input.I[10].O*0.156)+of.input.I[10].O)} {0.}
(assert (>= (+ (* sc_33 0.156) of_33) 0.))
(declare-fun sc_34 () Real)
(assert (> sc_34 1e-08))
(declare-fun of_34 () Real)
(declare-fun sc_35 () Real)
(assert (> sc_35 1e-08))
(declare-fun of_35 () Real)
; 
; =  {sc.input.I[15].O} {sc.input.I[15].X}
(assert (= sc_35 sc_34))
; 
; =  {of.input.I[15].O} {of.input.I[15].X}
(assert (= of_35 of_34))
; 
; >=  {((sc.input.I[15].X*1.)+of.input.I[15].X)} {10.}
(assert (<= (+ (* sc_34 1.) of_34) 10.))
; 
; <=  {((sc.input.I[15].X*1.)+of.input.I[15].X)} {0.}
(assert (>= (+ (* sc_34 1.) of_34) 0.))
; 
; >=  {((sc.input.I[15].O*1.)+of.input.I[15].O)} {10.}
(assert (<= (+ (* sc_35 1.) of_35) 10.))
; 
; <=  {((sc.input.I[15].O*1.)+of.input.I[15].O)} {0.}
(assert (>= (+ (* sc_35 1.) of_35) 0.))
(declare-fun sc_36 () Real)
(assert (> sc_36 1e-08))
(declare-fun of_36 () Real)
(declare-fun sc_37 () Real)
(assert (> sc_37 1e-08))
(declare-fun of_37 () Real)
; 
; =  {sc.input.I[6].O} {sc.input.I[6].X}
(assert (= sc_37 sc_36))
; 
; =  {of.input.I[6].O} {of.input.I[6].X}
(assert (= of_37 of_36))
; 
; >=  {((sc.input.I[6].X*0.)+of.input.I[6].X)} {10.}
(assert (<= (+ (* sc_36 0.) of_36) 10.))
; 
; <=  {((sc.input.I[6].X*0.)+of.input.I[6].X)} {0.}
(assert (>= (+ (* sc_36 0.) of_36) 0.))
; 
; >=  {((sc.input.I[6].O*0.)+of.input.I[6].O)} {10.}
(assert (<= (+ (* sc_37 0.) of_37) 10.))
; 
; <=  {((sc.input.I[6].O*0.)+of.input.I[6].O)} {0.}
(assert (>= (+ (* sc_37 0.) of_37) 0.))
(declare-fun sc_38 () Real)
(assert (> sc_38 1e-08))
(declare-fun of_38 () Real)
(declare-fun sc_39 () Real)
(assert (> sc_39 1e-08))
(declare-fun of_39 () Real)
; 
; =  {sc.input.I[21].O} {sc.input.I[21].X}
(assert (= sc_39 sc_38))
; 
; =  {of.input.I[21].O} {of.input.I[21].X}
(assert (= of_39 of_38))
; 
; >=  {((sc.input.I[21].X*0.)+of.input.I[21].X)} {10.}
(assert (<= (+ (* sc_38 0.) of_38) 10.))
; 
; <=  {((sc.input.I[21].X*0.)+of.input.I[21].X)} {0.}
(assert (>= (+ (* sc_38 0.) of_38) 0.))
; 
; >=  {((sc.input.I[21].O*0.)+of.input.I[21].O)} {10.}
(assert (<= (+ (* sc_39 0.) of_39) 10.))
; 
; <=  {((sc.input.I[21].O*0.)+of.input.I[21].O)} {0.}
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
; >=  {((sc.input.I[14].X*1.)+of.input.I[14].X)} {10.}
(assert (<= (+ (* sc_40 1.) of_40) 10.))
; 
; <=  {((sc.input.I[14].X*1.)+of.input.I[14].X)} {0.}
(assert (>= (+ (* sc_40 1.) of_40) 0.))
; 
; >=  {((sc.input.I[14].O*1.)+of.input.I[14].O)} {10.}
(assert (<= (+ (* sc_41 1.) of_41) 10.))
; 
; <=  {((sc.input.I[14].O*1.)+of.input.I[14].O)} {0.}
(assert (>= (+ (* sc_41 1.) of_41) 0.))
(declare-fun sc_42 () Real)
(assert (> sc_42 1e-08))
(declare-fun of_42 () Real)
(declare-fun sc_43 () Real)
(assert (> sc_43 1e-08))
(declare-fun of_43 () Real)
; 
; =  {sc.input.I[16].O} {sc.input.I[16].X}
(assert (= sc_43 sc_42))
; 
; =  {of.input.I[16].O} {of.input.I[16].X}
(assert (= of_43 of_42))
; 
; >=  {((sc.input.I[16].X*1.)+of.input.I[16].X)} {10.}
(assert (<= (+ (* sc_42 1.) of_42) 10.))
; 
; <=  {((sc.input.I[16].X*1.)+of.input.I[16].X)} {0.}
(assert (>= (+ (* sc_42 1.) of_42) 0.))
; 
; >=  {((sc.input.I[16].O*1.)+of.input.I[16].O)} {10.}
(assert (<= (+ (* sc_43 1.) of_43) 10.))
; 
; <=  {((sc.input.I[16].O*1.)+of.input.I[16].O)} {0.}
(assert (>= (+ (* sc_43 1.) of_43) 0.))
(declare-fun sc_44 () Real)
(assert (> sc_44 1e-08))
(declare-fun of_44 () Real)
(declare-fun sc_45 () Real)
(assert (> sc_45 1e-08))
(declare-fun of_45 () Real)
; 
; =  {sc.input.I[3].O} {sc.input.I[3].X}
(assert (= sc_45 sc_44))
; 
; =  {of.input.I[3].O} {of.input.I[3].X}
(assert (= of_45 of_44))
; 
; >=  {((sc.input.I[3].X*0.)+of.input.I[3].X)} {10.}
(assert (<= (+ (* sc_44 0.) of_44) 10.))
; 
; <=  {((sc.input.I[3].X*0.)+of.input.I[3].X)} {0.}
(assert (>= (+ (* sc_44 0.) of_44) 0.))
; 
; >=  {((sc.input.I[3].O*0.)+of.input.I[3].O)} {10.}
(assert (<= (+ (* sc_45 0.) of_45) 10.))
; 
; <=  {((sc.input.I[3].O*0.)+of.input.I[3].O)} {0.}
(assert (>= (+ (* sc_45 0.) of_45) 0.))
(declare-fun sc_46 () Real)
(assert (> sc_46 1e-08))
(declare-fun of_46 () Real)
(declare-fun sc_47 () Real)
(assert (> sc_47 1e-08))
(declare-fun of_47 () Real)
; 
; =  {sc.input.I[4].O} {sc.input.I[4].X}
(assert (= sc_47 sc_46))
; 
; =  {of.input.I[4].O} {of.input.I[4].X}
(assert (= of_47 of_46))
; 
; >=  {((sc.input.I[4].X*0.)+of.input.I[4].X)} {10.}
(assert (<= (+ (* sc_46 0.) of_46) 10.))
; 
; <=  {((sc.input.I[4].X*0.)+of.input.I[4].X)} {0.}
(assert (>= (+ (* sc_46 0.) of_46) 0.))
; 
; >=  {((sc.input.I[4].O*0.)+of.input.I[4].O)} {10.}
(assert (<= (+ (* sc_47 0.) of_47) 10.))
; 
; <=  {((sc.input.I[4].O*0.)+of.input.I[4].O)} {0.}
(assert (>= (+ (* sc_47 0.) of_47) 0.))
(declare-fun sc_48 () Real)
(assert (> sc_48 1e-08))
(declare-fun of_48 () Real)
(declare-fun sc_49 () Real)
(assert (> sc_49 1e-08))
(declare-fun of_49 () Real)
; 
; =  {sc.input.I[5].O} {sc.input.I[5].X}
(assert (= sc_49 sc_48))
; 
; =  {of.input.I[5].O} {of.input.I[5].X}
(assert (= of_49 of_48))
; 
; >=  {((sc.input.I[5].X*0.)+of.input.I[5].X)} {10.}
(assert (<= (+ (* sc_48 0.) of_48) 10.))
; 
; <=  {((sc.input.I[5].X*0.)+of.input.I[5].X)} {0.}
(assert (>= (+ (* sc_48 0.) of_48) 0.))
; 
; >=  {((sc.input.I[5].O*0.)+of.input.I[5].O)} {10.}
(assert (<= (+ (* sc_49 0.) of_49) 10.))
; 
; <=  {((sc.input.I[5].O*0.)+of.input.I[5].O)} {0.}
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
; =  {sc.input.I[22].O} {sc.input.I[22].X}
(assert (= sc_53 sc_52))
; 
; =  {of.input.I[22].O} {of.input.I[22].X}
(assert (= of_53 of_52))
; 
; >=  {((sc.input.I[22].X*0.)+of.input.I[22].X)} {10.}
(assert (<= (+ (* sc_52 0.) of_52) 10.))
; 
; <=  {((sc.input.I[22].X*0.)+of.input.I[22].X)} {0.}
(assert (>= (+ (* sc_52 0.) of_52) 0.))
; 
; >=  {((sc.input.I[22].O*0.)+of.input.I[22].O)} {10.}
(assert (<= (+ (* sc_53 0.) of_53) 10.))
; 
; <=  {((sc.input.I[22].O*0.)+of.input.I[22].O)} {0.}
(assert (>= (+ (* sc_53 0.) of_53) 0.))
(declare-fun sc_54 () Real)
(assert (> sc_54 1e-08))
(declare-fun of_54 () Real)
(declare-fun sc_55 () Real)
(assert (> sc_55 1e-08))
(declare-fun of_55 () Real)
; 
; =  {sc.output.V[0].O} {sc.output.V[0].X}
(assert (= sc_55 sc_54))
; 
; =  {of.output.V[0].O} {of.output.V[0].X}
(assert (= of_55 of_54))
(declare-fun slbot_54 () Real)
(declare-fun sltop_54 () Real)
; 
; =  {(((sc.output.V[0].X*0.)+of.output.V[0].X)+sl.min.output.V[0].X)} {0.0001}
(assert (= (+ (+ (* sc_54 0.) of_54) slbot_54) 0.0001))
; 
; =  {(((sc.output.V[0].X*0.15625)+of.output.V[0].X)+sl.max.output.V[0].X)} {3300.}
(assert (= (+ (+ (* sc_54 0.15625) of_54) sltop_54) 3300.))
(declare-fun slbot_55 () Real)
(declare-fun sltop_55 () Real)
; 
; =  {(((sc.output.V[0].O*0.)+of.output.V[0].O)+sl.min.output.V[0].O)} {0.0001}
(assert (= (+ (+ (* sc_55 0.) of_55) slbot_55) 0.0001))
; 
; =  {(((sc.output.V[0].O*0.15625)+of.output.V[0].O)+sl.max.output.V[0].O)} {3300.}
(assert (= (+ (+ (* sc_55 0.15625) of_55) sltop_55) 3300.))
(declare-fun sc_56 () Real)
(assert (> sc_56 1e-08))
(declare-fun of_56 () Real)
(declare-fun sc_57 () Real)
(assert (> sc_57 1e-08))
(declare-fun of_57 () Real)
; 
; =  {sc.output.V[1].O} {sc.output.V[1].X}
(assert (= sc_57 sc_56))
; 
; =  {of.output.V[1].O} {of.output.V[1].X}
(assert (= of_57 of_56))
(declare-fun slbot_56 () Real)
(declare-fun sltop_56 () Real)
; 
; =  {(((sc.output.V[1].X*0.)+of.output.V[1].X)+sl.min.output.V[1].X)} {0.0001}
(assert (= (+ (+ (* sc_56 0.) of_56) slbot_56) 0.0001))
; 
; =  {(((sc.output.V[1].X*0.0156)+of.output.V[1].X)+sl.max.output.V[1].X)} {3300.}
(assert (= (+ (+ (* sc_56 0.0156) of_56) sltop_56) 3300.))
(declare-fun slbot_57 () Real)
(declare-fun sltop_57 () Real)
; 
; =  {(((sc.output.V[1].O*0.)+of.output.V[1].O)+sl.min.output.V[1].O)} {0.0001}
(assert (= (+ (+ (* sc_57 0.) of_57) slbot_57) 0.0001))
; 
; =  {(((sc.output.V[1].O*0.0156)+of.output.V[1].O)+sl.max.output.V[1].O)} {3300.}
(assert (= (+ (+ (* sc_57 0.0156) of_57) sltop_57) 3300.))
(declare-fun sc_58 () Real)
(assert (> sc_58 1e-08))
(declare-fun of_58 () Real)
(declare-fun sc_59 () Real)
(assert (> sc_59 1e-08))
(declare-fun of_59 () Real)
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
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_59 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_60 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_62 0.))
; 
; =  {sc.vadd[12].A} {(1.*sc.vadd[12].B)}
(assert (= sc_61 (* 1. sc_62)))
; 
; =  {sc.vadd[12].A} {(1.*sc.vadd[12].C)} {(1.*sc.vadd[12].D)}
(assert (and (= sc_61 (* 1. sc_60)) (= sc_61 (* 1. sc_59))))
; no offset
(assert (= (- (+ of_61 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[12].OUT} {(sc.vadd[12].A*1.)}
(assert (= sc_63 (* sc_61 1.)))
; 
; =  {of.vadd[12].OUT} {0.}
(assert (= of_63 0.))
; no scale
(assert (= sc_59 1.))
; no scale
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_59 0.))
; no offset
(assert (= of_64 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_60 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_62 0.))
; 
; =  {sc.vadd[12].A} {(1.*sc.vadd[12].B)}
(assert (= sc_61 (* 1. sc_62)))
; 
; =  {sc.vadd[12].A} {(1.*sc.vadd[12].C)} {(1.*sc.vadd[12].D*sc.vadd[12].OUT2)}
(assert (and (= sc_61 (* 1. sc_60)) (= sc_61 (* (* 1. sc_59) sc_64))))
; no offset
(assert (= (- (+ of_61 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[12].OUT2} {(sc.vadd[12].A*1.)}
(assert (= sc_64 (* sc_61 1.)))
; no offset
(assert (= of_64 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[12].OUT2_0} {(sc.vadd[12].A*1.)}
(assert (= sc_58 (* sc_61 1.)))
; 
; =  {of.vadd[12].OUT2_0} {0.}
(assert (= of_58 0.))
; 
; >=  {((sc.vadd[12].OUT2_0*0.)+of.vadd[12].OUT2_0)} {3300.}
(assert (<= (+ (* sc_58 0.) of_58) 3300.))
; 
; <=  {((sc.vadd[12].OUT2_0*0.)+of.vadd[12].OUT2_0)} {0.}
(assert (>= (+ (* sc_58 0.) of_58) 0.))
; 
; >=  {((sc.vadd[12].D*4.)+of.vadd[12].D)} {3300.}
(assert (<= (+ (* sc_59 4.) of_59) 3300.))
; 
; <=  {((sc.vadd[12].D*4.)+of.vadd[12].D)} {0.}
(assert (>= (+ (* sc_59 4.) of_59) 0.))
; 
; >=  {((sc.vadd[12].C*0.)+of.vadd[12].C)} {3300.}
(assert (<= (+ (* sc_60 0.) of_60) 3300.))
; 
; <=  {((sc.vadd[12].C*0.)+of.vadd[12].C)} {0.}
(assert (>= (+ (* sc_60 0.) of_60) 0.))
; 
; >=  {((sc.vadd[12].A*0.)+of.vadd[12].A)} {3300.}
(assert (<= (+ (* sc_61 0.) of_61) 3300.))
; 
; <=  {((sc.vadd[12].A*0.)+of.vadd[12].A)} {0.}
(assert (>= (+ (* sc_61 0.) of_61) 0.))
(declare-fun slbot_64 () Real)
(declare-fun sltop_64 () Real)
; 
; =  {(((sc.vadd[12].OUT2*0.)+of.vadd[12].OUT2)+sl.min.vadd[12].OUT2)} {0.}
(assert (= (+ (+ (* sc_64 0.) of_64) slbot_64) 0.))
; 
; =  {(((sc.vadd[12].OUT2*0.15625)+of.vadd[12].OUT2)+sl.max.vadd[12].OUT2)} {3300.}
(assert (= (+ (+ (* sc_64 0.15625) of_64) sltop_64) 3300.))
(declare-fun slbot_62 () Real)
(declare-fun sltop_62 () Real)
; 
; =  {(((sc.vadd[12].B*61.4415124065)+of.vadd[12].B)+sl.min.vadd[12].B)} {0.}
(assert (= (+ (+ (* sc_62 61.4415124065) of_62) slbot_62) 0.))
; 
; =  {(((sc.vadd[12].B*62.4)+of.vadd[12].B)+sl.max.vadd[12].B)} {3300.}
(assert (= (+ (+ (* sc_62 62.4) of_62) sltop_62) 3300.))
(declare-fun slbot_63 () Real)
(declare-fun sltop_63 () Real)
; 
; =  {(((sc.vadd[12].OUT*61.4415124065)+of.vadd[12].OUT)+sl.min.vadd[12].OUT)} {-1650.}
(assert (= (+ (+ (* sc_63 61.4415124065) of_63) slbot_63) -1650.))
; 
; =  {(((sc.vadd[12].OUT*62.4)+of.vadd[12].OUT)+sl.max.vadd[12].OUT)} {1650.}
(assert (= (+ (+ (* sc_63 62.4) of_63) sltop_63) 1650.))
(declare-fun slbot_64 () Real)
(declare-fun sltop_64 () Real)
; 
; =  {(((sc.vadd[12].OUT2*0.)+of.vadd[12].OUT2)+sl.min.vadd[12].OUT2)} {0.}
(assert (= (+ (+ (* sc_64 0.) of_64) slbot_64) 0.))
; 
; =  {(((sc.vadd[12].OUT2*0.15625)+of.vadd[12].OUT2)+sl.max.vadd[12].OUT2)} {3300.}
(assert (= (+ (+ (* sc_64 0.15625) of_64) sltop_64) 3300.))
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
(declare-fun sc_69 () Real)
(assert (> sc_69 1e-08))
(declare-fun of_69 () Real)
(declare-fun sc_70 () Real)
(assert (> sc_70 1e-08))
(declare-fun of_70 () Real)
(declare-fun sc_71 () Real)
(assert (> sc_71 1e-08))
(declare-fun of_71 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_66 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_67 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_69 0.))
; 
; =  {sc.vadd[10].A} {(1.*sc.vadd[10].B)}
(assert (= sc_68 (* 1. sc_69)))
; 
; =  {sc.vadd[10].A} {(1.*sc.vadd[10].C)} {(1.*sc.vadd[10].D)}
(assert (and (= sc_68 (* 1. sc_67)) (= sc_68 (* 1. sc_66))))
; no offset
(assert (= (- (+ of_68 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[10].OUT} {(sc.vadd[10].A*1.)}
(assert (= sc_70 (* sc_68 1.)))
; 
; =  {of.vadd[10].OUT} {0.}
(assert (= of_70 0.))
; no scale
(assert (= sc_66 1.))
; no scale
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_66 0.))
; no offset
(assert (= of_71 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_67 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_69 0.))
; 
; =  {sc.vadd[10].A} {(1.*sc.vadd[10].B)}
(assert (= sc_68 (* 1. sc_69)))
; 
; =  {sc.vadd[10].A} {(1.*sc.vadd[10].C)} {(1.*sc.vadd[10].D*sc.vadd[10].OUT2)}
(assert (and (= sc_68 (* 1. sc_67)) (= sc_68 (* (* 1. sc_66) sc_71))))
; no offset
(assert (= (- (+ of_68 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[10].OUT2} {(sc.vadd[10].A*1.)}
(assert (= sc_71 (* sc_68 1.)))
; no offset
(assert (= of_71 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[10].OUT2_0} {(sc.vadd[10].A*1.)}
(assert (= sc_65 (* sc_68 1.)))
; 
; =  {of.vadd[10].OUT2_0} {0.}
(assert (= of_65 0.))
; 
; >=  {((sc.vadd[10].OUT2_0*0.)+of.vadd[10].OUT2_0)} {3300.}
(assert (<= (+ (* sc_65 0.) of_65) 3300.))
; 
; <=  {((sc.vadd[10].OUT2_0*0.)+of.vadd[10].OUT2_0)} {0.}
(assert (>= (+ (* sc_65 0.) of_65) 0.))
; 
; >=  {((sc.vadd[10].D*4.)+of.vadd[10].D)} {3300.}
(assert (<= (+ (* sc_66 4.) of_66) 3300.))
; 
; <=  {((sc.vadd[10].D*4.)+of.vadd[10].D)} {0.}
(assert (>= (+ (* sc_66 4.) of_66) 0.))
; 
; >=  {((sc.vadd[10].C*0.)+of.vadd[10].C)} {3300.}
(assert (<= (+ (* sc_67 0.) of_67) 3300.))
; 
; <=  {((sc.vadd[10].C*0.)+of.vadd[10].C)} {0.}
(assert (>= (+ (* sc_67 0.) of_67) 0.))
; 
; >=  {((sc.vadd[10].A*0.)+of.vadd[10].A)} {3300.}
(assert (<= (+ (* sc_68 0.) of_68) 3300.))
; 
; <=  {((sc.vadd[10].A*0.)+of.vadd[10].A)} {0.}
(assert (>= (+ (* sc_68 0.) of_68) 0.))
(declare-fun slbot_71 () Real)
(declare-fun sltop_71 () Real)
; 
; =  {(((sc.vadd[10].OUT2*0.)+of.vadd[10].OUT2)+sl.min.vadd[10].OUT2)} {0.}
(assert (= (+ (+ (* sc_71 0.) of_71) slbot_71) 0.))
; 
; =  {(((sc.vadd[10].OUT2*0.0156)+of.vadd[10].OUT2)+sl.max.vadd[10].OUT2)} {3300.}
(assert (= (+ (+ (* sc_71 0.0156) of_71) sltop_71) 3300.))
(declare-fun slbot_69 () Real)
(declare-fun sltop_69 () Real)
; 
; =  {(((sc.vadd[10].B*619.026085325)+of.vadd[10].B)+sl.min.vadd[10].B)} {0.}
(assert (= (+ (+ (* sc_69 619.026085325) of_69) slbot_69) 0.))
; 
; =  {(((sc.vadd[10].B*625.)+of.vadd[10].B)+sl.max.vadd[10].B)} {3300.}
(assert (= (+ (+ (* sc_69 625.) of_69) sltop_69) 3300.))
(declare-fun slbot_70 () Real)
(declare-fun sltop_70 () Real)
; 
; =  {(((sc.vadd[10].OUT*619.026085325)+of.vadd[10].OUT)+sl.min.vadd[10].OUT)} {-1650.}
(assert (= (+ (+ (* sc_70 619.026085325) of_70) slbot_70) -1650.))
; 
; =  {(((sc.vadd[10].OUT*625.)+of.vadd[10].OUT)+sl.max.vadd[10].OUT)} {1650.}
(assert (= (+ (+ (* sc_70 625.) of_70) sltop_70) 1650.))
(declare-fun slbot_71 () Real)
(declare-fun sltop_71 () Real)
; 
; =  {(((sc.vadd[10].OUT2*0.)+of.vadd[10].OUT2)+sl.min.vadd[10].OUT2)} {0.}
(assert (= (+ (+ (* sc_71 0.) of_71) slbot_71) 0.))
; 
; =  {(((sc.vadd[10].OUT2*0.0156)+of.vadd[10].OUT2)+sl.max.vadd[10].OUT2)} {3300.}
(assert (= (+ (+ (* sc_71 0.0156) of_71) sltop_71) 3300.))
(declare-fun sc_72 () Real)
(assert (> sc_72 1e-08))
(declare-fun of_72 () Real)
(declare-fun sc_73 () Real)
(assert (> sc_73 1e-08))
(declare-fun of_73 () Real)
(declare-fun sc_74 () Real)
(assert (> sc_74 1e-08))
(declare-fun of_74 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_73 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_72 0.))
; 
; =  {sc.vtoi[0].Y} {((1./sc.vtoi[0].K)*sc.vtoi[0].X)}
(assert (= sc_74 (* (/ 1. sc_73) sc_72)))
; 
; =  {of.vtoi[0].Y} {0.}
(assert (= of_74 0.))
(declare-fun slbot_72 () Real)
(declare-fun sltop_72 () Real)
; 
; =  {(((sc.vtoi[0].X*0.)+of.vtoi[0].X)+sl.min.vtoi[0].X)} {1.}
(assert (= (+ (+ (* sc_72 0.) of_72) slbot_72) 1.))
; 
; =  {(((sc.vtoi[0].X*0.15625)+of.vtoi[0].X)+sl.max.vtoi[0].X)} {3300.}
(assert (= (+ (+ (* sc_72 0.15625) of_72) sltop_72) 3300.))
(declare-fun slbot_74 () Real)
(declare-fun sltop_74 () Real)
; 
; =  {(((sc.vtoi[0].Y*-0.15625)+of.vtoi[0].Y)+sl.min.vtoi[0].Y)} {0.00030303030303}
(assert (= (+ (+ (* sc_74 -0.15625) of_74) slbot_74) 0.00030303030303))
; 
; =  {(((sc.vtoi[0].Y*0.)+of.vtoi[0].Y)+sl.max.vtoi[0].Y)} {3300.}
(assert (= (+ (+ (* sc_74 0.) of_74) sltop_74) 3300.))
; 
; >=  {((sc.vtoi[0].K*-1.)+of.vtoi[0].K)} {3300.}
(assert (<= (+ (* sc_73 -1.) of_73) 3300.))
; 
; <=  {((sc.vtoi[0].K*-1.)+of.vtoi[0].K)} {1.}
(assert (>= (+ (* sc_73 -1.) of_73) 1.))
(declare-fun sc_75 () Real)
(assert (> sc_75 1e-08))
(declare-fun of_75 () Real)
(declare-fun sc_76 () Real)
(assert (> sc_76 1e-08))
(declare-fun of_76 () Real)
(declare-fun sc_77 () Real)
(assert (> sc_77 1e-08))
(declare-fun of_77 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_76 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_75 0.))
; 
; =  {sc.vtoi[14].Y} {((1./sc.vtoi[14].K)*sc.vtoi[14].X)}
(assert (= sc_77 (* (/ 1. sc_76) sc_75)))
; 
; =  {of.vtoi[14].Y} {0.}
(assert (= of_77 0.))
; 
; >=  {((sc.vtoi[14].X*1.)+of.vtoi[14].X)} {3300.}
(assert (<= (+ (* sc_75 1.) of_75) 3300.))
; 
; <=  {((sc.vtoi[14].X*1.)+of.vtoi[14].X)} {1.}
(assert (>= (+ (* sc_75 1.) of_75) 1.))
(declare-fun slbot_77 () Real)
(declare-fun sltop_77 () Real)
; 
; =  {(((sc.vtoi[14].Y*0.)+of.vtoi[14].Y)+sl.min.vtoi[14].Y)} {0.00030303030303}
(assert (= (+ (+ (* sc_77 0.) of_77) slbot_77) 0.00030303030303))
; 
; =  {(((sc.vtoi[14].Y*1.66666666667)+of.vtoi[14].Y)+sl.max.vtoi[14].Y)} {3300.}
(assert (= (+ (+ (* sc_77 1.66666666667) of_77) sltop_77) 3300.))
(declare-fun slbot_76 () Real)
(declare-fun sltop_76 () Real)
; 
; =  {(((sc.vtoi[14].K*0.)+of.vtoi[14].K)+sl.min.vtoi[14].K)} {1.}
(assert (= (+ (+ (* sc_76 0.) of_76) slbot_76) 1.))
; 
; =  {(((sc.vtoi[14].K*0.6)+of.vtoi[14].K)+sl.max.vtoi[14].K)} {3300.}
(assert (= (+ (+ (* sc_76 0.6) of_76) sltop_76) 3300.))
(declare-fun sc_78 () Real)
(assert (> sc_78 1e-08))
(declare-fun of_78 () Real)
(declare-fun sc_79 () Real)
(assert (> sc_79 1e-08))
(declare-fun of_79 () Real)
(declare-fun sc_80 () Real)
(assert (> sc_80 1e-08))
(declare-fun of_80 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_79 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_78 0.))
; 
; =  {sc.vtoi[4].Y} {((1./sc.vtoi[4].K)*sc.vtoi[4].X)}
(assert (= sc_80 (* (/ 1. sc_79) sc_78)))
; 
; =  {of.vtoi[4].Y} {0.}
(assert (= of_80 0.))
; 
; >=  {((sc.vtoi[4].X*1.)+of.vtoi[4].X)} {3300.}
(assert (<= (+ (* sc_78 1.) of_78) 3300.))
; 
; <=  {((sc.vtoi[4].X*1.)+of.vtoi[4].X)} {1.}
(assert (>= (+ (* sc_78 1.) of_78) 1.))
(declare-fun slbot_80 () Real)
(declare-fun sltop_80 () Real)
; 
; =  {(((sc.vtoi[4].Y*0.)+of.vtoi[4].Y)+sl.min.vtoi[4].Y)} {0.00030303030303}
(assert (= (+ (+ (* sc_80 0.) of_80) slbot_80) 0.00030303030303))
; 
; =  {(((sc.vtoi[4].Y*0.00965050555471)+of.vtoi[4].Y)+sl.max.vtoi[4].Y)} {3300.}
(assert (= (+ (+ (* sc_80 0.00965050555471) of_80) sltop_80) 3300.))
(declare-fun slbot_79 () Real)
(declare-fun sltop_79 () Real)
; 
; =  {(((sc.vtoi[4].K*0.)+of.vtoi[4].K)+sl.min.vtoi[4].K)} {1.}
(assert (= (+ (+ (* sc_79 0.) of_79) slbot_79) 1.))
; 
; =  {(((sc.vtoi[4].K*103.621514368)+of.vtoi[4].K)+sl.max.vtoi[4].K)} {3300.}
(assert (= (+ (+ (* sc_79 103.621514368) of_79) sltop_79) 3300.))
(declare-fun slbot_80 () Real)
(declare-fun sltop_80 () Real)
; 
; =  {(((sc.vtoi[4].Y*0.)+of.vtoi[4].Y)+sl.min.vtoi[4].Y)} {0.00030303030303}
(assert (= (+ (+ (* sc_80 0.) of_80) slbot_80) 0.00030303030303))
; 
; =  {(((sc.vtoi[4].Y*0.00965050555471)+of.vtoi[4].Y)+sl.max.vtoi[4].Y)} {3300.}
(assert (= (+ (+ (* sc_80 0.00965050555471) of_80) sltop_80) 3300.))
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
; no offset
(assert (= of_82 0.))
; no offset
(assert (= of_81 0.))
; 
; =  {1.} {(sc.igenebind[13].K*sc.igenebind[13].TF)}
(assert (= 1. (* sc_82 sc_81)))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_83 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.igenebind[13].GE} {(sc.igenebind[13].Vmax*(1./1.))}
(assert (= sc_84 (* sc_83 (/ 1. 1.))))
; 
; =  {of.igenebind[13].GE} {0.}
(assert (= of_84 0.))
; 
; >=  {((sc.igenebind[13].TF*1.)+of.igenebind[13].TF)} {10.}
(assert (<= (+ (* sc_81 1.) of_81) 10.))
; 
; <=  {((sc.igenebind[13].TF*1.)+of.igenebind[13].TF)} {0.0001}
(assert (>= (+ (* sc_81 1.) of_81) 0.0001))
(declare-fun slbot_82 () Real)
(declare-fun sltop_82 () Real)
; 
; =  {(((sc.igenebind[13].K*0.)+of.igenebind[13].K)+sl.min.igenebind[13].K)} {0.0001}
(assert (= (+ (+ (* sc_82 0.) of_82) slbot_82) 0.0001))
; 
; =  {(((sc.igenebind[13].K*0.0156)+of.igenebind[13].K)+sl.max.igenebind[13].K)} {10.}
(assert (= (+ (+ (* sc_82 0.0156) of_82) sltop_82) 10.))
(declare-fun slbot_84 () Real)
(declare-fun sltop_84 () Real)
; 
; =  {(((sc.igenebind[13].GE*0.153603781016)+of.igenebind[13].GE)+sl.min.igenebind[13].GE)} {9.90099009901e-07}
(assert (= (+ (+ (* sc_84 0.153603781016) of_84) slbot_84) 9.90099009901e-07))
; 
; =  {(((sc.igenebind[13].GE*0.156)+of.igenebind[13].GE)+sl.max.igenebind[13].GE)} {9.9999999}
(assert (= (+ (+ (* sc_84 0.156) of_84) sltop_84) 9.9999999))
; 
; >=  {((sc.igenebind[13].Vmax*0.156)+of.igenebind[13].Vmax)} {10.}
(assert (<= (+ (* sc_83 0.156) of_83) 10.))
; 
; <=  {((sc.igenebind[13].Vmax*0.156)+of.igenebind[13].Vmax)} {0.0001}
(assert (>= (+ (* sc_83 0.156) of_83) 0.0001))
(declare-fun sc_85 () Real)
(assert (> sc_85 1e-08))
(declare-fun of_85 () Real)
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
(assert (= of_86 0.))
; no offset
(assert (= of_85 0.))
; 
; =  {1.} {(sc.igenebind[1].K*sc.igenebind[1].TF)}
(assert (= 1. (* sc_86 sc_85)))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_87 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.igenebind[1].GE} {(sc.igenebind[1].Vmax*(1./1.))}
(assert (= sc_88 (* sc_87 (/ 1. 1.))))
; 
; =  {of.igenebind[1].GE} {0.}
(assert (= of_88 0.))
(declare-fun slbot_85 () Real)
(declare-fun sltop_85 () Real)
; 
; =  {(((sc.igenebind[1].TF*0.)+of.igenebind[1].TF)+sl.min.igenebind[1].TF)} {0.0001}
(assert (= (+ (+ (* sc_85 0.) of_85) slbot_85) 0.0001))
; 
; =  {(((sc.igenebind[1].TF*0.00965050555471)+of.igenebind[1].TF)+sl.max.igenebind[1].TF)} {10.}
(assert (= (+ (+ (* sc_85 0.00965050555471) of_85) sltop_85) 10.))
; 
; >=  {((sc.igenebind[1].K*1.)+of.igenebind[1].K)} {10.}
(assert (<= (+ (* sc_86 1.) of_86) 10.))
; 
; <=  {((sc.igenebind[1].K*1.)+of.igenebind[1].K)} {0.0001}
(assert (>= (+ (* sc_86 1.) of_86) 0.0001))
(declare-fun slbot_88 () Real)
(declare-fun sltop_88 () Real)
; 
; =  {(((sc.igenebind[1].GE*1.54756521331)+of.igenebind[1].GE)+sl.min.igenebind[1].GE)} {9.90099009901e-07}
(assert (= (+ (+ (* sc_88 1.54756521331) of_88) slbot_88) 9.90099009901e-07))
; 
; =  {(((sc.igenebind[1].GE*1.5625)+of.igenebind[1].GE)+sl.max.igenebind[1].GE)} {9.9999999}
(assert (= (+ (+ (* sc_88 1.5625) of_88) sltop_88) 9.9999999))
; 
; >=  {((sc.igenebind[1].Vmax*1.5625)+of.igenebind[1].Vmax)} {10.}
(assert (<= (+ (* sc_87 1.5625) of_87) 10.))
; 
; <=  {((sc.igenebind[1].Vmax*1.5625)+of.igenebind[1].Vmax)} {0.0001}
(assert (>= (+ (* sc_87 1.5625) of_87) 0.0001))
(declare-fun slbot_88 () Real)
(declare-fun sltop_88 () Real)
; 
; =  {(((sc.igenebind[1].GE*1.54756521331)+of.igenebind[1].GE)+sl.min.igenebind[1].GE)} {9.90099009901e-07}
(assert (= (+ (+ (* sc_88 1.54756521331) of_88) slbot_88) 9.90099009901e-07))
; 
; =  {(((sc.igenebind[1].GE*1.5625)+of.igenebind[1].GE)+sl.max.igenebind[1].GE)} {9.9999999}
(assert (= (+ (+ (* sc_88 1.5625) of_88) sltop_88) 9.9999999))
(declare-fun sc_89 () Real)
(assert (> sc_89 1e-08))
(declare-fun of_89 () Real)
(declare-fun sc_90 () Real)
(assert (> sc_90 1e-08))
(declare-fun of_90 () Real)
; 
; =  {sc.input.V[2].O} {sc.input.V[2].X}
(assert (= sc_90 sc_89))
; 
; =  {of.input.V[2].O} {of.input.V[2].X}
(assert (= of_90 of_89))
; 
; >=  {((sc.input.V[2].X*1250.)+of.input.V[2].X)} {3300.}
(assert (<= (+ (* sc_89 1250.) of_89) 3300.))
; 
; <=  {((sc.input.V[2].X*1250.)+of.input.V[2].X)} {0.}
(assert (>= (+ (* sc_89 1250.) of_89) 0.))
; 
; >=  {((sc.input.V[2].O*1250.)+of.input.V[2].O)} {3300.}
(assert (<= (+ (* sc_90 1250.) of_90) 3300.))
; 
; <=  {((sc.input.V[2].O*1250.)+of.input.V[2].O)} {0.}
(assert (>= (+ (* sc_90 1250.) of_90) 0.))
(declare-fun sc_91 () Real)
(assert (> sc_91 1e-08))
(declare-fun of_91 () Real)
(declare-fun sc_92 () Real)
(assert (> sc_92 1e-08))
(declare-fun of_92 () Real)
; 
; =  {sc.input.V[8].O} {sc.input.V[8].X}
(assert (= sc_92 sc_91))
; 
; =  {of.input.V[8].O} {of.input.V[8].X}
(assert (= of_92 of_91))
; 
; >=  {((sc.input.V[8].X*0.)+of.input.V[8].X)} {3300.}
(assert (<= (+ (* sc_91 0.) of_91) 3300.))
; 
; <=  {((sc.input.V[8].X*0.)+of.input.V[8].X)} {0.}
(assert (>= (+ (* sc_91 0.) of_91) 0.))
; 
; >=  {((sc.input.V[8].O*0.)+of.input.V[8].O)} {3300.}
(assert (<= (+ (* sc_92 0.) of_92) 3300.))
; 
; <=  {((sc.input.V[8].O*0.)+of.input.V[8].O)} {0.}
(assert (>= (+ (* sc_92 0.) of_92) 0.))
(declare-fun sc_93 () Real)
(assert (> sc_93 1e-08))
(declare-fun of_93 () Real)
(declare-fun sc_94 () Real)
(assert (> sc_94 1e-08))
(declare-fun of_94 () Real)
; 
; =  {sc.input.V[7].O} {sc.input.V[7].X}
(assert (= sc_94 sc_93))
; 
; =  {of.input.V[7].O} {of.input.V[7].X}
(assert (= of_94 of_93))
; 
; >=  {((sc.input.V[7].X*400.)+of.input.V[7].X)} {3300.}
(assert (<= (+ (* sc_93 400.) of_93) 3300.))
; 
; <=  {((sc.input.V[7].X*400.)+of.input.V[7].X)} {0.}
(assert (>= (+ (* sc_93 400.) of_93) 0.))
; 
; >=  {((sc.input.V[7].O*400.)+of.input.V[7].O)} {3300.}
(assert (<= (+ (* sc_94 400.) of_94) 3300.))
; 
; <=  {((sc.input.V[7].O*400.)+of.input.V[7].O)} {0.}
(assert (>= (+ (* sc_94 400.) of_94) 0.))
(declare-fun sc_95 () Real)
(assert (> sc_95 1e-08))
(declare-fun of_95 () Real)
(declare-fun sc_96 () Real)
(assert (> sc_96 1e-08))
(declare-fun of_96 () Real)
; 
; =  {sc.input.V[13].O} {sc.input.V[13].X}
(assert (= sc_96 sc_95))
; 
; =  {of.input.V[13].O} {of.input.V[13].X}
(assert (= of_96 of_95))
; 
; >=  {((sc.input.V[13].X*1000.75)+of.input.V[13].X)} {3300.}
(assert (<= (+ (* sc_95 1000.75) of_95) 3300.))
; 
; <=  {((sc.input.V[13].X*1000.75)+of.input.V[13].X)} {0.}
(assert (>= (+ (* sc_95 1000.75) of_95) 0.))
; 
; >=  {((sc.input.V[13].O*1000.75)+of.input.V[13].O)} {3300.}
(assert (<= (+ (* sc_96 1000.75) of_96) 3300.))
; 
; <=  {((sc.input.V[13].O*1000.75)+of.input.V[13].O)} {0.}
(assert (>= (+ (* sc_96 1000.75) of_96) 0.))
(declare-fun sc_97 () Real)
(assert (> sc_97 1e-08))
(declare-fun of_97 () Real)
(declare-fun sc_98 () Real)
(assert (> sc_98 1e-08))
(declare-fun of_98 () Real)
; 
; =  {sc.input.V[12].O} {sc.input.V[12].X}
(assert (= sc_98 sc_97))
; 
; =  {of.input.V[12].O} {of.input.V[12].X}
(assert (= of_98 of_97))
; 
; >=  {((sc.input.V[12].X*4.)+of.input.V[12].X)} {3300.}
(assert (<= (+ (* sc_97 4.) of_97) 3300.))
; 
; <=  {((sc.input.V[12].X*4.)+of.input.V[12].X)} {0.}
(assert (>= (+ (* sc_97 4.) of_97) 0.))
; 
; >=  {((sc.input.V[12].O*4.)+of.input.V[12].O)} {3300.}
(assert (<= (+ (* sc_98 4.) of_98) 3300.))
; 
; <=  {((sc.input.V[12].O*4.)+of.input.V[12].O)} {0.}
(assert (>= (+ (* sc_98 4.) of_98) 0.))
(declare-fun sc_99 () Real)
(assert (> sc_99 1e-08))
(declare-fun of_99 () Real)
(declare-fun sc_100 () Real)
(assert (> sc_100 1e-08))
(declare-fun of_100 () Real)
; 
; =  {sc.input.V[9].O} {sc.input.V[9].X}
(assert (= sc_100 sc_99))
; 
; =  {of.input.V[9].O} {of.input.V[9].X}
(assert (= of_100 of_99))
; 
; >=  {((sc.input.V[9].X*0.)+of.input.V[9].X)} {3300.}
(assert (<= (+ (* sc_99 0.) of_99) 3300.))
; 
; <=  {((sc.input.V[9].X*0.)+of.input.V[9].X)} {0.}
(assert (>= (+ (* sc_99 0.) of_99) 0.))
; 
; >=  {((sc.input.V[9].O*0.)+of.input.V[9].O)} {3300.}
(assert (<= (+ (* sc_100 0.) of_100) 3300.))
; 
; <=  {((sc.input.V[9].O*0.)+of.input.V[9].O)} {0.}
(assert (>= (+ (* sc_100 0.) of_100) 0.))
(declare-fun sc_101 () Real)
(assert (> sc_101 1e-08))
(declare-fun of_101 () Real)
(declare-fun sc_102 () Real)
(assert (> sc_102 1e-08))
(declare-fun of_102 () Real)
; 
; =  {sc.input.V[0].O} {sc.input.V[0].X}
(assert (= sc_102 sc_101))
; 
; =  {of.input.V[0].O} {of.input.V[0].X}
(assert (= of_102 of_101))
(declare-fun slbot_101 () Real)
(declare-fun sltop_101 () Real)
; 
; =  {(((sc.input.V[0].X*0.)+of.input.V[0].X)+sl.min.input.V[0].X)} {0.}
(assert (= (+ (+ (* sc_101 0.) of_101) slbot_101) 0.))
; 
; =  {(((sc.input.V[0].X*0.6)+of.input.V[0].X)+sl.max.input.V[0].X)} {3300.}
(assert (= (+ (+ (* sc_101 0.6) of_101) sltop_101) 3300.))
(declare-fun slbot_102 () Real)
(declare-fun sltop_102 () Real)
; 
; =  {(((sc.input.V[0].O*0.)+of.input.V[0].O)+sl.min.input.V[0].O)} {0.}
(assert (= (+ (+ (* sc_102 0.) of_102) slbot_102) 0.))
; 
; =  {(((sc.input.V[0].O*0.6)+of.input.V[0].O)+sl.max.input.V[0].O)} {3300.}
(assert (= (+ (+ (* sc_102 0.6) of_102) sltop_102) 3300.))
(declare-fun sc_103 () Real)
(assert (> sc_103 1e-08))
(declare-fun of_103 () Real)
(declare-fun sc_104 () Real)
(assert (> sc_104 1e-08))
(declare-fun of_104 () Real)
; 
; =  {sc.input.V[11].O} {sc.input.V[11].X}
(assert (= sc_104 sc_103))
; 
; =  {of.input.V[11].O} {of.input.V[11].X}
(assert (= of_104 of_103))
; 
; >=  {((sc.input.V[11].X*4.)+of.input.V[11].X)} {3300.}
(assert (<= (+ (* sc_103 4.) of_103) 3300.))
; 
; <=  {((sc.input.V[11].X*4.)+of.input.V[11].X)} {0.}
(assert (>= (+ (* sc_103 4.) of_103) 0.))
; 
; >=  {((sc.input.V[11].O*4.)+of.input.V[11].O)} {3300.}
(assert (<= (+ (* sc_104 4.) of_104) 3300.))
; 
; <=  {((sc.input.V[11].O*4.)+of.input.V[11].O)} {0.}
(assert (>= (+ (* sc_104 4.) of_104) 0.))
(declare-fun sc_105 () Real)
(assert (> sc_105 1e-08))
(declare-fun of_105 () Real)
(declare-fun sc_106 () Real)
(assert (> sc_106 1e-08))
(declare-fun of_106 () Real)
; 
; =  {sc.input.V[10].O} {sc.input.V[10].X}
(assert (= sc_106 sc_105))
; 
; =  {of.input.V[10].O} {of.input.V[10].X}
(assert (= of_106 of_105))
; 
; >=  {((sc.input.V[10].X*-1.)+of.input.V[10].X)} {3300.}
(assert (<= (+ (* sc_105 -1.) of_105) 3300.))
; 
; <=  {((sc.input.V[10].X*-1.)+of.input.V[10].X)} {0.}
(assert (>= (+ (* sc_105 -1.) of_105) 0.))
; 
; >=  {((sc.input.V[10].O*-1.)+of.input.V[10].O)} {3300.}
(assert (<= (+ (* sc_106 -1.) of_106) 3300.))
; 
; <=  {((sc.input.V[10].O*-1.)+of.input.V[10].O)} {0.}
(assert (>= (+ (* sc_106 -1.) of_106) 0.))
(declare-fun sc_107 () Real)
(assert (> sc_107 1e-08))
(declare-fun of_107 () Real)
(declare-fun sc_108 () Real)
(assert (> sc_108 1e-08))
(declare-fun of_108 () Real)
; 
; =  {sc.input.V[15].O} {sc.input.V[15].X}
(assert (= sc_108 sc_107))
; 
; =  {of.input.V[15].O} {of.input.V[15].X}
(assert (= of_108 of_107))
; 
; >=  {((sc.input.V[15].X*1.)+of.input.V[15].X)} {3300.}
(assert (<= (+ (* sc_107 1.) of_107) 3300.))
; 
; <=  {((sc.input.V[15].X*1.)+of.input.V[15].X)} {0.}
(assert (>= (+ (* sc_107 1.) of_107) 0.))
; 
; >=  {((sc.input.V[15].O*1.)+of.input.V[15].O)} {3300.}
(assert (<= (+ (* sc_108 1.) of_108) 3300.))
; 
; <=  {((sc.input.V[15].O*1.)+of.input.V[15].O)} {0.}
(assert (>= (+ (* sc_108 1.) of_108) 0.))
(declare-fun sc_109 () Real)
(assert (> sc_109 1e-08))
(declare-fun of_109 () Real)
(declare-fun sc_110 () Real)
(assert (> sc_110 1e-08))
(declare-fun of_110 () Real)
; 
; =  {sc.input.V[6].O} {sc.input.V[6].X}
(assert (= sc_110 sc_109))
; 
; =  {of.input.V[6].O} {of.input.V[6].X}
(assert (= of_110 of_109))
; 
; >=  {((sc.input.V[6].X*0.)+of.input.V[6].X)} {3300.}
(assert (<= (+ (* sc_109 0.) of_109) 3300.))
; 
; <=  {((sc.input.V[6].X*0.)+of.input.V[6].X)} {0.}
(assert (>= (+ (* sc_109 0.) of_109) 0.))
; 
; >=  {((sc.input.V[6].O*0.)+of.input.V[6].O)} {3300.}
(assert (<= (+ (* sc_110 0.) of_110) 3300.))
; 
; <=  {((sc.input.V[6].O*0.)+of.input.V[6].O)} {0.}
(assert (>= (+ (* sc_110 0.) of_110) 0.))
(declare-fun sc_111 () Real)
(assert (> sc_111 1e-08))
(declare-fun of_111 () Real)
(declare-fun sc_112 () Real)
(assert (> sc_112 1e-08))
(declare-fun of_112 () Real)
; 
; =  {sc.input.V[14].O} {sc.input.V[14].X}
(assert (= sc_112 sc_111))
; 
; =  {of.input.V[14].O} {of.input.V[14].X}
(assert (= of_112 of_111))
; 
; >=  {((sc.input.V[14].X*1.)+of.input.V[14].X)} {3300.}
(assert (<= (+ (* sc_111 1.) of_111) 3300.))
; 
; <=  {((sc.input.V[14].X*1.)+of.input.V[14].X)} {0.}
(assert (>= (+ (* sc_111 1.) of_111) 0.))
; 
; >=  {((sc.input.V[14].O*1.)+of.input.V[14].O)} {3300.}
(assert (<= (+ (* sc_112 1.) of_112) 3300.))
; 
; <=  {((sc.input.V[14].O*1.)+of.input.V[14].O)} {0.}
(assert (>= (+ (* sc_112 1.) of_112) 0.))
(declare-fun sc_113 () Real)
(assert (> sc_113 1e-08))
(declare-fun of_113 () Real)
(declare-fun sc_114 () Real)
(assert (> sc_114 1e-08))
(declare-fun of_114 () Real)
; 
; =  {sc.input.V[16].O} {sc.input.V[16].X}
(assert (= sc_114 sc_113))
; 
; =  {of.input.V[16].O} {of.input.V[16].X}
(assert (= of_114 of_113))
; 
; >=  {((sc.input.V[16].X*1.)+of.input.V[16].X)} {3300.}
(assert (<= (+ (* sc_113 1.) of_113) 3300.))
; 
; <=  {((sc.input.V[16].X*1.)+of.input.V[16].X)} {0.}
(assert (>= (+ (* sc_113 1.) of_113) 0.))
; 
; >=  {((sc.input.V[16].O*1.)+of.input.V[16].O)} {3300.}
(assert (<= (+ (* sc_114 1.) of_114) 3300.))
; 
; <=  {((sc.input.V[16].O*1.)+of.input.V[16].O)} {0.}
(assert (>= (+ (* sc_114 1.) of_114) 0.))
(declare-fun sc_115 () Real)
(assert (> sc_115 1e-08))
(declare-fun of_115 () Real)
(declare-fun sc_116 () Real)
(assert (> sc_116 1e-08))
(declare-fun of_116 () Real)
; 
; =  {sc.input.V[3].O} {sc.input.V[3].X}
(assert (= sc_116 sc_115))
; 
; =  {of.input.V[3].O} {of.input.V[3].X}
(assert (= of_116 of_115))
; 
; >=  {((sc.input.V[3].X*0.)+of.input.V[3].X)} {3300.}
(assert (<= (+ (* sc_115 0.) of_115) 3300.))
; 
; <=  {((sc.input.V[3].X*0.)+of.input.V[3].X)} {0.}
(assert (>= (+ (* sc_115 0.) of_115) 0.))
; 
; >=  {((sc.input.V[3].O*0.)+of.input.V[3].O)} {3300.}
(assert (<= (+ (* sc_116 0.) of_116) 3300.))
; 
; <=  {((sc.input.V[3].O*0.)+of.input.V[3].O)} {0.}
(assert (>= (+ (* sc_116 0.) of_116) 0.))
(declare-fun sc_117 () Real)
(assert (> sc_117 1e-08))
(declare-fun of_117 () Real)
(declare-fun sc_118 () Real)
(assert (> sc_118 1e-08))
(declare-fun of_118 () Real)
; 
; =  {sc.input.V[4].O} {sc.input.V[4].X}
(assert (= sc_118 sc_117))
; 
; =  {of.input.V[4].O} {of.input.V[4].X}
(assert (= of_118 of_117))
; 
; >=  {((sc.input.V[4].X*0.)+of.input.V[4].X)} {3300.}
(assert (<= (+ (* sc_117 0.) of_117) 3300.))
; 
; <=  {((sc.input.V[4].X*0.)+of.input.V[4].X)} {0.}
(assert (>= (+ (* sc_117 0.) of_117) 0.))
; 
; >=  {((sc.input.V[4].O*0.)+of.input.V[4].O)} {3300.}
(assert (<= (+ (* sc_118 0.) of_118) 3300.))
; 
; <=  {((sc.input.V[4].O*0.)+of.input.V[4].O)} {0.}
(assert (>= (+ (* sc_118 0.) of_118) 0.))
(declare-fun sc_119 () Real)
(assert (> sc_119 1e-08))
(declare-fun of_119 () Real)
(declare-fun sc_120 () Real)
(assert (> sc_120 1e-08))
(declare-fun of_120 () Real)
; 
; =  {sc.input.V[5].O} {sc.input.V[5].X}
(assert (= sc_120 sc_119))
; 
; =  {of.input.V[5].O} {of.input.V[5].X}
(assert (= of_120 of_119))
; 
; >=  {((sc.input.V[5].X*0.)+of.input.V[5].X)} {3300.}
(assert (<= (+ (* sc_119 0.) of_119) 3300.))
; 
; <=  {((sc.input.V[5].X*0.)+of.input.V[5].X)} {0.}
(assert (>= (+ (* sc_119 0.) of_119) 0.))
; 
; >=  {((sc.input.V[5].O*0.)+of.input.V[5].O)} {3300.}
(assert (<= (+ (* sc_120 0.) of_120) 3300.))
; 
; <=  {((sc.input.V[5].O*0.)+of.input.V[5].O)} {0.}
(assert (>= (+ (* sc_120 0.) of_120) 0.))
(declare-fun sc_121 () Real)
(assert (> sc_121 1e-08))
(declare-fun of_121 () Real)
(declare-fun sc_122 () Real)
(assert (> sc_122 1e-08))
(declare-fun of_122 () Real)
; 
; =  {sc.input.V[1].O} {sc.input.V[1].X}
(assert (= sc_122 sc_121))
; 
; =  {of.input.V[1].O} {of.input.V[1].X}
(assert (= of_122 of_121))
; 
; >=  {((sc.input.V[1].X*2.)+of.input.V[1].X)} {3300.}
(assert (<= (+ (* sc_121 2.) of_121) 3300.))
; 
; <=  {((sc.input.V[1].X*2.)+of.input.V[1].X)} {0.}
(assert (>= (+ (* sc_121 2.) of_121) 0.))
; 
; >=  {((sc.input.V[1].O*2.)+of.input.V[1].O)} {3300.}
(assert (<= (+ (* sc_122 2.) of_122) 3300.))
; 
; <=  {((sc.input.V[1].O*2.)+of.input.V[1].O)} {0.}
(assert (>= (+ (* sc_122 2.) of_122) 0.))
(declare-fun sc_123 () Real)
(assert (> sc_123 1e-08))
(declare-fun of_123 () Real)
(declare-fun sc_124 () Real)
(assert (> sc_124 1e-08))
(declare-fun of_124 () Real)
; 
; =  {sc.input.V[17].O} {sc.input.V[17].X}
(assert (= sc_124 sc_123))
; 
; =  {of.input.V[17].O} {of.input.V[17].X}
(assert (= of_124 of_123))
; 
; >=  {((sc.input.V[17].X*1.)+of.input.V[17].X)} {3300.}
(assert (<= (+ (* sc_123 1.) of_123) 3300.))
; 
; <=  {((sc.input.V[17].X*1.)+of.input.V[17].X)} {0.}
(assert (>= (+ (* sc_123 1.) of_123) 0.))
; 
; >=  {((sc.input.V[17].O*1.)+of.input.V[17].O)} {3300.}
(assert (<= (+ (* sc_124 1.) of_124) 3300.))
; 
; <=  {((sc.input.V[17].O*1.)+of.input.V[17].O)} {0.}
(assert (>= (+ (* sc_124 1.) of_124) 0.))
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
; =  {sc.itov[9].Y} {(sc.itov[9].K*sc.itov[9].X)}
(assert (= sc_127 (* sc_126 sc_125)))
; 
; =  {of.itov[9].Y} {0.}
(assert (= of_127 0.))
(declare-fun slbot_125 () Real)
(declare-fun sltop_125 () Real)
; 
; =  {(((sc.itov[9].X*1.54756521331)+of.itov[9].X)+sl.min.itov[9].X)} {0.0001}
(assert (= (+ (+ (* sc_125 1.54756521331) of_125) slbot_125) 0.0001))
; 
; =  {(((sc.itov[9].X*1.5625)+of.itov[9].X)+sl.max.itov[9].X)} {10.}
(assert (= (+ (+ (* sc_125 1.5625) of_125) sltop_125) 10.))
(declare-fun slbot_127 () Real)
(declare-fun sltop_127 () Real)
; 
; =  {(((sc.itov[9].Y*619.026085325)+of.itov[9].Y)+sl.min.itov[9].Y)} {0.0001}
(assert (= (+ (+ (* sc_127 619.026085325) of_127) slbot_127) 0.0001))
; 
; =  {(((sc.itov[9].Y*625.)+of.itov[9].Y)+sl.max.itov[9].Y)} {3300.}
(assert (= (+ (+ (* sc_127 625.) of_127) sltop_127) 3300.))
; 
; >=  {((sc.itov[9].K*400.)+of.itov[9].K)} {330.}
(assert (<= (+ (* sc_126 400.) of_126) 330.))
; 
; <=  {((sc.itov[9].K*400.)+of.itov[9].K)} {1.}
(assert (>= (+ (* sc_126 400.) of_126) 1.))
(declare-fun slbot_127 () Real)
(declare-fun sltop_127 () Real)
; 
; =  {(((sc.itov[9].Y*619.026085325)+of.itov[9].Y)+sl.min.itov[9].Y)} {0.0001}
(assert (= (+ (+ (* sc_127 619.026085325) of_127) slbot_127) 0.0001))
; 
; =  {(((sc.itov[9].Y*625.)+of.itov[9].Y)+sl.max.itov[9].Y)} {3300.}
(assert (= (+ (+ (* sc_127 625.) of_127) sltop_127) 3300.))
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
; 
; >=  {((sc.itov[11].X*400.)+of.itov[11].X)} {10.}
(assert (<= (+ (* sc_128 400.) of_128) 10.))
; 
; <=  {((sc.itov[11].X*400.)+of.itov[11].X)} {0.0001}
(assert (>= (+ (* sc_128 400.) of_128) 0.0001))
(declare-fun slbot_130 () Real)
(declare-fun sltop_130 () Real)
; 
; =  {(((sc.itov[11].Y*61.4415124065)+of.itov[11].Y)+sl.min.itov[11].Y)} {0.0001}
(assert (= (+ (+ (* sc_130 61.4415124065) of_130) slbot_130) 0.0001))
; 
; =  {(((sc.itov[11].Y*62.4)+of.itov[11].Y)+sl.max.itov[11].Y)} {3300.}
(assert (= (+ (+ (* sc_130 62.4) of_130) sltop_130) 3300.))
(declare-fun slbot_129 () Real)
(declare-fun sltop_129 () Real)
; 
; =  {(((sc.itov[11].K*0.153603781016)+of.itov[11].K)+sl.min.itov[11].K)} {1.}
(assert (= (+ (+ (* sc_129 0.153603781016) of_129) slbot_129) 1.))
; 
; =  {(((sc.itov[11].K*0.156)+of.itov[11].K)+sl.max.itov[11].K)} {330.}
(assert (= (+ (+ (* sc_129 0.156) of_129) sltop_129) 330.))
(declare-fun slbot_130 () Real)
(declare-fun sltop_130 () Real)
; 
; =  {(((sc.itov[11].Y*61.4415124065)+of.itov[11].Y)+sl.min.itov[11].Y)} {0.0001}
(assert (= (+ (+ (* sc_130 61.4415124065) of_130) slbot_130) 0.0001))
; 
; =  {(((sc.itov[11].Y*62.4)+of.itov[11].Y)+sl.max.itov[11].Y)} {3300.}
(assert (= (+ (+ (* sc_130 62.4) of_130) sltop_130) 3300.))
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
; =  {sc.itov[6].Y} {(sc.itov[6].K*sc.itov[6].X)}
(assert (= sc_133 (* sc_132 sc_131)))
; 
; =  {of.itov[6].Y} {0.}
(assert (= of_133 0.))
(declare-fun slbot_131 () Real)
(declare-fun sltop_131 () Real)
; 
; =  {(((sc.itov[6].X*0.)+of.itov[6].X)+sl.min.itov[6].X)} {0.0001}
(assert (= (+ (+ (* sc_131 0.) of_131) slbot_131) 0.0001))
; 
; =  {(((sc.itov[6].X*103.621514368)+of.itov[6].X)+sl.max.itov[6].X)} {10.}
(assert (= (+ (+ (* sc_131 103.621514368) of_131) sltop_131) 10.))
(declare-fun slbot_133 () Real)
(declare-fun sltop_133 () Real)
; 
; =  {(((sc.itov[6].Y*0.)+of.itov[6].Y)+sl.min.itov[6].Y)} {0.0001}
(assert (= (+ (+ (* sc_133 0.) of_133) slbot_133) 0.0001))
; 
; =  {(((sc.itov[6].Y*103.621514368)+of.itov[6].Y)+sl.max.itov[6].Y)} {3300.}
(assert (= (+ (+ (* sc_133 103.621514368) of_133) sltop_133) 3300.))
; 
; >=  {((sc.itov[6].K*1.)+of.itov[6].K)} {330.}
(assert (<= (+ (* sc_132 1.) of_132) 330.))
; 
; <=  {((sc.itov[6].K*1.)+of.itov[6].K)} {1.}
(assert (>= (+ (* sc_132 1.) of_132) 1.))
(declare-fun slbot_133 () Real)
(declare-fun sltop_133 () Real)
; 
; =  {(((sc.itov[6].Y*0.)+of.itov[6].Y)+sl.min.itov[6].Y)} {0.0001}
(assert (= (+ (+ (* sc_133 0.) of_133) slbot_133) 0.0001))
; 
; =  {(((sc.itov[6].Y*103.621514368)+of.itov[6].Y)+sl.max.itov[6].Y)} {3300.}
(assert (= (+ (+ (* sc_133 103.621514368) of_133) sltop_133) 3300.))
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
; =  {sc.iadd[2].A} {sc.iadd[2].B}
(assert (= sc_136 sc_137))
; 
; =  {sc.iadd[2].A} {sc.iadd[2].C} {sc.iadd[2].D}
(assert (and (= sc_136 sc_135) (= sc_136 sc_134)))
; 
; =  {sc.iadd[2].OUT} {sc.iadd[2].A}
(assert (= sc_138 sc_136))
; 
; =  {of.iadd[2].OUT} {((of.iadd[2].A+of.iadd[2].B)-of.iadd[2].C-of.iadd[2].D)}
(assert (= of_138 (- (+ of_136 of_137) (+ of_135 of_134))))
; 
; >=  {((sc.iadd[2].D*0.)+of.iadd[2].D)} {5.}
(assert (<= (+ (* sc_134 0.) of_134) 5.))
; 
; <=  {((sc.iadd[2].D*0.)+of.iadd[2].D)} {0.}
(assert (>= (+ (* sc_134 0.) of_134) 0.))
; 
; >=  {((sc.iadd[2].C*0.)+of.iadd[2].C)} {5.}
(assert (<= (+ (* sc_135 0.) of_135) 5.))
; 
; <=  {((sc.iadd[2].C*0.)+of.iadd[2].C)} {0.}
(assert (>= (+ (* sc_135 0.) of_135) 0.))
(declare-fun slbot_138 () Real)
(declare-fun sltop_138 () Real)
; 
; =  {(((sc.iadd[2].OUT*0.)+of.iadd[2].OUT)+sl.min.iadd[2].OUT)} {-10.}
(assert (= (+ (+ (* sc_138 0.) of_138) slbot_138) -10.))
; 
; =  {(((sc.iadd[2].OUT*0.00965050555471)+of.iadd[2].OUT)+sl.max.iadd[2].OUT)} {10.}
(assert (= (+ (+ (* sc_138 0.00965050555471) of_138) sltop_138) 10.))
; 
; >=  {((sc.iadd[2].A*0.)+of.iadd[2].A)} {5.}
(assert (<= (+ (* sc_136 0.) of_136) 5.))
; 
; <=  {((sc.iadd[2].A*0.)+of.iadd[2].A)} {0.}
(assert (>= (+ (* sc_136 0.) of_136) 0.))
(declare-fun slbot_137 () Real)
(declare-fun sltop_137 () Real)
; 
; =  {(((sc.iadd[2].B*0.)+of.iadd[2].B)+sl.min.iadd[2].B)} {0.}
(assert (= (+ (+ (* sc_137 0.) of_137) slbot_137) 0.))
; 
; =  {(((sc.iadd[2].B*0.00965050555471)+of.iadd[2].B)+sl.max.iadd[2].B)} {5.}
(assert (= (+ (+ (* sc_137 0.00965050555471) of_137) sltop_137) 5.))
(declare-fun slbot_138 () Real)
(declare-fun sltop_138 () Real)
; 
; =  {(((sc.iadd[2].OUT*0.)+of.iadd[2].OUT)+sl.min.iadd[2].OUT)} {-10.}
(assert (= (+ (+ (* sc_138 0.) of_138) slbot_138) -10.))
; 
; =  {(((sc.iadd[2].OUT*0.00965050555471)+of.iadd[2].OUT)+sl.max.iadd[2].OUT)} {10.}
(assert (= (+ (+ (* sc_138 0.00965050555471) of_138) sltop_138) 10.))
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
; =  {sc.iadd[8].A} {sc.iadd[8].B}
(assert (= sc_141 sc_142))
; 
; =  {sc.iadd[8].A} {sc.iadd[8].C} {sc.iadd[8].D}
(assert (and (= sc_141 sc_140) (= sc_141 sc_139)))
; 
; =  {sc.iadd[8].OUT} {sc.iadd[8].A}
(assert (= sc_143 sc_141))
; 
; =  {of.iadd[8].OUT} {((of.iadd[8].A+of.iadd[8].B)-of.iadd[8].C-of.iadd[8].D)}
(assert (= of_143 (- (+ of_141 of_142) (+ of_140 of_139))))
(declare-fun slbot_139 () Real)
(declare-fun sltop_139 () Real)
; 
; =  {(((sc.iadd[8].D*-0.15625)+of.iadd[8].D)+sl.min.iadd[8].D)} {0.}
(assert (= (+ (+ (* sc_139 -0.15625) of_139) slbot_139) 0.))
; 
; =  {(((sc.iadd[8].D*0.)+of.iadd[8].D)+sl.max.iadd[8].D)} {5.}
(assert (= (+ (+ (* sc_139 0.) of_139) sltop_139) 5.))
; 
; >=  {((sc.iadd[8].C*1.)+of.iadd[8].C)} {5.}
(assert (<= (+ (* sc_140 1.) of_140) 5.))
; 
; <=  {((sc.iadd[8].C*1.)+of.iadd[8].C)} {0.}
(assert (>= (+ (* sc_140 1.) of_140) 0.))
(declare-fun slbot_143 () Real)
(declare-fun sltop_143 () Real)
; 
; =  {(((sc.iadd[8].OUT*-1.)+of.iadd[8].OUT)+sl.min.iadd[8].OUT)} {-10.}
(assert (= (+ (+ (* sc_143 -1.) of_143) slbot_143) -10.))
; 
; =  {(((sc.iadd[8].OUT*-0.84375)+of.iadd[8].OUT)+sl.max.iadd[8].OUT)} {10.}
(assert (= (+ (+ (* sc_143 -0.84375) of_143) sltop_143) 10.))
; 
; >=  {((sc.iadd[8].A*0.)+of.iadd[8].A)} {5.}
(assert (<= (+ (* sc_141 0.) of_141) 5.))
; 
; <=  {((sc.iadd[8].A*0.)+of.iadd[8].A)} {0.}
(assert (>= (+ (* sc_141 0.) of_141) 0.))
; 
; >=  {((sc.iadd[8].B*0.)+of.iadd[8].B)} {5.}
(assert (<= (+ (* sc_142 0.) of_142) 5.))
; 
; <=  {((sc.iadd[8].B*0.)+of.iadd[8].B)} {0.}
(assert (>= (+ (* sc_142 0.) of_142) 0.))
(declare-fun slbot_143 () Real)
(declare-fun sltop_143 () Real)
; 
; =  {(((sc.iadd[8].OUT*-1.)+of.iadd[8].OUT)+sl.min.iadd[8].OUT)} {-10.}
(assert (= (+ (+ (* sc_143 -1.) of_143) slbot_143) -10.))
; 
; =  {(((sc.iadd[8].OUT*-0.84375)+of.iadd[8].OUT)+sl.max.iadd[8].OUT)} {10.}
(assert (= (+ (+ (* sc_143 -0.84375) of_143) sltop_143) 10.))
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
; =  {sc.iadd[9].A} {sc.iadd[9].B}
(assert (= sc_146 sc_147))
; 
; =  {sc.iadd[9].A} {sc.iadd[9].C} {sc.iadd[9].D}
(assert (and (= sc_146 sc_145) (= sc_146 sc_144)))
; 
; =  {sc.iadd[9].OUT} {sc.iadd[9].A}
(assert (= sc_148 sc_146))
; 
; =  {of.iadd[9].OUT} {((of.iadd[9].A+of.iadd[9].B)-of.iadd[9].C-of.iadd[9].D)}
(assert (= of_148 (- (+ of_146 of_147) (+ of_145 of_144))))
; 
; >=  {((sc.iadd[9].D*0.)+of.iadd[9].D)} {5.}
(assert (<= (+ (* sc_144 0.) of_144) 5.))
; 
; <=  {((sc.iadd[9].D*0.)+of.iadd[9].D)} {0.}
(assert (>= (+ (* sc_144 0.) of_144) 0.))
; 
; >=  {((sc.iadd[9].C*0.)+of.iadd[9].C)} {5.}
(assert (<= (+ (* sc_145 0.) of_145) 5.))
; 
; <=  {((sc.iadd[9].C*0.)+of.iadd[9].C)} {0.}
(assert (>= (+ (* sc_145 0.) of_145) 0.))
(declare-fun slbot_146 () Real)
(declare-fun sltop_146 () Real)
; 
; =  {(((sc.iadd[9].A*0.)+of.iadd[9].A)+sl.min.iadd[9].A)} {0.}
(assert (= (+ (+ (* sc_146 0.) of_146) slbot_146) 0.))
; 
; =  {(((sc.iadd[9].A*0.0156)+of.iadd[9].A)+sl.max.iadd[9].A)} {5.}
(assert (= (+ (+ (* sc_146 0.0156) of_146) sltop_146) 5.))
; 
; >=  {((sc.iadd[9].B*0.)+of.iadd[9].B)} {5.}
(assert (<= (+ (* sc_147 0.) of_147) 5.))
; 
; <=  {((sc.iadd[9].B*0.)+of.iadd[9].B)} {0.}
(assert (>= (+ (* sc_147 0.) of_147) 0.))
(declare-fun slbot_148 () Real)
(declare-fun sltop_148 () Real)
; 
; =  {(((sc.iadd[9].OUT*0.)+of.iadd[9].OUT)+sl.min.iadd[9].OUT)} {-10.}
(assert (= (+ (+ (* sc_148 0.) of_148) slbot_148) -10.))
; 
; =  {(((sc.iadd[9].OUT*0.0156)+of.iadd[9].OUT)+sl.max.iadd[9].OUT)} {10.}
(assert (= (+ (+ (* sc_148 0.0156) of_148) sltop_148) 10.))
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
; =  {sc.iadd[3].A} {sc.iadd[3].B}
(assert (= sc_151 sc_152))
; 
; =  {sc.iadd[3].A} {sc.iadd[3].C} {sc.iadd[3].D}
(assert (and (= sc_151 sc_150) (= sc_151 sc_149)))
; 
; =  {sc.iadd[3].OUT} {sc.iadd[3].A}
(assert (= sc_153 sc_151))
; 
; =  {of.iadd[3].OUT} {((of.iadd[3].A+of.iadd[3].B)-of.iadd[3].C-of.iadd[3].D)}
(assert (= of_153 (- (+ of_151 of_152) (+ of_150 of_149))))
; 
; >=  {((sc.iadd[3].D*0.)+of.iadd[3].D)} {5.}
(assert (<= (+ (* sc_149 0.) of_149) 5.))
; 
; <=  {((sc.iadd[3].D*0.)+of.iadd[3].D)} {0.}
(assert (>= (+ (* sc_149 0.) of_149) 0.))
; 
; >=  {((sc.iadd[3].C*0.)+of.iadd[3].C)} {5.}
(assert (<= (+ (* sc_150 0.) of_150) 5.))
; 
; <=  {((sc.iadd[3].C*0.)+of.iadd[3].C)} {0.}
(assert (>= (+ (* sc_150 0.) of_150) 0.))
(declare-fun slbot_153 () Real)
(declare-fun sltop_153 () Real)
; 
; =  {(((sc.iadd[3].OUT*0.)+of.iadd[3].OUT)+sl.min.iadd[3].OUT)} {-10.}
(assert (= (+ (+ (* sc_153 0.) of_153) slbot_153) -10.))
; 
; =  {(((sc.iadd[3].OUT*0.00965050555471)+of.iadd[3].OUT)+sl.max.iadd[3].OUT)} {10.}
(assert (= (+ (+ (* sc_153 0.00965050555471) of_153) sltop_153) 10.))
; 
; >=  {((sc.iadd[3].A*0.)+of.iadd[3].A)} {5.}
(assert (<= (+ (* sc_151 0.) of_151) 5.))
; 
; <=  {((sc.iadd[3].A*0.)+of.iadd[3].A)} {0.}
(assert (>= (+ (* sc_151 0.) of_151) 0.))
(declare-fun slbot_152 () Real)
(declare-fun sltop_152 () Real)
; 
; =  {(((sc.iadd[3].B*0.)+of.iadd[3].B)+sl.min.iadd[3].B)} {0.}
(assert (= (+ (+ (* sc_152 0.) of_152) slbot_152) 0.))
; 
; =  {(((sc.iadd[3].B*0.00965050555471)+of.iadd[3].B)+sl.max.iadd[3].B)} {5.}
(assert (= (+ (+ (* sc_152 0.00965050555471) of_152) sltop_152) 5.))
(declare-fun slbot_153 () Real)
(declare-fun sltop_153 () Real)
; 
; =  {(((sc.iadd[3].OUT*0.)+of.iadd[3].OUT)+sl.min.iadd[3].OUT)} {-10.}
(assert (= (+ (+ (* sc_153 0.) of_153) slbot_153) -10.))
; 
; =  {(((sc.iadd[3].OUT*0.00965050555471)+of.iadd[3].OUT)+sl.max.iadd[3].OUT)} {10.}
(assert (= (+ (+ (* sc_153 0.00965050555471) of_153) sltop_153) 10.))
; 
; =  {sc.input.V[17].O} {sc.vtoi[14].X}
(assert (= sc_124 sc_75))
; 
; =  {of.input.V[17].O} {of.vtoi[14].X}
(assert (= of_124 of_75))
; 
; =  {sc.input.I[6].O} {sc.iadd[8].A}
(assert (= sc_37 sc_141))
; 
; =  {of.input.I[6].O} {of.iadd[8].A}
(assert (= of_37 of_141))
; 
; =  {sc.input.I[0].O} {sc.iadd[2].D}
(assert (= sc_29 sc_134))
; 
; =  {of.input.I[0].O} {of.iadd[2].D}
(assert (= of_29 of_134))
; 
; =  {sc.input.V[9].O} {sc.vadd[10].OUT2_0}
(assert (= sc_100 sc_65))
; 
; =  {of.input.V[9].O} {of.vadd[10].OUT2_0}
(assert (= of_100 of_65))
; 
; =  {sc.switch[7].PROD} {sc.itov[6].X}
(assert (= sc_8 sc_131))
; 
; =  {of.switch[7].PROD} {of.itov[6].X}
(assert (= of_8 of_131))
; 
; =  {sc.itov[11].Y} {sc.vadd[12].B}
(assert (= sc_130 sc_62))
; 
; =  {of.itov[11].Y} {of.vadd[12].B}
(assert (= of_130 of_62))
; 
; =  {sc.input.I[22].O} {sc.iadd[9].D}
(assert (= sc_53 sc_144))
; 
; =  {of.input.I[22].O} {of.iadd[9].D}
(assert (= of_53 of_144))
; 
; =  {sc.input.V[15].O} {sc.vgain[5].Y}
(assert (= sc_108 sc_1))
; 
; =  {of.input.V[15].O} {of.vgain[5].Y}
(assert (= of_108 of_1))
; 
; =  {sc.input.I[9].O} {sc.switch[15].SUB}
(assert (= sc_27 sc_10))
; 
; =  {of.input.I[9].O} {of.switch[15].SUB}
(assert (= of_27 of_10))
; 
; =  {sc.input.I[16].O} {sc.igenebind[13].TF}
(assert (= sc_43 sc_81))
; 
; =  {of.input.I[16].O} {of.igenebind[13].TF}
(assert (= of_43 of_81))
; 
; =  {sc.input.I[3].O} {sc.iadd[3].D}
(assert (= sc_45 sc_149))
; 
; =  {of.input.I[3].O} {of.iadd[3].D}
(assert (= of_45 of_149))
; 
; =  {sc.input.I[4].O} {sc.iadd[3].A}
(assert (= sc_47 sc_151))
; 
; =  {of.input.I[4].O} {of.iadd[3].A}
(assert (= of_47 of_151))
; 
; =  {sc.input.V[13].O} {sc.switch[15].n}
(assert (= sc_96 sc_9))
; 
; =  {of.input.V[13].O} {of.switch[15].n}
(assert (= of_96 of_9))
; 
; =  {sc.input.I[5].O} {sc.iadd[3].C}
(assert (= sc_49 sc_150))
; 
; =  {of.input.I[5].O} {of.iadd[3].C}
(assert (= of_49 of_150))
; 
; =  {sc.input.V[14].O} {sc.vtoi[4].X}
(assert (= sc_112 sc_78))
; 
; =  {of.input.V[14].O} {of.vtoi[4].X}
(assert (= of_112 of_78))
; 
; =  {sc.vtoi[0].Y} {sc.iadd[8].D}
(assert (= sc_74 sc_139))
; 
; =  {of.vtoi[0].Y} {of.iadd[8].D}
(assert (= of_74 of_139))
; 
; =  {sc.switch[15].PROD} {sc.iadd[9].A}
(assert (= sc_13 sc_146))
; 
; =  {of.switch[15].PROD} {of.iadd[9].A}
(assert (= of_13 of_146))
; 
; =  {sc.input.V[11].O} {sc.vadd[12].D}
(assert (= sc_104 sc_59))
; 
; =  {of.input.V[11].O} {of.vadd[12].D}
(assert (= of_104 of_59))
; 
; =  {sc.input.I[14].O} {sc.switch[7].Vmax}
(assert (= sc_41 sc_7))
; 
; =  {of.input.I[14].O} {of.switch[7].Vmax}
(assert (= of_41 of_7))
; 
; =  {sc.input.V[12].O} {sc.vadd[10].D}
(assert (= sc_98 sc_66))
; 
; =  {of.input.V[12].O} {of.vadd[10].D}
(assert (= of_98 of_66))
; 
; =  {sc.input.V[8].O} {sc.vadd[12].OUT2_0}
(assert (= sc_92 sc_58))
; 
; =  {of.input.V[8].O} {of.vadd[12].OUT2_0}
(assert (= of_92 of_58))
; 
; =  {sc.input.I[2].O} {sc.iadd[2].C}
(assert (= sc_17 sc_135))
; 
; =  {of.input.I[2].O} {of.iadd[2].C}
(assert (= of_17 of_135))
; 
; =  {sc.input.I[20].O} {sc.iadd[9].C}
(assert (= sc_15 sc_145))
; 
; =  {of.input.I[20].O} {of.iadd[9].C}
(assert (= of_15 of_145))
; 
; =  {sc.input.V[2].O} {sc.switch[7].n}
(assert (= sc_90 sc_4))
; 
; =  {of.input.V[2].O} {of.switch[7].n}
(assert (= of_90 of_4))
; 
; =  {sc.input.V[3].O} {sc.vadd[10].A}
(assert (= sc_116 sc_68))
; 
; =  {of.input.V[3].O} {of.vadd[10].A}
(assert (= of_116 of_68))
; 
; =  {sc.vtoi[14].Y} {sc.switch[15].Kmod}
(assert (= sc_77 sc_11))
; 
; =  {of.vtoi[14].Y} {of.switch[15].Kmod}
(assert (= of_77 of_11))
; 
; =  {sc.input.I[15].O} {sc.iadd[8].C}
(assert (= sc_35 sc_140))
; 
; =  {of.input.I[15].O} {of.iadd[8].C}
(assert (= of_35 of_140))
; 
; =  {sc.input.I[12].O} {sc.igenebind[1].K}
(assert (= sc_25 sc_86))
; 
; =  {of.input.I[12].O} {of.igenebind[1].K}
(assert (= of_25 of_86))
; 
; =  {sc.input.I[1].O} {sc.iadd[2].A}
(assert (= sc_51 sc_136))
; 
; =  {of.input.I[1].O} {of.iadd[2].A}
(assert (= of_51 of_136))
; 
; =  {sc.input.I[10].O} {sc.igenebind[13].Vmax}
(assert (= sc_33 sc_83))
; 
; =  {of.input.I[10].O} {of.igenebind[13].Vmax}
(assert (= of_33 of_83))
; 
; =  {sc.input.V[1].O} {sc.vgain[5].X}
(assert (= sc_122 sc_0))
; 
; =  {of.input.V[1].O} {of.vgain[5].X}
(assert (= of_122 of_0))
; 
; =  {sc.vadd[10].OUT2} {sc.output.V[1].X}
(assert (= sc_71 sc_56))
; 
; =  {of.vadd[10].OUT2} {of.output.V[1].X}
(assert (= of_71 of_56))
; 
; =  {sc.vadd[10].OUT2} {sc.switch[15].Vmax}
(assert (= sc_71 sc_12))
; 
; =  {of.vadd[10].OUT2} {of.switch[15].Vmax}
(assert (= of_71 of_12))
; 
; =  {sc.input.I[13].O} {sc.switch[7].Kmod}
(assert (= sc_23 sc_6))
; 
; =  {of.input.I[13].O} {of.switch[7].Kmod}
(assert (= of_23 of_6))
; 
; =  {sc.input.I[7].O} {sc.iadd[8].B}
(assert (= sc_21 sc_142))
; 
; =  {of.input.I[7].O} {of.iadd[8].B}
(assert (= of_21 of_142))
; 
; =  {sc.iadd[3].OUT} {sc.iadd[2].B}
(assert (= sc_153 sc_137))
; 
; =  {of.iadd[3].OUT} {of.iadd[2].B}
(assert (= of_153 of_137))
; 
; =  {sc.input.V[7].O} {sc.itov[9].K}
(assert (= sc_94 sc_126))
; 
; =  {of.input.V[7].O} {of.itov[9].K}
(assert (= of_94 of_126))
; 
; =  {sc.iadd[2].OUT} {sc.igenebind[1].TF}
(assert (= sc_138 sc_85))
; 
; =  {of.iadd[2].OUT} {of.igenebind[1].TF}
(assert (= of_138 of_85))
; 
; =  {sc.igenebind[13].GE} {sc.itov[11].K}
(assert (= sc_84 sc_129))
; 
; =  {of.igenebind[13].GE} {of.itov[11].K}
(assert (= of_84 of_129))
; 
; =  {sc.iadd[9].OUT} {sc.igenebind[13].K}
(assert (= sc_148 sc_82))
; 
; =  {of.iadd[9].OUT} {of.igenebind[13].K}
(assert (= of_148 of_82))
; 
; =  {sc.input.I[8].O} {sc.itov[11].X}
(assert (= sc_19 sc_128))
; 
; =  {of.input.I[8].O} {of.itov[11].X}
(assert (= of_19 of_128))
; 
; =  {sc.vadd[12].OUT2} {sc.output.V[0].X}
(assert (= sc_64 sc_54))
; 
; =  {of.vadd[12].OUT2} {of.output.V[0].X}
(assert (= of_64 of_54))
; 
; =  {sc.vadd[12].OUT2} {sc.vtoi[0].X}
(assert (= sc_64 sc_72))
; 
; =  {of.vadd[12].OUT2} {of.vtoi[0].X}
(assert (= of_64 of_72))
; 
; =  {sc.igenebind[1].GE} {sc.itov[9].X}
(assert (= sc_88 sc_125))
; 
; =  {of.igenebind[1].GE} {of.itov[9].X}
(assert (= of_88 of_125))
; 
; =  {sc.itov[6].Y} {sc.vgain[5].Z}
(assert (= sc_133 sc_2))
; 
; =  {of.itov[6].Y} {of.vgain[5].Z}
(assert (= of_133 of_2))
; 
; =  {sc.input.I[21].O} {sc.iadd[9].B}
(assert (= sc_39 sc_147))
; 
; =  {of.input.I[21].O} {of.iadd[9].B}
(assert (= of_39 of_147))
; 
; =  {sc.input.V[0].O} {sc.vtoi[14].K}
(assert (= sc_102 sc_76))
; 
; =  {of.input.V[0].O} {of.vtoi[14].K}
(assert (= of_102 of_76))
; 
; =  {sc.input.V[10].O} {sc.vtoi[0].K}
(assert (= sc_106 sc_73))
; 
; =  {of.input.V[10].O} {of.vtoi[0].K}
(assert (= of_106 of_73))
; 
; =  {sc.input.V[16].O} {sc.itov[6].K}
(assert (= sc_114 sc_132))
; 
; =  {of.input.V[16].O} {of.itov[6].K}
(assert (= of_114 of_132))
; 
; =  {sc.iadd[8].OUT} {sc.switch[7].SUB}
(assert (= sc_143 sc_5))
; 
; =  {of.iadd[8].OUT} {of.switch[7].SUB}
(assert (= of_143 of_5))
; 
; =  {sc.itov[9].Y} {sc.vadd[10].B}
(assert (= sc_127 sc_69))
; 
; =  {of.itov[9].Y} {of.vadd[10].B}
(assert (= of_127 of_69))
; 
; =  {sc.input.V[4].O} {sc.vadd[10].C}
(assert (= sc_118 sc_67))
; 
; =  {of.input.V[4].O} {of.vadd[10].C}
(assert (= of_118 of_67))
; 
; =  {sc.input.V[5].O} {sc.vadd[12].C}
(assert (= sc_120 sc_60))
; 
; =  {of.input.V[5].O} {of.vadd[12].C}
(assert (= of_120 of_60))
; 
; =  {sc.input.V[6].O} {sc.vadd[12].A}
(assert (= sc_110 sc_61))
; 
; =  {of.input.V[6].O} {of.vadd[12].A}
(assert (= of_110 of_61))
; 
; =  {sc.vgain[5].P} {sc.vtoi[4].K}
(assert (= sc_3 sc_79))
; 
; =  {of.vgain[5].P} {of.vtoi[4].K}
(assert (= of_3 of_79))
; 
; =  {sc.input.I[11].O} {sc.igenebind[1].Vmax}
(assert (= sc_31 sc_87))
; 
; =  {of.input.I[11].O} {of.igenebind[1].Vmax}
(assert (= of_31 of_87))
; 
; =  {sc.vtoi[4].Y} {sc.iadd[3].B}
(assert (= sc_80 sc_152))
; 
; =  {of.vtoi[4].Y} {of.iadd[3].B}
(assert (= of_80 of_152))
(assert (<= (* (/ 1. sc_55) 0.001) 0.001))
(assert (<= (* (/ 1. sc_57) 0.001) 0.001))
; 
; =  {sc.vadd[12].OUT2} {sc.output.V[0].O} {sc.vadd[10].OUT2} {sc.output.V[1].O}
(assert (and (and (= sc_64 sc_55) (= sc_64 sc_71)) (= sc_64 sc_57)))
(assert (= __minima__ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (ite (>= sltop_77 0.) sltop_77 (- sltop_77)) (ite (>= sltop_130 0.) sltop_130 (- sltop_130))) (ite (>= slbot_80 0.) slbot_80 (- slbot_80))) (ite (>= slbot_72 0.) slbot_72 (- slbot_72))) (ite (>= sltop_125 0.) sltop_125 (- sltop_125))) (ite (>= sltop_76 0.) sltop_76 (- sltop_76))) (ite (>= slbot_3 0.) slbot_3 (- slbot_3))) (ite (>= slbot_84 0.) slbot_84 (- slbot_84))) (ite (>= slbot_133 0.) slbot_133 (- slbot_133))) (ite (>= slbot_2 0.) slbot_2 (- slbot_2))) (ite (>= slbot_76 0.) slbot_76 (- slbot_76))) (ite (>= slbot_130 0.) slbot_130 (- slbot_130))) (ite (>= sltop_138 0.) sltop_138 (- sltop_138))) (ite (>= slbot_143 0.) slbot_143 (- slbot_143))) (ite (>= sltop_82 0.) sltop_82 (- sltop_82))) (ite (>= slbot_85 0.) slbot_85 (- slbot_85))) (ite (>= slbot_127 0.) slbot_127 (- slbot_127))) (ite (>= slbot_125 0.) slbot_125 (- slbot_125))) (ite (>= sltop_2 0.) sltop_2 (- sltop_2))) (ite (>= sltop_8 0.) sltop_8 (- sltop_8))) (ite (>= sltop_13 0.) sltop_13 (- sltop_13))) (ite (>= sltop_137 0.) sltop_137 (- sltop_137))) (ite (>= sltop_146 0.) sltop_146 (- sltop_146))) (ite (>= sltop_85 0.) sltop_85 (- sltop_85))) (ite (>= slbot_131 0.) slbot_131 (- slbot_131))) (ite (>= sltop_62 0.) sltop_62 (- sltop_62))) (ite (>= sltop_152 0.) sltop_152 (- sltop_152))) (ite (>= slbot_55 0.) slbot_55 (- slbot_55))) (ite (>= slbot_54 0.) slbot_54 (- slbot_54))) (ite (>= slbot_56 0.) slbot_56 (- slbot_56))) (ite (>= sltop_74 0.) sltop_74 (- sltop_74))) (ite (>= sltop_133 0.) sltop_133 (- sltop_133))) (ite (>= sltop_131 0.) sltop_131 (- sltop_131))) (ite (>= slbot_138 0.) slbot_138 (- slbot_138))) (ite (>= slbot_5 0.) slbot_5 (- slbot_5))) (ite (>= sltop_64 0.) sltop_64 (- sltop_64))) (ite (>= sltop_153 0.) sltop_153 (- sltop_153))) (ite (>= slbot_77 0.) slbot_77 (- slbot_77))) (ite (>= slbot_152 0.) slbot_152 (- slbot_152))) (ite (>= slbot_79 0.) slbot_79 (- slbot_79))) (ite (>= sltop_3 0.) sltop_3 (- sltop_3))) (ite (>= slbot_139 0.) slbot_139 (- slbot_139))) (ite (>= slbot_69 0.) slbot_69 (- slbot_69))) (ite (>= sltop_84 0.) sltop_84 (- sltop_84))) (ite (>= sltop_143 0.) sltop_143 (- sltop_143))) (ite (>= slbot_153 0.) slbot_153 (- slbot_153))) (ite (>= slbot_12 0.) slbot_12 (- slbot_12))) (ite (>= sltop_139 0.) sltop_139 (- sltop_139))) (ite (>= slbot_13 0.) slbot_13 (- slbot_13))) (ite (>= sltop_72 0.) sltop_72 (- sltop_72))) (ite (>= sltop_127 0.) sltop_127 (- sltop_127))) (ite (>= sltop_55 0.) sltop_55 (- sltop_55))) (ite (>= sltop_101 0.) sltop_101 (- sltop_101))) (ite (>= slbot_11 0.) slbot_11 (- slbot_11))) (ite (>= slbot_88 0.) slbot_88 (- slbot_88))) (ite (>= slbot_101 0.) slbot_101 (- slbot_101))) (ite (>= sltop_11 0.) sltop_11 (- sltop_11))) (ite (>= sltop_70 0.) sltop_70 (- sltop_70))) (ite (>= sltop_80 0.) sltop_80 (- sltop_80))) (ite (>= sltop_88 0.) sltop_88 (- sltop_88))) (ite (>= slbot_63 0.) slbot_63 (- slbot_63))) (ite (>= sltop_79 0.) sltop_79 (- sltop_79))) (ite (>= sltop_54 0.) sltop_54 (- sltop_54))) (ite (>= slbot_64 0.) slbot_64 (- slbot_64))) (ite (>= sltop_129 0.) sltop_129 (- sltop_129))) (ite (>= sltop_71 0.) sltop_71 (- sltop_71))) (ite (>= sltop_12 0.) sltop_12 (- sltop_12))) (ite (>= slbot_71 0.) slbot_71 (- slbot_71))) (ite (>= slbot_82 0.) slbot_82 (- slbot_82))) (ite (>= sltop_5 0.) sltop_5 (- sltop_5))) (ite (>= slbot_129 0.) slbot_129 (- slbot_129))) (ite (>= sltop_57 0.) sltop_57 (- sltop_57))) (ite (>= slbot_57 0.) slbot_57 (- slbot_57))) (ite (>= slbot_62 0.) slbot_62 (- slbot_62))) (ite (>= sltop_56 0.) sltop_56 (- sltop_56))) (ite (>= sltop_102 0.) sltop_102 (- sltop_102))) (ite (>= slbot_70 0.) slbot_70 (- slbot_70))) (ite (>= slbot_137 0.) slbot_137 (- slbot_137))) (ite (>= sltop_148 0.) sltop_148 (- sltop_148))) (ite (>= slbot_74 0.) slbot_74 (- slbot_74))) (ite (>= slbot_146 0.) slbot_146 (- slbot_146))) (ite (>= slbot_148 0.) slbot_148 (- slbot_148))) (ite (>= sltop_69 0.) sltop_69 (- sltop_69))) (ite (>= sltop_63 0.) sltop_63 (- sltop_63))) (ite (>= slbot_8 0.) slbot_8 (- slbot_8))) (ite (>= slbot_102 0.) slbot_102 (- slbot_102)))))
(check-sat)
