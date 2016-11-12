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
; =  {sc.vgain[7].P} {((sc.vgain[7].X/sc.vgain[7].Y)*sc.vgain[7].Z*1.)}
(assert (= sc_3 (* (* (/ sc_0 sc_1) sc_2) 1.)))
; 
; =  {of.vgain[7].P} {0.}
(assert (= of_3 0.))
; 
; >=  {((sc.vgain[7].X*31.2)+of.vgain[7].X)} {3300.}
(assert (<= (+ (* sc_0 31.2) of_0) 3300.))
; 
; <=  {((sc.vgain[7].X*31.2)+of.vgain[7].X)} {0.0001}
(assert (>= (+ (* sc_0 31.2) of_0) 0.0001))
(declare-fun slbot_1 () Real)
(declare-fun sltop_1 () Real)
; 
; =  {(((sc.vgain[7].Y*0.5)+of.vgain[7].Y)+sl.min.vgain[7].Y)} {1.}
(assert (= (+ (+ (* sc_1 0.5) of_1) slbot_1) 1.))
; 
; =  {(((sc.vgain[7].Y*16.6)+of.vgain[7].Y)+sl.max.vgain[7].Y)} {3300.}
(assert (= (+ (+ (* sc_1 16.6) of_1) sltop_1) 3300.))
(declare-fun slbot_3 () Real)
(declare-fun sltop_3 () Real)
; 
; =  {(((sc.vgain[7].P*0.469879518072)+of.vgain[7].P)+sl.min.vgain[7].P)} {1.51515151515e-12}
(assert (= (+ (+ (* sc_3 0.469879518072) of_3) slbot_3) 1.51515151515e-12))
; 
; =  {(((sc.vgain[7].P*31.2)+of.vgain[7].P)+sl.max.vgain[7].P)} {5445000.}
(assert (= (+ (+ (* sc_3 31.2) of_3) sltop_3) 5445000.))
(declare-fun slbot_2 () Real)
(declare-fun sltop_2 () Real)
; 
; =  {(((sc.vgain[7].Z*0.5)+of.vgain[7].Z)+sl.min.vgain[7].Z)} {0.0001}
(assert (= (+ (+ (* sc_2 0.5) of_2) slbot_2) 0.0001))
; 
; =  {(((sc.vgain[7].Z*1.)+of.vgain[7].Z)+sl.max.vgain[7].Z)} {3300.}
(assert (= (+ (+ (* sc_2 1.) of_2) sltop_2) 3300.))
(declare-fun slbot_3 () Real)
(declare-fun sltop_3 () Real)
; 
; =  {(((sc.vgain[7].P*0.469879518072)+of.vgain[7].P)+sl.min.vgain[7].P)} {1.51515151515e-12}
(assert (= (+ (+ (* sc_3 0.469879518072) of_3) slbot_3) 1.51515151515e-12))
; 
; =  {(((sc.vgain[7].P*31.2)+of.vgain[7].P)+sl.max.vgain[7].P)} {5445000.}
(assert (= (+ (+ (* sc_3 31.2) of_3) sltop_3) 5445000.))
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
; =  {sc.vgain[0].P} {((sc.vgain[0].X/sc.vgain[0].Y)*sc.vgain[0].Z*1.)}
(assert (= sc_7 (* (* (/ sc_4 sc_5) sc_6) 1.)))
; 
; =  {of.vgain[0].P} {0.}
(assert (= of_7 0.))
; 
; >=  {((sc.vgain[0].X*1.)+of.vgain[0].X)} {3300.}
(assert (<= (+ (* sc_4 1.) of_4) 3300.))
; 
; <=  {((sc.vgain[0].X*1.)+of.vgain[0].X)} {0.0001}
(assert (>= (+ (* sc_4 1.) of_4) 0.0001))
; 
; >=  {((sc.vgain[0].Y*0.125)+of.vgain[0].Y)} {3300.}
(assert (<= (+ (* sc_5 0.125) of_5) 3300.))
; 
; <=  {((sc.vgain[0].Y*0.125)+of.vgain[0].Y)} {1.}
(assert (>= (+ (* sc_5 0.125) of_5) 1.))
(declare-fun slbot_7 () Real)
(declare-fun sltop_7 () Real)
; 
; =  {(((sc.vgain[0].P*1.87951807229)+of.vgain[0].P)+sl.min.vgain[0].P)} {1.51515151515e-12}
(assert (= (+ (+ (* sc_7 1.87951807229) of_7) slbot_7) 1.51515151515e-12))
; 
; =  {(((sc.vgain[0].P*124.8)+of.vgain[0].P)+sl.max.vgain[0].P)} {5445000.}
(assert (= (+ (+ (* sc_7 124.8) of_7) sltop_7) 5445000.))
(declare-fun slbot_6 () Real)
(declare-fun sltop_6 () Real)
; 
; =  {(((sc.vgain[0].Z*0.469879518072)+of.vgain[0].Z)+sl.min.vgain[0].Z)} {0.0001}
(assert (= (+ (+ (* sc_6 0.469879518072) of_6) slbot_6) 0.0001))
; 
; =  {(((sc.vgain[0].Z*31.2)+of.vgain[0].Z)+sl.max.vgain[0].Z)} {3300.}
(assert (= (+ (+ (* sc_6 31.2) of_6) sltop_6) 3300.))
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
; no offset
(assert (= of_8 0.))
; no offset
(assert (= of_9 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_10 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vgain[4].P} {((sc.vgain[4].X/sc.vgain[4].Y)*sc.vgain[4].Z*1.)}
(assert (= sc_11 (* (* (/ sc_8 sc_9) sc_10) 1.)))
; 
; =  {of.vgain[4].P} {0.}
(assert (= of_11 0.))
; 
; >=  {((sc.vgain[4].X*1.)+of.vgain[4].X)} {3300.}
(assert (<= (+ (* sc_8 1.) of_8) 3300.))
; 
; <=  {((sc.vgain[4].X*1.)+of.vgain[4].X)} {0.0001}
(assert (>= (+ (* sc_8 1.) of_8) 0.0001))
; 
; >=  {((sc.vgain[4].Y*0.125)+of.vgain[4].Y)} {3300.}
(assert (<= (+ (* sc_9 0.125) of_9) 3300.))
; 
; <=  {((sc.vgain[4].Y*0.125)+of.vgain[4].Y)} {1.}
(assert (>= (+ (* sc_9 0.125) of_9) 1.))
(declare-fun slbot_11 () Real)
(declare-fun sltop_11 () Real)
; 
; =  {(((sc.vgain[4].P*0.000362037485643)+of.vgain[4].P)+sl.min.vgain[4].P)} {1.51515151515e-12}
(assert (= (+ (+ (* sc_11 0.000362037485643) of_11) slbot_11) 1.51515151515e-12))
; 
; =  {(((sc.vgain[4].P*3535.53390593)+of.vgain[4].P)+sl.max.vgain[4].P)} {5445000.}
(assert (= (+ (+ (* sc_11 3535.53390593) of_11) sltop_11) 5445000.))
(declare-fun slbot_10 () Real)
(declare-fun sltop_10 () Real)
; 
; =  {(((sc.vgain[4].Z*9.05093714108e-05)+of.vgain[4].Z)+sl.min.vgain[4].Z)} {0.0001}
(assert (= (+ (+ (* sc_10 9.05093714108e-05) of_10) slbot_10) 0.0001))
; 
; =  {(((sc.vgain[4].Z*883.883476483)+of.vgain[4].Z)+sl.max.vgain[4].Z)} {3300.}
(assert (= (+ (+ (* sc_10 883.883476483) of_10) sltop_10) 3300.))
(declare-fun sc_12 () Real)
(assert (> sc_12 1e-08))
(declare-fun of_12 () Real)
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
; no offset
(assert (= of_13 0.))
; no offset
(assert (= of_14 0.))
; 
; =  {(sc.switch[3].SUB/sc.switch[3].Kmod)} {1.}
(assert (= (/ sc_13 sc_14) 1.))
; no scale
(assert (= (/ sc_13 sc_14) 1.))
; no scale
(assert (= sc_12 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_12 0.))
; no offset
(assert (= of_15 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.switch[3].PROD} {(sc.switch[3].Vmax/1.)}
(assert (= sc_16 (/ sc_15 1.)))
; 
; =  {of.switch[3].PROD} {0.}
(assert (= of_16 0.))
(declare-fun slbot_13 () Real)
(declare-fun sltop_13 () Real)
; 
; =  {(((sc.switch[3].SUB*0.)+of.switch[3].SUB)+sl.min.switch[3].SUB)} {0.0001}
(assert (= (+ (+ (* sc_13 0.) of_13) slbot_13) 0.0001))
; 
; =  {(((sc.switch[3].SUB*1.)+of.switch[3].SUB)+sl.max.switch[3].SUB)} {10.}
(assert (= (+ (+ (* sc_13 1.) of_13) sltop_13) 10.))
; 
; >=  {((sc.switch[3].n*2.0015)+of.switch[3].n)} {3300.}
(assert (<= (+ (* sc_12 2.0015) of_12) 3300.))
; 
; <=  {((sc.switch[3].n*2.0015)+of.switch[3].n)} {0.5}
(assert (>= (+ (* sc_12 2.0015) of_12) 0.5))
; 
; >=  {((sc.switch[3].Kmod*2.9618e-05)+of.switch[3].Kmod)} {10.}
(assert (<= (+ (* sc_14 2.9618e-05) of_14) 10.))
; 
; <=  {((sc.switch[3].Kmod*2.9618e-05)+of.switch[3].Kmod)} {1.}
(assert (>= (+ (* sc_14 2.9618e-05) of_14) 1.))
(declare-fun slbot_16 () Real)
(declare-fun sltop_16 () Real)
; 
; =  {(((sc.switch[3].PROD*0.)+of.switch[3].PROD)+sl.min.switch[3].PROD)} {0.}
(assert (= (+ (+ (* sc_16 0.) of_16) slbot_16) 0.))
; 
; =  {(((sc.switch[3].PROD*15.6)+of.switch[3].PROD)+sl.max.switch[3].PROD)} {9.99995000037}
(assert (= (+ (+ (* sc_16 15.6) of_16) sltop_16) 9.99995000037))
(declare-fun slbot_15 () Real)
(declare-fun sltop_15 () Real)
; 
; =  {(((sc.switch[3].Vmax*0.)+of.switch[3].Vmax)+sl.min.switch[3].Vmax)} {0.0001}
(assert (= (+ (+ (* sc_15 0.) of_15) slbot_15) 0.0001))
; 
; =  {(((sc.switch[3].Vmax*15.6)+of.switch[3].Vmax)+sl.max.switch[3].Vmax)} {10.}
(assert (= (+ (+ (* sc_15 15.6) of_15) sltop_15) 10.))
(declare-fun slbot_16 () Real)
(declare-fun sltop_16 () Real)
; 
; =  {(((sc.switch[3].PROD*0.)+of.switch[3].PROD)+sl.min.switch[3].PROD)} {0.}
(assert (= (+ (+ (* sc_16 0.) of_16) slbot_16) 0.))
; 
; =  {(((sc.switch[3].PROD*15.6)+of.switch[3].PROD)+sl.max.switch[3].PROD)} {9.99995000037}
(assert (= (+ (+ (* sc_16 15.6) of_16) sltop_16) 9.99995000037))
(declare-fun sc_17 () Real)
(assert (> sc_17 1e-08))
(declare-fun of_17 () Real)
(declare-fun sc_18 () Real)
(assert (> sc_18 1e-08))
(declare-fun of_18 () Real)
; 
; =  {sc.input.I[2].O} {sc.input.I[2].X}
(assert (= sc_18 sc_17))
; 
; =  {of.input.I[2].O} {of.input.I[2].X}
(assert (= of_18 of_17))
(declare-fun slbot_17 () Real)
(declare-fun sltop_17 () Real)
; 
; =  {(((sc.input.I[2].X*0.5)+of.input.I[2].X)+sl.min.input.I[2].X)} {0.}
(assert (= (+ (+ (* sc_17 0.5) of_17) slbot_17) 0.))
; 
; =  {(((sc.input.I[2].X*1.)+of.input.I[2].X)+sl.max.input.I[2].X)} {10.}
(assert (= (+ (+ (* sc_17 1.) of_17) sltop_17) 10.))
(declare-fun slbot_18 () Real)
(declare-fun sltop_18 () Real)
; 
; =  {(((sc.input.I[2].O*0.5)+of.input.I[2].O)+sl.min.input.I[2].O)} {0.}
(assert (= (+ (+ (* sc_18 0.5) of_18) slbot_18) 0.))
; 
; =  {(((sc.input.I[2].O*1.)+of.input.I[2].O)+sl.max.input.I[2].O)} {10.}
(assert (= (+ (+ (* sc_18 1.) of_18) sltop_18) 10.))
(declare-fun sc_19 () Real)
(assert (> sc_19 1e-08))
(declare-fun of_19 () Real)
(declare-fun sc_20 () Real)
(assert (> sc_20 1e-08))
(declare-fun of_20 () Real)
; 
; =  {sc.input.I[8].O} {sc.input.I[8].X}
(assert (= sc_20 sc_19))
; 
; =  {of.input.I[8].O} {of.input.I[8].X}
(assert (= of_20 of_19))
; 
; >=  {((sc.input.I[8].X*0.)+of.input.I[8].X)} {10.}
(assert (<= (+ (* sc_19 0.) of_19) 10.))
; 
; <=  {((sc.input.I[8].X*0.)+of.input.I[8].X)} {0.}
(assert (>= (+ (* sc_19 0.) of_19) 0.))
; 
; >=  {((sc.input.I[8].O*0.)+of.input.I[8].O)} {10.}
(assert (<= (+ (* sc_20 0.) of_20) 10.))
; 
; <=  {((sc.input.I[8].O*0.)+of.input.I[8].O)} {0.}
(assert (>= (+ (* sc_20 0.) of_20) 0.))
(declare-fun sc_21 () Real)
(assert (> sc_21 1e-08))
(declare-fun of_21 () Real)
(declare-fun sc_22 () Real)
(assert (> sc_22 1e-08))
(declare-fun of_22 () Real)
; 
; =  {sc.input.I[7].O} {sc.input.I[7].X}
(assert (= sc_22 sc_21))
; 
; =  {of.input.I[7].O} {of.input.I[7].X}
(assert (= of_22 of_21))
; 
; >=  {((sc.input.I[7].X*0.)+of.input.I[7].X)} {10.}
(assert (<= (+ (* sc_21 0.) of_21) 10.))
; 
; <=  {((sc.input.I[7].X*0.)+of.input.I[7].X)} {0.}
(assert (>= (+ (* sc_21 0.) of_21) 0.))
; 
; >=  {((sc.input.I[7].O*0.)+of.input.I[7].O)} {10.}
(assert (<= (+ (* sc_22 0.) of_22) 10.))
; 
; <=  {((sc.input.I[7].O*0.)+of.input.I[7].O)} {0.}
(assert (>= (+ (* sc_22 0.) of_22) 0.))
(declare-fun sc_23 () Real)
(assert (> sc_23 1e-08))
(declare-fun of_23 () Real)
(declare-fun sc_24 () Real)
(assert (> sc_24 1e-08))
(declare-fun of_24 () Real)
; 
; =  {sc.input.I[9].O} {sc.input.I[9].X}
(assert (= sc_24 sc_23))
; 
; =  {of.input.I[9].O} {of.input.I[9].X}
(assert (= of_24 of_23))
; 
; >=  {((sc.input.I[9].X*2.9618e-05)+of.input.I[9].X)} {10.}
(assert (<= (+ (* sc_23 2.9618e-05) of_23) 10.))
; 
; <=  {((sc.input.I[9].X*2.9618e-05)+of.input.I[9].X)} {0.}
(assert (>= (+ (* sc_23 2.9618e-05) of_23) 0.))
; 
; >=  {((sc.input.I[9].O*2.9618e-05)+of.input.I[9].O)} {10.}
(assert (<= (+ (* sc_24 2.9618e-05) of_24) 10.))
; 
; <=  {((sc.input.I[9].O*2.9618e-05)+of.input.I[9].O)} {0.}
(assert (>= (+ (* sc_24 2.9618e-05) of_24) 0.))
(declare-fun sc_25 () Real)
(assert (> sc_25 1e-08))
(declare-fun of_25 () Real)
(declare-fun sc_26 () Real)
(assert (> sc_26 1e-08))
(declare-fun of_26 () Real)
; 
; =  {sc.input.I[0].O} {sc.input.I[0].X}
(assert (= sc_26 sc_25))
; 
; =  {of.input.I[0].O} {of.input.I[0].X}
(assert (= of_26 of_25))
(declare-fun slbot_25 () Real)
(declare-fun sltop_25 () Real)
; 
; =  {(((sc.input.I[0].X*0.)+of.input.I[0].X)+sl.min.input.I[0].X)} {0.}
(assert (= (+ (+ (* sc_25 0.) of_25) slbot_25) 0.))
; 
; =  {(((sc.input.I[0].X*1.)+of.input.I[0].X)+sl.max.input.I[0].X)} {10.}
(assert (= (+ (+ (* sc_25 1.) of_25) sltop_25) 10.))
(declare-fun slbot_26 () Real)
(declare-fun sltop_26 () Real)
; 
; =  {(((sc.input.I[0].O*0.)+of.input.I[0].O)+sl.min.input.I[0].O)} {0.}
(assert (= (+ (+ (* sc_26 0.) of_26) slbot_26) 0.))
; 
; =  {(((sc.input.I[0].O*1.)+of.input.I[0].O)+sl.max.input.I[0].O)} {10.}
(assert (= (+ (+ (* sc_26 1.) of_26) sltop_26) 10.))
(declare-fun sc_27 () Real)
(assert (> sc_27 1e-08))
(declare-fun of_27 () Real)
(declare-fun sc_28 () Real)
(assert (> sc_28 1e-08))
(declare-fun of_28 () Real)
; 
; =  {sc.input.I[10].O} {sc.input.I[10].X}
(assert (= sc_28 sc_27))
; 
; =  {of.input.I[10].O} {of.input.I[10].X}
(assert (= of_28 of_27))
; 
; >=  {((sc.input.I[10].X*1.)+of.input.I[10].X)} {10.}
(assert (<= (+ (* sc_27 1.) of_27) 10.))
; 
; <=  {((sc.input.I[10].X*1.)+of.input.I[10].X)} {0.}
(assert (>= (+ (* sc_27 1.) of_27) 0.))
; 
; >=  {((sc.input.I[10].O*1.)+of.input.I[10].O)} {10.}
(assert (<= (+ (* sc_28 1.) of_28) 10.))
; 
; <=  {((sc.input.I[10].O*1.)+of.input.I[10].O)} {0.}
(assert (>= (+ (* sc_28 1.) of_28) 0.))
(declare-fun sc_29 () Real)
(assert (> sc_29 1e-08))
(declare-fun of_29 () Real)
(declare-fun sc_30 () Real)
(assert (> sc_30 1e-08))
(declare-fun of_30 () Real)
; 
; =  {sc.input.I[6].O} {sc.input.I[6].X}
(assert (= sc_30 sc_29))
; 
; =  {of.input.I[6].O} {of.input.I[6].X}
(assert (= of_30 of_29))
; 
; >=  {((sc.input.I[6].X*0.)+of.input.I[6].X)} {10.}
(assert (<= (+ (* sc_29 0.) of_29) 10.))
; 
; <=  {((sc.input.I[6].X*0.)+of.input.I[6].X)} {0.}
(assert (>= (+ (* sc_29 0.) of_29) 0.))
; 
; >=  {((sc.input.I[6].O*0.)+of.input.I[6].O)} {10.}
(assert (<= (+ (* sc_30 0.) of_30) 10.))
; 
; <=  {((sc.input.I[6].O*0.)+of.input.I[6].O)} {0.}
(assert (>= (+ (* sc_30 0.) of_30) 0.))
(declare-fun sc_31 () Real)
(assert (> sc_31 1e-08))
(declare-fun of_31 () Real)
(declare-fun sc_32 () Real)
(assert (> sc_32 1e-08))
(declare-fun of_32 () Real)
; 
; =  {sc.input.I[3].O} {sc.input.I[3].X}
(assert (= sc_32 sc_31))
; 
; =  {of.input.I[3].O} {of.input.I[3].X}
(assert (= of_32 of_31))
; 
; >=  {((sc.input.I[3].X*156.25)+of.input.I[3].X)} {10.}
(assert (<= (+ (* sc_31 156.25) of_31) 10.))
; 
; <=  {((sc.input.I[3].X*156.25)+of.input.I[3].X)} {0.}
(assert (>= (+ (* sc_31 156.25) of_31) 0.))
; 
; >=  {((sc.input.I[3].O*156.25)+of.input.I[3].O)} {10.}
(assert (<= (+ (* sc_32 156.25) of_32) 10.))
; 
; <=  {((sc.input.I[3].O*156.25)+of.input.I[3].O)} {0.}
(assert (>= (+ (* sc_32 156.25) of_32) 0.))
(declare-fun sc_33 () Real)
(assert (> sc_33 1e-08))
(declare-fun of_33 () Real)
(declare-fun sc_34 () Real)
(assert (> sc_34 1e-08))
(declare-fun of_34 () Real)
; 
; =  {sc.input.I[4].O} {sc.input.I[4].X}
(assert (= sc_34 sc_33))
; 
; =  {of.input.I[4].O} {of.input.I[4].X}
(assert (= of_34 of_33))
; 
; >=  {((sc.input.I[4].X*0.)+of.input.I[4].X)} {10.}
(assert (<= (+ (* sc_33 0.) of_33) 10.))
; 
; <=  {((sc.input.I[4].X*0.)+of.input.I[4].X)} {0.}
(assert (>= (+ (* sc_33 0.) of_33) 0.))
; 
; >=  {((sc.input.I[4].O*0.)+of.input.I[4].O)} {10.}
(assert (<= (+ (* sc_34 0.) of_34) 10.))
; 
; <=  {((sc.input.I[4].O*0.)+of.input.I[4].O)} {0.}
(assert (>= (+ (* sc_34 0.) of_34) 0.))
(declare-fun sc_35 () Real)
(assert (> sc_35 1e-08))
(declare-fun of_35 () Real)
(declare-fun sc_36 () Real)
(assert (> sc_36 1e-08))
(declare-fun of_36 () Real)
; 
; =  {sc.input.I[5].O} {sc.input.I[5].X}
(assert (= sc_36 sc_35))
; 
; =  {of.input.I[5].O} {of.input.I[5].X}
(assert (= of_36 of_35))
; 
; >=  {((sc.input.I[5].X*0.)+of.input.I[5].X)} {10.}
(assert (<= (+ (* sc_35 0.) of_35) 10.))
; 
; <=  {((sc.input.I[5].X*0.)+of.input.I[5].X)} {0.}
(assert (>= (+ (* sc_35 0.) of_35) 0.))
; 
; >=  {((sc.input.I[5].O*0.)+of.input.I[5].O)} {10.}
(assert (<= (+ (* sc_36 0.) of_36) 10.))
; 
; <=  {((sc.input.I[5].O*0.)+of.input.I[5].O)} {0.}
(assert (>= (+ (* sc_36 0.) of_36) 0.))
(declare-fun sc_37 () Real)
(assert (> sc_37 1e-08))
(declare-fun of_37 () Real)
(declare-fun sc_38 () Real)
(assert (> sc_38 1e-08))
(declare-fun of_38 () Real)
; 
; =  {sc.input.I[1].O} {sc.input.I[1].X}
(assert (= sc_38 sc_37))
; 
; =  {of.input.I[1].O} {of.input.I[1].X}
(assert (= of_38 of_37))
(declare-fun slbot_37 () Real)
(declare-fun sltop_37 () Real)
; 
; =  {(((sc.input.I[1].X*0.5)+of.input.I[1].X)+sl.min.input.I[1].X)} {0.}
(assert (= (+ (+ (* sc_37 0.5) of_37) slbot_37) 0.))
; 
; =  {(((sc.input.I[1].X*1.)+of.input.I[1].X)+sl.max.input.I[1].X)} {10.}
(assert (= (+ (+ (* sc_37 1.) of_37) sltop_37) 10.))
(declare-fun slbot_38 () Real)
(declare-fun sltop_38 () Real)
; 
; =  {(((sc.input.I[1].O*0.5)+of.input.I[1].O)+sl.min.input.I[1].O)} {0.}
(assert (= (+ (+ (* sc_38 0.5) of_38) slbot_38) 0.))
; 
; =  {(((sc.input.I[1].O*1.)+of.input.I[1].O)+sl.max.input.I[1].O)} {10.}
(assert (= (+ (+ (* sc_38 1.) of_38) sltop_38) 10.))
(declare-fun sc_39 () Real)
(assert (> sc_39 1e-08))
(declare-fun of_39 () Real)
(declare-fun sc_40 () Real)
(assert (> sc_40 1e-08))
(declare-fun of_40 () Real)
; 
; =  {sc.output.V[0].O} {sc.output.V[0].X}
(assert (= sc_40 sc_39))
; 
; =  {of.output.V[0].O} {of.output.V[0].X}
(assert (= of_40 of_39))
(declare-fun slbot_39 () Real)
(declare-fun sltop_39 () Real)
; 
; =  {(((sc.output.V[0].X*0.)+of.output.V[0].X)+sl.min.output.V[0].X)} {0.0001}
(assert (= (+ (+ (* sc_39 0.) of_39) slbot_39) 0.0001))
; 
; =  {(((sc.output.V[0].X*156.25)+of.output.V[0].X)+sl.max.output.V[0].X)} {3300.}
(assert (= (+ (+ (* sc_39 156.25) of_39) sltop_39) 3300.))
(declare-fun slbot_40 () Real)
(declare-fun sltop_40 () Real)
; 
; =  {(((sc.output.V[0].O*0.)+of.output.V[0].O)+sl.min.output.V[0].O)} {0.0001}
(assert (= (+ (+ (* sc_40 0.) of_40) slbot_40) 0.0001))
; 
; =  {(((sc.output.V[0].O*156.25)+of.output.V[0].O)+sl.max.output.V[0].O)} {3300.}
(assert (= (+ (+ (* sc_40 156.25) of_40) sltop_40) 3300.))
(declare-fun sc_41 () Real)
(assert (> sc_41 1e-08))
(declare-fun of_41 () Real)
(declare-fun sc_42 () Real)
(assert (> sc_42 1e-08))
(declare-fun of_42 () Real)
; 
; =  {sc.output.V[1].O} {sc.output.V[1].X}
(assert (= sc_42 sc_41))
; 
; =  {of.output.V[1].O} {of.output.V[1].X}
(assert (= of_42 of_41))
(declare-fun slbot_41 () Real)
(declare-fun sltop_41 () Real)
; 
; =  {(((sc.output.V[1].X*0.)+of.output.V[1].X)+sl.min.output.V[1].X)} {0.0001}
(assert (= (+ (+ (* sc_41 0.) of_41) slbot_41) 0.0001))
; 
; =  {(((sc.output.V[1].X*15.6)+of.output.V[1].X)+sl.max.output.V[1].X)} {3300.}
(assert (= (+ (+ (* sc_41 15.6) of_41) sltop_41) 3300.))
(declare-fun slbot_42 () Real)
(declare-fun sltop_42 () Real)
; 
; =  {(((sc.output.V[1].O*0.)+of.output.V[1].O)+sl.min.output.V[1].O)} {0.0001}
(assert (= (+ (+ (* sc_42 0.) of_42) slbot_42) 0.0001))
; 
; =  {(((sc.output.V[1].O*15.6)+of.output.V[1].O)+sl.max.output.V[1].O)} {3300.}
(assert (= (+ (+ (* sc_42 15.6) of_42) sltop_42) 3300.))
(declare-fun sc_43 () Real)
(assert (> sc_43 1e-08))
(declare-fun of_43 () Real)
(declare-fun sc_44 () Real)
(assert (> sc_44 1e-08))
(declare-fun of_44 () Real)
(declare-fun sc_45 () Real)
(assert (> sc_45 1e-08))
(declare-fun of_45 () Real)
(declare-fun sc_46 () Real)
(assert (> sc_46 1e-08))
(declare-fun of_46 () Real)
(declare-fun sc_47 () Real)
(assert (> sc_47 1e-08))
(declare-fun of_47 () Real)
(declare-fun sc_48 () Real)
(assert (> sc_48 1e-08))
(declare-fun of_48 () Real)
(declare-fun sc_49 () Real)
(assert (> sc_49 1e-08))
(declare-fun of_49 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_44 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_45 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_47 0.))
; 
; =  {sc.vadd[5].A} {(1.*sc.vadd[5].B)}
(assert (= sc_46 (* 1. sc_47)))
; 
; =  {sc.vadd[5].A} {(1.*sc.vadd[5].C)} {(1.*sc.vadd[5].D)}
(assert (and (= sc_46 (* 1. sc_45)) (= sc_46 (* 1. sc_44))))
; no offset
(assert (= (- (+ of_46 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[5].OUT} {(sc.vadd[5].A*1.)}
(assert (= sc_48 (* sc_46 1.)))
; 
; =  {of.vadd[5].OUT} {0.}
(assert (= of_48 0.))
; no scale
(assert (= sc_44 1.))
; no scale
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_44 0.))
; no offset
(assert (= of_49 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_45 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_47 0.))
; 
; =  {sc.vadd[5].A} {(1.*sc.vadd[5].B)}
(assert (= sc_46 (* 1. sc_47)))
; 
; =  {sc.vadd[5].A} {(1.*sc.vadd[5].C)} {(1.*sc.vadd[5].D*sc.vadd[5].OUT2)}
(assert (and (= sc_46 (* 1. sc_45)) (= sc_46 (* (* 1. sc_44) sc_49))))
; no offset
(assert (= (- (+ of_46 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[5].OUT2} {(sc.vadd[5].A*1.)}
(assert (= sc_49 (* sc_46 1.)))
; no offset
(assert (= of_49 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[5].OUT2_0} {(sc.vadd[5].A*1.)}
(assert (= sc_43 (* sc_46 1.)))
; 
; =  {of.vadd[5].OUT2_0} {0.}
(assert (= of_43 0.))
; 
; >=  {((sc.vadd[5].OUT2_0*0.35)+of.vadd[5].OUT2_0)} {3300.}
(assert (<= (+ (* sc_43 0.35) of_43) 3300.))
; 
; <=  {((sc.vadd[5].OUT2_0*0.35)+of.vadd[5].OUT2_0)} {0.}
(assert (>= (+ (* sc_43 0.35) of_43) 0.))
; 
; >=  {((sc.vadd[5].D*0.004)+of.vadd[5].D)} {3300.}
(assert (<= (+ (* sc_44 0.004) of_44) 3300.))
; 
; <=  {((sc.vadd[5].D*0.004)+of.vadd[5].D)} {0.}
(assert (>= (+ (* sc_44 0.004) of_44) 0.))
; 
; >=  {((sc.vadd[5].C*0.)+of.vadd[5].C)} {3300.}
(assert (<= (+ (* sc_45 0.) of_45) 3300.))
; 
; <=  {((sc.vadd[5].C*0.)+of.vadd[5].C)} {0.}
(assert (>= (+ (* sc_45 0.) of_45) 0.))
; 
; >=  {((sc.vadd[5].A*0.)+of.vadd[5].A)} {3300.}
(assert (<= (+ (* sc_46 0.) of_46) 3300.))
; 
; <=  {((sc.vadd[5].A*0.)+of.vadd[5].A)} {0.}
(assert (>= (+ (* sc_46 0.) of_46) 0.))
(declare-fun slbot_49 () Real)
(declare-fun sltop_49 () Real)
; 
; =  {(((sc.vadd[5].OUT2*0.)+of.vadd[5].OUT2)+sl.min.vadd[5].OUT2)} {0.}
(assert (= (+ (+ (* sc_49 0.) of_49) slbot_49) 0.))
; 
; =  {(((sc.vadd[5].OUT2*15.6)+of.vadd[5].OUT2)+sl.max.vadd[5].OUT2)} {3300.}
(assert (= (+ (+ (* sc_49 15.6) of_49) sltop_49) 3300.))
(declare-fun slbot_47 () Real)
(declare-fun sltop_47 () Real)
; 
; =  {(((sc.vadd[5].B*0.000362037485643)+of.vadd[5].B)+sl.min.vadd[5].B)} {0.}
(assert (= (+ (+ (* sc_47 0.000362037485643) of_47) slbot_47) 0.))
; 
; =  {(((sc.vadd[5].B*3535.53390593)+of.vadd[5].B)+sl.max.vadd[5].B)} {3300.}
(assert (= (+ (+ (* sc_47 3535.53390593) of_47) sltop_47) 3300.))
(declare-fun slbot_48 () Real)
(declare-fun sltop_48 () Real)
; 
; =  {(((sc.vadd[5].OUT*0.000362037485643)+of.vadd[5].OUT)+sl.min.vadd[5].OUT)} {-1650.}
(assert (= (+ (+ (* sc_48 0.000362037485643) of_48) slbot_48) -1650.))
; 
; =  {(((sc.vadd[5].OUT*3535.53390593)+of.vadd[5].OUT)+sl.max.vadd[5].OUT)} {1650.}
(assert (= (+ (+ (* sc_48 3535.53390593) of_48) sltop_48) 1650.))
(declare-fun slbot_49 () Real)
(declare-fun sltop_49 () Real)
; 
; =  {(((sc.vadd[5].OUT2*0.)+of.vadd[5].OUT2)+sl.min.vadd[5].OUT2)} {0.}
(assert (= (+ (+ (* sc_49 0.) of_49) slbot_49) 0.))
; 
; =  {(((sc.vadd[5].OUT2*15.6)+of.vadd[5].OUT2)+sl.max.vadd[5].OUT2)} {3300.}
(assert (= (+ (+ (* sc_49 15.6) of_49) sltop_49) 3300.))
(declare-fun sc_50 () Real)
(assert (> sc_50 1e-08))
(declare-fun of_50 () Real)
(declare-fun sc_51 () Real)
(assert (> sc_51 1e-08))
(declare-fun of_51 () Real)
(declare-fun sc_52 () Real)
(assert (> sc_52 1e-08))
(declare-fun of_52 () Real)
(declare-fun sc_53 () Real)
(assert (> sc_53 1e-08))
(declare-fun of_53 () Real)
(declare-fun sc_54 () Real)
(assert (> sc_54 1e-08))
(declare-fun of_54 () Real)
(declare-fun sc_55 () Real)
(assert (> sc_55 1e-08))
(declare-fun of_55 () Real)
(declare-fun sc_56 () Real)
(assert (> sc_56 1e-08))
(declare-fun of_56 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_51 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_52 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_54 0.))
; 
; =  {sc.vadd[1].A} {(1.*sc.vadd[1].B)}
(assert (= sc_53 (* 1. sc_54)))
; 
; =  {sc.vadd[1].A} {(1.*sc.vadd[1].C)} {(1.*sc.vadd[1].D)}
(assert (and (= sc_53 (* 1. sc_52)) (= sc_53 (* 1. sc_51))))
; no offset
(assert (= (- (+ of_53 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[1].OUT} {(sc.vadd[1].A*1.)}
(assert (= sc_55 (* sc_53 1.)))
; 
; =  {of.vadd[1].OUT} {0.}
(assert (= of_55 0.))
; no scale
(assert (= sc_51 1.))
; no scale
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_51 0.))
; no offset
(assert (= of_56 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_52 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_54 0.))
; 
; =  {sc.vadd[1].A} {(1.*sc.vadd[1].B)}
(assert (= sc_53 (* 1. sc_54)))
; 
; =  {sc.vadd[1].A} {(1.*sc.vadd[1].C)} {(1.*sc.vadd[1].D*sc.vadd[1].OUT2)}
(assert (and (= sc_53 (* 1. sc_52)) (= sc_53 (* (* 1. sc_51) sc_56))))
; no offset
(assert (= (- (+ of_53 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[1].OUT2} {(sc.vadd[1].A*1.)}
(assert (= sc_56 (* sc_53 1.)))
; no offset
(assert (= of_56 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[1].OUT2_0} {(sc.vadd[1].A*1.)}
(assert (= sc_50 (* sc_53 1.)))
; 
; =  {of.vadd[1].OUT2_0} {0.}
(assert (= of_50 0.))
; 
; >=  {((sc.vadd[1].OUT2_0*0.5)+of.vadd[1].OUT2_0)} {3300.}
(assert (<= (+ (* sc_50 0.5) of_50) 3300.))
; 
; <=  {((sc.vadd[1].OUT2_0*0.5)+of.vadd[1].OUT2_0)} {0.}
(assert (>= (+ (* sc_50 0.5) of_50) 0.))
; 
; >=  {((sc.vadd[1].D*0.004)+of.vadd[1].D)} {3300.}
(assert (<= (+ (* sc_51 0.004) of_51) 3300.))
; 
; <=  {((sc.vadd[1].D*0.004)+of.vadd[1].D)} {0.}
(assert (>= (+ (* sc_51 0.004) of_51) 0.))
; 
; >=  {((sc.vadd[1].C*0.)+of.vadd[1].C)} {3300.}
(assert (<= (+ (* sc_52 0.) of_52) 3300.))
; 
; <=  {((sc.vadd[1].C*0.)+of.vadd[1].C)} {0.}
(assert (>= (+ (* sc_52 0.) of_52) 0.))
; 
; >=  {((sc.vadd[1].A*0.)+of.vadd[1].A)} {3300.}
(assert (<= (+ (* sc_53 0.) of_53) 3300.))
; 
; <=  {((sc.vadd[1].A*0.)+of.vadd[1].A)} {0.}
(assert (>= (+ (* sc_53 0.) of_53) 0.))
(declare-fun slbot_56 () Real)
(declare-fun sltop_56 () Real)
; 
; =  {(((sc.vadd[1].OUT2*0.)+of.vadd[1].OUT2)+sl.min.vadd[1].OUT2)} {0.}
(assert (= (+ (+ (* sc_56 0.) of_56) slbot_56) 0.))
; 
; =  {(((sc.vadd[1].OUT2*156.25)+of.vadd[1].OUT2)+sl.max.vadd[1].OUT2)} {3300.}
(assert (= (+ (+ (* sc_56 156.25) of_56) sltop_56) 3300.))
(declare-fun slbot_54 () Real)
(declare-fun sltop_54 () Real)
; 
; =  {(((sc.vadd[1].B*1.87951807229)+of.vadd[1].B)+sl.min.vadd[1].B)} {0.}
(assert (= (+ (+ (* sc_54 1.87951807229) of_54) slbot_54) 0.))
; 
; =  {(((sc.vadd[1].B*124.8)+of.vadd[1].B)+sl.max.vadd[1].B)} {3300.}
(assert (= (+ (+ (* sc_54 124.8) of_54) sltop_54) 3300.))
(declare-fun slbot_55 () Real)
(declare-fun sltop_55 () Real)
; 
; =  {(((sc.vadd[1].OUT*1.87951807229)+of.vadd[1].OUT)+sl.min.vadd[1].OUT)} {-1650.}
(assert (= (+ (+ (* sc_55 1.87951807229) of_55) slbot_55) -1650.))
; 
; =  {(((sc.vadd[1].OUT*124.8)+of.vadd[1].OUT)+sl.max.vadd[1].OUT)} {1650.}
(assert (= (+ (+ (* sc_55 124.8) of_55) sltop_55) 1650.))
(declare-fun slbot_56 () Real)
(declare-fun sltop_56 () Real)
; 
; =  {(((sc.vadd[1].OUT2*0.)+of.vadd[1].OUT2)+sl.min.vadd[1].OUT2)} {0.}
(assert (= (+ (+ (* sc_56 0.) of_56) slbot_56) 0.))
; 
; =  {(((sc.vadd[1].OUT2*156.25)+of.vadd[1].OUT2)+sl.max.vadd[1].OUT2)} {3300.}
(assert (= (+ (+ (* sc_56 156.25) of_56) sltop_56) 3300.))
(declare-fun sc_57 () Real)
(assert (> sc_57 1e-08))
(declare-fun of_57 () Real)
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
; no offset
(assert (= of_58 0.))
; no offset
(assert (= of_59 0.))
; no scale
(assert (= (/ sc_58 sc_59) 1.))
; no scale
(assert (= sc_57 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_57 0.))
; no offset
(assert (= of_58 0.))
; no offset
(assert (= of_59 0.))
; no scale
(assert (= (/ sc_58 sc_59) 1.))
; no scale
(assert (= sc_57 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_57 0.))
; 
; =  {1.} {1.}
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_60 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.ihill[2].STIM} {(sc.ihill[2].Vmax*(1./1.))}
(assert (= sc_61 (* sc_60 (/ 1. 1.))))
; 
; =  {of.ihill[2].STIM} {0.}
(assert (= of_61 0.))
; no scale
(assert (= sc_59 1.))
; no scale
(assert (= sc_57 1.))
; no offset
(assert (= of_59 0.))
; no offset
(assert (= of_57 0.))
; no scale
(assert (= sc_59 1.))
; no scale
(assert (= sc_57 1.))
; no offset
(assert (= of_59 0.))
; no offset
(assert (= of_57 0.))
; no scale
(assert (= sc_58 1.))
; no scale
(assert (= sc_57 1.))
; no offset
(assert (= of_58 0.))
; no offset
(assert (= of_57 0.))
; 
; =  {1.} {1.}
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_60 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.ihill[2].REP} {(sc.ihill[2].Vmax*(1./1.))}
(assert (= sc_62 (* sc_60 (/ 1. 1.))))
; 
; =  {of.ihill[2].REP} {0.}
(assert (= of_62 0.))
; 
; >=  {((sc.ihill[2].n*2.5)+of.ihill[2].n)} {5.}
(assert (<= (+ (* sc_57 2.5) of_57) 5.))
; 
; <=  {((sc.ihill[2].n*2.5)+of.ihill[2].n)} {1.}
(assert (>= (+ (* sc_57 2.5) of_57) 1.))
(declare-fun slbot_58 () Real)
(declare-fun sltop_58 () Real)
; 
; =  {(((sc.ihill[2].S*0.)+of.ihill[2].S)+sl.min.ihill[2].S)} {1.}
(assert (= (+ (+ (* sc_58 0.) of_58) slbot_58) 1.))
; 
; =  {(((sc.ihill[2].S*156.25)+of.ihill[2].S)+sl.max.ihill[2].S)} {10.}
(assert (= (+ (+ (* sc_58 156.25) of_58) sltop_58) 10.))
(declare-fun slbot_62 () Real)
(declare-fun sltop_62 () Real)
; 
; =  {(((sc.ihill[2].REP*9.05093714108e-05)+of.ihill[2].REP)+sl.min.ihill[2].REP)} {5e-10}
(assert (= (+ (+ (* sc_62 9.05093714108e-05) of_62) slbot_62) 5e-10))
; 
; =  {(((sc.ihill[2].REP*883.883476483)+of.ihill[2].REP)+sl.max.ihill[2].REP)} {500000.}
(assert (= (+ (+ (* sc_62 883.883476483) of_62) sltop_62) 500000.))
(declare-fun slbot_59 () Real)
(declare-fun sltop_59 () Real)
; 
; =  {(((sc.ihill[2].Km*0.5)+of.ihill[2].Km)+sl.min.ihill[2].Km)} {1.}
(assert (= (+ (+ (* sc_59 0.5) of_59) slbot_59) 1.))
; 
; =  {(((sc.ihill[2].Km*1.)+of.ihill[2].Km)+sl.max.ihill[2].Km)} {10.}
(assert (= (+ (+ (* sc_59 1.) of_59) sltop_59) 10.))
; 
; >=  {((sc.ihill[2].Vmax*156.25)+of.ihill[2].Vmax)} {10.}
(assert (<= (+ (* sc_60 156.25) of_60) 10.))
; 
; <=  {((sc.ihill[2].Vmax*156.25)+of.ihill[2].Vmax)} {0.0001}
(assert (>= (+ (* sc_60 156.25) of_60) 0.0001))
(declare-fun slbot_61 () Real)
(declare-fun sltop_61 () Real)
; 
; =  {(((sc.ihill[2].STIM*1.)+of.ihill[2].STIM)+sl.min.ihill[2].STIM)} {9.999900001e-15}
(assert (= (+ (+ (* sc_61 1.) of_61) slbot_61) 9.999900001e-15))
; 
; =  {(((sc.ihill[2].STIM*5.65685424949)+of.ihill[2].STIM)+sl.max.ihill[2].STIM)} {999990.0001}
(assert (= (+ (+ (* sc_61 5.65685424949) of_61) sltop_61) 999990.0001))
(declare-fun slbot_62 () Real)
(declare-fun sltop_62 () Real)
; 
; =  {(((sc.ihill[2].REP*9.05093714108e-05)+of.ihill[2].REP)+sl.min.ihill[2].REP)} {5e-10}
(assert (= (+ (+ (* sc_62 9.05093714108e-05) of_62) slbot_62) 5e-10))
; 
; =  {(((sc.ihill[2].REP*883.883476483)+of.ihill[2].REP)+sl.max.ihill[2].REP)} {500000.}
(assert (= (+ (+ (* sc_62 883.883476483) of_62) sltop_62) 500000.))
(declare-fun sc_63 () Real)
(assert (> sc_63 1e-08))
(declare-fun of_63 () Real)
(declare-fun sc_64 () Real)
(assert (> sc_64 1e-08))
(declare-fun of_64 () Real)
(declare-fun sc_65 () Real)
(assert (> sc_65 1e-08))
(declare-fun of_65 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_64 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_63 0.))
; 
; =  {sc.vtoi[0].Y} {((1./sc.vtoi[0].K)*sc.vtoi[0].X)}
(assert (= sc_65 (* (/ 1. sc_64) sc_63)))
; 
; =  {of.vtoi[0].Y} {0.}
(assert (= of_65 0.))
(declare-fun slbot_63 () Real)
(declare-fun sltop_63 () Real)
; 
; =  {(((sc.vtoi[0].X*0.)+of.vtoi[0].X)+sl.min.vtoi[0].X)} {1.}
(assert (= (+ (+ (* sc_63 0.) of_63) slbot_63) 1.))
; 
; =  {(((sc.vtoi[0].X*156.25)+of.vtoi[0].X)+sl.max.vtoi[0].X)} {3300.}
(assert (= (+ (+ (* sc_63 156.25) of_63) sltop_63) 3300.))
; 
; >=  {((sc.vtoi[0].K*1.)+of.vtoi[0].K)} {3300.}
(assert (<= (+ (* sc_64 1.) of_64) 3300.))
; 
; <=  {((sc.vtoi[0].K*1.)+of.vtoi[0].K)} {1.}
(assert (>= (+ (* sc_64 1.) of_64) 1.))
(declare-fun slbot_65 () Real)
(declare-fun sltop_65 () Real)
; 
; =  {(((sc.vtoi[0].Y*0.)+of.vtoi[0].Y)+sl.min.vtoi[0].Y)} {0.00030303030303}
(assert (= (+ (+ (* sc_65 0.) of_65) slbot_65) 0.00030303030303))
; 
; =  {(((sc.vtoi[0].Y*156.25)+of.vtoi[0].Y)+sl.max.vtoi[0].Y)} {3300.}
(assert (= (+ (+ (* sc_65 156.25) of_65) sltop_65) 3300.))
(declare-fun sc_66 () Real)
(assert (> sc_66 1e-08))
(declare-fun of_66 () Real)
(declare-fun sc_67 () Real)
(assert (> sc_67 1e-08))
(declare-fun of_67 () Real)
; 
; =  {sc.input.V[2].O} {sc.input.V[2].X}
(assert (= sc_67 sc_66))
; 
; =  {of.input.V[2].O} {of.input.V[2].X}
(assert (= of_67 of_66))
; 
; >=  {((sc.input.V[2].X*2.0015)+of.input.V[2].X)} {3300.}
(assert (<= (+ (* sc_66 2.0015) of_66) 3300.))
; 
; <=  {((sc.input.V[2].X*2.0015)+of.input.V[2].X)} {0.}
(assert (>= (+ (* sc_66 2.0015) of_66) 0.))
; 
; >=  {((sc.input.V[2].O*2.0015)+of.input.V[2].O)} {3300.}
(assert (<= (+ (* sc_67 2.0015) of_67) 3300.))
; 
; <=  {((sc.input.V[2].O*2.0015)+of.input.V[2].O)} {0.}
(assert (>= (+ (* sc_67 2.0015) of_67) 0.))
(declare-fun sc_68 () Real)
(assert (> sc_68 1e-08))
(declare-fun of_68 () Real)
(declare-fun sc_69 () Real)
(assert (> sc_69 1e-08))
(declare-fun of_69 () Real)
; 
; =  {sc.input.V[8].O} {sc.input.V[8].X}
(assert (= sc_69 sc_68))
; 
; =  {of.input.V[8].O} {of.input.V[8].X}
(assert (= of_69 of_68))
; 
; >=  {((sc.input.V[8].X*0.)+of.input.V[8].X)} {3300.}
(assert (<= (+ (* sc_68 0.) of_68) 3300.))
; 
; <=  {((sc.input.V[8].X*0.)+of.input.V[8].X)} {0.}
(assert (>= (+ (* sc_68 0.) of_68) 0.))
; 
; >=  {((sc.input.V[8].O*0.)+of.input.V[8].O)} {3300.}
(assert (<= (+ (* sc_69 0.) of_69) 3300.))
; 
; <=  {((sc.input.V[8].O*0.)+of.input.V[8].O)} {0.}
(assert (>= (+ (* sc_69 0.) of_69) 0.))
(declare-fun sc_70 () Real)
(assert (> sc_70 1e-08))
(declare-fun of_70 () Real)
(declare-fun sc_71 () Real)
(assert (> sc_71 1e-08))
(declare-fun of_71 () Real)
; 
; =  {sc.input.V[7].O} {sc.input.V[7].X}
(assert (= sc_71 sc_70))
; 
; =  {of.input.V[7].O} {of.input.V[7].X}
(assert (= of_71 of_70))
; 
; >=  {((sc.input.V[7].X*0.)+of.input.V[7].X)} {3300.}
(assert (<= (+ (* sc_70 0.) of_70) 3300.))
; 
; <=  {((sc.input.V[7].X*0.)+of.input.V[7].X)} {0.}
(assert (>= (+ (* sc_70 0.) of_70) 0.))
; 
; >=  {((sc.input.V[7].O*0.)+of.input.V[7].O)} {3300.}
(assert (<= (+ (* sc_71 0.) of_71) 3300.))
; 
; <=  {((sc.input.V[7].O*0.)+of.input.V[7].O)} {0.}
(assert (>= (+ (* sc_71 0.) of_71) 0.))
(declare-fun sc_72 () Real)
(assert (> sc_72 1e-08))
(declare-fun of_72 () Real)
(declare-fun sc_73 () Real)
(assert (> sc_73 1e-08))
(declare-fun of_73 () Real)
; 
; =  {sc.input.V[13].O} {sc.input.V[13].X}
(assert (= sc_73 sc_72))
; 
; =  {of.input.V[13].O} {of.input.V[13].X}
(assert (= of_73 of_72))
; 
; >=  {((sc.input.V[13].X*0.004)+of.input.V[13].X)} {3300.}
(assert (<= (+ (* sc_72 0.004) of_72) 3300.))
; 
; <=  {((sc.input.V[13].X*0.004)+of.input.V[13].X)} {0.}
(assert (>= (+ (* sc_72 0.004) of_72) 0.))
; 
; >=  {((sc.input.V[13].O*0.004)+of.input.V[13].O)} {3300.}
(assert (<= (+ (* sc_73 0.004) of_73) 3300.))
; 
; <=  {((sc.input.V[13].O*0.004)+of.input.V[13].O)} {0.}
(assert (>= (+ (* sc_73 0.004) of_73) 0.))
(declare-fun sc_74 () Real)
(assert (> sc_74 1e-08))
(declare-fun of_74 () Real)
(declare-fun sc_75 () Real)
(assert (> sc_75 1e-08))
(declare-fun of_75 () Real)
; 
; =  {sc.input.V[12].O} {sc.input.V[12].X}
(assert (= sc_75 sc_74))
; 
; =  {of.input.V[12].O} {of.input.V[12].X}
(assert (= of_75 of_74))
; 
; >=  {((sc.input.V[12].X*0.004)+of.input.V[12].X)} {3300.}
(assert (<= (+ (* sc_74 0.004) of_74) 3300.))
; 
; <=  {((sc.input.V[12].X*0.004)+of.input.V[12].X)} {0.}
(assert (>= (+ (* sc_74 0.004) of_74) 0.))
; 
; >=  {((sc.input.V[12].O*0.004)+of.input.V[12].O)} {3300.}
(assert (<= (+ (* sc_75 0.004) of_75) 3300.))
; 
; <=  {((sc.input.V[12].O*0.004)+of.input.V[12].O)} {0.}
(assert (>= (+ (* sc_75 0.004) of_75) 0.))
(declare-fun sc_76 () Real)
(assert (> sc_76 1e-08))
(declare-fun of_76 () Real)
(declare-fun sc_77 () Real)
(assert (> sc_77 1e-08))
(declare-fun of_77 () Real)
; 
; =  {sc.input.V[9].O} {sc.input.V[9].X}
(assert (= sc_77 sc_76))
; 
; =  {of.input.V[9].O} {of.input.V[9].X}
(assert (= of_77 of_76))
; 
; >=  {((sc.input.V[9].X*0.)+of.input.V[9].X)} {3300.}
(assert (<= (+ (* sc_76 0.) of_76) 3300.))
; 
; <=  {((sc.input.V[9].X*0.)+of.input.V[9].X)} {0.}
(assert (>= (+ (* sc_76 0.) of_76) 0.))
; 
; >=  {((sc.input.V[9].O*0.)+of.input.V[9].O)} {3300.}
(assert (<= (+ (* sc_77 0.) of_77) 3300.))
; 
; <=  {((sc.input.V[9].O*0.)+of.input.V[9].O)} {0.}
(assert (>= (+ (* sc_77 0.) of_77) 0.))
(declare-fun sc_78 () Real)
(assert (> sc_78 1e-08))
(declare-fun of_78 () Real)
(declare-fun sc_79 () Real)
(assert (> sc_79 1e-08))
(declare-fun of_79 () Real)
; 
; =  {sc.input.V[0].O} {sc.input.V[0].X}
(assert (= sc_79 sc_78))
; 
; =  {of.input.V[0].O} {of.input.V[0].X}
(assert (= of_79 of_78))
(declare-fun slbot_78 () Real)
(declare-fun sltop_78 () Real)
; 
; =  {(((sc.input.V[0].X*0.5)+of.input.V[0].X)+sl.min.input.V[0].X)} {0.}
(assert (= (+ (+ (* sc_78 0.5) of_78) slbot_78) 0.))
; 
; =  {(((sc.input.V[0].X*1.)+of.input.V[0].X)+sl.max.input.V[0].X)} {3300.}
(assert (= (+ (+ (* sc_78 1.) of_78) sltop_78) 3300.))
(declare-fun slbot_79 () Real)
(declare-fun sltop_79 () Real)
; 
; =  {(((sc.input.V[0].O*0.5)+of.input.V[0].O)+sl.min.input.V[0].O)} {0.}
(assert (= (+ (+ (* sc_79 0.5) of_79) slbot_79) 0.))
; 
; =  {(((sc.input.V[0].O*1.)+of.input.V[0].O)+sl.max.input.V[0].O)} {3300.}
(assert (= (+ (+ (* sc_79 1.) of_79) sltop_79) 3300.))
(declare-fun sc_80 () Real)
(assert (> sc_80 1e-08))
(declare-fun of_80 () Real)
(declare-fun sc_81 () Real)
(assert (> sc_81 1e-08))
(declare-fun of_81 () Real)
; 
; =  {sc.input.V[11].O} {sc.input.V[11].X}
(assert (= sc_81 sc_80))
; 
; =  {of.input.V[11].O} {of.input.V[11].X}
(assert (= of_81 of_80))
; 
; >=  {((sc.input.V[11].X*0.35)+of.input.V[11].X)} {3300.}
(assert (<= (+ (* sc_80 0.35) of_80) 3300.))
; 
; <=  {((sc.input.V[11].X*0.35)+of.input.V[11].X)} {0.}
(assert (>= (+ (* sc_80 0.35) of_80) 0.))
; 
; >=  {((sc.input.V[11].O*0.35)+of.input.V[11].O)} {3300.}
(assert (<= (+ (* sc_81 0.35) of_81) 3300.))
; 
; <=  {((sc.input.V[11].O*0.35)+of.input.V[11].O)} {0.}
(assert (>= (+ (* sc_81 0.35) of_81) 0.))
(declare-fun sc_82 () Real)
(assert (> sc_82 1e-08))
(declare-fun of_82 () Real)
(declare-fun sc_83 () Real)
(assert (> sc_83 1e-08))
(declare-fun of_83 () Real)
; 
; =  {sc.input.V[10].O} {sc.input.V[10].X}
(assert (= sc_83 sc_82))
; 
; =  {of.input.V[10].O} {of.input.V[10].X}
(assert (= of_83 of_82))
; 
; >=  {((sc.input.V[10].X*0.5)+of.input.V[10].X)} {3300.}
(assert (<= (+ (* sc_82 0.5) of_82) 3300.))
; 
; <=  {((sc.input.V[10].X*0.5)+of.input.V[10].X)} {0.}
(assert (>= (+ (* sc_82 0.5) of_82) 0.))
; 
; >=  {((sc.input.V[10].O*0.5)+of.input.V[10].O)} {3300.}
(assert (<= (+ (* sc_83 0.5) of_83) 3300.))
; 
; <=  {((sc.input.V[10].O*0.5)+of.input.V[10].O)} {0.}
(assert (>= (+ (* sc_83 0.5) of_83) 0.))
(declare-fun sc_84 () Real)
(assert (> sc_84 1e-08))
(declare-fun of_84 () Real)
(declare-fun sc_85 () Real)
(assert (> sc_85 1e-08))
(declare-fun of_85 () Real)
; 
; =  {sc.input.V[15].O} {sc.input.V[15].X}
(assert (= sc_85 sc_84))
; 
; =  {of.input.V[15].O} {of.input.V[15].X}
(assert (= of_85 of_84))
; 
; >=  {((sc.input.V[15].X*1.)+of.input.V[15].X)} {3300.}
(assert (<= (+ (* sc_84 1.) of_84) 3300.))
; 
; <=  {((sc.input.V[15].X*1.)+of.input.V[15].X)} {0.}
(assert (>= (+ (* sc_84 1.) of_84) 0.))
; 
; >=  {((sc.input.V[15].O*1.)+of.input.V[15].O)} {3300.}
(assert (<= (+ (* sc_85 1.) of_85) 3300.))
; 
; <=  {((sc.input.V[15].O*1.)+of.input.V[15].O)} {0.}
(assert (>= (+ (* sc_85 1.) of_85) 0.))
(declare-fun sc_86 () Real)
(assert (> sc_86 1e-08))
(declare-fun of_86 () Real)
(declare-fun sc_87 () Real)
(assert (> sc_87 1e-08))
(declare-fun of_87 () Real)
; 
; =  {sc.input.V[6].O} {sc.input.V[6].X}
(assert (= sc_87 sc_86))
; 
; =  {of.input.V[6].O} {of.input.V[6].X}
(assert (= of_87 of_86))
; 
; >=  {((sc.input.V[6].X*0.)+of.input.V[6].X)} {3300.}
(assert (<= (+ (* sc_86 0.) of_86) 3300.))
; 
; <=  {((sc.input.V[6].X*0.)+of.input.V[6].X)} {0.}
(assert (>= (+ (* sc_86 0.) of_86) 0.))
; 
; >=  {((sc.input.V[6].O*0.)+of.input.V[6].O)} {3300.}
(assert (<= (+ (* sc_87 0.) of_87) 3300.))
; 
; <=  {((sc.input.V[6].O*0.)+of.input.V[6].O)} {0.}
(assert (>= (+ (* sc_87 0.) of_87) 0.))
(declare-fun sc_88 () Real)
(assert (> sc_88 1e-08))
(declare-fun of_88 () Real)
(declare-fun sc_89 () Real)
(assert (> sc_89 1e-08))
(declare-fun of_89 () Real)
; 
; =  {sc.input.V[14].O} {sc.input.V[14].X}
(assert (= sc_89 sc_88))
; 
; =  {of.input.V[14].O} {of.input.V[14].X}
(assert (= of_89 of_88))
; 
; >=  {((sc.input.V[14].X*1.)+of.input.V[14].X)} {3300.}
(assert (<= (+ (* sc_88 1.) of_88) 3300.))
; 
; <=  {((sc.input.V[14].X*1.)+of.input.V[14].X)} {0.}
(assert (>= (+ (* sc_88 1.) of_88) 0.))
; 
; >=  {((sc.input.V[14].O*1.)+of.input.V[14].O)} {3300.}
(assert (<= (+ (* sc_89 1.) of_89) 3300.))
; 
; <=  {((sc.input.V[14].O*1.)+of.input.V[14].O)} {0.}
(assert (>= (+ (* sc_89 1.) of_89) 0.))
(declare-fun sc_90 () Real)
(assert (> sc_90 1e-08))
(declare-fun of_90 () Real)
(declare-fun sc_91 () Real)
(assert (> sc_91 1e-08))
(declare-fun of_91 () Real)
; 
; =  {sc.input.V[16].O} {sc.input.V[16].X}
(assert (= sc_91 sc_90))
; 
; =  {of.input.V[16].O} {of.input.V[16].X}
(assert (= of_91 of_90))
; 
; >=  {((sc.input.V[16].X*1.)+of.input.V[16].X)} {3300.}
(assert (<= (+ (* sc_90 1.) of_90) 3300.))
; 
; <=  {((sc.input.V[16].X*1.)+of.input.V[16].X)} {0.}
(assert (>= (+ (* sc_90 1.) of_90) 0.))
; 
; >=  {((sc.input.V[16].O*1.)+of.input.V[16].O)} {3300.}
(assert (<= (+ (* sc_91 1.) of_91) 3300.))
; 
; <=  {((sc.input.V[16].O*1.)+of.input.V[16].O)} {0.}
(assert (>= (+ (* sc_91 1.) of_91) 0.))
(declare-fun sc_92 () Real)
(assert (> sc_92 1e-08))
(declare-fun of_92 () Real)
(declare-fun sc_93 () Real)
(assert (> sc_93 1e-08))
(declare-fun of_93 () Real)
; 
; =  {sc.input.V[3].O} {sc.input.V[3].X}
(assert (= sc_93 sc_92))
; 
; =  {of.input.V[3].O} {of.input.V[3].X}
(assert (= of_93 of_92))
; 
; >=  {((sc.input.V[3].X*2.5)+of.input.V[3].X)} {3300.}
(assert (<= (+ (* sc_92 2.5) of_92) 3300.))
; 
; <=  {((sc.input.V[3].X*2.5)+of.input.V[3].X)} {0.}
(assert (>= (+ (* sc_92 2.5) of_92) 0.))
; 
; >=  {((sc.input.V[3].O*2.5)+of.input.V[3].O)} {3300.}
(assert (<= (+ (* sc_93 2.5) of_93) 3300.))
; 
; <=  {((sc.input.V[3].O*2.5)+of.input.V[3].O)} {0.}
(assert (>= (+ (* sc_93 2.5) of_93) 0.))
(declare-fun sc_94 () Real)
(assert (> sc_94 1e-08))
(declare-fun of_94 () Real)
(declare-fun sc_95 () Real)
(assert (> sc_95 1e-08))
(declare-fun of_95 () Real)
; 
; =  {sc.input.V[4].O} {sc.input.V[4].X}
(assert (= sc_95 sc_94))
; 
; =  {of.input.V[4].O} {of.input.V[4].X}
(assert (= of_95 of_94))
; 
; >=  {((sc.input.V[4].X*0.125)+of.input.V[4].X)} {3300.}
(assert (<= (+ (* sc_94 0.125) of_94) 3300.))
; 
; <=  {((sc.input.V[4].X*0.125)+of.input.V[4].X)} {0.}
(assert (>= (+ (* sc_94 0.125) of_94) 0.))
; 
; >=  {((sc.input.V[4].O*0.125)+of.input.V[4].O)} {3300.}
(assert (<= (+ (* sc_95 0.125) of_95) 3300.))
; 
; <=  {((sc.input.V[4].O*0.125)+of.input.V[4].O)} {0.}
(assert (>= (+ (* sc_95 0.125) of_95) 0.))
(declare-fun sc_96 () Real)
(assert (> sc_96 1e-08))
(declare-fun of_96 () Real)
(declare-fun sc_97 () Real)
(assert (> sc_97 1e-08))
(declare-fun of_97 () Real)
; 
; =  {sc.input.V[5].O} {sc.input.V[5].X}
(assert (= sc_97 sc_96))
; 
; =  {of.input.V[5].O} {of.input.V[5].X}
(assert (= of_97 of_96))
; 
; >=  {((sc.input.V[5].X*0.125)+of.input.V[5].X)} {3300.}
(assert (<= (+ (* sc_96 0.125) of_96) 3300.))
; 
; <=  {((sc.input.V[5].X*0.125)+of.input.V[5].X)} {0.}
(assert (>= (+ (* sc_96 0.125) of_96) 0.))
; 
; >=  {((sc.input.V[5].O*0.125)+of.input.V[5].O)} {3300.}
(assert (<= (+ (* sc_97 0.125) of_97) 3300.))
; 
; <=  {((sc.input.V[5].O*0.125)+of.input.V[5].O)} {0.}
(assert (>= (+ (* sc_97 0.125) of_97) 0.))
(declare-fun sc_98 () Real)
(assert (> sc_98 1e-08))
(declare-fun of_98 () Real)
(declare-fun sc_99 () Real)
(assert (> sc_99 1e-08))
(declare-fun of_99 () Real)
; 
; =  {sc.input.V[1].O} {sc.input.V[1].X}
(assert (= sc_99 sc_98))
; 
; =  {of.input.V[1].O} {of.input.V[1].X}
(assert (= of_99 of_98))
; 
; >=  {((sc.input.V[1].X*31.2)+of.input.V[1].X)} {3300.}
(assert (<= (+ (* sc_98 31.2) of_98) 3300.))
; 
; <=  {((sc.input.V[1].X*31.2)+of.input.V[1].X)} {0.}
(assert (>= (+ (* sc_98 31.2) of_98) 0.))
; 
; >=  {((sc.input.V[1].O*31.2)+of.input.V[1].O)} {3300.}
(assert (<= (+ (* sc_99 31.2) of_99) 3300.))
; 
; <=  {((sc.input.V[1].O*31.2)+of.input.V[1].O)} {0.}
(assert (>= (+ (* sc_99 31.2) of_99) 0.))
(declare-fun sc_100 () Real)
(assert (> sc_100 1e-08))
(declare-fun of_100 () Real)
(declare-fun sc_101 () Real)
(assert (> sc_101 1e-08))
(declare-fun of_101 () Real)
; 
; =  {sc.input.V[19].O} {sc.input.V[19].X}
(assert (= sc_101 sc_100))
; 
; =  {of.input.V[19].O} {of.input.V[19].X}
(assert (= of_101 of_100))
; 
; >=  {((sc.input.V[19].X*1.)+of.input.V[19].X)} {3300.}
(assert (<= (+ (* sc_100 1.) of_100) 3300.))
; 
; <=  {((sc.input.V[19].X*1.)+of.input.V[19].X)} {0.}
(assert (>= (+ (* sc_100 1.) of_100) 0.))
; 
; >=  {((sc.input.V[19].O*1.)+of.input.V[19].O)} {3300.}
(assert (<= (+ (* sc_101 1.) of_101) 3300.))
; 
; <=  {((sc.input.V[19].O*1.)+of.input.V[19].O)} {0.}
(assert (>= (+ (* sc_101 1.) of_101) 0.))
(declare-fun sc_102 () Real)
(assert (> sc_102 1e-08))
(declare-fun of_102 () Real)
(declare-fun sc_103 () Real)
(assert (> sc_103 1e-08))
(declare-fun of_103 () Real)
(declare-fun sc_104 () Real)
(assert (> sc_104 1e-08))
(declare-fun of_104 () Real)
; no offset
(assert (= of_103 0.))
; no offset
(assert (= of_102 0.))
; 
; =  {sc.itov[8].Y} {(sc.itov[8].K*sc.itov[8].X)}
(assert (= sc_104 (* sc_103 sc_102)))
; 
; =  {of.itov[8].Y} {0.}
(assert (= of_104 0.))
(declare-fun slbot_102 () Real)
(declare-fun sltop_102 () Real)
; 
; =  {(((sc.itov[8].X*0.5)+of.itov[8].X)+sl.min.itov[8].X)} {0.0001}
(assert (= (+ (+ (* sc_102 0.5) of_102) slbot_102) 0.0001))
; 
; =  {(((sc.itov[8].X*16.6)+of.itov[8].X)+sl.max.itov[8].X)} {10.}
(assert (= (+ (+ (* sc_102 16.6) of_102) sltop_102) 10.))
(declare-fun slbot_104 () Real)
(declare-fun sltop_104 () Real)
; 
; =  {(((sc.itov[8].Y*0.5)+of.itov[8].Y)+sl.min.itov[8].Y)} {0.0001}
(assert (= (+ (+ (* sc_104 0.5) of_104) slbot_104) 0.0001))
; 
; =  {(((sc.itov[8].Y*16.6)+of.itov[8].Y)+sl.max.itov[8].Y)} {3300.}
(assert (= (+ (+ (* sc_104 16.6) of_104) sltop_104) 3300.))
; 
; >=  {((sc.itov[8].K*1.)+of.itov[8].K)} {330.}
(assert (<= (+ (* sc_103 1.) of_103) 330.))
; 
; <=  {((sc.itov[8].K*1.)+of.itov[8].K)} {1.}
(assert (>= (+ (* sc_103 1.) of_103) 1.))
(declare-fun slbot_104 () Real)
(declare-fun sltop_104 () Real)
; 
; =  {(((sc.itov[8].Y*0.5)+of.itov[8].Y)+sl.min.itov[8].Y)} {0.0001}
(assert (= (+ (+ (* sc_104 0.5) of_104) slbot_104) 0.0001))
; 
; =  {(((sc.itov[8].Y*16.6)+of.itov[8].Y)+sl.max.itov[8].Y)} {3300.}
(assert (= (+ (+ (* sc_104 16.6) of_104) sltop_104) 3300.))
(declare-fun sc_105 () Real)
(assert (> sc_105 1e-08))
(declare-fun of_105 () Real)
(declare-fun sc_106 () Real)
(assert (> sc_106 1e-08))
(declare-fun of_106 () Real)
(declare-fun sc_107 () Real)
(assert (> sc_107 1e-08))
(declare-fun of_107 () Real)
; no offset
(assert (= of_106 0.))
; no offset
(assert (= of_105 0.))
; 
; =  {sc.itov[9].Y} {(sc.itov[9].K*sc.itov[9].X)}
(assert (= sc_107 (* sc_106 sc_105)))
; 
; =  {of.itov[9].Y} {0.}
(assert (= of_107 0.))
; 
; >=  {((sc.itov[9].X*1.)+of.itov[9].X)} {10.}
(assert (<= (+ (* sc_105 1.) of_105) 10.))
; 
; <=  {((sc.itov[9].X*1.)+of.itov[9].X)} {0.0001}
(assert (>= (+ (* sc_105 1.) of_105) 0.0001))
(declare-fun slbot_106 () Real)
(declare-fun sltop_106 () Real)
; 
; =  {(((sc.itov[9].K*9.05093714108e-05)+of.itov[9].K)+sl.min.itov[9].K)} {1.}
(assert (= (+ (+ (* sc_106 9.05093714108e-05) of_106) slbot_106) 1.))
; 
; =  {(((sc.itov[9].K*883.883476483)+of.itov[9].K)+sl.max.itov[9].K)} {330.}
(assert (= (+ (+ (* sc_106 883.883476483) of_106) sltop_106) 330.))
(declare-fun slbot_107 () Real)
(declare-fun sltop_107 () Real)
; 
; =  {(((sc.itov[9].Y*9.05093714108e-05)+of.itov[9].Y)+sl.min.itov[9].Y)} {0.0001}
(assert (= (+ (+ (* sc_107 9.05093714108e-05) of_107) slbot_107) 0.0001))
; 
; =  {(((sc.itov[9].Y*883.883476483)+of.itov[9].Y)+sl.max.itov[9].Y)} {3300.}
(assert (= (+ (+ (* sc_107 883.883476483) of_107) sltop_107) 3300.))
(declare-fun sc_108 () Real)
(assert (> sc_108 1e-08))
(declare-fun of_108 () Real)
(declare-fun sc_109 () Real)
(assert (> sc_109 1e-08))
(declare-fun of_109 () Real)
(declare-fun sc_110 () Real)
(assert (> sc_110 1e-08))
(declare-fun of_110 () Real)
(declare-fun sc_111 () Real)
(assert (> sc_111 1e-08))
(declare-fun of_111 () Real)
(declare-fun sc_112 () Real)
(assert (> sc_112 1e-08))
(declare-fun of_112 () Real)
; 
; =  {sc.iadd[9].A} {sc.iadd[9].B}
(assert (= sc_110 sc_111))
; 
; =  {sc.iadd[9].A} {sc.iadd[9].C} {sc.iadd[9].D}
(assert (and (= sc_110 sc_109) (= sc_110 sc_108)))
; 
; =  {sc.iadd[9].OUT} {sc.iadd[9].A}
(assert (= sc_112 sc_110))
; 
; =  {of.iadd[9].OUT} {((of.iadd[9].A+of.iadd[9].B)-of.iadd[9].C-of.iadd[9].D)}
(assert (= of_112 (- (+ of_110 of_111) (+ of_109 of_108))))
(declare-fun slbot_108 () Real)
(declare-fun sltop_108 () Real)
; 
; =  {(((sc.iadd[9].D*-15.6)+of.iadd[9].D)+sl.min.iadd[9].D)} {0.}
(assert (= (+ (+ (* sc_108 -15.6) of_108) slbot_108) 0.))
; 
; =  {(((sc.iadd[9].D*0.)+of.iadd[9].D)+sl.max.iadd[9].D)} {5.}
(assert (= (+ (+ (* sc_108 0.) of_108) sltop_108) 5.))
; 
; >=  {((sc.iadd[9].C*0.)+of.iadd[9].C)} {5.}
(assert (<= (+ (* sc_109 0.) of_109) 5.))
; 
; <=  {((sc.iadd[9].C*0.)+of.iadd[9].C)} {0.}
(assert (>= (+ (* sc_109 0.) of_109) 0.))
(declare-fun slbot_112 () Real)
(declare-fun sltop_112 () Real)
; 
; =  {(((sc.iadd[9].OUT*0.5)+of.iadd[9].OUT)+sl.min.iadd[9].OUT)} {-10.}
(assert (= (+ (+ (* sc_112 0.5) of_112) slbot_112) -10.))
; 
; =  {(((sc.iadd[9].OUT*16.6)+of.iadd[9].OUT)+sl.max.iadd[9].OUT)} {10.}
(assert (= (+ (+ (* sc_112 16.6) of_112) sltop_112) 10.))
; 
; >=  {((sc.iadd[9].A*0.)+of.iadd[9].A)} {5.}
(assert (<= (+ (* sc_110 0.) of_110) 5.))
; 
; <=  {((sc.iadd[9].A*0.)+of.iadd[9].A)} {0.}
(assert (>= (+ (* sc_110 0.) of_110) 0.))
(declare-fun slbot_111 () Real)
(declare-fun sltop_111 () Real)
; 
; =  {(((sc.iadd[9].B*0.5)+of.iadd[9].B)+sl.min.iadd[9].B)} {0.}
(assert (= (+ (+ (* sc_111 0.5) of_111) slbot_111) 0.))
; 
; =  {(((sc.iadd[9].B*1.)+of.iadd[9].B)+sl.max.iadd[9].B)} {5.}
(assert (= (+ (+ (* sc_111 1.) of_111) sltop_111) 5.))
(declare-fun slbot_112 () Real)
(declare-fun sltop_112 () Real)
; 
; =  {(((sc.iadd[9].OUT*0.5)+of.iadd[9].OUT)+sl.min.iadd[9].OUT)} {-10.}
(assert (= (+ (+ (* sc_112 0.5) of_112) slbot_112) -10.))
; 
; =  {(((sc.iadd[9].OUT*16.6)+of.iadd[9].OUT)+sl.max.iadd[9].OUT)} {10.}
(assert (= (+ (+ (* sc_112 16.6) of_112) sltop_112) 10.))
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
(declare-fun sc_117 () Real)
(assert (> sc_117 1e-08))
(declare-fun of_117 () Real)
; 
; =  {sc.iadd[6].A} {sc.iadd[6].B}
(assert (= sc_115 sc_116))
; 
; =  {sc.iadd[6].A} {sc.iadd[6].C} {sc.iadd[6].D}
(assert (and (= sc_115 sc_114) (= sc_115 sc_113)))
; 
; =  {sc.iadd[6].OUT} {sc.iadd[6].A}
(assert (= sc_117 sc_115))
; 
; =  {of.iadd[6].OUT} {((of.iadd[6].A+of.iadd[6].B)-of.iadd[6].C-of.iadd[6].D)}
(assert (= of_117 (- (+ of_115 of_116) (+ of_114 of_113))))
(declare-fun slbot_113 () Real)
(declare-fun sltop_113 () Real)
; 
; =  {(((sc.iadd[6].D*0.)+of.iadd[6].D)+sl.min.iadd[6].D)} {0.}
(assert (= (+ (+ (* sc_113 0.) of_113) slbot_113) 0.))
; 
; =  {(((sc.iadd[6].D*15.6)+of.iadd[6].D)+sl.max.iadd[6].D)} {5.}
(assert (= (+ (+ (* sc_113 15.6) of_113) sltop_113) 5.))
; 
; >=  {((sc.iadd[6].C*0.)+of.iadd[6].C)} {5.}
(assert (<= (+ (* sc_114 0.) of_114) 5.))
; 
; <=  {((sc.iadd[6].C*0.)+of.iadd[6].C)} {0.}
(assert (>= (+ (* sc_114 0.) of_114) 0.))
(declare-fun slbot_117 () Real)
(declare-fun sltop_117 () Real)
; 
; =  {(((sc.iadd[6].OUT*-15.6)+of.iadd[6].OUT)+sl.min.iadd[6].OUT)} {-10.}
(assert (= (+ (+ (* sc_117 -15.6) of_117) slbot_117) -10.))
; 
; =  {(((sc.iadd[6].OUT*0.)+of.iadd[6].OUT)+sl.max.iadd[6].OUT)} {10.}
(assert (= (+ (+ (* sc_117 0.) of_117) sltop_117) 10.))
; 
; >=  {((sc.iadd[6].A*0.)+of.iadd[6].A)} {5.}
(assert (<= (+ (* sc_115 0.) of_115) 5.))
; 
; <=  {((sc.iadd[6].A*0.)+of.iadd[6].A)} {0.}
(assert (>= (+ (* sc_115 0.) of_115) 0.))
; 
; >=  {((sc.iadd[6].B*0.)+of.iadd[6].B)} {5.}
(assert (<= (+ (* sc_116 0.) of_116) 5.))
; 
; <=  {((sc.iadd[6].B*0.)+of.iadd[6].B)} {0.}
(assert (>= (+ (* sc_116 0.) of_116) 0.))
(declare-fun slbot_117 () Real)
(declare-fun sltop_117 () Real)
; 
; =  {(((sc.iadd[6].OUT*-15.6)+of.iadd[6].OUT)+sl.min.iadd[6].OUT)} {-10.}
(assert (= (+ (+ (* sc_117 -15.6) of_117) slbot_117) -10.))
; 
; =  {(((sc.iadd[6].OUT*0.)+of.iadd[6].OUT)+sl.max.iadd[6].OUT)} {10.}
(assert (= (+ (+ (* sc_117 0.) of_117) sltop_117) 10.))
; 
; =  {sc.input.I[6].O} {sc.iadd[6].C}
(assert (= sc_30 sc_114))
; 
; =  {of.input.I[6].O} {of.iadd[6].C}
(assert (= of_30 of_114))
; 
; =  {sc.iadd[6].OUT} {sc.iadd[9].D}
(assert (= sc_117 sc_108))
; 
; =  {of.iadd[6].OUT} {of.iadd[9].D}
(assert (= of_117 of_108))
; 
; =  {sc.vadd[1].OUT2} {sc.output.V[0].X}
(assert (= sc_56 sc_39))
; 
; =  {of.vadd[1].OUT2} {of.output.V[0].X}
(assert (= of_56 of_39))
; 
; =  {sc.vadd[1].OUT2} {sc.vtoi[0].X}
(assert (= sc_56 sc_63))
; 
; =  {of.vadd[1].OUT2} {of.vtoi[0].X}
(assert (= of_56 of_63))
; 
; =  {sc.input.I[0].O} {sc.switch[3].SUB}
(assert (= sc_26 sc_13))
; 
; =  {of.input.I[0].O} {of.switch[3].SUB}
(assert (= of_26 of_13))
; 
; =  {sc.input.V[9].O} {sc.vadd[5].C}
(assert (= sc_77 sc_45))
; 
; =  {of.input.V[9].O} {of.vadd[5].C}
(assert (= of_77 of_45))
; 
; =  {sc.input.V[15].O} {sc.itov[8].K}
(assert (= sc_85 sc_103))
; 
; =  {of.input.V[15].O} {of.itov[8].K}
(assert (= of_85 of_103))
; 
; =  {sc.input.I[9].O} {sc.switch[3].Kmod}
(assert (= sc_24 sc_14))
; 
; =  {of.input.I[9].O} {of.switch[3].Kmod}
(assert (= of_24 of_14))
; 
; =  {sc.input.I[3].O} {sc.ihill[2].Vmax}
(assert (= sc_32 sc_60))
; 
; =  {of.input.I[3].O} {of.ihill[2].Vmax}
(assert (= of_32 of_60))
; 
; =  {sc.input.V[13].O} {sc.vadd[1].D}
(assert (= sc_73 sc_51))
; 
; =  {of.input.V[13].O} {of.vadd[1].D}
(assert (= of_73 of_51))
; 
; =  {sc.input.I[4].O} {sc.iadd[6].A}
(assert (= sc_34 sc_115))
; 
; =  {of.input.I[4].O} {of.iadd[6].A}
(assert (= of_34 of_115))
; 
; =  {sc.input.I[5].O} {sc.iadd[6].B}
(assert (= sc_36 sc_116))
; 
; =  {of.input.I[5].O} {of.iadd[6].B}
(assert (= of_36 of_116))
; 
; =  {sc.vtoi[0].Y} {sc.ihill[2].S}
(assert (= sc_65 sc_58))
; 
; =  {of.vtoi[0].Y} {of.ihill[2].S}
(assert (= of_65 of_58))
; 
; =  {sc.input.V[14].O} {sc.vgain[0].X}
(assert (= sc_89 sc_4))
; 
; =  {of.input.V[14].O} {of.vgain[0].X}
(assert (= of_89 of_4))
; 
; =  {sc.input.V[11].O} {sc.vadd[5].OUT2_0}
(assert (= sc_81 sc_43))
; 
; =  {of.input.V[11].O} {of.vadd[5].OUT2_0}
(assert (= of_81 of_43))
; 
; =  {sc.itov[8].Y} {sc.vgain[7].Y}
(assert (= sc_104 sc_1))
; 
; =  {of.itov[8].Y} {of.vgain[7].Y}
(assert (= of_104 of_1))
; 
; =  {sc.input.V[12].O} {sc.vadd[5].D}
(assert (= sc_75 sc_44))
; 
; =  {of.input.V[12].O} {of.vadd[5].D}
(assert (= of_75 of_44))
; 
; =  {sc.input.V[8].O} {sc.vadd[5].A}
(assert (= sc_69 sc_46))
; 
; =  {of.input.V[8].O} {of.vadd[5].A}
(assert (= of_69 of_46))
; 
; =  {sc.switch[3].PROD} {sc.iadd[6].D}
(assert (= sc_16 sc_113))
; 
; =  {of.switch[3].PROD} {of.iadd[6].D}
(assert (= of_16 of_113))
; 
; =  {sc.input.I[2].O} {sc.iadd[9].B}
(assert (= sc_18 sc_111))
; 
; =  {of.input.I[2].O} {of.iadd[9].B}
(assert (= of_18 of_111))
; 
; =  {sc.ihill[2].REP} {sc.itov[9].K}
(assert (= sc_62 sc_106))
; 
; =  {of.ihill[2].REP} {of.itov[9].K}
(assert (= of_62 of_106))
; 
; =  {sc.input.V[3].O} {sc.ihill[2].n}
(assert (= sc_93 sc_57))
; 
; =  {of.input.V[3].O} {of.ihill[2].n}
(assert (= of_93 of_57))
; 
; =  {sc.input.V[2].O} {sc.switch[3].n}
(assert (= sc_67 sc_12))
; 
; =  {of.input.V[2].O} {of.switch[3].n}
(assert (= of_67 of_12))
; 
; =  {sc.vadd[5].OUT2} {sc.output.V[1].X}
(assert (= sc_49 sc_41))
; 
; =  {of.vadd[5].OUT2} {of.output.V[1].X}
(assert (= of_49 of_41))
; 
; =  {sc.vadd[5].OUT2} {sc.switch[3].Vmax}
(assert (= sc_49 sc_15))
; 
; =  {of.vadd[5].OUT2} {of.switch[3].Vmax}
(assert (= of_49 of_15))
; 
; =  {sc.input.V[19].O} {sc.vtoi[0].K}
(assert (= sc_101 sc_64))
; 
; =  {of.input.V[19].O} {of.vtoi[0].K}
(assert (= of_101 of_64))
; 
; =  {sc.input.I[10].O} {sc.itov[9].X}
(assert (= sc_28 sc_105))
; 
; =  {of.input.I[10].O} {of.itov[9].X}
(assert (= of_28 of_105))
; 
; =  {sc.input.I[1].O} {sc.ihill[2].Km}
(assert (= sc_38 sc_59))
; 
; =  {of.input.I[1].O} {of.ihill[2].Km}
(assert (= of_38 of_59))
; 
; =  {sc.input.I[7].O} {sc.iadd[9].C}
(assert (= sc_22 sc_109))
; 
; =  {of.input.I[7].O} {of.iadd[9].C}
(assert (= of_22 of_109))
; 
; =  {sc.input.V[1].O} {sc.vgain[7].X}
(assert (= sc_99 sc_0))
; 
; =  {of.input.V[1].O} {of.vgain[7].X}
(assert (= of_99 of_0))
; 
; =  {sc.vgain[0].P} {sc.vadd[1].B}
(assert (= sc_7 sc_54))
; 
; =  {of.vgain[0].P} {of.vadd[1].B}
(assert (= of_7 of_54))
; 
; =  {sc.input.V[7].O} {sc.vadd[1].C}
(assert (= sc_71 sc_52))
; 
; =  {of.input.V[7].O} {of.vadd[1].C}
(assert (= of_71 of_52))
; 
; =  {sc.input.I[8].O} {sc.iadd[9].A}
(assert (= sc_20 sc_110))
; 
; =  {of.input.I[8].O} {of.iadd[9].A}
(assert (= of_20 of_110))
; 
; =  {sc.iadd[9].OUT} {sc.itov[8].X}
(assert (= sc_112 sc_102))
; 
; =  {of.iadd[9].OUT} {of.itov[8].X}
(assert (= of_112 of_102))
; 
; =  {sc.vgain[4].P} {sc.vadd[5].B}
(assert (= sc_11 sc_47))
; 
; =  {of.vgain[4].P} {of.vadd[5].B}
(assert (= of_11 of_47))
; 
; =  {sc.vgain[7].P} {sc.vgain[0].Z}
(assert (= sc_3 sc_6))
; 
; =  {of.vgain[7].P} {of.vgain[0].Z}
(assert (= of_3 of_6))
; 
; =  {sc.input.V[10].O} {sc.vadd[1].OUT2_0}
(assert (= sc_83 sc_50))
; 
; =  {of.input.V[10].O} {of.vadd[1].OUT2_0}
(assert (= of_83 of_50))
; 
; =  {sc.input.V[0].O} {sc.vgain[7].Z}
(assert (= sc_79 sc_2))
; 
; =  {of.input.V[0].O} {of.vgain[7].Z}
(assert (= of_79 of_2))
; 
; =  {sc.itov[9].Y} {sc.vgain[4].Z}
(assert (= sc_107 sc_10))
; 
; =  {of.itov[9].Y} {of.vgain[4].Z}
(assert (= of_107 of_10))
; 
; =  {sc.input.V[16].O} {sc.vgain[4].X}
(assert (= sc_91 sc_8))
; 
; =  {of.input.V[16].O} {of.vgain[4].X}
(assert (= of_91 of_8))
; 
; =  {sc.input.V[4].O} {sc.vgain[4].Y}
(assert (= sc_95 sc_9))
; 
; =  {of.input.V[4].O} {of.vgain[4].Y}
(assert (= of_95 of_9))
; 
; =  {sc.input.V[5].O} {sc.vgain[0].Y}
(assert (= sc_97 sc_5))
; 
; =  {of.input.V[5].O} {of.vgain[0].Y}
(assert (= of_97 of_5))
; 
; =  {sc.input.V[6].O} {sc.vadd[1].A}
(assert (= sc_87 sc_53))
; 
; =  {of.input.V[6].O} {of.vadd[1].A}
(assert (= of_87 of_53))
(assert (<= (* sc_40 0.001) 0.001))
(assert (<= (* sc_42 0.001) 0.001))
; 
; =  {sc.vadd[1].OUT2} {sc.output.V[0].O} {sc.vadd[5].OUT2} {sc.output.V[1].O}
(assert (and (and (= sc_56 sc_40) (= sc_56 sc_49)) (= sc_56 sc_42)))
(assert (= __minima__ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (ite (>= sltop_1 0.) sltop_1 (- sltop_1)) (ite (>= sltop_18 0.) sltop_18 (- sltop_18))) (ite (>= slbot_16 0.) slbot_16 (- slbot_16))) (ite (>= slbot_10 0.) slbot_10 (- slbot_10))) (ite (>= slbot_49 0.) slbot_49 (- slbot_49))) (ite (>= sltop_65 0.) sltop_65 (- sltop_65))) (ite (>= slbot_107 0.) slbot_107 (- slbot_107))) (ite (>= slbot_3 0.) slbot_3 (- slbot_3))) (ite (>= sltop_42 0.) sltop_42 (- sltop_42))) (ite (>= sltop_104 0.) sltop_104 (- sltop_104))) (ite (>= slbot_26 0.) slbot_26 (- slbot_26))) (ite (>= slbot_59 0.) slbot_59 (- slbot_59))) (ite (>= slbot_2 0.) slbot_2 (- slbot_2))) (ite (>= sltop_10 0.) sltop_10 (- sltop_10))) (ite (>= sltop_112 0.) sltop_112 (- sltop_112))) (ite (>= sltop_58 0.) sltop_58 (- sltop_58))) (ite (>= slbot_18 0.) slbot_18 (- slbot_18))) (ite (>= sltop_111 0.) sltop_111 (- sltop_111))) (ite (>= sltop_2 0.) sltop_2 (- sltop_2))) (ite (>= sltop_13 0.) sltop_13 (- sltop_13))) (ite (>= sltop_15 0.) sltop_15 (- sltop_15))) (ite (>= slbot_111 0.) slbot_111 (- slbot_111))) (ite (>= sltop_62 0.) sltop_62 (- sltop_62))) (ite (>= slbot_104 0.) slbot_104 (- slbot_104))) (ite (>= slbot_55 0.) slbot_55 (- slbot_55))) (ite (>= slbot_56 0.) slbot_56 (- slbot_56))) (ite (>= slbot_54 0.) slbot_54 (- slbot_54))) (ite (>= slbot_108 0.) slbot_108 (- slbot_108))) (ite (>= slbot_6 0.) slbot_6 (- slbot_6))) (ite (>= slbot_38 0.) slbot_38 (- slbot_38))) (ite (>= slbot_42 0.) slbot_42 (- slbot_42))) (ite (>= sltop_17 0.) sltop_17 (- sltop_17))) (ite (>= slbot_79 0.) slbot_79 (- slbot_79))) (ite (>= sltop_3 0.) sltop_3 (- sltop_3))) (ite (>= sltop_40 0.) sltop_40 (- sltop_40))) (ite (>= slbot_7 0.) slbot_7 (- slbot_7))) (ite (>= slbot_13 0.) slbot_13 (- slbot_13))) (ite (>= sltop_41 0.) sltop_41 (- sltop_41))) (ite (>= slbot_78 0.) slbot_78 (- slbot_78))) (ite (>= sltop_55 0.) sltop_55 (- sltop_55))) (ite (>= slbot_11 0.) slbot_11 (- slbot_11))) (ite (>= sltop_11 0.) sltop_11 (- sltop_11))) (ite (>= slbot_112 0.) slbot_112 (- slbot_112))) (ite (>= slbot_63 0.) slbot_63 (- slbot_63))) (ite (>= sltop_79 0.) sltop_79 (- sltop_79))) (ite (>= sltop_54 0.) sltop_54 (- sltop_54))) (ite (>= slbot_37 0.) slbot_37 (- slbot_37))) (ite (>= slbot_61 0.) slbot_61 (- slbot_61))) (ite (>= sltop_107 0.) sltop_107 (- sltop_107))) (ite (>= sltop_7 0.) sltop_7 (- sltop_7))) (ite (>= sltop_38 0.) sltop_38 (- sltop_38))) (ite (>= slbot_15 0.) slbot_15 (- slbot_15))) (ite (>= slbot_17 0.) slbot_17 (- slbot_17))) (ite (>= sltop_39 0.) sltop_39 (- sltop_39))) (ite (>= sltop_49 0.) sltop_49 (- sltop_49))) (ite (>= slbot_117 0.) slbot_117 (- slbot_117))) (ite (>= sltop_117 0.) sltop_117 (- sltop_117))) (ite (>= slbot_113 0.) slbot_113 (- slbot_113))) (ite (>= slbot_25 0.) slbot_25 (- slbot_25))) (ite (>= slbot_41 0.) slbot_41 (- slbot_41))) (ite (>= slbot_106 0.) slbot_106 (- slbot_106))) (ite (>= slbot_62 0.) slbot_62 (- slbot_62))) (ite (>= slbot_65 0.) slbot_65 (- slbot_65))) (ite (>= sltop_16 0.) sltop_16 (- sltop_16))) (ite (>= sltop_56 0.) sltop_56 (- sltop_56))) (ite (>= sltop_102 0.) sltop_102 (- sltop_102))) (ite (>= slbot_48 0.) slbot_48 (- slbot_48))) (ite (>= sltop_47 0.) sltop_47 (- sltop_47))) (ite (>= sltop_78 0.) sltop_78 (- sltop_78))) (ite (>= sltop_48 0.) sltop_48 (- sltop_48))) (ite (>= sltop_37 0.) sltop_37 (- sltop_37))) (ite (>= sltop_61 0.) sltop_61 (- sltop_61))) (ite (>= sltop_25 0.) sltop_25 (- sltop_25))) (ite (>= sltop_63 0.) sltop_63 (- sltop_63))) (ite (>= sltop_106 0.) sltop_106 (- sltop_106))) (ite (>= sltop_26 0.) sltop_26 (- sltop_26))) (ite (>= slbot_39 0.) slbot_39 (- slbot_39))) (ite (>= slbot_47 0.) slbot_47 (- slbot_47))) (ite (>= slbot_58 0.) slbot_58 (- slbot_58))) (ite (>= sltop_6 0.) sltop_6 (- sltop_6))) (ite (>= slbot_40 0.) slbot_40 (- slbot_40))) (ite (>= slbot_102 0.) slbot_102 (- slbot_102))) (ite (>= sltop_108 0.) sltop_108 (- sltop_108))) (ite (>= sltop_113 0.) sltop_113 (- sltop_113))) (ite (>= slbot_1 0.) slbot_1 (- slbot_1))) (ite (>= sltop_59 0.) sltop_59 (- sltop_59)))))
(check-sat)
