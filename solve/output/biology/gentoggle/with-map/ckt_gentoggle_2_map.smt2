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
; =  {sc.vgain[12].P} {((sc.vgain[12].X/sc.vgain[12].Y)*sc.vgain[12].Z*1.)}
(assert (= sc_3 (* (* (/ sc_0 sc_1) sc_2) 1.)))
; 
; =  {of.vgain[12].P} {0.}
(assert (= of_3 0.))
; 
; >=  {((sc.vgain[12].X*1.)+of.vgain[12].X)} {3300.}
(assert (<= (+ (* sc_0 1.) of_0) 3300.))
; 
; <=  {((sc.vgain[12].X*1.)+of.vgain[12].X)} {0.0001}
(assert (>= (+ (* sc_0 1.) of_0) 0.0001))
(declare-fun slbot_1 () Real)
(declare-fun sltop_1 () Real)
; 
; =  {(((sc.vgain[12].Y*1.)+of.vgain[12].Y)+sl.min.vgain[12].Y)} {1.}
(assert (= (+ (+ (* sc_1 1.) of_1) slbot_1) 1.))
; 
; =  {(((sc.vgain[12].Y*5.65685424949)+of.vgain[12].Y)+sl.max.vgain[12].Y)} {3300.}
(assert (= (+ (+ (* sc_1 5.65685424949) of_1) sltop_1) 3300.))
(declare-fun slbot_3 () Real)
(declare-fun sltop_3 () Real)
; 
; =  {(((sc.vgain[12].P*27.6213586401)+of.vgain[12].P)+sl.min.vgain[12].P)} {1.51515151515e-12}
(assert (= (+ (+ (* sc_3 27.6213586401) of_3) slbot_3) 1.51515151515e-12))
; 
; =  {(((sc.vgain[12].P*156.25)+of.vgain[12].P)+sl.max.vgain[12].P)} {5445000.}
(assert (= (+ (+ (* sc_3 156.25) of_3) sltop_3) 5445000.))
; 
; >=  {((sc.vgain[12].Z*312.5)+of.vgain[12].Z)} {3300.}
(assert (<= (+ (* sc_2 312.5) of_2) 3300.))
; 
; <=  {((sc.vgain[12].Z*312.5)+of.vgain[12].Z)} {0.0001}
(assert (>= (+ (* sc_2 312.5) of_2) 0.0001))
(declare-fun slbot_3 () Real)
(declare-fun sltop_3 () Real)
; 
; =  {(((sc.vgain[12].P*27.6213586401)+of.vgain[12].P)+sl.min.vgain[12].P)} {1.51515151515e-12}
(assert (= (+ (+ (* sc_3 27.6213586401) of_3) slbot_3) 1.51515151515e-12))
; 
; =  {(((sc.vgain[12].P*156.25)+of.vgain[12].P)+sl.max.vgain[12].P)} {5445000.}
(assert (= (+ (+ (* sc_3 156.25) of_3) sltop_3) 5445000.))
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
; =  {sc.vgain[15].P} {((sc.vgain[15].X/sc.vgain[15].Y)*sc.vgain[15].Z*1.)}
(assert (= sc_11 (* (* (/ sc_8 sc_9) sc_10) 1.)))
; 
; =  {of.vgain[15].P} {0.}
(assert (= of_11 0.))
; 
; >=  {((sc.vgain[15].X*1.)+of.vgain[15].X)} {3300.}
(assert (<= (+ (* sc_8 1.) of_8) 3300.))
; 
; <=  {((sc.vgain[15].X*1.)+of.vgain[15].X)} {0.0001}
(assert (>= (+ (* sc_8 1.) of_8) 0.0001))
(declare-fun slbot_9 () Real)
(declare-fun sltop_9 () Real)
; 
; =  {(((sc.vgain[15].Y*0.)+of.vgain[15].Y)+sl.min.vgain[15].Y)} {1.}
(assert (= (+ (+ (* sc_9 0.) of_9) slbot_9) 1.))
; 
; =  {(((sc.vgain[15].Y*305175.78125)+of.vgain[15].Y)+sl.max.vgain[15].Y)} {3300.}
(assert (= (+ (+ (* sc_9 305175.78125) of_9) sltop_9) 3300.))
(declare-fun slbot_11 () Real)
(declare-fun sltop_11 () Real)
; 
; =  {(((sc.vgain[15].P*0.)+of.vgain[15].P)+sl.min.vgain[15].P)} {1.51515151515e-12}
(assert (= (+ (+ (* sc_11 0.) of_11) slbot_11) 1.51515151515e-12))
; 
; =  {(((sc.vgain[15].P*3.2768e-06)+of.vgain[15].P)+sl.max.vgain[15].P)} {5445000.}
(assert (= (+ (+ (* sc_11 3.2768e-06) of_11) sltop_11) 5445000.))
; 
; >=  {((sc.vgain[15].Z*2.)+of.vgain[15].Z)} {3300.}
(assert (<= (+ (* sc_10 2.) of_10) 3300.))
; 
; <=  {((sc.vgain[15].Z*2.)+of.vgain[15].Z)} {0.0001}
(assert (>= (+ (* sc_10 2.) of_10) 0.0001))
(declare-fun slbot_11 () Real)
(declare-fun sltop_11 () Real)
; 
; =  {(((sc.vgain[15].P*0.)+of.vgain[15].P)+sl.min.vgain[15].P)} {1.51515151515e-12}
(assert (= (+ (+ (* sc_11 0.) of_11) slbot_11) 1.51515151515e-12))
; 
; =  {(((sc.vgain[15].P*3.2768e-06)+of.vgain[15].P)+sl.max.vgain[15].P)} {5445000.}
(assert (= (+ (+ (* sc_11 3.2768e-06) of_11) sltop_11) 5445000.))
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
; no offset
(assert (= of_12 0.))
; no offset
(assert (= of_13 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_14 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vgain[6].P} {((sc.vgain[6].X/sc.vgain[6].Y)*sc.vgain[6].Z*1.)}
(assert (= sc_15 (* (* (/ sc_12 sc_13) sc_14) 1.)))
; 
; =  {of.vgain[6].P} {0.}
(assert (= of_15 0.))
; 
; >=  {((sc.vgain[6].X*31.2)+of.vgain[6].X)} {3300.}
(assert (<= (+ (* sc_12 31.2) of_12) 3300.))
; 
; <=  {((sc.vgain[6].X*31.2)+of.vgain[6].X)} {0.0001}
(assert (>= (+ (* sc_12 31.2) of_12) 0.0001))
(declare-fun slbot_13 () Real)
(declare-fun sltop_13 () Real)
; 
; =  {(((sc.vgain[6].Y*0.5)+of.vgain[6].Y)+sl.min.vgain[6].Y)} {1.}
(assert (= (+ (+ (* sc_13 0.5) of_13) slbot_13) 1.))
; 
; =  {(((sc.vgain[6].Y*16.6)+of.vgain[6].Y)+sl.max.vgain[6].Y)} {3300.}
(assert (= (+ (+ (* sc_13 16.6) of_13) sltop_13) 3300.))
(declare-fun slbot_15 () Real)
(declare-fun sltop_15 () Real)
; 
; =  {(((sc.vgain[6].P*0.469879518072)+of.vgain[6].P)+sl.min.vgain[6].P)} {1.51515151515e-12}
(assert (= (+ (+ (* sc_15 0.469879518072) of_15) slbot_15) 1.51515151515e-12))
; 
; =  {(((sc.vgain[6].P*31.2)+of.vgain[6].P)+sl.max.vgain[6].P)} {5445000.}
(assert (= (+ (+ (* sc_15 31.2) of_15) sltop_15) 5445000.))
(declare-fun slbot_14 () Real)
(declare-fun sltop_14 () Real)
; 
; =  {(((sc.vgain[6].Z*0.5)+of.vgain[6].Z)+sl.min.vgain[6].Z)} {0.0001}
(assert (= (+ (+ (* sc_14 0.5) of_14) slbot_14) 0.0001))
; 
; =  {(((sc.vgain[6].Z*1.)+of.vgain[6].Z)+sl.max.vgain[6].Z)} {3300.}
(assert (= (+ (+ (* sc_14 1.) of_14) sltop_14) 3300.))
(declare-fun slbot_15 () Real)
(declare-fun sltop_15 () Real)
; 
; =  {(((sc.vgain[6].P*0.469879518072)+of.vgain[6].P)+sl.min.vgain[6].P)} {1.51515151515e-12}
(assert (= (+ (+ (* sc_15 0.469879518072) of_15) slbot_15) 1.51515151515e-12))
; 
; =  {(((sc.vgain[6].P*31.2)+of.vgain[6].P)+sl.max.vgain[6].P)} {5445000.}
(assert (= (+ (+ (* sc_15 31.2) of_15) sltop_15) 5445000.))
(declare-fun sc_16 () Real)
(assert (> sc_16 1e-08))
(declare-fun of_16 () Real)
(declare-fun sc_17 () Real)
(assert (> sc_17 1e-08))
(declare-fun of_17 () Real)
(declare-fun sc_18 () Real)
(assert (> sc_18 1e-08))
(declare-fun of_18 () Real)
(declare-fun sc_19 () Real)
(assert (> sc_19 1e-08))
(declare-fun of_19 () Real)
; no offset
(assert (= of_16 0.))
; no offset
(assert (= of_17 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_18 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vgain[14].P} {((sc.vgain[14].X/sc.vgain[14].Y)*sc.vgain[14].Z*1.)}
(assert (= sc_19 (* (* (/ sc_16 sc_17) sc_18) 1.)))
; 
; =  {of.vgain[14].P} {0.}
(assert (= of_19 0.))
; 
; >=  {((sc.vgain[14].X*1.)+of.vgain[14].X)} {3300.}
(assert (<= (+ (* sc_16 1.) of_16) 3300.))
; 
; <=  {((sc.vgain[14].X*1.)+of.vgain[14].X)} {0.0001}
(assert (>= (+ (* sc_16 1.) of_16) 0.0001))
(declare-fun slbot_17 () Real)
(declare-fun sltop_17 () Real)
; 
; =  {(((sc.vgain[14].Y*0.)+of.vgain[14].Y)+sl.min.vgain[14].Y)} {1.}
(assert (= (+ (+ (* sc_17 0.) of_17) slbot_17) 1.))
; 
; =  {(((sc.vgain[14].Y*3.2768e-06)+of.vgain[14].Y)+sl.max.vgain[14].Y)} {3300.}
(assert (= (+ (+ (* sc_17 3.2768e-06) of_17) sltop_17) 3300.))
(declare-fun slbot_19 () Real)
(declare-fun sltop_19 () Real)
; 
; =  {(((sc.vgain[14].P*0.)+of.vgain[14].P)+sl.min.vgain[14].P)} {1.51515151515e-12}
(assert (= (+ (+ (* sc_19 0.) of_19) slbot_19) 1.51515151515e-12))
; 
; =  {(((sc.vgain[14].P*305175.78125)+of.vgain[14].P)+sl.max.vgain[14].P)} {5445000.}
(assert (= (+ (+ (* sc_19 305175.78125) of_19) sltop_19) 5445000.))
; 
; >=  {((sc.vgain[14].Z*2.)+of.vgain[14].Z)} {3300.}
(assert (<= (+ (* sc_18 2.) of_18) 3300.))
; 
; <=  {((sc.vgain[14].Z*2.)+of.vgain[14].Z)} {0.0001}
(assert (>= (+ (* sc_18 2.) of_18) 0.0001))
(declare-fun slbot_19 () Real)
(declare-fun sltop_19 () Real)
; 
; =  {(((sc.vgain[14].P*0.)+of.vgain[14].P)+sl.min.vgain[14].P)} {1.51515151515e-12}
(assert (= (+ (+ (* sc_19 0.) of_19) slbot_19) 1.51515151515e-12))
; 
; =  {(((sc.vgain[14].P*305175.78125)+of.vgain[14].P)+sl.max.vgain[14].P)} {5445000.}
(assert (= (+ (+ (* sc_19 305175.78125) of_19) sltop_19) 5445000.))
(declare-fun sc_20 () Real)
(assert (> sc_20 1e-08))
(declare-fun of_20 () Real)
(declare-fun sc_21 () Real)
(assert (> sc_21 1e-08))
(declare-fun of_21 () Real)
(declare-fun sc_22 () Real)
(assert (> sc_22 1e-08))
(declare-fun of_22 () Real)
(declare-fun sc_23 () Real)
(assert (> sc_23 1e-08))
(declare-fun of_23 () Real)
; no offset
(assert (= of_20 0.))
; no offset
(assert (= of_21 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_22 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vgain[3].P} {((sc.vgain[3].X/sc.vgain[3].Y)*sc.vgain[3].Z*1.)}
(assert (= sc_23 (* (* (/ sc_20 sc_21) sc_22) 1.)))
; 
; =  {of.vgain[3].P} {0.}
(assert (= of_23 0.))
; 
; >=  {((sc.vgain[3].X*1.)+of.vgain[3].X)} {3300.}
(assert (<= (+ (* sc_20 1.) of_20) 3300.))
; 
; <=  {((sc.vgain[3].X*1.)+of.vgain[3].X)} {0.0001}
(assert (>= (+ (* sc_20 1.) of_20) 0.0001))
; 
; >=  {((sc.vgain[3].Y*0.125)+of.vgain[3].Y)} {3300.}
(assert (<= (+ (* sc_21 0.125) of_21) 3300.))
; 
; <=  {((sc.vgain[3].Y*0.125)+of.vgain[3].Y)} {1.}
(assert (>= (+ (* sc_21 0.125) of_21) 1.))
(declare-fun slbot_23 () Real)
(declare-fun sltop_23 () Real)
; 
; =  {(((sc.vgain[3].P*0.000362037485643)+of.vgain[3].P)+sl.min.vgain[3].P)} {1.51515151515e-12}
(assert (= (+ (+ (* sc_23 0.000362037485643) of_23) slbot_23) 1.51515151515e-12))
; 
; =  {(((sc.vgain[3].P*3535.53390593)+of.vgain[3].P)+sl.max.vgain[3].P)} {5445000.}
(assert (= (+ (+ (* sc_23 3535.53390593) of_23) sltop_23) 5445000.))
(declare-fun slbot_22 () Real)
(declare-fun sltop_22 () Real)
; 
; =  {(((sc.vgain[3].Z*9.05093714108e-05)+of.vgain[3].Z)+sl.min.vgain[3].Z)} {0.0001}
(assert (= (+ (+ (* sc_22 9.05093714108e-05) of_22) slbot_22) 0.0001))
; 
; =  {(((sc.vgain[3].Z*883.883476483)+of.vgain[3].Z)+sl.max.vgain[3].Z)} {3300.}
(assert (= (+ (+ (* sc_22 883.883476483) of_22) sltop_22) 3300.))
(declare-fun sc_24 () Real)
(assert (> sc_24 1e-08))
(declare-fun of_24 () Real)
(declare-fun sc_25 () Real)
(assert (> sc_25 1e-08))
(declare-fun of_25 () Real)
(declare-fun sc_26 () Real)
(assert (> sc_26 1e-08))
(declare-fun of_26 () Real)
(declare-fun sc_27 () Real)
(assert (> sc_27 1e-08))
(declare-fun of_27 () Real)
; no offset
(assert (= of_24 0.))
; no offset
(assert (= of_25 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_26 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vgain[30].P} {((sc.vgain[30].X/sc.vgain[30].Y)*sc.vgain[30].Z*1.)}
(assert (= sc_27 (* (* (/ sc_24 sc_25) sc_26) 1.)))
; 
; =  {of.vgain[30].P} {0.}
(assert (= of_27 0.))
; 
; >=  {((sc.vgain[30].X*2.)+of.vgain[30].X)} {3300.}
(assert (<= (+ (* sc_24 2.) of_24) 3300.))
; 
; <=  {((sc.vgain[30].X*2.)+of.vgain[30].X)} {0.0001}
(assert (>= (+ (* sc_24 2.) of_24) 0.0001))
; 
; >=  {((sc.vgain[30].Y*1.)+of.vgain[30].Y)} {3300.}
(assert (<= (+ (* sc_25 1.) of_25) 3300.))
; 
; <=  {((sc.vgain[30].Y*1.)+of.vgain[30].Y)} {1.}
(assert (>= (+ (* sc_25 1.) of_25) 1.))
(declare-fun slbot_27 () Real)
(declare-fun sltop_27 () Real)
; 
; =  {(((sc.vgain[30].P*0.)+of.vgain[30].P)+sl.min.vgain[30].P)} {1.51515151515e-12}
(assert (= (+ (+ (* sc_27 0.) of_27) slbot_27) 1.51515151515e-12))
; 
; =  {(((sc.vgain[30].P*3.2768e-06)+of.vgain[30].P)+sl.max.vgain[30].P)} {5445000.}
(assert (= (+ (+ (* sc_27 3.2768e-06) of_27) sltop_27) 5445000.))
(declare-fun slbot_26 () Real)
(declare-fun sltop_26 () Real)
; 
; =  {(((sc.vgain[30].Z*0.)+of.vgain[30].Z)+sl.min.vgain[30].Z)} {0.0001}
(assert (= (+ (+ (* sc_26 0.) of_26) slbot_26) 0.0001))
; 
; =  {(((sc.vgain[30].Z*3.2768e-06)+of.vgain[30].Z)+sl.max.vgain[30].Z)} {3300.}
(assert (= (+ (+ (* sc_26 3.2768e-06) of_26) sltop_26) 3300.))
(declare-fun slbot_27 () Real)
(declare-fun sltop_27 () Real)
; 
; =  {(((sc.vgain[30].P*0.)+of.vgain[30].P)+sl.min.vgain[30].P)} {1.51515151515e-12}
(assert (= (+ (+ (* sc_27 0.) of_27) slbot_27) 1.51515151515e-12))
; 
; =  {(((sc.vgain[30].P*3.2768e-06)+of.vgain[30].P)+sl.max.vgain[30].P)} {5445000.}
(assert (= (+ (+ (* sc_27 3.2768e-06) of_27) sltop_27) 5445000.))
(declare-fun sc_28 () Real)
(assert (> sc_28 1e-08))
(declare-fun of_28 () Real)
(declare-fun sc_29 () Real)
(assert (> sc_29 1e-08))
(declare-fun of_29 () Real)
(declare-fun sc_30 () Real)
(assert (> sc_30 1e-08))
(declare-fun of_30 () Real)
(declare-fun sc_31 () Real)
(assert (> sc_31 1e-08))
(declare-fun of_31 () Real)
; no offset
(assert (= of_28 0.))
; no offset
(assert (= of_29 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_30 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vgain[23].P} {((sc.vgain[23].X/sc.vgain[23].Y)*sc.vgain[23].Z*1.)}
(assert (= sc_31 (* (* (/ sc_28 sc_29) sc_30) 1.)))
; 
; =  {of.vgain[23].P} {0.}
(assert (= of_31 0.))
; 
; >=  {((sc.vgain[23].X*2.)+of.vgain[23].X)} {3300.}
(assert (<= (+ (* sc_28 2.) of_28) 3300.))
; 
; <=  {((sc.vgain[23].X*2.)+of.vgain[23].X)} {0.0001}
(assert (>= (+ (* sc_28 2.) of_28) 0.0001))
; 
; >=  {((sc.vgain[23].Y*1.)+of.vgain[23].Y)} {3300.}
(assert (<= (+ (* sc_29 1.) of_29) 3300.))
; 
; <=  {((sc.vgain[23].Y*1.)+of.vgain[23].Y)} {1.}
(assert (>= (+ (* sc_29 1.) of_29) 1.))
(declare-fun slbot_31 () Real)
(declare-fun sltop_31 () Real)
; 
; =  {(((sc.vgain[23].P*1.)+of.vgain[23].P)+sl.min.vgain[23].P)} {1.51515151515e-12}
(assert (= (+ (+ (* sc_31 1.) of_31) slbot_31) 1.51515151515e-12))
; 
; =  {(((sc.vgain[23].P*5.65685424949)+of.vgain[23].P)+sl.max.vgain[23].P)} {5445000.}
(assert (= (+ (+ (* sc_31 5.65685424949) of_31) sltop_31) 5445000.))
(declare-fun slbot_30 () Real)
(declare-fun sltop_30 () Real)
; 
; =  {(((sc.vgain[23].Z*1.)+of.vgain[23].Z)+sl.min.vgain[23].Z)} {0.0001}
(assert (= (+ (+ (* sc_30 1.) of_30) slbot_30) 0.0001))
; 
; =  {(((sc.vgain[23].Z*5.65685424949)+of.vgain[23].Z)+sl.max.vgain[23].Z)} {3300.}
(assert (= (+ (+ (* sc_30 5.65685424949) of_30) sltop_30) 3300.))
(declare-fun slbot_31 () Real)
(declare-fun sltop_31 () Real)
; 
; =  {(((sc.vgain[23].P*1.)+of.vgain[23].P)+sl.min.vgain[23].P)} {1.51515151515e-12}
(assert (= (+ (+ (* sc_31 1.) of_31) slbot_31) 1.51515151515e-12))
; 
; =  {(((sc.vgain[23].P*5.65685424949)+of.vgain[23].P)+sl.max.vgain[23].P)} {5445000.}
(assert (= (+ (+ (* sc_31 5.65685424949) of_31) sltop_31) 5445000.))
(declare-fun sc_32 () Real)
(assert (> sc_32 1e-08))
(declare-fun of_32 () Real)
(declare-fun sc_33 () Real)
(assert (> sc_33 1e-08))
(declare-fun of_33 () Real)
(declare-fun sc_34 () Real)
(assert (> sc_34 1e-08))
(declare-fun of_34 () Real)
(declare-fun sc_35 () Real)
(assert (> sc_35 1e-08))
(declare-fun of_35 () Real)
; no offset
(assert (= of_32 0.))
; no offset
(assert (= of_33 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_34 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vgain[18].P} {((sc.vgain[18].X/sc.vgain[18].Y)*sc.vgain[18].Z*1.)}
(assert (= sc_35 (* (* (/ sc_32 sc_33) sc_34) 1.)))
; 
; =  {of.vgain[18].P} {0.}
(assert (= of_35 0.))
; 
; >=  {((sc.vgain[18].X*2.)+of.vgain[18].X)} {3300.}
(assert (<= (+ (* sc_32 2.) of_32) 3300.))
; 
; <=  {((sc.vgain[18].X*2.)+of.vgain[18].X)} {0.0001}
(assert (>= (+ (* sc_32 2.) of_32) 0.0001))
; 
; >=  {((sc.vgain[18].Y*1.)+of.vgain[18].Y)} {3300.}
(assert (<= (+ (* sc_33 1.) of_33) 3300.))
; 
; <=  {((sc.vgain[18].Y*1.)+of.vgain[18].Y)} {1.}
(assert (>= (+ (* sc_33 1.) of_33) 1.))
(declare-fun slbot_35 () Real)
(declare-fun sltop_35 () Real)
; 
; =  {(((sc.vgain[18].P*0.176776695297)+of.vgain[18].P)+sl.min.vgain[18].P)} {1.51515151515e-12}
(assert (= (+ (+ (* sc_35 0.176776695297) of_35) slbot_35) 1.51515151515e-12))
; 
; =  {(((sc.vgain[18].P*1.)+of.vgain[18].P)+sl.max.vgain[18].P)} {5445000.}
(assert (= (+ (+ (* sc_35 1.) of_35) sltop_35) 5445000.))
(declare-fun slbot_34 () Real)
(declare-fun sltop_34 () Real)
; 
; =  {(((sc.vgain[18].Z*0.176776695297)+of.vgain[18].Z)+sl.min.vgain[18].Z)} {0.0001}
(assert (= (+ (+ (* sc_34 0.176776695297) of_34) slbot_34) 0.0001))
; 
; =  {(((sc.vgain[18].Z*1.)+of.vgain[18].Z)+sl.max.vgain[18].Z)} {3300.}
(assert (= (+ (+ (* sc_34 1.) of_34) sltop_34) 3300.))
(declare-fun slbot_35 () Real)
(declare-fun sltop_35 () Real)
; 
; =  {(((sc.vgain[18].P*0.176776695297)+of.vgain[18].P)+sl.min.vgain[18].P)} {1.51515151515e-12}
(assert (= (+ (+ (* sc_35 0.176776695297) of_35) slbot_35) 1.51515151515e-12))
; 
; =  {(((sc.vgain[18].P*1.)+of.vgain[18].P)+sl.max.vgain[18].P)} {5445000.}
(assert (= (+ (+ (* sc_35 1.) of_35) sltop_35) 5445000.))
(declare-fun sc_36 () Real)
(assert (> sc_36 1e-08))
(declare-fun of_36 () Real)
(declare-fun sc_37 () Real)
(assert (> sc_37 1e-08))
(declare-fun of_37 () Real)
(declare-fun sc_38 () Real)
(assert (> sc_38 1e-08))
(declare-fun of_38 () Real)
(declare-fun sc_39 () Real)
(assert (> sc_39 1e-08))
(declare-fun of_39 () Real)
(declare-fun sc_40 () Real)
(assert (> sc_40 1e-08))
(declare-fun of_40 () Real)
; no offset
(assert (= of_37 0.))
; no offset
(assert (= of_38 0.))
; 
; =  {(sc.switch[2].SUB/sc.switch[2].Kmod)} {1.}
(assert (= (/ sc_37 sc_38) 1.))
; no scale
(assert (= (/ sc_37 sc_38) 1.))
; no scale
(assert (= sc_36 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_36 0.))
; no offset
(assert (= of_39 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.switch[2].PROD} {(sc.switch[2].Vmax/1.)}
(assert (= sc_40 (/ sc_39 1.)))
; 
; =  {of.switch[2].PROD} {0.}
(assert (= of_40 0.))
(declare-fun slbot_37 () Real)
(declare-fun sltop_37 () Real)
; 
; =  {(((sc.switch[2].SUB*0.)+of.switch[2].SUB)+sl.min.switch[2].SUB)} {0.0001}
(assert (= (+ (+ (* sc_37 0.) of_37) slbot_37) 0.0001))
; 
; =  {(((sc.switch[2].SUB*1.)+of.switch[2].SUB)+sl.max.switch[2].SUB)} {10.}
(assert (= (+ (+ (* sc_37 1.) of_37) sltop_37) 10.))
; 
; >=  {((sc.switch[2].n*2.0015)+of.switch[2].n)} {3300.}
(assert (<= (+ (* sc_36 2.0015) of_36) 3300.))
; 
; <=  {((sc.switch[2].n*2.0015)+of.switch[2].n)} {0.5}
(assert (>= (+ (* sc_36 2.0015) of_36) 0.5))
; 
; >=  {((sc.switch[2].Kmod*2.9618e-05)+of.switch[2].Kmod)} {10.}
(assert (<= (+ (* sc_38 2.9618e-05) of_38) 10.))
; 
; <=  {((sc.switch[2].Kmod*2.9618e-05)+of.switch[2].Kmod)} {1.}
(assert (>= (+ (* sc_38 2.9618e-05) of_38) 1.))
(declare-fun slbot_40 () Real)
(declare-fun sltop_40 () Real)
; 
; =  {(((sc.switch[2].PROD*0.)+of.switch[2].PROD)+sl.min.switch[2].PROD)} {0.}
(assert (= (+ (+ (* sc_40 0.) of_40) slbot_40) 0.))
; 
; =  {(((sc.switch[2].PROD*15.6)+of.switch[2].PROD)+sl.max.switch[2].PROD)} {9.99995000037}
(assert (= (+ (+ (* sc_40 15.6) of_40) sltop_40) 9.99995000037))
(declare-fun slbot_39 () Real)
(declare-fun sltop_39 () Real)
; 
; =  {(((sc.switch[2].Vmax*0.)+of.switch[2].Vmax)+sl.min.switch[2].Vmax)} {0.0001}
(assert (= (+ (+ (* sc_39 0.) of_39) slbot_39) 0.0001))
; 
; =  {(((sc.switch[2].Vmax*15.6)+of.switch[2].Vmax)+sl.max.switch[2].Vmax)} {10.}
(assert (= (+ (+ (* sc_39 15.6) of_39) sltop_39) 10.))
(declare-fun slbot_40 () Real)
(declare-fun sltop_40 () Real)
; 
; =  {(((sc.switch[2].PROD*0.)+of.switch[2].PROD)+sl.min.switch[2].PROD)} {0.}
(assert (= (+ (+ (* sc_40 0.) of_40) slbot_40) 0.))
; 
; =  {(((sc.switch[2].PROD*15.6)+of.switch[2].PROD)+sl.max.switch[2].PROD)} {9.99995000037}
(assert (= (+ (+ (* sc_40 15.6) of_40) sltop_40) 9.99995000037))
(declare-fun sc_41 () Real)
(assert (> sc_41 1e-08))
(declare-fun of_41 () Real)
(declare-fun sc_42 () Real)
(assert (> sc_42 1e-08))
(declare-fun of_42 () Real)
(declare-fun sc_43 () Real)
(assert (> sc_43 1e-08))
(declare-fun of_43 () Real)
(declare-fun sc_44 () Real)
(assert (> sc_44 1e-08))
(declare-fun of_44 () Real)
(declare-fun sc_45 () Real)
(assert (> sc_45 1e-08))
(declare-fun of_45 () Real)
; no offset
(assert (= of_42 0.))
; no offset
(assert (= of_43 0.))
; 
; =  {(sc.switch[25].SUB/sc.switch[25].Kmod)} {1.}
(assert (= (/ sc_42 sc_43) 1.))
; no scale
(assert (= (/ sc_42 sc_43) 1.))
; no scale
(assert (= sc_41 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_41 0.))
; no offset
(assert (= of_44 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.switch[25].PROD} {(sc.switch[25].Vmax/1.)}
(assert (= sc_45 (/ sc_44 1.)))
; 
; =  {of.switch[25].PROD} {0.}
(assert (= of_45 0.))
; 
; >=  {((sc.switch[25].n*2.5)+of.switch[25].n)} {3300.}
(assert (<= (+ (* sc_41 2.5) of_41) 3300.))
; 
; <=  {((sc.switch[25].n*2.5)+of.switch[25].n)} {0.5}
(assert (>= (+ (* sc_41 2.5) of_41) 0.5))
(declare-fun slbot_42 () Real)
(declare-fun sltop_42 () Real)
; 
; =  {(((sc.switch[25].SUB*-0.5)+of.switch[25].SUB)+sl.min.switch[25].SUB)} {0.0001}
(assert (= (+ (+ (* sc_42 -0.5) of_42) slbot_42) 0.0001))
; 
; =  {(((sc.switch[25].SUB*0.)+of.switch[25].SUB)+sl.max.switch[25].SUB)} {10.}
(assert (= (+ (+ (* sc_42 0.) of_42) sltop_42) 10.))
; 
; >=  {((sc.switch[25].Kmod*1.)+of.switch[25].Kmod)} {10.}
(assert (<= (+ (* sc_43 1.) of_43) 10.))
; 
; <=  {((sc.switch[25].Kmod*1.)+of.switch[25].Kmod)} {1.}
(assert (>= (+ (* sc_43 1.) of_43) 1.))
(declare-fun slbot_45 () Real)
(declare-fun sltop_45 () Real)
; 
; =  {(((sc.switch[25].PROD*1.)+of.switch[25].PROD)+sl.min.switch[25].PROD)} {0.}
(assert (= (+ (+ (* sc_45 1.) of_45) slbot_45) 0.))
; 
; =  {(((sc.switch[25].PROD*5.65685424949)+of.switch[25].PROD)+sl.max.switch[25].PROD)} {9.99995000037}
(assert (= (+ (+ (* sc_45 5.65685424949) of_45) sltop_45) 9.99995000037))
; 
; >=  {((sc.switch[25].Vmax*1.)+of.switch[25].Vmax)} {10.}
(assert (<= (+ (* sc_44 1.) of_44) 10.))
; 
; <=  {((sc.switch[25].Vmax*1.)+of.switch[25].Vmax)} {0.0001}
(assert (>= (+ (* sc_44 1.) of_44) 0.0001))
(declare-fun slbot_45 () Real)
(declare-fun sltop_45 () Real)
; 
; =  {(((sc.switch[25].PROD*1.)+of.switch[25].PROD)+sl.min.switch[25].PROD)} {0.}
(assert (= (+ (+ (* sc_45 1.) of_45) slbot_45) 0.))
; 
; =  {(((sc.switch[25].PROD*5.65685424949)+of.switch[25].PROD)+sl.max.switch[25].PROD)} {9.99995000037}
(assert (= (+ (+ (* sc_45 5.65685424949) of_45) sltop_45) 9.99995000037))
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
(declare-fun sc_50 () Real)
(assert (> sc_50 1e-08))
(declare-fun of_50 () Real)
; no offset
(assert (= of_47 0.))
; no offset
(assert (= of_48 0.))
; 
; =  {(sc.switch[32].SUB/sc.switch[32].Kmod)} {1.}
(assert (= (/ sc_47 sc_48) 1.))
; no scale
(assert (= (/ sc_47 sc_48) 1.))
; no scale
(assert (= sc_46 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_46 0.))
; no offset
(assert (= of_49 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.switch[32].PROD} {(sc.switch[32].Vmax/1.)}
(assert (= sc_50 (/ sc_49 1.)))
; 
; =  {of.switch[32].PROD} {0.}
(assert (= of_50 0.))
; 
; >=  {((sc.switch[32].n*2.5)+of.switch[32].n)} {3300.}
(assert (<= (+ (* sc_46 2.5) of_46) 3300.))
; 
; <=  {((sc.switch[32].n*2.5)+of.switch[32].n)} {0.5}
(assert (>= (+ (* sc_46 2.5) of_46) 0.5))
(declare-fun slbot_47 () Real)
(declare-fun sltop_47 () Real)
; 
; =  {(((sc.switch[32].SUB*-1.)+of.switch[32].SUB)+sl.min.switch[32].SUB)} {0.0001}
(assert (= (+ (+ (* sc_47 -1.) of_47) slbot_47) 0.0001))
; 
; =  {(((sc.switch[32].SUB*155.25)+of.switch[32].SUB)+sl.max.switch[32].SUB)} {10.}
(assert (= (+ (+ (* sc_47 155.25) of_47) sltop_47) 10.))
; 
; >=  {((sc.switch[32].Kmod*1.)+of.switch[32].Kmod)} {10.}
(assert (<= (+ (* sc_48 1.) of_48) 10.))
; 
; <=  {((sc.switch[32].Kmod*1.)+of.switch[32].Kmod)} {1.}
(assert (>= (+ (* sc_48 1.) of_48) 1.))
(declare-fun slbot_50 () Real)
(declare-fun sltop_50 () Real)
; 
; =  {(((sc.switch[32].PROD*0.)+of.switch[32].PROD)+sl.min.switch[32].PROD)} {0.}
(assert (= (+ (+ (* sc_50 0.) of_50) slbot_50) 0.))
; 
; =  {(((sc.switch[32].PROD*3.2768e-06)+of.switch[32].PROD)+sl.max.switch[32].PROD)} {9.99995000037}
(assert (= (+ (+ (* sc_50 3.2768e-06) of_50) sltop_50) 9.99995000037))
; 
; >=  {((sc.switch[32].Vmax*1.)+of.switch[32].Vmax)} {10.}
(assert (<= (+ (* sc_49 1.) of_49) 10.))
; 
; <=  {((sc.switch[32].Vmax*1.)+of.switch[32].Vmax)} {0.0001}
(assert (>= (+ (* sc_49 1.) of_49) 0.0001))
(declare-fun slbot_50 () Real)
(declare-fun sltop_50 () Real)
; 
; =  {(((sc.switch[32].PROD*0.)+of.switch[32].PROD)+sl.min.switch[32].PROD)} {0.}
(assert (= (+ (+ (* sc_50 0.) of_50) slbot_50) 0.))
; 
; =  {(((sc.switch[32].PROD*3.2768e-06)+of.switch[32].PROD)+sl.max.switch[32].PROD)} {9.99995000037}
(assert (= (+ (+ (* sc_50 3.2768e-06) of_50) sltop_50) 9.99995000037))
(declare-fun sc_51 () Real)
(assert (> sc_51 1e-08))
(declare-fun of_51 () Real)
(declare-fun sc_52 () Real)
(assert (> sc_52 1e-08))
(declare-fun of_52 () Real)
; 
; =  {sc.input.I[2].O} {sc.input.I[2].X}
(assert (= sc_52 sc_51))
; 
; =  {of.input.I[2].O} {of.input.I[2].X}
(assert (= of_52 of_51))
(declare-fun slbot_51 () Real)
(declare-fun sltop_51 () Real)
; 
; =  {(((sc.input.I[2].X*0.5)+of.input.I[2].X)+sl.min.input.I[2].X)} {0.}
(assert (= (+ (+ (* sc_51 0.5) of_51) slbot_51) 0.))
; 
; =  {(((sc.input.I[2].X*1.)+of.input.I[2].X)+sl.max.input.I[2].X)} {10.}
(assert (= (+ (+ (* sc_51 1.) of_51) sltop_51) 10.))
(declare-fun slbot_52 () Real)
(declare-fun sltop_52 () Real)
; 
; =  {(((sc.input.I[2].O*0.5)+of.input.I[2].O)+sl.min.input.I[2].O)} {0.}
(assert (= (+ (+ (* sc_52 0.5) of_52) slbot_52) 0.))
; 
; =  {(((sc.input.I[2].O*1.)+of.input.I[2].O)+sl.max.input.I[2].O)} {10.}
(assert (= (+ (+ (* sc_52 1.) of_52) sltop_52) 10.))
(declare-fun sc_53 () Real)
(assert (> sc_53 1e-08))
(declare-fun of_53 () Real)
(declare-fun sc_54 () Real)
(assert (> sc_54 1e-08))
(declare-fun of_54 () Real)
; 
; =  {sc.input.I[20].O} {sc.input.I[20].X}
(assert (= sc_54 sc_53))
; 
; =  {of.input.I[20].O} {of.input.I[20].X}
(assert (= of_54 of_53))
; 
; >=  {((sc.input.I[20].X*0.)+of.input.I[20].X)} {10.}
(assert (<= (+ (* sc_53 0.) of_53) 10.))
; 
; <=  {((sc.input.I[20].X*0.)+of.input.I[20].X)} {0.}
(assert (>= (+ (* sc_53 0.) of_53) 0.))
; 
; >=  {((sc.input.I[20].O*0.)+of.input.I[20].O)} {10.}
(assert (<= (+ (* sc_54 0.) of_54) 10.))
; 
; <=  {((sc.input.I[20].O*0.)+of.input.I[20].O)} {0.}
(assert (>= (+ (* sc_54 0.) of_54) 0.))
(declare-fun sc_55 () Real)
(assert (> sc_55 1e-08))
(declare-fun of_55 () Real)
(declare-fun sc_56 () Real)
(assert (> sc_56 1e-08))
(declare-fun of_56 () Real)
; 
; =  {sc.input.I[29].O} {sc.input.I[29].X}
(assert (= sc_56 sc_55))
; 
; =  {of.input.I[29].O} {of.input.I[29].X}
(assert (= of_56 of_55))
; 
; >=  {((sc.input.I[29].X*1.)+of.input.I[29].X)} {10.}
(assert (<= (+ (* sc_55 1.) of_55) 10.))
; 
; <=  {((sc.input.I[29].X*1.)+of.input.I[29].X)} {0.}
(assert (>= (+ (* sc_55 1.) of_55) 0.))
; 
; >=  {((sc.input.I[29].O*1.)+of.input.I[29].O)} {10.}
(assert (<= (+ (* sc_56 1.) of_56) 10.))
; 
; <=  {((sc.input.I[29].O*1.)+of.input.I[29].O)} {0.}
(assert (>= (+ (* sc_56 1.) of_56) 0.))
(declare-fun sc_57 () Real)
(assert (> sc_57 1e-08))
(declare-fun of_57 () Real)
(declare-fun sc_58 () Real)
(assert (> sc_58 1e-08))
(declare-fun of_58 () Real)
; 
; =  {sc.input.I[8].O} {sc.input.I[8].X}
(assert (= sc_58 sc_57))
; 
; =  {of.input.I[8].O} {of.input.I[8].X}
(assert (= of_58 of_57))
; 
; >=  {((sc.input.I[8].X*0.)+of.input.I[8].X)} {10.}
(assert (<= (+ (* sc_57 0.) of_57) 10.))
; 
; <=  {((sc.input.I[8].X*0.)+of.input.I[8].X)} {0.}
(assert (>= (+ (* sc_57 0.) of_57) 0.))
; 
; >=  {((sc.input.I[8].O*0.)+of.input.I[8].O)} {10.}
(assert (<= (+ (* sc_58 0.) of_58) 10.))
; 
; <=  {((sc.input.I[8].O*0.)+of.input.I[8].O)} {0.}
(assert (>= (+ (* sc_58 0.) of_58) 0.))
(declare-fun sc_59 () Real)
(assert (> sc_59 1e-08))
(declare-fun of_59 () Real)
(declare-fun sc_60 () Real)
(assert (> sc_60 1e-08))
(declare-fun of_60 () Real)
; 
; =  {sc.input.I[7].O} {sc.input.I[7].X}
(assert (= sc_60 sc_59))
; 
; =  {of.input.I[7].O} {of.input.I[7].X}
(assert (= of_60 of_59))
; 
; >=  {((sc.input.I[7].X*0.)+of.input.I[7].X)} {10.}
(assert (<= (+ (* sc_59 0.) of_59) 10.))
; 
; <=  {((sc.input.I[7].X*0.)+of.input.I[7].X)} {0.}
(assert (>= (+ (* sc_59 0.) of_59) 0.))
; 
; >=  {((sc.input.I[7].O*0.)+of.input.I[7].O)} {10.}
(assert (<= (+ (* sc_60 0.) of_60) 10.))
; 
; <=  {((sc.input.I[7].O*0.)+of.input.I[7].O)} {0.}
(assert (>= (+ (* sc_60 0.) of_60) 0.))
(declare-fun sc_61 () Real)
(assert (> sc_61 1e-08))
(declare-fun of_61 () Real)
(declare-fun sc_62 () Real)
(assert (> sc_62 1e-08))
(declare-fun of_62 () Real)
; 
; =  {sc.input.I[13].O} {sc.input.I[13].X}
(assert (= sc_62 sc_61))
; 
; =  {of.input.I[13].O} {of.input.I[13].X}
(assert (= of_62 of_61))
; 
; >=  {((sc.input.I[13].X*0.)+of.input.I[13].X)} {10.}
(assert (<= (+ (* sc_61 0.) of_61) 10.))
; 
; <=  {((sc.input.I[13].X*0.)+of.input.I[13].X)} {0.}
(assert (>= (+ (* sc_61 0.) of_61) 0.))
; 
; >=  {((sc.input.I[13].O*0.)+of.input.I[13].O)} {10.}
(assert (<= (+ (* sc_62 0.) of_62) 10.))
; 
; <=  {((sc.input.I[13].O*0.)+of.input.I[13].O)} {0.}
(assert (>= (+ (* sc_62 0.) of_62) 0.))
(declare-fun sc_63 () Real)
(assert (> sc_63 1e-08))
(declare-fun of_63 () Real)
(declare-fun sc_64 () Real)
(assert (> sc_64 1e-08))
(declare-fun of_64 () Real)
; 
; =  {sc.input.I[12].O} {sc.input.I[12].X}
(assert (= sc_64 sc_63))
; 
; =  {of.input.I[12].O} {of.input.I[12].X}
(assert (= of_64 of_63))
; 
; >=  {((sc.input.I[12].X*0.)+of.input.I[12].X)} {10.}
(assert (<= (+ (* sc_63 0.) of_63) 10.))
; 
; <=  {((sc.input.I[12].X*0.)+of.input.I[12].X)} {0.}
(assert (>= (+ (* sc_63 0.) of_63) 0.))
; 
; >=  {((sc.input.I[12].O*0.)+of.input.I[12].O)} {10.}
(assert (<= (+ (* sc_64 0.) of_64) 10.))
; 
; <=  {((sc.input.I[12].O*0.)+of.input.I[12].O)} {0.}
(assert (>= (+ (* sc_64 0.) of_64) 0.))
(declare-fun sc_65 () Real)
(assert (> sc_65 1e-08))
(declare-fun of_65 () Real)
(declare-fun sc_66 () Real)
(assert (> sc_66 1e-08))
(declare-fun of_66 () Real)
; 
; =  {sc.input.I[9].O} {sc.input.I[9].X}
(assert (= sc_66 sc_65))
; 
; =  {of.input.I[9].O} {of.input.I[9].X}
(assert (= of_66 of_65))
; 
; >=  {((sc.input.I[9].X*0.)+of.input.I[9].X)} {10.}
(assert (<= (+ (* sc_65 0.) of_65) 10.))
; 
; <=  {((sc.input.I[9].X*0.)+of.input.I[9].X)} {0.}
(assert (>= (+ (* sc_65 0.) of_65) 0.))
; 
; >=  {((sc.input.I[9].O*0.)+of.input.I[9].O)} {10.}
(assert (<= (+ (* sc_66 0.) of_66) 10.))
; 
; <=  {((sc.input.I[9].O*0.)+of.input.I[9].O)} {0.}
(assert (>= (+ (* sc_66 0.) of_66) 0.))
(declare-fun sc_67 () Real)
(assert (> sc_67 1e-08))
(declare-fun of_67 () Real)
(declare-fun sc_68 () Real)
(assert (> sc_68 1e-08))
(declare-fun of_68 () Real)
; 
; =  {sc.input.I[31].O} {sc.input.I[31].X}
(assert (= sc_68 sc_67))
; 
; =  {of.input.I[31].O} {of.input.I[31].X}
(assert (= of_68 of_67))
; 
; >=  {((sc.input.I[31].X*1.)+of.input.I[31].X)} {10.}
(assert (<= (+ (* sc_67 1.) of_67) 10.))
; 
; <=  {((sc.input.I[31].X*1.)+of.input.I[31].X)} {0.}
(assert (>= (+ (* sc_67 1.) of_67) 0.))
; 
; >=  {((sc.input.I[31].O*1.)+of.input.I[31].O)} {10.}
(assert (<= (+ (* sc_68 1.) of_68) 10.))
; 
; <=  {((sc.input.I[31].O*1.)+of.input.I[31].O)} {0.}
(assert (>= (+ (* sc_68 1.) of_68) 0.))
(declare-fun sc_69 () Real)
(assert (> sc_69 1e-08))
(declare-fun of_69 () Real)
(declare-fun sc_70 () Real)
(assert (> sc_70 1e-08))
(declare-fun of_70 () Real)
; 
; =  {sc.input.I[0].O} {sc.input.I[0].X}
(assert (= sc_70 sc_69))
; 
; =  {of.input.I[0].O} {of.input.I[0].X}
(assert (= of_70 of_69))
(declare-fun slbot_69 () Real)
(declare-fun sltop_69 () Real)
; 
; =  {(((sc.input.I[0].X*0.)+of.input.I[0].X)+sl.min.input.I[0].X)} {0.}
(assert (= (+ (+ (* sc_69 0.) of_69) slbot_69) 0.))
; 
; =  {(((sc.input.I[0].X*1.)+of.input.I[0].X)+sl.max.input.I[0].X)} {10.}
(assert (= (+ (+ (* sc_69 1.) of_69) sltop_69) 10.))
(declare-fun slbot_70 () Real)
(declare-fun sltop_70 () Real)
; 
; =  {(((sc.input.I[0].O*0.)+of.input.I[0].O)+sl.min.input.I[0].O)} {0.}
(assert (= (+ (+ (* sc_70 0.) of_70) slbot_70) 0.))
; 
; =  {(((sc.input.I[0].O*1.)+of.input.I[0].O)+sl.max.input.I[0].O)} {10.}
(assert (= (+ (+ (* sc_70 1.) of_70) sltop_70) 10.))
(declare-fun sc_71 () Real)
(assert (> sc_71 1e-08))
(declare-fun of_71 () Real)
(declare-fun sc_72 () Real)
(assert (> sc_72 1e-08))
(declare-fun of_72 () Real)
; 
; =  {sc.input.I[11].O} {sc.input.I[11].X}
(assert (= sc_72 sc_71))
; 
; =  {of.input.I[11].O} {of.input.I[11].X}
(assert (= of_72 of_71))
; 
; >=  {((sc.input.I[11].X*0.)+of.input.I[11].X)} {10.}
(assert (<= (+ (* sc_71 0.) of_71) 10.))
; 
; <=  {((sc.input.I[11].X*0.)+of.input.I[11].X)} {0.}
(assert (>= (+ (* sc_71 0.) of_71) 0.))
; 
; >=  {((sc.input.I[11].O*0.)+of.input.I[11].O)} {10.}
(assert (<= (+ (* sc_72 0.) of_72) 10.))
; 
; <=  {((sc.input.I[11].O*0.)+of.input.I[11].O)} {0.}
(assert (>= (+ (* sc_72 0.) of_72) 0.))
(declare-fun sc_73 () Real)
(assert (> sc_73 1e-08))
(declare-fun of_73 () Real)
(declare-fun sc_74 () Real)
(assert (> sc_74 1e-08))
(declare-fun of_74 () Real)
; 
; =  {sc.input.I[10].O} {sc.input.I[10].X}
(assert (= sc_74 sc_73))
; 
; =  {of.input.I[10].O} {of.input.I[10].X}
(assert (= of_74 of_73))
; 
; >=  {((sc.input.I[10].X*0.)+of.input.I[10].X)} {10.}
(assert (<= (+ (* sc_73 0.) of_73) 10.))
; 
; <=  {((sc.input.I[10].X*0.)+of.input.I[10].X)} {0.}
(assert (>= (+ (* sc_73 0.) of_73) 0.))
; 
; >=  {((sc.input.I[10].O*0.)+of.input.I[10].O)} {10.}
(assert (<= (+ (* sc_74 0.) of_74) 10.))
; 
; <=  {((sc.input.I[10].O*0.)+of.input.I[10].O)} {0.}
(assert (>= (+ (* sc_74 0.) of_74) 0.))
(declare-fun sc_75 () Real)
(assert (> sc_75 1e-08))
(declare-fun of_75 () Real)
(declare-fun sc_76 () Real)
(assert (> sc_76 1e-08))
(declare-fun of_76 () Real)
; 
; =  {sc.input.I[26].O} {sc.input.I[26].X}
(assert (= sc_76 sc_75))
; 
; =  {of.input.I[26].O} {of.input.I[26].X}
(assert (= of_76 of_75))
; 
; >=  {((sc.input.I[26].X*1.)+of.input.I[26].X)} {10.}
(assert (<= (+ (* sc_75 1.) of_75) 10.))
; 
; <=  {((sc.input.I[26].X*1.)+of.input.I[26].X)} {0.}
(assert (>= (+ (* sc_75 1.) of_75) 0.))
; 
; >=  {((sc.input.I[26].O*1.)+of.input.I[26].O)} {10.}
(assert (<= (+ (* sc_76 1.) of_76) 10.))
; 
; <=  {((sc.input.I[26].O*1.)+of.input.I[26].O)} {0.}
(assert (>= (+ (* sc_76 1.) of_76) 0.))
(declare-fun sc_77 () Real)
(assert (> sc_77 1e-08))
(declare-fun of_77 () Real)
(declare-fun sc_78 () Real)
(assert (> sc_78 1e-08))
(declare-fun of_78 () Real)
; 
; =  {sc.input.I[27].O} {sc.input.I[27].X}
(assert (= sc_78 sc_77))
; 
; =  {of.input.I[27].O} {of.input.I[27].X}
(assert (= of_78 of_77))
; 
; >=  {((sc.input.I[27].X*1.)+of.input.I[27].X)} {10.}
(assert (<= (+ (* sc_77 1.) of_77) 10.))
; 
; <=  {((sc.input.I[27].X*1.)+of.input.I[27].X)} {0.}
(assert (>= (+ (* sc_77 1.) of_77) 0.))
; 
; >=  {((sc.input.I[27].O*1.)+of.input.I[27].O)} {10.}
(assert (<= (+ (* sc_78 1.) of_78) 10.))
; 
; <=  {((sc.input.I[27].O*1.)+of.input.I[27].O)} {0.}
(assert (>= (+ (* sc_78 1.) of_78) 0.))
(declare-fun sc_79 () Real)
(assert (> sc_79 1e-08))
(declare-fun of_79 () Real)
(declare-fun sc_80 () Real)
(assert (> sc_80 1e-08))
(declare-fun of_80 () Real)
; 
; =  {sc.input.I[15].O} {sc.input.I[15].X}
(assert (= sc_80 sc_79))
; 
; =  {of.input.I[15].O} {of.input.I[15].X}
(assert (= of_80 of_79))
; 
; >=  {((sc.input.I[15].X*0.)+of.input.I[15].X)} {10.}
(assert (<= (+ (* sc_79 0.) of_79) 10.))
; 
; <=  {((sc.input.I[15].X*0.)+of.input.I[15].X)} {0.}
(assert (>= (+ (* sc_79 0.) of_79) 0.))
; 
; >=  {((sc.input.I[15].O*0.)+of.input.I[15].O)} {10.}
(assert (<= (+ (* sc_80 0.) of_80) 10.))
; 
; <=  {((sc.input.I[15].O*0.)+of.input.I[15].O)} {0.}
(assert (>= (+ (* sc_80 0.) of_80) 0.))
(declare-fun sc_81 () Real)
(assert (> sc_81 1e-08))
(declare-fun of_81 () Real)
(declare-fun sc_82 () Real)
(assert (> sc_82 1e-08))
(declare-fun of_82 () Real)
; 
; =  {sc.input.I[6].O} {sc.input.I[6].X}
(assert (= sc_82 sc_81))
; 
; =  {of.input.I[6].O} {of.input.I[6].X}
(assert (= of_82 of_81))
; 
; >=  {((sc.input.I[6].X*0.)+of.input.I[6].X)} {10.}
(assert (<= (+ (* sc_81 0.) of_81) 10.))
; 
; <=  {((sc.input.I[6].X*0.)+of.input.I[6].X)} {0.}
(assert (>= (+ (* sc_81 0.) of_81) 0.))
; 
; >=  {((sc.input.I[6].O*0.)+of.input.I[6].O)} {10.}
(assert (<= (+ (* sc_82 0.) of_82) 10.))
; 
; <=  {((sc.input.I[6].O*0.)+of.input.I[6].O)} {0.}
(assert (>= (+ (* sc_82 0.) of_82) 0.))
(declare-fun sc_83 () Real)
(assert (> sc_83 1e-08))
(declare-fun of_83 () Real)
(declare-fun sc_84 () Real)
(assert (> sc_84 1e-08))
(declare-fun of_84 () Real)
; 
; =  {sc.input.I[14].O} {sc.input.I[14].X}
(assert (= sc_84 sc_83))
; 
; =  {of.input.I[14].O} {of.input.I[14].X}
(assert (= of_84 of_83))
; 
; >=  {((sc.input.I[14].X*0.)+of.input.I[14].X)} {10.}
(assert (<= (+ (* sc_83 0.) of_83) 10.))
; 
; <=  {((sc.input.I[14].X*0.)+of.input.I[14].X)} {0.}
(assert (>= (+ (* sc_83 0.) of_83) 0.))
; 
; >=  {((sc.input.I[14].O*0.)+of.input.I[14].O)} {10.}
(assert (<= (+ (* sc_84 0.) of_84) 10.))
; 
; <=  {((sc.input.I[14].O*0.)+of.input.I[14].O)} {0.}
(assert (>= (+ (* sc_84 0.) of_84) 0.))
(declare-fun sc_85 () Real)
(assert (> sc_85 1e-08))
(declare-fun of_85 () Real)
(declare-fun sc_86 () Real)
(assert (> sc_86 1e-08))
(declare-fun of_86 () Real)
; 
; =  {sc.input.I[21].O} {sc.input.I[21].X}
(assert (= sc_86 sc_85))
; 
; =  {of.input.I[21].O} {of.input.I[21].X}
(assert (= of_86 of_85))
; 
; >=  {((sc.input.I[21].X*0.)+of.input.I[21].X)} {10.}
(assert (<= (+ (* sc_85 0.) of_85) 10.))
; 
; <=  {((sc.input.I[21].X*0.)+of.input.I[21].X)} {0.}
(assert (>= (+ (* sc_85 0.) of_85) 0.))
; 
; >=  {((sc.input.I[21].O*0.)+of.input.I[21].O)} {10.}
(assert (<= (+ (* sc_86 0.) of_86) 10.))
; 
; <=  {((sc.input.I[21].O*0.)+of.input.I[21].O)} {0.}
(assert (>= (+ (* sc_86 0.) of_86) 0.))
(declare-fun sc_87 () Real)
(assert (> sc_87 1e-08))
(declare-fun of_87 () Real)
(declare-fun sc_88 () Real)
(assert (> sc_88 1e-08))
(declare-fun of_88 () Real)
; 
; =  {sc.input.I[16].O} {sc.input.I[16].X}
(assert (= sc_88 sc_87))
; 
; =  {of.input.I[16].O} {of.input.I[16].X}
(assert (= of_88 of_87))
; 
; >=  {((sc.input.I[16].X*0.)+of.input.I[16].X)} {10.}
(assert (<= (+ (* sc_87 0.) of_87) 10.))
; 
; <=  {((sc.input.I[16].X*0.)+of.input.I[16].X)} {0.}
(assert (>= (+ (* sc_87 0.) of_87) 0.))
; 
; >=  {((sc.input.I[16].O*0.)+of.input.I[16].O)} {10.}
(assert (<= (+ (* sc_88 0.) of_88) 10.))
; 
; <=  {((sc.input.I[16].O*0.)+of.input.I[16].O)} {0.}
(assert (>= (+ (* sc_88 0.) of_88) 0.))
(declare-fun sc_89 () Real)
(assert (> sc_89 1e-08))
(declare-fun of_89 () Real)
(declare-fun sc_90 () Real)
(assert (> sc_90 1e-08))
(declare-fun of_90 () Real)
; 
; =  {sc.input.I[24].O} {sc.input.I[24].X}
(assert (= sc_90 sc_89))
; 
; =  {of.input.I[24].O} {of.input.I[24].X}
(assert (= of_90 of_89))
; 
; >=  {((sc.input.I[24].X*0.)+of.input.I[24].X)} {10.}
(assert (<= (+ (* sc_89 0.) of_89) 10.))
; 
; <=  {((sc.input.I[24].X*0.)+of.input.I[24].X)} {0.}
(assert (>= (+ (* sc_89 0.) of_89) 0.))
; 
; >=  {((sc.input.I[24].O*0.)+of.input.I[24].O)} {10.}
(assert (<= (+ (* sc_90 0.) of_90) 10.))
; 
; <=  {((sc.input.I[24].O*0.)+of.input.I[24].O)} {0.}
(assert (>= (+ (* sc_90 0.) of_90) 0.))
(declare-fun sc_91 () Real)
(assert (> sc_91 1e-08))
(declare-fun of_91 () Real)
(declare-fun sc_92 () Real)
(assert (> sc_92 1e-08))
(declare-fun of_92 () Real)
; 
; =  {sc.input.I[3].O} {sc.input.I[3].X}
(assert (= sc_92 sc_91))
; 
; =  {of.input.I[3].O} {of.input.I[3].X}
(assert (= of_92 of_91))
(declare-fun slbot_91 () Real)
(declare-fun sltop_91 () Real)
; 
; =  {(((sc.input.I[3].X*0.5)+of.input.I[3].X)+sl.min.input.I[3].X)} {0.}
(assert (= (+ (+ (* sc_91 0.5) of_91) slbot_91) 0.))
; 
; =  {(((sc.input.I[3].X*1.)+of.input.I[3].X)+sl.max.input.I[3].X)} {10.}
(assert (= (+ (+ (* sc_91 1.) of_91) sltop_91) 10.))
(declare-fun slbot_92 () Real)
(declare-fun sltop_92 () Real)
; 
; =  {(((sc.input.I[3].O*0.5)+of.input.I[3].O)+sl.min.input.I[3].O)} {0.}
(assert (= (+ (+ (* sc_92 0.5) of_92) slbot_92) 0.))
; 
; =  {(((sc.input.I[3].O*1.)+of.input.I[3].O)+sl.max.input.I[3].O)} {10.}
(assert (= (+ (+ (* sc_92 1.) of_92) sltop_92) 10.))
(declare-fun sc_93 () Real)
(assert (> sc_93 1e-08))
(declare-fun of_93 () Real)
(declare-fun sc_94 () Real)
(assert (> sc_94 1e-08))
(declare-fun of_94 () Real)
; 
; =  {sc.input.I[30].O} {sc.input.I[30].X}
(assert (= sc_94 sc_93))
; 
; =  {of.input.I[30].O} {of.input.I[30].X}
(assert (= of_94 of_93))
; 
; >=  {((sc.input.I[30].X*1.)+of.input.I[30].X)} {10.}
(assert (<= (+ (* sc_93 1.) of_93) 10.))
; 
; <=  {((sc.input.I[30].X*1.)+of.input.I[30].X)} {0.}
(assert (>= (+ (* sc_93 1.) of_93) 0.))
; 
; >=  {((sc.input.I[30].O*1.)+of.input.I[30].O)} {10.}
(assert (<= (+ (* sc_94 1.) of_94) 10.))
; 
; <=  {((sc.input.I[30].O*1.)+of.input.I[30].O)} {0.}
(assert (>= (+ (* sc_94 1.) of_94) 0.))
(declare-fun sc_95 () Real)
(assert (> sc_95 1e-08))
(declare-fun of_95 () Real)
(declare-fun sc_96 () Real)
(assert (> sc_96 1e-08))
(declare-fun of_96 () Real)
; 
; =  {sc.input.I[4].O} {sc.input.I[4].X}
(assert (= sc_96 sc_95))
; 
; =  {of.input.I[4].O} {of.input.I[4].X}
(assert (= of_96 of_95))
; 
; >=  {((sc.input.I[4].X*0.)+of.input.I[4].X)} {10.}
(assert (<= (+ (* sc_95 0.) of_95) 10.))
; 
; <=  {((sc.input.I[4].X*0.)+of.input.I[4].X)} {0.}
(assert (>= (+ (* sc_95 0.) of_95) 0.))
; 
; >=  {((sc.input.I[4].O*0.)+of.input.I[4].O)} {10.}
(assert (<= (+ (* sc_96 0.) of_96) 10.))
; 
; <=  {((sc.input.I[4].O*0.)+of.input.I[4].O)} {0.}
(assert (>= (+ (* sc_96 0.) of_96) 0.))
(declare-fun sc_97 () Real)
(assert (> sc_97 1e-08))
(declare-fun of_97 () Real)
(declare-fun sc_98 () Real)
(assert (> sc_98 1e-08))
(declare-fun of_98 () Real)
; 
; =  {sc.input.I[5].O} {sc.input.I[5].X}
(assert (= sc_98 sc_97))
; 
; =  {of.input.I[5].O} {of.input.I[5].X}
(assert (= of_98 of_97))
; 
; >=  {((sc.input.I[5].X*0.)+of.input.I[5].X)} {10.}
(assert (<= (+ (* sc_97 0.) of_97) 10.))
; 
; <=  {((sc.input.I[5].X*0.)+of.input.I[5].X)} {0.}
(assert (>= (+ (* sc_97 0.) of_97) 0.))
; 
; >=  {((sc.input.I[5].O*0.)+of.input.I[5].O)} {10.}
(assert (<= (+ (* sc_98 0.) of_98) 10.))
; 
; <=  {((sc.input.I[5].O*0.)+of.input.I[5].O)} {0.}
(assert (>= (+ (* sc_98 0.) of_98) 0.))
(declare-fun sc_99 () Real)
(assert (> sc_99 1e-08))
(declare-fun of_99 () Real)
(declare-fun sc_100 () Real)
(assert (> sc_100 1e-08))
(declare-fun of_100 () Real)
; 
; =  {sc.input.I[23].O} {sc.input.I[23].X}
(assert (= sc_100 sc_99))
; 
; =  {of.input.I[23].O} {of.input.I[23].X}
(assert (= of_100 of_99))
; 
; >=  {((sc.input.I[23].X*0.)+of.input.I[23].X)} {10.}
(assert (<= (+ (* sc_99 0.) of_99) 10.))
; 
; <=  {((sc.input.I[23].X*0.)+of.input.I[23].X)} {0.}
(assert (>= (+ (* sc_99 0.) of_99) 0.))
; 
; >=  {((sc.input.I[23].O*0.)+of.input.I[23].O)} {10.}
(assert (<= (+ (* sc_100 0.) of_100) 10.))
; 
; <=  {((sc.input.I[23].O*0.)+of.input.I[23].O)} {0.}
(assert (>= (+ (* sc_100 0.) of_100) 0.))
(declare-fun sc_101 () Real)
(assert (> sc_101 1e-08))
(declare-fun of_101 () Real)
(declare-fun sc_102 () Real)
(assert (> sc_102 1e-08))
(declare-fun of_102 () Real)
; 
; =  {sc.input.I[25].O} {sc.input.I[25].X}
(assert (= sc_102 sc_101))
; 
; =  {of.input.I[25].O} {of.input.I[25].X}
(assert (= of_102 of_101))
; 
; >=  {((sc.input.I[25].X*2.9618e-05)+of.input.I[25].X)} {10.}
(assert (<= (+ (* sc_101 2.9618e-05) of_101) 10.))
; 
; <=  {((sc.input.I[25].X*2.9618e-05)+of.input.I[25].X)} {0.}
(assert (>= (+ (* sc_101 2.9618e-05) of_101) 0.))
; 
; >=  {((sc.input.I[25].O*2.9618e-05)+of.input.I[25].O)} {10.}
(assert (<= (+ (* sc_102 2.9618e-05) of_102) 10.))
; 
; <=  {((sc.input.I[25].O*2.9618e-05)+of.input.I[25].O)} {0.}
(assert (>= (+ (* sc_102 2.9618e-05) of_102) 0.))
(declare-fun sc_103 () Real)
(assert (> sc_103 1e-08))
(declare-fun of_103 () Real)
(declare-fun sc_104 () Real)
(assert (> sc_104 1e-08))
(declare-fun of_104 () Real)
; 
; =  {sc.input.I[1].O} {sc.input.I[1].X}
(assert (= sc_104 sc_103))
; 
; =  {of.input.I[1].O} {of.input.I[1].X}
(assert (= of_104 of_103))
(declare-fun slbot_103 () Real)
(declare-fun sltop_103 () Real)
; 
; =  {(((sc.input.I[1].X*0.5)+of.input.I[1].X)+sl.min.input.I[1].X)} {0.}
(assert (= (+ (+ (* sc_103 0.5) of_103) slbot_103) 0.))
; 
; =  {(((sc.input.I[1].X*1.)+of.input.I[1].X)+sl.max.input.I[1].X)} {10.}
(assert (= (+ (+ (* sc_103 1.) of_103) sltop_103) 10.))
(declare-fun slbot_104 () Real)
(declare-fun sltop_104 () Real)
; 
; =  {(((sc.input.I[1].O*0.5)+of.input.I[1].O)+sl.min.input.I[1].O)} {0.}
(assert (= (+ (+ (* sc_104 0.5) of_104) slbot_104) 0.))
; 
; =  {(((sc.input.I[1].O*1.)+of.input.I[1].O)+sl.max.input.I[1].O)} {10.}
(assert (= (+ (+ (* sc_104 1.) of_104) sltop_104) 10.))
(declare-fun sc_105 () Real)
(assert (> sc_105 1e-08))
(declare-fun of_105 () Real)
(declare-fun sc_106 () Real)
(assert (> sc_106 1e-08))
(declare-fun of_106 () Real)
; 
; =  {sc.input.I[28].O} {sc.input.I[28].X}
(assert (= sc_106 sc_105))
; 
; =  {of.input.I[28].O} {of.input.I[28].X}
(assert (= of_106 of_105))
; 
; >=  {((sc.input.I[28].X*1.)+of.input.I[28].X)} {10.}
(assert (<= (+ (* sc_105 1.) of_105) 10.))
; 
; <=  {((sc.input.I[28].X*1.)+of.input.I[28].X)} {0.}
(assert (>= (+ (* sc_105 1.) of_105) 0.))
; 
; >=  {((sc.input.I[28].O*1.)+of.input.I[28].O)} {10.}
(assert (<= (+ (* sc_106 1.) of_106) 10.))
; 
; <=  {((sc.input.I[28].O*1.)+of.input.I[28].O)} {0.}
(assert (>= (+ (* sc_106 1.) of_106) 0.))
(declare-fun sc_107 () Real)
(assert (> sc_107 1e-08))
(declare-fun of_107 () Real)
(declare-fun sc_108 () Real)
(assert (> sc_108 1e-08))
(declare-fun of_108 () Real)
; 
; =  {sc.input.I[17].O} {sc.input.I[17].X}
(assert (= sc_108 sc_107))
; 
; =  {of.input.I[17].O} {of.input.I[17].X}
(assert (= of_108 of_107))
; 
; >=  {((sc.input.I[17].X*0.)+of.input.I[17].X)} {10.}
(assert (<= (+ (* sc_107 0.) of_107) 10.))
; 
; <=  {((sc.input.I[17].X*0.)+of.input.I[17].X)} {0.}
(assert (>= (+ (* sc_107 0.) of_107) 0.))
; 
; >=  {((sc.input.I[17].O*0.)+of.input.I[17].O)} {10.}
(assert (<= (+ (* sc_108 0.) of_108) 10.))
; 
; <=  {((sc.input.I[17].O*0.)+of.input.I[17].O)} {0.}
(assert (>= (+ (* sc_108 0.) of_108) 0.))
(declare-fun sc_109 () Real)
(assert (> sc_109 1e-08))
(declare-fun of_109 () Real)
(declare-fun sc_110 () Real)
(assert (> sc_110 1e-08))
(declare-fun of_110 () Real)
; 
; =  {sc.input.I[32].O} {sc.input.I[32].X}
(assert (= sc_110 sc_109))
; 
; =  {of.input.I[32].O} {of.input.I[32].X}
(assert (= of_110 of_109))
; 
; >=  {((sc.input.I[32].X*1.)+of.input.I[32].X)} {10.}
(assert (<= (+ (* sc_109 1.) of_109) 10.))
; 
; <=  {((sc.input.I[32].X*1.)+of.input.I[32].X)} {0.}
(assert (>= (+ (* sc_109 1.) of_109) 0.))
; 
; >=  {((sc.input.I[32].O*1.)+of.input.I[32].O)} {10.}
(assert (<= (+ (* sc_110 1.) of_110) 10.))
; 
; <=  {((sc.input.I[32].O*1.)+of.input.I[32].O)} {0.}
(assert (>= (+ (* sc_110 1.) of_110) 0.))
(declare-fun sc_111 () Real)
(assert (> sc_111 1e-08))
(declare-fun of_111 () Real)
(declare-fun sc_112 () Real)
(assert (> sc_112 1e-08))
(declare-fun of_112 () Real)
; 
; =  {sc.input.I[18].O} {sc.input.I[18].X}
(assert (= sc_112 sc_111))
; 
; =  {of.input.I[18].O} {of.input.I[18].X}
(assert (= of_112 of_111))
; 
; >=  {((sc.input.I[18].X*0.)+of.input.I[18].X)} {10.}
(assert (<= (+ (* sc_111 0.) of_111) 10.))
; 
; <=  {((sc.input.I[18].X*0.)+of.input.I[18].X)} {0.}
(assert (>= (+ (* sc_111 0.) of_111) 0.))
; 
; >=  {((sc.input.I[18].O*0.)+of.input.I[18].O)} {10.}
(assert (<= (+ (* sc_112 0.) of_112) 10.))
; 
; <=  {((sc.input.I[18].O*0.)+of.input.I[18].O)} {0.}
(assert (>= (+ (* sc_112 0.) of_112) 0.))
(declare-fun sc_113 () Real)
(assert (> sc_113 1e-08))
(declare-fun of_113 () Real)
(declare-fun sc_114 () Real)
(assert (> sc_114 1e-08))
(declare-fun of_114 () Real)
; 
; =  {sc.input.I[19].O} {sc.input.I[19].X}
(assert (= sc_114 sc_113))
; 
; =  {of.input.I[19].O} {of.input.I[19].X}
(assert (= of_114 of_113))
; 
; >=  {((sc.input.I[19].X*0.)+of.input.I[19].X)} {10.}
(assert (<= (+ (* sc_113 0.) of_113) 10.))
; 
; <=  {((sc.input.I[19].X*0.)+of.input.I[19].X)} {0.}
(assert (>= (+ (* sc_113 0.) of_113) 0.))
; 
; >=  {((sc.input.I[19].O*0.)+of.input.I[19].O)} {10.}
(assert (<= (+ (* sc_114 0.) of_114) 10.))
; 
; <=  {((sc.input.I[19].O*0.)+of.input.I[19].O)} {0.}
(assert (>= (+ (* sc_114 0.) of_114) 0.))
(declare-fun sc_115 () Real)
(assert (> sc_115 1e-08))
(declare-fun of_115 () Real)
(declare-fun sc_116 () Real)
(assert (> sc_116 1e-08))
(declare-fun of_116 () Real)
; 
; =  {sc.input.I[22].O} {sc.input.I[22].X}
(assert (= sc_116 sc_115))
; 
; =  {of.input.I[22].O} {of.input.I[22].X}
(assert (= of_116 of_115))
; 
; >=  {((sc.input.I[22].X*0.)+of.input.I[22].X)} {10.}
(assert (<= (+ (* sc_115 0.) of_115) 10.))
; 
; <=  {((sc.input.I[22].X*0.)+of.input.I[22].X)} {0.}
(assert (>= (+ (* sc_115 0.) of_115) 0.))
; 
; >=  {((sc.input.I[22].O*0.)+of.input.I[22].O)} {10.}
(assert (<= (+ (* sc_116 0.) of_116) 10.))
; 
; <=  {((sc.input.I[22].O*0.)+of.input.I[22].O)} {0.}
(assert (>= (+ (* sc_116 0.) of_116) 0.))
(declare-fun sc_117 () Real)
(assert (> sc_117 1e-08))
(declare-fun of_117 () Real)
(declare-fun sc_118 () Real)
(assert (> sc_118 1e-08))
(declare-fun of_118 () Real)
; 
; =  {sc.output.V[0].O} {sc.output.V[0].X}
(assert (= sc_118 sc_117))
; 
; =  {of.output.V[0].O} {of.output.V[0].X}
(assert (= of_118 of_117))
(declare-fun slbot_117 () Real)
(declare-fun sltop_117 () Real)
; 
; =  {(((sc.output.V[0].X*0.)+of.output.V[0].X)+sl.min.output.V[0].X)} {0.0001}
(assert (= (+ (+ (* sc_117 0.) of_117) slbot_117) 0.0001))
; 
; =  {(((sc.output.V[0].X*156.25)+of.output.V[0].X)+sl.max.output.V[0].X)} {3300.}
(assert (= (+ (+ (* sc_117 156.25) of_117) sltop_117) 3300.))
(declare-fun slbot_118 () Real)
(declare-fun sltop_118 () Real)
; 
; =  {(((sc.output.V[0].O*0.)+of.output.V[0].O)+sl.min.output.V[0].O)} {0.0001}
(assert (= (+ (+ (* sc_118 0.) of_118) slbot_118) 0.0001))
; 
; =  {(((sc.output.V[0].O*156.25)+of.output.V[0].O)+sl.max.output.V[0].O)} {3300.}
(assert (= (+ (+ (* sc_118 156.25) of_118) sltop_118) 3300.))
(declare-fun sc_119 () Real)
(assert (> sc_119 1e-08))
(declare-fun of_119 () Real)
(declare-fun sc_120 () Real)
(assert (> sc_120 1e-08))
(declare-fun of_120 () Real)
; 
; =  {sc.output.V[1].O} {sc.output.V[1].X}
(assert (= sc_120 sc_119))
; 
; =  {of.output.V[1].O} {of.output.V[1].X}
(assert (= of_120 of_119))
(declare-fun slbot_119 () Real)
(declare-fun sltop_119 () Real)
; 
; =  {(((sc.output.V[1].X*0.)+of.output.V[1].X)+sl.min.output.V[1].X)} {0.0001}
(assert (= (+ (+ (* sc_119 0.) of_119) slbot_119) 0.0001))
; 
; =  {(((sc.output.V[1].X*15.6)+of.output.V[1].X)+sl.max.output.V[1].X)} {3300.}
(assert (= (+ (+ (* sc_119 15.6) of_119) sltop_119) 3300.))
(declare-fun slbot_120 () Real)
(declare-fun sltop_120 () Real)
; 
; =  {(((sc.output.V[1].O*0.)+of.output.V[1].O)+sl.min.output.V[1].O)} {0.0001}
(assert (= (+ (+ (* sc_120 0.) of_120) slbot_120) 0.0001))
; 
; =  {(((sc.output.V[1].O*15.6)+of.output.V[1].O)+sl.max.output.V[1].O)} {3300.}
(assert (= (+ (+ (* sc_120 15.6) of_120) sltop_120) 3300.))
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
(assert (= 0. 0.))
; no offset
(assert (= of_122 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_123 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_125 0.))
; 
; =  {sc.vadd[4].A} {(1.*sc.vadd[4].B)}
(assert (= sc_124 (* 1. sc_125)))
; 
; =  {sc.vadd[4].A} {(1.*sc.vadd[4].C)} {(1.*sc.vadd[4].D)}
(assert (and (= sc_124 (* 1. sc_123)) (= sc_124 (* 1. sc_122))))
; no offset
(assert (= (- (+ of_124 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[4].OUT} {(sc.vadd[4].A*1.)}
(assert (= sc_126 (* sc_124 1.)))
; 
; =  {of.vadd[4].OUT} {0.}
(assert (= of_126 0.))
; no scale
(assert (= sc_122 1.))
; no scale
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_122 0.))
; no offset
(assert (= of_127 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_123 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_125 0.))
; 
; =  {sc.vadd[4].A} {(1.*sc.vadd[4].B)}
(assert (= sc_124 (* 1. sc_125)))
; 
; =  {sc.vadd[4].A} {(1.*sc.vadd[4].C)} {(1.*sc.vadd[4].D*sc.vadd[4].OUT2)}
(assert (and (= sc_124 (* 1. sc_123)) (= sc_124 (* (* 1. sc_122) sc_127))))
; no offset
(assert (= (- (+ of_124 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[4].OUT2} {(sc.vadd[4].A*1.)}
(assert (= sc_127 (* sc_124 1.)))
; no offset
(assert (= of_127 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[4].OUT2_0} {(sc.vadd[4].A*1.)}
(assert (= sc_121 (* sc_124 1.)))
; 
; =  {of.vadd[4].OUT2_0} {0.}
(assert (= of_121 0.))
; 
; >=  {((sc.vadd[4].OUT2_0*0.35)+of.vadd[4].OUT2_0)} {3300.}
(assert (<= (+ (* sc_121 0.35) of_121) 3300.))
; 
; <=  {((sc.vadd[4].OUT2_0*0.35)+of.vadd[4].OUT2_0)} {0.}
(assert (>= (+ (* sc_121 0.35) of_121) 0.))
; 
; >=  {((sc.vadd[4].D*0.004)+of.vadd[4].D)} {3300.}
(assert (<= (+ (* sc_122 0.004) of_122) 3300.))
; 
; <=  {((sc.vadd[4].D*0.004)+of.vadd[4].D)} {0.}
(assert (>= (+ (* sc_122 0.004) of_122) 0.))
; 
; >=  {((sc.vadd[4].C*0.)+of.vadd[4].C)} {3300.}
(assert (<= (+ (* sc_123 0.) of_123) 3300.))
; 
; <=  {((sc.vadd[4].C*0.)+of.vadd[4].C)} {0.}
(assert (>= (+ (* sc_123 0.) of_123) 0.))
; 
; >=  {((sc.vadd[4].A*0.)+of.vadd[4].A)} {3300.}
(assert (<= (+ (* sc_124 0.) of_124) 3300.))
; 
; <=  {((sc.vadd[4].A*0.)+of.vadd[4].A)} {0.}
(assert (>= (+ (* sc_124 0.) of_124) 0.))
(declare-fun slbot_127 () Real)
(declare-fun sltop_127 () Real)
; 
; =  {(((sc.vadd[4].OUT2*0.)+of.vadd[4].OUT2)+sl.min.vadd[4].OUT2)} {0.}
(assert (= (+ (+ (* sc_127 0.) of_127) slbot_127) 0.))
; 
; =  {(((sc.vadd[4].OUT2*15.6)+of.vadd[4].OUT2)+sl.max.vadd[4].OUT2)} {3300.}
(assert (= (+ (+ (* sc_127 15.6) of_127) sltop_127) 3300.))
(declare-fun slbot_125 () Real)
(declare-fun sltop_125 () Real)
; 
; =  {(((sc.vadd[4].B*0.000362037485643)+of.vadd[4].B)+sl.min.vadd[4].B)} {0.}
(assert (= (+ (+ (* sc_125 0.000362037485643) of_125) slbot_125) 0.))
; 
; =  {(((sc.vadd[4].B*3535.53390593)+of.vadd[4].B)+sl.max.vadd[4].B)} {3300.}
(assert (= (+ (+ (* sc_125 3535.53390593) of_125) sltop_125) 3300.))
(declare-fun slbot_126 () Real)
(declare-fun sltop_126 () Real)
; 
; =  {(((sc.vadd[4].OUT*0.000362037485643)+of.vadd[4].OUT)+sl.min.vadd[4].OUT)} {-1650.}
(assert (= (+ (+ (* sc_126 0.000362037485643) of_126) slbot_126) -1650.))
; 
; =  {(((sc.vadd[4].OUT*3535.53390593)+of.vadd[4].OUT)+sl.max.vadd[4].OUT)} {1650.}
(assert (= (+ (+ (* sc_126 3535.53390593) of_126) sltop_126) 1650.))
(declare-fun slbot_127 () Real)
(declare-fun sltop_127 () Real)
; 
; =  {(((sc.vadd[4].OUT2*0.)+of.vadd[4].OUT2)+sl.min.vadd[4].OUT2)} {0.}
(assert (= (+ (+ (* sc_127 0.) of_127) slbot_127) 0.))
; 
; =  {(((sc.vadd[4].OUT2*15.6)+of.vadd[4].OUT2)+sl.max.vadd[4].OUT2)} {3300.}
(assert (= (+ (+ (* sc_127 15.6) of_127) sltop_127) 3300.))
(declare-fun sc_128 () Real)
(assert (> sc_128 1e-08))
(declare-fun of_128 () Real)
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
(declare-fun sc_134 () Real)
(assert (> sc_134 1e-08))
(declare-fun of_134 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_129 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_130 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_132 0.))
; 
; =  {sc.vadd[1].A} {(1.*sc.vadd[1].B)}
(assert (= sc_131 (* 1. sc_132)))
; 
; =  {sc.vadd[1].A} {(1.*sc.vadd[1].C)} {(1.*sc.vadd[1].D)}
(assert (and (= sc_131 (* 1. sc_130)) (= sc_131 (* 1. sc_129))))
; no offset
(assert (= (- (+ of_131 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[1].OUT} {(sc.vadd[1].A*1.)}
(assert (= sc_133 (* sc_131 1.)))
; 
; =  {of.vadd[1].OUT} {0.}
(assert (= of_133 0.))
; no scale
(assert (= sc_129 1.))
; no scale
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_129 0.))
; no offset
(assert (= of_134 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_130 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_132 0.))
; 
; =  {sc.vadd[1].A} {(1.*sc.vadd[1].B)}
(assert (= sc_131 (* 1. sc_132)))
; 
; =  {sc.vadd[1].A} {(1.*sc.vadd[1].C)} {(1.*sc.vadd[1].D*sc.vadd[1].OUT2)}
(assert (and (= sc_131 (* 1. sc_130)) (= sc_131 (* (* 1. sc_129) sc_134))))
; no offset
(assert (= (- (+ of_131 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[1].OUT2} {(sc.vadd[1].A*1.)}
(assert (= sc_134 (* sc_131 1.)))
; no offset
(assert (= of_134 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[1].OUT2_0} {(sc.vadd[1].A*1.)}
(assert (= sc_128 (* sc_131 1.)))
; 
; =  {of.vadd[1].OUT2_0} {0.}
(assert (= of_128 0.))
; 
; >=  {((sc.vadd[1].OUT2_0*0.5)+of.vadd[1].OUT2_0)} {3300.}
(assert (<= (+ (* sc_128 0.5) of_128) 3300.))
; 
; <=  {((sc.vadd[1].OUT2_0*0.5)+of.vadd[1].OUT2_0)} {0.}
(assert (>= (+ (* sc_128 0.5) of_128) 0.))
; 
; >=  {((sc.vadd[1].D*0.004)+of.vadd[1].D)} {3300.}
(assert (<= (+ (* sc_129 0.004) of_129) 3300.))
; 
; <=  {((sc.vadd[1].D*0.004)+of.vadd[1].D)} {0.}
(assert (>= (+ (* sc_129 0.004) of_129) 0.))
; 
; >=  {((sc.vadd[1].C*0.)+of.vadd[1].C)} {3300.}
(assert (<= (+ (* sc_130 0.) of_130) 3300.))
; 
; <=  {((sc.vadd[1].C*0.)+of.vadd[1].C)} {0.}
(assert (>= (+ (* sc_130 0.) of_130) 0.))
; 
; >=  {((sc.vadd[1].A*0.)+of.vadd[1].A)} {3300.}
(assert (<= (+ (* sc_131 0.) of_131) 3300.))
; 
; <=  {((sc.vadd[1].A*0.)+of.vadd[1].A)} {0.}
(assert (>= (+ (* sc_131 0.) of_131) 0.))
(declare-fun slbot_134 () Real)
(declare-fun sltop_134 () Real)
; 
; =  {(((sc.vadd[1].OUT2*0.)+of.vadd[1].OUT2)+sl.min.vadd[1].OUT2)} {0.}
(assert (= (+ (+ (* sc_134 0.) of_134) slbot_134) 0.))
; 
; =  {(((sc.vadd[1].OUT2*156.25)+of.vadd[1].OUT2)+sl.max.vadd[1].OUT2)} {3300.}
(assert (= (+ (+ (* sc_134 156.25) of_134) sltop_134) 3300.))
(declare-fun slbot_132 () Real)
(declare-fun sltop_132 () Real)
; 
; =  {(((sc.vadd[1].B*1.87951807229)+of.vadd[1].B)+sl.min.vadd[1].B)} {0.}
(assert (= (+ (+ (* sc_132 1.87951807229) of_132) slbot_132) 0.))
; 
; =  {(((sc.vadd[1].B*124.8)+of.vadd[1].B)+sl.max.vadd[1].B)} {3300.}
(assert (= (+ (+ (* sc_132 124.8) of_132) sltop_132) 3300.))
(declare-fun slbot_133 () Real)
(declare-fun sltop_133 () Real)
; 
; =  {(((sc.vadd[1].OUT*1.87951807229)+of.vadd[1].OUT)+sl.min.vadd[1].OUT)} {-1650.}
(assert (= (+ (+ (* sc_133 1.87951807229) of_133) slbot_133) -1650.))
; 
; =  {(((sc.vadd[1].OUT*124.8)+of.vadd[1].OUT)+sl.max.vadd[1].OUT)} {1650.}
(assert (= (+ (+ (* sc_133 124.8) of_133) sltop_133) 1650.))
(declare-fun slbot_134 () Real)
(declare-fun sltop_134 () Real)
; 
; =  {(((sc.vadd[1].OUT2*0.)+of.vadd[1].OUT2)+sl.min.vadd[1].OUT2)} {0.}
(assert (= (+ (+ (* sc_134 0.) of_134) slbot_134) 0.))
; 
; =  {(((sc.vadd[1].OUT2*156.25)+of.vadd[1].OUT2)+sl.max.vadd[1].OUT2)} {3300.}
(assert (= (+ (+ (* sc_134 156.25) of_134) sltop_134) 3300.))
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
(declare-fun sc_139 () Real)
(assert (> sc_139 1e-08))
(declare-fun of_139 () Real)
(declare-fun sc_140 () Real)
(assert (> sc_140 1e-08))
(declare-fun of_140 () Real)
; no offset
(assert (= of_136 0.))
; no offset
(assert (= of_137 0.))
; no scale
(assert (= (/ sc_136 sc_137) 1.))
; no scale
(assert (= sc_135 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_135 0.))
; no offset
(assert (= of_136 0.))
; no offset
(assert (= of_137 0.))
; no scale
(assert (= (/ sc_136 sc_137) 1.))
; no scale
(assert (= sc_135 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_135 0.))
; 
; =  {1.} {1.}
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_138 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.ihill[10].STIM} {(sc.ihill[10].Vmax*(1./1.))}
(assert (= sc_139 (* sc_138 (/ 1. 1.))))
; 
; =  {of.ihill[10].STIM} {0.}
(assert (= of_139 0.))
; no scale
(assert (= sc_137 1.))
; no scale
(assert (= sc_135 1.))
; no offset
(assert (= of_137 0.))
; no offset
(assert (= of_135 0.))
; no scale
(assert (= sc_137 1.))
; no scale
(assert (= sc_135 1.))
; no offset
(assert (= of_137 0.))
; no offset
(assert (= of_135 0.))
; no scale
(assert (= sc_136 1.))
; no scale
(assert (= sc_135 1.))
; no offset
(assert (= of_136 0.))
; no offset
(assert (= of_135 0.))
; 
; =  {1.} {1.}
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_138 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.ihill[10].REP} {(sc.ihill[10].Vmax*(1./1.))}
(assert (= sc_140 (* sc_138 (/ 1. 1.))))
; 
; =  {of.ihill[10].REP} {0.}
(assert (= of_140 0.))
; 
; >=  {((sc.ihill[10].n*2.5)+of.ihill[10].n)} {5.}
(assert (<= (+ (* sc_135 2.5) of_135) 5.))
; 
; <=  {((sc.ihill[10].n*2.5)+of.ihill[10].n)} {1.}
(assert (>= (+ (* sc_135 2.5) of_135) 1.))
(declare-fun slbot_136 () Real)
(declare-fun sltop_136 () Real)
; 
; =  {(((sc.ihill[10].S*0.5)+of.ihill[10].S)+sl.min.ihill[10].S)} {1.}
(assert (= (+ (+ (* sc_136 0.5) of_136) slbot_136) 1.))
; 
; =  {(((sc.ihill[10].S*1.)+of.ihill[10].S)+sl.max.ihill[10].S)} {10.}
(assert (= (+ (+ (* sc_136 1.) of_136) sltop_136) 10.))
(declare-fun slbot_140 () Real)
(declare-fun sltop_140 () Real)
; 
; =  {(((sc.ihill[10].REP*9.05093714108e-05)+of.ihill[10].REP)+sl.min.ihill[10].REP)} {5e-10}
(assert (= (+ (+ (* sc_140 9.05093714108e-05) of_140) slbot_140) 5e-10))
; 
; =  {(((sc.ihill[10].REP*883.883476483)+of.ihill[10].REP)+sl.max.ihill[10].REP)} {500000.}
(assert (= (+ (+ (* sc_140 883.883476483) of_140) sltop_140) 500000.))
(declare-fun slbot_137 () Real)
(declare-fun sltop_137 () Real)
; 
; =  {(((sc.ihill[10].Km*0.)+of.ihill[10].Km)+sl.min.ihill[10].Km)} {1.}
(assert (= (+ (+ (* sc_137 0.) of_137) slbot_137) 1.))
; 
; =  {(((sc.ihill[10].Km*156.25)+of.ihill[10].Km)+sl.max.ihill[10].Km)} {10.}
(assert (= (+ (+ (* sc_137 156.25) of_137) sltop_137) 10.))
(declare-fun slbot_138 () Real)
(declare-fun sltop_138 () Real)
; 
; =  {(((sc.ihill[10].Vmax*0.)+of.ihill[10].Vmax)+sl.min.ihill[10].Vmax)} {0.0001}
(assert (= (+ (+ (* sc_138 0.) of_138) slbot_138) 0.0001))
; 
; =  {(((sc.ihill[10].Vmax*0.000512)+of.ihill[10].Vmax)+sl.max.ihill[10].Vmax)} {10.}
(assert (= (+ (+ (* sc_138 0.000512) of_138) sltop_138) 10.))
(declare-fun slbot_139 () Real)
(declare-fun sltop_139 () Real)
; 
; =  {(((sc.ihill[10].STIM*1.)+of.ihill[10].STIM)+sl.min.ihill[10].STIM)} {9.999900001e-15}
(assert (= (+ (+ (* sc_139 1.) of_139) slbot_139) 9.999900001e-15))
; 
; =  {(((sc.ihill[10].STIM*5.65685424949)+of.ihill[10].STIM)+sl.max.ihill[10].STIM)} {999990.0001}
(assert (= (+ (+ (* sc_139 5.65685424949) of_139) sltop_139) 999990.0001))
(declare-fun slbot_140 () Real)
(declare-fun sltop_140 () Real)
; 
; =  {(((sc.ihill[10].REP*9.05093714108e-05)+of.ihill[10].REP)+sl.min.ihill[10].REP)} {5e-10}
(assert (= (+ (+ (* sc_140 9.05093714108e-05) of_140) slbot_140) 5e-10))
; 
; =  {(((sc.ihill[10].REP*883.883476483)+of.ihill[10].REP)+sl.max.ihill[10].REP)} {500000.}
(assert (= (+ (+ (* sc_140 883.883476483) of_140) sltop_140) 500000.))
(declare-fun sc_141 () Real)
(assert (> sc_141 1e-08))
(declare-fun of_141 () Real)
(declare-fun sc_142 () Real)
(assert (> sc_142 1e-08))
(declare-fun of_142 () Real)
(declare-fun sc_143 () Real)
(assert (> sc_143 1e-08))
(declare-fun of_143 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_142 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_141 0.))
; 
; =  {sc.vtoi[29].Y} {((1./sc.vtoi[29].K)*sc.vtoi[29].X)}
(assert (= sc_143 (* (/ 1. sc_142) sc_141)))
; 
; =  {of.vtoi[29].Y} {0.}
(assert (= of_143 0.))
; 
; >=  {((sc.vtoi[29].X*1.)+of.vtoi[29].X)} {3300.}
(assert (<= (+ (* sc_141 1.) of_141) 3300.))
; 
; <=  {((sc.vtoi[29].X*1.)+of.vtoi[29].X)} {1.}
(assert (>= (+ (* sc_141 1.) of_141) 1.))
(declare-fun slbot_143 () Real)
(declare-fun sltop_143 () Real)
; 
; =  {(((sc.vtoi[29].Y*0.)+of.vtoi[29].Y)+sl.min.vtoi[29].Y)} {0.00030303030303}
(assert (= (+ (+ (* sc_143 0.) of_143) slbot_143) 0.00030303030303))
; 
; =  {(((sc.vtoi[29].Y*305175.78125)+of.vtoi[29].Y)+sl.max.vtoi[29].Y)} {3300.}
(assert (= (+ (+ (* sc_143 305175.78125) of_143) sltop_143) 3300.))
(declare-fun slbot_142 () Real)
(declare-fun sltop_142 () Real)
; 
; =  {(((sc.vtoi[29].K*0.)+of.vtoi[29].K)+sl.min.vtoi[29].K)} {1.}
(assert (= (+ (+ (* sc_142 0.) of_142) slbot_142) 1.))
; 
; =  {(((sc.vtoi[29].K*3.2768e-06)+of.vtoi[29].K)+sl.max.vtoi[29].K)} {3300.}
(assert (= (+ (+ (* sc_142 3.2768e-06) of_142) sltop_142) 3300.))
(declare-fun slbot_143 () Real)
(declare-fun sltop_143 () Real)
; 
; =  {(((sc.vtoi[29].Y*0.)+of.vtoi[29].Y)+sl.min.vtoi[29].Y)} {0.00030303030303}
(assert (= (+ (+ (* sc_143 0.) of_143) slbot_143) 0.00030303030303))
; 
; =  {(((sc.vtoi[29].Y*305175.78125)+of.vtoi[29].Y)+sl.max.vtoi[29].Y)} {3300.}
(assert (= (+ (+ (* sc_143 305175.78125) of_143) sltop_143) 3300.))
(declare-fun sc_144 () Real)
(assert (> sc_144 1e-08))
(declare-fun of_144 () Real)
(declare-fun sc_145 () Real)
(assert (> sc_145 1e-08))
(declare-fun of_145 () Real)
(declare-fun sc_146 () Real)
(assert (> sc_146 1e-08))
(declare-fun of_146 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_145 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_144 0.))
; 
; =  {sc.vtoi[9].Y} {((1./sc.vtoi[9].K)*sc.vtoi[9].X)}
(assert (= sc_146 (* (/ 1. sc_145) sc_144)))
; 
; =  {of.vtoi[9].Y} {0.}
(assert (= of_146 0.))
(declare-fun slbot_144 () Real)
(declare-fun sltop_144 () Real)
; 
; =  {(((sc.vtoi[9].X*0.)+of.vtoi[9].X)+sl.min.vtoi[9].X)} {1.}
(assert (= (+ (+ (* sc_144 0.) of_144) slbot_144) 1.))
; 
; =  {(((sc.vtoi[9].X*156.25)+of.vtoi[9].X)+sl.max.vtoi[9].X)} {3300.}
(assert (= (+ (+ (* sc_144 156.25) of_144) sltop_144) 3300.))
(declare-fun slbot_146 () Real)
(declare-fun sltop_146 () Real)
; 
; =  {(((sc.vtoi[9].Y*-156.25)+of.vtoi[9].Y)+sl.min.vtoi[9].Y)} {0.00030303030303}
(assert (= (+ (+ (* sc_146 -156.25) of_146) slbot_146) 0.00030303030303))
; 
; =  {(((sc.vtoi[9].Y*0.)+of.vtoi[9].Y)+sl.max.vtoi[9].Y)} {3300.}
(assert (= (+ (+ (* sc_146 0.) of_146) sltop_146) 3300.))
; 
; >=  {((sc.vtoi[9].K*-1.)+of.vtoi[9].K)} {3300.}
(assert (<= (+ (* sc_145 -1.) of_145) 3300.))
; 
; <=  {((sc.vtoi[9].K*-1.)+of.vtoi[9].K)} {1.}
(assert (>= (+ (* sc_145 -1.) of_145) 1.))
(declare-fun sc_147 () Real)
(assert (> sc_147 1e-08))
(declare-fun of_147 () Real)
(declare-fun sc_148 () Real)
(assert (> sc_148 1e-08))
(declare-fun of_148 () Real)
(declare-fun sc_149 () Real)
(assert (> sc_149 1e-08))
(declare-fun of_149 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_148 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_147 0.))
; 
; =  {sc.vtoi[11].Y} {((1./sc.vtoi[11].K)*sc.vtoi[11].X)}
(assert (= sc_149 (* (/ 1. sc_148) sc_147)))
; 
; =  {of.vtoi[11].Y} {0.}
(assert (= of_149 0.))
(declare-fun slbot_147 () Real)
(declare-fun sltop_147 () Real)
; 
; =  {(((sc.vtoi[11].X*27.6213586401)+of.vtoi[11].X)+sl.min.vtoi[11].X)} {1.}
(assert (= (+ (+ (* sc_147 27.6213586401) of_147) slbot_147) 1.))
; 
; =  {(((sc.vtoi[11].X*156.25)+of.vtoi[11].X)+sl.max.vtoi[11].X)} {3300.}
(assert (= (+ (+ (* sc_147 156.25) of_147) sltop_147) 3300.))
(declare-fun slbot_149 () Real)
(declare-fun sltop_149 () Real)
; 
; =  {(((sc.vtoi[11].Y*0.)+of.vtoi[11].Y)+sl.min.vtoi[11].Y)} {0.00030303030303}
(assert (= (+ (+ (* sc_149 0.) of_149) slbot_149) 0.00030303030303))
; 
; =  {(((sc.vtoi[11].Y*0.000512)+of.vtoi[11].Y)+sl.max.vtoi[11].Y)} {3300.}
(assert (= (+ (+ (* sc_149 0.000512) of_149) sltop_149) 3300.))
(declare-fun slbot_148 () Real)
(declare-fun sltop_148 () Real)
; 
; =  {(((sc.vtoi[11].K*0.)+of.vtoi[11].K)+sl.min.vtoi[11].K)} {1.}
(assert (= (+ (+ (* sc_148 0.) of_148) slbot_148) 1.))
; 
; =  {(((sc.vtoi[11].K*305175.78125)+of.vtoi[11].K)+sl.max.vtoi[11].K)} {3300.}
(assert (= (+ (+ (* sc_148 305175.78125) of_148) sltop_148) 3300.))
(declare-fun slbot_149 () Real)
(declare-fun sltop_149 () Real)
; 
; =  {(((sc.vtoi[11].Y*0.)+of.vtoi[11].Y)+sl.min.vtoi[11].Y)} {0.00030303030303}
(assert (= (+ (+ (* sc_149 0.) of_149) slbot_149) 0.00030303030303))
; 
; =  {(((sc.vtoi[11].Y*0.000512)+of.vtoi[11].Y)+sl.max.vtoi[11].Y)} {3300.}
(assert (= (+ (+ (* sc_149 0.000512) of_149) sltop_149) 3300.))
(declare-fun sc_150 () Real)
(assert (> sc_150 1e-08))
(declare-fun of_150 () Real)
(declare-fun sc_151 () Real)
(assert (> sc_151 1e-08))
(declare-fun of_151 () Real)
(declare-fun sc_152 () Real)
(assert (> sc_152 1e-08))
(declare-fun of_152 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_151 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_150 0.))
; 
; =  {sc.vtoi[25].Y} {((1./sc.vtoi[25].K)*sc.vtoi[25].X)}
(assert (= sc_152 (* (/ 1. sc_151) sc_150)))
; 
; =  {of.vtoi[25].Y} {0.}
(assert (= of_152 0.))
(declare-fun slbot_150 () Real)
(declare-fun sltop_150 () Real)
; 
; =  {(((sc.vtoi[25].X*0.)+of.vtoi[25].X)+sl.min.vtoi[25].X)} {1.}
(assert (= (+ (+ (* sc_150 0.) of_150) slbot_150) 1.))
; 
; =  {(((sc.vtoi[25].X*156.25)+of.vtoi[25].X)+sl.max.vtoi[25].X)} {3300.}
(assert (= (+ (+ (* sc_150 156.25) of_150) sltop_150) 3300.))
; 
; >=  {((sc.vtoi[25].K*1.)+of.vtoi[25].K)} {3300.}
(assert (<= (+ (* sc_151 1.) of_151) 3300.))
; 
; <=  {((sc.vtoi[25].K*1.)+of.vtoi[25].K)} {1.}
(assert (>= (+ (* sc_151 1.) of_151) 1.))
(declare-fun slbot_152 () Real)
(declare-fun sltop_152 () Real)
; 
; =  {(((sc.vtoi[25].Y*0.)+of.vtoi[25].Y)+sl.min.vtoi[25].Y)} {0.00030303030303}
(assert (= (+ (+ (* sc_152 0.) of_152) slbot_152) 0.00030303030303))
; 
; =  {(((sc.vtoi[25].Y*156.25)+of.vtoi[25].Y)+sl.max.vtoi[25].Y)} {3300.}
(assert (= (+ (+ (* sc_152 156.25) of_152) sltop_152) 3300.))
(declare-fun sc_153 () Real)
(assert (> sc_153 1e-08))
(declare-fun of_153 () Real)
(declare-fun sc_154 () Real)
(assert (> sc_154 1e-08))
(declare-fun of_154 () Real)
(declare-fun sc_155 () Real)
(assert (> sc_155 1e-08))
(declare-fun of_155 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_154 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_153 0.))
; 
; =  {sc.vtoi[17].Y} {((1./sc.vtoi[17].K)*sc.vtoi[17].X)}
(assert (= sc_155 (* (/ 1. sc_154) sc_153)))
; 
; =  {of.vtoi[17].Y} {0.}
(assert (= of_155 0.))
; 
; >=  {((sc.vtoi[17].X*1.)+of.vtoi[17].X)} {3300.}
(assert (<= (+ (* sc_153 1.) of_153) 3300.))
; 
; <=  {((sc.vtoi[17].X*1.)+of.vtoi[17].X)} {1.}
(assert (>= (+ (* sc_153 1.) of_153) 1.))
(declare-fun slbot_155 () Real)
(declare-fun sltop_155 () Real)
; 
; =  {(((sc.vtoi[17].Y*1.)+of.vtoi[17].Y)+sl.min.vtoi[17].Y)} {0.00030303030303}
(assert (= (+ (+ (* sc_155 1.) of_155) slbot_155) 0.00030303030303))
; 
; =  {(((sc.vtoi[17].Y*5.65685424949)+of.vtoi[17].Y)+sl.max.vtoi[17].Y)} {3300.}
(assert (= (+ (+ (* sc_155 5.65685424949) of_155) sltop_155) 3300.))
(declare-fun slbot_154 () Real)
(declare-fun sltop_154 () Real)
; 
; =  {(((sc.vtoi[17].K*0.176776695297)+of.vtoi[17].K)+sl.min.vtoi[17].K)} {1.}
(assert (= (+ (+ (* sc_154 0.176776695297) of_154) slbot_154) 1.))
; 
; =  {(((sc.vtoi[17].K*1.)+of.vtoi[17].K)+sl.max.vtoi[17].K)} {3300.}
(assert (= (+ (+ (* sc_154 1.) of_154) sltop_154) 3300.))
(declare-fun slbot_155 () Real)
(declare-fun sltop_155 () Real)
; 
; =  {(((sc.vtoi[17].Y*1.)+of.vtoi[17].Y)+sl.min.vtoi[17].Y)} {0.00030303030303}
(assert (= (+ (+ (* sc_155 1.) of_155) slbot_155) 0.00030303030303))
; 
; =  {(((sc.vtoi[17].Y*5.65685424949)+of.vtoi[17].Y)+sl.max.vtoi[17].Y)} {3300.}
(assert (= (+ (+ (* sc_155 5.65685424949) of_155) sltop_155) 3300.))
(declare-fun sc_156 () Real)
(assert (> sc_156 1e-08))
(declare-fun of_156 () Real)
(declare-fun sc_157 () Real)
(assert (> sc_157 1e-08))
(declare-fun of_157 () Real)
(declare-fun sc_158 () Real)
(assert (> sc_158 1e-08))
(declare-fun of_158 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_157 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_156 0.))
; 
; =  {sc.vtoi[22].Y} {((1./sc.vtoi[22].K)*sc.vtoi[22].X)}
(assert (= sc_158 (* (/ 1. sc_157) sc_156)))
; 
; =  {of.vtoi[22].Y} {0.}
(assert (= of_158 0.))
; 
; >=  {((sc.vtoi[22].X*1.)+of.vtoi[22].X)} {3300.}
(assert (<= (+ (* sc_156 1.) of_156) 3300.))
; 
; <=  {((sc.vtoi[22].X*1.)+of.vtoi[22].X)} {1.}
(assert (>= (+ (* sc_156 1.) of_156) 1.))
(declare-fun slbot_158 () Real)
(declare-fun sltop_158 () Real)
; 
; =  {(((sc.vtoi[22].Y*0.176776695297)+of.vtoi[22].Y)+sl.min.vtoi[22].Y)} {0.00030303030303}
(assert (= (+ (+ (* sc_158 0.176776695297) of_158) slbot_158) 0.00030303030303))
; 
; =  {(((sc.vtoi[22].Y*1.)+of.vtoi[22].Y)+sl.max.vtoi[22].Y)} {3300.}
(assert (= (+ (+ (* sc_158 1.) of_158) sltop_158) 3300.))
(declare-fun slbot_157 () Real)
(declare-fun sltop_157 () Real)
; 
; =  {(((sc.vtoi[22].K*1.)+of.vtoi[22].K)+sl.min.vtoi[22].K)} {1.}
(assert (= (+ (+ (* sc_157 1.) of_157) slbot_157) 1.))
; 
; =  {(((sc.vtoi[22].K*5.65685424949)+of.vtoi[22].K)+sl.max.vtoi[22].K)} {3300.}
(assert (= (+ (+ (* sc_157 5.65685424949) of_157) sltop_157) 3300.))
(declare-fun slbot_158 () Real)
(declare-fun sltop_158 () Real)
; 
; =  {(((sc.vtoi[22].Y*0.176776695297)+of.vtoi[22].Y)+sl.min.vtoi[22].Y)} {0.00030303030303}
(assert (= (+ (+ (* sc_158 0.176776695297) of_158) slbot_158) 0.00030303030303))
; 
; =  {(((sc.vtoi[22].Y*1.)+of.vtoi[22].Y)+sl.max.vtoi[22].Y)} {3300.}
(assert (= (+ (+ (* sc_158 1.) of_158) sltop_158) 3300.))
(declare-fun sc_159 () Real)
(assert (> sc_159 1e-08))
(declare-fun of_159 () Real)
(declare-fun sc_160 () Real)
(assert (> sc_160 1e-08))
(declare-fun of_160 () Real)
; 
; =  {sc.input.V[2].O} {sc.input.V[2].X}
(assert (= sc_160 sc_159))
; 
; =  {of.input.V[2].O} {of.input.V[2].X}
(assert (= of_160 of_159))
; 
; >=  {((sc.input.V[2].X*2.)+of.input.V[2].X)} {3300.}
(assert (<= (+ (* sc_159 2.) of_159) 3300.))
; 
; <=  {((sc.input.V[2].X*2.)+of.input.V[2].X)} {0.}
(assert (>= (+ (* sc_159 2.) of_159) 0.))
; 
; >=  {((sc.input.V[2].O*2.)+of.input.V[2].O)} {3300.}
(assert (<= (+ (* sc_160 2.) of_160) 3300.))
; 
; <=  {((sc.input.V[2].O*2.)+of.input.V[2].O)} {0.}
(assert (>= (+ (* sc_160 2.) of_160) 0.))
(declare-fun sc_161 () Real)
(assert (> sc_161 1e-08))
(declare-fun of_161 () Real)
(declare-fun sc_162 () Real)
(assert (> sc_162 1e-08))
(declare-fun of_162 () Real)
; 
; =  {sc.input.V[20].O} {sc.input.V[20].X}
(assert (= sc_162 sc_161))
; 
; =  {of.input.V[20].O} {of.input.V[20].X}
(assert (= of_162 of_161))
; 
; >=  {((sc.input.V[20].X*0.004)+of.input.V[20].X)} {3300.}
(assert (<= (+ (* sc_161 0.004) of_161) 3300.))
; 
; <=  {((sc.input.V[20].X*0.004)+of.input.V[20].X)} {0.}
(assert (>= (+ (* sc_161 0.004) of_161) 0.))
; 
; >=  {((sc.input.V[20].O*0.004)+of.input.V[20].O)} {3300.}
(assert (<= (+ (* sc_162 0.004) of_162) 3300.))
; 
; <=  {((sc.input.V[20].O*0.004)+of.input.V[20].O)} {0.}
(assert (>= (+ (* sc_162 0.004) of_162) 0.))
(declare-fun sc_163 () Real)
(assert (> sc_163 1e-08))
(declare-fun of_163 () Real)
(declare-fun sc_164 () Real)
(assert (> sc_164 1e-08))
(declare-fun of_164 () Real)
; 
; =  {sc.input.V[29].O} {sc.input.V[29].X}
(assert (= sc_164 sc_163))
; 
; =  {of.input.V[29].O} {of.input.V[29].X}
(assert (= of_164 of_163))
; 
; >=  {((sc.input.V[29].X*1.)+of.input.V[29].X)} {3300.}
(assert (<= (+ (* sc_163 1.) of_163) 3300.))
; 
; <=  {((sc.input.V[29].X*1.)+of.input.V[29].X)} {0.}
(assert (>= (+ (* sc_163 1.) of_163) 0.))
; 
; >=  {((sc.input.V[29].O*1.)+of.input.V[29].O)} {3300.}
(assert (<= (+ (* sc_164 1.) of_164) 3300.))
; 
; <=  {((sc.input.V[29].O*1.)+of.input.V[29].O)} {0.}
(assert (>= (+ (* sc_164 1.) of_164) 0.))
(declare-fun sc_165 () Real)
(assert (> sc_165 1e-08))
(declare-fun of_165 () Real)
(declare-fun sc_166 () Real)
(assert (> sc_166 1e-08))
(declare-fun of_166 () Real)
; 
; =  {sc.input.V[8].O} {sc.input.V[8].X}
(assert (= sc_166 sc_165))
; 
; =  {of.input.V[8].O} {of.input.V[8].X}
(assert (= of_166 of_165))
; 
; >=  {((sc.input.V[8].X*2.5)+of.input.V[8].X)} {3300.}
(assert (<= (+ (* sc_165 2.5) of_165) 3300.))
; 
; <=  {((sc.input.V[8].X*2.5)+of.input.V[8].X)} {0.}
(assert (>= (+ (* sc_165 2.5) of_165) 0.))
; 
; >=  {((sc.input.V[8].O*2.5)+of.input.V[8].O)} {3300.}
(assert (<= (+ (* sc_166 2.5) of_166) 3300.))
; 
; <=  {((sc.input.V[8].O*2.5)+of.input.V[8].O)} {0.}
(assert (>= (+ (* sc_166 2.5) of_166) 0.))
(declare-fun sc_167 () Real)
(assert (> sc_167 1e-08))
(declare-fun of_167 () Real)
(declare-fun sc_168 () Real)
(assert (> sc_168 1e-08))
(declare-fun of_168 () Real)
; 
; =  {sc.input.V[35].O} {sc.input.V[35].X}
(assert (= sc_168 sc_167))
; 
; =  {of.input.V[35].O} {of.input.V[35].X}
(assert (= of_168 of_167))
; 
; >=  {((sc.input.V[35].X*1.)+of.input.V[35].X)} {3300.}
(assert (<= (+ (* sc_167 1.) of_167) 3300.))
; 
; <=  {((sc.input.V[35].X*1.)+of.input.V[35].X)} {0.}
(assert (>= (+ (* sc_167 1.) of_167) 0.))
; 
; >=  {((sc.input.V[35].O*1.)+of.input.V[35].O)} {3300.}
(assert (<= (+ (* sc_168 1.) of_168) 3300.))
; 
; <=  {((sc.input.V[35].O*1.)+of.input.V[35].O)} {0.}
(assert (>= (+ (* sc_168 1.) of_168) 0.))
(declare-fun sc_169 () Real)
(assert (> sc_169 1e-08))
(declare-fun of_169 () Real)
(declare-fun sc_170 () Real)
(assert (> sc_170 1e-08))
(declare-fun of_170 () Real)
; 
; =  {sc.input.V[7].O} {sc.input.V[7].X}
(assert (= sc_170 sc_169))
; 
; =  {of.input.V[7].O} {of.input.V[7].X}
(assert (= of_170 of_169))
; 
; >=  {((sc.input.V[7].X*2.0015)+of.input.V[7].X)} {3300.}
(assert (<= (+ (* sc_169 2.0015) of_169) 3300.))
; 
; <=  {((sc.input.V[7].X*2.0015)+of.input.V[7].X)} {0.}
(assert (>= (+ (* sc_169 2.0015) of_169) 0.))
; 
; >=  {((sc.input.V[7].O*2.0015)+of.input.V[7].O)} {3300.}
(assert (<= (+ (* sc_170 2.0015) of_170) 3300.))
; 
; <=  {((sc.input.V[7].O*2.0015)+of.input.V[7].O)} {0.}
(assert (>= (+ (* sc_170 2.0015) of_170) 0.))
(declare-fun sc_171 () Real)
(assert (> sc_171 1e-08))
(declare-fun of_171 () Real)
(declare-fun sc_172 () Real)
(assert (> sc_172 1e-08))
(declare-fun of_172 () Real)
; 
; =  {sc.input.V[34].O} {sc.input.V[34].X}
(assert (= sc_172 sc_171))
; 
; =  {of.input.V[34].O} {of.input.V[34].X}
(assert (= of_172 of_171))
; 
; >=  {((sc.input.V[34].X*1.)+of.input.V[34].X)} {3300.}
(assert (<= (+ (* sc_171 1.) of_171) 3300.))
; 
; <=  {((sc.input.V[34].X*1.)+of.input.V[34].X)} {0.}
(assert (>= (+ (* sc_171 1.) of_171) 0.))
; 
; >=  {((sc.input.V[34].O*1.)+of.input.V[34].O)} {3300.}
(assert (<= (+ (* sc_172 1.) of_172) 3300.))
; 
; <=  {((sc.input.V[34].O*1.)+of.input.V[34].O)} {0.}
(assert (>= (+ (* sc_172 1.) of_172) 0.))
(declare-fun sc_173 () Real)
(assert (> sc_173 1e-08))
(declare-fun of_173 () Real)
(declare-fun sc_174 () Real)
(assert (> sc_174 1e-08))
(declare-fun of_174 () Real)
; 
; =  {sc.input.V[13].O} {sc.input.V[13].X}
(assert (= sc_174 sc_173))
; 
; =  {of.input.V[13].O} {of.input.V[13].X}
(assert (= of_174 of_173))
; 
; >=  {((sc.input.V[13].X*0.)+of.input.V[13].X)} {3300.}
(assert (<= (+ (* sc_173 0.) of_173) 3300.))
; 
; <=  {((sc.input.V[13].X*0.)+of.input.V[13].X)} {0.}
(assert (>= (+ (* sc_173 0.) of_173) 0.))
; 
; >=  {((sc.input.V[13].O*0.)+of.input.V[13].O)} {3300.}
(assert (<= (+ (* sc_174 0.) of_174) 3300.))
; 
; <=  {((sc.input.V[13].O*0.)+of.input.V[13].O)} {0.}
(assert (>= (+ (* sc_174 0.) of_174) 0.))
(declare-fun sc_175 () Real)
(assert (> sc_175 1e-08))
(declare-fun of_175 () Real)
(declare-fun sc_176 () Real)
(assert (> sc_176 1e-08))
(declare-fun of_176 () Real)
; 
; =  {sc.input.V[39].O} {sc.input.V[39].X}
(assert (= sc_176 sc_175))
; 
; =  {of.input.V[39].O} {of.input.V[39].X}
(assert (= of_176 of_175))
; 
; >=  {((sc.input.V[39].X*1.)+of.input.V[39].X)} {3300.}
(assert (<= (+ (* sc_175 1.) of_175) 3300.))
; 
; <=  {((sc.input.V[39].X*1.)+of.input.V[39].X)} {0.}
(assert (>= (+ (* sc_175 1.) of_175) 0.))
; 
; >=  {((sc.input.V[39].O*1.)+of.input.V[39].O)} {3300.}
(assert (<= (+ (* sc_176 1.) of_176) 3300.))
; 
; <=  {((sc.input.V[39].O*1.)+of.input.V[39].O)} {0.}
(assert (>= (+ (* sc_176 1.) of_176) 0.))
(declare-fun sc_177 () Real)
(assert (> sc_177 1e-08))
(declare-fun of_177 () Real)
(declare-fun sc_178 () Real)
(assert (> sc_178 1e-08))
(declare-fun of_178 () Real)
; 
; =  {sc.input.V[12].O} {sc.input.V[12].X}
(assert (= sc_178 sc_177))
; 
; =  {of.input.V[12].O} {of.input.V[12].X}
(assert (= of_178 of_177))
; 
; >=  {((sc.input.V[12].X*0.125)+of.input.V[12].X)} {3300.}
(assert (<= (+ (* sc_177 0.125) of_177) 3300.))
; 
; <=  {((sc.input.V[12].X*0.125)+of.input.V[12].X)} {0.}
(assert (>= (+ (* sc_177 0.125) of_177) 0.))
; 
; >=  {((sc.input.V[12].O*0.125)+of.input.V[12].O)} {3300.}
(assert (<= (+ (* sc_178 0.125) of_178) 3300.))
; 
; <=  {((sc.input.V[12].O*0.125)+of.input.V[12].O)} {0.}
(assert (>= (+ (* sc_178 0.125) of_178) 0.))
(declare-fun sc_179 () Real)
(assert (> sc_179 1e-08))
(declare-fun of_179 () Real)
(declare-fun sc_180 () Real)
(assert (> sc_180 1e-08))
(declare-fun of_180 () Real)
; 
; =  {sc.input.V[9].O} {sc.input.V[9].X}
(assert (= sc_180 sc_179))
; 
; =  {of.input.V[9].O} {of.input.V[9].X}
(assert (= of_180 of_179))
; 
; >=  {((sc.input.V[9].X*2.5)+of.input.V[9].X)} {3300.}
(assert (<= (+ (* sc_179 2.5) of_179) 3300.))
; 
; <=  {((sc.input.V[9].X*2.5)+of.input.V[9].X)} {0.}
(assert (>= (+ (* sc_179 2.5) of_179) 0.))
; 
; >=  {((sc.input.V[9].O*2.5)+of.input.V[9].O)} {3300.}
(assert (<= (+ (* sc_180 2.5) of_180) 3300.))
; 
; <=  {((sc.input.V[9].O*2.5)+of.input.V[9].O)} {0.}
(assert (>= (+ (* sc_180 2.5) of_180) 0.))
(declare-fun sc_181 () Real)
(assert (> sc_181 1e-08))
(declare-fun of_181 () Real)
(declare-fun sc_182 () Real)
(assert (> sc_182 1e-08))
(declare-fun of_182 () Real)
; 
; =  {sc.input.V[31].O} {sc.input.V[31].X}
(assert (= sc_182 sc_181))
; 
; =  {of.input.V[31].O} {of.input.V[31].X}
(assert (= of_182 of_181))
; 
; >=  {((sc.input.V[31].X*1.)+of.input.V[31].X)} {3300.}
(assert (<= (+ (* sc_181 1.) of_181) 3300.))
; 
; <=  {((sc.input.V[31].X*1.)+of.input.V[31].X)} {0.}
(assert (>= (+ (* sc_181 1.) of_181) 0.))
; 
; >=  {((sc.input.V[31].O*1.)+of.input.V[31].O)} {3300.}
(assert (<= (+ (* sc_182 1.) of_182) 3300.))
; 
; <=  {((sc.input.V[31].O*1.)+of.input.V[31].O)} {0.}
(assert (>= (+ (* sc_182 1.) of_182) 0.))
(declare-fun sc_183 () Real)
(assert (> sc_183 1e-08))
(declare-fun of_183 () Real)
(declare-fun sc_184 () Real)
(assert (> sc_184 1e-08))
(declare-fun of_184 () Real)
; 
; =  {sc.input.V[0].O} {sc.input.V[0].X}
(assert (= sc_184 sc_183))
; 
; =  {of.input.V[0].O} {of.input.V[0].X}
(assert (= of_184 of_183))
(declare-fun slbot_183 () Real)
(declare-fun sltop_183 () Real)
; 
; =  {(((sc.input.V[0].X*0.5)+of.input.V[0].X)+sl.min.input.V[0].X)} {0.}
(assert (= (+ (+ (* sc_183 0.5) of_183) slbot_183) 0.))
; 
; =  {(((sc.input.V[0].X*1.)+of.input.V[0].X)+sl.max.input.V[0].X)} {3300.}
(assert (= (+ (+ (* sc_183 1.) of_183) sltop_183) 3300.))
(declare-fun slbot_184 () Real)
(declare-fun sltop_184 () Real)
; 
; =  {(((sc.input.V[0].O*0.5)+of.input.V[0].O)+sl.min.input.V[0].O)} {0.}
(assert (= (+ (+ (* sc_184 0.5) of_184) slbot_184) 0.))
; 
; =  {(((sc.input.V[0].O*1.)+of.input.V[0].O)+sl.max.input.V[0].O)} {3300.}
(assert (= (+ (+ (* sc_184 1.) of_184) sltop_184) 3300.))
(declare-fun sc_185 () Real)
(assert (> sc_185 1e-08))
(declare-fun of_185 () Real)
(declare-fun sc_186 () Real)
(assert (> sc_186 1e-08))
(declare-fun of_186 () Real)
; 
; =  {sc.input.V[11].O} {sc.input.V[11].X}
(assert (= sc_186 sc_185))
; 
; =  {of.input.V[11].O} {of.input.V[11].X}
(assert (= of_186 of_185))
; 
; >=  {((sc.input.V[11].X*0.125)+of.input.V[11].X)} {3300.}
(assert (<= (+ (* sc_185 0.125) of_185) 3300.))
; 
; <=  {((sc.input.V[11].X*0.125)+of.input.V[11].X)} {0.}
(assert (>= (+ (* sc_185 0.125) of_185) 0.))
; 
; >=  {((sc.input.V[11].O*0.125)+of.input.V[11].O)} {3300.}
(assert (<= (+ (* sc_186 0.125) of_186) 3300.))
; 
; <=  {((sc.input.V[11].O*0.125)+of.input.V[11].O)} {0.}
(assert (>= (+ (* sc_186 0.125) of_186) 0.))
(declare-fun sc_187 () Real)
(assert (> sc_187 1e-08))
(declare-fun of_187 () Real)
(declare-fun sc_188 () Real)
(assert (> sc_188 1e-08))
(declare-fun of_188 () Real)
; 
; =  {sc.input.V[42].O} {sc.input.V[42].X}
(assert (= sc_188 sc_187))
; 
; =  {of.input.V[42].O} {of.input.V[42].X}
(assert (= of_188 of_187))
; 
; >=  {((sc.input.V[42].X*1.)+of.input.V[42].X)} {3300.}
(assert (<= (+ (* sc_187 1.) of_187) 3300.))
; 
; <=  {((sc.input.V[42].X*1.)+of.input.V[42].X)} {0.}
(assert (>= (+ (* sc_187 1.) of_187) 0.))
; 
; >=  {((sc.input.V[42].O*1.)+of.input.V[42].O)} {3300.}
(assert (<= (+ (* sc_188 1.) of_188) 3300.))
; 
; <=  {((sc.input.V[42].O*1.)+of.input.V[42].O)} {0.}
(assert (>= (+ (* sc_188 1.) of_188) 0.))
(declare-fun sc_189 () Real)
(assert (> sc_189 1e-08))
(declare-fun of_189 () Real)
(declare-fun sc_190 () Real)
(assert (> sc_190 1e-08))
(declare-fun of_190 () Real)
; 
; =  {sc.input.V[10].O} {sc.input.V[10].X}
(assert (= sc_190 sc_189))
; 
; =  {of.input.V[10].O} {of.input.V[10].X}
(assert (= of_190 of_189))
; 
; >=  {((sc.input.V[10].X*2.5)+of.input.V[10].X)} {3300.}
(assert (<= (+ (* sc_189 2.5) of_189) 3300.))
; 
; <=  {((sc.input.V[10].X*2.5)+of.input.V[10].X)} {0.}
(assert (>= (+ (* sc_189 2.5) of_189) 0.))
; 
; >=  {((sc.input.V[10].O*2.5)+of.input.V[10].O)} {3300.}
(assert (<= (+ (* sc_190 2.5) of_190) 3300.))
; 
; <=  {((sc.input.V[10].O*2.5)+of.input.V[10].O)} {0.}
(assert (>= (+ (* sc_190 2.5) of_190) 0.))
(declare-fun sc_191 () Real)
(assert (> sc_191 1e-08))
(declare-fun of_191 () Real)
(declare-fun sc_192 () Real)
(assert (> sc_192 1e-08))
(declare-fun of_192 () Real)
; 
; =  {sc.input.V[26].O} {sc.input.V[26].X}
(assert (= sc_192 sc_191))
; 
; =  {of.input.V[26].O} {of.input.V[26].X}
(assert (= of_192 of_191))
; 
; >=  {((sc.input.V[26].X*1.)+of.input.V[26].X)} {3300.}
(assert (<= (+ (* sc_191 1.) of_191) 3300.))
; 
; <=  {((sc.input.V[26].X*1.)+of.input.V[26].X)} {0.}
(assert (>= (+ (* sc_191 1.) of_191) 0.))
; 
; >=  {((sc.input.V[26].O*1.)+of.input.V[26].O)} {3300.}
(assert (<= (+ (* sc_192 1.) of_192) 3300.))
; 
; <=  {((sc.input.V[26].O*1.)+of.input.V[26].O)} {0.}
(assert (>= (+ (* sc_192 1.) of_192) 0.))
(declare-fun sc_193 () Real)
(assert (> sc_193 1e-08))
(declare-fun of_193 () Real)
(declare-fun sc_194 () Real)
(assert (> sc_194 1e-08))
(declare-fun of_194 () Real)
; 
; =  {sc.input.V[38].O} {sc.input.V[38].X}
(assert (= sc_194 sc_193))
; 
; =  {of.input.V[38].O} {of.input.V[38].X}
(assert (= of_194 of_193))
; 
; >=  {((sc.input.V[38].X*1.)+of.input.V[38].X)} {3300.}
(assert (<= (+ (* sc_193 1.) of_193) 3300.))
; 
; <=  {((sc.input.V[38].X*1.)+of.input.V[38].X)} {0.}
(assert (>= (+ (* sc_193 1.) of_193) 0.))
; 
; >=  {((sc.input.V[38].O*1.)+of.input.V[38].O)} {3300.}
(assert (<= (+ (* sc_194 1.) of_194) 3300.))
; 
; <=  {((sc.input.V[38].O*1.)+of.input.V[38].O)} {0.}
(assert (>= (+ (* sc_194 1.) of_194) 0.))
(declare-fun sc_195 () Real)
(assert (> sc_195 1e-08))
(declare-fun of_195 () Real)
(declare-fun sc_196 () Real)
(assert (> sc_196 1e-08))
(declare-fun of_196 () Real)
; 
; =  {sc.input.V[27].O} {sc.input.V[27].X}
(assert (= sc_196 sc_195))
; 
; =  {of.input.V[27].O} {of.input.V[27].X}
(assert (= of_196 of_195))
; 
; >=  {((sc.input.V[27].X*1.)+of.input.V[27].X)} {3300.}
(assert (<= (+ (* sc_195 1.) of_195) 3300.))
; 
; <=  {((sc.input.V[27].X*1.)+of.input.V[27].X)} {0.}
(assert (>= (+ (* sc_195 1.) of_195) 0.))
; 
; >=  {((sc.input.V[27].O*1.)+of.input.V[27].O)} {3300.}
(assert (<= (+ (* sc_196 1.) of_196) 3300.))
; 
; <=  {((sc.input.V[27].O*1.)+of.input.V[27].O)} {0.}
(assert (>= (+ (* sc_196 1.) of_196) 0.))
(declare-fun sc_197 () Real)
(assert (> sc_197 1e-08))
(declare-fun of_197 () Real)
(declare-fun sc_198 () Real)
(assert (> sc_198 1e-08))
(declare-fun of_198 () Real)
; 
; =  {sc.input.V[15].O} {sc.input.V[15].X}
(assert (= sc_198 sc_197))
; 
; =  {of.input.V[15].O} {of.input.V[15].X}
(assert (= of_198 of_197))
; 
; >=  {((sc.input.V[15].X*0.)+of.input.V[15].X)} {3300.}
(assert (<= (+ (* sc_197 0.) of_197) 3300.))
; 
; <=  {((sc.input.V[15].X*0.)+of.input.V[15].X)} {0.}
(assert (>= (+ (* sc_197 0.) of_197) 0.))
; 
; >=  {((sc.input.V[15].O*0.)+of.input.V[15].O)} {3300.}
(assert (<= (+ (* sc_198 0.) of_198) 3300.))
; 
; <=  {((sc.input.V[15].O*0.)+of.input.V[15].O)} {0.}
(assert (>= (+ (* sc_198 0.) of_198) 0.))
(declare-fun sc_199 () Real)
(assert (> sc_199 1e-08))
(declare-fun of_199 () Real)
(declare-fun sc_200 () Real)
(assert (> sc_200 1e-08))
(declare-fun of_200 () Real)
; 
; =  {sc.input.V[6].O} {sc.input.V[6].X}
(assert (= sc_200 sc_199))
; 
; =  {of.input.V[6].O} {of.input.V[6].X}
(assert (= of_200 of_199))
; 
; >=  {((sc.input.V[6].X*31.2)+of.input.V[6].X)} {3300.}
(assert (<= (+ (* sc_199 31.2) of_199) 3300.))
; 
; <=  {((sc.input.V[6].X*31.2)+of.input.V[6].X)} {0.}
(assert (>= (+ (* sc_199 31.2) of_199) 0.))
; 
; >=  {((sc.input.V[6].O*31.2)+of.input.V[6].O)} {3300.}
(assert (<= (+ (* sc_200 31.2) of_200) 3300.))
; 
; <=  {((sc.input.V[6].O*31.2)+of.input.V[6].O)} {0.}
(assert (>= (+ (* sc_200 31.2) of_200) 0.))
(declare-fun sc_201 () Real)
(assert (> sc_201 1e-08))
(declare-fun of_201 () Real)
(declare-fun sc_202 () Real)
(assert (> sc_202 1e-08))
(declare-fun of_202 () Real)
; 
; =  {sc.input.V[36].O} {sc.input.V[36].X}
(assert (= sc_202 sc_201))
; 
; =  {of.input.V[36].O} {of.input.V[36].X}
(assert (= of_202 of_201))
; 
; >=  {((sc.input.V[36].X*1.)+of.input.V[36].X)} {3300.}
(assert (<= (+ (* sc_201 1.) of_201) 3300.))
; 
; <=  {((sc.input.V[36].X*1.)+of.input.V[36].X)} {0.}
(assert (>= (+ (* sc_201 1.) of_201) 0.))
; 
; >=  {((sc.input.V[36].O*1.)+of.input.V[36].O)} {3300.}
(assert (<= (+ (* sc_202 1.) of_202) 3300.))
; 
; <=  {((sc.input.V[36].O*1.)+of.input.V[36].O)} {0.}
(assert (>= (+ (* sc_202 1.) of_202) 0.))
(declare-fun sc_203 () Real)
(assert (> sc_203 1e-08))
(declare-fun of_203 () Real)
(declare-fun sc_204 () Real)
(assert (> sc_204 1e-08))
(declare-fun of_204 () Real)
; 
; =  {sc.input.V[14].O} {sc.input.V[14].X}
(assert (= sc_204 sc_203))
; 
; =  {of.input.V[14].O} {of.input.V[14].X}
(assert (= of_204 of_203))
; 
; >=  {((sc.input.V[14].X*0.)+of.input.V[14].X)} {3300.}
(assert (<= (+ (* sc_203 0.) of_203) 3300.))
; 
; <=  {((sc.input.V[14].X*0.)+of.input.V[14].X)} {0.}
(assert (>= (+ (* sc_203 0.) of_203) 0.))
; 
; >=  {((sc.input.V[14].O*0.)+of.input.V[14].O)} {3300.}
(assert (<= (+ (* sc_204 0.) of_204) 3300.))
; 
; <=  {((sc.input.V[14].O*0.)+of.input.V[14].O)} {0.}
(assert (>= (+ (* sc_204 0.) of_204) 0.))
(declare-fun sc_205 () Real)
(assert (> sc_205 1e-08))
(declare-fun of_205 () Real)
(declare-fun sc_206 () Real)
(assert (> sc_206 1e-08))
(declare-fun of_206 () Real)
; 
; =  {sc.input.V[21].O} {sc.input.V[21].X}
(assert (= sc_206 sc_205))
; 
; =  {of.input.V[21].O} {of.input.V[21].X}
(assert (= of_206 of_205))
; 
; >=  {((sc.input.V[21].X*0.004)+of.input.V[21].X)} {3300.}
(assert (<= (+ (* sc_205 0.004) of_205) 3300.))
; 
; <=  {((sc.input.V[21].X*0.004)+of.input.V[21].X)} {0.}
(assert (>= (+ (* sc_205 0.004) of_205) 0.))
; 
; >=  {((sc.input.V[21].O*0.004)+of.input.V[21].O)} {3300.}
(assert (<= (+ (* sc_206 0.004) of_206) 3300.))
; 
; <=  {((sc.input.V[21].O*0.004)+of.input.V[21].O)} {0.}
(assert (>= (+ (* sc_206 0.004) of_206) 0.))
(declare-fun sc_207 () Real)
(assert (> sc_207 1e-08))
(declare-fun of_207 () Real)
(declare-fun sc_208 () Real)
(assert (> sc_208 1e-08))
(declare-fun of_208 () Real)
; 
; =  {sc.input.V[33].O} {sc.input.V[33].X}
(assert (= sc_208 sc_207))
; 
; =  {of.input.V[33].O} {of.input.V[33].X}
(assert (= of_208 of_207))
; 
; >=  {((sc.input.V[33].X*1.)+of.input.V[33].X)} {3300.}
(assert (<= (+ (* sc_207 1.) of_207) 3300.))
; 
; <=  {((sc.input.V[33].X*1.)+of.input.V[33].X)} {0.}
(assert (>= (+ (* sc_207 1.) of_207) 0.))
; 
; >=  {((sc.input.V[33].O*1.)+of.input.V[33].O)} {3300.}
(assert (<= (+ (* sc_208 1.) of_208) 3300.))
; 
; <=  {((sc.input.V[33].O*1.)+of.input.V[33].O)} {0.}
(assert (>= (+ (* sc_208 1.) of_208) 0.))
(declare-fun sc_209 () Real)
(assert (> sc_209 1e-08))
(declare-fun of_209 () Real)
(declare-fun sc_210 () Real)
(assert (> sc_210 1e-08))
(declare-fun of_210 () Real)
; 
; =  {sc.input.V[37].O} {sc.input.V[37].X}
(assert (= sc_210 sc_209))
; 
; =  {of.input.V[37].O} {of.input.V[37].X}
(assert (= of_210 of_209))
; 
; >=  {((sc.input.V[37].X*1.)+of.input.V[37].X)} {3300.}
(assert (<= (+ (* sc_209 1.) of_209) 3300.))
; 
; <=  {((sc.input.V[37].X*1.)+of.input.V[37].X)} {0.}
(assert (>= (+ (* sc_209 1.) of_209) 0.))
; 
; >=  {((sc.input.V[37].O*1.)+of.input.V[37].O)} {3300.}
(assert (<= (+ (* sc_210 1.) of_210) 3300.))
; 
; <=  {((sc.input.V[37].O*1.)+of.input.V[37].O)} {0.}
(assert (>= (+ (* sc_210 1.) of_210) 0.))
(declare-fun sc_211 () Real)
(assert (> sc_211 1e-08))
(declare-fun of_211 () Real)
(declare-fun sc_212 () Real)
(assert (> sc_212 1e-08))
(declare-fun of_212 () Real)
; 
; =  {sc.input.V[16].O} {sc.input.V[16].X}
(assert (= sc_212 sc_211))
; 
; =  {of.input.V[16].O} {of.input.V[16].X}
(assert (= of_212 of_211))
; 
; >=  {((sc.input.V[16].X*0.)+of.input.V[16].X)} {3300.}
(assert (<= (+ (* sc_211 0.) of_211) 3300.))
; 
; <=  {((sc.input.V[16].X*0.)+of.input.V[16].X)} {0.}
(assert (>= (+ (* sc_211 0.) of_211) 0.))
; 
; >=  {((sc.input.V[16].O*0.)+of.input.V[16].O)} {3300.}
(assert (<= (+ (* sc_212 0.) of_212) 3300.))
; 
; <=  {((sc.input.V[16].O*0.)+of.input.V[16].O)} {0.}
(assert (>= (+ (* sc_212 0.) of_212) 0.))
(declare-fun sc_213 () Real)
(assert (> sc_213 1e-08))
(declare-fun of_213 () Real)
(declare-fun sc_214 () Real)
(assert (> sc_214 1e-08))
(declare-fun of_214 () Real)
; 
; =  {sc.input.V[24].O} {sc.input.V[24].X}
(assert (= sc_214 sc_213))
; 
; =  {of.input.V[24].O} {of.input.V[24].X}
(assert (= of_214 of_213))
; 
; >=  {((sc.input.V[24].X*1.)+of.input.V[24].X)} {3300.}
(assert (<= (+ (* sc_213 1.) of_213) 3300.))
; 
; <=  {((sc.input.V[24].X*1.)+of.input.V[24].X)} {0.}
(assert (>= (+ (* sc_213 1.) of_213) 0.))
; 
; >=  {((sc.input.V[24].O*1.)+of.input.V[24].O)} {3300.}
(assert (<= (+ (* sc_214 1.) of_214) 3300.))
; 
; <=  {((sc.input.V[24].O*1.)+of.input.V[24].O)} {0.}
(assert (>= (+ (* sc_214 1.) of_214) 0.))
(declare-fun sc_215 () Real)
(assert (> sc_215 1e-08))
(declare-fun of_215 () Real)
(declare-fun sc_216 () Real)
(assert (> sc_216 1e-08))
(declare-fun of_216 () Real)
; 
; =  {sc.input.V[3].O} {sc.input.V[3].X}
(assert (= sc_216 sc_215))
; 
; =  {of.input.V[3].O} {of.input.V[3].X}
(assert (= of_216 of_215))
; 
; >=  {((sc.input.V[3].X*2.)+of.input.V[3].X)} {3300.}
(assert (<= (+ (* sc_215 2.) of_215) 3300.))
; 
; <=  {((sc.input.V[3].X*2.)+of.input.V[3].X)} {0.}
(assert (>= (+ (* sc_215 2.) of_215) 0.))
; 
; >=  {((sc.input.V[3].O*2.)+of.input.V[3].O)} {3300.}
(assert (<= (+ (* sc_216 2.) of_216) 3300.))
; 
; <=  {((sc.input.V[3].O*2.)+of.input.V[3].O)} {0.}
(assert (>= (+ (* sc_216 2.) of_216) 0.))
(declare-fun sc_217 () Real)
(assert (> sc_217 1e-08))
(declare-fun of_217 () Real)
(declare-fun sc_218 () Real)
(assert (> sc_218 1e-08))
(declare-fun of_218 () Real)
; 
; =  {sc.input.V[30].O} {sc.input.V[30].X}
(assert (= sc_218 sc_217))
; 
; =  {of.input.V[30].O} {of.input.V[30].X}
(assert (= of_218 of_217))
; 
; >=  {((sc.input.V[30].X*1.)+of.input.V[30].X)} {3300.}
(assert (<= (+ (* sc_217 1.) of_217) 3300.))
; 
; <=  {((sc.input.V[30].X*1.)+of.input.V[30].X)} {0.}
(assert (>= (+ (* sc_217 1.) of_217) 0.))
; 
; >=  {((sc.input.V[30].O*1.)+of.input.V[30].O)} {3300.}
(assert (<= (+ (* sc_218 1.) of_218) 3300.))
; 
; <=  {((sc.input.V[30].O*1.)+of.input.V[30].O)} {0.}
(assert (>= (+ (* sc_218 1.) of_218) 0.))
(declare-fun sc_219 () Real)
(assert (> sc_219 1e-08))
(declare-fun of_219 () Real)
(declare-fun sc_220 () Real)
(assert (> sc_220 1e-08))
(declare-fun of_220 () Real)
; 
; =  {sc.input.V[4].O} {sc.input.V[4].X}
(assert (= sc_220 sc_219))
; 
; =  {of.input.V[4].O} {of.input.V[4].X}
(assert (= of_220 of_219))
; 
; >=  {((sc.input.V[4].X*2.)+of.input.V[4].X)} {3300.}
(assert (<= (+ (* sc_219 2.) of_219) 3300.))
; 
; <=  {((sc.input.V[4].X*2.)+of.input.V[4].X)} {0.}
(assert (>= (+ (* sc_219 2.) of_219) 0.))
; 
; >=  {((sc.input.V[4].O*2.)+of.input.V[4].O)} {3300.}
(assert (<= (+ (* sc_220 2.) of_220) 3300.))
; 
; <=  {((sc.input.V[4].O*2.)+of.input.V[4].O)} {0.}
(assert (>= (+ (* sc_220 2.) of_220) 0.))
(declare-fun sc_221 () Real)
(assert (> sc_221 1e-08))
(declare-fun of_221 () Real)
(declare-fun sc_222 () Real)
(assert (> sc_222 1e-08))
(declare-fun of_222 () Real)
; 
; =  {sc.input.V[5].O} {sc.input.V[5].X}
(assert (= sc_222 sc_221))
; 
; =  {of.input.V[5].O} {of.input.V[5].X}
(assert (= of_222 of_221))
; 
; >=  {((sc.input.V[5].X*2.)+of.input.V[5].X)} {3300.}
(assert (<= (+ (* sc_221 2.) of_221) 3300.))
; 
; <=  {((sc.input.V[5].X*2.)+of.input.V[5].X)} {0.}
(assert (>= (+ (* sc_221 2.) of_221) 0.))
; 
; >=  {((sc.input.V[5].O*2.)+of.input.V[5].O)} {3300.}
(assert (<= (+ (* sc_222 2.) of_222) 3300.))
; 
; <=  {((sc.input.V[5].O*2.)+of.input.V[5].O)} {0.}
(assert (>= (+ (* sc_222 2.) of_222) 0.))
(declare-fun sc_223 () Real)
(assert (> sc_223 1e-08))
(declare-fun of_223 () Real)
(declare-fun sc_224 () Real)
(assert (> sc_224 1e-08))
(declare-fun of_224 () Real)
; 
; =  {sc.input.V[23].O} {sc.input.V[23].X}
(assert (= sc_224 sc_223))
; 
; =  {of.input.V[23].O} {of.input.V[23].X}
(assert (= of_224 of_223))
; 
; >=  {((sc.input.V[23].X*1.)+of.input.V[23].X)} {3300.}
(assert (<= (+ (* sc_223 1.) of_223) 3300.))
; 
; <=  {((sc.input.V[23].X*1.)+of.input.V[23].X)} {0.}
(assert (>= (+ (* sc_223 1.) of_223) 0.))
; 
; >=  {((sc.input.V[23].O*1.)+of.input.V[23].O)} {3300.}
(assert (<= (+ (* sc_224 1.) of_224) 3300.))
; 
; <=  {((sc.input.V[23].O*1.)+of.input.V[23].O)} {0.}
(assert (>= (+ (* sc_224 1.) of_224) 0.))
(declare-fun sc_225 () Real)
(assert (> sc_225 1e-08))
(declare-fun of_225 () Real)
(declare-fun sc_226 () Real)
(assert (> sc_226 1e-08))
(declare-fun of_226 () Real)
; 
; =  {sc.input.V[25].O} {sc.input.V[25].X}
(assert (= sc_226 sc_225))
; 
; =  {of.input.V[25].O} {of.input.V[25].X}
(assert (= of_226 of_225))
; 
; >=  {((sc.input.V[25].X*1.)+of.input.V[25].X)} {3300.}
(assert (<= (+ (* sc_225 1.) of_225) 3300.))
; 
; <=  {((sc.input.V[25].X*1.)+of.input.V[25].X)} {0.}
(assert (>= (+ (* sc_225 1.) of_225) 0.))
; 
; >=  {((sc.input.V[25].O*1.)+of.input.V[25].O)} {3300.}
(assert (<= (+ (* sc_226 1.) of_226) 3300.))
; 
; <=  {((sc.input.V[25].O*1.)+of.input.V[25].O)} {0.}
(assert (>= (+ (* sc_226 1.) of_226) 0.))
(declare-fun sc_227 () Real)
(assert (> sc_227 1e-08))
(declare-fun of_227 () Real)
(declare-fun sc_228 () Real)
(assert (> sc_228 1e-08))
(declare-fun of_228 () Real)
; 
; =  {sc.input.V[1].O} {sc.input.V[1].X}
(assert (= sc_228 sc_227))
; 
; =  {of.input.V[1].O} {of.input.V[1].X}
(assert (= of_228 of_227))
; 
; >=  {((sc.input.V[1].X*2.)+of.input.V[1].X)} {3300.}
(assert (<= (+ (* sc_227 2.) of_227) 3300.))
; 
; <=  {((sc.input.V[1].X*2.)+of.input.V[1].X)} {0.}
(assert (>= (+ (* sc_227 2.) of_227) 0.))
; 
; >=  {((sc.input.V[1].O*2.)+of.input.V[1].O)} {3300.}
(assert (<= (+ (* sc_228 2.) of_228) 3300.))
; 
; <=  {((sc.input.V[1].O*2.)+of.input.V[1].O)} {0.}
(assert (>= (+ (* sc_228 2.) of_228) 0.))
(declare-fun sc_229 () Real)
(assert (> sc_229 1e-08))
(declare-fun of_229 () Real)
(declare-fun sc_230 () Real)
(assert (> sc_230 1e-08))
(declare-fun of_230 () Real)
; 
; =  {sc.input.V[28].O} {sc.input.V[28].X}
(assert (= sc_230 sc_229))
; 
; =  {of.input.V[28].O} {of.input.V[28].X}
(assert (= of_230 of_229))
; 
; >=  {((sc.input.V[28].X*1.)+of.input.V[28].X)} {3300.}
(assert (<= (+ (* sc_229 1.) of_229) 3300.))
; 
; <=  {((sc.input.V[28].X*1.)+of.input.V[28].X)} {0.}
(assert (>= (+ (* sc_229 1.) of_229) 0.))
; 
; >=  {((sc.input.V[28].O*1.)+of.input.V[28].O)} {3300.}
(assert (<= (+ (* sc_230 1.) of_230) 3300.))
; 
; <=  {((sc.input.V[28].O*1.)+of.input.V[28].O)} {0.}
(assert (>= (+ (* sc_230 1.) of_230) 0.))
(declare-fun sc_231 () Real)
(assert (> sc_231 1e-08))
(declare-fun of_231 () Real)
(declare-fun sc_232 () Real)
(assert (> sc_232 1e-08))
(declare-fun of_232 () Real)
; 
; =  {sc.input.V[17].O} {sc.input.V[17].X}
(assert (= sc_232 sc_231))
; 
; =  {of.input.V[17].O} {of.input.V[17].X}
(assert (= of_232 of_231))
; 
; >=  {((sc.input.V[17].X*0.5)+of.input.V[17].X)} {3300.}
(assert (<= (+ (* sc_231 0.5) of_231) 3300.))
; 
; <=  {((sc.input.V[17].X*0.5)+of.input.V[17].X)} {0.}
(assert (>= (+ (* sc_231 0.5) of_231) 0.))
; 
; >=  {((sc.input.V[17].O*0.5)+of.input.V[17].O)} {3300.}
(assert (<= (+ (* sc_232 0.5) of_232) 3300.))
; 
; <=  {((sc.input.V[17].O*0.5)+of.input.V[17].O)} {0.}
(assert (>= (+ (* sc_232 0.5) of_232) 0.))
(declare-fun sc_233 () Real)
(assert (> sc_233 1e-08))
(declare-fun of_233 () Real)
(declare-fun sc_234 () Real)
(assert (> sc_234 1e-08))
(declare-fun of_234 () Real)
; 
; =  {sc.input.V[18].O} {sc.input.V[18].X}
(assert (= sc_234 sc_233))
; 
; =  {of.input.V[18].O} {of.input.V[18].X}
(assert (= of_234 of_233))
; 
; >=  {((sc.input.V[18].X*-1.)+of.input.V[18].X)} {3300.}
(assert (<= (+ (* sc_233 -1.) of_233) 3300.))
; 
; <=  {((sc.input.V[18].X*-1.)+of.input.V[18].X)} {0.}
(assert (>= (+ (* sc_233 -1.) of_233) 0.))
; 
; >=  {((sc.input.V[18].O*-1.)+of.input.V[18].O)} {3300.}
(assert (<= (+ (* sc_234 -1.) of_234) 3300.))
; 
; <=  {((sc.input.V[18].O*-1.)+of.input.V[18].O)} {0.}
(assert (>= (+ (* sc_234 -1.) of_234) 0.))
(declare-fun sc_235 () Real)
(assert (> sc_235 1e-08))
(declare-fun of_235 () Real)
(declare-fun sc_236 () Real)
(assert (> sc_236 1e-08))
(declare-fun of_236 () Real)
; 
; =  {sc.input.V[19].O} {sc.input.V[19].X}
(assert (= sc_236 sc_235))
; 
; =  {of.input.V[19].O} {of.input.V[19].X}
(assert (= of_236 of_235))
; 
; >=  {((sc.input.V[19].X*0.35)+of.input.V[19].X)} {3300.}
(assert (<= (+ (* sc_235 0.35) of_235) 3300.))
; 
; <=  {((sc.input.V[19].X*0.35)+of.input.V[19].X)} {0.}
(assert (>= (+ (* sc_235 0.35) of_235) 0.))
; 
; >=  {((sc.input.V[19].O*0.35)+of.input.V[19].O)} {3300.}
(assert (<= (+ (* sc_236 0.35) of_236) 3300.))
; 
; <=  {((sc.input.V[19].O*0.35)+of.input.V[19].O)} {0.}
(assert (>= (+ (* sc_236 0.35) of_236) 0.))
(declare-fun sc_237 () Real)
(assert (> sc_237 1e-08))
(declare-fun of_237 () Real)
(declare-fun sc_238 () Real)
(assert (> sc_238 1e-08))
(declare-fun of_238 () Real)
; 
; =  {sc.input.V[32].O} {sc.input.V[32].X}
(assert (= sc_238 sc_237))
; 
; =  {of.input.V[32].O} {of.input.V[32].X}
(assert (= of_238 of_237))
; 
; >=  {((sc.input.V[32].X*1.)+of.input.V[32].X)} {3300.}
(assert (<= (+ (* sc_237 1.) of_237) 3300.))
; 
; <=  {((sc.input.V[32].X*1.)+of.input.V[32].X)} {0.}
(assert (>= (+ (* sc_237 1.) of_237) 0.))
; 
; >=  {((sc.input.V[32].O*1.)+of.input.V[32].O)} {3300.}
(assert (<= (+ (* sc_238 1.) of_238) 3300.))
; 
; <=  {((sc.input.V[32].O*1.)+of.input.V[32].O)} {0.}
(assert (>= (+ (* sc_238 1.) of_238) 0.))
(declare-fun sc_239 () Real)
(assert (> sc_239 1e-08))
(declare-fun of_239 () Real)
(declare-fun sc_240 () Real)
(assert (> sc_240 1e-08))
(declare-fun of_240 () Real)
; 
; =  {sc.input.V[22].O} {sc.input.V[22].X}
(assert (= sc_240 sc_239))
; 
; =  {of.input.V[22].O} {of.input.V[22].X}
(assert (= of_240 of_239))
; 
; >=  {((sc.input.V[22].X*312.5)+of.input.V[22].X)} {3300.}
(assert (<= (+ (* sc_239 312.5) of_239) 3300.))
; 
; <=  {((sc.input.V[22].X*312.5)+of.input.V[22].X)} {0.}
(assert (>= (+ (* sc_239 312.5) of_239) 0.))
; 
; >=  {((sc.input.V[22].O*312.5)+of.input.V[22].O)} {3300.}
(assert (<= (+ (* sc_240 312.5) of_240) 3300.))
; 
; <=  {((sc.input.V[22].O*312.5)+of.input.V[22].O)} {0.}
(assert (>= (+ (* sc_240 312.5) of_240) 0.))
(declare-fun sc_241 () Real)
(assert (> sc_241 1e-08))
(declare-fun of_241 () Real)
(declare-fun sc_242 () Real)
(assert (> sc_242 1e-08))
(declare-fun of_242 () Real)
(declare-fun sc_243 () Real)
(assert (> sc_243 1e-08))
(declare-fun of_243 () Real)
; no offset
(assert (= of_242 0.))
; no offset
(assert (= of_241 0.))
; 
; =  {sc.itov[7].Y} {(sc.itov[7].K*sc.itov[7].X)}
(assert (= sc_243 (* sc_242 sc_241)))
; 
; =  {of.itov[7].Y} {0.}
(assert (= of_243 0.))
(declare-fun slbot_241 () Real)
(declare-fun sltop_241 () Real)
; 
; =  {(((sc.itov[7].X*0.5)+of.itov[7].X)+sl.min.itov[7].X)} {0.0001}
(assert (= (+ (+ (* sc_241 0.5) of_241) slbot_241) 0.0001))
; 
; =  {(((sc.itov[7].X*16.6)+of.itov[7].X)+sl.max.itov[7].X)} {10.}
(assert (= (+ (+ (* sc_241 16.6) of_241) sltop_241) 10.))
(declare-fun slbot_243 () Real)
(declare-fun sltop_243 () Real)
; 
; =  {(((sc.itov[7].Y*0.5)+of.itov[7].Y)+sl.min.itov[7].Y)} {0.0001}
(assert (= (+ (+ (* sc_243 0.5) of_243) slbot_243) 0.0001))
; 
; =  {(((sc.itov[7].Y*16.6)+of.itov[7].Y)+sl.max.itov[7].Y)} {3300.}
(assert (= (+ (+ (* sc_243 16.6) of_243) sltop_243) 3300.))
; 
; >=  {((sc.itov[7].K*1.)+of.itov[7].K)} {330.}
(assert (<= (+ (* sc_242 1.) of_242) 330.))
; 
; <=  {((sc.itov[7].K*1.)+of.itov[7].K)} {1.}
(assert (>= (+ (* sc_242 1.) of_242) 1.))
(declare-fun slbot_243 () Real)
(declare-fun sltop_243 () Real)
; 
; =  {(((sc.itov[7].Y*0.5)+of.itov[7].Y)+sl.min.itov[7].Y)} {0.0001}
(assert (= (+ (+ (* sc_243 0.5) of_243) slbot_243) 0.0001))
; 
; =  {(((sc.itov[7].Y*16.6)+of.itov[7].Y)+sl.max.itov[7].Y)} {3300.}
(assert (= (+ (+ (* sc_243 16.6) of_243) sltop_243) 3300.))
(declare-fun sc_244 () Real)
(assert (> sc_244 1e-08))
(declare-fun of_244 () Real)
(declare-fun sc_245 () Real)
(assert (> sc_245 1e-08))
(declare-fun of_245 () Real)
(declare-fun sc_246 () Real)
(assert (> sc_246 1e-08))
(declare-fun of_246 () Real)
; no offset
(assert (= of_245 0.))
; no offset
(assert (= of_244 0.))
; 
; =  {sc.itov[13].Y} {(sc.itov[13].K*sc.itov[13].X)}
(assert (= sc_246 (* sc_245 sc_244)))
; 
; =  {of.itov[13].Y} {0.}
(assert (= of_246 0.))
(declare-fun slbot_244 () Real)
(declare-fun sltop_244 () Real)
; 
; =  {(((sc.itov[13].X*1.)+of.itov[13].X)+sl.min.itov[13].X)} {0.0001}
(assert (= (+ (+ (* sc_244 1.) of_244) slbot_244) 0.0001))
; 
; =  {(((sc.itov[13].X*5.65685424949)+of.itov[13].X)+sl.max.itov[13].X)} {10.}
(assert (= (+ (+ (* sc_244 5.65685424949) of_244) sltop_244) 10.))
(declare-fun slbot_246 () Real)
(declare-fun sltop_246 () Real)
; 
; =  {(((sc.itov[13].Y*1.)+of.itov[13].Y)+sl.min.itov[13].Y)} {0.0001}
(assert (= (+ (+ (* sc_246 1.) of_246) slbot_246) 0.0001))
; 
; =  {(((sc.itov[13].Y*5.65685424949)+of.itov[13].Y)+sl.max.itov[13].Y)} {3300.}
(assert (= (+ (+ (* sc_246 5.65685424949) of_246) sltop_246) 3300.))
; 
; >=  {((sc.itov[13].K*1.)+of.itov[13].K)} {330.}
(assert (<= (+ (* sc_245 1.) of_245) 330.))
; 
; <=  {((sc.itov[13].K*1.)+of.itov[13].K)} {1.}
(assert (>= (+ (* sc_245 1.) of_245) 1.))
(declare-fun slbot_246 () Real)
(declare-fun sltop_246 () Real)
; 
; =  {(((sc.itov[13].Y*1.)+of.itov[13].Y)+sl.min.itov[13].Y)} {0.0001}
(assert (= (+ (+ (* sc_246 1.) of_246) slbot_246) 0.0001))
; 
; =  {(((sc.itov[13].Y*5.65685424949)+of.itov[13].Y)+sl.max.itov[13].Y)} {3300.}
(assert (= (+ (+ (* sc_246 5.65685424949) of_246) sltop_246) 3300.))
(declare-fun sc_247 () Real)
(assert (> sc_247 1e-08))
(declare-fun of_247 () Real)
(declare-fun sc_248 () Real)
(assert (> sc_248 1e-08))
(declare-fun of_248 () Real)
(declare-fun sc_249 () Real)
(assert (> sc_249 1e-08))
(declare-fun of_249 () Real)
; no offset
(assert (= of_248 0.))
; no offset
(assert (= of_247 0.))
; 
; =  {sc.itov[31].Y} {(sc.itov[31].K*sc.itov[31].X)}
(assert (= sc_249 (* sc_248 sc_247)))
; 
; =  {of.itov[31].Y} {0.}
(assert (= of_249 0.))
(declare-fun slbot_247 () Real)
(declare-fun sltop_247 () Real)
; 
; =  {(((sc.itov[31].X*0.)+of.itov[31].X)+sl.min.itov[31].X)} {0.0001}
(assert (= (+ (+ (* sc_247 0.) of_247) slbot_247) 0.0001))
; 
; =  {(((sc.itov[31].X*3.2768e-06)+of.itov[31].X)+sl.max.itov[31].X)} {10.}
(assert (= (+ (+ (* sc_247 3.2768e-06) of_247) sltop_247) 10.))
(declare-fun slbot_249 () Real)
(declare-fun sltop_249 () Real)
; 
; =  {(((sc.itov[31].Y*0.)+of.itov[31].Y)+sl.min.itov[31].Y)} {0.0001}
(assert (= (+ (+ (* sc_249 0.) of_249) slbot_249) 0.0001))
; 
; =  {(((sc.itov[31].Y*3.2768e-06)+of.itov[31].Y)+sl.max.itov[31].Y)} {3300.}
(assert (= (+ (+ (* sc_249 3.2768e-06) of_249) sltop_249) 3300.))
; 
; >=  {((sc.itov[31].K*1.)+of.itov[31].K)} {330.}
(assert (<= (+ (* sc_248 1.) of_248) 330.))
; 
; <=  {((sc.itov[31].K*1.)+of.itov[31].K)} {1.}
(assert (>= (+ (* sc_248 1.) of_248) 1.))
(declare-fun slbot_249 () Real)
(declare-fun sltop_249 () Real)
; 
; =  {(((sc.itov[31].Y*0.)+of.itov[31].Y)+sl.min.itov[31].Y)} {0.0001}
(assert (= (+ (+ (* sc_249 0.) of_249) slbot_249) 0.0001))
; 
; =  {(((sc.itov[31].Y*3.2768e-06)+of.itov[31].Y)+sl.max.itov[31].Y)} {3300.}
(assert (= (+ (+ (* sc_249 3.2768e-06) of_249) sltop_249) 3300.))
(declare-fun sc_250 () Real)
(assert (> sc_250 1e-08))
(declare-fun of_250 () Real)
(declare-fun sc_251 () Real)
(assert (> sc_251 1e-08))
(declare-fun of_251 () Real)
(declare-fun sc_252 () Real)
(assert (> sc_252 1e-08))
(declare-fun of_252 () Real)
; no offset
(assert (= of_251 0.))
; no offset
(assert (= of_250 0.))
; 
; =  {sc.itov[27].Y} {(sc.itov[27].K*sc.itov[27].X)}
(assert (= sc_252 (* sc_251 sc_250)))
; 
; =  {of.itov[27].Y} {0.}
(assert (= of_252 0.))
(declare-fun slbot_250 () Real)
(declare-fun sltop_250 () Real)
; 
; =  {(((sc.itov[27].X*0.)+of.itov[27].X)+sl.min.itov[27].X)} {0.0001}
(assert (= (+ (+ (* sc_250 0.) of_250) slbot_250) 0.0001))
; 
; =  {(((sc.itov[27].X*305175.78125)+of.itov[27].X)+sl.max.itov[27].X)} {10.}
(assert (= (+ (+ (* sc_250 305175.78125) of_250) sltop_250) 10.))
(declare-fun slbot_252 () Real)
(declare-fun sltop_252 () Real)
; 
; =  {(((sc.itov[27].Y*0.)+of.itov[27].Y)+sl.min.itov[27].Y)} {0.0001}
(assert (= (+ (+ (* sc_252 0.) of_252) slbot_252) 0.0001))
; 
; =  {(((sc.itov[27].Y*305175.78125)+of.itov[27].Y)+sl.max.itov[27].Y)} {3300.}
(assert (= (+ (+ (* sc_252 305175.78125) of_252) sltop_252) 3300.))
; 
; >=  {((sc.itov[27].K*1.)+of.itov[27].K)} {330.}
(assert (<= (+ (* sc_251 1.) of_251) 330.))
; 
; <=  {((sc.itov[27].K*1.)+of.itov[27].K)} {1.}
(assert (>= (+ (* sc_251 1.) of_251) 1.))
(declare-fun slbot_252 () Real)
(declare-fun sltop_252 () Real)
; 
; =  {(((sc.itov[27].Y*0.)+of.itov[27].Y)+sl.min.itov[27].Y)} {0.0001}
(assert (= (+ (+ (* sc_252 0.) of_252) slbot_252) 0.0001))
; 
; =  {(((sc.itov[27].Y*305175.78125)+of.itov[27].Y)+sl.max.itov[27].Y)} {3300.}
(assert (= (+ (+ (* sc_252 305175.78125) of_252) sltop_252) 3300.))
(declare-fun sc_253 () Real)
(assert (> sc_253 1e-08))
(declare-fun of_253 () Real)
(declare-fun sc_254 () Real)
(assert (> sc_254 1e-08))
(declare-fun of_254 () Real)
(declare-fun sc_255 () Real)
(assert (> sc_255 1e-08))
(declare-fun of_255 () Real)
; no offset
(assert (= of_254 0.))
; no offset
(assert (= of_253 0.))
; 
; =  {sc.itov[24].Y} {(sc.itov[24].K*sc.itov[24].X)}
(assert (= sc_255 (* sc_254 sc_253)))
; 
; =  {of.itov[24].Y} {0.}
(assert (= of_255 0.))
(declare-fun slbot_253 () Real)
(declare-fun sltop_253 () Real)
; 
; =  {(((sc.itov[24].X*1.)+of.itov[24].X)+sl.min.itov[24].X)} {0.0001}
(assert (= (+ (+ (* sc_253 1.) of_253) slbot_253) 0.0001))
; 
; =  {(((sc.itov[24].X*5.65685424949)+of.itov[24].X)+sl.max.itov[24].X)} {10.}
(assert (= (+ (+ (* sc_253 5.65685424949) of_253) sltop_253) 10.))
(declare-fun slbot_255 () Real)
(declare-fun sltop_255 () Real)
; 
; =  {(((sc.itov[24].Y*1.)+of.itov[24].Y)+sl.min.itov[24].Y)} {0.0001}
(assert (= (+ (+ (* sc_255 1.) of_255) slbot_255) 0.0001))
; 
; =  {(((sc.itov[24].Y*5.65685424949)+of.itov[24].Y)+sl.max.itov[24].Y)} {3300.}
(assert (= (+ (+ (* sc_255 5.65685424949) of_255) sltop_255) 3300.))
; 
; >=  {((sc.itov[24].K*1.)+of.itov[24].K)} {330.}
(assert (<= (+ (* sc_254 1.) of_254) 330.))
; 
; <=  {((sc.itov[24].K*1.)+of.itov[24].K)} {1.}
(assert (>= (+ (* sc_254 1.) of_254) 1.))
(declare-fun slbot_255 () Real)
(declare-fun sltop_255 () Real)
; 
; =  {(((sc.itov[24].Y*1.)+of.itov[24].Y)+sl.min.itov[24].Y)} {0.0001}
(assert (= (+ (+ (* sc_255 1.) of_255) slbot_255) 0.0001))
; 
; =  {(((sc.itov[24].Y*5.65685424949)+of.itov[24].Y)+sl.max.itov[24].Y)} {3300.}
(assert (= (+ (+ (* sc_255 5.65685424949) of_255) sltop_255) 3300.))
(declare-fun sc_256 () Real)
(assert (> sc_256 1e-08))
(declare-fun of_256 () Real)
(declare-fun sc_257 () Real)
(assert (> sc_257 1e-08))
(declare-fun of_257 () Real)
(declare-fun sc_258 () Real)
(assert (> sc_258 1e-08))
(declare-fun of_258 () Real)
; no offset
(assert (= of_257 0.))
; no offset
(assert (= of_256 0.))
; 
; =  {sc.itov[30].Y} {(sc.itov[30].K*sc.itov[30].X)}
(assert (= sc_258 (* sc_257 sc_256)))
; 
; =  {of.itov[30].Y} {0.}
(assert (= of_258 0.))
; 
; >=  {((sc.itov[30].X*1.)+of.itov[30].X)} {10.}
(assert (<= (+ (* sc_256 1.) of_256) 10.))
; 
; <=  {((sc.itov[30].X*1.)+of.itov[30].X)} {0.0001}
(assert (>= (+ (* sc_256 1.) of_256) 0.0001))
(declare-fun slbot_257 () Real)
(declare-fun sltop_257 () Real)
; 
; =  {(((sc.itov[30].K*9.05093714108e-05)+of.itov[30].K)+sl.min.itov[30].K)} {1.}
(assert (= (+ (+ (* sc_257 9.05093714108e-05) of_257) slbot_257) 1.))
; 
; =  {(((sc.itov[30].K*883.883476483)+of.itov[30].K)+sl.max.itov[30].K)} {330.}
(assert (= (+ (+ (* sc_257 883.883476483) of_257) sltop_257) 330.))
(declare-fun slbot_258 () Real)
(declare-fun sltop_258 () Real)
; 
; =  {(((sc.itov[30].Y*9.05093714108e-05)+of.itov[30].Y)+sl.min.itov[30].Y)} {0.0001}
(assert (= (+ (+ (* sc_258 9.05093714108e-05) of_258) slbot_258) 0.0001))
; 
; =  {(((sc.itov[30].Y*883.883476483)+of.itov[30].Y)+sl.max.itov[30].Y)} {3300.}
(assert (= (+ (+ (* sc_258 883.883476483) of_258) sltop_258) 3300.))
(declare-fun sc_259 () Real)
(assert (> sc_259 1e-08))
(declare-fun of_259 () Real)
(declare-fun sc_260 () Real)
(assert (> sc_260 1e-08))
(declare-fun of_260 () Real)
(declare-fun sc_261 () Real)
(assert (> sc_261 1e-08))
(declare-fun of_261 () Real)
; no offset
(assert (= of_260 0.))
; no offset
(assert (= of_259 0.))
; 
; =  {sc.itov[19].Y} {(sc.itov[19].K*sc.itov[19].X)}
(assert (= sc_261 (* sc_260 sc_259)))
; 
; =  {of.itov[19].Y} {0.}
(assert (= of_261 0.))
(declare-fun slbot_259 () Real)
(declare-fun sltop_259 () Real)
; 
; =  {(((sc.itov[19].X*0.176776695297)+of.itov[19].X)+sl.min.itov[19].X)} {0.0001}
(assert (= (+ (+ (* sc_259 0.176776695297) of_259) slbot_259) 0.0001))
; 
; =  {(((sc.itov[19].X*1.)+of.itov[19].X)+sl.max.itov[19].X)} {10.}
(assert (= (+ (+ (* sc_259 1.) of_259) sltop_259) 10.))
(declare-fun slbot_261 () Real)
(declare-fun sltop_261 () Real)
; 
; =  {(((sc.itov[19].Y*0.176776695297)+of.itov[19].Y)+sl.min.itov[19].Y)} {0.0001}
(assert (= (+ (+ (* sc_261 0.176776695297) of_261) slbot_261) 0.0001))
; 
; =  {(((sc.itov[19].Y*1.)+of.itov[19].Y)+sl.max.itov[19].Y)} {3300.}
(assert (= (+ (+ (* sc_261 1.) of_261) sltop_261) 3300.))
; 
; >=  {((sc.itov[19].K*1.)+of.itov[19].K)} {330.}
(assert (<= (+ (* sc_260 1.) of_260) 330.))
; 
; <=  {((sc.itov[19].K*1.)+of.itov[19].K)} {1.}
(assert (>= (+ (* sc_260 1.) of_260) 1.))
(declare-fun slbot_261 () Real)
(declare-fun sltop_261 () Real)
; 
; =  {(((sc.itov[19].Y*0.176776695297)+of.itov[19].Y)+sl.min.itov[19].Y)} {0.0001}
(assert (= (+ (+ (* sc_261 0.176776695297) of_261) slbot_261) 0.0001))
; 
; =  {(((sc.itov[19].Y*1.)+of.itov[19].Y)+sl.max.itov[19].Y)} {3300.}
(assert (= (+ (+ (* sc_261 1.) of_261) sltop_261) 3300.))
(declare-fun sc_262 () Real)
(assert (> sc_262 1e-08))
(declare-fun of_262 () Real)
(declare-fun sc_263 () Real)
(assert (> sc_263 1e-08))
(declare-fun of_263 () Real)
(declare-fun sc_264 () Real)
(assert (> sc_264 1e-08))
(declare-fun of_264 () Real)
(declare-fun sc_265 () Real)
(assert (> sc_265 1e-08))
(declare-fun of_265 () Real)
(declare-fun sc_266 () Real)
(assert (> sc_266 1e-08))
(declare-fun of_266 () Real)
; 
; =  {sc.iadd[20].A} {sc.iadd[20].B}
(assert (= sc_264 sc_265))
; 
; =  {sc.iadd[20].A} {sc.iadd[20].C} {sc.iadd[20].D}
(assert (and (= sc_264 sc_263) (= sc_264 sc_262)))
; 
; =  {sc.iadd[20].OUT} {sc.iadd[20].A}
(assert (= sc_266 sc_264))
; 
; =  {of.iadd[20].OUT} {((of.iadd[20].A+of.iadd[20].B)-of.iadd[20].C-of.iadd[20].D)}
(assert (= of_266 (- (+ of_264 of_265) (+ of_263 of_262))))
; 
; >=  {((sc.iadd[20].D*0.)+of.iadd[20].D)} {5.}
(assert (<= (+ (* sc_262 0.) of_262) 5.))
; 
; <=  {((sc.iadd[20].D*0.)+of.iadd[20].D)} {0.}
(assert (>= (+ (* sc_262 0.) of_262) 0.))
; 
; >=  {((sc.iadd[20].C*0.)+of.iadd[20].C)} {5.}
(assert (<= (+ (* sc_263 0.) of_263) 5.))
; 
; <=  {((sc.iadd[20].C*0.)+of.iadd[20].C)} {0.}
(assert (>= (+ (* sc_263 0.) of_263) 0.))
(declare-fun slbot_266 () Real)
(declare-fun sltop_266 () Real)
; 
; =  {(((sc.iadd[20].OUT*0.176776695297)+of.iadd[20].OUT)+sl.min.iadd[20].OUT)} {-10.}
(assert (= (+ (+ (* sc_266 0.176776695297) of_266) slbot_266) -10.))
; 
; =  {(((sc.iadd[20].OUT*1.)+of.iadd[20].OUT)+sl.max.iadd[20].OUT)} {10.}
(assert (= (+ (+ (* sc_266 1.) of_266) sltop_266) 10.))
; 
; >=  {((sc.iadd[20].A*0.)+of.iadd[20].A)} {5.}
(assert (<= (+ (* sc_264 0.) of_264) 5.))
; 
; <=  {((sc.iadd[20].A*0.)+of.iadd[20].A)} {0.}
(assert (>= (+ (* sc_264 0.) of_264) 0.))
(declare-fun slbot_265 () Real)
(declare-fun sltop_265 () Real)
; 
; =  {(((sc.iadd[20].B*0.176776695297)+of.iadd[20].B)+sl.min.iadd[20].B)} {0.}
(assert (= (+ (+ (* sc_265 0.176776695297) of_265) slbot_265) 0.))
; 
; =  {(((sc.iadd[20].B*1.)+of.iadd[20].B)+sl.max.iadd[20].B)} {5.}
(assert (= (+ (+ (* sc_265 1.) of_265) sltop_265) 5.))
(declare-fun slbot_266 () Real)
(declare-fun sltop_266 () Real)
; 
; =  {(((sc.iadd[20].OUT*0.176776695297)+of.iadd[20].OUT)+sl.min.iadd[20].OUT)} {-10.}
(assert (= (+ (+ (* sc_266 0.176776695297) of_266) slbot_266) -10.))
; 
; =  {(((sc.iadd[20].OUT*1.)+of.iadd[20].OUT)+sl.max.iadd[20].OUT)} {10.}
(assert (= (+ (+ (* sc_266 1.) of_266) sltop_266) 10.))
(declare-fun sc_267 () Real)
(assert (> sc_267 1e-08))
(declare-fun of_267 () Real)
(declare-fun sc_268 () Real)
(assert (> sc_268 1e-08))
(declare-fun of_268 () Real)
(declare-fun sc_269 () Real)
(assert (> sc_269 1e-08))
(declare-fun of_269 () Real)
(declare-fun sc_270 () Real)
(assert (> sc_270 1e-08))
(declare-fun of_270 () Real)
(declare-fun sc_271 () Real)
(assert (> sc_271 1e-08))
(declare-fun of_271 () Real)
; 
; =  {sc.iadd[8].A} {sc.iadd[8].B}
(assert (= sc_269 sc_270))
; 
; =  {sc.iadd[8].A} {sc.iadd[8].C} {sc.iadd[8].D}
(assert (and (= sc_269 sc_268) (= sc_269 sc_267)))
; 
; =  {sc.iadd[8].OUT} {sc.iadd[8].A}
(assert (= sc_271 sc_269))
; 
; =  {of.iadd[8].OUT} {((of.iadd[8].A+of.iadd[8].B)-of.iadd[8].C-of.iadd[8].D)}
(assert (= of_271 (- (+ of_269 of_270) (+ of_268 of_267))))
(declare-fun slbot_267 () Real)
(declare-fun sltop_267 () Real)
; 
; =  {(((sc.iadd[8].D*-15.6)+of.iadd[8].D)+sl.min.iadd[8].D)} {0.}
(assert (= (+ (+ (* sc_267 -15.6) of_267) slbot_267) 0.))
; 
; =  {(((sc.iadd[8].D*0.)+of.iadd[8].D)+sl.max.iadd[8].D)} {5.}
(assert (= (+ (+ (* sc_267 0.) of_267) sltop_267) 5.))
; 
; >=  {((sc.iadd[8].C*0.)+of.iadd[8].C)} {5.}
(assert (<= (+ (* sc_268 0.) of_268) 5.))
; 
; <=  {((sc.iadd[8].C*0.)+of.iadd[8].C)} {0.}
(assert (>= (+ (* sc_268 0.) of_268) 0.))
(declare-fun slbot_271 () Real)
(declare-fun sltop_271 () Real)
; 
; =  {(((sc.iadd[8].OUT*0.5)+of.iadd[8].OUT)+sl.min.iadd[8].OUT)} {-10.}
(assert (= (+ (+ (* sc_271 0.5) of_271) slbot_271) -10.))
; 
; =  {(((sc.iadd[8].OUT*16.6)+of.iadd[8].OUT)+sl.max.iadd[8].OUT)} {10.}
(assert (= (+ (+ (* sc_271 16.6) of_271) sltop_271) 10.))
; 
; >=  {((sc.iadd[8].A*0.)+of.iadd[8].A)} {5.}
(assert (<= (+ (* sc_269 0.) of_269) 5.))
; 
; <=  {((sc.iadd[8].A*0.)+of.iadd[8].A)} {0.}
(assert (>= (+ (* sc_269 0.) of_269) 0.))
(declare-fun slbot_270 () Real)
(declare-fun sltop_270 () Real)
; 
; =  {(((sc.iadd[8].B*0.5)+of.iadd[8].B)+sl.min.iadd[8].B)} {0.}
(assert (= (+ (+ (* sc_270 0.5) of_270) slbot_270) 0.))
; 
; =  {(((sc.iadd[8].B*1.)+of.iadd[8].B)+sl.max.iadd[8].B)} {5.}
(assert (= (+ (+ (* sc_270 1.) of_270) sltop_270) 5.))
(declare-fun slbot_271 () Real)
(declare-fun sltop_271 () Real)
; 
; =  {(((sc.iadd[8].OUT*0.5)+of.iadd[8].OUT)+sl.min.iadd[8].OUT)} {-10.}
(assert (= (+ (+ (* sc_271 0.5) of_271) slbot_271) -10.))
; 
; =  {(((sc.iadd[8].OUT*16.6)+of.iadd[8].OUT)+sl.max.iadd[8].OUT)} {10.}
(assert (= (+ (+ (* sc_271 16.6) of_271) sltop_271) 10.))
(declare-fun sc_272 () Real)
(assert (> sc_272 1e-08))
(declare-fun of_272 () Real)
(declare-fun sc_273 () Real)
(assert (> sc_273 1e-08))
(declare-fun of_273 () Real)
(declare-fun sc_274 () Real)
(assert (> sc_274 1e-08))
(declare-fun of_274 () Real)
(declare-fun sc_275 () Real)
(assert (> sc_275 1e-08))
(declare-fun of_275 () Real)
(declare-fun sc_276 () Real)
(assert (> sc_276 1e-08))
(declare-fun of_276 () Real)
; 
; =  {sc.iadd[26].A} {sc.iadd[26].B}
(assert (= sc_274 sc_275))
; 
; =  {sc.iadd[26].A} {sc.iadd[26].C} {sc.iadd[26].D}
(assert (and (= sc_274 sc_273) (= sc_274 sc_272)))
; 
; =  {sc.iadd[26].OUT} {sc.iadd[26].A}
(assert (= sc_276 sc_274))
; 
; =  {of.iadd[26].OUT} {((of.iadd[26].A+of.iadd[26].B)-of.iadd[26].C-of.iadd[26].D)}
(assert (= of_276 (- (+ of_274 of_275) (+ of_273 of_272))))
; 
; >=  {((sc.iadd[26].D*1.)+of.iadd[26].D)} {5.}
(assert (<= (+ (* sc_272 1.) of_272) 5.))
; 
; <=  {((sc.iadd[26].D*1.)+of.iadd[26].D)} {0.}
(assert (>= (+ (* sc_272 1.) of_272) 0.))
; 
; >=  {((sc.iadd[26].C*0.)+of.iadd[26].C)} {5.}
(assert (<= (+ (* sc_273 0.) of_273) 5.))
; 
; <=  {((sc.iadd[26].C*0.)+of.iadd[26].C)} {0.}
(assert (>= (+ (* sc_273 0.) of_273) 0.))
(declare-fun slbot_276 () Real)
(declare-fun sltop_276 () Real)
; 
; =  {(((sc.iadd[26].OUT*-0.5)+of.iadd[26].OUT)+sl.min.iadd[26].OUT)} {-10.}
(assert (= (+ (+ (* sc_276 -0.5) of_276) slbot_276) -10.))
; 
; =  {(((sc.iadd[26].OUT*0.)+of.iadd[26].OUT)+sl.max.iadd[26].OUT)} {10.}
(assert (= (+ (+ (* sc_276 0.) of_276) sltop_276) 10.))
; 
; >=  {((sc.iadd[26].A*0.)+of.iadd[26].A)} {5.}
(assert (<= (+ (* sc_274 0.) of_274) 5.))
; 
; <=  {((sc.iadd[26].A*0.)+of.iadd[26].A)} {0.}
(assert (>= (+ (* sc_274 0.) of_274) 0.))
(declare-fun slbot_275 () Real)
(declare-fun sltop_275 () Real)
; 
; =  {(((sc.iadd[26].B*0.5)+of.iadd[26].B)+sl.min.iadd[26].B)} {0.}
(assert (= (+ (+ (* sc_275 0.5) of_275) slbot_275) 0.))
; 
; =  {(((sc.iadd[26].B*1.)+of.iadd[26].B)+sl.max.iadd[26].B)} {5.}
(assert (= (+ (+ (* sc_275 1.) of_275) sltop_275) 5.))
(declare-fun slbot_276 () Real)
(declare-fun sltop_276 () Real)
; 
; =  {(((sc.iadd[26].OUT*-0.5)+of.iadd[26].OUT)+sl.min.iadd[26].OUT)} {-10.}
(assert (= (+ (+ (* sc_276 -0.5) of_276) slbot_276) -10.))
; 
; =  {(((sc.iadd[26].OUT*0.)+of.iadd[26].OUT)+sl.max.iadd[26].OUT)} {10.}
(assert (= (+ (+ (* sc_276 0.) of_276) sltop_276) 10.))
(declare-fun sc_277 () Real)
(assert (> sc_277 1e-08))
(declare-fun of_277 () Real)
(declare-fun sc_278 () Real)
(assert (> sc_278 1e-08))
(declare-fun of_278 () Real)
(declare-fun sc_279 () Real)
(assert (> sc_279 1e-08))
(declare-fun of_279 () Real)
(declare-fun sc_280 () Real)
(assert (> sc_280 1e-08))
(declare-fun of_280 () Real)
(declare-fun sc_281 () Real)
(assert (> sc_281 1e-08))
(declare-fun of_281 () Real)
; 
; =  {sc.iadd[21].A} {sc.iadd[21].B}
(assert (= sc_279 sc_280))
; 
; =  {sc.iadd[21].A} {sc.iadd[21].C} {sc.iadd[21].D}
(assert (and (= sc_279 sc_278) (= sc_279 sc_277)))
; 
; =  {sc.iadd[21].OUT} {sc.iadd[21].A}
(assert (= sc_281 sc_279))
; 
; =  {of.iadd[21].OUT} {((of.iadd[21].A+of.iadd[21].B)-of.iadd[21].C-of.iadd[21].D)}
(assert (= of_281 (- (+ of_279 of_280) (+ of_278 of_277))))
; 
; >=  {((sc.iadd[21].D*0.)+of.iadd[21].D)} {5.}
(assert (<= (+ (* sc_277 0.) of_277) 5.))
; 
; <=  {((sc.iadd[21].D*0.)+of.iadd[21].D)} {0.}
(assert (>= (+ (* sc_277 0.) of_277) 0.))
; 
; >=  {((sc.iadd[21].C*0.)+of.iadd[21].C)} {5.}
(assert (<= (+ (* sc_278 0.) of_278) 5.))
; 
; <=  {((sc.iadd[21].C*0.)+of.iadd[21].C)} {0.}
(assert (>= (+ (* sc_278 0.) of_278) 0.))
(declare-fun slbot_281 () Real)
(declare-fun sltop_281 () Real)
; 
; =  {(((sc.iadd[21].OUT*0.176776695297)+of.iadd[21].OUT)+sl.min.iadd[21].OUT)} {-10.}
(assert (= (+ (+ (* sc_281 0.176776695297) of_281) slbot_281) -10.))
; 
; =  {(((sc.iadd[21].OUT*1.)+of.iadd[21].OUT)+sl.max.iadd[21].OUT)} {10.}
(assert (= (+ (+ (* sc_281 1.) of_281) sltop_281) 10.))
; 
; >=  {((sc.iadd[21].A*0.)+of.iadd[21].A)} {5.}
(assert (<= (+ (* sc_279 0.) of_279) 5.))
; 
; <=  {((sc.iadd[21].A*0.)+of.iadd[21].A)} {0.}
(assert (>= (+ (* sc_279 0.) of_279) 0.))
(declare-fun slbot_280 () Real)
(declare-fun sltop_280 () Real)
; 
; =  {(((sc.iadd[21].B*0.176776695297)+of.iadd[21].B)+sl.min.iadd[21].B)} {0.}
(assert (= (+ (+ (* sc_280 0.176776695297) of_280) slbot_280) 0.))
; 
; =  {(((sc.iadd[21].B*1.)+of.iadd[21].B)+sl.max.iadd[21].B)} {5.}
(assert (= (+ (+ (* sc_280 1.) of_280) sltop_280) 5.))
(declare-fun slbot_281 () Real)
(declare-fun sltop_281 () Real)
; 
; =  {(((sc.iadd[21].OUT*0.176776695297)+of.iadd[21].OUT)+sl.min.iadd[21].OUT)} {-10.}
(assert (= (+ (+ (* sc_281 0.176776695297) of_281) slbot_281) -10.))
; 
; =  {(((sc.iadd[21].OUT*1.)+of.iadd[21].OUT)+sl.max.iadd[21].OUT)} {10.}
(assert (= (+ (+ (* sc_281 1.) of_281) sltop_281) 10.))
(declare-fun sc_282 () Real)
(assert (> sc_282 1e-08))
(declare-fun of_282 () Real)
(declare-fun sc_283 () Real)
(assert (> sc_283 1e-08))
(declare-fun of_283 () Real)
(declare-fun sc_284 () Real)
(assert (> sc_284 1e-08))
(declare-fun of_284 () Real)
(declare-fun sc_285 () Real)
(assert (> sc_285 1e-08))
(declare-fun of_285 () Real)
(declare-fun sc_286 () Real)
(assert (> sc_286 1e-08))
(declare-fun of_286 () Real)
; 
; =  {sc.iadd[33].A} {sc.iadd[33].B}
(assert (= sc_284 sc_285))
; 
; =  {sc.iadd[33].A} {sc.iadd[33].C} {sc.iadd[33].D}
(assert (and (= sc_284 sc_283) (= sc_284 sc_282)))
; 
; =  {sc.iadd[33].OUT} {sc.iadd[33].A}
(assert (= sc_286 sc_284))
; 
; =  {of.iadd[33].OUT} {((of.iadd[33].A+of.iadd[33].B)-of.iadd[33].C-of.iadd[33].D)}
(assert (= of_286 (- (+ of_284 of_285) (+ of_283 of_282))))
(declare-fun slbot_282 () Real)
(declare-fun sltop_282 () Real)
; 
; =  {(((sc.iadd[33].D*-156.25)+of.iadd[33].D)+sl.min.iadd[33].D)} {0.}
(assert (= (+ (+ (* sc_282 -156.25) of_282) slbot_282) 0.))
; 
; =  {(((sc.iadd[33].D*0.)+of.iadd[33].D)+sl.max.iadd[33].D)} {5.}
(assert (= (+ (+ (* sc_282 0.) of_282) sltop_282) 5.))
; 
; >=  {((sc.iadd[33].C*1.)+of.iadd[33].C)} {5.}
(assert (<= (+ (* sc_283 1.) of_283) 5.))
; 
; <=  {((sc.iadd[33].C*1.)+of.iadd[33].C)} {0.}
(assert (>= (+ (* sc_283 1.) of_283) 0.))
(declare-fun slbot_286 () Real)
(declare-fun sltop_286 () Real)
; 
; =  {(((sc.iadd[33].OUT*-1.)+of.iadd[33].OUT)+sl.min.iadd[33].OUT)} {-10.}
(assert (= (+ (+ (* sc_286 -1.) of_286) slbot_286) -10.))
; 
; =  {(((sc.iadd[33].OUT*155.25)+of.iadd[33].OUT)+sl.max.iadd[33].OUT)} {10.}
(assert (= (+ (+ (* sc_286 155.25) of_286) sltop_286) 10.))
; 
; >=  {((sc.iadd[33].A*0.)+of.iadd[33].A)} {5.}
(assert (<= (+ (* sc_284 0.) of_284) 5.))
; 
; <=  {((sc.iadd[33].A*0.)+of.iadd[33].A)} {0.}
(assert (>= (+ (* sc_284 0.) of_284) 0.))
; 
; >=  {((sc.iadd[33].B*0.)+of.iadd[33].B)} {5.}
(assert (<= (+ (* sc_285 0.) of_285) 5.))
; 
; <=  {((sc.iadd[33].B*0.)+of.iadd[33].B)} {0.}
(assert (>= (+ (* sc_285 0.) of_285) 0.))
(declare-fun slbot_286 () Real)
(declare-fun sltop_286 () Real)
; 
; =  {(((sc.iadd[33].OUT*-1.)+of.iadd[33].OUT)+sl.min.iadd[33].OUT)} {-10.}
(assert (= (+ (+ (* sc_286 -1.) of_286) slbot_286) -10.))
; 
; =  {(((sc.iadd[33].OUT*155.25)+of.iadd[33].OUT)+sl.max.iadd[33].OUT)} {10.}
(assert (= (+ (+ (* sc_286 155.25) of_286) sltop_286) 10.))
(declare-fun sc_287 () Real)
(assert (> sc_287 1e-08))
(declare-fun of_287 () Real)
(declare-fun sc_288 () Real)
(assert (> sc_288 1e-08))
(declare-fun of_288 () Real)
(declare-fun sc_289 () Real)
(assert (> sc_289 1e-08))
(declare-fun of_289 () Real)
(declare-fun sc_290 () Real)
(assert (> sc_290 1e-08))
(declare-fun of_290 () Real)
(declare-fun sc_291 () Real)
(assert (> sc_291 1e-08))
(declare-fun of_291 () Real)
; 
; =  {sc.iadd[16].A} {sc.iadd[16].B}
(assert (= sc_289 sc_290))
; 
; =  {sc.iadd[16].A} {sc.iadd[16].C} {sc.iadd[16].D}
(assert (and (= sc_289 sc_288) (= sc_289 sc_287)))
; 
; =  {sc.iadd[16].OUT} {sc.iadd[16].A}
(assert (= sc_291 sc_289))
; 
; =  {of.iadd[16].OUT} {((of.iadd[16].A+of.iadd[16].B)-of.iadd[16].C-of.iadd[16].D)}
(assert (= of_291 (- (+ of_289 of_290) (+ of_288 of_287))))
; 
; >=  {((sc.iadd[16].D*0.)+of.iadd[16].D)} {5.}
(assert (<= (+ (* sc_287 0.) of_287) 5.))
; 
; <=  {((sc.iadd[16].D*0.)+of.iadd[16].D)} {0.}
(assert (>= (+ (* sc_287 0.) of_287) 0.))
; 
; >=  {((sc.iadd[16].C*0.)+of.iadd[16].C)} {5.}
(assert (<= (+ (* sc_288 0.) of_288) 5.))
; 
; <=  {((sc.iadd[16].C*0.)+of.iadd[16].C)} {0.}
(assert (>= (+ (* sc_288 0.) of_288) 0.))
(declare-fun slbot_291 () Real)
(declare-fun sltop_291 () Real)
; 
; =  {(((sc.iadd[16].OUT*1.)+of.iadd[16].OUT)+sl.min.iadd[16].OUT)} {-10.}
(assert (= (+ (+ (* sc_291 1.) of_291) slbot_291) -10.))
; 
; =  {(((sc.iadd[16].OUT*5.65685424949)+of.iadd[16].OUT)+sl.max.iadd[16].OUT)} {10.}
(assert (= (+ (+ (* sc_291 5.65685424949) of_291) sltop_291) 10.))
; 
; >=  {((sc.iadd[16].A*0.)+of.iadd[16].A)} {5.}
(assert (<= (+ (* sc_289 0.) of_289) 5.))
; 
; <=  {((sc.iadd[16].A*0.)+of.iadd[16].A)} {0.}
(assert (>= (+ (* sc_289 0.) of_289) 0.))
(declare-fun slbot_290 () Real)
(declare-fun sltop_290 () Real)
; 
; =  {(((sc.iadd[16].B*1.)+of.iadd[16].B)+sl.min.iadd[16].B)} {0.}
(assert (= (+ (+ (* sc_290 1.) of_290) slbot_290) 0.))
; 
; =  {(((sc.iadd[16].B*5.65685424949)+of.iadd[16].B)+sl.max.iadd[16].B)} {5.}
(assert (= (+ (+ (* sc_290 5.65685424949) of_290) sltop_290) 5.))
(declare-fun slbot_291 () Real)
(declare-fun sltop_291 () Real)
; 
; =  {(((sc.iadd[16].OUT*1.)+of.iadd[16].OUT)+sl.min.iadd[16].OUT)} {-10.}
(assert (= (+ (+ (* sc_291 1.) of_291) slbot_291) -10.))
; 
; =  {(((sc.iadd[16].OUT*5.65685424949)+of.iadd[16].OUT)+sl.max.iadd[16].OUT)} {10.}
(assert (= (+ (+ (* sc_291 5.65685424949) of_291) sltop_291) 10.))
(declare-fun sc_292 () Real)
(assert (> sc_292 1e-08))
(declare-fun of_292 () Real)
(declare-fun sc_293 () Real)
(assert (> sc_293 1e-08))
(declare-fun of_293 () Real)
(declare-fun sc_294 () Real)
(assert (> sc_294 1e-08))
(declare-fun of_294 () Real)
(declare-fun sc_295 () Real)
(assert (> sc_295 1e-08))
(declare-fun of_295 () Real)
(declare-fun sc_296 () Real)
(assert (> sc_296 1e-08))
(declare-fun of_296 () Real)
; 
; =  {sc.iadd[5].A} {sc.iadd[5].B}
(assert (= sc_294 sc_295))
; 
; =  {sc.iadd[5].A} {sc.iadd[5].C} {sc.iadd[5].D}
(assert (and (= sc_294 sc_293) (= sc_294 sc_292)))
; 
; =  {sc.iadd[5].OUT} {sc.iadd[5].A}
(assert (= sc_296 sc_294))
; 
; =  {of.iadd[5].OUT} {((of.iadd[5].A+of.iadd[5].B)-of.iadd[5].C-of.iadd[5].D)}
(assert (= of_296 (- (+ of_294 of_295) (+ of_293 of_292))))
(declare-fun slbot_292 () Real)
(declare-fun sltop_292 () Real)
; 
; =  {(((sc.iadd[5].D*0.)+of.iadd[5].D)+sl.min.iadd[5].D)} {0.}
(assert (= (+ (+ (* sc_292 0.) of_292) slbot_292) 0.))
; 
; =  {(((sc.iadd[5].D*15.6)+of.iadd[5].D)+sl.max.iadd[5].D)} {5.}
(assert (= (+ (+ (* sc_292 15.6) of_292) sltop_292) 5.))
; 
; >=  {((sc.iadd[5].C*0.)+of.iadd[5].C)} {5.}
(assert (<= (+ (* sc_293 0.) of_293) 5.))
; 
; <=  {((sc.iadd[5].C*0.)+of.iadd[5].C)} {0.}
(assert (>= (+ (* sc_293 0.) of_293) 0.))
(declare-fun slbot_296 () Real)
(declare-fun sltop_296 () Real)
; 
; =  {(((sc.iadd[5].OUT*-15.6)+of.iadd[5].OUT)+sl.min.iadd[5].OUT)} {-10.}
(assert (= (+ (+ (* sc_296 -15.6) of_296) slbot_296) -10.))
; 
; =  {(((sc.iadd[5].OUT*0.)+of.iadd[5].OUT)+sl.max.iadd[5].OUT)} {10.}
(assert (= (+ (+ (* sc_296 0.) of_296) sltop_296) 10.))
; 
; >=  {((sc.iadd[5].A*0.)+of.iadd[5].A)} {5.}
(assert (<= (+ (* sc_294 0.) of_294) 5.))
; 
; <=  {((sc.iadd[5].A*0.)+of.iadd[5].A)} {0.}
(assert (>= (+ (* sc_294 0.) of_294) 0.))
; 
; >=  {((sc.iadd[5].B*0.)+of.iadd[5].B)} {5.}
(assert (<= (+ (* sc_295 0.) of_295) 5.))
; 
; <=  {((sc.iadd[5].B*0.)+of.iadd[5].B)} {0.}
(assert (>= (+ (* sc_295 0.) of_295) 0.))
(declare-fun slbot_296 () Real)
(declare-fun sltop_296 () Real)
; 
; =  {(((sc.iadd[5].OUT*-15.6)+of.iadd[5].OUT)+sl.min.iadd[5].OUT)} {-10.}
(assert (= (+ (+ (* sc_296 -15.6) of_296) slbot_296) -10.))
; 
; =  {(((sc.iadd[5].OUT*0.)+of.iadd[5].OUT)+sl.max.iadd[5].OUT)} {10.}
(assert (= (+ (+ (* sc_296 0.) of_296) sltop_296) 10.))
(declare-fun sc_297 () Real)
(assert (> sc_297 1e-08))
(declare-fun of_297 () Real)
(declare-fun sc_298 () Real)
(assert (> sc_298 1e-08))
(declare-fun of_298 () Real)
(declare-fun sc_299 () Real)
(assert (> sc_299 1e-08))
(declare-fun of_299 () Real)
(declare-fun sc_300 () Real)
(assert (> sc_300 1e-08))
(declare-fun of_300 () Real)
(declare-fun sc_301 () Real)
(assert (> sc_301 1e-08))
(declare-fun of_301 () Real)
; 
; =  {sc.iadd[28].A} {sc.iadd[28].B}
(assert (= sc_299 sc_300))
; 
; =  {sc.iadd[28].A} {sc.iadd[28].C} {sc.iadd[28].D}
(assert (and (= sc_299 sc_298) (= sc_299 sc_297)))
; 
; =  {sc.iadd[28].OUT} {sc.iadd[28].A}
(assert (= sc_301 sc_299))
; 
; =  {of.iadd[28].OUT} {((of.iadd[28].A+of.iadd[28].B)-of.iadd[28].C-of.iadd[28].D)}
(assert (= of_301 (- (+ of_299 of_300) (+ of_298 of_297))))
; 
; >=  {((sc.iadd[28].D*0.)+of.iadd[28].D)} {5.}
(assert (<= (+ (* sc_297 0.) of_297) 5.))
; 
; <=  {((sc.iadd[28].D*0.)+of.iadd[28].D)} {0.}
(assert (>= (+ (* sc_297 0.) of_297) 0.))
; 
; >=  {((sc.iadd[28].C*0.)+of.iadd[28].C)} {5.}
(assert (<= (+ (* sc_298 0.) of_298) 5.))
; 
; <=  {((sc.iadd[28].C*0.)+of.iadd[28].C)} {0.}
(assert (>= (+ (* sc_298 0.) of_298) 0.))
(declare-fun slbot_301 () Real)
(declare-fun sltop_301 () Real)
; 
; =  {(((sc.iadd[28].OUT*0.)+of.iadd[28].OUT)+sl.min.iadd[28].OUT)} {-10.}
(assert (= (+ (+ (* sc_301 0.) of_301) slbot_301) -10.))
; 
; =  {(((sc.iadd[28].OUT*305175.78125)+of.iadd[28].OUT)+sl.max.iadd[28].OUT)} {10.}
(assert (= (+ (+ (* sc_301 305175.78125) of_301) sltop_301) 10.))
; 
; >=  {((sc.iadd[28].A*0.)+of.iadd[28].A)} {5.}
(assert (<= (+ (* sc_299 0.) of_299) 5.))
; 
; <=  {((sc.iadd[28].A*0.)+of.iadd[28].A)} {0.}
(assert (>= (+ (* sc_299 0.) of_299) 0.))
(declare-fun slbot_300 () Real)
(declare-fun sltop_300 () Real)
; 
; =  {(((sc.iadd[28].B*0.)+of.iadd[28].B)+sl.min.iadd[28].B)} {0.}
(assert (= (+ (+ (* sc_300 0.) of_300) slbot_300) 0.))
; 
; =  {(((sc.iadd[28].B*305175.78125)+of.iadd[28].B)+sl.max.iadd[28].B)} {5.}
(assert (= (+ (+ (* sc_300 305175.78125) of_300) sltop_300) 5.))
(declare-fun slbot_301 () Real)
(declare-fun sltop_301 () Real)
; 
; =  {(((sc.iadd[28].OUT*0.)+of.iadd[28].OUT)+sl.min.iadd[28].OUT)} {-10.}
(assert (= (+ (+ (* sc_301 0.) of_301) slbot_301) -10.))
; 
; =  {(((sc.iadd[28].OUT*305175.78125)+of.iadd[28].OUT)+sl.max.iadd[28].OUT)} {10.}
(assert (= (+ (+ (* sc_301 305175.78125) of_301) sltop_301) 10.))
; 
; =  {sc.ihill[10].REP} {sc.itov[30].K}
(assert (= sc_140 sc_257))
; 
; =  {of.ihill[10].REP} {of.itov[30].K}
(assert (= of_140 of_257))
; 
; =  {sc.vtoi[29].Y} {sc.iadd[28].B}
(assert (= sc_143 sc_300))
; 
; =  {of.vtoi[29].Y} {of.iadd[28].B}
(assert (= of_143 of_300))
; 
; =  {sc.vadd[4].OUT2} {sc.output.V[1].X}
(assert (= sc_127 sc_119))
; 
; =  {of.vadd[4].OUT2} {of.output.V[1].X}
(assert (= of_127 of_119))
; 
; =  {sc.vadd[4].OUT2} {sc.switch[2].Vmax}
(assert (= sc_127 sc_39))
; 
; =  {of.vadd[4].OUT2} {of.switch[2].Vmax}
(assert (= of_127 of_39))
; 
; =  {sc.vadd[1].OUT2} {sc.vtoi[25].X}
(assert (= sc_134 sc_150))
; 
; =  {of.vadd[1].OUT2} {of.vtoi[25].X}
(assert (= of_134 of_150))
; 
; =  {sc.vadd[1].OUT2} {sc.output.V[0].X}
(assert (= sc_134 sc_117))
; 
; =  {of.vadd[1].OUT2} {of.output.V[0].X}
(assert (= of_134 of_117))
; 
; =  {sc.vadd[1].OUT2} {sc.vtoi[9].X}
(assert (= sc_134 sc_144))
; 
; =  {of.vadd[1].OUT2} {of.vtoi[9].X}
(assert (= of_134 of_144))
; 
; =  {sc.input.I[0].O} {sc.switch[2].SUB}
(assert (= sc_70 sc_37))
; 
; =  {of.input.I[0].O} {of.switch[2].SUB}
(assert (= of_70 of_37))
; 
; =  {sc.vgain[23].P} {sc.vtoi[22].K}
(assert (= sc_31 sc_157))
; 
; =  {of.vgain[23].P} {of.vtoi[22].K}
(assert (= of_31 of_157))
; 
; =  {sc.vgain[15].P} {sc.vgain[14].Y}
(assert (= sc_11 sc_17))
; 
; =  {of.vgain[15].P} {of.vgain[14].Y}
(assert (= of_11 of_17))
; 
; =  {sc.input.V[28].O} {sc.vgain[14].X}
(assert (= sc_230 sc_16))
; 
; =  {of.input.V[28].O} {of.vgain[14].X}
(assert (= of_230 of_16))
; 
; =  {sc.input.I[22].O} {sc.iadd[28].C}
(assert (= sc_116 sc_298))
; 
; =  {of.input.I[22].O} {of.iadd[28].C}
(assert (= of_116 of_298))
; 
; =  {sc.input.V[15].O} {sc.vadd[4].A}
(assert (= sc_198 sc_124))
; 
; =  {of.input.V[15].O} {of.vadd[4].A}
(assert (= of_198 of_124))
; 
; =  {sc.input.I[32].O} {sc.itov[30].X}
(assert (= sc_110 sc_256))
; 
; =  {of.input.I[32].O} {of.itov[30].X}
(assert (= of_110 of_256))
; 
; =  {sc.input.V[27].O} {sc.itov[13].K}
(assert (= sc_196 sc_245))
; 
; =  {of.input.V[27].O} {of.itov[13].K}
(assert (= of_196 of_245))
; 
; =  {sc.input.V[34].O} {sc.vgain[23].Y}
(assert (= sc_172 sc_29))
; 
; =  {of.input.V[34].O} {of.vgain[23].Y}
(assert (= of_172 of_29))
; 
; =  {sc.input.I[26].O} {sc.switch[25].Kmod}
(assert (= sc_76 sc_43))
; 
; =  {of.input.I[26].O} {of.switch[25].Kmod}
(assert (= of_76 of_43))
; 
; =  {sc.input.V[32].O} {sc.itov[19].K}
(assert (= sc_238 sc_260))
; 
; =  {of.input.V[32].O} {of.itov[19].K}
(assert (= of_238 of_260))
; 
; =  {sc.input.I[25].O} {sc.switch[2].Kmod}
(assert (= sc_102 sc_38))
; 
; =  {of.input.I[25].O} {of.switch[2].Kmod}
(assert (= of_102 of_38))
; 
; =  {sc.input.V[33].O} {sc.vtoi[22].X}
(assert (= sc_208 sc_156))
; 
; =  {of.input.V[33].O} {of.vtoi[22].X}
(assert (= of_208 of_156))
; 
; =  {sc.input.V[13].O} {sc.vadd[1].A}
(assert (= sc_174 sc_131))
; 
; =  {of.input.V[13].O} {of.vadd[1].A}
(assert (= of_174 of_131))
; 
; =  {sc.vgain[14].P} {sc.vtoi[11].K}
(assert (= sc_19 sc_148))
; 
; =  {of.vgain[14].P} {of.vtoi[11].K}
(assert (= of_19 of_148))
; 
; =  {sc.itov[27].Y} {sc.vgain[15].Y}
(assert (= sc_252 sc_9))
; 
; =  {of.itov[27].Y} {of.vgain[15].Y}
(assert (= of_252 of_9))
; 
; =  {sc.input.V[14].O} {sc.vadd[1].C}
(assert (= sc_204 sc_130))
; 
; =  {of.input.V[14].O} {of.vadd[1].C}
(assert (= of_204 of_130))
; 
; =  {sc.input.I[14].O} {sc.iadd[20].C}
(assert (= sc_84 sc_263))
; 
; =  {of.input.I[14].O} {of.iadd[20].C}
(assert (= of_84 of_263))
; 
; =  {sc.input.V[11].O} {sc.vgain[3].Y}
(assert (= sc_186 sc_21))
; 
; =  {of.input.V[11].O} {of.vgain[3].Y}
(assert (= of_186 of_21))
; 
; =  {sc.input.I[30].O} {sc.iadd[33].C}
(assert (= sc_94 sc_283))
; 
; =  {of.input.I[30].O} {of.iadd[33].C}
(assert (= of_94 of_283))
; 
; =  {sc.input.V[36].O} {sc.itov[27].K}
(assert (= sc_202 sc_251))
; 
; =  {of.input.V[36].O} {of.itov[27].K}
(assert (= of_202 of_251))
; 
; =  {sc.iadd[5].OUT} {sc.iadd[8].D}
(assert (= sc_296 sc_267))
; 
; =  {of.iadd[5].OUT} {of.iadd[8].D}
(assert (= of_296 of_267))
; 
; =  {sc.vtoi[17].Y} {sc.iadd[16].B}
(assert (= sc_155 sc_290))
; 
; =  {of.vtoi[17].Y} {of.iadd[16].B}
(assert (= of_155 of_290))
; 
; =  {sc.input.I[24].O} {sc.iadd[33].A}
(assert (= sc_90 sc_284))
; 
; =  {of.input.I[24].O} {of.iadd[33].A}
(assert (= of_90 of_284))
; 
; =  {sc.input.V[22].O} {sc.vgain[12].Z}
(assert (= sc_240 sc_2))
; 
; =  {of.input.V[22].O} {of.vgain[12].Z}
(assert (= of_240 of_2))
; 
; =  {sc.input.V[37].O} {sc.vtoi[29].X}
(assert (= sc_210 sc_141))
; 
; =  {of.input.V[37].O} {of.vtoi[29].X}
(assert (= of_210 of_141))
; 
; =  {sc.input.I[12].O} {sc.iadd[20].D}
(assert (= sc_64 sc_262))
; 
; =  {of.input.I[12].O} {of.iadd[20].D}
(assert (= of_64 of_262))
; 
; =  {sc.input.V[35].O} {sc.itov[24].K}
(assert (= sc_168 sc_254))
; 
; =  {of.input.V[35].O} {of.itov[24].K}
(assert (= of_168 of_254))
; 
; =  {sc.input.I[10].O} {sc.iadd[16].A}
(assert (= sc_74 sc_289))
; 
; =  {of.input.I[10].O} {of.iadd[16].A}
(assert (= of_74 of_289))
; 
; =  {sc.input.V[23].O} {sc.vgain[0].X}
(assert (= sc_224 sc_4))
; 
; =  {of.input.V[23].O} {of.vgain[0].X}
(assert (= of_224 of_4))
; 
; =  {sc.input.V[21].O} {sc.vadd[1].D}
(assert (= sc_206 sc_129))
; 
; =  {of.input.V[21].O} {of.vadd[1].D}
(assert (= of_206 of_129))
; 
; =  {sc.input.V[20].O} {sc.vadd[4].D}
(assert (= sc_162 sc_122))
; 
; =  {of.input.V[20].O} {of.vadd[4].D}
(assert (= of_162 of_122))
; 
; =  {sc.input.V[30].O} {sc.vtoi[17].X}
(assert (= sc_218 sc_153))
; 
; =  {of.input.V[30].O} {of.vtoi[17].X}
(assert (= of_218 of_153))
; 
; =  {sc.input.I[7].O} {sc.iadd[8].A}
(assert (= sc_60 sc_269))
; 
; =  {of.input.I[7].O} {of.iadd[8].A}
(assert (= of_60 of_269))
; 
; =  {sc.vgain[0].P} {sc.vadd[1].B}
(assert (= sc_7 sc_132))
; 
; =  {of.vgain[0].P} {of.vadd[1].B}
(assert (= of_7 of_132))
; 
; =  {sc.vgain[30].P} {sc.vtoi[29].K}
(assert (= sc_27 sc_142))
; 
; =  {of.vgain[30].P} {of.vtoi[29].K}
(assert (= of_27 of_142))
; 
; =  {sc.input.V[29].O} {sc.vgain[15].X}
(assert (= sc_164 sc_8))
; 
; =  {of.input.V[29].O} {of.vgain[15].X}
(assert (= of_164 of_8))
; 
; =  {sc.input.I[8].O} {sc.iadd[8].C}
(assert (= sc_58 sc_268))
; 
; =  {of.input.I[8].O} {of.iadd[8].C}
(assert (= of_58 of_268))
; 
; =  {sc.vtoi[11].Y} {sc.ihill[10].Vmax}
(assert (= sc_149 sc_138))
; 
; =  {of.vtoi[11].Y} {of.ihill[10].Vmax}
(assert (= of_149 of_138))
; 
; =  {sc.itov[30].Y} {sc.vgain[3].Z}
(assert (= sc_258 sc_22))
; 
; =  {of.itov[30].Y} {of.vgain[3].Z}
(assert (= of_258 of_22))
; 
; =  {sc.iadd[28].OUT} {sc.itov[27].X}
(assert (= sc_301 sc_250))
; 
; =  {of.iadd[28].OUT} {of.itov[27].X}
(assert (= of_301 of_250))
; 
; =  {sc.input.I[23].O} {sc.iadd[33].B}
(assert (= sc_100 sc_285))
; 
; =  {of.input.I[23].O} {of.iadd[33].B}
(assert (= of_100 of_285))
; 
; =  {sc.input.I[21].O} {sc.iadd[28].A}
(assert (= sc_86 sc_299))
; 
; =  {of.input.I[21].O} {of.iadd[28].A}
(assert (= of_86 of_299))
; 
; =  {sc.input.V[38].O} {sc.vgain[30].Y}
(assert (= sc_194 sc_25))
; 
; =  {of.input.V[38].O} {of.vgain[30].Y}
(assert (= of_194 of_25))
; 
; =  {sc.iadd[26].OUT} {sc.switch[25].SUB}
(assert (= sc_276 sc_42))
; 
; =  {of.iadd[26].OUT} {of.switch[25].SUB}
(assert (= of_276 of_42))
; 
; =  {sc.input.V[39].O} {sc.itov[31].K}
(assert (= sc_176 sc_248))
; 
; =  {of.input.V[39].O} {of.itov[31].K}
(assert (= of_176 of_248))
; 
; =  {sc.input.V[16].O} {sc.vadd[4].C}
(assert (= sc_212 sc_123))
; 
; =  {of.input.V[16].O} {of.vadd[4].C}
(assert (= of_212 of_123))
; 
; =  {sc.iadd[8].OUT} {sc.itov[7].X}
(assert (= sc_271 sc_241))
; 
; =  {of.iadd[8].OUT} {of.itov[7].X}
(assert (= of_271 of_241))
; 
; =  {sc.iadd[33].OUT} {sc.switch[32].SUB}
(assert (= sc_286 sc_47))
; 
; =  {of.iadd[33].OUT} {of.switch[32].SUB}
(assert (= of_286 of_47))
; 
; =  {sc.input.V[5].O} {sc.vgain[23].X}
(assert (= sc_222 sc_28))
; 
; =  {of.input.V[5].O} {of.vgain[23].X}
(assert (= of_222 of_28))
; 
; =  {sc.vtoi[9].Y} {sc.iadd[33].D}
(assert (= sc_146 sc_282))
; 
; =  {of.vtoi[9].Y} {of.iadd[33].D}
(assert (= of_146 of_282))
; 
; =  {sc.vtoi[22].Y} {sc.iadd[21].B}
(assert (= sc_158 sc_280))
; 
; =  {of.vtoi[22].Y} {of.iadd[21].B}
(assert (= of_158 of_280))
; 
; =  {sc.input.V[6].O} {sc.vgain[6].X}
(assert (= sc_200 sc_12))
; 
; =  {of.input.V[6].O} {of.vgain[6].X}
(assert (= of_200 of_12))
; 
; =  {sc.input.I[11].O} {sc.iadd[16].C}
(assert (= sc_72 sc_288))
; 
; =  {of.input.I[11].O} {of.iadd[16].C}
(assert (= of_72 of_288))
; 
; =  {sc.input.I[28].O} {sc.iadd[26].D}
(assert (= sc_106 sc_272))
; 
; =  {of.input.I[28].O} {of.iadd[26].D}
(assert (= of_106 of_272))
; 
; =  {sc.input.V[17].O} {sc.vadd[1].OUT2_0}
(assert (= sc_232 sc_128))
; 
; =  {of.input.V[17].O} {of.vadd[1].OUT2_0}
(assert (= of_232 of_128))
; 
; =  {sc.input.I[6].O} {sc.iadd[5].C}
(assert (= sc_82 sc_293))
; 
; =  {of.input.I[6].O} {of.iadd[5].C}
(assert (= of_82 of_293))
; 
; =  {sc.itov[13].Y} {sc.vgain[12].Y}
(assert (= sc_246 sc_1))
; 
; =  {of.itov[13].Y} {of.vgain[12].Y}
(assert (= of_246 of_1))
; 
; =  {sc.input.I[31].O} {sc.switch[32].Vmax}
(assert (= sc_68 sc_49))
; 
; =  {of.input.I[31].O} {of.switch[32].Vmax}
(assert (= of_68 of_49))
; 
; =  {sc.input.V[9].O} {sc.switch[32].n}
(assert (= sc_180 sc_46))
; 
; =  {of.input.V[9].O} {of.switch[32].n}
(assert (= of_180 of_46))
; 
; =  {sc.input.V[31].O} {sc.vgain[18].Y}
(assert (= sc_182 sc_33))
; 
; =  {of.input.V[31].O} {of.vgain[18].Y}
(assert (= of_182 of_33))
; 
; =  {sc.iadd[21].OUT} {sc.iadd[20].B}
(assert (= sc_281 sc_265))
; 
; =  {of.iadd[21].OUT} {of.iadd[20].B}
(assert (= of_281 of_265))
; 
; =  {sc.input.I[18].O} {sc.iadd[26].A}
(assert (= sc_112 sc_274))
; 
; =  {of.input.I[18].O} {of.iadd[26].A}
(assert (= of_112 of_274))
; 
; =  {sc.input.I[9].O} {sc.iadd[16].D}
(assert (= sc_66 sc_287))
; 
; =  {of.input.I[9].O} {of.iadd[16].D}
(assert (= of_66 of_287))
; 
; =  {sc.itov[31].Y} {sc.vgain[30].Z}
(assert (= sc_249 sc_26))
; 
; =  {of.itov[31].Y} {of.vgain[30].Z}
(assert (= of_249 of_26))
; 
; =  {sc.input.I[16].O} {sc.iadd[21].A}
(assert (= sc_88 sc_279))
; 
; =  {of.input.I[16].O} {of.iadd[21].A}
(assert (= of_88 of_279))
; 
; =  {sc.input.I[4].O} {sc.iadd[5].A}
(assert (= sc_96 sc_294))
; 
; =  {of.input.I[4].O} {of.iadd[5].A}
(assert (= of_96 of_294))
; 
; =  {sc.input.I[3].O} {sc.ihill[10].S}
(assert (= sc_92 sc_136))
; 
; =  {of.input.I[3].O} {of.ihill[10].S}
(assert (= of_92 of_136))
; 
; =  {sc.vgain[6].P} {sc.vgain[0].Z}
(assert (= sc_15 sc_6))
; 
; =  {of.vgain[6].P} {of.vgain[0].Z}
(assert (= of_15 of_6))
; 
; =  {sc.vgain[18].P} {sc.vtoi[17].K}
(assert (= sc_35 sc_154))
; 
; =  {of.vgain[18].P} {of.vtoi[17].K}
(assert (= of_35 of_154))
; 
; =  {sc.input.I[5].O} {sc.iadd[5].B}
(assert (= sc_98 sc_295))
; 
; =  {of.input.I[5].O} {of.iadd[5].B}
(assert (= of_98 of_295))
; 
; =  {sc.input.V[42].O} {sc.vtoi[25].K}
(assert (= sc_188 sc_151))
; 
; =  {of.input.V[42].O} {of.vtoi[25].K}
(assert (= of_188 of_151))
; 
; =  {sc.input.V[12].O} {sc.vgain[0].Y}
(assert (= sc_178 sc_5))
; 
; =  {of.input.V[12].O} {of.vgain[0].Y}
(assert (= of_178 of_5))
; 
; =  {sc.input.I[2].O} {sc.iadd[26].B}
(assert (= sc_52 sc_275))
; 
; =  {of.input.I[2].O} {of.iadd[26].B}
(assert (= of_52 of_275))
; 
; =  {sc.input.V[8].O} {sc.ihill[10].n}
(assert (= sc_166 sc_135))
; 
; =  {of.input.V[8].O} {of.ihill[10].n}
(assert (= of_166 of_135))
; 
; =  {sc.iadd[20].OUT} {sc.itov[19].X}
(assert (= sc_266 sc_259))
; 
; =  {of.iadd[20].OUT} {of.itov[19].X}
(assert (= of_266 of_259))
; 
; =  {sc.itov[24].Y} {sc.vgain[23].Z}
(assert (= sc_255 sc_30))
; 
; =  {of.itov[24].Y} {of.vgain[23].Z}
(assert (= of_255 of_30))
; 
; =  {sc.input.V[3].O} {sc.vgain[18].X}
(assert (= sc_216 sc_32))
; 
; =  {of.input.V[3].O} {of.vgain[18].X}
(assert (= of_216 of_32))
; 
; =  {sc.input.I[20].O} {sc.iadd[28].D}
(assert (= sc_54 sc_297))
; 
; =  {of.input.I[20].O} {of.iadd[28].D}
(assert (= of_54 of_297))
; 
; =  {sc.input.I[29].O} {sc.switch[32].Kmod}
(assert (= sc_56 sc_48))
; 
; =  {of.input.I[29].O} {of.switch[32].Kmod}
(assert (= of_56 of_48))
; 
; =  {sc.input.V[2].O} {sc.vgain[15].Z}
(assert (= sc_160 sc_10))
; 
; =  {of.input.V[2].O} {of.vgain[15].Z}
(assert (= of_160 of_10))
; 
; =  {sc.vgain[3].P} {sc.vadd[4].B}
(assert (= sc_23 sc_125))
; 
; =  {of.vgain[3].P} {of.vadd[4].B}
(assert (= of_23 of_125))
; 
; =  {sc.itov[7].Y} {sc.vgain[6].Y}
(assert (= sc_243 sc_13))
; 
; =  {of.itov[7].Y} {of.vgain[6].Y}
(assert (= of_243 of_13))
; 
; =  {sc.switch[32].PROD} {sc.itov[31].X}
(assert (= sc_50 sc_247))
; 
; =  {of.switch[32].PROD} {of.itov[31].X}
(assert (= of_50 of_247))
; 
; =  {sc.input.V[19].O} {sc.vadd[4].OUT2_0}
(assert (= sc_236 sc_121))
; 
; =  {of.input.V[19].O} {of.vadd[4].OUT2_0}
(assert (= of_236 of_121))
; 
; =  {sc.itov[19].Y} {sc.vgain[18].Z}
(assert (= sc_261 sc_34))
; 
; =  {of.itov[19].Y} {of.vgain[18].Z}
(assert (= of_261 of_34))
; 
; =  {sc.vtoi[25].Y} {sc.ihill[10].Km}
(assert (= sc_152 sc_137))
; 
; =  {of.vtoi[25].Y} {of.ihill[10].Km}
(assert (= of_152 of_137))
; 
; =  {sc.input.I[15].O} {sc.iadd[21].D}
(assert (= sc_80 sc_277))
; 
; =  {of.input.I[15].O} {of.iadd[21].D}
(assert (= of_80 of_277))
; 
; =  {sc.input.I[1].O} {sc.iadd[8].B}
(assert (= sc_104 sc_270))
; 
; =  {of.input.I[1].O} {of.iadd[8].B}
(assert (= of_104 of_270))
; 
; =  {sc.switch[25].PROD} {sc.itov[24].X}
(assert (= sc_45 sc_253))
; 
; =  {of.switch[25].PROD} {of.itov[24].X}
(assert (= of_45 of_253))
; 
; =  {sc.input.V[1].O} {sc.vgain[14].Z}
(assert (= sc_228 sc_18))
; 
; =  {of.input.V[1].O} {of.vgain[14].Z}
(assert (= of_228 of_18))
; 
; =  {sc.input.I[13].O} {sc.iadd[20].A}
(assert (= sc_62 sc_264))
; 
; =  {of.input.I[13].O} {of.iadd[20].A}
(assert (= of_62 of_264))
; 
; =  {sc.input.I[17].O} {sc.iadd[21].C}
(assert (= sc_108 sc_278))
; 
; =  {of.input.I[17].O} {of.iadd[21].C}
(assert (= of_108 of_278))
; 
; =  {sc.input.V[7].O} {sc.switch[2].n}
(assert (= sc_170 sc_36))
; 
; =  {of.input.V[7].O} {of.switch[2].n}
(assert (= of_170 of_36))
; 
; =  {sc.input.V[25].O} {sc.itov[7].K}
(assert (= sc_226 sc_242))
; 
; =  {of.input.V[25].O} {of.itov[7].K}
(assert (= of_226 of_242))
; 
; =  {sc.vgain[12].P} {sc.vtoi[11].X}
(assert (= sc_3 sc_147))
; 
; =  {of.vgain[12].P} {of.vtoi[11].X}
(assert (= of_3 of_147))
; 
; =  {sc.input.V[24].O} {sc.vgain[3].X}
(assert (= sc_214 sc_20))
; 
; =  {of.input.V[24].O} {of.vgain[3].X}
(assert (= of_214 of_20))
; 
; =  {sc.input.I[27].O} {sc.switch[25].Vmax}
(assert (= sc_78 sc_44))
; 
; =  {of.input.I[27].O} {of.switch[25].Vmax}
(assert (= of_78 of_44))
; 
; =  {sc.input.V[10].O} {sc.switch[25].n}
(assert (= sc_190 sc_41))
; 
; =  {of.input.V[10].O} {of.switch[25].n}
(assert (= of_190 of_41))
; 
; =  {sc.input.V[0].O} {sc.vgain[6].Z}
(assert (= sc_184 sc_14))
; 
; =  {of.input.V[0].O} {of.vgain[6].Z}
(assert (= of_184 of_14))
; 
; =  {sc.input.V[18].O} {sc.vtoi[9].K}
(assert (= sc_234 sc_145))
; 
; =  {of.input.V[18].O} {of.vtoi[9].K}
(assert (= of_234 of_145))
; 
; =  {sc.switch[2].PROD} {sc.iadd[5].D}
(assert (= sc_40 sc_292))
; 
; =  {of.switch[2].PROD} {of.iadd[5].D}
(assert (= of_40 of_292))
; 
; =  {sc.input.I[19].O} {sc.iadd[26].C}
(assert (= sc_114 sc_273))
; 
; =  {of.input.I[19].O} {of.iadd[26].C}
(assert (= of_114 of_273))
; 
; =  {sc.input.V[4].O} {sc.vgain[30].X}
(assert (= sc_220 sc_24))
; 
; =  {of.input.V[4].O} {of.vgain[30].X}
(assert (= of_220 of_24))
; 
; =  {sc.input.V[26].O} {sc.vgain[12].X}
(assert (= sc_192 sc_0))
; 
; =  {of.input.V[26].O} {of.vgain[12].X}
(assert (= of_192 of_0))
; 
; =  {sc.iadd[16].OUT} {sc.itov[13].X}
(assert (= sc_291 sc_244))
; 
; =  {of.iadd[16].OUT} {of.itov[13].X}
(assert (= of_291 of_244))
(assert (<= (* sc_118 0.001) 0.001))
(assert (<= (* sc_120 0.001) 0.001))
; 
; =  {sc.vadd[1].OUT2} {sc.output.V[0].O} {sc.vadd[4].OUT2} {sc.output.V[1].O}
(assert (and (and (= sc_134 sc_118) (= sc_134 sc_127)) (= sc_134 sc_120)))
(assert (= __minima__ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (ite (>= slbot_92 0.) slbot_92 (- slbot_92)) (ite (>= slbot_14 0.) slbot_14 (- slbot_14))) (ite (>= sltop_158 0.) sltop_158 (- sltop_158))) (ite (>= slbot_300 0.) slbot_300 (- slbot_300))) (ite (>= sltop_1 0.) sltop_1 (- sltop_1))) (ite (>= slbot_282 0.) slbot_282 (- slbot_282))) (ite (>= sltop_14 0.) sltop_14 (- sltop_14))) (ite (>= slbot_183 0.) slbot_183 (- slbot_183))) (ite (>= sltop_296 0.) sltop_296 (- sltop_296))) (ite (>= slbot_103 0.) slbot_103 (- slbot_103))) (ite (>= slbot_157 0.) slbot_157 (- slbot_157))) (ite (>= slbot_26 0.) slbot_26 (- slbot_26))) (ite (>= sltop_244 0.) sltop_244 (- sltop_244))) (ite (>= slbot_150 0.) slbot_150 (- slbot_150))) (ite (>= slbot_280 0.) slbot_280 (- slbot_280))) (ite (>= slbot_143 0.) slbot_143 (- slbot_143))) (ite (>= slbot_127 0.) slbot_127 (- slbot_127))) (ite (>= slbot_267 0.) slbot_267 (- slbot_267))) (ite (>= slbot_125 0.) slbot_125 (- slbot_125))) (ite (>= sltop_31 0.) sltop_31 (- sltop_31))) (ite (>= sltop_137 0.) sltop_137 (- sltop_137))) (ite (>= sltop_146 0.) sltop_146 (- sltop_146))) (ite (>= sltop_132 0.) sltop_132 (- sltop_132))) (ite (>= slbot_104 0.) slbot_104 (- slbot_104))) (ite (>= sltop_51 0.) sltop_51 (- sltop_51))) (ite (>= slbot_91 0.) slbot_91 (- slbot_91))) (ite (>= sltop_34 0.) sltop_34 (- sltop_34))) (ite (>= sltop_136 0.) sltop_136 (- sltop_136))) (ite (>= slbot_138 0.) slbot_138 (- slbot_138))) (ite (>= sltop_154 0.) sltop_154 (- sltop_154))) (ite (>= sltop_250 0.) sltop_250 (- sltop_250))) (ite (>= sltop_45 0.) sltop_45 (- sltop_45))) (ite (>= sltop_249 0.) sltop_249 (- sltop_249))) (ite (>= slbot_255 0.) slbot_255 (- slbot_255))) (ite (>= slbot_301 0.) slbot_301 (- slbot_301))) (ite (>= slbot_23 0.) slbot_23 (- slbot_23))) (ite (>= sltop_246 0.) sltop_246 (- sltop_246))) (ite (>= sltop_290 0.) sltop_290 (- sltop_290))) (ite (>= sltop_17 0.) sltop_17 (- sltop_17))) (ite (>= slbot_258 0.) slbot_258 (- slbot_258))) (ite (>= sltop_40 0.) sltop_40 (- sltop_40))) (ite (>= slbot_252 0.) slbot_252 (- slbot_252))) (ite (>= slbot_27 0.) slbot_27 (- slbot_27))) (ite (>= sltop_143 0.) sltop_143 (- sltop_143))) (ite (>= slbot_7 0.) slbot_7 (- slbot_7))) (ite (>= sltop_119 0.) sltop_119 (- sltop_119))) (ite (>= sltop_139 0.) sltop_139 (- sltop_139))) (ite (>= slbot_281 0.) slbot_281 (- slbot_281))) (ite (>= sltop_280 0.) sltop_280 (- sltop_280))) (ite (>= sltop_23 0.) sltop_23 (- sltop_23))) (ite (>= slbot_22 0.) slbot_22 (- slbot_22))) (ite (>= sltop_127 0.) sltop_127 (- sltop_127))) (ite (>= sltop_247 0.) sltop_247 (- sltop_247))) (ite (>= slbot_134 0.) slbot_134 (- slbot_134))) (ite (>= slbot_290 0.) slbot_290 (- slbot_290))) (ite (>= slbot_11 0.) slbot_11 (- slbot_11))) (ite (>= slbot_144 0.) slbot_144 (- slbot_144))) (ite (>= slbot_259 0.) slbot_259 (- slbot_259))) (ite (>= sltop_267 0.) sltop_267 (- sltop_267))) (ite (>= sltop_281 0.) sltop_281 (- sltop_281))) (ite (>= sltop_7 0.) sltop_7 (- sltop_7))) (ite (>= slbot_241 0.) slbot_241 (- slbot_241))) (ite (>= slbot_246 0.) slbot_246 (- slbot_246))) (ite (>= slbot_15 0.) slbot_15 (- slbot_15))) (ite (>= sltop_92 0.) sltop_92 (- sltop_92))) (ite (>= slbot_117 0.) slbot_117 (- slbot_117))) (ite (>= sltop_117 0.) sltop_117 (- sltop_117))) (ite (>= slbot_247 0.) slbot_247 (- slbot_247))) (ite (>= sltop_276 0.) sltop_276 (- sltop_276))) (ite (>= sltop_300 0.) sltop_300 (- sltop_300))) (ite (>= slbot_276 0.) slbot_276 (- slbot_276))) (ite (>= slbot_244 0.) slbot_244 (- slbot_244))) (ite (>= slbot_9 0.) slbot_9 (- slbot_9))) (ite (>= slbot_52 0.) slbot_52 (- slbot_52))) (ite (>= sltop_140 0.) sltop_140 (- sltop_140))) (ite (>= slbot_51 0.) slbot_51 (- slbot_51))) (ite (>= sltop_286 0.) sltop_286 (- sltop_286))) (ite (>= slbot_142 0.) slbot_142 (- slbot_142))) (ite (>= sltop_271 0.) sltop_271 (- sltop_271))) (ite (>= slbot_70 0.) slbot_70 (- slbot_70))) (ite (>= slbot_50 0.) slbot_50 (- slbot_50))) (ite (>= slbot_118 0.) slbot_118 (- slbot_118))) (ite (>= slbot_147 0.) slbot_147 (- slbot_147))) (ite (>= sltop_30 0.) sltop_30 (- sltop_30))) (ite (>= sltop_134 0.) sltop_134 (- sltop_134))) (ite (>= slbot_137 0.) slbot_137 (- slbot_137))) (ite (>= sltop_37 0.) sltop_37 (- sltop_37))) (ite (>= sltop_69 0.) sltop_69 (- sltop_69))) (ite (>= sltop_26 0.) sltop_26 (- sltop_26))) (ite (>= slbot_39 0.) slbot_39 (- slbot_39))) (ite (>= slbot_40 0.) slbot_40 (- slbot_40))) (ite (>= slbot_1 0.) slbot_1 (- slbot_1))) (ite (>= sltop_144 0.) sltop_144 (- sltop_144))) (ite (>= slbot_286 0.) slbot_286 (- slbot_286))) (ite (>= slbot_261 0.) slbot_261 (- slbot_261))) (ite (>= sltop_183 0.) sltop_183 (- sltop_183))) (ite (>= sltop_282 0.) sltop_282 (- sltop_282))) (ite (>= sltop_91 0.) sltop_91 (- sltop_91))) (ite (>= sltop_125 0.) sltop_125 (- sltop_125))) (ite (>= slbot_250 0.) slbot_250 (- slbot_250))) (ite (>= slbot_35 0.) slbot_35 (- slbot_35))) (ite (>= sltop_149 0.) sltop_149 (- sltop_149))) (ite (>= sltop_27 0.) sltop_27 (- sltop_27))) (ite (>= sltop_120 0.) sltop_120 (- sltop_120))) (ite (>= slbot_126 0.) slbot_126 (- slbot_126))) (ite (>= slbot_3 0.) slbot_3 (- slbot_3))) (ite (>= sltop_42 0.) sltop_42 (- sltop_42))) (ite (>= sltop_104 0.) sltop_104 (- sltop_104))) (ite (>= slbot_133 0.) slbot_133 (- slbot_133))) (ite (>= sltop_291 0.) sltop_291 (- sltop_291))) (ite (>= slbot_119 0.) slbot_119 (- slbot_119))) (ite (>= slbot_120 0.) slbot_120 (- slbot_120))) (ite (>= sltop_255 0.) sltop_255 (- sltop_255))) (ite (>= sltop_261 0.) sltop_261 (- sltop_261))) (ite (>= sltop_138 0.) sltop_138 (- sltop_138))) (ite (>= sltop_150 0.) sltop_150 (- sltop_150))) (ite (>= sltop_257 0.) sltop_257 (- sltop_257))) (ite (>= sltop_22 0.) sltop_22 (- sltop_22))) (ite (>= sltop_13 0.) sltop_13 (- sltop_13))) (ite (>= sltop_15 0.) sltop_15 (- sltop_15))) (ite (>= sltop_243 0.) sltop_243 (- sltop_243))) (ite (>= sltop_152 0.) sltop_152 (- sltop_152))) (ite (>= sltop_157 0.) sltop_157 (- sltop_157))) (ite (>= sltop_265 0.) sltop_265 (- sltop_265))) (ite (>= slbot_291 0.) slbot_291 (- slbot_291))) (ite (>= sltop_9 0.) sltop_9 (- sltop_9))) (ite (>= sltop_133 0.) sltop_133 (- sltop_133))) (ite (>= slbot_271 0.) slbot_271 (- slbot_271))) (ite (>= slbot_266 0.) slbot_266 (- slbot_266))) (ite (>= sltop_275 0.) sltop_275 (- sltop_275))) (ite (>= slbot_45 0.) slbot_45 (- slbot_45))) (ite (>= sltop_241 0.) sltop_241 (- sltop_241))) (ite (>= slbot_253 0.) slbot_253 (- slbot_253))) (ite (>= sltop_258 0.) sltop_258 (- sltop_258))) (ite (>= slbot_257 0.) slbot_257 (- slbot_257))) (ite (>= slbot_6 0.) slbot_6 (- slbot_6))) (ite (>= sltop_19 0.) sltop_19 (- sltop_19))) (ite (>= slbot_158 0.) slbot_158 (- slbot_158))) (ite (>= slbot_296 0.) slbot_296 (- slbot_296))) (ite (>= slbot_243 0.) slbot_243 (- slbot_243))) (ite (>= slbot_42 0.) slbot_42 (- slbot_42))) (ite (>= slbot_152 0.) slbot_152 (- slbot_152))) (ite (>= sltop_292 0.) sltop_292 (- sltop_292))) (ite (>= slbot_136 0.) slbot_136 (- slbot_136))) (ite (>= slbot_34 0.) slbot_34 (- slbot_34))) (ite (>= sltop_3 0.) sltop_3 (- sltop_3))) (ite (>= sltop_35 0.) sltop_35 (- sltop_35))) (ite (>= slbot_139 0.) slbot_139 (- slbot_139))) (ite (>= sltop_259 0.) sltop_259 (- sltop_259))) (ite (>= slbot_69 0.) slbot_69 (- slbot_69))) (ite (>= slbot_155 0.) slbot_155 (- slbot_155))) (ite (>= slbot_270 0.) slbot_270 (- slbot_270))) (ite (>= slbot_13 0.) slbot_13 (- slbot_13))) (ite (>= sltop_118 0.) sltop_118 (- sltop_118))) (ite (>= sltop_52 0.) sltop_52 (- sltop_52))) (ite (>= slbot_132 0.) slbot_132 (- slbot_132))) (ite (>= sltop_11 0.) sltop_11 (- sltop_11))) (ite (>= sltop_70 0.) sltop_70 (- sltop_70))) (ite (>= slbot_140 0.) slbot_140 (- slbot_140))) (ite (>= sltop_184 0.) sltop_184 (- sltop_184))) (ite (>= slbot_19 0.) slbot_19 (- slbot_19))) (ite (>= sltop_147 0.) sltop_147 (- sltop_147))) (ite (>= sltop_266 0.) sltop_266 (- sltop_266))) (ite (>= sltop_270 0.) sltop_270 (- sltop_270))) (ite (>= slbot_37 0.) slbot_37 (- slbot_37))) (ite (>= slbot_154 0.) slbot_154 (- slbot_154))) (ite (>= slbot_17 0.) slbot_17 (- slbot_17))) (ite (>= sltop_39 0.) sltop_39 (- sltop_39))) (ite (>= slbot_292 0.) slbot_292 (- slbot_292))) (ite (>= slbot_31 0.) slbot_31 (- slbot_31))) (ite (>= slbot_265 0.) slbot_265 (- slbot_265))) (ite (>= sltop_103 0.) sltop_103 (- sltop_103))) (ite (>= slbot_184 0.) slbot_184 (- slbot_184))) (ite (>= slbot_249 0.) slbot_249 (- slbot_249))) (ite (>= sltop_155 0.) sltop_155 (- sltop_155))) (ite (>= slbot_30 0.) slbot_30 (- slbot_30))) (ite (>= sltop_142 0.) sltop_142 (- sltop_142))) (ite (>= sltop_47 0.) sltop_47 (- sltop_47))) (ite (>= sltop_301 0.) sltop_301 (- sltop_301))) (ite (>= sltop_126 0.) sltop_126 (- sltop_126))) (ite (>= sltop_50 0.) sltop_50 (- sltop_50))) (ite (>= sltop_148 0.) sltop_148 (- sltop_148))) (ite (>= slbot_146 0.) slbot_146 (- slbot_146))) (ite (>= slbot_148 0.) slbot_148 (- slbot_148))) (ite (>= sltop_252 0.) sltop_252 (- sltop_252))) (ite (>= slbot_47 0.) slbot_47 (- slbot_47))) (ite (>= slbot_275 0.) slbot_275 (- slbot_275))) (ite (>= sltop_6 0.) sltop_6 (- sltop_6))) (ite (>= slbot_149 0.) slbot_149 (- slbot_149))) (ite (>= sltop_253 0.) sltop_253 (- sltop_253)))))
(check-sat)
