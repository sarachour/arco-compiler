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
(declare-fun sc_16 () Real)
(assert (> sc_16 1e-08))
(declare-fun of_16 () Real)
(declare-fun sc_17 () Real)
(assert (> sc_17 1e-08))
(declare-fun of_17 () Real)
(declare-fun sc_18 () Real)
(assert (> sc_18 1e-08))
(declare-fun of_18 () Real)
; no offset
(assert (= of_14 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_15 0.))
; no offset
(assert (= of_16 0.))
; 
; =  {(sc.switch[14].SUB/sc.switch[14].Kmod)} {1.}
(assert (= (/ sc_15 sc_16) 1.))
; no scale
(assert (= (/ sc_15 sc_16) 1.))
; no scale
(assert (= (/ sc_14 1.) 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_17 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.switch[14].PROD} {(sc.switch[14].Vmax/1.)}
(assert (= sc_18 (/ sc_17 1.)))
; 
; =  {of.switch[14].PROD} {0.}
(assert (= of_18 0.))
; 
; >=  {((sc.switch[14].n*-500.)+of.switch[14].n)} {3300.}
(assert (<= (+ (* sc_14 -500.) of_14) 3300.))
; 
; <=  {((sc.switch[14].n*-500.)+of.switch[14].n)} {0.5}
(assert (>= (+ (* sc_14 -500.) of_14) 0.5))
; 
; >=  {((sc.switch[14].SUB*-2.)+of.switch[14].SUB)} {10.}
(assert (<= (+ (* sc_15 -2.) of_15) 10.))
; 
; <=  {((sc.switch[14].SUB*-2.)+of.switch[14].SUB)} {0.0001}
(assert (>= (+ (* sc_15 -2.) of_15) 0.0001))
; 
; >=  {((sc.switch[14].Kmod*1.)+of.switch[14].Kmod)} {10.}
(assert (<= (+ (* sc_16 1.) of_16) 10.))
; 
; <=  {((sc.switch[14].Kmod*1.)+of.switch[14].Kmod)} {0.0001}
(assert (>= (+ (* sc_16 1.) of_16) 0.0001))
(declare-fun slbot_18 () Real)
(declare-fun sltop_18 () Real)
; 
; =  {(((sc.switch[14].PROD*-0.6)+of.switch[14].PROD)+sl.min.switch[14].PROD)} {9.99934002508e-38}
(assert (= (+ (+ (* sc_18 -0.6) of_18) slbot_18) 9.99934002508e-38))
; 
; =  {(((sc.switch[14].PROD*0.)+of.switch[14].PROD)+sl.max.switch[14].PROD)} {9.9999999}
(assert (= (+ (+ (* sc_18 0.) of_18) sltop_18) 9.9999999))
(declare-fun slbot_17 () Real)
(declare-fun sltop_17 () Real)
; 
; =  {(((sc.switch[14].Vmax*0.)+of.switch[14].Vmax)+sl.min.switch[14].Vmax)} {0.0001}
(assert (= (+ (+ (* sc_17 0.) of_17) slbot_17) 0.0001))
; 
; =  {(((sc.switch[14].Vmax*0.6)+of.switch[14].Vmax)+sl.max.switch[14].Vmax)} {10.}
(assert (= (+ (+ (* sc_17 0.6) of_17) sltop_17) 10.))
(declare-fun slbot_18 () Real)
(declare-fun sltop_18 () Real)
; 
; =  {(((sc.switch[14].PROD*-0.6)+of.switch[14].PROD)+sl.min.switch[14].PROD)} {9.99934002508e-38}
(assert (= (+ (+ (* sc_18 -0.6) of_18) slbot_18) 9.99934002508e-38))
; 
; =  {(((sc.switch[14].PROD*0.)+of.switch[14].PROD)+sl.max.switch[14].PROD)} {9.9999999}
(assert (= (+ (+ (* sc_18 0.) of_18) sltop_18) 9.9999999))
(declare-fun sc_19 () Real)
(assert (> sc_19 1e-08))
(declare-fun of_19 () Real)
(declare-fun sc_20 () Real)
(assert (> sc_20 1e-08))
(declare-fun of_20 () Real)
; 
; =  {sc.input.I[2].O} {sc.input.I[2].X}
(assert (= sc_20 sc_19))
; 
; =  {of.input.I[2].O} {of.input.I[2].X}
(assert (= of_20 of_19))
; 
; >=  {((sc.input.I[2].X*0.)+of.input.I[2].X)} {10.}
(assert (<= (+ (* sc_19 0.) of_19) 10.))
; 
; <=  {((sc.input.I[2].X*0.)+of.input.I[2].X)} {0.}
(assert (>= (+ (* sc_19 0.) of_19) 0.))
; 
; >=  {((sc.input.I[2].O*0.)+of.input.I[2].O)} {10.}
(assert (<= (+ (* sc_20 0.) of_20) 10.))
; 
; <=  {((sc.input.I[2].O*0.)+of.input.I[2].O)} {0.}
(assert (>= (+ (* sc_20 0.) of_20) 0.))
(declare-fun sc_21 () Real)
(assert (> sc_21 1e-08))
(declare-fun of_21 () Real)
(declare-fun sc_22 () Real)
(assert (> sc_22 1e-08))
(declare-fun of_22 () Real)
; 
; =  {sc.input.I[20].O} {sc.input.I[20].X}
(assert (= sc_22 sc_21))
; 
; =  {of.input.I[20].O} {of.input.I[20].X}
(assert (= of_22 of_21))
; 
; >=  {((sc.input.I[20].X*-2.)+of.input.I[20].X)} {10.}
(assert (<= (+ (* sc_21 -2.) of_21) 10.))
; 
; <=  {((sc.input.I[20].X*-2.)+of.input.I[20].X)} {0.}
(assert (>= (+ (* sc_21 -2.) of_21) 0.))
; 
; >=  {((sc.input.I[20].O*-2.)+of.input.I[20].O)} {10.}
(assert (<= (+ (* sc_22 -2.) of_22) 10.))
; 
; <=  {((sc.input.I[20].O*-2.)+of.input.I[20].O)} {0.}
(assert (>= (+ (* sc_22 -2.) of_22) 0.))
(declare-fun sc_23 () Real)
(assert (> sc_23 1e-08))
(declare-fun of_23 () Real)
(declare-fun sc_24 () Real)
(assert (> sc_24 1e-08))
(declare-fun of_24 () Real)
; 
; =  {sc.input.I[29].O} {sc.input.I[29].X}
(assert (= sc_24 sc_23))
; 
; =  {of.input.I[29].O} {of.input.I[29].X}
(assert (= of_24 of_23))
; 
; >=  {((sc.input.I[29].X*1.)+of.input.I[29].X)} {10.}
(assert (<= (+ (* sc_23 1.) of_23) 10.))
; 
; <=  {((sc.input.I[29].X*1.)+of.input.I[29].X)} {0.}
(assert (>= (+ (* sc_23 1.) of_23) 0.))
; 
; >=  {((sc.input.I[29].O*1.)+of.input.I[29].O)} {10.}
(assert (<= (+ (* sc_24 1.) of_24) 10.))
; 
; <=  {((sc.input.I[29].O*1.)+of.input.I[29].O)} {0.}
(assert (>= (+ (* sc_24 1.) of_24) 0.))
(declare-fun sc_25 () Real)
(assert (> sc_25 1e-08))
(declare-fun of_25 () Real)
(declare-fun sc_26 () Real)
(assert (> sc_26 1e-08))
(declare-fun of_26 () Real)
; 
; =  {sc.input.I[8].O} {sc.input.I[8].X}
(assert (= sc_26 sc_25))
; 
; =  {of.input.I[8].O} {of.input.I[8].X}
(assert (= of_26 of_25))
; 
; >=  {((sc.input.I[8].X*0.)+of.input.I[8].X)} {10.}
(assert (<= (+ (* sc_25 0.) of_25) 10.))
; 
; <=  {((sc.input.I[8].X*0.)+of.input.I[8].X)} {0.}
(assert (>= (+ (* sc_25 0.) of_25) 0.))
; 
; >=  {((sc.input.I[8].O*0.)+of.input.I[8].O)} {10.}
(assert (<= (+ (* sc_26 0.) of_26) 10.))
; 
; <=  {((sc.input.I[8].O*0.)+of.input.I[8].O)} {0.}
(assert (>= (+ (* sc_26 0.) of_26) 0.))
(declare-fun sc_27 () Real)
(assert (> sc_27 1e-08))
(declare-fun of_27 () Real)
(declare-fun sc_28 () Real)
(assert (> sc_28 1e-08))
(declare-fun of_28 () Real)
; 
; =  {sc.input.I[34].O} {sc.input.I[34].X}
(assert (= sc_28 sc_27))
; 
; =  {of.input.I[34].O} {of.input.I[34].X}
(assert (= of_28 of_27))
; 
; >=  {((sc.input.I[34].X*0.)+of.input.I[34].X)} {10.}
(assert (<= (+ (* sc_27 0.) of_27) 10.))
; 
; <=  {((sc.input.I[34].X*0.)+of.input.I[34].X)} {0.}
(assert (>= (+ (* sc_27 0.) of_27) 0.))
; 
; >=  {((sc.input.I[34].O*0.)+of.input.I[34].O)} {10.}
(assert (<= (+ (* sc_28 0.) of_28) 10.))
; 
; <=  {((sc.input.I[34].O*0.)+of.input.I[34].O)} {0.}
(assert (>= (+ (* sc_28 0.) of_28) 0.))
(declare-fun sc_29 () Real)
(assert (> sc_29 1e-08))
(declare-fun of_29 () Real)
(declare-fun sc_30 () Real)
(assert (> sc_30 1e-08))
(declare-fun of_30 () Real)
; 
; =  {sc.input.I[7].O} {sc.input.I[7].X}
(assert (= sc_30 sc_29))
; 
; =  {of.input.I[7].O} {of.input.I[7].X}
(assert (= of_30 of_29))
; 
; >=  {((sc.input.I[7].X*0.)+of.input.I[7].X)} {10.}
(assert (<= (+ (* sc_29 0.) of_29) 10.))
; 
; <=  {((sc.input.I[7].X*0.)+of.input.I[7].X)} {0.}
(assert (>= (+ (* sc_29 0.) of_29) 0.))
; 
; >=  {((sc.input.I[7].O*0.)+of.input.I[7].O)} {10.}
(assert (<= (+ (* sc_30 0.) of_30) 10.))
; 
; <=  {((sc.input.I[7].O*0.)+of.input.I[7].O)} {0.}
(assert (>= (+ (* sc_30 0.) of_30) 0.))
(declare-fun sc_31 () Real)
(assert (> sc_31 1e-08))
(declare-fun of_31 () Real)
(declare-fun sc_32 () Real)
(assert (> sc_32 1e-08))
(declare-fun of_32 () Real)
; 
; =  {sc.input.I[13].O} {sc.input.I[13].X}
(assert (= sc_32 sc_31))
; 
; =  {of.input.I[13].O} {of.input.I[13].X}
(assert (= of_32 of_31))
; 
; >=  {((sc.input.I[13].X*0.)+of.input.I[13].X)} {10.}
(assert (<= (+ (* sc_31 0.) of_31) 10.))
; 
; <=  {((sc.input.I[13].X*0.)+of.input.I[13].X)} {0.}
(assert (>= (+ (* sc_31 0.) of_31) 0.))
; 
; >=  {((sc.input.I[13].O*0.)+of.input.I[13].O)} {10.}
(assert (<= (+ (* sc_32 0.) of_32) 10.))
; 
; <=  {((sc.input.I[13].O*0.)+of.input.I[13].O)} {0.}
(assert (>= (+ (* sc_32 0.) of_32) 0.))
(declare-fun sc_33 () Real)
(assert (> sc_33 1e-08))
(declare-fun of_33 () Real)
(declare-fun sc_34 () Real)
(assert (> sc_34 1e-08))
(declare-fun of_34 () Real)
; 
; =  {sc.input.I[12].O} {sc.input.I[12].X}
(assert (= sc_34 sc_33))
; 
; =  {of.input.I[12].O} {of.input.I[12].X}
(assert (= of_34 of_33))
; 
; >=  {((sc.input.I[12].X*0.)+of.input.I[12].X)} {10.}
(assert (<= (+ (* sc_33 0.) of_33) 10.))
; 
; <=  {((sc.input.I[12].X*0.)+of.input.I[12].X)} {0.}
(assert (>= (+ (* sc_33 0.) of_33) 0.))
; 
; >=  {((sc.input.I[12].O*0.)+of.input.I[12].O)} {10.}
(assert (<= (+ (* sc_34 0.) of_34) 10.))
; 
; <=  {((sc.input.I[12].O*0.)+of.input.I[12].O)} {0.}
(assert (>= (+ (* sc_34 0.) of_34) 0.))
(declare-fun sc_35 () Real)
(assert (> sc_35 1e-08))
(declare-fun of_35 () Real)
(declare-fun sc_36 () Real)
(assert (> sc_36 1e-08))
(declare-fun of_36 () Real)
; 
; =  {sc.input.I[9].O} {sc.input.I[9].X}
(assert (= sc_36 sc_35))
; 
; =  {of.input.I[9].O} {of.input.I[9].X}
(assert (= of_36 of_35))
; 
; >=  {((sc.input.I[9].X*0.)+of.input.I[9].X)} {10.}
(assert (<= (+ (* sc_35 0.) of_35) 10.))
; 
; <=  {((sc.input.I[9].X*0.)+of.input.I[9].X)} {0.}
(assert (>= (+ (* sc_35 0.) of_35) 0.))
; 
; >=  {((sc.input.I[9].O*0.)+of.input.I[9].O)} {10.}
(assert (<= (+ (* sc_36 0.) of_36) 10.))
; 
; <=  {((sc.input.I[9].O*0.)+of.input.I[9].O)} {0.}
(assert (>= (+ (* sc_36 0.) of_36) 0.))
(declare-fun sc_37 () Real)
(assert (> sc_37 1e-08))
(declare-fun of_37 () Real)
(declare-fun sc_38 () Real)
(assert (> sc_38 1e-08))
(declare-fun of_38 () Real)
; 
; =  {sc.input.I[31].O} {sc.input.I[31].X}
(assert (= sc_38 sc_37))
; 
; =  {of.input.I[31].O} {of.input.I[31].X}
(assert (= of_38 of_37))
; 
; >=  {((sc.input.I[31].X*1.)+of.input.I[31].X)} {10.}
(assert (<= (+ (* sc_37 1.) of_37) 10.))
; 
; <=  {((sc.input.I[31].X*1.)+of.input.I[31].X)} {0.}
(assert (>= (+ (* sc_37 1.) of_37) 0.))
; 
; >=  {((sc.input.I[31].O*1.)+of.input.I[31].O)} {10.}
(assert (<= (+ (* sc_38 1.) of_38) 10.))
; 
; <=  {((sc.input.I[31].O*1.)+of.input.I[31].O)} {0.}
(assert (>= (+ (* sc_38 1.) of_38) 0.))
(declare-fun sc_39 () Real)
(assert (> sc_39 1e-08))
(declare-fun of_39 () Real)
(declare-fun sc_40 () Real)
(assert (> sc_40 1e-08))
(declare-fun of_40 () Real)
; 
; =  {sc.input.I[0].O} {sc.input.I[0].X}
(assert (= sc_40 sc_39))
; 
; =  {of.input.I[0].O} {of.input.I[0].X}
(assert (= of_40 of_39))
(declare-fun slbot_39 () Real)
(declare-fun sltop_39 () Real)
; 
; =  {(((sc.input.I[0].X*0.)+of.input.I[0].X)+sl.min.input.I[0].X)} {0.}
(assert (= (+ (+ (* sc_39 0.) of_39) slbot_39) 0.))
; 
; =  {(((sc.input.I[0].X*0.6)+of.input.I[0].X)+sl.max.input.I[0].X)} {10.}
(assert (= (+ (+ (* sc_39 0.6) of_39) sltop_39) 10.))
(declare-fun slbot_40 () Real)
(declare-fun sltop_40 () Real)
; 
; =  {(((sc.input.I[0].O*0.)+of.input.I[0].O)+sl.min.input.I[0].O)} {0.}
(assert (= (+ (+ (* sc_40 0.) of_40) slbot_40) 0.))
; 
; =  {(((sc.input.I[0].O*0.6)+of.input.I[0].O)+sl.max.input.I[0].O)} {10.}
(assert (= (+ (+ (* sc_40 0.6) of_40) sltop_40) 10.))
(declare-fun sc_41 () Real)
(assert (> sc_41 1e-08))
(declare-fun of_41 () Real)
(declare-fun sc_42 () Real)
(assert (> sc_42 1e-08))
(declare-fun of_42 () Real)
; 
; =  {sc.input.I[11].O} {sc.input.I[11].X}
(assert (= sc_42 sc_41))
; 
; =  {of.input.I[11].O} {of.input.I[11].X}
(assert (= of_42 of_41))
; 
; >=  {((sc.input.I[11].X*0.)+of.input.I[11].X)} {10.}
(assert (<= (+ (* sc_41 0.) of_41) 10.))
; 
; <=  {((sc.input.I[11].X*0.)+of.input.I[11].X)} {0.}
(assert (>= (+ (* sc_41 0.) of_41) 0.))
; 
; >=  {((sc.input.I[11].O*0.)+of.input.I[11].O)} {10.}
(assert (<= (+ (* sc_42 0.) of_42) 10.))
; 
; <=  {((sc.input.I[11].O*0.)+of.input.I[11].O)} {0.}
(assert (>= (+ (* sc_42 0.) of_42) 0.))
(declare-fun sc_43 () Real)
(assert (> sc_43 1e-08))
(declare-fun of_43 () Real)
(declare-fun sc_44 () Real)
(assert (> sc_44 1e-08))
(declare-fun of_44 () Real)
; 
; =  {sc.input.I[10].O} {sc.input.I[10].X}
(assert (= sc_44 sc_43))
; 
; =  {of.input.I[10].O} {of.input.I[10].X}
(assert (= of_44 of_43))
; 
; >=  {((sc.input.I[10].X*0.)+of.input.I[10].X)} {10.}
(assert (<= (+ (* sc_43 0.) of_43) 10.))
; 
; <=  {((sc.input.I[10].X*0.)+of.input.I[10].X)} {0.}
(assert (>= (+ (* sc_43 0.) of_43) 0.))
; 
; >=  {((sc.input.I[10].O*0.)+of.input.I[10].O)} {10.}
(assert (<= (+ (* sc_44 0.) of_44) 10.))
; 
; <=  {((sc.input.I[10].O*0.)+of.input.I[10].O)} {0.}
(assert (>= (+ (* sc_44 0.) of_44) 0.))
(declare-fun sc_45 () Real)
(assert (> sc_45 1e-08))
(declare-fun of_45 () Real)
(declare-fun sc_46 () Real)
(assert (> sc_46 1e-08))
(declare-fun of_46 () Real)
; 
; =  {sc.input.I[26].O} {sc.input.I[26].X}
(assert (= sc_46 sc_45))
; 
; =  {of.input.I[26].O} {of.input.I[26].X}
(assert (= of_46 of_45))
; 
; >=  {((sc.input.I[26].X*1.)+of.input.I[26].X)} {10.}
(assert (<= (+ (* sc_45 1.) of_45) 10.))
; 
; <=  {((sc.input.I[26].X*1.)+of.input.I[26].X)} {0.}
(assert (>= (+ (* sc_45 1.) of_45) 0.))
; 
; >=  {((sc.input.I[26].O*1.)+of.input.I[26].O)} {10.}
(assert (<= (+ (* sc_46 1.) of_46) 10.))
; 
; <=  {((sc.input.I[26].O*1.)+of.input.I[26].O)} {0.}
(assert (>= (+ (* sc_46 1.) of_46) 0.))
(declare-fun sc_47 () Real)
(assert (> sc_47 1e-08))
(declare-fun of_47 () Real)
(declare-fun sc_48 () Real)
(assert (> sc_48 1e-08))
(declare-fun of_48 () Real)
; 
; =  {sc.input.I[27].O} {sc.input.I[27].X}
(assert (= sc_48 sc_47))
; 
; =  {of.input.I[27].O} {of.input.I[27].X}
(assert (= of_48 of_47))
; 
; >=  {((sc.input.I[27].X*1.)+of.input.I[27].X)} {10.}
(assert (<= (+ (* sc_47 1.) of_47) 10.))
; 
; <=  {((sc.input.I[27].X*1.)+of.input.I[27].X)} {0.}
(assert (>= (+ (* sc_47 1.) of_47) 0.))
; 
; >=  {((sc.input.I[27].O*1.)+of.input.I[27].O)} {10.}
(assert (<= (+ (* sc_48 1.) of_48) 10.))
; 
; <=  {((sc.input.I[27].O*1.)+of.input.I[27].O)} {0.}
(assert (>= (+ (* sc_48 1.) of_48) 0.))
(declare-fun sc_49 () Real)
(assert (> sc_49 1e-08))
(declare-fun of_49 () Real)
(declare-fun sc_50 () Real)
(assert (> sc_50 1e-08))
(declare-fun of_50 () Real)
; 
; =  {sc.input.I[15].O} {sc.input.I[15].X}
(assert (= sc_50 sc_49))
; 
; =  {of.input.I[15].O} {of.input.I[15].X}
(assert (= of_50 of_49))
; 
; >=  {((sc.input.I[15].X*0.)+of.input.I[15].X)} {10.}
(assert (<= (+ (* sc_49 0.) of_49) 10.))
; 
; <=  {((sc.input.I[15].X*0.)+of.input.I[15].X)} {0.}
(assert (>= (+ (* sc_49 0.) of_49) 0.))
; 
; >=  {((sc.input.I[15].O*0.)+of.input.I[15].O)} {10.}
(assert (<= (+ (* sc_50 0.) of_50) 10.))
; 
; <=  {((sc.input.I[15].O*0.)+of.input.I[15].O)} {0.}
(assert (>= (+ (* sc_50 0.) of_50) 0.))
(declare-fun sc_51 () Real)
(assert (> sc_51 1e-08))
(declare-fun of_51 () Real)
(declare-fun sc_52 () Real)
(assert (> sc_52 1e-08))
(declare-fun of_52 () Real)
; 
; =  {sc.input.I[6].O} {sc.input.I[6].X}
(assert (= sc_52 sc_51))
; 
; =  {of.input.I[6].O} {of.input.I[6].X}
(assert (= of_52 of_51))
; 
; >=  {((sc.input.I[6].X*0.)+of.input.I[6].X)} {10.}
(assert (<= (+ (* sc_51 0.) of_51) 10.))
; 
; <=  {((sc.input.I[6].X*0.)+of.input.I[6].X)} {0.}
(assert (>= (+ (* sc_51 0.) of_51) 0.))
; 
; >=  {((sc.input.I[6].O*0.)+of.input.I[6].O)} {10.}
(assert (<= (+ (* sc_52 0.) of_52) 10.))
; 
; <=  {((sc.input.I[6].O*0.)+of.input.I[6].O)} {0.}
(assert (>= (+ (* sc_52 0.) of_52) 0.))
(declare-fun sc_53 () Real)
(assert (> sc_53 1e-08))
(declare-fun of_53 () Real)
(declare-fun sc_54 () Real)
(assert (> sc_54 1e-08))
(declare-fun of_54 () Real)
; 
; =  {sc.input.I[33].O} {sc.input.I[33].X}
(assert (= sc_54 sc_53))
; 
; =  {of.input.I[33].O} {of.input.I[33].X}
(assert (= of_54 of_53))
; 
; >=  {((sc.input.I[33].X*0.)+of.input.I[33].X)} {10.}
(assert (<= (+ (* sc_53 0.) of_53) 10.))
; 
; <=  {((sc.input.I[33].X*0.)+of.input.I[33].X)} {0.}
(assert (>= (+ (* sc_53 0.) of_53) 0.))
; 
; >=  {((sc.input.I[33].O*0.)+of.input.I[33].O)} {10.}
(assert (<= (+ (* sc_54 0.) of_54) 10.))
; 
; <=  {((sc.input.I[33].O*0.)+of.input.I[33].O)} {0.}
(assert (>= (+ (* sc_54 0.) of_54) 0.))
(declare-fun sc_55 () Real)
(assert (> sc_55 1e-08))
(declare-fun of_55 () Real)
(declare-fun sc_56 () Real)
(assert (> sc_56 1e-08))
(declare-fun of_56 () Real)
; 
; =  {sc.input.I[14].O} {sc.input.I[14].X}
(assert (= sc_56 sc_55))
; 
; =  {of.input.I[14].O} {of.input.I[14].X}
(assert (= of_56 of_55))
; 
; >=  {((sc.input.I[14].X*0.)+of.input.I[14].X)} {10.}
(assert (<= (+ (* sc_55 0.) of_55) 10.))
; 
; <=  {((sc.input.I[14].X*0.)+of.input.I[14].X)} {0.}
(assert (>= (+ (* sc_55 0.) of_55) 0.))
; 
; >=  {((sc.input.I[14].O*0.)+of.input.I[14].O)} {10.}
(assert (<= (+ (* sc_56 0.) of_56) 10.))
; 
; <=  {((sc.input.I[14].O*0.)+of.input.I[14].O)} {0.}
(assert (>= (+ (* sc_56 0.) of_56) 0.))
(declare-fun sc_57 () Real)
(assert (> sc_57 1e-08))
(declare-fun of_57 () Real)
(declare-fun sc_58 () Real)
(assert (> sc_58 1e-08))
(declare-fun of_58 () Real)
; 
; =  {sc.input.I[21].O} {sc.input.I[21].X}
(assert (= sc_58 sc_57))
; 
; =  {of.input.I[21].O} {of.input.I[21].X}
(assert (= of_58 of_57))
; 
; >=  {((sc.input.I[21].X*4.)+of.input.I[21].X)} {10.}
(assert (<= (+ (* sc_57 4.) of_57) 10.))
; 
; <=  {((sc.input.I[21].X*4.)+of.input.I[21].X)} {0.}
(assert (>= (+ (* sc_57 4.) of_57) 0.))
; 
; >=  {((sc.input.I[21].O*4.)+of.input.I[21].O)} {10.}
(assert (<= (+ (* sc_58 4.) of_58) 10.))
; 
; <=  {((sc.input.I[21].O*4.)+of.input.I[21].O)} {0.}
(assert (>= (+ (* sc_58 4.) of_58) 0.))
(declare-fun sc_59 () Real)
(assert (> sc_59 1e-08))
(declare-fun of_59 () Real)
(declare-fun sc_60 () Real)
(assert (> sc_60 1e-08))
(declare-fun of_60 () Real)
; 
; =  {sc.input.I[16].O} {sc.input.I[16].X}
(assert (= sc_60 sc_59))
; 
; =  {of.input.I[16].O} {of.input.I[16].X}
(assert (= of_60 of_59))
; 
; >=  {((sc.input.I[16].X*0.)+of.input.I[16].X)} {10.}
(assert (<= (+ (* sc_59 0.) of_59) 10.))
; 
; <=  {((sc.input.I[16].X*0.)+of.input.I[16].X)} {0.}
(assert (>= (+ (* sc_59 0.) of_59) 0.))
; 
; >=  {((sc.input.I[16].O*0.)+of.input.I[16].O)} {10.}
(assert (<= (+ (* sc_60 0.) of_60) 10.))
; 
; <=  {((sc.input.I[16].O*0.)+of.input.I[16].O)} {0.}
(assert (>= (+ (* sc_60 0.) of_60) 0.))
(declare-fun sc_61 () Real)
(assert (> sc_61 1e-08))
(declare-fun of_61 () Real)
(declare-fun sc_62 () Real)
(assert (> sc_62 1e-08))
(declare-fun of_62 () Real)
; 
; =  {sc.input.I[24].O} {sc.input.I[24].X}
(assert (= sc_62 sc_61))
; 
; =  {of.input.I[24].O} {of.input.I[24].X}
(assert (= of_62 of_61))
; 
; >=  {((sc.input.I[24].X*1.)+of.input.I[24].X)} {10.}
(assert (<= (+ (* sc_61 1.) of_61) 10.))
; 
; <=  {((sc.input.I[24].X*1.)+of.input.I[24].X)} {0.}
(assert (>= (+ (* sc_61 1.) of_61) 0.))
; 
; >=  {((sc.input.I[24].O*1.)+of.input.I[24].O)} {10.}
(assert (<= (+ (* sc_62 1.) of_62) 10.))
; 
; <=  {((sc.input.I[24].O*1.)+of.input.I[24].O)} {0.}
(assert (>= (+ (* sc_62 1.) of_62) 0.))
(declare-fun sc_63 () Real)
(assert (> sc_63 1e-08))
(declare-fun of_63 () Real)
(declare-fun sc_64 () Real)
(assert (> sc_64 1e-08))
(declare-fun of_64 () Real)
; 
; =  {sc.input.I[3].O} {sc.input.I[3].X}
(assert (= sc_64 sc_63))
; 
; =  {of.input.I[3].O} {of.input.I[3].X}
(assert (= of_64 of_63))
; 
; >=  {((sc.input.I[3].X*0.)+of.input.I[3].X)} {10.}
(assert (<= (+ (* sc_63 0.) of_63) 10.))
; 
; <=  {((sc.input.I[3].X*0.)+of.input.I[3].X)} {0.}
(assert (>= (+ (* sc_63 0.) of_63) 0.))
; 
; >=  {((sc.input.I[3].O*0.)+of.input.I[3].O)} {10.}
(assert (<= (+ (* sc_64 0.) of_64) 10.))
; 
; <=  {((sc.input.I[3].O*0.)+of.input.I[3].O)} {0.}
(assert (>= (+ (* sc_64 0.) of_64) 0.))
(declare-fun sc_65 () Real)
(assert (> sc_65 1e-08))
(declare-fun of_65 () Real)
(declare-fun sc_66 () Real)
(assert (> sc_66 1e-08))
(declare-fun of_66 () Real)
; 
; =  {sc.input.I[30].O} {sc.input.I[30].X}
(assert (= sc_66 sc_65))
; 
; =  {of.input.I[30].O} {of.input.I[30].X}
(assert (= of_66 of_65))
; 
; >=  {((sc.input.I[30].X*1.)+of.input.I[30].X)} {10.}
(assert (<= (+ (* sc_65 1.) of_65) 10.))
; 
; <=  {((sc.input.I[30].X*1.)+of.input.I[30].X)} {0.}
(assert (>= (+ (* sc_65 1.) of_65) 0.))
; 
; >=  {((sc.input.I[30].O*1.)+of.input.I[30].O)} {10.}
(assert (<= (+ (* sc_66 1.) of_66) 10.))
; 
; <=  {((sc.input.I[30].O*1.)+of.input.I[30].O)} {0.}
(assert (>= (+ (* sc_66 1.) of_66) 0.))
(declare-fun sc_67 () Real)
(assert (> sc_67 1e-08))
(declare-fun of_67 () Real)
(declare-fun sc_68 () Real)
(assert (> sc_68 1e-08))
(declare-fun of_68 () Real)
; 
; =  {sc.input.I[4].O} {sc.input.I[4].X}
(assert (= sc_68 sc_67))
; 
; =  {of.input.I[4].O} {of.input.I[4].X}
(assert (= of_68 of_67))
; 
; >=  {((sc.input.I[4].X*0.)+of.input.I[4].X)} {10.}
(assert (<= (+ (* sc_67 0.) of_67) 10.))
; 
; <=  {((sc.input.I[4].X*0.)+of.input.I[4].X)} {0.}
(assert (>= (+ (* sc_67 0.) of_67) 0.))
; 
; >=  {((sc.input.I[4].O*0.)+of.input.I[4].O)} {10.}
(assert (<= (+ (* sc_68 0.) of_68) 10.))
; 
; <=  {((sc.input.I[4].O*0.)+of.input.I[4].O)} {0.}
(assert (>= (+ (* sc_68 0.) of_68) 0.))
(declare-fun sc_69 () Real)
(assert (> sc_69 1e-08))
(declare-fun of_69 () Real)
(declare-fun sc_70 () Real)
(assert (> sc_70 1e-08))
(declare-fun of_70 () Real)
; 
; =  {sc.input.I[5].O} {sc.input.I[5].X}
(assert (= sc_70 sc_69))
; 
; =  {of.input.I[5].O} {of.input.I[5].X}
(assert (= of_70 of_69))
; 
; >=  {((sc.input.I[5].X*0.)+of.input.I[5].X)} {10.}
(assert (<= (+ (* sc_69 0.) of_69) 10.))
; 
; <=  {((sc.input.I[5].X*0.)+of.input.I[5].X)} {0.}
(assert (>= (+ (* sc_69 0.) of_69) 0.))
; 
; >=  {((sc.input.I[5].O*0.)+of.input.I[5].O)} {10.}
(assert (<= (+ (* sc_70 0.) of_70) 10.))
; 
; <=  {((sc.input.I[5].O*0.)+of.input.I[5].O)} {0.}
(assert (>= (+ (* sc_70 0.) of_70) 0.))
(declare-fun sc_71 () Real)
(assert (> sc_71 1e-08))
(declare-fun of_71 () Real)
(declare-fun sc_72 () Real)
(assert (> sc_72 1e-08))
(declare-fun of_72 () Real)
; 
; =  {sc.input.I[23].O} {sc.input.I[23].X}
(assert (= sc_72 sc_71))
; 
; =  {of.input.I[23].O} {of.input.I[23].X}
(assert (= of_72 of_71))
; 
; >=  {((sc.input.I[23].X*1.)+of.input.I[23].X)} {10.}
(assert (<= (+ (* sc_71 1.) of_71) 10.))
; 
; <=  {((sc.input.I[23].X*1.)+of.input.I[23].X)} {0.}
(assert (>= (+ (* sc_71 1.) of_71) 0.))
; 
; >=  {((sc.input.I[23].O*1.)+of.input.I[23].O)} {10.}
(assert (<= (+ (* sc_72 1.) of_72) 10.))
; 
; <=  {((sc.input.I[23].O*1.)+of.input.I[23].O)} {0.}
(assert (>= (+ (* sc_72 1.) of_72) 0.))
(declare-fun sc_73 () Real)
(assert (> sc_73 1e-08))
(declare-fun of_73 () Real)
(declare-fun sc_74 () Real)
(assert (> sc_74 1e-08))
(declare-fun of_74 () Real)
; 
; =  {sc.input.I[25].O} {sc.input.I[25].X}
(assert (= sc_74 sc_73))
; 
; =  {of.input.I[25].O} {of.input.I[25].X}
(assert (= of_74 of_73))
; 
; >=  {((sc.input.I[25].X*1.)+of.input.I[25].X)} {10.}
(assert (<= (+ (* sc_73 1.) of_73) 10.))
; 
; <=  {((sc.input.I[25].X*1.)+of.input.I[25].X)} {0.}
(assert (>= (+ (* sc_73 1.) of_73) 0.))
; 
; >=  {((sc.input.I[25].O*1.)+of.input.I[25].O)} {10.}
(assert (<= (+ (* sc_74 1.) of_74) 10.))
; 
; <=  {((sc.input.I[25].O*1.)+of.input.I[25].O)} {0.}
(assert (>= (+ (* sc_74 1.) of_74) 0.))
(declare-fun sc_75 () Real)
(assert (> sc_75 1e-08))
(declare-fun of_75 () Real)
(declare-fun sc_76 () Real)
(assert (> sc_76 1e-08))
(declare-fun of_76 () Real)
; 
; =  {sc.input.I[1].O} {sc.input.I[1].X}
(assert (= sc_76 sc_75))
; 
; =  {of.input.I[1].O} {of.input.I[1].X}
(assert (= of_76 of_75))
; 
; >=  {((sc.input.I[1].X*156.25)+of.input.I[1].X)} {10.}
(assert (<= (+ (* sc_75 156.25) of_75) 10.))
; 
; <=  {((sc.input.I[1].X*156.25)+of.input.I[1].X)} {0.}
(assert (>= (+ (* sc_75 156.25) of_75) 0.))
; 
; >=  {((sc.input.I[1].O*156.25)+of.input.I[1].O)} {10.}
(assert (<= (+ (* sc_76 156.25) of_76) 10.))
; 
; <=  {((sc.input.I[1].O*156.25)+of.input.I[1].O)} {0.}
(assert (>= (+ (* sc_76 156.25) of_76) 0.))
(declare-fun sc_77 () Real)
(assert (> sc_77 1e-08))
(declare-fun of_77 () Real)
(declare-fun sc_78 () Real)
(assert (> sc_78 1e-08))
(declare-fun of_78 () Real)
; 
; =  {sc.input.I[28].O} {sc.input.I[28].X}
(assert (= sc_78 sc_77))
; 
; =  {of.input.I[28].O} {of.input.I[28].X}
(assert (= of_78 of_77))
; 
; >=  {((sc.input.I[28].X*1.)+of.input.I[28].X)} {10.}
(assert (<= (+ (* sc_77 1.) of_77) 10.))
; 
; <=  {((sc.input.I[28].X*1.)+of.input.I[28].X)} {0.}
(assert (>= (+ (* sc_77 1.) of_77) 0.))
; 
; >=  {((sc.input.I[28].O*1.)+of.input.I[28].O)} {10.}
(assert (<= (+ (* sc_78 1.) of_78) 10.))
; 
; <=  {((sc.input.I[28].O*1.)+of.input.I[28].O)} {0.}
(assert (>= (+ (* sc_78 1.) of_78) 0.))
(declare-fun sc_79 () Real)
(assert (> sc_79 1e-08))
(declare-fun of_79 () Real)
(declare-fun sc_80 () Real)
(assert (> sc_80 1e-08))
(declare-fun of_80 () Real)
; 
; =  {sc.input.I[17].O} {sc.input.I[17].X}
(assert (= sc_80 sc_79))
; 
; =  {of.input.I[17].O} {of.input.I[17].X}
(assert (= of_80 of_79))
; 
; >=  {((sc.input.I[17].X*0.)+of.input.I[17].X)} {10.}
(assert (<= (+ (* sc_79 0.) of_79) 10.))
; 
; <=  {((sc.input.I[17].X*0.)+of.input.I[17].X)} {0.}
(assert (>= (+ (* sc_79 0.) of_79) 0.))
; 
; >=  {((sc.input.I[17].O*0.)+of.input.I[17].O)} {10.}
(assert (<= (+ (* sc_80 0.) of_80) 10.))
; 
; <=  {((sc.input.I[17].O*0.)+of.input.I[17].O)} {0.}
(assert (>= (+ (* sc_80 0.) of_80) 0.))
(declare-fun sc_81 () Real)
(assert (> sc_81 1e-08))
(declare-fun of_81 () Real)
(declare-fun sc_82 () Real)
(assert (> sc_82 1e-08))
(declare-fun of_82 () Real)
; 
; =  {sc.input.I[32].O} {sc.input.I[32].X}
(assert (= sc_82 sc_81))
; 
; =  {of.input.I[32].O} {of.input.I[32].X}
(assert (= of_82 of_81))
; 
; >=  {((sc.input.I[32].X*0.)+of.input.I[32].X)} {10.}
(assert (<= (+ (* sc_81 0.) of_81) 10.))
; 
; <=  {((sc.input.I[32].X*0.)+of.input.I[32].X)} {0.}
(assert (>= (+ (* sc_81 0.) of_81) 0.))
; 
; >=  {((sc.input.I[32].O*0.)+of.input.I[32].O)} {10.}
(assert (<= (+ (* sc_82 0.) of_82) 10.))
; 
; <=  {((sc.input.I[32].O*0.)+of.input.I[32].O)} {0.}
(assert (>= (+ (* sc_82 0.) of_82) 0.))
(declare-fun sc_83 () Real)
(assert (> sc_83 1e-08))
(declare-fun of_83 () Real)
(declare-fun sc_84 () Real)
(assert (> sc_84 1e-08))
(declare-fun of_84 () Real)
; 
; =  {sc.input.I[18].O} {sc.input.I[18].X}
(assert (= sc_84 sc_83))
; 
; =  {of.input.I[18].O} {of.input.I[18].X}
(assert (= of_84 of_83))
; 
; >=  {((sc.input.I[18].X*337.632520764)+of.input.I[18].X)} {10.}
(assert (<= (+ (* sc_83 337.632520764) of_83) 10.))
; 
; <=  {((sc.input.I[18].X*337.632520764)+of.input.I[18].X)} {0.}
(assert (>= (+ (* sc_83 337.632520764) of_83) 0.))
; 
; >=  {((sc.input.I[18].O*337.632520764)+of.input.I[18].O)} {10.}
(assert (<= (+ (* sc_84 337.632520764) of_84) 10.))
; 
; <=  {((sc.input.I[18].O*337.632520764)+of.input.I[18].O)} {0.}
(assert (>= (+ (* sc_84 337.632520764) of_84) 0.))
(declare-fun sc_85 () Real)
(assert (> sc_85 1e-08))
(declare-fun of_85 () Real)
(declare-fun sc_86 () Real)
(assert (> sc_86 1e-08))
(declare-fun of_86 () Real)
; 
; =  {sc.input.I[19].O} {sc.input.I[19].X}
(assert (= sc_86 sc_85))
; 
; =  {of.input.I[19].O} {of.input.I[19].X}
(assert (= of_86 of_85))
; 
; >=  {((sc.input.I[19].X*15.6)+of.input.I[19].X)} {10.}
(assert (<= (+ (* sc_85 15.6) of_85) 10.))
; 
; <=  {((sc.input.I[19].X*15.6)+of.input.I[19].X)} {0.}
(assert (>= (+ (* sc_85 15.6) of_85) 0.))
; 
; >=  {((sc.input.I[19].O*15.6)+of.input.I[19].O)} {10.}
(assert (<= (+ (* sc_86 15.6) of_86) 10.))
; 
; <=  {((sc.input.I[19].O*15.6)+of.input.I[19].O)} {0.}
(assert (>= (+ (* sc_86 15.6) of_86) 0.))
(declare-fun sc_87 () Real)
(assert (> sc_87 1e-08))
(declare-fun of_87 () Real)
(declare-fun sc_88 () Real)
(assert (> sc_88 1e-08))
(declare-fun of_88 () Real)
; 
; =  {sc.input.I[22].O} {sc.input.I[22].X}
(assert (= sc_88 sc_87))
; 
; =  {of.input.I[22].O} {of.input.I[22].X}
(assert (= of_88 of_87))
; 
; >=  {((sc.input.I[22].X*4.)+of.input.I[22].X)} {10.}
(assert (<= (+ (* sc_87 4.) of_87) 10.))
; 
; <=  {((sc.input.I[22].X*4.)+of.input.I[22].X)} {0.}
(assert (>= (+ (* sc_87 4.) of_87) 0.))
; 
; >=  {((sc.input.I[22].O*4.)+of.input.I[22].O)} {10.}
(assert (<= (+ (* sc_88 4.) of_88) 10.))
; 
; <=  {((sc.input.I[22].O*4.)+of.input.I[22].O)} {0.}
(assert (>= (+ (* sc_88 4.) of_88) 0.))
(declare-fun sc_89 () Real)
(assert (> sc_89 1e-08))
(declare-fun of_89 () Real)
(declare-fun sc_90 () Real)
(assert (> sc_90 1e-08))
(declare-fun of_90 () Real)
; 
; =  {sc.output.V[0].O} {sc.output.V[0].X}
(assert (= sc_90 sc_89))
; 
; =  {of.output.V[0].O} {of.output.V[0].X}
(assert (= of_90 of_89))
(declare-fun slbot_89 () Real)
(declare-fun sltop_89 () Real)
; 
; =  {(((sc.output.V[0].X*0.)+of.output.V[0].X)+sl.min.output.V[0].X)} {0.0001}
(assert (= (+ (+ (* sc_89 0.) of_89) slbot_89) 0.0001))
; 
; =  {(((sc.output.V[0].X*156.25)+of.output.V[0].X)+sl.max.output.V[0].X)} {3300.}
(assert (= (+ (+ (* sc_89 156.25) of_89) sltop_89) 3300.))
(declare-fun slbot_90 () Real)
(declare-fun sltop_90 () Real)
; 
; =  {(((sc.output.V[0].O*0.)+of.output.V[0].O)+sl.min.output.V[0].O)} {0.0001}
(assert (= (+ (+ (* sc_90 0.) of_90) slbot_90) 0.0001))
; 
; =  {(((sc.output.V[0].O*156.25)+of.output.V[0].O)+sl.max.output.V[0].O)} {3300.}
(assert (= (+ (+ (* sc_90 156.25) of_90) sltop_90) 3300.))
(declare-fun sc_91 () Real)
(assert (> sc_91 1e-08))
(declare-fun of_91 () Real)
(declare-fun sc_92 () Real)
(assert (> sc_92 1e-08))
(declare-fun of_92 () Real)
; 
; =  {sc.output.V[1].O} {sc.output.V[1].X}
(assert (= sc_92 sc_91))
; 
; =  {of.output.V[1].O} {of.output.V[1].X}
(assert (= of_92 of_91))
(declare-fun slbot_91 () Real)
(declare-fun sltop_91 () Real)
; 
; =  {(((sc.output.V[1].X*0.)+of.output.V[1].X)+sl.min.output.V[1].X)} {0.0001}
(assert (= (+ (+ (* sc_91 0.) of_91) slbot_91) 0.0001))
; 
; =  {(((sc.output.V[1].X*15.6)+of.output.V[1].X)+sl.max.output.V[1].X)} {3300.}
(assert (= (+ (+ (* sc_91 15.6) of_91) sltop_91) 3300.))
(declare-fun slbot_92 () Real)
(declare-fun sltop_92 () Real)
; 
; =  {(((sc.output.V[1].O*0.)+of.output.V[1].O)+sl.min.output.V[1].O)} {0.0001}
(assert (= (+ (+ (* sc_92 0.) of_92) slbot_92) 0.0001))
; 
; =  {(((sc.output.V[1].O*15.6)+of.output.V[1].O)+sl.max.output.V[1].O)} {3300.}
(assert (= (+ (+ (* sc_92 15.6) of_92) sltop_92) 3300.))
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
(declare-fun sc_97 () Real)
(assert (> sc_97 1e-08))
(declare-fun of_97 () Real)
(declare-fun sc_98 () Real)
(assert (> sc_98 1e-08))
(declare-fun of_98 () Real)
(declare-fun sc_99 () Real)
(assert (> sc_99 1e-08))
(declare-fun of_99 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_94 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_95 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_97 0.))
; 
; =  {sc.vadd[13].A} {(1.*sc.vadd[13].B)}
(assert (= sc_96 (* 1. sc_97)))
; 
; =  {sc.vadd[13].A} {(1.*sc.vadd[13].C)} {(1.*sc.vadd[13].D)}
(assert (and (= sc_96 (* 1. sc_95)) (= sc_96 (* 1. sc_94))))
; no offset
(assert (= (- (+ of_96 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[13].OUT} {(sc.vadd[13].A*1.)}
(assert (= sc_98 (* sc_96 1.)))
; 
; =  {of.vadd[13].OUT} {0.}
(assert (= of_98 0.))
; no scale
(assert (= sc_94 1.))
; no scale
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_94 0.))
; no offset
(assert (= of_99 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_95 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_97 0.))
; 
; =  {sc.vadd[13].A} {(1.*sc.vadd[13].B)}
(assert (= sc_96 (* 1. sc_97)))
; 
; =  {sc.vadd[13].A} {(1.*sc.vadd[13].C)} {(1.*sc.vadd[13].D*sc.vadd[13].OUT2)}
(assert (and (= sc_96 (* 1. sc_95)) (= sc_96 (* (* 1. sc_94) sc_99))))
; no offset
(assert (= (- (+ of_96 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[13].OUT2} {(sc.vadd[13].A*1.)}
(assert (= sc_99 (* sc_96 1.)))
; no offset
(assert (= of_99 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[13].OUT2_0} {(sc.vadd[13].A*1.)}
(assert (= sc_93 (* sc_96 1.)))
; 
; =  {of.vadd[13].OUT2_0} {0.}
(assert (= of_93 0.))
; 
; >=  {((sc.vadd[13].OUT2_0*0.)+of.vadd[13].OUT2_0)} {3300.}
(assert (<= (+ (* sc_93 0.) of_93) 3300.))
; 
; <=  {((sc.vadd[13].OUT2_0*0.)+of.vadd[13].OUT2_0)} {0.}
(assert (>= (+ (* sc_93 0.) of_93) 0.))
; 
; >=  {((sc.vadd[13].D*4.)+of.vadd[13].D)} {3300.}
(assert (<= (+ (* sc_94 4.) of_94) 3300.))
; 
; <=  {((sc.vadd[13].D*4.)+of.vadd[13].D)} {0.}
(assert (>= (+ (* sc_94 4.) of_94) 0.))
; 
; >=  {((sc.vadd[13].C*0.)+of.vadd[13].C)} {3300.}
(assert (<= (+ (* sc_95 0.) of_95) 3300.))
; 
; <=  {((sc.vadd[13].C*0.)+of.vadd[13].C)} {0.}
(assert (>= (+ (* sc_95 0.) of_95) 0.))
; 
; >=  {((sc.vadd[13].A*0.)+of.vadd[13].A)} {3300.}
(assert (<= (+ (* sc_96 0.) of_96) 3300.))
; 
; <=  {((sc.vadd[13].A*0.)+of.vadd[13].A)} {0.}
(assert (>= (+ (* sc_96 0.) of_96) 0.))
(declare-fun slbot_99 () Real)
(declare-fun sltop_99 () Real)
; 
; =  {(((sc.vadd[13].OUT2*0.)+of.vadd[13].OUT2)+sl.min.vadd[13].OUT2)} {0.}
(assert (= (+ (+ (* sc_99 0.) of_99) slbot_99) 0.))
; 
; =  {(((sc.vadd[13].OUT2*15.6)+of.vadd[13].OUT2)+sl.max.vadd[13].OUT2)} {3300.}
(assert (= (+ (+ (* sc_99 15.6) of_99) sltop_99) 3300.))
(declare-fun slbot_97 () Real)
(declare-fun sltop_97 () Real)
; 
; =  {(((sc.vadd[13].B*0.00204799328914)+of.vadd[13].B)+sl.min.vadd[13].B)} {0.}
(assert (= (+ (+ (* sc_97 0.00204799328914) of_97) slbot_97) 0.))
; 
; =  {(((sc.vadd[13].B*625.)+of.vadd[13].B)+sl.max.vadd[13].B)} {3300.}
(assert (= (+ (+ (* sc_97 625.) of_97) sltop_97) 3300.))
(declare-fun slbot_98 () Real)
(declare-fun sltop_98 () Real)
; 
; =  {(((sc.vadd[13].OUT*0.00204799328914)+of.vadd[13].OUT)+sl.min.vadd[13].OUT)} {-1650.}
(assert (= (+ (+ (* sc_98 0.00204799328914) of_98) slbot_98) -1650.))
; 
; =  {(((sc.vadd[13].OUT*625.)+of.vadd[13].OUT)+sl.max.vadd[13].OUT)} {1650.}
(assert (= (+ (+ (* sc_98 625.) of_98) sltop_98) 1650.))
(declare-fun slbot_99 () Real)
(declare-fun sltop_99 () Real)
; 
; =  {(((sc.vadd[13].OUT2*0.)+of.vadd[13].OUT2)+sl.min.vadd[13].OUT2)} {0.}
(assert (= (+ (+ (* sc_99 0.) of_99) slbot_99) 0.))
; 
; =  {(((sc.vadd[13].OUT2*15.6)+of.vadd[13].OUT2)+sl.max.vadd[13].OUT2)} {3300.}
(assert (= (+ (+ (* sc_99 15.6) of_99) sltop_99) 3300.))
(declare-fun sc_100 () Real)
(assert (> sc_100 1e-08))
(declare-fun of_100 () Real)
(declare-fun sc_101 () Real)
(assert (> sc_101 1e-08))
(declare-fun of_101 () Real)
(declare-fun sc_102 () Real)
(assert (> sc_102 1e-08))
(declare-fun of_102 () Real)
(declare-fun sc_103 () Real)
(assert (> sc_103 1e-08))
(declare-fun of_103 () Real)
(declare-fun sc_104 () Real)
(assert (> sc_104 1e-08))
(declare-fun of_104 () Real)
(declare-fun sc_105 () Real)
(assert (> sc_105 1e-08))
(declare-fun of_105 () Real)
(declare-fun sc_106 () Real)
(assert (> sc_106 1e-08))
(declare-fun of_106 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_101 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_102 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_104 0.))
; 
; =  {sc.vadd[1].A} {(1.*sc.vadd[1].B)}
(assert (= sc_103 (* 1. sc_104)))
; 
; =  {sc.vadd[1].A} {(1.*sc.vadd[1].C)} {(1.*sc.vadd[1].D)}
(assert (and (= sc_103 (* 1. sc_102)) (= sc_103 (* 1. sc_101))))
; no offset
(assert (= (- (+ of_103 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[1].OUT} {(sc.vadd[1].A*1.)}
(assert (= sc_105 (* sc_103 1.)))
; 
; =  {of.vadd[1].OUT} {0.}
(assert (= of_105 0.))
; no scale
(assert (= sc_101 1.))
; no scale
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_101 0.))
; no offset
(assert (= of_106 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_102 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_104 0.))
; 
; =  {sc.vadd[1].A} {(1.*sc.vadd[1].B)}
(assert (= sc_103 (* 1. sc_104)))
; 
; =  {sc.vadd[1].A} {(1.*sc.vadd[1].C)} {(1.*sc.vadd[1].D*sc.vadd[1].OUT2)}
(assert (and (= sc_103 (* 1. sc_102)) (= sc_103 (* (* 1. sc_101) sc_106))))
; no offset
(assert (= (- (+ of_103 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[1].OUT2} {(sc.vadd[1].A*1.)}
(assert (= sc_106 (* sc_103 1.)))
; no offset
(assert (= of_106 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[1].OUT2_0} {(sc.vadd[1].A*1.)}
(assert (= sc_100 (* sc_103 1.)))
; 
; =  {of.vadd[1].OUT2_0} {0.}
(assert (= of_100 0.))
; 
; >=  {((sc.vadd[1].OUT2_0*0.)+of.vadd[1].OUT2_0)} {3300.}
(assert (<= (+ (* sc_100 0.) of_100) 3300.))
; 
; <=  {((sc.vadd[1].OUT2_0*0.)+of.vadd[1].OUT2_0)} {0.}
(assert (>= (+ (* sc_100 0.) of_100) 0.))
; 
; >=  {((sc.vadd[1].D*4.)+of.vadd[1].D)} {3300.}
(assert (<= (+ (* sc_101 4.) of_101) 3300.))
; 
; <=  {((sc.vadd[1].D*4.)+of.vadd[1].D)} {0.}
(assert (>= (+ (* sc_101 4.) of_101) 0.))
; 
; >=  {((sc.vadd[1].C*0.)+of.vadd[1].C)} {3300.}
(assert (<= (+ (* sc_102 0.) of_102) 3300.))
; 
; <=  {((sc.vadd[1].C*0.)+of.vadd[1].C)} {0.}
(assert (>= (+ (* sc_102 0.) of_102) 0.))
; 
; >=  {((sc.vadd[1].A*0.)+of.vadd[1].A)} {3300.}
(assert (<= (+ (* sc_103 0.) of_103) 3300.))
; 
; <=  {((sc.vadd[1].A*0.)+of.vadd[1].A)} {0.}
(assert (>= (+ (* sc_103 0.) of_103) 0.))
(declare-fun slbot_106 () Real)
(declare-fun sltop_106 () Real)
; 
; =  {(((sc.vadd[1].OUT2*0.)+of.vadd[1].OUT2)+sl.min.vadd[1].OUT2)} {0.}
(assert (= (+ (+ (* sc_106 0.) of_106) slbot_106) 0.))
; 
; =  {(((sc.vadd[1].OUT2*156.25)+of.vadd[1].OUT2)+sl.max.vadd[1].OUT2)} {3300.}
(assert (= (+ (+ (* sc_106 156.25) of_106) sltop_106) 3300.))
(declare-fun slbot_104 () Real)
(declare-fun sltop_104 () Real)
; 
; =  {(((sc.vadd[1].B*3.75903614458)+of.vadd[1].B)+sl.min.vadd[1].B)} {0.}
(assert (= (+ (+ (* sc_104 3.75903614458) of_104) slbot_104) 0.))
; 
; =  {(((sc.vadd[1].B*62.4)+of.vadd[1].B)+sl.max.vadd[1].B)} {3300.}
(assert (= (+ (+ (* sc_104 62.4) of_104) sltop_104) 3300.))
(declare-fun slbot_105 () Real)
(declare-fun sltop_105 () Real)
; 
; =  {(((sc.vadd[1].OUT*3.75903614458)+of.vadd[1].OUT)+sl.min.vadd[1].OUT)} {-1650.}
(assert (= (+ (+ (* sc_105 3.75903614458) of_105) slbot_105) -1650.))
; 
; =  {(((sc.vadd[1].OUT*62.4)+of.vadd[1].OUT)+sl.max.vadd[1].OUT)} {1650.}
(assert (= (+ (+ (* sc_105 62.4) of_105) sltop_105) 1650.))
(declare-fun slbot_106 () Real)
(declare-fun sltop_106 () Real)
; 
; =  {(((sc.vadd[1].OUT2*0.)+of.vadd[1].OUT2)+sl.min.vadd[1].OUT2)} {0.}
(assert (= (+ (+ (* sc_106 0.) of_106) slbot_106) 0.))
; 
; =  {(((sc.vadd[1].OUT2*156.25)+of.vadd[1].OUT2)+sl.max.vadd[1].OUT2)} {3300.}
(assert (= (+ (+ (* sc_106 156.25) of_106) sltop_106) 3300.))
(declare-fun sc_107 () Real)
(assert (> sc_107 1e-08))
(declare-fun of_107 () Real)
(declare-fun sc_108 () Real)
(assert (> sc_108 1e-08))
(declare-fun of_108 () Real)
(declare-fun sc_109 () Real)
(assert (> sc_109 1e-08))
(declare-fun of_109 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_108 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_107 0.))
; 
; =  {sc.vtoi[7].Y} {((1./sc.vtoi[7].K)*sc.vtoi[7].X)}
(assert (= sc_109 (* (/ 1. sc_108) sc_107)))
; 
; =  {of.vtoi[7].Y} {0.}
(assert (= of_109 0.))
; 
; >=  {((sc.vtoi[7].X*1.)+of.vtoi[7].X)} {3300.}
(assert (<= (+ (* sc_107 1.) of_107) 3300.))
; 
; <=  {((sc.vtoi[7].X*1.)+of.vtoi[7].X)} {1.}
(assert (>= (+ (* sc_107 1.) of_107) 1.))
(declare-fun slbot_109 () Real)
(declare-fun sltop_109 () Real)
; 
; =  {(((sc.vtoi[7].Y*0.)+of.vtoi[7].Y)+sl.min.vtoi[7].Y)} {0.00030303030303}
(assert (= (+ (+ (* sc_109 0.) of_109) slbot_109) 0.00030303030303))
; 
; =  {(((sc.vtoi[7].Y*305175.78125)+of.vtoi[7].Y)+sl.max.vtoi[7].Y)} {3300.}
(assert (= (+ (+ (* sc_109 305175.78125) of_109) sltop_109) 3300.))
(declare-fun slbot_108 () Real)
(declare-fun sltop_108 () Real)
; 
; =  {(((sc.vtoi[7].K*0.)+of.vtoi[7].K)+sl.min.vtoi[7].K)} {1.}
(assert (= (+ (+ (* sc_108 0.) of_108) slbot_108) 1.))
; 
; =  {(((sc.vtoi[7].K*3.2768e-06)+of.vtoi[7].K)+sl.max.vtoi[7].K)} {3300.}
(assert (= (+ (+ (* sc_108 3.2768e-06) of_108) sltop_108) 3300.))
(declare-fun slbot_109 () Real)
(declare-fun sltop_109 () Real)
; 
; =  {(((sc.vtoi[7].Y*0.)+of.vtoi[7].Y)+sl.min.vtoi[7].Y)} {0.00030303030303}
(assert (= (+ (+ (* sc_109 0.) of_109) slbot_109) 0.00030303030303))
; 
; =  {(((sc.vtoi[7].Y*305175.78125)+of.vtoi[7].Y)+sl.max.vtoi[7].Y)} {3300.}
(assert (= (+ (+ (* sc_109 305175.78125) of_109) sltop_109) 3300.))
(declare-fun sc_110 () Real)
(assert (> sc_110 1e-08))
(declare-fun of_110 () Real)
(declare-fun sc_111 () Real)
(assert (> sc_111 1e-08))
(declare-fun of_111 () Real)
(declare-fun sc_112 () Real)
(assert (> sc_112 1e-08))
(declare-fun of_112 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_111 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_110 0.))
; 
; =  {sc.vtoi[3].Y} {((1./sc.vtoi[3].K)*sc.vtoi[3].X)}
(assert (= sc_112 (* (/ 1. sc_111) sc_110)))
; 
; =  {of.vtoi[3].Y} {0.}
(assert (= of_112 0.))
(declare-fun slbot_110 () Real)
(declare-fun sltop_110 () Real)
; 
; =  {(((sc.vtoi[3].X*0.)+of.vtoi[3].X)+sl.min.vtoi[3].X)} {1.}
(assert (= (+ (+ (* sc_110 0.) of_110) slbot_110) 1.))
; 
; =  {(((sc.vtoi[3].X*156.25)+of.vtoi[3].X)+sl.max.vtoi[3].X)} {3300.}
(assert (= (+ (+ (* sc_110 156.25) of_110) sltop_110) 3300.))
(declare-fun slbot_112 () Real)
(declare-fun sltop_112 () Real)
; 
; =  {(((sc.vtoi[3].Y*-156.25)+of.vtoi[3].Y)+sl.min.vtoi[3].Y)} {0.00030303030303}
(assert (= (+ (+ (* sc_112 -156.25) of_112) slbot_112) 0.00030303030303))
; 
; =  {(((sc.vtoi[3].Y*0.)+of.vtoi[3].Y)+sl.max.vtoi[3].Y)} {3300.}
(assert (= (+ (+ (* sc_112 0.) of_112) sltop_112) 3300.))
; 
; >=  {((sc.vtoi[3].K*-1.)+of.vtoi[3].K)} {3300.}
(assert (<= (+ (* sc_111 -1.) of_111) 3300.))
; 
; <=  {((sc.vtoi[3].K*-1.)+of.vtoi[3].K)} {1.}
(assert (>= (+ (* sc_111 -1.) of_111) 1.))
(declare-fun sc_113 () Real)
(assert (> sc_113 1e-08))
(declare-fun of_113 () Real)
(declare-fun sc_114 () Real)
(assert (> sc_114 1e-08))
(declare-fun of_114 () Real)
(declare-fun sc_115 () Real)
(assert (> sc_115 1e-08))
(declare-fun of_115 () Real)
(declare-fun sc_116 () Real)
(assert (> sc_116 1e-08))
(declare-fun of_116 () Real)
; no offset
(assert (= of_114 0.))
; no offset
(assert (= of_113 0.))
; 
; =  {1.} {(sc.igenebind[2].K*sc.igenebind[2].TF)}
(assert (= 1. (* sc_114 sc_113)))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_115 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.igenebind[2].GE} {(sc.igenebind[2].Vmax*(1./1.))}
(assert (= sc_116 (* sc_115 (/ 1. 1.))))
; 
; =  {of.igenebind[2].GE} {0.}
(assert (= of_116 0.))
; 
; >=  {((sc.igenebind[2].TF*1.)+of.igenebind[2].TF)} {10.}
(assert (<= (+ (* sc_113 1.) of_113) 10.))
; 
; <=  {((sc.igenebind[2].TF*1.)+of.igenebind[2].TF)} {0.0001}
(assert (>= (+ (* sc_113 1.) of_113) 0.0001))
(declare-fun slbot_114 () Real)
(declare-fun sltop_114 () Real)
; 
; =  {(((sc.igenebind[2].K*0.)+of.igenebind[2].K)+sl.min.igenebind[2].K)} {0.0001}
(assert (= (+ (+ (* sc_114 0.) of_114) slbot_114) 0.0001))
; 
; =  {(((sc.igenebind[2].K*15.6)+of.igenebind[2].K)+sl.max.igenebind[2].K)} {10.}
(assert (= (+ (+ (* sc_114 15.6) of_114) sltop_114) 10.))
(declare-fun slbot_116 () Real)
(declare-fun sltop_116 () Real)
; 
; =  {(((sc.igenebind[2].GE*0.939759036145)+of.igenebind[2].GE)+sl.min.igenebind[2].GE)} {9.90099009901e-07}
(assert (= (+ (+ (* sc_116 0.939759036145) of_116) slbot_116) 9.90099009901e-07))
; 
; =  {(((sc.igenebind[2].GE*15.6)+of.igenebind[2].GE)+sl.max.igenebind[2].GE)} {9.9999999}
(assert (= (+ (+ (* sc_116 15.6) of_116) sltop_116) 9.9999999))
; 
; >=  {((sc.igenebind[2].Vmax*15.6)+of.igenebind[2].Vmax)} {10.}
(assert (<= (+ (* sc_115 15.6) of_115) 10.))
; 
; <=  {((sc.igenebind[2].Vmax*15.6)+of.igenebind[2].Vmax)} {0.0001}
(assert (>= (+ (* sc_115 15.6) of_115) 0.0001))
(declare-fun sc_117 () Real)
(assert (> sc_117 1e-08))
(declare-fun of_117 () Real)
(declare-fun sc_118 () Real)
(assert (> sc_118 1e-08))
(declare-fun of_118 () Real)
(declare-fun sc_119 () Real)
(assert (> sc_119 1e-08))
(declare-fun of_119 () Real)
(declare-fun sc_120 () Real)
(assert (> sc_120 1e-08))
(declare-fun of_120 () Real)
; no offset
(assert (= of_118 0.))
; no offset
(assert (= of_117 0.))
; 
; =  {1.} {(sc.igenebind[4].K*sc.igenebind[4].TF)}
(assert (= 1. (* sc_118 sc_117)))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_119 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.igenebind[4].GE} {(sc.igenebind[4].Vmax*(1./1.))}
(assert (= sc_120 (* sc_119 (/ 1. 1.))))
; 
; =  {of.igenebind[4].GE} {0.}
(assert (= of_120 0.))
(declare-fun slbot_117 () Real)
(declare-fun sltop_117 () Real)
; 
; =  {(((sc.igenebind[4].TF*0.)+of.igenebind[4].TF)+sl.min.igenebind[4].TF)} {0.0001}
(assert (= (+ (+ (* sc_117 0.) of_117) slbot_117) 0.0001))
; 
; =  {(((sc.igenebind[4].TF*305175.78125)+of.igenebind[4].TF)+sl.max.igenebind[4].TF)} {10.}
(assert (= (+ (+ (* sc_117 305175.78125) of_117) sltop_117) 10.))
; 
; >=  {((sc.igenebind[4].K*1.)+of.igenebind[4].K)} {10.}
(assert (<= (+ (* sc_118 1.) of_118) 10.))
; 
; <=  {((sc.igenebind[4].K*1.)+of.igenebind[4].K)} {0.0001}
(assert (>= (+ (* sc_118 1.) of_118) 0.0001))
(declare-fun slbot_120 () Real)
(declare-fun sltop_120 () Real)
; 
; =  {(((sc.igenebind[4].GE*0.000511998322284)+of.igenebind[4].GE)+sl.min.igenebind[4].GE)} {9.90099009901e-07}
(assert (= (+ (+ (* sc_120 0.000511998322284) of_120) slbot_120) 9.90099009901e-07))
; 
; =  {(((sc.igenebind[4].GE*156.25)+of.igenebind[4].GE)+sl.max.igenebind[4].GE)} {9.9999999}
(assert (= (+ (+ (* sc_120 156.25) of_120) sltop_120) 9.9999999))
; 
; >=  {((sc.igenebind[4].Vmax*156.25)+of.igenebind[4].Vmax)} {10.}
(assert (<= (+ (* sc_119 156.25) of_119) 10.))
; 
; <=  {((sc.igenebind[4].Vmax*156.25)+of.igenebind[4].Vmax)} {0.0001}
(assert (>= (+ (* sc_119 156.25) of_119) 0.0001))
(declare-fun slbot_120 () Real)
(declare-fun sltop_120 () Real)
; 
; =  {(((sc.igenebind[4].GE*0.000511998322284)+of.igenebind[4].GE)+sl.min.igenebind[4].GE)} {9.90099009901e-07}
(assert (= (+ (+ (* sc_120 0.000511998322284) of_120) slbot_120) 9.90099009901e-07))
; 
; =  {(((sc.igenebind[4].GE*156.25)+of.igenebind[4].GE)+sl.max.igenebind[4].GE)} {9.9999999}
(assert (= (+ (+ (* sc_120 156.25) of_120) sltop_120) 9.9999999))
(declare-fun sc_121 () Real)
(assert (> sc_121 1e-08))
(declare-fun of_121 () Real)
(declare-fun sc_122 () Real)
(assert (> sc_122 1e-08))
(declare-fun of_122 () Real)
(declare-fun sc_123 () Real)
(assert (> sc_123 1e-08))
(declare-fun of_123 () Real)
(declare-fun sc_124 () Real)
(assert (> sc_124 1e-08))
(declare-fun of_124 () Real)
; no offset
(assert (= of_122 0.))
; no offset
(assert (= of_121 0.))
; 
; =  {1.} {(sc.igenebind[18].K*sc.igenebind[18].TF)}
(assert (= 1. (* sc_122 sc_121)))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_123 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.igenebind[18].GE} {(sc.igenebind[18].Vmax*(1./1.))}
(assert (= sc_124 (* sc_123 (/ 1. 1.))))
; 
; =  {of.igenebind[18].GE} {0.}
(assert (= of_124 0.))
(declare-fun slbot_121 () Real)
(declare-fun sltop_121 () Real)
; 
; =  {(((sc.igenebind[18].TF*-1.)+of.igenebind[18].TF)+sl.min.igenebind[18].TF)} {0.0001}
(assert (= (+ (+ (* sc_121 -1.) of_121) slbot_121) 0.0001))
; 
; =  {(((sc.igenebind[18].TF*-0.4)+of.igenebind[18].TF)+sl.max.igenebind[18].TF)} {10.}
(assert (= (+ (+ (* sc_121 -0.4) of_121) sltop_121) 10.))
; 
; >=  {((sc.igenebind[18].K*1.)+of.igenebind[18].K)} {10.}
(assert (<= (+ (* sc_122 1.) of_122) 10.))
; 
; <=  {((sc.igenebind[18].K*1.)+of.igenebind[18].K)} {0.0001}
(assert (>= (+ (* sc_122 1.) of_122) 0.0001))
(declare-fun slbot_124 () Real)
(declare-fun sltop_124 () Real)
; 
; =  {(((sc.igenebind[18].GE*0.)+of.igenebind[18].GE)+sl.min.igenebind[18].GE)} {9.90099009901e-07}
(assert (= (+ (+ (* sc_124 0.) of_124) slbot_124) 9.90099009901e-07))
; 
; =  {(((sc.igenebind[18].GE*1.66666666667)+of.igenebind[18].GE)+sl.max.igenebind[18].GE)} {9.9999999}
(assert (= (+ (+ (* sc_124 1.66666666667) of_124) sltop_124) 9.9999999))
; 
; >=  {((sc.igenebind[18].Vmax*1.)+of.igenebind[18].Vmax)} {10.}
(assert (<= (+ (* sc_123 1.) of_123) 10.))
; 
; <=  {((sc.igenebind[18].Vmax*1.)+of.igenebind[18].Vmax)} {0.0001}
(assert (>= (+ (* sc_123 1.) of_123) 0.0001))
(declare-fun slbot_124 () Real)
(declare-fun sltop_124 () Real)
; 
; =  {(((sc.igenebind[18].GE*0.)+of.igenebind[18].GE)+sl.min.igenebind[18].GE)} {9.90099009901e-07}
(assert (= (+ (+ (* sc_124 0.) of_124) slbot_124) 9.90099009901e-07))
; 
; =  {(((sc.igenebind[18].GE*1.66666666667)+of.igenebind[18].GE)+sl.max.igenebind[18].GE)} {9.9999999}
(assert (= (+ (+ (* sc_124 1.66666666667) of_124) sltop_124) 9.9999999))
(declare-fun sc_125 () Real)
(assert (> sc_125 1e-08))
(declare-fun of_125 () Real)
(declare-fun sc_126 () Real)
(assert (> sc_126 1e-08))
(declare-fun of_126 () Real)
; 
; =  {sc.input.V[2].O} {sc.input.V[2].X}
(assert (= sc_126 sc_125))
; 
; =  {of.input.V[2].O} {of.input.V[2].X}
(assert (= of_126 of_125))
; 
; >=  {((sc.input.V[2].X*0.)+of.input.V[2].X)} {3300.}
(assert (<= (+ (* sc_125 0.) of_125) 3300.))
; 
; <=  {((sc.input.V[2].X*0.)+of.input.V[2].X)} {0.}
(assert (>= (+ (* sc_125 0.) of_125) 0.))
; 
; >=  {((sc.input.V[2].O*0.)+of.input.V[2].O)} {3300.}
(assert (<= (+ (* sc_126 0.) of_126) 3300.))
; 
; <=  {((sc.input.V[2].O*0.)+of.input.V[2].O)} {0.}
(assert (>= (+ (* sc_126 0.) of_126) 0.))
(declare-fun sc_127 () Real)
(assert (> sc_127 1e-08))
(declare-fun of_127 () Real)
(declare-fun sc_128 () Real)
(assert (> sc_128 1e-08))
(declare-fun of_128 () Real)
; 
; =  {sc.input.V[8].O} {sc.input.V[8].X}
(assert (= sc_128 sc_127))
; 
; =  {of.input.V[8].O} {of.input.V[8].X}
(assert (= of_128 of_127))
; 
; >=  {((sc.input.V[8].X*-500.)+of.input.V[8].X)} {3300.}
(assert (<= (+ (* sc_127 -500.) of_127) 3300.))
; 
; <=  {((sc.input.V[8].X*-500.)+of.input.V[8].X)} {0.}
(assert (>= (+ (* sc_127 -500.) of_127) 0.))
; 
; >=  {((sc.input.V[8].O*-500.)+of.input.V[8].O)} {3300.}
(assert (<= (+ (* sc_128 -500.) of_128) 3300.))
; 
; <=  {((sc.input.V[8].O*-500.)+of.input.V[8].O)} {0.}
(assert (>= (+ (* sc_128 -500.) of_128) 0.))
(declare-fun sc_129 () Real)
(assert (> sc_129 1e-08))
(declare-fun of_129 () Real)
(declare-fun sc_130 () Real)
(assert (> sc_130 1e-08))
(declare-fun of_130 () Real)
; 
; =  {sc.input.V[7].O} {sc.input.V[7].X}
(assert (= sc_130 sc_129))
; 
; =  {of.input.V[7].O} {of.input.V[7].X}
(assert (= of_130 of_129))
; 
; >=  {((sc.input.V[7].X*0.)+of.input.V[7].X)} {3300.}
(assert (<= (+ (* sc_129 0.) of_129) 3300.))
; 
; <=  {((sc.input.V[7].X*0.)+of.input.V[7].X)} {0.}
(assert (>= (+ (* sc_129 0.) of_129) 0.))
; 
; >=  {((sc.input.V[7].O*0.)+of.input.V[7].O)} {3300.}
(assert (<= (+ (* sc_130 0.) of_130) 3300.))
; 
; <=  {((sc.input.V[7].O*0.)+of.input.V[7].O)} {0.}
(assert (>= (+ (* sc_130 0.) of_130) 0.))
(declare-fun sc_131 () Real)
(assert (> sc_131 1e-08))
(declare-fun of_131 () Real)
(declare-fun sc_132 () Real)
(assert (> sc_132 1e-08))
(declare-fun of_132 () Real)
; 
; =  {sc.input.V[13].O} {sc.input.V[13].X}
(assert (= sc_132 sc_131))
; 
; =  {of.input.V[13].O} {of.input.V[13].X}
(assert (= of_132 of_131))
; 
; >=  {((sc.input.V[13].X*1.)+of.input.V[13].X)} {3300.}
(assert (<= (+ (* sc_131 1.) of_131) 3300.))
; 
; <=  {((sc.input.V[13].X*1.)+of.input.V[13].X)} {0.}
(assert (>= (+ (* sc_131 1.) of_131) 0.))
; 
; >=  {((sc.input.V[13].O*1.)+of.input.V[13].O)} {3300.}
(assert (<= (+ (* sc_132 1.) of_132) 3300.))
; 
; <=  {((sc.input.V[13].O*1.)+of.input.V[13].O)} {0.}
(assert (>= (+ (* sc_132 1.) of_132) 0.))
(declare-fun sc_133 () Real)
(assert (> sc_133 1e-08))
(declare-fun of_133 () Real)
(declare-fun sc_134 () Real)
(assert (> sc_134 1e-08))
(declare-fun of_134 () Real)
; 
; =  {sc.input.V[12].O} {sc.input.V[12].X}
(assert (= sc_134 sc_133))
; 
; =  {of.input.V[12].O} {of.input.V[12].X}
(assert (= of_134 of_133))
; 
; >=  {((sc.input.V[12].X*1000.75)+of.input.V[12].X)} {3300.}
(assert (<= (+ (* sc_133 1000.75) of_133) 3300.))
; 
; <=  {((sc.input.V[12].X*1000.75)+of.input.V[12].X)} {0.}
(assert (>= (+ (* sc_133 1000.75) of_133) 0.))
; 
; >=  {((sc.input.V[12].O*1000.75)+of.input.V[12].O)} {3300.}
(assert (<= (+ (* sc_134 1000.75) of_134) 3300.))
; 
; <=  {((sc.input.V[12].O*1000.75)+of.input.V[12].O)} {0.}
(assert (>= (+ (* sc_134 1000.75) of_134) 0.))
(declare-fun sc_135 () Real)
(assert (> sc_135 1e-08))
(declare-fun of_135 () Real)
(declare-fun sc_136 () Real)
(assert (> sc_136 1e-08))
(declare-fun of_136 () Real)
; 
; =  {sc.input.V[9].O} {sc.input.V[9].X}
(assert (= sc_136 sc_135))
; 
; =  {of.input.V[9].O} {of.input.V[9].X}
(assert (= of_136 of_135))
; 
; >=  {((sc.input.V[9].X*-1.)+of.input.V[9].X)} {3300.}
(assert (<= (+ (* sc_135 -1.) of_135) 3300.))
; 
; <=  {((sc.input.V[9].X*-1.)+of.input.V[9].X)} {0.}
(assert (>= (+ (* sc_135 -1.) of_135) 0.))
; 
; >=  {((sc.input.V[9].O*-1.)+of.input.V[9].O)} {3300.}
(assert (<= (+ (* sc_136 -1.) of_136) 3300.))
; 
; <=  {((sc.input.V[9].O*-1.)+of.input.V[9].O)} {0.}
(assert (>= (+ (* sc_136 -1.) of_136) 0.))
(declare-fun sc_137 () Real)
(assert (> sc_137 1e-08))
(declare-fun of_137 () Real)
(declare-fun sc_138 () Real)
(assert (> sc_138 1e-08))
(declare-fun of_138 () Real)
; 
; =  {sc.input.V[0].O} {sc.input.V[0].X}
(assert (= sc_138 sc_137))
; 
; =  {of.input.V[0].O} {of.input.V[0].X}
(assert (= of_138 of_137))
; 
; >=  {((sc.input.V[0].X*2.)+of.input.V[0].X)} {3300.}
(assert (<= (+ (* sc_137 2.) of_137) 3300.))
; 
; <=  {((sc.input.V[0].X*2.)+of.input.V[0].X)} {0.}
(assert (>= (+ (* sc_137 2.) of_137) 0.))
; 
; >=  {((sc.input.V[0].O*2.)+of.input.V[0].O)} {3300.}
(assert (<= (+ (* sc_138 2.) of_138) 3300.))
; 
; <=  {((sc.input.V[0].O*2.)+of.input.V[0].O)} {0.}
(assert (>= (+ (* sc_138 2.) of_138) 0.))
(declare-fun sc_139 () Real)
(assert (> sc_139 1e-08))
(declare-fun of_139 () Real)
(declare-fun sc_140 () Real)
(assert (> sc_140 1e-08))
(declare-fun of_140 () Real)
; 
; =  {sc.input.V[11].O} {sc.input.V[11].X}
(assert (= sc_140 sc_139))
; 
; =  {of.input.V[11].O} {of.input.V[11].X}
(assert (= of_140 of_139))
; 
; >=  {((sc.input.V[11].X*4.)+of.input.V[11].X)} {3300.}
(assert (<= (+ (* sc_139 4.) of_139) 3300.))
; 
; <=  {((sc.input.V[11].X*4.)+of.input.V[11].X)} {0.}
(assert (>= (+ (* sc_139 4.) of_139) 0.))
; 
; >=  {((sc.input.V[11].O*4.)+of.input.V[11].O)} {3300.}
(assert (<= (+ (* sc_140 4.) of_140) 3300.))
; 
; <=  {((sc.input.V[11].O*4.)+of.input.V[11].O)} {0.}
(assert (>= (+ (* sc_140 4.) of_140) 0.))
(declare-fun sc_141 () Real)
(assert (> sc_141 1e-08))
(declare-fun of_141 () Real)
(declare-fun sc_142 () Real)
(assert (> sc_142 1e-08))
(declare-fun of_142 () Real)
; 
; =  {sc.input.V[10].O} {sc.input.V[10].X}
(assert (= sc_142 sc_141))
; 
; =  {of.input.V[10].O} {of.input.V[10].X}
(assert (= of_142 of_141))
; 
; >=  {((sc.input.V[10].X*4.)+of.input.V[10].X)} {3300.}
(assert (<= (+ (* sc_141 4.) of_141) 3300.))
; 
; <=  {((sc.input.V[10].X*4.)+of.input.V[10].X)} {0.}
(assert (>= (+ (* sc_141 4.) of_141) 0.))
; 
; >=  {((sc.input.V[10].O*4.)+of.input.V[10].O)} {3300.}
(assert (<= (+ (* sc_142 4.) of_142) 3300.))
; 
; <=  {((sc.input.V[10].O*4.)+of.input.V[10].O)} {0.}
(assert (>= (+ (* sc_142 4.) of_142) 0.))
(declare-fun sc_143 () Real)
(assert (> sc_143 1e-08))
(declare-fun of_143 () Real)
(declare-fun sc_144 () Real)
(assert (> sc_144 1e-08))
(declare-fun of_144 () Real)
; 
; =  {sc.input.V[15].O} {sc.input.V[15].X}
(assert (= sc_144 sc_143))
; 
; =  {of.input.V[15].O} {of.input.V[15].X}
(assert (= of_144 of_143))
; 
; >=  {((sc.input.V[15].X*1.)+of.input.V[15].X)} {3300.}
(assert (<= (+ (* sc_143 1.) of_143) 3300.))
; 
; <=  {((sc.input.V[15].X*1.)+of.input.V[15].X)} {0.}
(assert (>= (+ (* sc_143 1.) of_143) 0.))
; 
; >=  {((sc.input.V[15].O*1.)+of.input.V[15].O)} {3300.}
(assert (<= (+ (* sc_144 1.) of_144) 3300.))
; 
; <=  {((sc.input.V[15].O*1.)+of.input.V[15].O)} {0.}
(assert (>= (+ (* sc_144 1.) of_144) 0.))
(declare-fun sc_145 () Real)
(assert (> sc_145 1e-08))
(declare-fun of_145 () Real)
(declare-fun sc_146 () Real)
(assert (> sc_146 1e-08))
(declare-fun of_146 () Real)
; 
; =  {sc.input.V[6].O} {sc.input.V[6].X}
(assert (= sc_146 sc_145))
; 
; =  {of.input.V[6].O} {of.input.V[6].X}
(assert (= of_146 of_145))
; 
; >=  {((sc.input.V[6].X*0.)+of.input.V[6].X)} {3300.}
(assert (<= (+ (* sc_145 0.) of_145) 3300.))
; 
; <=  {((sc.input.V[6].X*0.)+of.input.V[6].X)} {0.}
(assert (>= (+ (* sc_145 0.) of_145) 0.))
; 
; >=  {((sc.input.V[6].O*0.)+of.input.V[6].O)} {3300.}
(assert (<= (+ (* sc_146 0.) of_146) 3300.))
; 
; <=  {((sc.input.V[6].O*0.)+of.input.V[6].O)} {0.}
(assert (>= (+ (* sc_146 0.) of_146) 0.))
(declare-fun sc_147 () Real)
(assert (> sc_147 1e-08))
(declare-fun of_147 () Real)
(declare-fun sc_148 () Real)
(assert (> sc_148 1e-08))
(declare-fun of_148 () Real)
; 
; =  {sc.input.V[14].O} {sc.input.V[14].X}
(assert (= sc_148 sc_147))
; 
; =  {of.input.V[14].O} {of.input.V[14].X}
(assert (= of_148 of_147))
; 
; >=  {((sc.input.V[14].X*1.)+of.input.V[14].X)} {3300.}
(assert (<= (+ (* sc_147 1.) of_147) 3300.))
; 
; <=  {((sc.input.V[14].X*1.)+of.input.V[14].X)} {0.}
(assert (>= (+ (* sc_147 1.) of_147) 0.))
; 
; >=  {((sc.input.V[14].O*1.)+of.input.V[14].O)} {3300.}
(assert (<= (+ (* sc_148 1.) of_148) 3300.))
; 
; <=  {((sc.input.V[14].O*1.)+of.input.V[14].O)} {0.}
(assert (>= (+ (* sc_148 1.) of_148) 0.))
(declare-fun sc_149 () Real)
(assert (> sc_149 1e-08))
(declare-fun of_149 () Real)
(declare-fun sc_150 () Real)
(assert (> sc_150 1e-08))
(declare-fun of_150 () Real)
; 
; =  {sc.input.V[3].O} {sc.input.V[3].X}
(assert (= sc_150 sc_149))
; 
; =  {of.input.V[3].O} {of.input.V[3].X}
(assert (= of_150 of_149))
; 
; >=  {((sc.input.V[3].X*0.)+of.input.V[3].X)} {3300.}
(assert (<= (+ (* sc_149 0.) of_149) 3300.))
; 
; <=  {((sc.input.V[3].X*0.)+of.input.V[3].X)} {0.}
(assert (>= (+ (* sc_149 0.) of_149) 0.))
; 
; >=  {((sc.input.V[3].O*0.)+of.input.V[3].O)} {3300.}
(assert (<= (+ (* sc_150 0.) of_150) 3300.))
; 
; <=  {((sc.input.V[3].O*0.)+of.input.V[3].O)} {0.}
(assert (>= (+ (* sc_150 0.) of_150) 0.))
(declare-fun sc_151 () Real)
(assert (> sc_151 1e-08))
(declare-fun of_151 () Real)
(declare-fun sc_152 () Real)
(assert (> sc_152 1e-08))
(declare-fun of_152 () Real)
; 
; =  {sc.input.V[4].O} {sc.input.V[4].X}
(assert (= sc_152 sc_151))
; 
; =  {of.input.V[4].O} {of.input.V[4].X}
(assert (= of_152 of_151))
; 
; >=  {((sc.input.V[4].X*0.)+of.input.V[4].X)} {3300.}
(assert (<= (+ (* sc_151 0.) of_151) 3300.))
; 
; <=  {((sc.input.V[4].X*0.)+of.input.V[4].X)} {0.}
(assert (>= (+ (* sc_151 0.) of_151) 0.))
; 
; >=  {((sc.input.V[4].O*0.)+of.input.V[4].O)} {3300.}
(assert (<= (+ (* sc_152 0.) of_152) 3300.))
; 
; <=  {((sc.input.V[4].O*0.)+of.input.V[4].O)} {0.}
(assert (>= (+ (* sc_152 0.) of_152) 0.))
(declare-fun sc_153 () Real)
(assert (> sc_153 1e-08))
(declare-fun of_153 () Real)
(declare-fun sc_154 () Real)
(assert (> sc_154 1e-08))
(declare-fun of_154 () Real)
; 
; =  {sc.input.V[5].O} {sc.input.V[5].X}
(assert (= sc_154 sc_153))
; 
; =  {of.input.V[5].O} {of.input.V[5].X}
(assert (= of_154 of_153))
; 
; >=  {((sc.input.V[5].X*0.)+of.input.V[5].X)} {3300.}
(assert (<= (+ (* sc_153 0.) of_153) 3300.))
; 
; <=  {((sc.input.V[5].X*0.)+of.input.V[5].X)} {0.}
(assert (>= (+ (* sc_153 0.) of_153) 0.))
; 
; >=  {((sc.input.V[5].O*0.)+of.input.V[5].O)} {3300.}
(assert (<= (+ (* sc_154 0.) of_154) 3300.))
; 
; <=  {((sc.input.V[5].O*0.)+of.input.V[5].O)} {0.}
(assert (>= (+ (* sc_154 0.) of_154) 0.))
(declare-fun sc_155 () Real)
(assert (> sc_155 1e-08))
(declare-fun of_155 () Real)
(declare-fun sc_156 () Real)
(assert (> sc_156 1e-08))
(declare-fun of_156 () Real)
; 
; =  {sc.input.V[1].O} {sc.input.V[1].X}
(assert (= sc_156 sc_155))
; 
; =  {of.input.V[1].O} {of.input.V[1].X}
(assert (= of_156 of_155))
; 
; >=  {((sc.input.V[1].X*1250.)+of.input.V[1].X)} {3300.}
(assert (<= (+ (* sc_155 1250.) of_155) 3300.))
; 
; <=  {((sc.input.V[1].X*1250.)+of.input.V[1].X)} {0.}
(assert (>= (+ (* sc_155 1250.) of_155) 0.))
; 
; >=  {((sc.input.V[1].O*1250.)+of.input.V[1].O)} {3300.}
(assert (<= (+ (* sc_156 1250.) of_156) 3300.))
; 
; <=  {((sc.input.V[1].O*1250.)+of.input.V[1].O)} {0.}
(assert (>= (+ (* sc_156 1250.) of_156) 0.))
(declare-fun sc_157 () Real)
(assert (> sc_157 1e-08))
(declare-fun of_157 () Real)
(declare-fun sc_158 () Real)
(assert (> sc_158 1e-08))
(declare-fun of_158 () Real)
(declare-fun sc_159 () Real)
(assert (> sc_159 1e-08))
(declare-fun of_159 () Real)
; no offset
(assert (= of_158 0.))
; no offset
(assert (= of_157 0.))
; 
; =  {sc.itov[12].Y} {(sc.itov[12].K*sc.itov[12].X)}
(assert (= sc_159 (* sc_158 sc_157)))
; 
; =  {of.itov[12].Y} {0.}
(assert (= of_159 0.))
; 
; >=  {((sc.itov[12].X*4.)+of.itov[12].X)} {10.}
(assert (<= (+ (* sc_157 4.) of_157) 10.))
; 
; <=  {((sc.itov[12].X*4.)+of.itov[12].X)} {0.0001}
(assert (>= (+ (* sc_157 4.) of_157) 0.0001))
(declare-fun slbot_159 () Real)
(declare-fun sltop_159 () Real)
; 
; =  {(((sc.itov[12].Y*0.00204799328914)+of.itov[12].Y)+sl.min.itov[12].Y)} {0.0001}
(assert (= (+ (+ (* sc_159 0.00204799328914) of_159) slbot_159) 0.0001))
; 
; =  {(((sc.itov[12].Y*625.)+of.itov[12].Y)+sl.max.itov[12].Y)} {3300.}
(assert (= (+ (+ (* sc_159 625.) of_159) sltop_159) 3300.))
(declare-fun slbot_158 () Real)
(declare-fun sltop_158 () Real)
; 
; =  {(((sc.itov[12].K*0.000511998322284)+of.itov[12].K)+sl.min.itov[12].K)} {1.}
(assert (= (+ (+ (* sc_158 0.000511998322284) of_158) slbot_158) 1.))
; 
; =  {(((sc.itov[12].K*156.25)+of.itov[12].K)+sl.max.itov[12].K)} {330.}
(assert (= (+ (+ (* sc_158 156.25) of_158) sltop_158) 330.))
(declare-fun slbot_159 () Real)
(declare-fun sltop_159 () Real)
; 
; =  {(((sc.itov[12].Y*0.00204799328914)+of.itov[12].Y)+sl.min.itov[12].Y)} {0.0001}
(assert (= (+ (+ (* sc_159 0.00204799328914) of_159) slbot_159) 0.0001))
; 
; =  {(((sc.itov[12].Y*625.)+of.itov[12].Y)+sl.max.itov[12].Y)} {3300.}
(assert (= (+ (+ (* sc_159 625.) of_159) sltop_159) 3300.))
(declare-fun sc_160 () Real)
(assert (> sc_160 1e-08))
(declare-fun of_160 () Real)
(declare-fun sc_161 () Real)
(assert (> sc_161 1e-08))
(declare-fun of_161 () Real)
(declare-fun sc_162 () Real)
(assert (> sc_162 1e-08))
(declare-fun of_162 () Real)
; no offset
(assert (= of_161 0.))
; no offset
(assert (= of_160 0.))
; 
; =  {sc.itov[9].Y} {(sc.itov[9].K*sc.itov[9].X)}
(assert (= sc_162 (* sc_161 sc_160)))
; 
; =  {of.itov[9].Y} {0.}
(assert (= of_162 0.))
(declare-fun slbot_160 () Real)
(declare-fun sltop_160 () Real)
; 
; =  {(((sc.itov[9].X*0.)+of.itov[9].X)+sl.min.itov[9].X)} {0.0001}
(assert (= (+ (+ (* sc_160 0.) of_160) slbot_160) 0.0001))
; 
; =  {(((sc.itov[9].X*3.2768e-06)+of.itov[9].X)+sl.max.itov[9].X)} {10.}
(assert (= (+ (+ (* sc_160 3.2768e-06) of_160) sltop_160) 10.))
(declare-fun slbot_162 () Real)
(declare-fun sltop_162 () Real)
; 
; =  {(((sc.itov[9].Y*0.)+of.itov[9].Y)+sl.min.itov[9].Y)} {0.0001}
(assert (= (+ (+ (* sc_162 0.) of_162) slbot_162) 0.0001))
; 
; =  {(((sc.itov[9].Y*3.2768e-06)+of.itov[9].Y)+sl.max.itov[9].Y)} {3300.}
(assert (= (+ (+ (* sc_162 3.2768e-06) of_162) sltop_162) 3300.))
; 
; >=  {((sc.itov[9].K*1.)+of.itov[9].K)} {330.}
(assert (<= (+ (* sc_161 1.) of_161) 330.))
; 
; <=  {((sc.itov[9].K*1.)+of.itov[9].K)} {1.}
(assert (>= (+ (* sc_161 1.) of_161) 1.))
(declare-fun slbot_162 () Real)
(declare-fun sltop_162 () Real)
; 
; =  {(((sc.itov[9].Y*0.)+of.itov[9].Y)+sl.min.itov[9].Y)} {0.0001}
(assert (= (+ (+ (* sc_162 0.) of_162) slbot_162) 0.0001))
; 
; =  {(((sc.itov[9].Y*3.2768e-06)+of.itov[9].Y)+sl.max.itov[9].Y)} {3300.}
(assert (= (+ (+ (* sc_162 3.2768e-06) of_162) sltop_162) 3300.))
(declare-fun sc_163 () Real)
(assert (> sc_163 1e-08))
(declare-fun of_163 () Real)
(declare-fun sc_164 () Real)
(assert (> sc_164 1e-08))
(declare-fun of_164 () Real)
(declare-fun sc_165 () Real)
(assert (> sc_165 1e-08))
(declare-fun of_165 () Real)
; no offset
(assert (= of_164 0.))
; no offset
(assert (= of_163 0.))
; 
; =  {sc.itov[0].Y} {(sc.itov[0].K*sc.itov[0].X)}
(assert (= sc_165 (* sc_164 sc_163)))
; 
; =  {of.itov[0].Y} {0.}
(assert (= of_165 0.))
; 
; >=  {((sc.itov[0].X*4.)+of.itov[0].X)} {10.}
(assert (<= (+ (* sc_163 4.) of_163) 10.))
; 
; <=  {((sc.itov[0].X*4.)+of.itov[0].X)} {0.0001}
(assert (>= (+ (* sc_163 4.) of_163) 0.0001))
(declare-fun slbot_165 () Real)
(declare-fun sltop_165 () Real)
; 
; =  {(((sc.itov[0].Y*3.75903614458)+of.itov[0].Y)+sl.min.itov[0].Y)} {0.0001}
(assert (= (+ (+ (* sc_165 3.75903614458) of_165) slbot_165) 0.0001))
; 
; =  {(((sc.itov[0].Y*62.4)+of.itov[0].Y)+sl.max.itov[0].Y)} {3300.}
(assert (= (+ (+ (* sc_165 62.4) of_165) sltop_165) 3300.))
(declare-fun slbot_164 () Real)
(declare-fun sltop_164 () Real)
; 
; =  {(((sc.itov[0].K*0.939759036145)+of.itov[0].K)+sl.min.itov[0].K)} {1.}
(assert (= (+ (+ (* sc_164 0.939759036145) of_164) slbot_164) 1.))
; 
; =  {(((sc.itov[0].K*15.6)+of.itov[0].K)+sl.max.itov[0].K)} {330.}
(assert (= (+ (+ (* sc_164 15.6) of_164) sltop_164) 330.))
(declare-fun slbot_165 () Real)
(declare-fun sltop_165 () Real)
; 
; =  {(((sc.itov[0].Y*3.75903614458)+of.itov[0].Y)+sl.min.itov[0].Y)} {0.0001}
(assert (= (+ (+ (* sc_165 3.75903614458) of_165) slbot_165) 0.0001))
; 
; =  {(((sc.itov[0].Y*62.4)+of.itov[0].Y)+sl.max.itov[0].Y)} {3300.}
(assert (= (+ (+ (* sc_165 62.4) of_165) sltop_165) 3300.))
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
; =  {sc.iadd[20].A} {sc.iadd[20].B}
(assert (= sc_168 sc_169))
; 
; =  {sc.iadd[20].A} {sc.iadd[20].C} {sc.iadd[20].D}
(assert (and (= sc_168 sc_167) (= sc_168 sc_166)))
; 
; =  {sc.iadd[20].OUT} {sc.iadd[20].A}
(assert (= sc_170 sc_168))
; 
; =  {of.iadd[20].OUT} {((of.iadd[20].A+of.iadd[20].B)-of.iadd[20].C-of.iadd[20].D)}
(assert (= of_170 (- (+ of_168 of_169) (+ of_167 of_166))))
; 
; >=  {((sc.iadd[20].D*0.)+of.iadd[20].D)} {5.}
(assert (<= (+ (* sc_166 0.) of_166) 5.))
; 
; <=  {((sc.iadd[20].D*0.)+of.iadd[20].D)} {0.}
(assert (>= (+ (* sc_166 0.) of_166) 0.))
; 
; >=  {((sc.iadd[20].C*0.)+of.iadd[20].C)} {5.}
(assert (<= (+ (* sc_167 0.) of_167) 5.))
; 
; <=  {((sc.iadd[20].C*0.)+of.iadd[20].C)} {0.}
(assert (>= (+ (* sc_167 0.) of_167) 0.))
; 
; >=  {((sc.iadd[20].A*0.)+of.iadd[20].A)} {5.}
(assert (<= (+ (* sc_168 0.) of_168) 5.))
; 
; <=  {((sc.iadd[20].A*0.)+of.iadd[20].A)} {0.}
(assert (>= (+ (* sc_168 0.) of_168) 0.))
(declare-fun slbot_169 () Real)
(declare-fun sltop_169 () Real)
; 
; =  {(((sc.iadd[20].B*0.)+of.iadd[20].B)+sl.min.iadd[20].B)} {0.}
(assert (= (+ (+ (* sc_169 0.) of_169) slbot_169) 0.))
; 
; =  {(((sc.iadd[20].B*15.6)+of.iadd[20].B)+sl.max.iadd[20].B)} {5.}
(assert (= (+ (+ (* sc_169 15.6) of_169) sltop_169) 5.))
(declare-fun slbot_170 () Real)
(declare-fun sltop_170 () Real)
; 
; =  {(((sc.iadd[20].OUT*0.)+of.iadd[20].OUT)+sl.min.iadd[20].OUT)} {-10.}
(assert (= (+ (+ (* sc_170 0.) of_170) slbot_170) -10.))
; 
; =  {(((sc.iadd[20].OUT*15.6)+of.iadd[20].OUT)+sl.max.iadd[20].OUT)} {10.}
(assert (= (+ (+ (* sc_170 15.6) of_170) sltop_170) 10.))
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
; =  {sc.iadd[11].A} {sc.iadd[11].B}
(assert (= sc_173 sc_174))
; 
; =  {sc.iadd[11].A} {sc.iadd[11].C} {sc.iadd[11].D}
(assert (and (= sc_173 sc_172) (= sc_173 sc_171)))
; 
; =  {sc.iadd[11].OUT} {sc.iadd[11].A}
(assert (= sc_175 sc_173))
; 
; =  {of.iadd[11].OUT} {((of.iadd[11].A+of.iadd[11].B)-of.iadd[11].C-of.iadd[11].D)}
(assert (= of_175 (- (+ of_173 of_174) (+ of_172 of_171))))
(declare-fun slbot_171 () Real)
(declare-fun sltop_171 () Real)
; 
; =  {(((sc.iadd[11].D*-156.25)+of.iadd[11].D)+sl.min.iadd[11].D)} {0.}
(assert (= (+ (+ (* sc_171 -156.25) of_171) slbot_171) 0.))
; 
; =  {(((sc.iadd[11].D*0.)+of.iadd[11].D)+sl.max.iadd[11].D)} {5.}
(assert (= (+ (+ (* sc_171 0.) of_171) sltop_171) 5.))
; 
; >=  {((sc.iadd[11].C*1.)+of.iadd[11].C)} {5.}
(assert (<= (+ (* sc_172 1.) of_172) 5.))
; 
; <=  {((sc.iadd[11].C*1.)+of.iadd[11].C)} {0.}
(assert (>= (+ (* sc_172 1.) of_172) 0.))
(declare-fun slbot_175 () Real)
(declare-fun sltop_175 () Real)
; 
; =  {(((sc.iadd[11].OUT*-1.)+of.iadd[11].OUT)+sl.min.iadd[11].OUT)} {-10.}
(assert (= (+ (+ (* sc_175 -1.) of_175) slbot_175) -10.))
; 
; =  {(((sc.iadd[11].OUT*155.25)+of.iadd[11].OUT)+sl.max.iadd[11].OUT)} {10.}
(assert (= (+ (+ (* sc_175 155.25) of_175) sltop_175) 10.))
; 
; >=  {((sc.iadd[11].A*0.)+of.iadd[11].A)} {5.}
(assert (<= (+ (* sc_173 0.) of_173) 5.))
; 
; <=  {((sc.iadd[11].A*0.)+of.iadd[11].A)} {0.}
(assert (>= (+ (* sc_173 0.) of_173) 0.))
; 
; >=  {((sc.iadd[11].B*0.)+of.iadd[11].B)} {5.}
(assert (<= (+ (* sc_174 0.) of_174) 5.))
; 
; <=  {((sc.iadd[11].B*0.)+of.iadd[11].B)} {0.}
(assert (>= (+ (* sc_174 0.) of_174) 0.))
(declare-fun slbot_175 () Real)
(declare-fun sltop_175 () Real)
; 
; =  {(((sc.iadd[11].OUT*-1.)+of.iadd[11].OUT)+sl.min.iadd[11].OUT)} {-10.}
(assert (= (+ (+ (* sc_175 -1.) of_175) slbot_175) -10.))
; 
; =  {(((sc.iadd[11].OUT*155.25)+of.iadd[11].OUT)+sl.max.iadd[11].OUT)} {10.}
(assert (= (+ (+ (* sc_175 155.25) of_175) sltop_175) 10.))
(declare-fun sc_176 () Real)
(assert (> sc_176 1e-08))
(declare-fun of_176 () Real)
(declare-fun sc_177 () Real)
(assert (> sc_177 1e-08))
(declare-fun of_177 () Real)
(declare-fun sc_178 () Real)
(assert (> sc_178 1e-08))
(declare-fun of_178 () Real)
(declare-fun sc_179 () Real)
(assert (> sc_179 1e-08))
(declare-fun of_179 () Real)
(declare-fun sc_180 () Real)
(assert (> sc_180 1e-08))
(declare-fun of_180 () Real)
; 
; =  {sc.iadd[6].A} {sc.iadd[6].B}
(assert (= sc_178 sc_179))
; 
; =  {sc.iadd[6].A} {sc.iadd[6].C} {sc.iadd[6].D}
(assert (and (= sc_178 sc_177) (= sc_178 sc_176)))
; 
; =  {sc.iadd[6].OUT} {sc.iadd[6].A}
(assert (= sc_180 sc_178))
; 
; =  {of.iadd[6].OUT} {((of.iadd[6].A+of.iadd[6].B)-of.iadd[6].C-of.iadd[6].D)}
(assert (= of_180 (- (+ of_178 of_179) (+ of_177 of_176))))
; 
; >=  {((sc.iadd[6].D*0.)+of.iadd[6].D)} {5.}
(assert (<= (+ (* sc_176 0.) of_176) 5.))
; 
; <=  {((sc.iadd[6].D*0.)+of.iadd[6].D)} {0.}
(assert (>= (+ (* sc_176 0.) of_176) 0.))
; 
; >=  {((sc.iadd[6].C*0.)+of.iadd[6].C)} {5.}
(assert (<= (+ (* sc_177 0.) of_177) 5.))
; 
; <=  {((sc.iadd[6].C*0.)+of.iadd[6].C)} {0.}
(assert (>= (+ (* sc_177 0.) of_177) 0.))
(declare-fun slbot_180 () Real)
(declare-fun sltop_180 () Real)
; 
; =  {(((sc.iadd[6].OUT*0.)+of.iadd[6].OUT)+sl.min.iadd[6].OUT)} {-10.}
(assert (= (+ (+ (* sc_180 0.) of_180) slbot_180) -10.))
; 
; =  {(((sc.iadd[6].OUT*305175.78125)+of.iadd[6].OUT)+sl.max.iadd[6].OUT)} {10.}
(assert (= (+ (+ (* sc_180 305175.78125) of_180) sltop_180) 10.))
; 
; >=  {((sc.iadd[6].A*0.)+of.iadd[6].A)} {5.}
(assert (<= (+ (* sc_178 0.) of_178) 5.))
; 
; <=  {((sc.iadd[6].A*0.)+of.iadd[6].A)} {0.}
(assert (>= (+ (* sc_178 0.) of_178) 0.))
(declare-fun slbot_179 () Real)
(declare-fun sltop_179 () Real)
; 
; =  {(((sc.iadd[6].B*0.)+of.iadd[6].B)+sl.min.iadd[6].B)} {0.}
(assert (= (+ (+ (* sc_179 0.) of_179) slbot_179) 0.))
; 
; =  {(((sc.iadd[6].B*305175.78125)+of.iadd[6].B)+sl.max.iadd[6].B)} {5.}
(assert (= (+ (+ (* sc_179 305175.78125) of_179) sltop_179) 5.))
(declare-fun slbot_180 () Real)
(declare-fun sltop_180 () Real)
; 
; =  {(((sc.iadd[6].OUT*0.)+of.iadd[6].OUT)+sl.min.iadd[6].OUT)} {-10.}
(assert (= (+ (+ (* sc_180 0.) of_180) slbot_180) -10.))
; 
; =  {(((sc.iadd[6].OUT*305175.78125)+of.iadd[6].OUT)+sl.max.iadd[6].OUT)} {10.}
(assert (= (+ (+ (* sc_180 305175.78125) of_180) sltop_180) 10.))
(declare-fun sc_181 () Real)
(assert (> sc_181 1e-08))
(declare-fun of_181 () Real)
(declare-fun sc_182 () Real)
(assert (> sc_182 1e-08))
(declare-fun of_182 () Real)
(declare-fun sc_183 () Real)
(assert (> sc_183 1e-08))
(declare-fun of_183 () Real)
(declare-fun sc_184 () Real)
(assert (> sc_184 1e-08))
(declare-fun of_184 () Real)
(declare-fun sc_185 () Real)
(assert (> sc_185 1e-08))
(declare-fun of_185 () Real)
; 
; =  {sc.iadd[16].A} {sc.iadd[16].B}
(assert (= sc_183 sc_184))
; 
; =  {sc.iadd[16].A} {sc.iadd[16].C} {sc.iadd[16].D}
(assert (and (= sc_183 sc_182) (= sc_183 sc_181)))
; 
; =  {sc.iadd[16].OUT} {sc.iadd[16].A}
(assert (= sc_185 sc_183))
; 
; =  {of.iadd[16].OUT} {((of.iadd[16].A+of.iadd[16].B)-of.iadd[16].C-of.iadd[16].D)}
(assert (= of_185 (- (+ of_183 of_184) (+ of_182 of_181))))
; 
; >=  {((sc.iadd[16].D*0.)+of.iadd[16].D)} {5.}
(assert (<= (+ (* sc_181 0.) of_181) 5.))
; 
; <=  {((sc.iadd[16].D*0.)+of.iadd[16].D)} {0.}
(assert (>= (+ (* sc_181 0.) of_181) 0.))
; 
; >=  {((sc.iadd[16].C*0.)+of.iadd[16].C)} {5.}
(assert (<= (+ (* sc_182 0.) of_182) 5.))
; 
; <=  {((sc.iadd[16].C*0.)+of.iadd[16].C)} {0.}
(assert (>= (+ (* sc_182 0.) of_182) 0.))
(declare-fun slbot_185 () Real)
(declare-fun sltop_185 () Real)
; 
; =  {(((sc.iadd[16].OUT*0.)+of.iadd[16].OUT)+sl.min.iadd[16].OUT)} {-10.}
(assert (= (+ (+ (* sc_185 0.) of_185) slbot_185) -10.))
; 
; =  {(((sc.iadd[16].OUT*1.66666666667)+of.iadd[16].OUT)+sl.max.iadd[16].OUT)} {10.}
(assert (= (+ (+ (* sc_185 1.66666666667) of_185) sltop_185) 10.))
; 
; >=  {((sc.iadd[16].A*0.)+of.iadd[16].A)} {5.}
(assert (<= (+ (* sc_183 0.) of_183) 5.))
; 
; <=  {((sc.iadd[16].A*0.)+of.iadd[16].A)} {0.}
(assert (>= (+ (* sc_183 0.) of_183) 0.))
(declare-fun slbot_184 () Real)
(declare-fun sltop_184 () Real)
; 
; =  {(((sc.iadd[16].B*0.)+of.iadd[16].B)+sl.min.iadd[16].B)} {0.}
(assert (= (+ (+ (* sc_184 0.) of_184) slbot_184) 0.))
; 
; =  {(((sc.iadd[16].B*1.66666666667)+of.iadd[16].B)+sl.max.iadd[16].B)} {5.}
(assert (= (+ (+ (* sc_184 1.66666666667) of_184) sltop_184) 5.))
(declare-fun slbot_185 () Real)
(declare-fun sltop_185 () Real)
; 
; =  {(((sc.iadd[16].OUT*0.)+of.iadd[16].OUT)+sl.min.iadd[16].OUT)} {-10.}
(assert (= (+ (+ (* sc_185 0.) of_185) slbot_185) -10.))
; 
; =  {(((sc.iadd[16].OUT*1.66666666667)+of.iadd[16].OUT)+sl.max.iadd[16].OUT)} {10.}
(assert (= (+ (+ (* sc_185 1.66666666667) of_185) sltop_185) 10.))
(declare-fun sc_186 () Real)
(assert (> sc_186 1e-08))
(declare-fun of_186 () Real)
(declare-fun sc_187 () Real)
(assert (> sc_187 1e-08))
(declare-fun of_187 () Real)
(declare-fun sc_188 () Real)
(assert (> sc_188 1e-08))
(declare-fun of_188 () Real)
(declare-fun sc_189 () Real)
(assert (> sc_189 1e-08))
(declare-fun of_189 () Real)
(declare-fun sc_190 () Real)
(assert (> sc_190 1e-08))
(declare-fun of_190 () Real)
; 
; =  {sc.iadd[5].A} {sc.iadd[5].B}
(assert (= sc_188 sc_189))
; 
; =  {sc.iadd[5].A} {sc.iadd[5].C} {sc.iadd[5].D}
(assert (and (= sc_188 sc_187) (= sc_188 sc_186)))
; 
; =  {sc.iadd[5].OUT} {sc.iadd[5].A}
(assert (= sc_190 sc_188))
; 
; =  {of.iadd[5].OUT} {((of.iadd[5].A+of.iadd[5].B)-of.iadd[5].C-of.iadd[5].D)}
(assert (= of_190 (- (+ of_188 of_189) (+ of_187 of_186))))
; 
; >=  {((sc.iadd[5].D*0.)+of.iadd[5].D)} {5.}
(assert (<= (+ (* sc_186 0.) of_186) 5.))
; 
; <=  {((sc.iadd[5].D*0.)+of.iadd[5].D)} {0.}
(assert (>= (+ (* sc_186 0.) of_186) 0.))
; 
; >=  {((sc.iadd[5].C*0.)+of.iadd[5].C)} {5.}
(assert (<= (+ (* sc_187 0.) of_187) 5.))
; 
; <=  {((sc.iadd[5].C*0.)+of.iadd[5].C)} {0.}
(assert (>= (+ (* sc_187 0.) of_187) 0.))
(declare-fun slbot_190 () Real)
(declare-fun sltop_190 () Real)
; 
; =  {(((sc.iadd[5].OUT*0.)+of.iadd[5].OUT)+sl.min.iadd[5].OUT)} {-10.}
(assert (= (+ (+ (* sc_190 0.) of_190) slbot_190) -10.))
; 
; =  {(((sc.iadd[5].OUT*305175.78125)+of.iadd[5].OUT)+sl.max.iadd[5].OUT)} {10.}
(assert (= (+ (+ (* sc_190 305175.78125) of_190) sltop_190) 10.))
; 
; >=  {((sc.iadd[5].A*0.)+of.iadd[5].A)} {5.}
(assert (<= (+ (* sc_188 0.) of_188) 5.))
; 
; <=  {((sc.iadd[5].A*0.)+of.iadd[5].A)} {0.}
(assert (>= (+ (* sc_188 0.) of_188) 0.))
(declare-fun slbot_189 () Real)
(declare-fun sltop_189 () Real)
; 
; =  {(((sc.iadd[5].B*0.)+of.iadd[5].B)+sl.min.iadd[5].B)} {0.}
(assert (= (+ (+ (* sc_189 0.) of_189) slbot_189) 0.))
; 
; =  {(((sc.iadd[5].B*305175.78125)+of.iadd[5].B)+sl.max.iadd[5].B)} {5.}
(assert (= (+ (+ (* sc_189 305175.78125) of_189) sltop_189) 5.))
(declare-fun slbot_190 () Real)
(declare-fun sltop_190 () Real)
; 
; =  {(((sc.iadd[5].OUT*0.)+of.iadd[5].OUT)+sl.min.iadd[5].OUT)} {-10.}
(assert (= (+ (+ (* sc_190 0.) of_190) slbot_190) -10.))
; 
; =  {(((sc.iadd[5].OUT*305175.78125)+of.iadd[5].OUT)+sl.max.iadd[5].OUT)} {10.}
(assert (= (+ (+ (* sc_190 305175.78125) of_190) sltop_190) 10.))
(declare-fun sc_191 () Real)
(assert (> sc_191 1e-08))
(declare-fun of_191 () Real)
(declare-fun sc_192 () Real)
(assert (> sc_192 1e-08))
(declare-fun of_192 () Real)
(declare-fun sc_193 () Real)
(assert (> sc_193 1e-08))
(declare-fun of_193 () Real)
(declare-fun sc_194 () Real)
(assert (> sc_194 1e-08))
(declare-fun of_194 () Real)
(declare-fun sc_195 () Real)
(assert (> sc_195 1e-08))
(declare-fun of_195 () Real)
; 
; =  {sc.iadd[17].A} {sc.iadd[17].B}
(assert (= sc_193 sc_194))
; 
; =  {sc.iadd[17].A} {sc.iadd[17].C} {sc.iadd[17].D}
(assert (and (= sc_193 sc_192) (= sc_193 sc_191)))
; 
; =  {sc.iadd[17].OUT} {sc.iadd[17].A}
(assert (= sc_195 sc_193))
; 
; =  {of.iadd[17].OUT} {((of.iadd[17].A+of.iadd[17].B)-of.iadd[17].C-of.iadd[17].D)}
(assert (= of_195 (- (+ of_193 of_194) (+ of_192 of_191))))
; 
; >=  {((sc.iadd[17].D*0.)+of.iadd[17].D)} {5.}
(assert (<= (+ (* sc_191 0.) of_191) 5.))
; 
; <=  {((sc.iadd[17].D*0.)+of.iadd[17].D)} {0.}
(assert (>= (+ (* sc_191 0.) of_191) 0.))
; 
; >=  {((sc.iadd[17].C*0.)+of.iadd[17].C)} {5.}
(assert (<= (+ (* sc_192 0.) of_192) 5.))
; 
; <=  {((sc.iadd[17].C*0.)+of.iadd[17].C)} {0.}
(assert (>= (+ (* sc_192 0.) of_192) 0.))
(declare-fun slbot_195 () Real)
(declare-fun sltop_195 () Real)
; 
; =  {(((sc.iadd[17].OUT*0.)+of.iadd[17].OUT)+sl.min.iadd[17].OUT)} {-10.}
(assert (= (+ (+ (* sc_195 0.) of_195) slbot_195) -10.))
; 
; =  {(((sc.iadd[17].OUT*1.66666666667)+of.iadd[17].OUT)+sl.max.iadd[17].OUT)} {10.}
(assert (= (+ (+ (* sc_195 1.66666666667) of_195) sltop_195) 10.))
; 
; >=  {((sc.iadd[17].A*0.)+of.iadd[17].A)} {5.}
(assert (<= (+ (* sc_193 0.) of_193) 5.))
; 
; <=  {((sc.iadd[17].A*0.)+of.iadd[17].A)} {0.}
(assert (>= (+ (* sc_193 0.) of_193) 0.))
(declare-fun slbot_194 () Real)
(declare-fun sltop_194 () Real)
; 
; =  {(((sc.iadd[17].B*0.)+of.iadd[17].B)+sl.min.iadd[17].B)} {0.}
(assert (= (+ (+ (* sc_194 0.) of_194) slbot_194) 0.))
; 
; =  {(((sc.iadd[17].B*1.66666666667)+of.iadd[17].B)+sl.max.iadd[17].B)} {5.}
(assert (= (+ (+ (* sc_194 1.66666666667) of_194) sltop_194) 5.))
(declare-fun slbot_195 () Real)
(declare-fun sltop_195 () Real)
; 
; =  {(((sc.iadd[17].OUT*0.)+of.iadd[17].OUT)+sl.min.iadd[17].OUT)} {-10.}
(assert (= (+ (+ (* sc_195 0.) of_195) slbot_195) -10.))
; 
; =  {(((sc.iadd[17].OUT*1.66666666667)+of.iadd[17].OUT)+sl.max.iadd[17].OUT)} {10.}
(assert (= (+ (+ (* sc_195 1.66666666667) of_195) sltop_195) 10.))
(declare-fun sc_196 () Real)
(assert (> sc_196 1e-08))
(declare-fun of_196 () Real)
(declare-fun sc_197 () Real)
(assert (> sc_197 1e-08))
(declare-fun of_197 () Real)
(declare-fun sc_198 () Real)
(assert (> sc_198 1e-08))
(declare-fun of_198 () Real)
(declare-fun sc_199 () Real)
(assert (> sc_199 1e-08))
(declare-fun of_199 () Real)
(declare-fun sc_200 () Real)
(assert (> sc_200 1e-08))
(declare-fun of_200 () Real)
; 
; =  {sc.iadd[19].A} {sc.iadd[19].B}
(assert (= sc_198 sc_199))
; 
; =  {sc.iadd[19].A} {sc.iadd[19].C} {sc.iadd[19].D}
(assert (and (= sc_198 sc_197) (= sc_198 sc_196)))
; 
; =  {sc.iadd[19].OUT} {sc.iadd[19].A}
(assert (= sc_200 sc_198))
; 
; =  {of.iadd[19].OUT} {((of.iadd[19].A+of.iadd[19].B)-of.iadd[19].C-of.iadd[19].D)}
(assert (= of_200 (- (+ of_198 of_199) (+ of_197 of_196))))
(declare-fun slbot_196 () Real)
(declare-fun sltop_196 () Real)
; 
; =  {(((sc.iadd[19].D*-0.6)+of.iadd[19].D)+sl.min.iadd[19].D)} {0.}
(assert (= (+ (+ (* sc_196 -0.6) of_196) slbot_196) 0.))
; 
; =  {(((sc.iadd[19].D*0.)+of.iadd[19].D)+sl.max.iadd[19].D)} {5.}
(assert (= (+ (+ (* sc_196 0.) of_196) sltop_196) 5.))
; 
; >=  {((sc.iadd[19].C*1.)+of.iadd[19].C)} {5.}
(assert (<= (+ (* sc_197 1.) of_197) 5.))
; 
; <=  {((sc.iadd[19].C*1.)+of.iadd[19].C)} {0.}
(assert (>= (+ (* sc_197 1.) of_197) 0.))
(declare-fun slbot_200 () Real)
(declare-fun sltop_200 () Real)
; 
; =  {(((sc.iadd[19].OUT*-1.)+of.iadd[19].OUT)+sl.min.iadd[19].OUT)} {-10.}
(assert (= (+ (+ (* sc_200 -1.) of_200) slbot_200) -10.))
; 
; =  {(((sc.iadd[19].OUT*-0.4)+of.iadd[19].OUT)+sl.max.iadd[19].OUT)} {10.}
(assert (= (+ (+ (* sc_200 -0.4) of_200) sltop_200) 10.))
; 
; >=  {((sc.iadd[19].A*0.)+of.iadd[19].A)} {5.}
(assert (<= (+ (* sc_198 0.) of_198) 5.))
; 
; <=  {((sc.iadd[19].A*0.)+of.iadd[19].A)} {0.}
(assert (>= (+ (* sc_198 0.) of_198) 0.))
; 
; >=  {((sc.iadd[19].B*0.)+of.iadd[19].B)} {5.}
(assert (<= (+ (* sc_199 0.) of_199) 5.))
; 
; <=  {((sc.iadd[19].B*0.)+of.iadd[19].B)} {0.}
(assert (>= (+ (* sc_199 0.) of_199) 0.))
(declare-fun slbot_200 () Real)
(declare-fun sltop_200 () Real)
; 
; =  {(((sc.iadd[19].OUT*-1.)+of.iadd[19].OUT)+sl.min.iadd[19].OUT)} {-10.}
(assert (= (+ (+ (* sc_200 -1.) of_200) slbot_200) -10.))
; 
; =  {(((sc.iadd[19].OUT*-0.4)+of.iadd[19].OUT)+sl.max.iadd[19].OUT)} {10.}
(assert (= (+ (+ (* sc_200 -0.4) of_200) sltop_200) 10.))
; 
; =  {sc.igenebind[2].GE} {sc.itov[0].K}
(assert (= sc_116 sc_164))
; 
; =  {of.igenebind[2].GE} {of.itov[0].K}
(assert (= of_116 of_164))
; 
; =  {sc.itov[12].Y} {sc.vadd[13].B}
(assert (= sc_159 sc_97))
; 
; =  {of.itov[12].Y} {of.vadd[13].B}
(assert (= of_159 of_97))
; 
; =  {sc.iadd[6].OUT} {sc.iadd[5].B}
(assert (= sc_180 sc_189))
; 
; =  {of.iadd[6].OUT} {of.iadd[5].B}
(assert (= of_180 of_189))
; 
; =  {sc.vadd[1].OUT2} {sc.vtoi[3].X}
(assert (= sc_106 sc_110))
; 
; =  {of.vadd[1].OUT2} {of.vtoi[3].X}
(assert (= of_106 of_110))
; 
; =  {sc.vadd[1].OUT2} {sc.output.V[0].X}
(assert (= sc_106 sc_89))
; 
; =  {of.vadd[1].OUT2} {of.output.V[0].X}
(assert (= of_106 of_89))
; 
; =  {sc.input.I[0].O} {sc.switch[14].Vmax}
(assert (= sc_40 sc_17))
; 
; =  {of.input.I[0].O} {of.switch[14].Vmax}
(assert (= of_40 of_17))
; 
; =  {sc.vtoi[3].Y} {sc.iadd[11].D}
(assert (= sc_112 sc_171))
; 
; =  {of.vtoi[3].Y} {of.iadd[11].D}
(assert (= of_112 of_171))
; 
; =  {sc.input.I[22].O} {sc.itov[12].X}
(assert (= sc_88 sc_157))
; 
; =  {of.input.I[22].O} {of.itov[12].X}
(assert (= of_88 of_157))
; 
; =  {sc.input.V[15].O} {sc.itov[9].K}
(assert (= sc_144 sc_161))
; 
; =  {of.input.V[15].O} {of.itov[9].K}
(assert (= of_144 of_161))
; 
; =  {sc.input.I[32].O} {sc.iadd[20].C}
(assert (= sc_82 sc_167))
; 
; =  {of.input.I[32].O} {of.iadd[20].C}
(assert (= of_82 of_167))
; 
; =  {sc.input.I[26].O} {sc.switch[10].Vmax}
(assert (= sc_46 sc_7))
; 
; =  {of.input.I[26].O} {of.switch[10].Vmax}
(assert (= of_46 of_7))
; 
; =  {sc.input.I[25].O} {sc.switch[10].Kmod}
(assert (= sc_74 sc_6))
; 
; =  {of.input.I[25].O} {of.switch[10].Kmod}
(assert (= of_74 of_6))
; 
; =  {sc.input.V[13].O} {sc.vtoi[7].X}
(assert (= sc_132 sc_107))
; 
; =  {of.input.V[13].O} {of.vtoi[7].X}
(assert (= of_132 of_107))
; 
; =  {sc.vtoi[7].Y} {sc.iadd[6].B}
(assert (= sc_109 sc_179))
; 
; =  {of.vtoi[7].Y} {of.iadd[6].B}
(assert (= of_109 of_179))
; 
; =  {sc.igenebind[18].GE} {sc.iadd[17].B}
(assert (= sc_124 sc_194))
; 
; =  {of.igenebind[18].GE} {of.iadd[17].B}
(assert (= of_124 of_194))
; 
; =  {sc.input.V[14].O} {sc.vgain[8].Y}
(assert (= sc_148 sc_1))
; 
; =  {of.input.V[14].O} {of.vgain[8].Y}
(assert (= of_148 of_1))
; 
; =  {sc.input.I[14].O} {sc.iadd[17].A}
(assert (= sc_56 sc_193))
; 
; =  {of.input.I[14].O} {of.iadd[17].A}
(assert (= of_56 of_193))
; 
; =  {sc.input.V[11].O} {sc.vadd[13].D}
(assert (= sc_140 sc_94))
; 
; =  {of.input.V[11].O} {of.vadd[13].D}
(assert (= of_140 of_94))
; 
; =  {sc.input.I[30].O} {sc.iadd[19].C}
(assert (= sc_66 sc_197))
; 
; =  {of.input.I[30].O} {of.iadd[19].C}
(assert (= of_66 of_197))
; 
; =  {sc.iadd[5].OUT} {sc.igenebind[4].TF}
(assert (= sc_190 sc_117))
; 
; =  {of.iadd[5].OUT} {of.igenebind[4].TF}
(assert (= of_190 of_117))
; 
; =  {sc.itov[0].Y} {sc.vadd[1].B}
(assert (= sc_165 sc_104))
; 
; =  {of.itov[0].Y} {of.vadd[1].B}
(assert (= of_165 of_104))
; 
; =  {sc.input.I[24].O} {sc.igenebind[4].K}
(assert (= sc_62 sc_118))
; 
; =  {of.input.I[24].O} {of.igenebind[4].K}
(assert (= of_62 of_118))
; 
; =  {sc.input.I[12].O} {sc.iadd[16].C}
(assert (= sc_34 sc_182))
; 
; =  {of.input.I[12].O} {of.iadd[16].C}
(assert (= of_34 of_182))
; 
; =  {sc.input.I[10].O} {sc.iadd[16].D}
(assert (= sc_44 sc_181))
; 
; =  {of.input.I[10].O} {of.iadd[16].D}
(assert (= of_44 of_181))
; 
; =  {sc.iadd[11].OUT} {sc.switch[10].SUB}
(assert (= sc_175 sc_5))
; 
; =  {of.iadd[11].OUT} {of.switch[10].SUB}
(assert (= of_175 of_5))
; 
; =  {sc.input.I[7].O} {sc.iadd[6].C}
(assert (= sc_30 sc_177))
; 
; =  {of.input.I[7].O} {of.iadd[6].C}
(assert (= of_30 of_177))
; 
; =  {sc.iadd[17].OUT} {sc.iadd[16].B}
(assert (= sc_195 sc_184))
; 
; =  {of.iadd[17].OUT} {of.iadd[16].B}
(assert (= of_195 of_184))
; 
; =  {sc.input.I[8].O} {sc.iadd[11].A}
(assert (= sc_26 sc_173))
; 
; =  {of.input.I[8].O} {of.iadd[11].A}
(assert (= of_26 of_173))
; 
; =  {sc.switch[14].PROD} {sc.iadd[19].D}
(assert (= sc_18 sc_196))
; 
; =  {of.switch[14].PROD} {of.iadd[19].D}
(assert (= of_18 of_196))
; 
; =  {sc.input.I[23].O} {sc.igenebind[2].TF}
(assert (= sc_72 sc_113))
; 
; =  {of.input.I[23].O} {of.igenebind[2].TF}
(assert (= of_72 of_113))
; 
; =  {sc.input.I[21].O} {sc.itov[0].X}
(assert (= sc_58 sc_163))
; 
; =  {of.input.I[21].O} {of.itov[0].X}
(assert (= of_58 of_163))
; 
; =  {sc.input.V[5].O} {sc.vadd[13].C}
(assert (= sc_154 sc_95))
; 
; =  {of.input.V[5].O} {of.vadd[13].C}
(assert (= of_154 of_95))
; 
; =  {sc.switch[10].PROD} {sc.itov[9].X}
(assert (= sc_8 sc_160))
; 
; =  {of.switch[10].PROD} {of.itov[9].X}
(assert (= of_8 of_160))
; 
; =  {sc.input.V[6].O} {sc.vadd[13].OUT2_0}
(assert (= sc_146 sc_93))
; 
; =  {of.input.V[6].O} {of.vadd[13].OUT2_0}
(assert (= of_146 of_93))
; 
; =  {sc.input.I[11].O} {sc.iadd[16].A}
(assert (= sc_42 sc_183))
; 
; =  {of.input.I[11].O} {of.iadd[16].A}
(assert (= of_42 of_183))
; 
; =  {sc.input.I[28].O} {sc.switch[14].Kmod}
(assert (= sc_78 sc_16))
; 
; =  {of.input.I[28].O} {of.switch[14].Kmod}
(assert (= of_78 of_16))
; 
; =  {sc.igenebind[4].GE} {sc.itov[12].K}
(assert (= sc_120 sc_158))
; 
; =  {of.igenebind[4].GE} {of.itov[12].K}
(assert (= of_120 of_158))
; 
; =  {sc.input.I[6].O} {sc.iadd[6].A}
(assert (= sc_52 sc_178))
; 
; =  {of.input.I[6].O} {of.iadd[6].A}
(assert (= of_52 of_178))
; 
; =  {sc.input.I[31].O} {sc.igenebind[18].K}
(assert (= sc_38 sc_122))
; 
; =  {of.input.I[31].O} {of.igenebind[18].K}
(assert (= of_38 of_122))
; 
; =  {sc.vgain[8].P} {sc.vtoi[7].K}
(assert (= sc_3 sc_108))
; 
; =  {of.vgain[8].P} {of.vtoi[7].K}
(assert (= of_3 of_108))
; 
; =  {sc.vadd[13].OUT2} {sc.output.V[1].X}
(assert (= sc_99 sc_91))
; 
; =  {of.vadd[13].OUT2} {of.output.V[1].X}
(assert (= of_99 of_91))
; 
; =  {sc.vadd[13].OUT2} {sc.switch[15].Vmax}
(assert (= sc_99 sc_12))
; 
; =  {of.vadd[13].OUT2} {of.switch[15].Vmax}
(assert (= of_99 of_12))
; 
; =  {sc.input.V[9].O} {sc.vtoi[3].K}
(assert (= sc_136 sc_111))
; 
; =  {of.input.V[9].O} {of.vtoi[3].K}
(assert (= of_136 of_111))
; 
; =  {sc.iadd[19].OUT} {sc.igenebind[18].TF}
(assert (= sc_200 sc_121))
; 
; =  {of.iadd[19].OUT} {of.igenebind[18].TF}
(assert (= of_200 of_121))
; 
; =  {sc.input.I[18].O} {sc.switch[15].SUB}
(assert (= sc_84 sc_10))
; 
; =  {of.input.I[18].O} {of.switch[15].SUB}
(assert (= of_84 of_10))
; 
; =  {sc.input.I[9].O} {sc.iadd[11].B}
(assert (= sc_36 sc_174))
; 
; =  {of.input.I[9].O} {of.iadd[11].B}
(assert (= of_36 of_174))
; 
; =  {sc.input.I[4].O} {sc.iadd[5].C}
(assert (= sc_68 sc_187))
; 
; =  {of.input.I[4].O} {of.iadd[5].C}
(assert (= of_68 of_187))
; 
; =  {sc.input.I[16].O} {sc.iadd[19].B}
(assert (= sc_60 sc_199))
; 
; =  {of.input.I[16].O} {of.iadd[19].B}
(assert (= of_60 of_199))
; 
; =  {sc.input.I[3].O} {sc.iadd[5].A}
(assert (= sc_64 sc_188))
; 
; =  {of.input.I[3].O} {of.iadd[5].A}
(assert (= of_64 of_188))
; 
; =  {sc.input.I[5].O} {sc.iadd[6].D}
(assert (= sc_70 sc_176))
; 
; =  {of.input.I[5].O} {of.iadd[6].D}
(assert (= of_70 of_176))
; 
; =  {sc.switch[15].PROD} {sc.iadd[20].B}
(assert (= sc_13 sc_169))
; 
; =  {of.switch[15].PROD} {of.iadd[20].B}
(assert (= of_13 of_169))
; 
; =  {sc.iadd[20].OUT} {sc.igenebind[2].K}
(assert (= sc_170 sc_114))
; 
; =  {of.iadd[20].OUT} {of.igenebind[2].K}
(assert (= of_170 of_114))
; 
; =  {sc.input.V[12].O} {sc.switch[15].n}
(assert (= sc_134 sc_9))
; 
; =  {of.input.V[12].O} {of.switch[15].n}
(assert (= of_134 of_9))
; 
; =  {sc.input.V[8].O} {sc.switch[14].n}
(assert (= sc_128 sc_14))
; 
; =  {of.input.V[8].O} {of.switch[14].n}
(assert (= of_128 of_14))
; 
; =  {sc.input.I[2].O} {sc.iadd[5].D}
(assert (= sc_20 sc_186))
; 
; =  {of.input.I[2].O} {of.iadd[5].D}
(assert (= of_20 of_186))
; 
; =  {sc.input.I[20].O} {sc.switch[14].SUB}
(assert (= sc_22 sc_15))
; 
; =  {of.input.I[20].O} {of.switch[14].SUB}
(assert (= of_22 of_15))
; 
; =  {sc.input.V[3].O} {sc.vadd[1].C}
(assert (= sc_150 sc_102))
; 
; =  {of.input.V[3].O} {of.vadd[1].C}
(assert (= of_150 of_102))
; 
; =  {sc.input.I[29].O} {sc.igenebind[18].Vmax}
(assert (= sc_24 sc_123))
; 
; =  {of.input.I[29].O} {of.igenebind[18].Vmax}
(assert (= of_24 of_123))
; 
; =  {sc.input.V[2].O} {sc.vadd[1].A}
(assert (= sc_126 sc_103))
; 
; =  {of.input.V[2].O} {of.vadd[1].A}
(assert (= of_126 of_103))
; 
; =  {sc.input.I[34].O} {sc.iadd[20].A}
(assert (= sc_28 sc_168))
; 
; =  {of.input.I[34].O} {of.iadd[20].A}
(assert (= of_28 of_168))
; 
; =  {sc.input.I[15].O} {sc.iadd[17].C}
(assert (= sc_50 sc_192))
; 
; =  {of.input.I[15].O} {of.iadd[17].C}
(assert (= of_50 of_192))
; 
; =  {sc.input.I[1].O} {sc.igenebind[4].Vmax}
(assert (= sc_76 sc_119))
; 
; =  {of.input.I[1].O} {of.igenebind[4].Vmax}
(assert (= of_76 of_119))
; 
; =  {sc.input.I[33].O} {sc.iadd[20].D}
(assert (= sc_54 sc_166))
; 
; =  {of.input.I[33].O} {of.iadd[20].D}
(assert (= of_54 of_166))
; 
; =  {sc.input.V[1].O} {sc.switch[10].n}
(assert (= sc_156 sc_4))
; 
; =  {of.input.V[1].O} {of.switch[10].n}
(assert (= of_156 of_4))
; 
; =  {sc.input.I[13].O} {sc.iadd[17].D}
(assert (= sc_32 sc_191))
; 
; =  {of.input.I[13].O} {of.iadd[17].D}
(assert (= of_32 of_191))
; 
; =  {sc.input.I[17].O} {sc.iadd[19].A}
(assert (= sc_80 sc_198))
; 
; =  {of.input.I[17].O} {of.iadd[19].A}
(assert (= of_80 of_198))
; 
; =  {sc.input.V[7].O} {sc.vadd[1].OUT2_0}
(assert (= sc_130 sc_100))
; 
; =  {of.input.V[7].O} {of.vadd[1].OUT2_0}
(assert (= of_130 of_100))
; 
; =  {sc.input.I[27].O} {sc.iadd[11].C}
(assert (= sc_48 sc_172))
; 
; =  {of.input.I[27].O} {of.iadd[11].C}
(assert (= of_48 of_172))
; 
; =  {sc.input.V[0].O} {sc.vgain[8].X}
(assert (= sc_138 sc_0))
; 
; =  {of.input.V[0].O} {of.vgain[8].X}
(assert (= of_138 of_0))
; 
; =  {sc.input.V[10].O} {sc.vadd[1].D}
(assert (= sc_142 sc_101))
; 
; =  {of.input.V[10].O} {of.vadd[1].D}
(assert (= of_142 of_101))
; 
; =  {sc.itov[9].Y} {sc.vgain[8].Z}
(assert (= sc_162 sc_2))
; 
; =  {of.itov[9].Y} {of.vgain[8].Z}
(assert (= of_162 of_2))
; 
; =  {sc.input.V[4].O} {sc.vadd[13].A}
(assert (= sc_152 sc_96))
; 
; =  {of.input.V[4].O} {of.vadd[13].A}
(assert (= of_152 of_96))
; 
; =  {sc.input.I[19].O} {sc.igenebind[2].Vmax}
(assert (= sc_86 sc_115))
; 
; =  {of.input.I[19].O} {of.igenebind[2].Vmax}
(assert (= of_86 of_115))
; 
; =  {sc.iadd[16].OUT} {sc.switch[15].Kmod}
(assert (= sc_185 sc_11))
; 
; =  {of.iadd[16].OUT} {of.switch[15].Kmod}
(assert (= of_185 of_11))
(assert (<= (* (/ 1. sc_90) 0.001) 0.1))
(assert (<= (* (/ 1. sc_92) 0.001) 0.1))
; 
; =  {sc.vadd[1].OUT2} {sc.output.V[0].O} {sc.vadd[13].OUT2} {sc.output.V[1].O}
(assert (and (and (= sc_106 sc_90) (= sc_106 sc_99)) (= sc_106 sc_92)))
(assert (= __minima__ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (ite (>= slbot_92 0.) slbot_92 (- slbot_92)) (ite (>= sltop_158 0.) sltop_158 (- sltop_158))) (ite (>= sltop_18 0.) sltop_18 (- sltop_18))) (ite (>= sltop_91 0.) sltop_91 (- sltop_91))) (ite (>= slbot_175 0.) slbot_175 (- slbot_175))) (ite (>= sltop_90 0.) sltop_90 (- sltop_90))) (ite (>= slbot_189 0.) slbot_189 (- slbot_189))) (ite (>= sltop_120 0.) sltop_120 (- sltop_120))) (ite (>= slbot_179 0.) slbot_179 (- slbot_179))) (ite (>= slbot_3 0.) slbot_3 (- slbot_3))) (ite (>= sltop_104 0.) sltop_104 (- sltop_104))) (ite (>= sltop_164 0.) sltop_164 (- sltop_164))) (ite (>= sltop_190 0.) sltop_190 (- sltop_190))) (ite (>= slbot_196 0.) slbot_196 (- slbot_196))) (ite (>= sltop_105 0.) sltop_105 (- sltop_105))) (ite (>= slbot_159 0.) slbot_159 (- slbot_159))) (ite (>= slbot_2 0.) slbot_2 (- slbot_2))) (ite (>= slbot_120 0.) slbot_120 (- slbot_120))) (ite (>= sltop_112 0.) sltop_112 (- sltop_112))) (ite (>= sltop_109 0.) sltop_109 (- sltop_109))) (ite (>= sltop_121 0.) sltop_121 (- sltop_121))) (ite (>= slbot_18 0.) slbot_18 (- slbot_18))) (ite (>= slbot_99 0.) slbot_99 (- slbot_99))) (ite (>= sltop_2 0.) sltop_2 (- sltop_2))) (ite (>= sltop_8 0.) sltop_8 (- sltop_8))) (ite (>= sltop_13 0.) sltop_13 (- sltop_13))) (ite (>= slbot_124 0.) slbot_124 (- slbot_124))) (ite (>= slbot_116 0.) slbot_116 (- slbot_116))) (ite (>= slbot_104 0.) slbot_104 (- slbot_104))) (ite (>= slbot_190 0.) slbot_190 (- slbot_190))) (ite (>= slbot_200 0.) slbot_200 (- slbot_200))) (ite (>= slbot_91 0.) slbot_91 (- slbot_91))) (ite (>= slbot_98 0.) slbot_98 (- slbot_98))) (ite (>= sltop_189 0.) sltop_189 (- sltop_189))) (ite (>= slbot_108 0.) slbot_108 (- slbot_108))) (ite (>= slbot_5 0.) slbot_5 (- slbot_5))) (ite (>= sltop_110 0.) sltop_110 (- sltop_110))) (ite (>= slbot_162 0.) slbot_162 (- slbot_162))) (ite (>= slbot_170 0.) slbot_170 (- slbot_170))) (ite (>= slbot_121 0.) slbot_121 (- slbot_121))) (ite (>= slbot_158 0.) slbot_158 (- slbot_158))) (ite (>= sltop_180 0.) sltop_180 (- sltop_180))) (ite (>= sltop_195 0.) sltop_195 (- sltop_195))) (ite (>= sltop_165 0.) sltop_165 (- sltop_165))) (ite (>= sltop_200 0.) sltop_200 (- sltop_200))) (ite (>= slbot_114 0.) slbot_114 (- slbot_114))) (ite (>= sltop_17 0.) sltop_17 (- sltop_17))) (ite (>= slbot_110 0.) slbot_110 (- slbot_110))) (ite (>= sltop_159 0.) sltop_159 (- sltop_159))) (ite (>= sltop_162 0.) sltop_162 (- sltop_162))) (ite (>= slbot_185 0.) slbot_185 (- slbot_185))) (ite (>= sltop_3 0.) sltop_3 (- sltop_3))) (ite (>= sltop_40 0.) sltop_40 (- sltop_40))) (ite (>= sltop_179 0.) sltop_179 (- sltop_179))) (ite (>= sltop_99 0.) sltop_99 (- sltop_99))) (ite (>= sltop_175 0.) sltop_175 (- sltop_175))) (ite (>= slbot_194 0.) slbot_194 (- slbot_194))) (ite (>= slbot_12 0.) slbot_12 (- slbot_12))) (ite (>= slbot_89 0.) slbot_89 (- slbot_89))) (ite (>= slbot_13 0.) slbot_13 (- slbot_13))) (ite (>= slbot_11 0.) slbot_11 (- slbot_11))) (ite (>= slbot_165 0.) slbot_165 (- slbot_165))) (ite (>= sltop_11 0.) sltop_11 (- sltop_11))) (ite (>= slbot_112 0.) slbot_112 (- slbot_112))) (ite (>= sltop_114 0.) sltop_114 (- sltop_114))) (ite (>= sltop_184 0.) sltop_184 (- sltop_184))) (ite (>= slbot_109 0.) slbot_109 (- slbot_109))) (ite (>= sltop_116 0.) sltop_116 (- sltop_116))) (ite (>= slbot_171 0.) slbot_171 (- slbot_171))) (ite (>= slbot_160 0.) slbot_160 (- slbot_160))) (ite (>= sltop_124 0.) sltop_124 (- sltop_124))) (ite (>= slbot_17 0.) slbot_17 (- slbot_17))) (ite (>= sltop_39 0.) sltop_39 (- sltop_39))) (ite (>= sltop_89 0.) sltop_89 (- sltop_89))) (ite (>= sltop_92 0.) sltop_92 (- sltop_92))) (ite (>= slbot_117 0.) slbot_117 (- slbot_117))) (ite (>= sltop_117 0.) sltop_117 (- sltop_117))) (ite (>= slbot_169 0.) slbot_169 (- slbot_169))) (ite (>= slbot_180 0.) slbot_180 (- slbot_180))) (ite (>= sltop_12 0.) sltop_12 (- sltop_12))) (ite (>= slbot_90 0.) slbot_90 (- slbot_90))) (ite (>= slbot_106 0.) slbot_106 (- slbot_106))) (ite (>= slbot_195 0.) slbot_195 (- slbot_195))) (ite (>= sltop_5 0.) sltop_5 (- sltop_5))) (ite (>= slbot_184 0.) slbot_184 (- slbot_184))) (ite (>= sltop_98 0.) sltop_98 (- sltop_98))) (ite (>= slbot_105 0.) slbot_105 (- slbot_105))) (ite (>= slbot_164 0.) slbot_164 (- slbot_164))) (ite (>= sltop_97 0.) sltop_97 (- sltop_97))) (ite (>= sltop_194 0.) sltop_194 (- sltop_194))) (ite (>= sltop_171 0.) sltop_171 (- sltop_171))) (ite (>= sltop_169 0.) sltop_169 (- sltop_169))) (ite (>= sltop_106 0.) sltop_106 (- sltop_106))) (ite (>= slbot_39 0.) slbot_39 (- slbot_39))) (ite (>= sltop_160 0.) sltop_160 (- sltop_160))) (ite (>= sltop_196 0.) sltop_196 (- sltop_196))) (ite (>= sltop_185 0.) sltop_185 (- sltop_185))) (ite (>= slbot_8 0.) slbot_8 (- slbot_8))) (ite (>= slbot_40 0.) slbot_40 (- slbot_40))) (ite (>= slbot_97 0.) slbot_97 (- slbot_97))) (ite (>= sltop_108 0.) sltop_108 (- sltop_108))) (ite (>= sltop_170 0.) sltop_170 (- sltop_170)))))
(check-sat)
