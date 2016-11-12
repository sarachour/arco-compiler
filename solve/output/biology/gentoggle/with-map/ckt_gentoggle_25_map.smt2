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
; =  {sc.vgain[15].P} {((sc.vgain[15].X/sc.vgain[15].Y)*sc.vgain[15].Z*1.)}
(assert (= sc_3 (* (* (/ sc_0 sc_1) sc_2) 1.)))
; 
; =  {of.vgain[15].P} {0.}
(assert (= of_3 0.))
; 
; >=  {((sc.vgain[15].X*1.)+of.vgain[15].X)} {3300.}
(assert (<= (+ (* sc_0 1.) of_0) 3300.))
; 
; <=  {((sc.vgain[15].X*1.)+of.vgain[15].X)} {0.0001}
(assert (>= (+ (* sc_0 1.) of_0) 0.0001))
; 
; >=  {((sc.vgain[15].Y*0.000125)+of.vgain[15].Y)} {3300.}
(assert (<= (+ (* sc_1 0.000125) of_1) 3300.))
; 
; <=  {((sc.vgain[15].Y*0.000125)+of.vgain[15].Y)} {1.}
(assert (>= (+ (* sc_1 0.000125) of_1) 1.))
(declare-fun slbot_3 () Real)
(declare-fun sltop_3 () Real)
; 
; =  {(((sc.vgain[15].P*619.026085325)+of.vgain[15].P)+sl.min.vgain[15].P)} {1.51515151515e-12}
(assert (= (+ (+ (* sc_3 619.026085325) of_3) slbot_3) 1.51515151515e-12))
; 
; =  {(((sc.vgain[15].P*625.)+of.vgain[15].P)+sl.max.vgain[15].P)} {5445000.}
(assert (= (+ (+ (* sc_3 625.) of_3) sltop_3) 5445000.))
(declare-fun slbot_2 () Real)
(declare-fun sltop_2 () Real)
; 
; =  {(((sc.vgain[15].Z*0.154756521331)+of.vgain[15].Z)+sl.min.vgain[15].Z)} {0.0001}
(assert (= (+ (+ (* sc_2 0.154756521331) of_2) slbot_2) 0.0001))
; 
; =  {(((sc.vgain[15].Z*0.15625)+of.vgain[15].Z)+sl.max.vgain[15].Z)} {3300.}
(assert (= (+ (+ (* sc_2 0.15625) of_2) sltop_2) 3300.))
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
; no offset
(assert (= of_4 0.))
; no offset
(assert (= of_5 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_6 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vgain[5].P} {((sc.vgain[5].X/sc.vgain[5].Y)*sc.vgain[5].Z*1.)}
(assert (= sc_7 (* (* (/ sc_4 sc_5) sc_6) 1.)))
; 
; =  {of.vgain[5].P} {0.}
(assert (= of_7 0.))
; 
; >=  {((sc.vgain[5].X*2.)+of.vgain[5].X)} {3300.}
(assert (<= (+ (* sc_4 2.) of_4) 3300.))
; 
; <=  {((sc.vgain[5].X*2.)+of.vgain[5].X)} {0.0001}
(assert (>= (+ (* sc_4 2.) of_4) 0.0001))
; 
; >=  {((sc.vgain[5].Y*1.)+of.vgain[5].Y)} {3300.}
(assert (<= (+ (* sc_5 1.) of_5) 3300.))
; 
; <=  {((sc.vgain[5].Y*1.)+of.vgain[5].Y)} {1.}
(assert (>= (+ (* sc_5 1.) of_5) 1.))
(declare-fun slbot_7 () Real)
(declare-fun sltop_7 () Real)
; 
; =  {(((sc.vgain[5].P*0.)+of.vgain[5].P)+sl.min.vgain[5].P)} {1.51515151515e-12}
(assert (= (+ (+ (* sc_7 0.) of_7) slbot_7) 1.51515151515e-12))
; 
; =  {(((sc.vgain[5].P*103.621514368)+of.vgain[5].P)+sl.max.vgain[5].P)} {5445000.}
(assert (= (+ (+ (* sc_7 103.621514368) of_7) sltop_7) 5445000.))
(declare-fun slbot_6 () Real)
(declare-fun sltop_6 () Real)
; 
; =  {(((sc.vgain[5].Z*0.)+of.vgain[5].Z)+sl.min.vgain[5].Z)} {0.0001}
(assert (= (+ (+ (* sc_6 0.) of_6) slbot_6) 0.0001))
; 
; =  {(((sc.vgain[5].Z*103.621514368)+of.vgain[5].Z)+sl.max.vgain[5].Z)} {3300.}
(assert (= (+ (+ (* sc_6 103.621514368) of_6) sltop_6) 3300.))
(declare-fun slbot_7 () Real)
(declare-fun sltop_7 () Real)
; 
; =  {(((sc.vgain[5].P*0.)+of.vgain[5].P)+sl.min.vgain[5].P)} {1.51515151515e-12}
(assert (= (+ (+ (* sc_7 0.) of_7) slbot_7) 1.51515151515e-12))
; 
; =  {(((sc.vgain[5].P*103.621514368)+of.vgain[5].P)+sl.max.vgain[5].P)} {5445000.}
(assert (= (+ (+ (* sc_7 103.621514368) of_7) sltop_7) 5445000.))
(declare-fun sc_8 () Real)
(assert (> sc_8 1e-08))
(declare-fun of_8 () Real)
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
; no offset
(assert (= of_8 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_9 0.))
; no offset
(assert (= of_10 0.))
; 
; =  {(sc.switch[7].SUB/sc.switch[7].Kmod)} {1.}
(assert (= (/ sc_9 sc_10) 1.))
; no scale
(assert (= (/ sc_9 sc_10) 1.))
; no scale
(assert (= (/ sc_8 1.) 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_11 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.switch[7].PROD} {(sc.switch[7].Vmax/1.)}
(assert (= sc_12 (/ sc_11 1.)))
; 
; =  {of.switch[7].PROD} {0.}
(assert (= of_12 0.))
; 
; >=  {((sc.switch[7].n*1250.)+of.switch[7].n)} {3300.}
(assert (<= (+ (* sc_8 1250.) of_8) 3300.))
; 
; <=  {((sc.switch[7].n*1250.)+of.switch[7].n)} {0.5}
(assert (>= (+ (* sc_8 1250.) of_8) 0.5))
(declare-fun slbot_9 () Real)
(declare-fun sltop_9 () Real)
; 
; =  {(((sc.switch[7].SUB*-1.)+of.switch[7].SUB)+sl.min.switch[7].SUB)} {0.0001}
(assert (= (+ (+ (* sc_9 -1.) of_9) slbot_9) 0.0001))
; 
; =  {(((sc.switch[7].SUB*-0.84375)+of.switch[7].SUB)+sl.max.switch[7].SUB)} {10.}
(assert (= (+ (+ (* sc_9 -0.84375) of_9) sltop_9) 10.))
; 
; >=  {((sc.switch[7].Kmod*1.)+of.switch[7].Kmod)} {10.}
(assert (<= (+ (* sc_10 1.) of_10) 10.))
; 
; <=  {((sc.switch[7].Kmod*1.)+of.switch[7].Kmod)} {0.0001}
(assert (>= (+ (* sc_10 1.) of_10) 0.0001))
(declare-fun slbot_12 () Real)
(declare-fun sltop_12 () Real)
; 
; =  {(((sc.switch[7].PROD*0.)+of.switch[7].PROD)+sl.min.switch[7].PROD)} {9.99934002508e-38}
(assert (= (+ (+ (* sc_12 0.) of_12) slbot_12) 9.99934002508e-38))
; 
; =  {(((sc.switch[7].PROD*103.621514368)+of.switch[7].PROD)+sl.max.switch[7].PROD)} {9.9999999}
(assert (= (+ (+ (* sc_12 103.621514368) of_12) sltop_12) 9.9999999))
; 
; >=  {((sc.switch[7].Vmax*1.)+of.switch[7].Vmax)} {10.}
(assert (<= (+ (* sc_11 1.) of_11) 10.))
; 
; <=  {((sc.switch[7].Vmax*1.)+of.switch[7].Vmax)} {0.0001}
(assert (>= (+ (* sc_11 1.) of_11) 0.0001))
(declare-fun slbot_12 () Real)
(declare-fun sltop_12 () Real)
; 
; =  {(((sc.switch[7].PROD*0.)+of.switch[7].PROD)+sl.min.switch[7].PROD)} {9.99934002508e-38}
(assert (= (+ (+ (* sc_12 0.) of_12) slbot_12) 9.99934002508e-38))
; 
; =  {(((sc.switch[7].PROD*103.621514368)+of.switch[7].PROD)+sl.max.switch[7].PROD)} {9.9999999}
(assert (= (+ (+ (* sc_12 103.621514368) of_12) sltop_12) 9.9999999))
(declare-fun sc_13 () Real)
(assert (> sc_13 1e-08))
(declare-fun of_13 () Real)
(declare-fun sc_14 () Real)
(assert (> sc_14 1e-08))
(declare-fun of_14 () Real)
(declare-fun sc_15 () Real)
(assert (> sc_15 1e-08))
(declare-fun of_15 () Real)
(declare-fun sc_16 () Real)
(assert (> sc_16 1e-08))
(declare-fun of_16 () Real)
(declare-fun sc_17 () Real)
(assert (> sc_17 1e-08))
(declare-fun of_17 () Real)
; no offset
(assert (= of_13 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_14 0.))
; no offset
(assert (= of_15 0.))
; 
; =  {(sc.switch[10].SUB/sc.switch[10].Kmod)} {1.}
(assert (= (/ sc_14 sc_15) 1.))
; no scale
(assert (= (/ sc_14 sc_15) 1.))
; no scale
(assert (= (/ sc_13 1.) 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_16 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.switch[10].PROD} {(sc.switch[10].Vmax/1.)}
(assert (= sc_17 (/ sc_16 1.)))
; 
; =  {of.switch[10].PROD} {0.}
(assert (= of_17 0.))
; 
; >=  {((sc.switch[10].n*1000.75)+of.switch[10].n)} {3300.}
(assert (<= (+ (* sc_13 1000.75) of_13) 3300.))
; 
; <=  {((sc.switch[10].n*1000.75)+of.switch[10].n)} {0.5}
(assert (>= (+ (* sc_13 1000.75) of_13) 0.5))
; 
; >=  {((sc.switch[10].SUB*337.632520764)+of.switch[10].SUB)} {10.}
(assert (<= (+ (* sc_14 337.632520764) of_14) 10.))
; 
; <=  {((sc.switch[10].SUB*337.632520764)+of.switch[10].SUB)} {0.0001}
(assert (>= (+ (* sc_14 337.632520764) of_14) 0.0001))
(declare-fun slbot_15 () Real)
(declare-fun sltop_15 () Real)
; 
; =  {(((sc.switch[10].Kmod*0.)+of.switch[10].Kmod)+sl.min.switch[10].Kmod)} {0.0001}
(assert (= (+ (+ (* sc_15 0.) of_15) slbot_15) 0.0001))
; 
; =  {(((sc.switch[10].Kmod*1.66666666667)+of.switch[10].Kmod)+sl.max.switch[10].Kmod)} {10.}
(assert (= (+ (+ (* sc_15 1.66666666667) of_15) sltop_15) 10.))
(declare-fun slbot_17 () Real)
(declare-fun sltop_17 () Real)
; 
; =  {(((sc.switch[10].PROD*0.)+of.switch[10].PROD)+sl.min.switch[10].PROD)} {9.99934002508e-38}
(assert (= (+ (+ (* sc_17 0.) of_17) slbot_17) 9.99934002508e-38))
; 
; =  {(((sc.switch[10].PROD*0.0156)+of.switch[10].PROD)+sl.max.switch[10].PROD)} {9.9999999}
(assert (= (+ (+ (* sc_17 0.0156) of_17) sltop_17) 9.9999999))
(declare-fun slbot_16 () Real)
(declare-fun sltop_16 () Real)
; 
; =  {(((sc.switch[10].Vmax*0.)+of.switch[10].Vmax)+sl.min.switch[10].Vmax)} {0.0001}
(assert (= (+ (+ (* sc_16 0.) of_16) slbot_16) 0.0001))
; 
; =  {(((sc.switch[10].Vmax*0.0156)+of.switch[10].Vmax)+sl.max.switch[10].Vmax)} {10.}
(assert (= (+ (+ (* sc_16 0.0156) of_16) sltop_16) 10.))
(declare-fun slbot_17 () Real)
(declare-fun sltop_17 () Real)
; 
; =  {(((sc.switch[10].PROD*0.)+of.switch[10].PROD)+sl.min.switch[10].PROD)} {9.99934002508e-38}
(assert (= (+ (+ (* sc_17 0.) of_17) slbot_17) 9.99934002508e-38))
; 
; =  {(((sc.switch[10].PROD*0.0156)+of.switch[10].PROD)+sl.max.switch[10].PROD)} {9.9999999}
(assert (= (+ (+ (* sc_17 0.0156) of_17) sltop_17) 9.9999999))
(declare-fun sc_18 () Real)
(assert (> sc_18 1e-08))
(declare-fun of_18 () Real)
(declare-fun sc_19 () Real)
(assert (> sc_19 1e-08))
(declare-fun of_19 () Real)
; 
; =  {sc.input.I[2].O} {sc.input.I[2].X}
(assert (= sc_19 sc_18))
; 
; =  {of.input.I[2].O} {of.input.I[2].X}
(assert (= of_19 of_18))
; 
; >=  {((sc.input.I[2].X*0.)+of.input.I[2].X)} {10.}
(assert (<= (+ (* sc_18 0.) of_18) 10.))
; 
; <=  {((sc.input.I[2].X*0.)+of.input.I[2].X)} {0.}
(assert (>= (+ (* sc_18 0.) of_18) 0.))
; 
; >=  {((sc.input.I[2].O*0.)+of.input.I[2].O)} {10.}
(assert (<= (+ (* sc_19 0.) of_19) 10.))
; 
; <=  {((sc.input.I[2].O*0.)+of.input.I[2].O)} {0.}
(assert (>= (+ (* sc_19 0.) of_19) 0.))
(declare-fun sc_20 () Real)
(assert (> sc_20 1e-08))
(declare-fun of_20 () Real)
(declare-fun sc_21 () Real)
(assert (> sc_21 1e-08))
(declare-fun of_21 () Real)
; 
; =  {sc.input.I[8].O} {sc.input.I[8].X}
(assert (= sc_21 sc_20))
; 
; =  {of.input.I[8].O} {of.input.I[8].X}
(assert (= of_21 of_20))
; 
; >=  {((sc.input.I[8].X*0.)+of.input.I[8].X)} {10.}
(assert (<= (+ (* sc_20 0.) of_20) 10.))
; 
; <=  {((sc.input.I[8].X*0.)+of.input.I[8].X)} {0.}
(assert (>= (+ (* sc_20 0.) of_20) 0.))
; 
; >=  {((sc.input.I[8].O*0.)+of.input.I[8].O)} {10.}
(assert (<= (+ (* sc_21 0.) of_21) 10.))
; 
; <=  {((sc.input.I[8].O*0.)+of.input.I[8].O)} {0.}
(assert (>= (+ (* sc_21 0.) of_21) 0.))
(declare-fun sc_22 () Real)
(assert (> sc_22 1e-08))
(declare-fun of_22 () Real)
(declare-fun sc_23 () Real)
(assert (> sc_23 1e-08))
(declare-fun of_23 () Real)
; 
; =  {sc.input.I[7].O} {sc.input.I[7].X}
(assert (= sc_23 sc_22))
; 
; =  {of.input.I[7].O} {of.input.I[7].X}
(assert (= of_23 of_22))
; 
; >=  {((sc.input.I[7].X*0.)+of.input.I[7].X)} {10.}
(assert (<= (+ (* sc_22 0.) of_22) 10.))
; 
; <=  {((sc.input.I[7].X*0.)+of.input.I[7].X)} {0.}
(assert (>= (+ (* sc_22 0.) of_22) 0.))
; 
; >=  {((sc.input.I[7].O*0.)+of.input.I[7].O)} {10.}
(assert (<= (+ (* sc_23 0.) of_23) 10.))
; 
; <=  {((sc.input.I[7].O*0.)+of.input.I[7].O)} {0.}
(assert (>= (+ (* sc_23 0.) of_23) 0.))
(declare-fun sc_24 () Real)
(assert (> sc_24 1e-08))
(declare-fun of_24 () Real)
(declare-fun sc_25 () Real)
(assert (> sc_25 1e-08))
(declare-fun of_25 () Real)
; 
; =  {sc.input.I[13].O} {sc.input.I[13].X}
(assert (= sc_25 sc_24))
; 
; =  {of.input.I[13].O} {of.input.I[13].X}
(assert (= of_25 of_24))
; 
; >=  {((sc.input.I[13].X*337.632520764)+of.input.I[13].X)} {10.}
(assert (<= (+ (* sc_24 337.632520764) of_24) 10.))
; 
; <=  {((sc.input.I[13].X*337.632520764)+of.input.I[13].X)} {0.}
(assert (>= (+ (* sc_24 337.632520764) of_24) 0.))
; 
; >=  {((sc.input.I[13].O*337.632520764)+of.input.I[13].O)} {10.}
(assert (<= (+ (* sc_25 337.632520764) of_25) 10.))
; 
; <=  {((sc.input.I[13].O*337.632520764)+of.input.I[13].O)} {0.}
(assert (>= (+ (* sc_25 337.632520764) of_25) 0.))
(declare-fun sc_26 () Real)
(assert (> sc_26 1e-08))
(declare-fun of_26 () Real)
(declare-fun sc_27 () Real)
(assert (> sc_27 1e-08))
(declare-fun of_27 () Real)
; 
; =  {sc.input.I[12].O} {sc.input.I[12].X}
(assert (= sc_27 sc_26))
; 
; =  {of.input.I[12].O} {of.input.I[12].X}
(assert (= of_27 of_26))
; 
; >=  {((sc.input.I[12].X*0.)+of.input.I[12].X)} {10.}
(assert (<= (+ (* sc_26 0.) of_26) 10.))
; 
; <=  {((sc.input.I[12].X*0.)+of.input.I[12].X)} {0.}
(assert (>= (+ (* sc_26 0.) of_26) 0.))
; 
; >=  {((sc.input.I[12].O*0.)+of.input.I[12].O)} {10.}
(assert (<= (+ (* sc_27 0.) of_27) 10.))
; 
; <=  {((sc.input.I[12].O*0.)+of.input.I[12].O)} {0.}
(assert (>= (+ (* sc_27 0.) of_27) 0.))
(declare-fun sc_28 () Real)
(assert (> sc_28 1e-08))
(declare-fun of_28 () Real)
(declare-fun sc_29 () Real)
(assert (> sc_29 1e-08))
(declare-fun of_29 () Real)
; 
; =  {sc.input.I[31].O} {sc.input.I[31].X}
(assert (= sc_29 sc_28))
; 
; =  {of.input.I[31].O} {of.input.I[31].X}
(assert (= of_29 of_28))
; 
; >=  {((sc.input.I[31].X*0.)+of.input.I[31].X)} {10.}
(assert (<= (+ (* sc_28 0.) of_28) 10.))
; 
; <=  {((sc.input.I[31].X*0.)+of.input.I[31].X)} {0.}
(assert (>= (+ (* sc_28 0.) of_28) 0.))
; 
; >=  {((sc.input.I[31].O*0.)+of.input.I[31].O)} {10.}
(assert (<= (+ (* sc_29 0.) of_29) 10.))
; 
; <=  {((sc.input.I[31].O*0.)+of.input.I[31].O)} {0.}
(assert (>= (+ (* sc_29 0.) of_29) 0.))
(declare-fun sc_30 () Real)
(assert (> sc_30 1e-08))
(declare-fun of_30 () Real)
(declare-fun sc_31 () Real)
(assert (> sc_31 1e-08))
(declare-fun of_31 () Real)
; 
; =  {sc.input.I[9].O} {sc.input.I[9].X}
(assert (= sc_31 sc_30))
; 
; =  {of.input.I[9].O} {of.input.I[9].X}
(assert (= of_31 of_30))
; 
; >=  {((sc.input.I[9].X*0.)+of.input.I[9].X)} {10.}
(assert (<= (+ (* sc_30 0.) of_30) 10.))
; 
; <=  {((sc.input.I[9].X*0.)+of.input.I[9].X)} {0.}
(assert (>= (+ (* sc_30 0.) of_30) 0.))
; 
; >=  {((sc.input.I[9].O*0.)+of.input.I[9].O)} {10.}
(assert (<= (+ (* sc_31 0.) of_31) 10.))
; 
; <=  {((sc.input.I[9].O*0.)+of.input.I[9].O)} {0.}
(assert (>= (+ (* sc_31 0.) of_31) 0.))
(declare-fun sc_32 () Real)
(assert (> sc_32 1e-08))
(declare-fun of_32 () Real)
(declare-fun sc_33 () Real)
(assert (> sc_33 1e-08))
(declare-fun of_33 () Real)
; 
; =  {sc.input.I[0].O} {sc.input.I[0].X}
(assert (= sc_33 sc_32))
; 
; =  {of.input.I[0].O} {of.input.I[0].X}
(assert (= of_33 of_32))
; 
; >=  {((sc.input.I[0].X*0.15625)+of.input.I[0].X)} {10.}
(assert (<= (+ (* sc_32 0.15625) of_32) 10.))
; 
; <=  {((sc.input.I[0].X*0.15625)+of.input.I[0].X)} {0.}
(assert (>= (+ (* sc_32 0.15625) of_32) 0.))
; 
; >=  {((sc.input.I[0].O*0.15625)+of.input.I[0].O)} {10.}
(assert (<= (+ (* sc_33 0.15625) of_33) 10.))
; 
; <=  {((sc.input.I[0].O*0.15625)+of.input.I[0].O)} {0.}
(assert (>= (+ (* sc_33 0.15625) of_33) 0.))
(declare-fun sc_34 () Real)
(assert (> sc_34 1e-08))
(declare-fun of_34 () Real)
(declare-fun sc_35 () Real)
(assert (> sc_35 1e-08))
(declare-fun of_35 () Real)
; 
; =  {sc.input.I[11].O} {sc.input.I[11].X}
(assert (= sc_35 sc_34))
; 
; =  {of.input.I[11].O} {of.input.I[11].X}
(assert (= of_35 of_34))
; 
; >=  {((sc.input.I[11].X*0.)+of.input.I[11].X)} {10.}
(assert (<= (+ (* sc_34 0.) of_34) 10.))
; 
; <=  {((sc.input.I[11].X*0.)+of.input.I[11].X)} {0.}
(assert (>= (+ (* sc_34 0.) of_34) 0.))
; 
; >=  {((sc.input.I[11].O*0.)+of.input.I[11].O)} {10.}
(assert (<= (+ (* sc_35 0.) of_35) 10.))
; 
; <=  {((sc.input.I[11].O*0.)+of.input.I[11].O)} {0.}
(assert (>= (+ (* sc_35 0.) of_35) 0.))
(declare-fun sc_36 () Real)
(assert (> sc_36 1e-08))
(declare-fun of_36 () Real)
(declare-fun sc_37 () Real)
(assert (> sc_37 1e-08))
(declare-fun of_37 () Real)
; 
; =  {sc.input.I[10].O} {sc.input.I[10].X}
(assert (= sc_37 sc_36))
; 
; =  {of.input.I[10].O} {of.input.I[10].X}
(assert (= of_37 of_36))
; 
; >=  {((sc.input.I[10].X*0.)+of.input.I[10].X)} {10.}
(assert (<= (+ (* sc_36 0.) of_36) 10.))
; 
; <=  {((sc.input.I[10].X*0.)+of.input.I[10].X)} {0.}
(assert (>= (+ (* sc_36 0.) of_36) 0.))
; 
; >=  {((sc.input.I[10].O*0.)+of.input.I[10].O)} {10.}
(assert (<= (+ (* sc_37 0.) of_37) 10.))
; 
; <=  {((sc.input.I[10].O*0.)+of.input.I[10].O)} {0.}
(assert (>= (+ (* sc_37 0.) of_37) 0.))
(declare-fun sc_38 () Real)
(assert (> sc_38 1e-08))
(declare-fun of_38 () Real)
(declare-fun sc_39 () Real)
(assert (> sc_39 1e-08))
(declare-fun of_39 () Real)
; 
; =  {sc.input.I[15].O} {sc.input.I[15].X}
(assert (= sc_39 sc_38))
; 
; =  {of.input.I[15].O} {of.input.I[15].X}
(assert (= of_39 of_38))
; 
; >=  {((sc.input.I[15].X*1.)+of.input.I[15].X)} {10.}
(assert (<= (+ (* sc_38 1.) of_38) 10.))
; 
; <=  {((sc.input.I[15].X*1.)+of.input.I[15].X)} {0.}
(assert (>= (+ (* sc_38 1.) of_38) 0.))
; 
; >=  {((sc.input.I[15].O*1.)+of.input.I[15].O)} {10.}
(assert (<= (+ (* sc_39 1.) of_39) 10.))
; 
; <=  {((sc.input.I[15].O*1.)+of.input.I[15].O)} {0.}
(assert (>= (+ (* sc_39 1.) of_39) 0.))
(declare-fun sc_40 () Real)
(assert (> sc_40 1e-08))
(declare-fun of_40 () Real)
(declare-fun sc_41 () Real)
(assert (> sc_41 1e-08))
(declare-fun of_41 () Real)
; 
; =  {sc.input.I[6].O} {sc.input.I[6].X}
(assert (= sc_41 sc_40))
; 
; =  {of.input.I[6].O} {of.input.I[6].X}
(assert (= of_41 of_40))
; 
; >=  {((sc.input.I[6].X*0.)+of.input.I[6].X)} {10.}
(assert (<= (+ (* sc_40 0.) of_40) 10.))
; 
; <=  {((sc.input.I[6].X*0.)+of.input.I[6].X)} {0.}
(assert (>= (+ (* sc_40 0.) of_40) 0.))
; 
; >=  {((sc.input.I[6].O*0.)+of.input.I[6].O)} {10.}
(assert (<= (+ (* sc_41 0.) of_41) 10.))
; 
; <=  {((sc.input.I[6].O*0.)+of.input.I[6].O)} {0.}
(assert (>= (+ (* sc_41 0.) of_41) 0.))
(declare-fun sc_42 () Real)
(assert (> sc_42 1e-08))
(declare-fun of_42 () Real)
(declare-fun sc_43 () Real)
(assert (> sc_43 1e-08))
(declare-fun of_43 () Real)
; 
; =  {sc.input.I[33].O} {sc.input.I[33].X}
(assert (= sc_43 sc_42))
; 
; =  {of.input.I[33].O} {of.input.I[33].X}
(assert (= of_43 of_42))
; 
; >=  {((sc.input.I[33].X*1.)+of.input.I[33].X)} {10.}
(assert (<= (+ (* sc_42 1.) of_42) 10.))
; 
; <=  {((sc.input.I[33].X*1.)+of.input.I[33].X)} {0.}
(assert (>= (+ (* sc_42 1.) of_42) 0.))
; 
; >=  {((sc.input.I[33].O*1.)+of.input.I[33].O)} {10.}
(assert (<= (+ (* sc_43 1.) of_43) 10.))
; 
; <=  {((sc.input.I[33].O*1.)+of.input.I[33].O)} {0.}
(assert (>= (+ (* sc_43 1.) of_43) 0.))
(declare-fun sc_44 () Real)
(assert (> sc_44 1e-08))
(declare-fun of_44 () Real)
(declare-fun sc_45 () Real)
(assert (> sc_45 1e-08))
(declare-fun of_45 () Real)
; 
; =  {sc.input.I[14].O} {sc.input.I[14].X}
(assert (= sc_45 sc_44))
; 
; =  {of.input.I[14].O} {of.input.I[14].X}
(assert (= of_45 of_44))
; 
; >=  {((sc.input.I[14].X*4000.)+of.input.I[14].X)} {10.}
(assert (<= (+ (* sc_44 4000.) of_44) 10.))
; 
; <=  {((sc.input.I[14].X*4000.)+of.input.I[14].X)} {0.}
(assert (>= (+ (* sc_44 4000.) of_44) 0.))
; 
; >=  {((sc.input.I[14].O*4000.)+of.input.I[14].O)} {10.}
(assert (<= (+ (* sc_45 4000.) of_45) 10.))
; 
; <=  {((sc.input.I[14].O*4000.)+of.input.I[14].O)} {0.}
(assert (>= (+ (* sc_45 4000.) of_45) 0.))
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
; >=  {((sc.input.I[16].X*1.)+of.input.I[16].X)} {10.}
(assert (<= (+ (* sc_46 1.) of_46) 10.))
; 
; <=  {((sc.input.I[16].X*1.)+of.input.I[16].X)} {0.}
(assert (>= (+ (* sc_46 1.) of_46) 0.))
; 
; >=  {((sc.input.I[16].O*1.)+of.input.I[16].O)} {10.}
(assert (<= (+ (* sc_47 1.) of_47) 10.))
; 
; <=  {((sc.input.I[16].O*1.)+of.input.I[16].O)} {0.}
(assert (>= (+ (* sc_47 1.) of_47) 0.))
(declare-fun sc_48 () Real)
(assert (> sc_48 1e-08))
(declare-fun of_48 () Real)
(declare-fun sc_49 () Real)
(assert (> sc_49 1e-08))
(declare-fun of_49 () Real)
; 
; =  {sc.input.I[30].O} {sc.input.I[30].X}
(assert (= sc_49 sc_48))
; 
; =  {of.input.I[30].O} {of.input.I[30].X}
(assert (= of_49 of_48))
; 
; >=  {((sc.input.I[30].X*0.)+of.input.I[30].X)} {10.}
(assert (<= (+ (* sc_48 0.) of_48) 10.))
; 
; <=  {((sc.input.I[30].X*0.)+of.input.I[30].X)} {0.}
(assert (>= (+ (* sc_48 0.) of_48) 0.))
; 
; >=  {((sc.input.I[30].O*0.)+of.input.I[30].O)} {10.}
(assert (<= (+ (* sc_49 0.) of_49) 10.))
; 
; <=  {((sc.input.I[30].O*0.)+of.input.I[30].O)} {0.}
(assert (>= (+ (* sc_49 0.) of_49) 0.))
(declare-fun sc_50 () Real)
(assert (> sc_50 1e-08))
(declare-fun of_50 () Real)
(declare-fun sc_51 () Real)
(assert (> sc_51 1e-08))
(declare-fun of_51 () Real)
; 
; =  {sc.input.I[3].O} {sc.input.I[3].X}
(assert (= sc_51 sc_50))
; 
; =  {of.input.I[3].O} {of.input.I[3].X}
(assert (= of_51 of_50))
; 
; >=  {((sc.input.I[3].X*0.)+of.input.I[3].X)} {10.}
(assert (<= (+ (* sc_50 0.) of_50) 10.))
; 
; <=  {((sc.input.I[3].X*0.)+of.input.I[3].X)} {0.}
(assert (>= (+ (* sc_50 0.) of_50) 0.))
; 
; >=  {((sc.input.I[3].O*0.)+of.input.I[3].O)} {10.}
(assert (<= (+ (* sc_51 0.) of_51) 10.))
; 
; <=  {((sc.input.I[3].O*0.)+of.input.I[3].O)} {0.}
(assert (>= (+ (* sc_51 0.) of_51) 0.))
(declare-fun sc_52 () Real)
(assert (> sc_52 1e-08))
(declare-fun of_52 () Real)
(declare-fun sc_53 () Real)
(assert (> sc_53 1e-08))
(declare-fun of_53 () Real)
; 
; =  {sc.input.I[4].O} {sc.input.I[4].X}
(assert (= sc_53 sc_52))
; 
; =  {of.input.I[4].O} {of.input.I[4].X}
(assert (= of_53 of_52))
; 
; >=  {((sc.input.I[4].X*0.)+of.input.I[4].X)} {10.}
(assert (<= (+ (* sc_52 0.) of_52) 10.))
; 
; <=  {((sc.input.I[4].X*0.)+of.input.I[4].X)} {0.}
(assert (>= (+ (* sc_52 0.) of_52) 0.))
; 
; >=  {((sc.input.I[4].O*0.)+of.input.I[4].O)} {10.}
(assert (<= (+ (* sc_53 0.) of_53) 10.))
; 
; <=  {((sc.input.I[4].O*0.)+of.input.I[4].O)} {0.}
(assert (>= (+ (* sc_53 0.) of_53) 0.))
(declare-fun sc_54 () Real)
(assert (> sc_54 1e-08))
(declare-fun of_54 () Real)
(declare-fun sc_55 () Real)
(assert (> sc_55 1e-08))
(declare-fun of_55 () Real)
; 
; =  {sc.input.I[5].O} {sc.input.I[5].X}
(assert (= sc_55 sc_54))
; 
; =  {of.input.I[5].O} {of.input.I[5].X}
(assert (= of_55 of_54))
; 
; >=  {((sc.input.I[5].X*0.)+of.input.I[5].X)} {10.}
(assert (<= (+ (* sc_54 0.) of_54) 10.))
; 
; <=  {((sc.input.I[5].X*0.)+of.input.I[5].X)} {0.}
(assert (>= (+ (* sc_54 0.) of_54) 0.))
; 
; >=  {((sc.input.I[5].O*0.)+of.input.I[5].O)} {10.}
(assert (<= (+ (* sc_55 0.) of_55) 10.))
; 
; <=  {((sc.input.I[5].O*0.)+of.input.I[5].O)} {0.}
(assert (>= (+ (* sc_55 0.) of_55) 0.))
(declare-fun sc_56 () Real)
(assert (> sc_56 1e-08))
(declare-fun of_56 () Real)
(declare-fun sc_57 () Real)
(assert (> sc_57 1e-08))
(declare-fun of_57 () Real)
; 
; =  {sc.input.I[1].O} {sc.input.I[1].X}
(assert (= sc_57 sc_56))
; 
; =  {of.input.I[1].O} {of.input.I[1].X}
(assert (= of_57 of_56))
; 
; >=  {((sc.input.I[1].X*0.0156)+of.input.I[1].X)} {10.}
(assert (<= (+ (* sc_56 0.0156) of_56) 10.))
; 
; <=  {((sc.input.I[1].X*0.0156)+of.input.I[1].X)} {0.}
(assert (>= (+ (* sc_56 0.0156) of_56) 0.))
; 
; >=  {((sc.input.I[1].O*0.0156)+of.input.I[1].O)} {10.}
(assert (<= (+ (* sc_57 0.0156) of_57) 10.))
; 
; <=  {((sc.input.I[1].O*0.0156)+of.input.I[1].O)} {0.}
(assert (>= (+ (* sc_57 0.0156) of_57) 0.))
(declare-fun sc_58 () Real)
(assert (> sc_58 1e-08))
(declare-fun of_58 () Real)
(declare-fun sc_59 () Real)
(assert (> sc_59 1e-08))
(declare-fun of_59 () Real)
; 
; =  {sc.input.I[17].O} {sc.input.I[17].X}
(assert (= sc_59 sc_58))
; 
; =  {of.input.I[17].O} {of.input.I[17].X}
(assert (= of_59 of_58))
; 
; >=  {((sc.input.I[17].X*1.)+of.input.I[17].X)} {10.}
(assert (<= (+ (* sc_58 1.) of_58) 10.))
; 
; <=  {((sc.input.I[17].X*1.)+of.input.I[17].X)} {0.}
(assert (>= (+ (* sc_58 1.) of_58) 0.))
; 
; >=  {((sc.input.I[17].O*1.)+of.input.I[17].O)} {10.}
(assert (<= (+ (* sc_59 1.) of_59) 10.))
; 
; <=  {((sc.input.I[17].O*1.)+of.input.I[17].O)} {0.}
(assert (>= (+ (* sc_59 1.) of_59) 0.))
(declare-fun sc_60 () Real)
(assert (> sc_60 1e-08))
(declare-fun of_60 () Real)
(declare-fun sc_61 () Real)
(assert (> sc_61 1e-08))
(declare-fun of_61 () Real)
; 
; =  {sc.input.I[32].O} {sc.input.I[32].X}
(assert (= sc_61 sc_60))
; 
; =  {of.input.I[32].O} {of.input.I[32].X}
(assert (= of_61 of_60))
; 
; >=  {((sc.input.I[32].X*0.)+of.input.I[32].X)} {10.}
(assert (<= (+ (* sc_60 0.) of_60) 10.))
; 
; <=  {((sc.input.I[32].X*0.)+of.input.I[32].X)} {0.}
(assert (>= (+ (* sc_60 0.) of_60) 0.))
; 
; >=  {((sc.input.I[32].O*0.)+of.input.I[32].O)} {10.}
(assert (<= (+ (* sc_61 0.) of_61) 10.))
; 
; <=  {((sc.input.I[32].O*0.)+of.input.I[32].O)} {0.}
(assert (>= (+ (* sc_61 0.) of_61) 0.))
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
; >=  {((sc.input.I[18].X*1.)+of.input.I[18].X)} {10.}
(assert (<= (+ (* sc_62 1.) of_62) 10.))
; 
; <=  {((sc.input.I[18].X*1.)+of.input.I[18].X)} {0.}
(assert (>= (+ (* sc_62 1.) of_62) 0.))
; 
; >=  {((sc.input.I[18].O*1.)+of.input.I[18].O)} {10.}
(assert (<= (+ (* sc_63 1.) of_63) 10.))
; 
; <=  {((sc.input.I[18].O*1.)+of.input.I[18].O)} {0.}
(assert (>= (+ (* sc_63 1.) of_63) 0.))
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
; =  {sc.output.V[0].O} {sc.output.V[0].X}
(assert (= sc_67 sc_66))
; 
; =  {of.output.V[0].O} {of.output.V[0].X}
(assert (= of_67 of_66))
(declare-fun slbot_66 () Real)
(declare-fun sltop_66 () Real)
; 
; =  {(((sc.output.V[0].X*0.)+of.output.V[0].X)+sl.min.output.V[0].X)} {0.0001}
(assert (= (+ (+ (* sc_66 0.) of_66) slbot_66) 0.0001))
; 
; =  {(((sc.output.V[0].X*0.15625)+of.output.V[0].X)+sl.max.output.V[0].X)} {3300.}
(assert (= (+ (+ (* sc_66 0.15625) of_66) sltop_66) 3300.))
(declare-fun slbot_67 () Real)
(declare-fun sltop_67 () Real)
; 
; =  {(((sc.output.V[0].O*0.)+of.output.V[0].O)+sl.min.output.V[0].O)} {0.0001}
(assert (= (+ (+ (* sc_67 0.) of_67) slbot_67) 0.0001))
; 
; =  {(((sc.output.V[0].O*0.15625)+of.output.V[0].O)+sl.max.output.V[0].O)} {3300.}
(assert (= (+ (+ (* sc_67 0.15625) of_67) sltop_67) 3300.))
(declare-fun sc_68 () Real)
(assert (> sc_68 1e-08))
(declare-fun of_68 () Real)
(declare-fun sc_69 () Real)
(assert (> sc_69 1e-08))
(declare-fun of_69 () Real)
; 
; =  {sc.output.V[1].O} {sc.output.V[1].X}
(assert (= sc_69 sc_68))
; 
; =  {of.output.V[1].O} {of.output.V[1].X}
(assert (= of_69 of_68))
(declare-fun slbot_68 () Real)
(declare-fun sltop_68 () Real)
; 
; =  {(((sc.output.V[1].X*0.)+of.output.V[1].X)+sl.min.output.V[1].X)} {0.0001}
(assert (= (+ (+ (* sc_68 0.) of_68) slbot_68) 0.0001))
; 
; =  {(((sc.output.V[1].X*0.0156)+of.output.V[1].X)+sl.max.output.V[1].X)} {3300.}
(assert (= (+ (+ (* sc_68 0.0156) of_68) sltop_68) 3300.))
(declare-fun slbot_69 () Real)
(declare-fun sltop_69 () Real)
; 
; =  {(((sc.output.V[1].O*0.)+of.output.V[1].O)+sl.min.output.V[1].O)} {0.0001}
(assert (= (+ (+ (* sc_69 0.) of_69) slbot_69) 0.0001))
; 
; =  {(((sc.output.V[1].O*0.0156)+of.output.V[1].O)+sl.max.output.V[1].O)} {3300.}
(assert (= (+ (+ (* sc_69 0.0156) of_69) sltop_69) 3300.))
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
(declare-fun sc_76 () Real)
(assert (> sc_76 1e-08))
(declare-fun of_76 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_71 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_72 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_74 0.))
; 
; =  {sc.vadd[13].A} {(1.*sc.vadd[13].B)}
(assert (= sc_73 (* 1. sc_74)))
; 
; =  {sc.vadd[13].A} {(1.*sc.vadd[13].C)} {(1.*sc.vadd[13].D)}
(assert (and (= sc_73 (* 1. sc_72)) (= sc_73 (* 1. sc_71))))
; no offset
(assert (= (- (+ of_73 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[13].OUT} {(sc.vadd[13].A*1.)}
(assert (= sc_75 (* sc_73 1.)))
; 
; =  {of.vadd[13].OUT} {0.}
(assert (= of_75 0.))
; no scale
(assert (= sc_71 1.))
; no scale
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_71 0.))
; no offset
(assert (= of_76 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_72 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_74 0.))
; 
; =  {sc.vadd[13].A} {(1.*sc.vadd[13].B)}
(assert (= sc_73 (* 1. sc_74)))
; 
; =  {sc.vadd[13].A} {(1.*sc.vadd[13].C)} {(1.*sc.vadd[13].D*sc.vadd[13].OUT2)}
(assert (and (= sc_73 (* 1. sc_72)) (= sc_73 (* (* 1. sc_71) sc_76))))
; no offset
(assert (= (- (+ of_73 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[13].OUT2} {(sc.vadd[13].A*1.)}
(assert (= sc_76 (* sc_73 1.)))
; no offset
(assert (= of_76 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[13].OUT2_0} {(sc.vadd[13].A*1.)}
(assert (= sc_70 (* sc_73 1.)))
; 
; =  {of.vadd[13].OUT2_0} {0.}
(assert (= of_70 0.))
; 
; >=  {((sc.vadd[13].OUT2_0*0.)+of.vadd[13].OUT2_0)} {3300.}
(assert (<= (+ (* sc_70 0.) of_70) 3300.))
; 
; <=  {((sc.vadd[13].OUT2_0*0.)+of.vadd[13].OUT2_0)} {0.}
(assert (>= (+ (* sc_70 0.) of_70) 0.))
; 
; >=  {((sc.vadd[13].D*4.)+of.vadd[13].D)} {3300.}
(assert (<= (+ (* sc_71 4.) of_71) 3300.))
; 
; <=  {((sc.vadd[13].D*4.)+of.vadd[13].D)} {0.}
(assert (>= (+ (* sc_71 4.) of_71) 0.))
; 
; >=  {((sc.vadd[13].C*0.)+of.vadd[13].C)} {3300.}
(assert (<= (+ (* sc_72 0.) of_72) 3300.))
; 
; <=  {((sc.vadd[13].C*0.)+of.vadd[13].C)} {0.}
(assert (>= (+ (* sc_72 0.) of_72) 0.))
; 
; >=  {((sc.vadd[13].A*0.)+of.vadd[13].A)} {3300.}
(assert (<= (+ (* sc_73 0.) of_73) 3300.))
; 
; <=  {((sc.vadd[13].A*0.)+of.vadd[13].A)} {0.}
(assert (>= (+ (* sc_73 0.) of_73) 0.))
(declare-fun slbot_76 () Real)
(declare-fun sltop_76 () Real)
; 
; =  {(((sc.vadd[13].OUT2*0.)+of.vadd[13].OUT2)+sl.min.vadd[13].OUT2)} {0.}
(assert (= (+ (+ (* sc_76 0.) of_76) slbot_76) 0.))
; 
; =  {(((sc.vadd[13].OUT2*0.15625)+of.vadd[13].OUT2)+sl.max.vadd[13].OUT2)} {3300.}
(assert (= (+ (+ (* sc_76 0.15625) of_76) sltop_76) 3300.))
(declare-fun slbot_74 () Real)
(declare-fun sltop_74 () Real)
; 
; =  {(((sc.vadd[13].B*61.4415124065)+of.vadd[13].B)+sl.min.vadd[13].B)} {0.}
(assert (= (+ (+ (* sc_74 61.4415124065) of_74) slbot_74) 0.))
; 
; =  {(((sc.vadd[13].B*62.4)+of.vadd[13].B)+sl.max.vadd[13].B)} {3300.}
(assert (= (+ (+ (* sc_74 62.4) of_74) sltop_74) 3300.))
(declare-fun slbot_75 () Real)
(declare-fun sltop_75 () Real)
; 
; =  {(((sc.vadd[13].OUT*61.4415124065)+of.vadd[13].OUT)+sl.min.vadd[13].OUT)} {-1650.}
(assert (= (+ (+ (* sc_75 61.4415124065) of_75) slbot_75) -1650.))
; 
; =  {(((sc.vadd[13].OUT*62.4)+of.vadd[13].OUT)+sl.max.vadd[13].OUT)} {1650.}
(assert (= (+ (+ (* sc_75 62.4) of_75) sltop_75) 1650.))
(declare-fun slbot_76 () Real)
(declare-fun sltop_76 () Real)
; 
; =  {(((sc.vadd[13].OUT2*0.)+of.vadd[13].OUT2)+sl.min.vadd[13].OUT2)} {0.}
(assert (= (+ (+ (* sc_76 0.) of_76) slbot_76) 0.))
; 
; =  {(((sc.vadd[13].OUT2*0.15625)+of.vadd[13].OUT2)+sl.max.vadd[13].OUT2)} {3300.}
(assert (= (+ (+ (* sc_76 0.15625) of_76) sltop_76) 3300.))
(declare-fun sc_77 () Real)
(assert (> sc_77 1e-08))
(declare-fun of_77 () Real)
(declare-fun sc_78 () Real)
(assert (> sc_78 1e-08))
(declare-fun of_78 () Real)
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
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_78 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_79 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_81 0.))
; 
; =  {sc.vadd[16].A} {(1.*sc.vadd[16].B)}
(assert (= sc_80 (* 1. sc_81)))
; 
; =  {sc.vadd[16].A} {(1.*sc.vadd[16].C)} {(1.*sc.vadd[16].D)}
(assert (and (= sc_80 (* 1. sc_79)) (= sc_80 (* 1. sc_78))))
; no offset
(assert (= (- (+ of_80 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[16].OUT} {(sc.vadd[16].A*1.)}
(assert (= sc_82 (* sc_80 1.)))
; 
; =  {of.vadd[16].OUT} {0.}
(assert (= of_82 0.))
; no scale
(assert (= sc_78 1.))
; no scale
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_78 0.))
; no offset
(assert (= of_83 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_79 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_81 0.))
; 
; =  {sc.vadd[16].A} {(1.*sc.vadd[16].B)}
(assert (= sc_80 (* 1. sc_81)))
; 
; =  {sc.vadd[16].A} {(1.*sc.vadd[16].C)} {(1.*sc.vadd[16].D*sc.vadd[16].OUT2)}
(assert (and (= sc_80 (* 1. sc_79)) (= sc_80 (* (* 1. sc_78) sc_83))))
; no offset
(assert (= (- (+ of_80 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[16].OUT2} {(sc.vadd[16].A*1.)}
(assert (= sc_83 (* sc_80 1.)))
; no offset
(assert (= of_83 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[16].OUT2_0} {(sc.vadd[16].A*1.)}
(assert (= sc_77 (* sc_80 1.)))
; 
; =  {of.vadd[16].OUT2_0} {0.}
(assert (= of_77 0.))
; 
; >=  {((sc.vadd[16].OUT2_0*0.)+of.vadd[16].OUT2_0)} {3300.}
(assert (<= (+ (* sc_77 0.) of_77) 3300.))
; 
; <=  {((sc.vadd[16].OUT2_0*0.)+of.vadd[16].OUT2_0)} {0.}
(assert (>= (+ (* sc_77 0.) of_77) 0.))
; 
; >=  {((sc.vadd[16].D*4.)+of.vadd[16].D)} {3300.}
(assert (<= (+ (* sc_78 4.) of_78) 3300.))
; 
; <=  {((sc.vadd[16].D*4.)+of.vadd[16].D)} {0.}
(assert (>= (+ (* sc_78 4.) of_78) 0.))
; 
; >=  {((sc.vadd[16].C*0.)+of.vadd[16].C)} {3300.}
(assert (<= (+ (* sc_79 0.) of_79) 3300.))
; 
; <=  {((sc.vadd[16].C*0.)+of.vadd[16].C)} {0.}
(assert (>= (+ (* sc_79 0.) of_79) 0.))
; 
; >=  {((sc.vadd[16].A*0.)+of.vadd[16].A)} {3300.}
(assert (<= (+ (* sc_80 0.) of_80) 3300.))
; 
; <=  {((sc.vadd[16].A*0.)+of.vadd[16].A)} {0.}
(assert (>= (+ (* sc_80 0.) of_80) 0.))
(declare-fun slbot_83 () Real)
(declare-fun sltop_83 () Real)
; 
; =  {(((sc.vadd[16].OUT2*0.)+of.vadd[16].OUT2)+sl.min.vadd[16].OUT2)} {0.}
(assert (= (+ (+ (* sc_83 0.) of_83) slbot_83) 0.))
; 
; =  {(((sc.vadd[16].OUT2*0.0156)+of.vadd[16].OUT2)+sl.max.vadd[16].OUT2)} {3300.}
(assert (= (+ (+ (* sc_83 0.0156) of_83) sltop_83) 3300.))
(declare-fun slbot_81 () Real)
(declare-fun sltop_81 () Real)
; 
; =  {(((sc.vadd[16].B*619.026085325)+of.vadd[16].B)+sl.min.vadd[16].B)} {0.}
(assert (= (+ (+ (* sc_81 619.026085325) of_81) slbot_81) 0.))
; 
; =  {(((sc.vadd[16].B*625.)+of.vadd[16].B)+sl.max.vadd[16].B)} {3300.}
(assert (= (+ (+ (* sc_81 625.) of_81) sltop_81) 3300.))
(declare-fun slbot_82 () Real)
(declare-fun sltop_82 () Real)
; 
; =  {(((sc.vadd[16].OUT*619.026085325)+of.vadd[16].OUT)+sl.min.vadd[16].OUT)} {-1650.}
(assert (= (+ (+ (* sc_82 619.026085325) of_82) slbot_82) -1650.))
; 
; =  {(((sc.vadd[16].OUT*625.)+of.vadd[16].OUT)+sl.max.vadd[16].OUT)} {1650.}
(assert (= (+ (+ (* sc_82 625.) of_82) sltop_82) 1650.))
(declare-fun slbot_83 () Real)
(declare-fun sltop_83 () Real)
; 
; =  {(((sc.vadd[16].OUT2*0.)+of.vadd[16].OUT2)+sl.min.vadd[16].OUT2)} {0.}
(assert (= (+ (+ (* sc_83 0.) of_83) slbot_83) 0.))
; 
; =  {(((sc.vadd[16].OUT2*0.0156)+of.vadd[16].OUT2)+sl.max.vadd[16].OUT2)} {3300.}
(assert (= (+ (+ (* sc_83 0.0156) of_83) sltop_83) 3300.))
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
(assert (= 0. 0.))
; no offset
(assert (= of_85 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_84 0.))
; 
; =  {sc.vtoi[9].Y} {((1./sc.vtoi[9].K)*sc.vtoi[9].X)}
(assert (= sc_86 (* (/ 1. sc_85) sc_84)))
; 
; =  {of.vtoi[9].Y} {0.}
(assert (= of_86 0.))
; 
; >=  {((sc.vtoi[9].X*1.)+of.vtoi[9].X)} {3300.}
(assert (<= (+ (* sc_84 1.) of_84) 3300.))
; 
; <=  {((sc.vtoi[9].X*1.)+of.vtoi[9].X)} {1.}
(assert (>= (+ (* sc_84 1.) of_84) 1.))
(declare-fun slbot_86 () Real)
(declare-fun sltop_86 () Real)
; 
; =  {(((sc.vtoi[9].Y*0.)+of.vtoi[9].Y)+sl.min.vtoi[9].Y)} {0.00030303030303}
(assert (= (+ (+ (* sc_86 0.) of_86) slbot_86) 0.00030303030303))
; 
; =  {(((sc.vtoi[9].Y*1.66666666667)+of.vtoi[9].Y)+sl.max.vtoi[9].Y)} {3300.}
(assert (= (+ (+ (* sc_86 1.66666666667) of_86) sltop_86) 3300.))
(declare-fun slbot_85 () Real)
(declare-fun sltop_85 () Real)
; 
; =  {(((sc.vtoi[9].K*0.)+of.vtoi[9].K)+sl.min.vtoi[9].K)} {1.}
(assert (= (+ (+ (* sc_85 0.) of_85) slbot_85) 1.))
; 
; =  {(((sc.vtoi[9].K*0.6)+of.vtoi[9].K)+sl.max.vtoi[9].K)} {3300.}
(assert (= (+ (+ (* sc_85 0.6) of_85) sltop_85) 3300.))
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
(assert (= 0. 0.))
; no offset
(assert (= of_88 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_87 0.))
; 
; =  {sc.vtoi[0].Y} {((1./sc.vtoi[0].K)*sc.vtoi[0].X)}
(assert (= sc_89 (* (/ 1. sc_88) sc_87)))
; 
; =  {of.vtoi[0].Y} {0.}
(assert (= of_89 0.))
(declare-fun slbot_87 () Real)
(declare-fun sltop_87 () Real)
; 
; =  {(((sc.vtoi[0].X*0.)+of.vtoi[0].X)+sl.min.vtoi[0].X)} {1.}
(assert (= (+ (+ (* sc_87 0.) of_87) slbot_87) 1.))
; 
; =  {(((sc.vtoi[0].X*0.15625)+of.vtoi[0].X)+sl.max.vtoi[0].X)} {3300.}
(assert (= (+ (+ (* sc_87 0.15625) of_87) sltop_87) 3300.))
(declare-fun slbot_89 () Real)
(declare-fun sltop_89 () Real)
; 
; =  {(((sc.vtoi[0].Y*-0.15625)+of.vtoi[0].Y)+sl.min.vtoi[0].Y)} {0.00030303030303}
(assert (= (+ (+ (* sc_89 -0.15625) of_89) slbot_89) 0.00030303030303))
; 
; =  {(((sc.vtoi[0].Y*0.)+of.vtoi[0].Y)+sl.max.vtoi[0].Y)} {3300.}
(assert (= (+ (+ (* sc_89 0.) of_89) sltop_89) 3300.))
; 
; >=  {((sc.vtoi[0].K*-1.)+of.vtoi[0].K)} {3300.}
(assert (<= (+ (* sc_88 -1.) of_88) 3300.))
; 
; <=  {((sc.vtoi[0].K*-1.)+of.vtoi[0].K)} {1.}
(assert (>= (+ (* sc_88 -1.) of_88) 1.))
(declare-fun sc_90 () Real)
(assert (> sc_90 1e-08))
(declare-fun of_90 () Real)
(declare-fun sc_91 () Real)
(assert (> sc_91 1e-08))
(declare-fun of_91 () Real)
(declare-fun sc_92 () Real)
(assert (> sc_92 1e-08))
(declare-fun of_92 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_91 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_90 0.))
; 
; =  {sc.vtoi[4].Y} {((1./sc.vtoi[4].K)*sc.vtoi[4].X)}
(assert (= sc_92 (* (/ 1. sc_91) sc_90)))
; 
; =  {of.vtoi[4].Y} {0.}
(assert (= of_92 0.))
; 
; >=  {((sc.vtoi[4].X*1.)+of.vtoi[4].X)} {3300.}
(assert (<= (+ (* sc_90 1.) of_90) 3300.))
; 
; <=  {((sc.vtoi[4].X*1.)+of.vtoi[4].X)} {1.}
(assert (>= (+ (* sc_90 1.) of_90) 1.))
(declare-fun slbot_92 () Real)
(declare-fun sltop_92 () Real)
; 
; =  {(((sc.vtoi[4].Y*0.)+of.vtoi[4].Y)+sl.min.vtoi[4].Y)} {0.00030303030303}
(assert (= (+ (+ (* sc_92 0.) of_92) slbot_92) 0.00030303030303))
; 
; =  {(((sc.vtoi[4].Y*0.00965050555471)+of.vtoi[4].Y)+sl.max.vtoi[4].Y)} {3300.}
(assert (= (+ (+ (* sc_92 0.00965050555471) of_92) sltop_92) 3300.))
(declare-fun slbot_91 () Real)
(declare-fun sltop_91 () Real)
; 
; =  {(((sc.vtoi[4].K*0.)+of.vtoi[4].K)+sl.min.vtoi[4].K)} {1.}
(assert (= (+ (+ (* sc_91 0.) of_91) slbot_91) 1.))
; 
; =  {(((sc.vtoi[4].K*103.621514368)+of.vtoi[4].K)+sl.max.vtoi[4].K)} {3300.}
(assert (= (+ (+ (* sc_91 103.621514368) of_91) sltop_91) 3300.))
(declare-fun slbot_92 () Real)
(declare-fun sltop_92 () Real)
; 
; =  {(((sc.vtoi[4].Y*0.)+of.vtoi[4].Y)+sl.min.vtoi[4].Y)} {0.00030303030303}
(assert (= (+ (+ (* sc_92 0.) of_92) slbot_92) 0.00030303030303))
; 
; =  {(((sc.vtoi[4].Y*0.00965050555471)+of.vtoi[4].Y)+sl.max.vtoi[4].Y)} {3300.}
(assert (= (+ (+ (* sc_92 0.00965050555471) of_92) sltop_92) 3300.))
(declare-fun sc_93 () Real)
(assert (> sc_93 1e-08))
(declare-fun of_93 () Real)
(declare-fun sc_94 () Real)
(assert (> sc_94 1e-08))
(declare-fun of_94 () Real)
(declare-fun sc_95 () Real)
(assert (> sc_95 1e-08))
(declare-fun of_95 () Real)
(declare-fun sc_96 () Real)
(assert (> sc_96 1e-08))
(declare-fun of_96 () Real)
; no offset
(assert (= of_94 0.))
; no offset
(assert (= of_93 0.))
; 
; =  {1.} {(sc.igenebind[14].K*sc.igenebind[14].TF)}
(assert (= 1. (* sc_94 sc_93)))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_95 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.igenebind[14].GE} {(sc.igenebind[14].Vmax*(1./1.))}
(assert (= sc_96 (* sc_95 (/ 1. 1.))))
; 
; =  {of.igenebind[14].GE} {0.}
(assert (= of_96 0.))
(declare-fun slbot_93 () Real)
(declare-fun sltop_93 () Real)
; 
; =  {(((sc.igenebind[14].TF*0.)+of.igenebind[14].TF)+sl.min.igenebind[14].TF)} {0.0001}
(assert (= (+ (+ (* sc_93 0.) of_93) slbot_93) 0.0001))
; 
; =  {(((sc.igenebind[14].TF*0.0156)+of.igenebind[14].TF)+sl.max.igenebind[14].TF)} {10.}
(assert (= (+ (+ (* sc_93 0.0156) of_93) sltop_93) 10.))
; 
; >=  {((sc.igenebind[14].K*1.)+of.igenebind[14].K)} {10.}
(assert (<= (+ (* sc_94 1.) of_94) 10.))
; 
; <=  {((sc.igenebind[14].K*1.)+of.igenebind[14].K)} {0.0001}
(assert (>= (+ (* sc_94 1.) of_94) 0.0001))
(declare-fun slbot_96 () Real)
(declare-fun sltop_96 () Real)
; 
; =  {(((sc.igenebind[14].GE*0.0153603781016)+of.igenebind[14].GE)+sl.min.igenebind[14].GE)} {9.90099009901e-07}
(assert (= (+ (+ (* sc_96 0.0153603781016) of_96) slbot_96) 9.90099009901e-07))
; 
; =  {(((sc.igenebind[14].GE*0.0156)+of.igenebind[14].GE)+sl.max.igenebind[14].GE)} {9.9999999}
(assert (= (+ (+ (* sc_96 0.0156) of_96) sltop_96) 9.9999999))
; 
; >=  {((sc.igenebind[14].Vmax*0.0156)+of.igenebind[14].Vmax)} {10.}
(assert (<= (+ (* sc_95 0.0156) of_95) 10.))
; 
; <=  {((sc.igenebind[14].Vmax*0.0156)+of.igenebind[14].Vmax)} {0.0001}
(assert (>= (+ (* sc_95 0.0156) of_95) 0.0001))
(declare-fun sc_97 () Real)
(assert (> sc_97 1e-08))
(declare-fun of_97 () Real)
(declare-fun sc_98 () Real)
(assert (> sc_98 1e-08))
(declare-fun of_98 () Real)
(declare-fun sc_99 () Real)
(assert (> sc_99 1e-08))
(declare-fun of_99 () Real)
(declare-fun sc_100 () Real)
(assert (> sc_100 1e-08))
(declare-fun of_100 () Real)
; no offset
(assert (= of_98 0.))
; no offset
(assert (= of_97 0.))
; 
; =  {1.} {(sc.igenebind[1].K*sc.igenebind[1].TF)}
(assert (= 1. (* sc_98 sc_97)))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_99 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.igenebind[1].GE} {(sc.igenebind[1].Vmax*(1./1.))}
(assert (= sc_100 (* sc_99 (/ 1. 1.))))
; 
; =  {of.igenebind[1].GE} {0.}
(assert (= of_100 0.))
(declare-fun slbot_97 () Real)
(declare-fun sltop_97 () Real)
; 
; =  {(((sc.igenebind[1].TF*0.)+of.igenebind[1].TF)+sl.min.igenebind[1].TF)} {0.0001}
(assert (= (+ (+ (* sc_97 0.) of_97) slbot_97) 0.0001))
; 
; =  {(((sc.igenebind[1].TF*0.00965050555471)+of.igenebind[1].TF)+sl.max.igenebind[1].TF)} {10.}
(assert (= (+ (+ (* sc_97 0.00965050555471) of_97) sltop_97) 10.))
; 
; >=  {((sc.igenebind[1].K*1.)+of.igenebind[1].K)} {10.}
(assert (<= (+ (* sc_98 1.) of_98) 10.))
; 
; <=  {((sc.igenebind[1].K*1.)+of.igenebind[1].K)} {0.0001}
(assert (>= (+ (* sc_98 1.) of_98) 0.0001))
(declare-fun slbot_100 () Real)
(declare-fun sltop_100 () Real)
; 
; =  {(((sc.igenebind[1].GE*0.154756521331)+of.igenebind[1].GE)+sl.min.igenebind[1].GE)} {9.90099009901e-07}
(assert (= (+ (+ (* sc_100 0.154756521331) of_100) slbot_100) 9.90099009901e-07))
; 
; =  {(((sc.igenebind[1].GE*0.15625)+of.igenebind[1].GE)+sl.max.igenebind[1].GE)} {9.9999999}
(assert (= (+ (+ (* sc_100 0.15625) of_100) sltop_100) 9.9999999))
; 
; >=  {((sc.igenebind[1].Vmax*0.15625)+of.igenebind[1].Vmax)} {10.}
(assert (<= (+ (* sc_99 0.15625) of_99) 10.))
; 
; <=  {((sc.igenebind[1].Vmax*0.15625)+of.igenebind[1].Vmax)} {0.0001}
(assert (>= (+ (* sc_99 0.15625) of_99) 0.0001))
(declare-fun slbot_100 () Real)
(declare-fun sltop_100 () Real)
; 
; =  {(((sc.igenebind[1].GE*0.154756521331)+of.igenebind[1].GE)+sl.min.igenebind[1].GE)} {9.90099009901e-07}
(assert (= (+ (+ (* sc_100 0.154756521331) of_100) slbot_100) 9.90099009901e-07))
; 
; =  {(((sc.igenebind[1].GE*0.15625)+of.igenebind[1].GE)+sl.max.igenebind[1].GE)} {9.9999999}
(assert (= (+ (+ (* sc_100 0.15625) of_100) sltop_100) 9.9999999))
(declare-fun sc_101 () Real)
(assert (> sc_101 1e-08))
(declare-fun of_101 () Real)
(declare-fun sc_102 () Real)
(assert (> sc_102 1e-08))
(declare-fun of_102 () Real)
; 
; =  {sc.input.V[2].O} {sc.input.V[2].X}
(assert (= sc_102 sc_101))
; 
; =  {of.input.V[2].O} {of.input.V[2].X}
(assert (= of_102 of_101))
; 
; >=  {((sc.input.V[2].X*1250.)+of.input.V[2].X)} {3300.}
(assert (<= (+ (* sc_101 1250.) of_101) 3300.))
; 
; <=  {((sc.input.V[2].X*1250.)+of.input.V[2].X)} {0.}
(assert (>= (+ (* sc_101 1250.) of_101) 0.))
; 
; >=  {((sc.input.V[2].O*1250.)+of.input.V[2].O)} {3300.}
(assert (<= (+ (* sc_102 1250.) of_102) 3300.))
; 
; <=  {((sc.input.V[2].O*1250.)+of.input.V[2].O)} {0.}
(assert (>= (+ (* sc_102 1250.) of_102) 0.))
(declare-fun sc_103 () Real)
(assert (> sc_103 1e-08))
(declare-fun of_103 () Real)
(declare-fun sc_104 () Real)
(assert (> sc_104 1e-08))
(declare-fun of_104 () Real)
; 
; =  {sc.input.V[8].O} {sc.input.V[8].X}
(assert (= sc_104 sc_103))
; 
; =  {of.input.V[8].O} {of.input.V[8].X}
(assert (= of_104 of_103))
; 
; >=  {((sc.input.V[8].X*0.)+of.input.V[8].X)} {3300.}
(assert (<= (+ (* sc_103 0.) of_103) 3300.))
; 
; <=  {((sc.input.V[8].X*0.)+of.input.V[8].X)} {0.}
(assert (>= (+ (* sc_103 0.) of_103) 0.))
; 
; >=  {((sc.input.V[8].O*0.)+of.input.V[8].O)} {3300.}
(assert (<= (+ (* sc_104 0.) of_104) 3300.))
; 
; <=  {((sc.input.V[8].O*0.)+of.input.V[8].O)} {0.}
(assert (>= (+ (* sc_104 0.) of_104) 0.))
(declare-fun sc_105 () Real)
(assert (> sc_105 1e-08))
(declare-fun of_105 () Real)
(declare-fun sc_106 () Real)
(assert (> sc_106 1e-08))
(declare-fun of_106 () Real)
; 
; =  {sc.input.V[7].O} {sc.input.V[7].X}
(assert (= sc_106 sc_105))
; 
; =  {of.input.V[7].O} {of.input.V[7].X}
(assert (= of_106 of_105))
; 
; >=  {((sc.input.V[7].X*0.)+of.input.V[7].X)} {3300.}
(assert (<= (+ (* sc_105 0.) of_105) 3300.))
; 
; <=  {((sc.input.V[7].X*0.)+of.input.V[7].X)} {0.}
(assert (>= (+ (* sc_105 0.) of_105) 0.))
; 
; >=  {((sc.input.V[7].O*0.)+of.input.V[7].O)} {3300.}
(assert (<= (+ (* sc_106 0.) of_106) 3300.))
; 
; <=  {((sc.input.V[7].O*0.)+of.input.V[7].O)} {0.}
(assert (>= (+ (* sc_106 0.) of_106) 0.))
(declare-fun sc_107 () Real)
(assert (> sc_107 1e-08))
(declare-fun of_107 () Real)
(declare-fun sc_108 () Real)
(assert (> sc_108 1e-08))
(declare-fun of_108 () Real)
; 
; =  {sc.input.V[13].O} {sc.input.V[13].X}
(assert (= sc_108 sc_107))
; 
; =  {of.input.V[13].O} {of.input.V[13].X}
(assert (= of_108 of_107))
; 
; >=  {((sc.input.V[13].X*0.000125)+of.input.V[13].X)} {3300.}
(assert (<= (+ (* sc_107 0.000125) of_107) 3300.))
; 
; <=  {((sc.input.V[13].X*0.000125)+of.input.V[13].X)} {0.}
(assert (>= (+ (* sc_107 0.000125) of_107) 0.))
; 
; >=  {((sc.input.V[13].O*0.000125)+of.input.V[13].O)} {3300.}
(assert (<= (+ (* sc_108 0.000125) of_108) 3300.))
; 
; <=  {((sc.input.V[13].O*0.000125)+of.input.V[13].O)} {0.}
(assert (>= (+ (* sc_108 0.000125) of_108) 0.))
(declare-fun sc_109 () Real)
(assert (> sc_109 1e-08))
(declare-fun of_109 () Real)
(declare-fun sc_110 () Real)
(assert (> sc_110 1e-08))
(declare-fun of_110 () Real)
; 
; =  {sc.input.V[12].O} {sc.input.V[12].X}
(assert (= sc_110 sc_109))
; 
; =  {of.input.V[12].O} {of.input.V[12].X}
(assert (= of_110 of_109))
; 
; >=  {((sc.input.V[12].X*1000.75)+of.input.V[12].X)} {3300.}
(assert (<= (+ (* sc_109 1000.75) of_109) 3300.))
; 
; <=  {((sc.input.V[12].X*1000.75)+of.input.V[12].X)} {0.}
(assert (>= (+ (* sc_109 1000.75) of_109) 0.))
; 
; >=  {((sc.input.V[12].O*1000.75)+of.input.V[12].O)} {3300.}
(assert (<= (+ (* sc_110 1000.75) of_110) 3300.))
; 
; <=  {((sc.input.V[12].O*1000.75)+of.input.V[12].O)} {0.}
(assert (>= (+ (* sc_110 1000.75) of_110) 0.))
(declare-fun sc_111 () Real)
(assert (> sc_111 1e-08))
(declare-fun of_111 () Real)
(declare-fun sc_112 () Real)
(assert (> sc_112 1e-08))
(declare-fun of_112 () Real)
; 
; =  {sc.input.V[9].O} {sc.input.V[9].X}
(assert (= sc_112 sc_111))
; 
; =  {of.input.V[9].O} {of.input.V[9].X}
(assert (= of_112 of_111))
; 
; >=  {((sc.input.V[9].X*-1.)+of.input.V[9].X)} {3300.}
(assert (<= (+ (* sc_111 -1.) of_111) 3300.))
; 
; <=  {((sc.input.V[9].X*-1.)+of.input.V[9].X)} {0.}
(assert (>= (+ (* sc_111 -1.) of_111) 0.))
; 
; >=  {((sc.input.V[9].O*-1.)+of.input.V[9].O)} {3300.}
(assert (<= (+ (* sc_112 -1.) of_112) 3300.))
; 
; <=  {((sc.input.V[9].O*-1.)+of.input.V[9].O)} {0.}
(assert (>= (+ (* sc_112 -1.) of_112) 0.))
(declare-fun sc_113 () Real)
(assert (> sc_113 1e-08))
(declare-fun of_113 () Real)
(declare-fun sc_114 () Real)
(assert (> sc_114 1e-08))
(declare-fun of_114 () Real)
; 
; =  {sc.input.V[0].O} {sc.input.V[0].X}
(assert (= sc_114 sc_113))
; 
; =  {of.input.V[0].O} {of.input.V[0].X}
(assert (= of_114 of_113))
(declare-fun slbot_113 () Real)
(declare-fun sltop_113 () Real)
; 
; =  {(((sc.input.V[0].X*0.)+of.input.V[0].X)+sl.min.input.V[0].X)} {0.}
(assert (= (+ (+ (* sc_113 0.) of_113) slbot_113) 0.))
; 
; =  {(((sc.input.V[0].X*0.6)+of.input.V[0].X)+sl.max.input.V[0].X)} {3300.}
(assert (= (+ (+ (* sc_113 0.6) of_113) sltop_113) 3300.))
(declare-fun slbot_114 () Real)
(declare-fun sltop_114 () Real)
; 
; =  {(((sc.input.V[0].O*0.)+of.input.V[0].O)+sl.min.input.V[0].O)} {0.}
(assert (= (+ (+ (* sc_114 0.) of_114) slbot_114) 0.))
; 
; =  {(((sc.input.V[0].O*0.6)+of.input.V[0].O)+sl.max.input.V[0].O)} {3300.}
(assert (= (+ (+ (* sc_114 0.6) of_114) sltop_114) 3300.))
(declare-fun sc_115 () Real)
(assert (> sc_115 1e-08))
(declare-fun of_115 () Real)
(declare-fun sc_116 () Real)
(assert (> sc_116 1e-08))
(declare-fun of_116 () Real)
; 
; =  {sc.input.V[11].O} {sc.input.V[11].X}
(assert (= sc_116 sc_115))
; 
; =  {of.input.V[11].O} {of.input.V[11].X}
(assert (= of_116 of_115))
; 
; >=  {((sc.input.V[11].X*4.)+of.input.V[11].X)} {3300.}
(assert (<= (+ (* sc_115 4.) of_115) 3300.))
; 
; <=  {((sc.input.V[11].X*4.)+of.input.V[11].X)} {0.}
(assert (>= (+ (* sc_115 4.) of_115) 0.))
; 
; >=  {((sc.input.V[11].O*4.)+of.input.V[11].O)} {3300.}
(assert (<= (+ (* sc_116 4.) of_116) 3300.))
; 
; <=  {((sc.input.V[11].O*4.)+of.input.V[11].O)} {0.}
(assert (>= (+ (* sc_116 4.) of_116) 0.))
(declare-fun sc_117 () Real)
(assert (> sc_117 1e-08))
(declare-fun of_117 () Real)
(declare-fun sc_118 () Real)
(assert (> sc_118 1e-08))
(declare-fun of_118 () Real)
; 
; =  {sc.input.V[10].O} {sc.input.V[10].X}
(assert (= sc_118 sc_117))
; 
; =  {of.input.V[10].O} {of.input.V[10].X}
(assert (= of_118 of_117))
; 
; >=  {((sc.input.V[10].X*4.)+of.input.V[10].X)} {3300.}
(assert (<= (+ (* sc_117 4.) of_117) 3300.))
; 
; <=  {((sc.input.V[10].X*4.)+of.input.V[10].X)} {0.}
(assert (>= (+ (* sc_117 4.) of_117) 0.))
; 
; >=  {((sc.input.V[10].O*4.)+of.input.V[10].O)} {3300.}
(assert (<= (+ (* sc_118 4.) of_118) 3300.))
; 
; <=  {((sc.input.V[10].O*4.)+of.input.V[10].O)} {0.}
(assert (>= (+ (* sc_118 4.) of_118) 0.))
(declare-fun sc_119 () Real)
(assert (> sc_119 1e-08))
(declare-fun of_119 () Real)
(declare-fun sc_120 () Real)
(assert (> sc_120 1e-08))
(declare-fun of_120 () Real)
; 
; =  {sc.input.V[15].O} {sc.input.V[15].X}
(assert (= sc_120 sc_119))
; 
; =  {of.input.V[15].O} {of.input.V[15].X}
(assert (= of_120 of_119))
; 
; >=  {((sc.input.V[15].X*1.)+of.input.V[15].X)} {3300.}
(assert (<= (+ (* sc_119 1.) of_119) 3300.))
; 
; <=  {((sc.input.V[15].X*1.)+of.input.V[15].X)} {0.}
(assert (>= (+ (* sc_119 1.) of_119) 0.))
; 
; >=  {((sc.input.V[15].O*1.)+of.input.V[15].O)} {3300.}
(assert (<= (+ (* sc_120 1.) of_120) 3300.))
; 
; <=  {((sc.input.V[15].O*1.)+of.input.V[15].O)} {0.}
(assert (>= (+ (* sc_120 1.) of_120) 0.))
(declare-fun sc_121 () Real)
(assert (> sc_121 1e-08))
(declare-fun of_121 () Real)
(declare-fun sc_122 () Real)
(assert (> sc_122 1e-08))
(declare-fun of_122 () Real)
; 
; =  {sc.input.V[6].O} {sc.input.V[6].X}
(assert (= sc_122 sc_121))
; 
; =  {of.input.V[6].O} {of.input.V[6].X}
(assert (= of_122 of_121))
; 
; >=  {((sc.input.V[6].X*0.)+of.input.V[6].X)} {3300.}
(assert (<= (+ (* sc_121 0.) of_121) 3300.))
; 
; <=  {((sc.input.V[6].X*0.)+of.input.V[6].X)} {0.}
(assert (>= (+ (* sc_121 0.) of_121) 0.))
; 
; >=  {((sc.input.V[6].O*0.)+of.input.V[6].O)} {3300.}
(assert (<= (+ (* sc_122 0.) of_122) 3300.))
; 
; <=  {((sc.input.V[6].O*0.)+of.input.V[6].O)} {0.}
(assert (>= (+ (* sc_122 0.) of_122) 0.))
(declare-fun sc_123 () Real)
(assert (> sc_123 1e-08))
(declare-fun of_123 () Real)
(declare-fun sc_124 () Real)
(assert (> sc_124 1e-08))
(declare-fun of_124 () Real)
; 
; =  {sc.input.V[14].O} {sc.input.V[14].X}
(assert (= sc_124 sc_123))
; 
; =  {of.input.V[14].O} {of.input.V[14].X}
(assert (= of_124 of_123))
; 
; >=  {((sc.input.V[14].X*1.)+of.input.V[14].X)} {3300.}
(assert (<= (+ (* sc_123 1.) of_123) 3300.))
; 
; <=  {((sc.input.V[14].X*1.)+of.input.V[14].X)} {0.}
(assert (>= (+ (* sc_123 1.) of_123) 0.))
; 
; >=  {((sc.input.V[14].O*1.)+of.input.V[14].O)} {3300.}
(assert (<= (+ (* sc_124 1.) of_124) 3300.))
; 
; <=  {((sc.input.V[14].O*1.)+of.input.V[14].O)} {0.}
(assert (>= (+ (* sc_124 1.) of_124) 0.))
(declare-fun sc_125 () Real)
(assert (> sc_125 1e-08))
(declare-fun of_125 () Real)
(declare-fun sc_126 () Real)
(assert (> sc_126 1e-08))
(declare-fun of_126 () Real)
; 
; =  {sc.input.V[16].O} {sc.input.V[16].X}
(assert (= sc_126 sc_125))
; 
; =  {of.input.V[16].O} {of.input.V[16].X}
(assert (= of_126 of_125))
; 
; >=  {((sc.input.V[16].X*1.)+of.input.V[16].X)} {3300.}
(assert (<= (+ (* sc_125 1.) of_125) 3300.))
; 
; <=  {((sc.input.V[16].X*1.)+of.input.V[16].X)} {0.}
(assert (>= (+ (* sc_125 1.) of_125) 0.))
; 
; >=  {((sc.input.V[16].O*1.)+of.input.V[16].O)} {3300.}
(assert (<= (+ (* sc_126 1.) of_126) 3300.))
; 
; <=  {((sc.input.V[16].O*1.)+of.input.V[16].O)} {0.}
(assert (>= (+ (* sc_126 1.) of_126) 0.))
(declare-fun sc_127 () Real)
(assert (> sc_127 1e-08))
(declare-fun of_127 () Real)
(declare-fun sc_128 () Real)
(assert (> sc_128 1e-08))
(declare-fun of_128 () Real)
; 
; =  {sc.input.V[3].O} {sc.input.V[3].X}
(assert (= sc_128 sc_127))
; 
; =  {of.input.V[3].O} {of.input.V[3].X}
(assert (= of_128 of_127))
; 
; >=  {((sc.input.V[3].X*0.)+of.input.V[3].X)} {3300.}
(assert (<= (+ (* sc_127 0.) of_127) 3300.))
; 
; <=  {((sc.input.V[3].X*0.)+of.input.V[3].X)} {0.}
(assert (>= (+ (* sc_127 0.) of_127) 0.))
; 
; >=  {((sc.input.V[3].O*0.)+of.input.V[3].O)} {3300.}
(assert (<= (+ (* sc_128 0.) of_128) 3300.))
; 
; <=  {((sc.input.V[3].O*0.)+of.input.V[3].O)} {0.}
(assert (>= (+ (* sc_128 0.) of_128) 0.))
(declare-fun sc_129 () Real)
(assert (> sc_129 1e-08))
(declare-fun of_129 () Real)
(declare-fun sc_130 () Real)
(assert (> sc_130 1e-08))
(declare-fun of_130 () Real)
; 
; =  {sc.input.V[4].O} {sc.input.V[4].X}
(assert (= sc_130 sc_129))
; 
; =  {of.input.V[4].O} {of.input.V[4].X}
(assert (= of_130 of_129))
; 
; >=  {((sc.input.V[4].X*0.)+of.input.V[4].X)} {3300.}
(assert (<= (+ (* sc_129 0.) of_129) 3300.))
; 
; <=  {((sc.input.V[4].X*0.)+of.input.V[4].X)} {0.}
(assert (>= (+ (* sc_129 0.) of_129) 0.))
; 
; >=  {((sc.input.V[4].O*0.)+of.input.V[4].O)} {3300.}
(assert (<= (+ (* sc_130 0.) of_130) 3300.))
; 
; <=  {((sc.input.V[4].O*0.)+of.input.V[4].O)} {0.}
(assert (>= (+ (* sc_130 0.) of_130) 0.))
(declare-fun sc_131 () Real)
(assert (> sc_131 1e-08))
(declare-fun of_131 () Real)
(declare-fun sc_132 () Real)
(assert (> sc_132 1e-08))
(declare-fun of_132 () Real)
; 
; =  {sc.input.V[5].O} {sc.input.V[5].X}
(assert (= sc_132 sc_131))
; 
; =  {of.input.V[5].O} {of.input.V[5].X}
(assert (= of_132 of_131))
; 
; >=  {((sc.input.V[5].X*0.)+of.input.V[5].X)} {3300.}
(assert (<= (+ (* sc_131 0.) of_131) 3300.))
; 
; <=  {((sc.input.V[5].X*0.)+of.input.V[5].X)} {0.}
(assert (>= (+ (* sc_131 0.) of_131) 0.))
; 
; >=  {((sc.input.V[5].O*0.)+of.input.V[5].O)} {3300.}
(assert (<= (+ (* sc_132 0.) of_132) 3300.))
; 
; <=  {((sc.input.V[5].O*0.)+of.input.V[5].O)} {0.}
(assert (>= (+ (* sc_132 0.) of_132) 0.))
(declare-fun sc_133 () Real)
(assert (> sc_133 1e-08))
(declare-fun of_133 () Real)
(declare-fun sc_134 () Real)
(assert (> sc_134 1e-08))
(declare-fun of_134 () Real)
; 
; =  {sc.input.V[1].O} {sc.input.V[1].X}
(assert (= sc_134 sc_133))
; 
; =  {of.input.V[1].O} {of.input.V[1].X}
(assert (= of_134 of_133))
; 
; >=  {((sc.input.V[1].X*2.)+of.input.V[1].X)} {3300.}
(assert (<= (+ (* sc_133 2.) of_133) 3300.))
; 
; <=  {((sc.input.V[1].X*2.)+of.input.V[1].X)} {0.}
(assert (>= (+ (* sc_133 2.) of_133) 0.))
; 
; >=  {((sc.input.V[1].O*2.)+of.input.V[1].O)} {3300.}
(assert (<= (+ (* sc_134 2.) of_134) 3300.))
; 
; <=  {((sc.input.V[1].O*2.)+of.input.V[1].O)} {0.}
(assert (>= (+ (* sc_134 2.) of_134) 0.))
(declare-fun sc_135 () Real)
(assert (> sc_135 1e-08))
(declare-fun of_135 () Real)
(declare-fun sc_136 () Real)
(assert (> sc_136 1e-08))
(declare-fun of_136 () Real)
; 
; =  {sc.input.V[17].O} {sc.input.V[17].X}
(assert (= sc_136 sc_135))
; 
; =  {of.input.V[17].O} {of.input.V[17].X}
(assert (= of_136 of_135))
; 
; >=  {((sc.input.V[17].X*1.)+of.input.V[17].X)} {3300.}
(assert (<= (+ (* sc_135 1.) of_135) 3300.))
; 
; <=  {((sc.input.V[17].X*1.)+of.input.V[17].X)} {0.}
(assert (>= (+ (* sc_135 1.) of_135) 0.))
; 
; >=  {((sc.input.V[17].O*1.)+of.input.V[17].O)} {3300.}
(assert (<= (+ (* sc_136 1.) of_136) 3300.))
; 
; <=  {((sc.input.V[17].O*1.)+of.input.V[17].O)} {0.}
(assert (>= (+ (* sc_136 1.) of_136) 0.))
(declare-fun sc_137 () Real)
(assert (> sc_137 1e-08))
(declare-fun of_137 () Real)
(declare-fun sc_138 () Real)
(assert (> sc_138 1e-08))
(declare-fun of_138 () Real)
; 
; =  {sc.input.V[18].O} {sc.input.V[18].X}
(assert (= sc_138 sc_137))
; 
; =  {of.input.V[18].O} {of.input.V[18].X}
(assert (= of_138 of_137))
; 
; >=  {((sc.input.V[18].X*1.)+of.input.V[18].X)} {3300.}
(assert (<= (+ (* sc_137 1.) of_137) 3300.))
; 
; <=  {((sc.input.V[18].X*1.)+of.input.V[18].X)} {0.}
(assert (>= (+ (* sc_137 1.) of_137) 0.))
; 
; >=  {((sc.input.V[18].O*1.)+of.input.V[18].O)} {3300.}
(assert (<= (+ (* sc_138 1.) of_138) 3300.))
; 
; <=  {((sc.input.V[18].O*1.)+of.input.V[18].O)} {0.}
(assert (>= (+ (* sc_138 1.) of_138) 0.))
(declare-fun sc_139 () Real)
(assert (> sc_139 1e-08))
(declare-fun of_139 () Real)
(declare-fun sc_140 () Real)
(assert (> sc_140 1e-08))
(declare-fun of_140 () Real)
(declare-fun sc_141 () Real)
(assert (> sc_141 1e-08))
(declare-fun of_141 () Real)
; no offset
(assert (= of_140 0.))
; no offset
(assert (= of_139 0.))
; 
; =  {sc.itov[13].Y} {(sc.itov[13].K*sc.itov[13].X)}
(assert (= sc_141 (* sc_140 sc_139)))
; 
; =  {of.itov[13].Y} {0.}
(assert (= of_141 0.))
; 
; >=  {((sc.itov[13].X*1.)+of.itov[13].X)} {10.}
(assert (<= (+ (* sc_139 1.) of_139) 10.))
; 
; <=  {((sc.itov[13].X*1.)+of.itov[13].X)} {0.0001}
(assert (>= (+ (* sc_139 1.) of_139) 0.0001))
(declare-fun slbot_140 () Real)
(declare-fun sltop_140 () Real)
; 
; =  {(((sc.itov[13].K*0.154756521331)+of.itov[13].K)+sl.min.itov[13].K)} {1.}
(assert (= (+ (+ (* sc_140 0.154756521331) of_140) slbot_140) 1.))
; 
; =  {(((sc.itov[13].K*0.15625)+of.itov[13].K)+sl.max.itov[13].K)} {330.}
(assert (= (+ (+ (* sc_140 0.15625) of_140) sltop_140) 330.))
(declare-fun slbot_141 () Real)
(declare-fun sltop_141 () Real)
; 
; =  {(((sc.itov[13].Y*0.154756521331)+of.itov[13].Y)+sl.min.itov[13].Y)} {0.0001}
(assert (= (+ (+ (* sc_141 0.154756521331) of_141) slbot_141) 0.0001))
; 
; =  {(((sc.itov[13].Y*0.15625)+of.itov[13].Y)+sl.max.itov[13].Y)} {3300.}
(assert (= (+ (+ (* sc_141 0.15625) of_141) sltop_141) 3300.))
(declare-fun sc_142 () Real)
(assert (> sc_142 1e-08))
(declare-fun of_142 () Real)
(declare-fun sc_143 () Real)
(assert (> sc_143 1e-08))
(declare-fun of_143 () Real)
(declare-fun sc_144 () Real)
(assert (> sc_144 1e-08))
(declare-fun of_144 () Real)
; no offset
(assert (= of_143 0.))
; no offset
(assert (= of_142 0.))
; 
; =  {sc.itov[12].Y} {(sc.itov[12].K*sc.itov[12].X)}
(assert (= sc_144 (* sc_143 sc_142)))
; 
; =  {of.itov[12].Y} {0.}
(assert (= of_144 0.))
; 
; >=  {((sc.itov[12].X*4000.)+of.itov[12].X)} {10.}
(assert (<= (+ (* sc_142 4000.) of_142) 10.))
; 
; <=  {((sc.itov[12].X*4000.)+of.itov[12].X)} {0.0001}
(assert (>= (+ (* sc_142 4000.) of_142) 0.0001))
(declare-fun slbot_144 () Real)
(declare-fun sltop_144 () Real)
; 
; =  {(((sc.itov[12].Y*61.4415124065)+of.itov[12].Y)+sl.min.itov[12].Y)} {0.0001}
(assert (= (+ (+ (* sc_144 61.4415124065) of_144) slbot_144) 0.0001))
; 
; =  {(((sc.itov[12].Y*62.4)+of.itov[12].Y)+sl.max.itov[12].Y)} {3300.}
(assert (= (+ (+ (* sc_144 62.4) of_144) sltop_144) 3300.))
(declare-fun slbot_143 () Real)
(declare-fun sltop_143 () Real)
; 
; =  {(((sc.itov[12].K*0.0153603781016)+of.itov[12].K)+sl.min.itov[12].K)} {1.}
(assert (= (+ (+ (* sc_143 0.0153603781016) of_143) slbot_143) 1.))
; 
; =  {(((sc.itov[12].K*0.0156)+of.itov[12].K)+sl.max.itov[12].K)} {330.}
(assert (= (+ (+ (* sc_143 0.0156) of_143) sltop_143) 330.))
(declare-fun slbot_144 () Real)
(declare-fun sltop_144 () Real)
; 
; =  {(((sc.itov[12].Y*61.4415124065)+of.itov[12].Y)+sl.min.itov[12].Y)} {0.0001}
(assert (= (+ (+ (* sc_144 61.4415124065) of_144) slbot_144) 0.0001))
; 
; =  {(((sc.itov[12].Y*62.4)+of.itov[12].Y)+sl.max.itov[12].Y)} {3300.}
(assert (= (+ (+ (* sc_144 62.4) of_144) sltop_144) 3300.))
(declare-fun sc_145 () Real)
(assert (> sc_145 1e-08))
(declare-fun of_145 () Real)
(declare-fun sc_146 () Real)
(assert (> sc_146 1e-08))
(declare-fun of_146 () Real)
(declare-fun sc_147 () Real)
(assert (> sc_147 1e-08))
(declare-fun of_147 () Real)
; no offset
(assert (= of_146 0.))
; no offset
(assert (= of_145 0.))
; 
; =  {sc.itov[6].Y} {(sc.itov[6].K*sc.itov[6].X)}
(assert (= sc_147 (* sc_146 sc_145)))
; 
; =  {of.itov[6].Y} {0.}
(assert (= of_147 0.))
(declare-fun slbot_145 () Real)
(declare-fun sltop_145 () Real)
; 
; =  {(((sc.itov[6].X*0.)+of.itov[6].X)+sl.min.itov[6].X)} {0.0001}
(assert (= (+ (+ (* sc_145 0.) of_145) slbot_145) 0.0001))
; 
; =  {(((sc.itov[6].X*103.621514368)+of.itov[6].X)+sl.max.itov[6].X)} {10.}
(assert (= (+ (+ (* sc_145 103.621514368) of_145) sltop_145) 10.))
(declare-fun slbot_147 () Real)
(declare-fun sltop_147 () Real)
; 
; =  {(((sc.itov[6].Y*0.)+of.itov[6].Y)+sl.min.itov[6].Y)} {0.0001}
(assert (= (+ (+ (* sc_147 0.) of_147) slbot_147) 0.0001))
; 
; =  {(((sc.itov[6].Y*103.621514368)+of.itov[6].Y)+sl.max.itov[6].Y)} {3300.}
(assert (= (+ (+ (* sc_147 103.621514368) of_147) sltop_147) 3300.))
; 
; >=  {((sc.itov[6].K*1.)+of.itov[6].K)} {330.}
(assert (<= (+ (* sc_146 1.) of_146) 330.))
; 
; <=  {((sc.itov[6].K*1.)+of.itov[6].K)} {1.}
(assert (>= (+ (* sc_146 1.) of_146) 1.))
(declare-fun slbot_147 () Real)
(declare-fun sltop_147 () Real)
; 
; =  {(((sc.itov[6].Y*0.)+of.itov[6].Y)+sl.min.itov[6].Y)} {0.0001}
(assert (= (+ (+ (* sc_147 0.) of_147) slbot_147) 0.0001))
; 
; =  {(((sc.itov[6].Y*103.621514368)+of.itov[6].Y)+sl.max.itov[6].Y)} {3300.}
(assert (= (+ (+ (* sc_147 103.621514368) of_147) sltop_147) 3300.))
(declare-fun sc_148 () Real)
(assert (> sc_148 1e-08))
(declare-fun of_148 () Real)
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
; 
; =  {sc.iadd[2].A} {sc.iadd[2].B}
(assert (= sc_150 sc_151))
; 
; =  {sc.iadd[2].A} {sc.iadd[2].C} {sc.iadd[2].D}
(assert (and (= sc_150 sc_149) (= sc_150 sc_148)))
; 
; =  {sc.iadd[2].OUT} {sc.iadd[2].A}
(assert (= sc_152 sc_150))
; 
; =  {of.iadd[2].OUT} {((of.iadd[2].A+of.iadd[2].B)-of.iadd[2].C-of.iadd[2].D)}
(assert (= of_152 (- (+ of_150 of_151) (+ of_149 of_148))))
; 
; >=  {((sc.iadd[2].D*0.)+of.iadd[2].D)} {5.}
(assert (<= (+ (* sc_148 0.) of_148) 5.))
; 
; <=  {((sc.iadd[2].D*0.)+of.iadd[2].D)} {0.}
(assert (>= (+ (* sc_148 0.) of_148) 0.))
; 
; >=  {((sc.iadd[2].C*0.)+of.iadd[2].C)} {5.}
(assert (<= (+ (* sc_149 0.) of_149) 5.))
; 
; <=  {((sc.iadd[2].C*0.)+of.iadd[2].C)} {0.}
(assert (>= (+ (* sc_149 0.) of_149) 0.))
(declare-fun slbot_152 () Real)
(declare-fun sltop_152 () Real)
; 
; =  {(((sc.iadd[2].OUT*0.)+of.iadd[2].OUT)+sl.min.iadd[2].OUT)} {-10.}
(assert (= (+ (+ (* sc_152 0.) of_152) slbot_152) -10.))
; 
; =  {(((sc.iadd[2].OUT*0.00965050555471)+of.iadd[2].OUT)+sl.max.iadd[2].OUT)} {10.}
(assert (= (+ (+ (* sc_152 0.00965050555471) of_152) sltop_152) 10.))
; 
; >=  {((sc.iadd[2].A*0.)+of.iadd[2].A)} {5.}
(assert (<= (+ (* sc_150 0.) of_150) 5.))
; 
; <=  {((sc.iadd[2].A*0.)+of.iadd[2].A)} {0.}
(assert (>= (+ (* sc_150 0.) of_150) 0.))
(declare-fun slbot_151 () Real)
(declare-fun sltop_151 () Real)
; 
; =  {(((sc.iadd[2].B*0.)+of.iadd[2].B)+sl.min.iadd[2].B)} {0.}
(assert (= (+ (+ (* sc_151 0.) of_151) slbot_151) 0.))
; 
; =  {(((sc.iadd[2].B*0.00965050555471)+of.iadd[2].B)+sl.max.iadd[2].B)} {5.}
(assert (= (+ (+ (* sc_151 0.00965050555471) of_151) sltop_151) 5.))
(declare-fun slbot_152 () Real)
(declare-fun sltop_152 () Real)
; 
; =  {(((sc.iadd[2].OUT*0.)+of.iadd[2].OUT)+sl.min.iadd[2].OUT)} {-10.}
(assert (= (+ (+ (* sc_152 0.) of_152) slbot_152) -10.))
; 
; =  {(((sc.iadd[2].OUT*0.00965050555471)+of.iadd[2].OUT)+sl.max.iadd[2].OUT)} {10.}
(assert (= (+ (+ (* sc_152 0.00965050555471) of_152) sltop_152) 10.))
(declare-fun sc_153 () Real)
(assert (> sc_153 1e-08))
(declare-fun of_153 () Real)
(declare-fun sc_154 () Real)
(assert (> sc_154 1e-08))
(declare-fun of_154 () Real)
(declare-fun sc_155 () Real)
(assert (> sc_155 1e-08))
(declare-fun of_155 () Real)
(declare-fun sc_156 () Real)
(assert (> sc_156 1e-08))
(declare-fun of_156 () Real)
(declare-fun sc_157 () Real)
(assert (> sc_157 1e-08))
(declare-fun of_157 () Real)
; 
; =  {sc.iadd[8].A} {sc.iadd[8].B}
(assert (= sc_155 sc_156))
; 
; =  {sc.iadd[8].A} {sc.iadd[8].C} {sc.iadd[8].D}
(assert (and (= sc_155 sc_154) (= sc_155 sc_153)))
; 
; =  {sc.iadd[8].OUT} {sc.iadd[8].A}
(assert (= sc_157 sc_155))
; 
; =  {of.iadd[8].OUT} {((of.iadd[8].A+of.iadd[8].B)-of.iadd[8].C-of.iadd[8].D)}
(assert (= of_157 (- (+ of_155 of_156) (+ of_154 of_153))))
(declare-fun slbot_153 () Real)
(declare-fun sltop_153 () Real)
; 
; =  {(((sc.iadd[8].D*-0.15625)+of.iadd[8].D)+sl.min.iadd[8].D)} {0.}
(assert (= (+ (+ (* sc_153 -0.15625) of_153) slbot_153) 0.))
; 
; =  {(((sc.iadd[8].D*0.)+of.iadd[8].D)+sl.max.iadd[8].D)} {5.}
(assert (= (+ (+ (* sc_153 0.) of_153) sltop_153) 5.))
; 
; >=  {((sc.iadd[8].C*1.)+of.iadd[8].C)} {5.}
(assert (<= (+ (* sc_154 1.) of_154) 5.))
; 
; <=  {((sc.iadd[8].C*1.)+of.iadd[8].C)} {0.}
(assert (>= (+ (* sc_154 1.) of_154) 0.))
(declare-fun slbot_157 () Real)
(declare-fun sltop_157 () Real)
; 
; =  {(((sc.iadd[8].OUT*-1.)+of.iadd[8].OUT)+sl.min.iadd[8].OUT)} {-10.}
(assert (= (+ (+ (* sc_157 -1.) of_157) slbot_157) -10.))
; 
; =  {(((sc.iadd[8].OUT*-0.84375)+of.iadd[8].OUT)+sl.max.iadd[8].OUT)} {10.}
(assert (= (+ (+ (* sc_157 -0.84375) of_157) sltop_157) 10.))
; 
; >=  {((sc.iadd[8].A*0.)+of.iadd[8].A)} {5.}
(assert (<= (+ (* sc_155 0.) of_155) 5.))
; 
; <=  {((sc.iadd[8].A*0.)+of.iadd[8].A)} {0.}
(assert (>= (+ (* sc_155 0.) of_155) 0.))
; 
; >=  {((sc.iadd[8].B*0.)+of.iadd[8].B)} {5.}
(assert (<= (+ (* sc_156 0.) of_156) 5.))
; 
; <=  {((sc.iadd[8].B*0.)+of.iadd[8].B)} {0.}
(assert (>= (+ (* sc_156 0.) of_156) 0.))
(declare-fun slbot_157 () Real)
(declare-fun sltop_157 () Real)
; 
; =  {(((sc.iadd[8].OUT*-1.)+of.iadd[8].OUT)+sl.min.iadd[8].OUT)} {-10.}
(assert (= (+ (+ (* sc_157 -1.) of_157) slbot_157) -10.))
; 
; =  {(((sc.iadd[8].OUT*-0.84375)+of.iadd[8].OUT)+sl.max.iadd[8].OUT)} {10.}
(assert (= (+ (+ (* sc_157 -0.84375) of_157) sltop_157) 10.))
(declare-fun sc_158 () Real)
(assert (> sc_158 1e-08))
(declare-fun of_158 () Real)
(declare-fun sc_159 () Real)
(assert (> sc_159 1e-08))
(declare-fun of_159 () Real)
(declare-fun sc_160 () Real)
(assert (> sc_160 1e-08))
(declare-fun of_160 () Real)
(declare-fun sc_161 () Real)
(assert (> sc_161 1e-08))
(declare-fun of_161 () Real)
(declare-fun sc_162 () Real)
(assert (> sc_162 1e-08))
(declare-fun of_162 () Real)
; 
; =  {sc.iadd[12].A} {sc.iadd[12].B}
(assert (= sc_160 sc_161))
; 
; =  {sc.iadd[12].A} {sc.iadd[12].C} {sc.iadd[12].D}
(assert (and (= sc_160 sc_159) (= sc_160 sc_158)))
; 
; =  {sc.iadd[12].OUT} {sc.iadd[12].A}
(assert (= sc_162 sc_160))
; 
; =  {of.iadd[12].OUT} {((of.iadd[12].A+of.iadd[12].B)-of.iadd[12].C-of.iadd[12].D)}
(assert (= of_162 (- (+ of_160 of_161) (+ of_159 of_158))))
; 
; >=  {((sc.iadd[12].D*0.)+of.iadd[12].D)} {5.}
(assert (<= (+ (* sc_158 0.) of_158) 5.))
; 
; <=  {((sc.iadd[12].D*0.)+of.iadd[12].D)} {0.}
(assert (>= (+ (* sc_158 0.) of_158) 0.))
; 
; >=  {((sc.iadd[12].C*0.)+of.iadd[12].C)} {5.}
(assert (<= (+ (* sc_159 0.) of_159) 5.))
; 
; <=  {((sc.iadd[12].C*0.)+of.iadd[12].C)} {0.}
(assert (>= (+ (* sc_159 0.) of_159) 0.))
; 
; >=  {((sc.iadd[12].A*0.)+of.iadd[12].A)} {5.}
(assert (<= (+ (* sc_160 0.) of_160) 5.))
; 
; <=  {((sc.iadd[12].A*0.)+of.iadd[12].A)} {0.}
(assert (>= (+ (* sc_160 0.) of_160) 0.))
(declare-fun slbot_161 () Real)
(declare-fun sltop_161 () Real)
; 
; =  {(((sc.iadd[12].B*0.)+of.iadd[12].B)+sl.min.iadd[12].B)} {0.}
(assert (= (+ (+ (* sc_161 0.) of_161) slbot_161) 0.))
; 
; =  {(((sc.iadd[12].B*0.0156)+of.iadd[12].B)+sl.max.iadd[12].B)} {5.}
(assert (= (+ (+ (* sc_161 0.0156) of_161) sltop_161) 5.))
(declare-fun slbot_162 () Real)
(declare-fun sltop_162 () Real)
; 
; =  {(((sc.iadd[12].OUT*0.)+of.iadd[12].OUT)+sl.min.iadd[12].OUT)} {-10.}
(assert (= (+ (+ (* sc_162 0.) of_162) slbot_162) -10.))
; 
; =  {(((sc.iadd[12].OUT*0.0156)+of.iadd[12].OUT)+sl.max.iadd[12].OUT)} {10.}
(assert (= (+ (+ (* sc_162 0.0156) of_162) sltop_162) 10.))
(declare-fun sc_163 () Real)
(assert (> sc_163 1e-08))
(declare-fun of_163 () Real)
(declare-fun sc_164 () Real)
(assert (> sc_164 1e-08))
(declare-fun of_164 () Real)
(declare-fun sc_165 () Real)
(assert (> sc_165 1e-08))
(declare-fun of_165 () Real)
(declare-fun sc_166 () Real)
(assert (> sc_166 1e-08))
(declare-fun of_166 () Real)
(declare-fun sc_167 () Real)
(assert (> sc_167 1e-08))
(declare-fun of_167 () Real)
; 
; =  {sc.iadd[11].A} {sc.iadd[11].B}
(assert (= sc_165 sc_166))
; 
; =  {sc.iadd[11].A} {sc.iadd[11].C} {sc.iadd[11].D}
(assert (and (= sc_165 sc_164) (= sc_165 sc_163)))
; 
; =  {sc.iadd[11].OUT} {sc.iadd[11].A}
(assert (= sc_167 sc_165))
; 
; =  {of.iadd[11].OUT} {((of.iadd[11].A+of.iadd[11].B)-of.iadd[11].C-of.iadd[11].D)}
(assert (= of_167 (- (+ of_165 of_166) (+ of_164 of_163))))
; 
; >=  {((sc.iadd[11].D*0.)+of.iadd[11].D)} {5.}
(assert (<= (+ (* sc_163 0.) of_163) 5.))
; 
; <=  {((sc.iadd[11].D*0.)+of.iadd[11].D)} {0.}
(assert (>= (+ (* sc_163 0.) of_163) 0.))
; 
; >=  {((sc.iadd[11].C*0.)+of.iadd[11].C)} {5.}
(assert (<= (+ (* sc_164 0.) of_164) 5.))
; 
; <=  {((sc.iadd[11].C*0.)+of.iadd[11].C)} {0.}
(assert (>= (+ (* sc_164 0.) of_164) 0.))
(declare-fun slbot_167 () Real)
(declare-fun sltop_167 () Real)
; 
; =  {(((sc.iadd[11].OUT*0.)+of.iadd[11].OUT)+sl.min.iadd[11].OUT)} {-10.}
(assert (= (+ (+ (* sc_167 0.) of_167) slbot_167) -10.))
; 
; =  {(((sc.iadd[11].OUT*1.66666666667)+of.iadd[11].OUT)+sl.max.iadd[11].OUT)} {10.}
(assert (= (+ (+ (* sc_167 1.66666666667) of_167) sltop_167) 10.))
; 
; >=  {((sc.iadd[11].A*0.)+of.iadd[11].A)} {5.}
(assert (<= (+ (* sc_165 0.) of_165) 5.))
; 
; <=  {((sc.iadd[11].A*0.)+of.iadd[11].A)} {0.}
(assert (>= (+ (* sc_165 0.) of_165) 0.))
(declare-fun slbot_166 () Real)
(declare-fun sltop_166 () Real)
; 
; =  {(((sc.iadd[11].B*0.)+of.iadd[11].B)+sl.min.iadd[11].B)} {0.}
(assert (= (+ (+ (* sc_166 0.) of_166) slbot_166) 0.))
; 
; =  {(((sc.iadd[11].B*1.66666666667)+of.iadd[11].B)+sl.max.iadd[11].B)} {5.}
(assert (= (+ (+ (* sc_166 1.66666666667) of_166) sltop_166) 5.))
(declare-fun slbot_167 () Real)
(declare-fun sltop_167 () Real)
; 
; =  {(((sc.iadd[11].OUT*0.)+of.iadd[11].OUT)+sl.min.iadd[11].OUT)} {-10.}
(assert (= (+ (+ (* sc_167 0.) of_167) slbot_167) -10.))
; 
; =  {(((sc.iadd[11].OUT*1.66666666667)+of.iadd[11].OUT)+sl.max.iadd[11].OUT)} {10.}
(assert (= (+ (+ (* sc_167 1.66666666667) of_167) sltop_167) 10.))
(declare-fun sc_168 () Real)
(assert (> sc_168 1e-08))
(declare-fun of_168 () Real)
(declare-fun sc_169 () Real)
(assert (> sc_169 1e-08))
(declare-fun of_169 () Real)
(declare-fun sc_170 () Real)
(assert (> sc_170 1e-08))
(declare-fun of_170 () Real)
(declare-fun sc_171 () Real)
(assert (> sc_171 1e-08))
(declare-fun of_171 () Real)
(declare-fun sc_172 () Real)
(assert (> sc_172 1e-08))
(declare-fun of_172 () Real)
; 
; =  {sc.iadd[3].A} {sc.iadd[3].B}
(assert (= sc_170 sc_171))
; 
; =  {sc.iadd[3].A} {sc.iadd[3].C} {sc.iadd[3].D}
(assert (and (= sc_170 sc_169) (= sc_170 sc_168)))
; 
; =  {sc.iadd[3].OUT} {sc.iadd[3].A}
(assert (= sc_172 sc_170))
; 
; =  {of.iadd[3].OUT} {((of.iadd[3].A+of.iadd[3].B)-of.iadd[3].C-of.iadd[3].D)}
(assert (= of_172 (- (+ of_170 of_171) (+ of_169 of_168))))
; 
; >=  {((sc.iadd[3].D*0.)+of.iadd[3].D)} {5.}
(assert (<= (+ (* sc_168 0.) of_168) 5.))
; 
; <=  {((sc.iadd[3].D*0.)+of.iadd[3].D)} {0.}
(assert (>= (+ (* sc_168 0.) of_168) 0.))
; 
; >=  {((sc.iadd[3].C*0.)+of.iadd[3].C)} {5.}
(assert (<= (+ (* sc_169 0.) of_169) 5.))
; 
; <=  {((sc.iadd[3].C*0.)+of.iadd[3].C)} {0.}
(assert (>= (+ (* sc_169 0.) of_169) 0.))
(declare-fun slbot_172 () Real)
(declare-fun sltop_172 () Real)
; 
; =  {(((sc.iadd[3].OUT*0.)+of.iadd[3].OUT)+sl.min.iadd[3].OUT)} {-10.}
(assert (= (+ (+ (* sc_172 0.) of_172) slbot_172) -10.))
; 
; =  {(((sc.iadd[3].OUT*0.00965050555471)+of.iadd[3].OUT)+sl.max.iadd[3].OUT)} {10.}
(assert (= (+ (+ (* sc_172 0.00965050555471) of_172) sltop_172) 10.))
; 
; >=  {((sc.iadd[3].A*0.)+of.iadd[3].A)} {5.}
(assert (<= (+ (* sc_170 0.) of_170) 5.))
; 
; <=  {((sc.iadd[3].A*0.)+of.iadd[3].A)} {0.}
(assert (>= (+ (* sc_170 0.) of_170) 0.))
(declare-fun slbot_171 () Real)
(declare-fun sltop_171 () Real)
; 
; =  {(((sc.iadd[3].B*0.)+of.iadd[3].B)+sl.min.iadd[3].B)} {0.}
(assert (= (+ (+ (* sc_171 0.) of_171) slbot_171) 0.))
; 
; =  {(((sc.iadd[3].B*0.00965050555471)+of.iadd[3].B)+sl.max.iadd[3].B)} {5.}
(assert (= (+ (+ (* sc_171 0.00965050555471) of_171) sltop_171) 5.))
(declare-fun slbot_172 () Real)
(declare-fun sltop_172 () Real)
; 
; =  {(((sc.iadd[3].OUT*0.)+of.iadd[3].OUT)+sl.min.iadd[3].OUT)} {-10.}
(assert (= (+ (+ (* sc_172 0.) of_172) slbot_172) -10.))
; 
; =  {(((sc.iadd[3].OUT*0.00965050555471)+of.iadd[3].OUT)+sl.max.iadd[3].OUT)} {10.}
(assert (= (+ (+ (* sc_172 0.00965050555471) of_172) sltop_172) 10.))
; 
; =  {sc.itov[12].Y} {sc.vadd[13].B}
(assert (= sc_144 sc_74))
; 
; =  {of.itov[12].Y} {of.vadd[13].B}
(assert (= of_144 of_74))
; 
; =  {sc.itov[13].Y} {sc.vgain[15].Z}
(assert (= sc_141 sc_2))
; 
; =  {of.itov[13].Y} {of.vgain[15].Z}
(assert (= of_141 of_2))
; 
; =  {sc.input.I[6].O} {sc.iadd[3].A}
(assert (= sc_41 sc_170))
; 
; =  {of.input.I[6].O} {of.iadd[3].A}
(assert (= of_41 of_170))
; 
; =  {sc.input.V[17].O} {sc.vtoi[9].X}
(assert (= sc_136 sc_84))
; 
; =  {of.input.V[17].O} {of.vtoi[9].X}
(assert (= of_136 of_84))
; 
; =  {sc.input.I[31].O} {sc.iadd[12].D}
(assert (= sc_29 sc_158))
; 
; =  {of.input.I[31].O} {of.iadd[12].D}
(assert (= of_29 of_158))
; 
; =  {sc.vadd[13].OUT2} {sc.output.V[0].X}
(assert (= sc_76 sc_66))
; 
; =  {of.vadd[13].OUT2} {of.output.V[0].X}
(assert (= of_76 of_66))
; 
; =  {sc.vadd[13].OUT2} {sc.vtoi[0].X}
(assert (= sc_76 sc_87))
; 
; =  {of.vadd[13].OUT2} {of.vtoi[0].X}
(assert (= of_76 of_87))
; 
; =  {sc.input.I[0].O} {sc.igenebind[1].Vmax}
(assert (= sc_33 sc_99))
; 
; =  {of.input.I[0].O} {of.igenebind[1].Vmax}
(assert (= of_33 of_99))
; 
; =  {sc.input.V[9].O} {sc.vtoi[0].K}
(assert (= sc_112 sc_88))
; 
; =  {of.input.V[9].O} {of.vtoi[0].K}
(assert (= of_112 of_88))
; 
; =  {sc.switch[7].PROD} {sc.itov[6].X}
(assert (= sc_12 sc_145))
; 
; =  {of.switch[7].PROD} {of.itov[6].X}
(assert (= of_12 of_145))
; 
; =  {sc.vgain[15].P} {sc.vadd[16].B}
(assert (= sc_3 sc_81))
; 
; =  {of.vgain[15].P} {of.vadd[16].B}
(assert (= of_3 of_81))
; 
; =  {sc.input.V[15].O} {sc.vgain[5].Y}
(assert (= sc_120 sc_5))
; 
; =  {of.input.V[15].O} {of.vgain[5].Y}
(assert (= of_120 of_5))
; 
; =  {sc.input.I[32].O} {sc.iadd[12].C}
(assert (= sc_61 sc_159))
; 
; =  {of.input.I[32].O} {of.iadd[12].C}
(assert (= of_61 of_159))
; 
; =  {sc.input.I[18].O} {sc.iadd[8].C}
(assert (= sc_63 sc_154))
; 
; =  {of.input.I[18].O} {of.iadd[8].C}
(assert (= of_63 of_154))
; 
; =  {sc.input.I[9].O} {sc.iadd[8].B}
(assert (= sc_31 sc_156))
; 
; =  {of.input.I[9].O} {of.iadd[8].B}
(assert (= of_31 of_156))
; 
; =  {sc.input.I[4].O} {sc.iadd[2].C}
(assert (= sc_53 sc_149))
; 
; =  {of.input.I[4].O} {of.iadd[2].C}
(assert (= of_53 of_149))
; 
; =  {sc.input.I[3].O} {sc.iadd[2].A}
(assert (= sc_51 sc_150))
; 
; =  {of.input.I[3].O} {of.iadd[2].A}
(assert (= of_51 of_150))
; 
; =  {sc.input.I[16].O} {sc.switch[7].Kmod}
(assert (= sc_47 sc_10))
; 
; =  {of.input.I[16].O} {of.switch[7].Kmod}
(assert (= of_47 of_10))
; 
; =  {sc.input.V[13].O} {sc.vgain[15].Y}
(assert (= sc_108 sc_1))
; 
; =  {of.input.V[13].O} {of.vgain[15].Y}
(assert (= of_108 of_1))
; 
; =  {sc.input.I[5].O} {sc.iadd[3].D}
(assert (= sc_55 sc_168))
; 
; =  {of.input.I[5].O} {of.iadd[3].D}
(assert (= of_55 of_168))
; 
; =  {sc.igenebind[14].GE} {sc.itov[12].K}
(assert (= sc_96 sc_143))
; 
; =  {of.igenebind[14].GE} {of.itov[12].K}
(assert (= of_96 of_143))
; 
; =  {sc.input.V[14].O} {sc.vtoi[4].X}
(assert (= sc_124 sc_90))
; 
; =  {of.input.V[14].O} {of.vtoi[4].X}
(assert (= of_124 of_90))
; 
; =  {sc.vtoi[0].Y} {sc.iadd[8].D}
(assert (= sc_89 sc_153))
; 
; =  {of.vtoi[0].Y} {of.iadd[8].D}
(assert (= of_89 of_153))
; 
; =  {sc.iadd[12].OUT} {sc.igenebind[14].TF}
(assert (= sc_162 sc_93))
; 
; =  {of.iadd[12].OUT} {of.igenebind[14].TF}
(assert (= of_162 of_93))
; 
; =  {sc.input.I[30].O} {sc.iadd[12].A}
(assert (= sc_49 sc_160))
; 
; =  {of.input.I[30].O} {of.iadd[12].A}
(assert (= of_49 of_160))
; 
; =  {sc.input.V[11].O} {sc.vadd[13].D}
(assert (= sc_116 sc_71))
; 
; =  {of.input.V[11].O} {of.vadd[13].D}
(assert (= of_116 of_71))
; 
; =  {sc.input.I[14].O} {sc.itov[12].X}
(assert (= sc_45 sc_142))
; 
; =  {of.input.I[14].O} {of.itov[12].X}
(assert (= of_45 of_142))
; 
; =  {sc.input.I[2].O} {sc.iadd[2].D}
(assert (= sc_19 sc_148))
; 
; =  {of.input.I[2].O} {of.iadd[2].D}
(assert (= of_19 of_148))
; 
; =  {sc.input.V[8].O} {sc.vadd[13].OUT2_0}
(assert (= sc_104 sc_70))
; 
; =  {of.input.V[8].O} {of.vadd[13].OUT2_0}
(assert (= of_104 of_70))
; 
; =  {sc.input.V[12].O} {sc.switch[10].n}
(assert (= sc_110 sc_13))
; 
; =  {of.input.V[12].O} {of.switch[10].n}
(assert (= of_110 of_13))
; 
; =  {sc.input.V[3].O} {sc.vadd[13].A}
(assert (= sc_128 sc_73))
; 
; =  {of.input.V[3].O} {of.vadd[13].A}
(assert (= of_128 of_73))
; 
; =  {sc.input.V[2].O} {sc.switch[7].n}
(assert (= sc_102 sc_8))
; 
; =  {of.input.V[2].O} {of.switch[7].n}
(assert (= of_102 of_8))
; 
; =  {sc.input.I[15].O} {sc.igenebind[1].K}
(assert (= sc_39 sc_98))
; 
; =  {of.input.I[15].O} {of.igenebind[1].K}
(assert (= of_39 of_98))
; 
; =  {sc.input.I[1].O} {sc.igenebind[14].Vmax}
(assert (= sc_57 sc_95))
; 
; =  {of.input.I[1].O} {of.igenebind[14].Vmax}
(assert (= of_57 of_95))
; 
; =  {sc.input.I[10].O} {sc.iadd[11].D}
(assert (= sc_37 sc_163))
; 
; =  {of.input.I[10].O} {of.iadd[11].D}
(assert (= of_37 of_163))
; 
; =  {sc.input.I[12].O} {sc.iadd[11].C}
(assert (= sc_27 sc_164))
; 
; =  {of.input.I[12].O} {of.iadd[11].C}
(assert (= of_27 of_164))
; 
; =  {sc.vadd[16].OUT2} {sc.output.V[1].X}
(assert (= sc_83 sc_68))
; 
; =  {of.vadd[16].OUT2} {of.output.V[1].X}
(assert (= of_83 of_68))
; 
; =  {sc.vadd[16].OUT2} {sc.switch[10].Vmax}
(assert (= sc_83 sc_16))
; 
; =  {of.vadd[16].OUT2} {of.switch[10].Vmax}
(assert (= of_83 of_16))
; 
; =  {sc.iadd[11].OUT} {sc.switch[10].Kmod}
(assert (= sc_167 sc_15))
; 
; =  {of.iadd[11].OUT} {of.switch[10].Kmod}
(assert (= of_167 of_15))
; 
; =  {sc.input.I[33].O} {sc.itov[13].X}
(assert (= sc_43 sc_139))
; 
; =  {of.input.I[33].O} {of.itov[13].X}
(assert (= of_43 of_139))
; 
; =  {sc.input.I[7].O} {sc.iadd[3].C}
(assert (= sc_23 sc_169))
; 
; =  {of.input.I[7].O} {of.iadd[3].C}
(assert (= of_23 of_169))
; 
; =  {sc.input.I[13].O} {sc.switch[10].SUB}
(assert (= sc_25 sc_14))
; 
; =  {of.input.I[13].O} {of.switch[10].SUB}
(assert (= of_25 of_14))
; 
; =  {sc.input.V[1].O} {sc.vgain[5].X}
(assert (= sc_134 sc_4))
; 
; =  {of.input.V[1].O} {of.vgain[5].X}
(assert (= of_134 of_4))
; 
; =  {sc.iadd[3].OUT} {sc.iadd[2].B}
(assert (= sc_172 sc_151))
; 
; =  {of.iadd[3].OUT} {of.iadd[2].B}
(assert (= of_172 of_151))
; 
; =  {sc.input.V[7].O} {sc.vadd[16].OUT2_0}
(assert (= sc_106 sc_77))
; 
; =  {of.input.V[7].O} {of.vadd[16].OUT2_0}
(assert (= of_106 of_77))
; 
; =  {sc.input.I[17].O} {sc.switch[7].Vmax}
(assert (= sc_59 sc_11))
; 
; =  {of.input.I[17].O} {of.switch[7].Vmax}
(assert (= of_59 of_11))
; 
; =  {sc.iadd[2].OUT} {sc.igenebind[1].TF}
(assert (= sc_152 sc_97))
; 
; =  {of.iadd[2].OUT} {of.igenebind[1].TF}
(assert (= of_152 of_97))
; 
; =  {sc.igenebind[1].GE} {sc.itov[13].K}
(assert (= sc_100 sc_140))
; 
; =  {of.igenebind[1].GE} {of.itov[13].K}
(assert (= of_100 of_140))
; 
; =  {sc.input.I[8].O} {sc.iadd[8].A}
(assert (= sc_21 sc_155))
; 
; =  {of.input.I[8].O} {of.iadd[8].A}
(assert (= of_21 of_155))
; 
; =  {sc.itov[6].Y} {sc.vgain[5].Z}
(assert (= sc_147 sc_6))
; 
; =  {of.itov[6].Y} {of.vgain[5].Z}
(assert (= of_147 of_6))
; 
; =  {sc.input.V[0].O} {sc.vtoi[9].K}
(assert (= sc_114 sc_85))
; 
; =  {of.input.V[0].O} {of.vtoi[9].K}
(assert (= of_114 of_85))
; 
; =  {sc.input.V[10].O} {sc.vadd[16].D}
(assert (= sc_118 sc_78))
; 
; =  {of.input.V[10].O} {of.vadd[16].D}
(assert (= of_118 of_78))
; 
; =  {sc.input.V[18].O} {sc.vgain[15].X}
(assert (= sc_138 sc_0))
; 
; =  {of.input.V[18].O} {of.vgain[15].X}
(assert (= of_138 of_0))
; 
; =  {sc.input.V[16].O} {sc.itov[6].K}
(assert (= sc_126 sc_146))
; 
; =  {of.input.V[16].O} {of.itov[6].K}
(assert (= of_126 of_146))
; 
; =  {sc.iadd[8].OUT} {sc.switch[7].SUB}
(assert (= sc_157 sc_9))
; 
; =  {of.iadd[8].OUT} {of.switch[7].SUB}
(assert (= of_157 of_9))
; 
; =  {sc.switch[10].PROD} {sc.iadd[12].B}
(assert (= sc_17 sc_161))
; 
; =  {of.switch[10].PROD} {of.iadd[12].B}
(assert (= of_17 of_161))
; 
; =  {sc.input.I[19].O} {sc.igenebind[14].K}
(assert (= sc_65 sc_94))
; 
; =  {of.input.I[19].O} {of.igenebind[14].K}
(assert (= of_65 of_94))
; 
; =  {sc.input.V[4].O} {sc.vadd[13].C}
(assert (= sc_130 sc_72))
; 
; =  {of.input.V[4].O} {of.vadd[13].C}
(assert (= of_130 of_72))
; 
; =  {sc.input.V[5].O} {sc.vadd[16].C}
(assert (= sc_132 sc_79))
; 
; =  {of.input.V[5].O} {of.vadd[16].C}
(assert (= of_132 of_79))
; 
; =  {sc.vtoi[9].Y} {sc.iadd[11].B}
(assert (= sc_86 sc_166))
; 
; =  {of.vtoi[9].Y} {of.iadd[11].B}
(assert (= of_86 of_166))
; 
; =  {sc.input.V[6].O} {sc.vadd[16].A}
(assert (= sc_122 sc_80))
; 
; =  {of.input.V[6].O} {of.vadd[16].A}
(assert (= of_122 of_80))
; 
; =  {sc.vgain[5].P} {sc.vtoi[4].K}
(assert (= sc_7 sc_91))
; 
; =  {of.vgain[5].P} {of.vtoi[4].K}
(assert (= of_7 of_91))
; 
; =  {sc.input.I[11].O} {sc.iadd[11].A}
(assert (= sc_35 sc_165))
; 
; =  {of.input.I[11].O} {of.iadd[11].A}
(assert (= of_35 of_165))
; 
; =  {sc.vtoi[4].Y} {sc.iadd[3].B}
(assert (= sc_92 sc_171))
; 
; =  {of.vtoi[4].Y} {of.iadd[3].B}
(assert (= of_92 of_171))
(assert (<= (* sc_67 0.001) 0.001))
(assert (<= (* sc_69 0.001) 0.001))
; 
; =  {sc.vadd[13].OUT2} {sc.output.V[0].O} {sc.vadd[16].OUT2} {sc.output.V[1].O}
(assert (and (and (= sc_76 sc_67) (= sc_76 sc_83)) (= sc_76 sc_69)))
(assert (= __minima__ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (ite (>= slbot_92 0.) slbot_92 (- slbot_92)) (ite (>= sltop_172 0.) sltop_172 (- sltop_172))) (ite (>= sltop_96 0.) sltop_96 (- sltop_96))) (ite (>= sltop_87 0.) sltop_87 (- sltop_87))) (ite (>= slbot_16 0.) slbot_16 (- slbot_16))) (ite (>= sltop_91 0.) sltop_91 (- sltop_91))) (ite (>= sltop_141 0.) sltop_141 (- sltop_141))) (ite (>= sltop_66 0.) sltop_66 (- sltop_66))) (ite (>= sltop_76 0.) sltop_76 (- sltop_76))) (ite (>= slbot_157 0.) slbot_157 (- slbot_157))) (ite (>= slbot_3 0.) slbot_3 (- slbot_3))) (ite (>= slbot_151 0.) slbot_151 (- slbot_151))) (ite (>= slbot_2 0.) slbot_2 (- slbot_2))) (ite (>= slbot_76 0.) slbot_76 (- slbot_76))) (ite (>= slbot_143 0.) slbot_143 (- slbot_143))) (ite (>= sltop_82 0.) sltop_82 (- sltop_82))) (ite (>= slbot_85 0.) slbot_85 (- slbot_85))) (ite (>= sltop_166 0.) sltop_166 (- sltop_166))) (ite (>= slbot_96 0.) slbot_96 (- slbot_96))) (ite (>= sltop_2 0.) sltop_2 (- sltop_2))) (ite (>= sltop_15 0.) sltop_15 (- sltop_15))) (ite (>= sltop_85 0.) sltop_85 (- sltop_85))) (ite (>= slbot_166 0.) slbot_166 (- slbot_166))) (ite (>= sltop_100 0.) sltop_100 (- sltop_100))) (ite (>= sltop_152 0.) sltop_152 (- sltop_152))) (ite (>= sltop_157 0.) sltop_157 (- sltop_157))) (ite (>= sltop_9 0.) sltop_9 (- sltop_9))) (ite (>= sltop_74 0.) sltop_74 (- sltop_74))) (ite (>= slbot_81 0.) slbot_81 (- slbot_81))) (ite (>= slbot_91 0.) slbot_91 (- slbot_91))) (ite (>= slbot_141 0.) slbot_141 (- slbot_141))) (ite (>= slbot_68 0.) slbot_68 (- slbot_68))) (ite (>= slbot_162 0.) slbot_162 (- slbot_162))) (ite (>= slbot_87 0.) slbot_87 (- slbot_87))) (ite (>= slbot_6 0.) slbot_6 (- slbot_6))) (ite (>= sltop_86 0.) sltop_86 (- sltop_86))) (ite (>= sltop_153 0.) sltop_153 (- sltop_153))) (ite (>= sltop_161 0.) sltop_161 (- sltop_161))) (ite (>= sltop_68 0.) sltop_68 (- sltop_68))) (ite (>= sltop_75 0.) sltop_75 (- sltop_75))) (ite (>= slbot_152 0.) slbot_152 (- slbot_152))) (ite (>= slbot_114 0.) slbot_114 (- slbot_114))) (ite (>= sltop_151 0.) sltop_151 (- sltop_151))) (ite (>= sltop_17 0.) sltop_17 (- sltop_17))) (ite (>= slbot_75 0.) slbot_75 (- slbot_75))) (ite (>= sltop_162 0.) sltop_162 (- sltop_162))) (ite (>= sltop_3 0.) sltop_3 (- sltop_3))) (ite (>= slbot_69 0.) slbot_69 (- slbot_69))) (ite (>= sltop_143 0.) sltop_143 (- sltop_143))) (ite (>= slbot_161 0.) slbot_161 (- slbot_161))) (ite (>= slbot_7 0.) slbot_7 (- slbot_7))) (ite (>= slbot_153 0.) slbot_153 (- slbot_153))) (ite (>= slbot_12 0.) slbot_12 (- slbot_12))) (ite (>= slbot_66 0.) slbot_66 (- slbot_66))) (ite (>= slbot_89 0.) slbot_89 (- slbot_89))) (ite (>= slbot_144 0.) slbot_144 (- slbot_144))) (ite (>= slbot_83 0.) slbot_83 (- slbot_83))) (ite (>= sltop_81 0.) sltop_81 (- sltop_81))) (ite (>= sltop_114 0.) sltop_114 (- sltop_114))) (ite (>= slbot_140 0.) slbot_140 (- slbot_140))) (ite (>= sltop_147 0.) sltop_147 (- sltop_147))) (ite (>= slbot_171 0.) slbot_171 (- slbot_171))) (ite (>= slbot_172 0.) slbot_172 (- slbot_172))) (ite (>= sltop_7 0.) sltop_7 (- sltop_7))) (ite (>= sltop_67 0.) sltop_67 (- sltop_67))) (ite (>= slbot_15 0.) slbot_15 (- slbot_15))) (ite (>= slbot_17 0.) slbot_17 (- slbot_17))) (ite (>= sltop_89 0.) sltop_89 (- sltop_89))) (ite (>= sltop_92 0.) sltop_92 (- sltop_92))) (ite (>= sltop_12 0.) sltop_12 (- sltop_12))) (ite (>= slbot_113 0.) slbot_113 (- slbot_113))) (ite (>= slbot_82 0.) slbot_82 (- slbot_82))) (ite (>= sltop_167 0.) sltop_167 (- sltop_167))) (ite (>= slbot_67 0.) slbot_67 (- slbot_67))) (ite (>= slbot_9 0.) slbot_9 (- slbot_9))) (ite (>= sltop_16 0.) sltop_16 (- sltop_16))) (ite (>= sltop_140 0.) sltop_140 (- sltop_140))) (ite (>= slbot_93 0.) slbot_93 (- slbot_93))) (ite (>= slbot_167 0.) slbot_167 (- slbot_167))) (ite (>= slbot_86 0.) slbot_86 (- slbot_86))) (ite (>= sltop_97 0.) sltop_97 (- sltop_97))) (ite (>= sltop_145 0.) sltop_145 (- sltop_145))) (ite (>= sltop_93 0.) sltop_93 (- sltop_93))) (ite (>= slbot_100 0.) slbot_100 (- slbot_100))) (ite (>= slbot_147 0.) slbot_147 (- slbot_147))) (ite (>= sltop_83 0.) sltop_83 (- sltop_83))) (ite (>= slbot_145 0.) slbot_145 (- slbot_145))) (ite (>= sltop_171 0.) sltop_171 (- sltop_171))) (ite (>= slbot_74 0.) slbot_74 (- slbot_74))) (ite (>= sltop_69 0.) sltop_69 (- sltop_69))) (ite (>= sltop_6 0.) sltop_6 (- sltop_6))) (ite (>= slbot_97 0.) slbot_97 (- slbot_97))) (ite (>= sltop_113 0.) sltop_113 (- sltop_113))) (ite (>= sltop_144 0.) sltop_144 (- sltop_144)))))
(check-sat)
