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
; =  {sc.vgain[9].P} {((sc.vgain[9].X/sc.vgain[9].Y)*sc.vgain[9].Z*1.)}
(assert (= sc_3 (* (* (/ sc_0 sc_1) sc_2) 1.)))
; 
; =  {of.vgain[9].P} {0.}
(assert (= of_3 0.))
; 
; >=  {((sc.vgain[9].X*1.)+of.vgain[9].X)} {3300.}
(assert (<= (+ (* sc_0 1.) of_0) 3300.))
; 
; <=  {((sc.vgain[9].X*1.)+of.vgain[9].X)} {0.0001}
(assert (>= (+ (* sc_0 1.) of_0) 0.0001))
(declare-fun slbot_1 () Real)
(declare-fun sltop_1 () Real)
; 
; =  {(((sc.vgain[9].Y*1.)+of.vgain[9].Y)+sl.min.vgain[9].Y)} {1.}
(assert (= (+ (+ (* sc_1 1.) of_1) slbot_1) 1.))
; 
; =  {(((sc.vgain[9].Y*5.65685424949)+of.vgain[9].Y)+sl.max.vgain[9].Y)} {3300.}
(assert (= (+ (+ (* sc_1 5.65685424949) of_1) sltop_1) 3300.))
(declare-fun slbot_3 () Real)
(declare-fun sltop_3 () Real)
; 
; =  {(((sc.vgain[9].P*0.0276213586401)+of.vgain[9].P)+sl.min.vgain[9].P)} {1.51515151515e-12}
(assert (= (+ (+ (* sc_3 0.0276213586401) of_3) slbot_3) 1.51515151515e-12))
; 
; =  {(((sc.vgain[9].P*0.15625)+of.vgain[9].P)+sl.max.vgain[9].P)} {5445000.}
(assert (= (+ (+ (* sc_3 0.15625) of_3) sltop_3) 5445000.))
; 
; >=  {((sc.vgain[9].Z*0.3125)+of.vgain[9].Z)} {3300.}
(assert (<= (+ (* sc_2 0.3125) of_2) 3300.))
; 
; <=  {((sc.vgain[9].Z*0.3125)+of.vgain[9].Z)} {0.0001}
(assert (>= (+ (* sc_2 0.3125) of_2) 0.0001))
(declare-fun slbot_3 () Real)
(declare-fun sltop_3 () Real)
; 
; =  {(((sc.vgain[9].P*0.0276213586401)+of.vgain[9].P)+sl.min.vgain[9].P)} {1.51515151515e-12}
(assert (= (+ (+ (* sc_3 0.0276213586401) of_3) slbot_3) 1.51515151515e-12))
; 
; =  {(((sc.vgain[9].P*0.15625)+of.vgain[9].P)+sl.max.vgain[9].P)} {5445000.}
(assert (= (+ (+ (* sc_3 0.15625) of_3) sltop_3) 5445000.))
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
; =  {sc.vgain[11].P} {((sc.vgain[11].X/sc.vgain[11].Y)*sc.vgain[11].Z*1.)}
(assert (= sc_7 (* (* (/ sc_4 sc_5) sc_6) 1.)))
; 
; =  {of.vgain[11].P} {0.}
(assert (= of_7 0.))
; 
; >=  {((sc.vgain[11].X*1.)+of.vgain[11].X)} {3300.}
(assert (<= (+ (* sc_4 1.) of_4) 3300.))
; 
; <=  {((sc.vgain[11].X*1.)+of.vgain[11].X)} {0.0001}
(assert (>= (+ (* sc_4 1.) of_4) 0.0001))
(declare-fun slbot_5 () Real)
(declare-fun sltop_5 () Real)
; 
; =  {(((sc.vgain[11].Y*0.)+of.vgain[11].Y)+sl.min.vgain[11].Y)} {1.}
(assert (= (+ (+ (* sc_5 0.) of_5) slbot_5) 1.))
; 
; =  {(((sc.vgain[11].Y*0.00965050555471)+of.vgain[11].Y)+sl.max.vgain[11].Y)} {3300.}
(assert (= (+ (+ (* sc_5 0.00965050555471) of_5) sltop_5) 3300.))
(declare-fun slbot_7 () Real)
(declare-fun sltop_7 () Real)
; 
; =  {(((sc.vgain[11].P*0.)+of.vgain[11].P)+sl.min.vgain[11].P)} {1.51515151515e-12}
(assert (= (+ (+ (* sc_7 0.) of_7) slbot_7) 1.51515151515e-12))
; 
; =  {(((sc.vgain[11].P*103.621514368)+of.vgain[11].P)+sl.max.vgain[11].P)} {5445000.}
(assert (= (+ (+ (* sc_7 103.621514368) of_7) sltop_7) 5445000.))
; 
; >=  {((sc.vgain[11].Z*2.)+of.vgain[11].Z)} {3300.}
(assert (<= (+ (* sc_6 2.) of_6) 3300.))
; 
; <=  {((sc.vgain[11].Z*2.)+of.vgain[11].Z)} {0.0001}
(assert (>= (+ (* sc_6 2.) of_6) 0.0001))
(declare-fun slbot_7 () Real)
(declare-fun sltop_7 () Real)
; 
; =  {(((sc.vgain[11].P*0.)+of.vgain[11].P)+sl.min.vgain[11].P)} {1.51515151515e-12}
(assert (= (+ (+ (* sc_7 0.) of_7) slbot_7) 1.51515151515e-12))
; 
; =  {(((sc.vgain[11].P*103.621514368)+of.vgain[11].P)+sl.max.vgain[11].P)} {5445000.}
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
; =  {sc.vgain[10].P} {((sc.vgain[10].X/sc.vgain[10].Y)*sc.vgain[10].Z*1.)}
(assert (= sc_11 (* (* (/ sc_8 sc_9) sc_10) 1.)))
; 
; =  {of.vgain[10].P} {0.}
(assert (= of_11 0.))
; 
; >=  {((sc.vgain[10].X*1.)+of.vgain[10].X)} {3300.}
(assert (<= (+ (* sc_8 1.) of_8) 3300.))
; 
; <=  {((sc.vgain[10].X*1.)+of.vgain[10].X)} {0.0001}
(assert (>= (+ (* sc_8 1.) of_8) 0.0001))
(declare-fun slbot_9 () Real)
(declare-fun sltop_9 () Real)
; 
; =  {(((sc.vgain[10].Y*0.)+of.vgain[10].Y)+sl.min.vgain[10].Y)} {1.}
(assert (= (+ (+ (* sc_9 0.) of_9) slbot_9) 1.))
; 
; =  {(((sc.vgain[10].Y*103.621514368)+of.vgain[10].Y)+sl.max.vgain[10].Y)} {3300.}
(assert (= (+ (+ (* sc_9 103.621514368) of_9) sltop_9) 3300.))
(declare-fun slbot_11 () Real)
(declare-fun sltop_11 () Real)
; 
; =  {(((sc.vgain[10].P*0.)+of.vgain[10].P)+sl.min.vgain[10].P)} {1.51515151515e-12}
(assert (= (+ (+ (* sc_11 0.) of_11) slbot_11) 1.51515151515e-12))
; 
; =  {(((sc.vgain[10].P*0.00965050555471)+of.vgain[10].P)+sl.max.vgain[10].P)} {5445000.}
(assert (= (+ (+ (* sc_11 0.00965050555471) of_11) sltop_11) 5445000.))
; 
; >=  {((sc.vgain[10].Z*2.)+of.vgain[10].Z)} {3300.}
(assert (<= (+ (* sc_10 2.) of_10) 3300.))
; 
; <=  {((sc.vgain[10].Z*2.)+of.vgain[10].Z)} {0.0001}
(assert (>= (+ (* sc_10 2.) of_10) 0.0001))
(declare-fun slbot_11 () Real)
(declare-fun sltop_11 () Real)
; 
; =  {(((sc.vgain[10].P*0.)+of.vgain[10].P)+sl.min.vgain[10].P)} {1.51515151515e-12}
(assert (= (+ (+ (* sc_11 0.) of_11) slbot_11) 1.51515151515e-12))
; 
; =  {(((sc.vgain[10].P*0.00965050555471)+of.vgain[10].P)+sl.max.vgain[10].P)} {5445000.}
(assert (= (+ (+ (* sc_11 0.00965050555471) of_11) sltop_11) 5445000.))
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
; =  {sc.vgain[15].P} {((sc.vgain[15].X/sc.vgain[15].Y)*sc.vgain[15].Z*1.)}
(assert (= sc_15 (* (* (/ sc_12 sc_13) sc_14) 1.)))
; 
; =  {of.vgain[15].P} {0.}
(assert (= of_15 0.))
; 
; >=  {((sc.vgain[15].X*2.)+of.vgain[15].X)} {3300.}
(assert (<= (+ (* sc_12 2.) of_12) 3300.))
; 
; <=  {((sc.vgain[15].X*2.)+of.vgain[15].X)} {0.0001}
(assert (>= (+ (* sc_12 2.) of_12) 0.0001))
; 
; >=  {((sc.vgain[15].Y*1.)+of.vgain[15].Y)} {3300.}
(assert (<= (+ (* sc_13 1.) of_13) 3300.))
; 
; <=  {((sc.vgain[15].Y*1.)+of.vgain[15].Y)} {1.}
(assert (>= (+ (* sc_13 1.) of_13) 1.))
(declare-fun slbot_15 () Real)
(declare-fun sltop_15 () Real)
; 
; =  {(((sc.vgain[15].P*0.176776695297)+of.vgain[15].P)+sl.min.vgain[15].P)} {1.51515151515e-12}
(assert (= (+ (+ (* sc_15 0.176776695297) of_15) slbot_15) 1.51515151515e-12))
; 
; =  {(((sc.vgain[15].P*1.)+of.vgain[15].P)+sl.max.vgain[15].P)} {5445000.}
(assert (= (+ (+ (* sc_15 1.) of_15) sltop_15) 5445000.))
(declare-fun slbot_14 () Real)
(declare-fun sltop_14 () Real)
; 
; =  {(((sc.vgain[15].Z*0.176776695297)+of.vgain[15].Z)+sl.min.vgain[15].Z)} {0.0001}
(assert (= (+ (+ (* sc_14 0.176776695297) of_14) slbot_14) 0.0001))
; 
; =  {(((sc.vgain[15].Z*1.)+of.vgain[15].Z)+sl.max.vgain[15].Z)} {3300.}
(assert (= (+ (+ (* sc_14 1.) of_14) sltop_14) 3300.))
(declare-fun slbot_15 () Real)
(declare-fun sltop_15 () Real)
; 
; =  {(((sc.vgain[15].P*0.176776695297)+of.vgain[15].P)+sl.min.vgain[15].P)} {1.51515151515e-12}
(assert (= (+ (+ (* sc_15 0.176776695297) of_15) slbot_15) 1.51515151515e-12))
; 
; =  {(((sc.vgain[15].P*1.)+of.vgain[15].P)+sl.max.vgain[15].P)} {5445000.}
(assert (= (+ (+ (* sc_15 1.) of_15) sltop_15) 5445000.))
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
(declare-fun sc_20 () Real)
(assert (> sc_20 1e-08))
(declare-fun of_20 () Real)
; no offset
(assert (= of_16 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_17 0.))
; no offset
(assert (= of_18 0.))
; 
; =  {(sc.switch[3].SUB/sc.switch[3].Kmod)} {1.}
(assert (= (/ sc_17 sc_18) 1.))
; no scale
(assert (= (/ sc_17 sc_18) 1.))
; no scale
(assert (= (/ sc_16 1.) 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_19 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.switch[3].PROD} {(sc.switch[3].Vmax/1.)}
(assert (= sc_20 (/ sc_19 1.)))
; 
; =  {of.switch[3].PROD} {0.}
(assert (= of_20 0.))
; 
; >=  {((sc.switch[3].n*1000.75)+of.switch[3].n)} {3300.}
(assert (<= (+ (* sc_16 1000.75) of_16) 3300.))
; 
; <=  {((sc.switch[3].n*1000.75)+of.switch[3].n)} {0.5}
(assert (>= (+ (* sc_16 1000.75) of_16) 0.5))
(declare-fun slbot_17 () Real)
(declare-fun sltop_17 () Real)
; 
; =  {(((sc.switch[3].SUB*0.)+of.switch[3].SUB)+sl.min.switch[3].SUB)} {0.0001}
(assert (= (+ (+ (* sc_17 0.) of_17) slbot_17) 0.0001))
; 
; =  {(((sc.switch[3].SUB*0.06)+of.switch[3].SUB)+sl.max.switch[3].SUB)} {10.}
(assert (= (+ (+ (* sc_17 0.06) of_17) sltop_17) 10.))
; 
; >=  {((sc.switch[3].Kmod*0.029618)+of.switch[3].Kmod)} {10.}
(assert (<= (+ (* sc_18 0.029618) of_18) 10.))
; 
; <=  {((sc.switch[3].Kmod*0.029618)+of.switch[3].Kmod)} {0.0001}
(assert (>= (+ (* sc_18 0.029618) of_18) 0.0001))
(declare-fun slbot_20 () Real)
(declare-fun sltop_20 () Real)
; 
; =  {(((sc.switch[3].PROD*0.)+of.switch[3].PROD)+sl.min.switch[3].PROD)} {9.99934002508e-38}
(assert (= (+ (+ (* sc_20 0.) of_20) slbot_20) 9.99934002508e-38))
; 
; =  {(((sc.switch[3].PROD*0.0156)+of.switch[3].PROD)+sl.max.switch[3].PROD)} {9.9999999}
(assert (= (+ (+ (* sc_20 0.0156) of_20) sltop_20) 9.9999999))
(declare-fun slbot_19 () Real)
(declare-fun sltop_19 () Real)
; 
; =  {(((sc.switch[3].Vmax*0.)+of.switch[3].Vmax)+sl.min.switch[3].Vmax)} {0.0001}
(assert (= (+ (+ (* sc_19 0.) of_19) slbot_19) 0.0001))
; 
; =  {(((sc.switch[3].Vmax*0.0156)+of.switch[3].Vmax)+sl.max.switch[3].Vmax)} {10.}
(assert (= (+ (+ (* sc_19 0.0156) of_19) sltop_19) 10.))
(declare-fun slbot_20 () Real)
(declare-fun sltop_20 () Real)
; 
; =  {(((sc.switch[3].PROD*0.)+of.switch[3].PROD)+sl.min.switch[3].PROD)} {9.99934002508e-38}
(assert (= (+ (+ (* sc_20 0.) of_20) slbot_20) 9.99934002508e-38))
; 
; =  {(((sc.switch[3].PROD*0.0156)+of.switch[3].PROD)+sl.max.switch[3].PROD)} {9.9999999}
(assert (= (+ (+ (* sc_20 0.0156) of_20) sltop_20) 9.9999999))
(declare-fun sc_21 () Real)
(assert (> sc_21 1e-08))
(declare-fun of_21 () Real)
(declare-fun sc_22 () Real)
(assert (> sc_22 1e-08))
(declare-fun of_22 () Real)
(declare-fun sc_23 () Real)
(assert (> sc_23 1e-08))
(declare-fun of_23 () Real)
(declare-fun sc_24 () Real)
(assert (> sc_24 1e-08))
(declare-fun of_24 () Real)
(declare-fun sc_25 () Real)
(assert (> sc_25 1e-08))
(declare-fun of_25 () Real)
; no offset
(assert (= of_21 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_22 0.))
; no offset
(assert (= of_23 0.))
; 
; =  {(sc.switch[17].SUB/sc.switch[17].Kmod)} {1.}
(assert (= (/ sc_22 sc_23) 1.))
; no scale
(assert (= (/ sc_22 sc_23) 1.))
; no scale
(assert (= (/ sc_21 1.) 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_24 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.switch[17].PROD} {(sc.switch[17].Vmax/1.)}
(assert (= sc_25 (/ sc_24 1.)))
; 
; =  {of.switch[17].PROD} {0.}
(assert (= of_25 0.))
; 
; >=  {((sc.switch[17].n*-1250.)+of.switch[17].n)} {3300.}
(assert (<= (+ (* sc_21 -1250.) of_21) 3300.))
; 
; <=  {((sc.switch[17].n*-1250.)+of.switch[17].n)} {0.5}
(assert (>= (+ (* sc_21 -1250.) of_21) 0.5))
(declare-fun slbot_22 () Real)
(declare-fun sltop_22 () Real)
; 
; =  {(((sc.switch[17].SUB*-0.5)+of.switch[17].SUB)+sl.min.switch[17].SUB)} {0.0001}
(assert (= (+ (+ (* sc_22 -0.5) of_22) slbot_22) 0.0001))
; 
; =  {(((sc.switch[17].SUB*0.)+of.switch[17].SUB)+sl.max.switch[17].SUB)} {10.}
(assert (= (+ (+ (* sc_22 0.) of_22) sltop_22) 10.))
; 
; >=  {((sc.switch[17].Kmod*1.)+of.switch[17].Kmod)} {10.}
(assert (<= (+ (* sc_23 1.) of_23) 10.))
; 
; <=  {((sc.switch[17].Kmod*1.)+of.switch[17].Kmod)} {0.0001}
(assert (>= (+ (* sc_23 1.) of_23) 0.0001))
(declare-fun slbot_25 () Real)
(declare-fun sltop_25 () Real)
; 
; =  {(((sc.switch[17].PROD*0.176776695297)+of.switch[17].PROD)+sl.min.switch[17].PROD)} {9.99934002508e-38}
(assert (= (+ (+ (* sc_25 0.176776695297) of_25) slbot_25) 9.99934002508e-38))
; 
; =  {(((sc.switch[17].PROD*1.)+of.switch[17].PROD)+sl.max.switch[17].PROD)} {9.9999999}
(assert (= (+ (+ (* sc_25 1.) of_25) sltop_25) 9.9999999))
; 
; >=  {((sc.switch[17].Vmax*1.)+of.switch[17].Vmax)} {10.}
(assert (<= (+ (* sc_24 1.) of_24) 10.))
; 
; <=  {((sc.switch[17].Vmax*1.)+of.switch[17].Vmax)} {0.0001}
(assert (>= (+ (* sc_24 1.) of_24) 0.0001))
(declare-fun slbot_25 () Real)
(declare-fun sltop_25 () Real)
; 
; =  {(((sc.switch[17].PROD*0.176776695297)+of.switch[17].PROD)+sl.min.switch[17].PROD)} {9.99934002508e-38}
(assert (= (+ (+ (* sc_25 0.176776695297) of_25) slbot_25) 9.99934002508e-38))
; 
; =  {(((sc.switch[17].PROD*1.)+of.switch[17].PROD)+sl.max.switch[17].PROD)} {9.9999999}
(assert (= (+ (+ (* sc_25 1.) of_25) sltop_25) 9.9999999))
(declare-fun sc_26 () Real)
(assert (> sc_26 1e-08))
(declare-fun of_26 () Real)
(declare-fun sc_27 () Real)
(assert (> sc_27 1e-08))
(declare-fun of_27 () Real)
(declare-fun sc_28 () Real)
(assert (> sc_28 1e-08))
(declare-fun of_28 () Real)
(declare-fun sc_29 () Real)
(assert (> sc_29 1e-08))
(declare-fun of_29 () Real)
(declare-fun sc_30 () Real)
(assert (> sc_30 1e-08))
(declare-fun of_30 () Real)
; no offset
(assert (= of_26 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_27 0.))
; no offset
(assert (= of_28 0.))
; 
; =  {(sc.switch[19].SUB/sc.switch[19].Kmod)} {1.}
(assert (= (/ sc_27 sc_28) 1.))
; no scale
(assert (= (/ sc_27 sc_28) 1.))
; no scale
(assert (= (/ sc_26 1.) 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_29 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.switch[19].PROD} {(sc.switch[19].Vmax/1.)}
(assert (= sc_30 (/ sc_29 1.)))
; 
; =  {of.switch[19].PROD} {0.}
(assert (= of_30 0.))
; 
; >=  {((sc.switch[19].n*-1250.)+of.switch[19].n)} {3300.}
(assert (<= (+ (* sc_26 -1250.) of_26) 3300.))
; 
; <=  {((sc.switch[19].n*-1250.)+of.switch[19].n)} {0.5}
(assert (>= (+ (* sc_26 -1250.) of_26) 0.5))
(declare-fun slbot_27 () Real)
(declare-fun sltop_27 () Real)
; 
; =  {(((sc.switch[19].SUB*-1.)+of.switch[19].SUB)+sl.min.switch[19].SUB)} {0.0001}
(assert (= (+ (+ (* sc_27 -1.) of_27) slbot_27) 0.0001))
; 
; =  {(((sc.switch[19].SUB*-0.84375)+of.switch[19].SUB)+sl.max.switch[19].SUB)} {10.}
(assert (= (+ (+ (* sc_27 -0.84375) of_27) sltop_27) 10.))
; 
; >=  {((sc.switch[19].Kmod*1.)+of.switch[19].Kmod)} {10.}
(assert (<= (+ (* sc_28 1.) of_28) 10.))
; 
; <=  {((sc.switch[19].Kmod*1.)+of.switch[19].Kmod)} {0.0001}
(assert (>= (+ (* sc_28 1.) of_28) 0.0001))
(declare-fun slbot_30 () Real)
(declare-fun sltop_30 () Real)
; 
; =  {(((sc.switch[19].PROD*0.)+of.switch[19].PROD)+sl.min.switch[19].PROD)} {9.99934002508e-38}
(assert (= (+ (+ (* sc_30 0.) of_30) slbot_30) 9.99934002508e-38))
; 
; =  {(((sc.switch[19].PROD*0.00965050555471)+of.switch[19].PROD)+sl.max.switch[19].PROD)} {9.9999999}
(assert (= (+ (+ (* sc_30 0.00965050555471) of_30) sltop_30) 9.9999999))
; 
; >=  {((sc.switch[19].Vmax*1.)+of.switch[19].Vmax)} {10.}
(assert (<= (+ (* sc_29 1.) of_29) 10.))
; 
; <=  {((sc.switch[19].Vmax*1.)+of.switch[19].Vmax)} {0.0001}
(assert (>= (+ (* sc_29 1.) of_29) 0.0001))
(declare-fun slbot_30 () Real)
(declare-fun sltop_30 () Real)
; 
; =  {(((sc.switch[19].PROD*0.)+of.switch[19].PROD)+sl.min.switch[19].PROD)} {9.99934002508e-38}
(assert (= (+ (+ (* sc_30 0.) of_30) slbot_30) 9.99934002508e-38))
; 
; =  {(((sc.switch[19].PROD*0.00965050555471)+of.switch[19].PROD)+sl.max.switch[19].PROD)} {9.9999999}
(assert (= (+ (+ (* sc_30 0.00965050555471) of_30) sltop_30) 9.9999999))
(declare-fun sc_31 () Real)
(assert (> sc_31 1e-08))
(declare-fun of_31 () Real)
(declare-fun sc_32 () Real)
(assert (> sc_32 1e-08))
(declare-fun of_32 () Real)
; 
; =  {sc.input.I[2].O} {sc.input.I[2].X}
(assert (= sc_32 sc_31))
; 
; =  {of.input.I[2].O} {of.input.I[2].X}
(assert (= of_32 of_31))
(declare-fun slbot_31 () Real)
(declare-fun sltop_31 () Real)
; 
; =  {(((sc.input.I[2].X*0.5)+of.input.I[2].X)+sl.min.input.I[2].X)} {0.}
(assert (= (+ (+ (* sc_31 0.5) of_31) slbot_31) 0.))
; 
; =  {(((sc.input.I[2].X*1.)+of.input.I[2].X)+sl.max.input.I[2].X)} {10.}
(assert (= (+ (+ (* sc_31 1.) of_31) sltop_31) 10.))
(declare-fun slbot_32 () Real)
(declare-fun sltop_32 () Real)
; 
; =  {(((sc.input.I[2].O*0.5)+of.input.I[2].O)+sl.min.input.I[2].O)} {0.}
(assert (= (+ (+ (* sc_32 0.5) of_32) slbot_32) 0.))
; 
; =  {(((sc.input.I[2].O*1.)+of.input.I[2].O)+sl.max.input.I[2].O)} {10.}
(assert (= (+ (+ (* sc_32 1.) of_32) sltop_32) 10.))
(declare-fun sc_33 () Real)
(assert (> sc_33 1e-08))
(declare-fun of_33 () Real)
(declare-fun sc_34 () Real)
(assert (> sc_34 1e-08))
(declare-fun of_34 () Real)
; 
; =  {sc.input.I[8].O} {sc.input.I[8].X}
(assert (= sc_34 sc_33))
; 
; =  {of.input.I[8].O} {of.input.I[8].X}
(assert (= of_34 of_33))
; 
; >=  {((sc.input.I[8].X*0.)+of.input.I[8].X)} {10.}
(assert (<= (+ (* sc_33 0.) of_33) 10.))
; 
; <=  {((sc.input.I[8].X*0.)+of.input.I[8].X)} {0.}
(assert (>= (+ (* sc_33 0.) of_33) 0.))
; 
; >=  {((sc.input.I[8].O*0.)+of.input.I[8].O)} {10.}
(assert (<= (+ (* sc_34 0.) of_34) 10.))
; 
; <=  {((sc.input.I[8].O*0.)+of.input.I[8].O)} {0.}
(assert (>= (+ (* sc_34 0.) of_34) 0.))
(declare-fun sc_35 () Real)
(assert (> sc_35 1e-08))
(declare-fun of_35 () Real)
(declare-fun sc_36 () Real)
(assert (> sc_36 1e-08))
(declare-fun of_36 () Real)
; 
; =  {sc.input.I[7].O} {sc.input.I[7].X}
(assert (= sc_36 sc_35))
; 
; =  {of.input.I[7].O} {of.input.I[7].X}
(assert (= of_36 of_35))
; 
; >=  {((sc.input.I[7].X*0.)+of.input.I[7].X)} {10.}
(assert (<= (+ (* sc_35 0.) of_35) 10.))
; 
; <=  {((sc.input.I[7].X*0.)+of.input.I[7].X)} {0.}
(assert (>= (+ (* sc_35 0.) of_35) 0.))
; 
; >=  {((sc.input.I[7].O*0.)+of.input.I[7].O)} {10.}
(assert (<= (+ (* sc_36 0.) of_36) 10.))
; 
; <=  {((sc.input.I[7].O*0.)+of.input.I[7].O)} {0.}
(assert (>= (+ (* sc_36 0.) of_36) 0.))
(declare-fun sc_37 () Real)
(assert (> sc_37 1e-08))
(declare-fun of_37 () Real)
(declare-fun sc_38 () Real)
(assert (> sc_38 1e-08))
(declare-fun of_38 () Real)
; 
; =  {sc.input.I[13].O} {sc.input.I[13].X}
(assert (= sc_38 sc_37))
; 
; =  {of.input.I[13].O} {of.input.I[13].X}
(assert (= of_38 of_37))
; 
; >=  {((sc.input.I[13].X*0.029618)+of.input.I[13].X)} {10.}
(assert (<= (+ (* sc_37 0.029618) of_37) 10.))
; 
; <=  {((sc.input.I[13].X*0.029618)+of.input.I[13].X)} {0.}
(assert (>= (+ (* sc_37 0.029618) of_37) 0.))
; 
; >=  {((sc.input.I[13].O*0.029618)+of.input.I[13].O)} {10.}
(assert (<= (+ (* sc_38 0.029618) of_38) 10.))
; 
; <=  {((sc.input.I[13].O*0.029618)+of.input.I[13].O)} {0.}
(assert (>= (+ (* sc_38 0.029618) of_38) 0.))
(declare-fun sc_39 () Real)
(assert (> sc_39 1e-08))
(declare-fun of_39 () Real)
(declare-fun sc_40 () Real)
(assert (> sc_40 1e-08))
(declare-fun of_40 () Real)
; 
; =  {sc.input.I[12].O} {sc.input.I[12].X}
(assert (= sc_40 sc_39))
; 
; =  {of.input.I[12].O} {of.input.I[12].X}
(assert (= of_40 of_39))
; 
; >=  {((sc.input.I[12].X*4.)+of.input.I[12].X)} {10.}
(assert (<= (+ (* sc_39 4.) of_39) 10.))
; 
; <=  {((sc.input.I[12].X*4.)+of.input.I[12].X)} {0.}
(assert (>= (+ (* sc_39 4.) of_39) 0.))
; 
; >=  {((sc.input.I[12].O*4.)+of.input.I[12].O)} {10.}
(assert (<= (+ (* sc_40 4.) of_40) 10.))
; 
; <=  {((sc.input.I[12].O*4.)+of.input.I[12].O)} {0.}
(assert (>= (+ (* sc_40 4.) of_40) 0.))
(declare-fun sc_41 () Real)
(assert (> sc_41 1e-08))
(declare-fun of_41 () Real)
(declare-fun sc_42 () Real)
(assert (> sc_42 1e-08))
(declare-fun of_42 () Real)
; 
; =  {sc.input.I[9].O} {sc.input.I[9].X}
(assert (= sc_42 sc_41))
; 
; =  {of.input.I[9].O} {of.input.I[9].X}
(assert (= of_42 of_41))
; 
; >=  {((sc.input.I[9].X*0.)+of.input.I[9].X)} {10.}
(assert (<= (+ (* sc_41 0.) of_41) 10.))
; 
; <=  {((sc.input.I[9].X*0.)+of.input.I[9].X)} {0.}
(assert (>= (+ (* sc_41 0.) of_41) 0.))
; 
; >=  {((sc.input.I[9].O*0.)+of.input.I[9].O)} {10.}
(assert (<= (+ (* sc_42 0.) of_42) 10.))
; 
; <=  {((sc.input.I[9].O*0.)+of.input.I[9].O)} {0.}
(assert (>= (+ (* sc_42 0.) of_42) 0.))
(declare-fun sc_43 () Real)
(assert (> sc_43 1e-08))
(declare-fun of_43 () Real)
(declare-fun sc_44 () Real)
(assert (> sc_44 1e-08))
(declare-fun of_44 () Real)
; 
; =  {sc.input.I[0].O} {sc.input.I[0].X}
(assert (= sc_44 sc_43))
; 
; =  {of.input.I[0].O} {of.input.I[0].X}
(assert (= of_44 of_43))
(declare-fun slbot_43 () Real)
(declare-fun sltop_43 () Real)
; 
; =  {(((sc.input.I[0].X*0.)+of.input.I[0].X)+sl.min.input.I[0].X)} {0.}
(assert (= (+ (+ (* sc_43 0.) of_43) slbot_43) 0.))
; 
; =  {(((sc.input.I[0].X*0.06)+of.input.I[0].X)+sl.max.input.I[0].X)} {10.}
(assert (= (+ (+ (* sc_43 0.06) of_43) sltop_43) 10.))
(declare-fun slbot_44 () Real)
(declare-fun sltop_44 () Real)
; 
; =  {(((sc.input.I[0].O*0.)+of.input.I[0].O)+sl.min.input.I[0].O)} {0.}
(assert (= (+ (+ (* sc_44 0.) of_44) slbot_44) 0.))
; 
; =  {(((sc.input.I[0].O*0.06)+of.input.I[0].O)+sl.max.input.I[0].O)} {10.}
(assert (= (+ (+ (* sc_44 0.06) of_44) sltop_44) 10.))
(declare-fun sc_45 () Real)
(assert (> sc_45 1e-08))
(declare-fun of_45 () Real)
(declare-fun sc_46 () Real)
(assert (> sc_46 1e-08))
(declare-fun of_46 () Real)
; 
; =  {sc.input.I[11].O} {sc.input.I[11].X}
(assert (= sc_46 sc_45))
; 
; =  {of.input.I[11].O} {of.input.I[11].X}
(assert (= of_46 of_45))
; 
; >=  {((sc.input.I[11].X*4.)+of.input.I[11].X)} {10.}
(assert (<= (+ (* sc_45 4.) of_45) 10.))
; 
; <=  {((sc.input.I[11].X*4.)+of.input.I[11].X)} {0.}
(assert (>= (+ (* sc_45 4.) of_45) 0.))
; 
; >=  {((sc.input.I[11].O*4.)+of.input.I[11].O)} {10.}
(assert (<= (+ (* sc_46 4.) of_46) 10.))
; 
; <=  {((sc.input.I[11].O*4.)+of.input.I[11].O)} {0.}
(assert (>= (+ (* sc_46 4.) of_46) 0.))
(declare-fun sc_47 () Real)
(assert (> sc_47 1e-08))
(declare-fun of_47 () Real)
(declare-fun sc_48 () Real)
(assert (> sc_48 1e-08))
(declare-fun of_48 () Real)
; 
; =  {sc.input.I[10].O} {sc.input.I[10].X}
(assert (= sc_48 sc_47))
; 
; =  {of.input.I[10].O} {of.input.I[10].X}
(assert (= of_48 of_47))
; 
; >=  {((sc.input.I[10].X*0.)+of.input.I[10].X)} {10.}
(assert (<= (+ (* sc_47 0.) of_47) 10.))
; 
; <=  {((sc.input.I[10].X*0.)+of.input.I[10].X)} {0.}
(assert (>= (+ (* sc_47 0.) of_47) 0.))
; 
; >=  {((sc.input.I[10].O*0.)+of.input.I[10].O)} {10.}
(assert (<= (+ (* sc_48 0.) of_48) 10.))
; 
; <=  {((sc.input.I[10].O*0.)+of.input.I[10].O)} {0.}
(assert (>= (+ (* sc_48 0.) of_48) 0.))
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
; >=  {((sc.input.I[15].X*1.)+of.input.I[15].X)} {10.}
(assert (<= (+ (* sc_49 1.) of_49) 10.))
; 
; <=  {((sc.input.I[15].X*1.)+of.input.I[15].X)} {0.}
(assert (>= (+ (* sc_49 1.) of_49) 0.))
; 
; >=  {((sc.input.I[15].O*1.)+of.input.I[15].O)} {10.}
(assert (<= (+ (* sc_50 1.) of_50) 10.))
; 
; <=  {((sc.input.I[15].O*1.)+of.input.I[15].O)} {0.}
(assert (>= (+ (* sc_50 1.) of_50) 0.))
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
; =  {sc.input.I[14].O} {sc.input.I[14].X}
(assert (= sc_54 sc_53))
; 
; =  {of.input.I[14].O} {of.input.I[14].X}
(assert (= of_54 of_53))
; 
; >=  {((sc.input.I[14].X*1.)+of.input.I[14].X)} {10.}
(assert (<= (+ (* sc_53 1.) of_53) 10.))
; 
; <=  {((sc.input.I[14].X*1.)+of.input.I[14].X)} {0.}
(assert (>= (+ (* sc_53 1.) of_53) 0.))
; 
; >=  {((sc.input.I[14].O*1.)+of.input.I[14].O)} {10.}
(assert (<= (+ (* sc_54 1.) of_54) 10.))
; 
; <=  {((sc.input.I[14].O*1.)+of.input.I[14].O)} {0.}
(assert (>= (+ (* sc_54 1.) of_54) 0.))
(declare-fun sc_55 () Real)
(assert (> sc_55 1e-08))
(declare-fun of_55 () Real)
(declare-fun sc_56 () Real)
(assert (> sc_56 1e-08))
(declare-fun of_56 () Real)
; 
; =  {sc.input.I[24].O} {sc.input.I[24].X}
(assert (= sc_56 sc_55))
; 
; =  {of.input.I[24].O} {of.input.I[24].X}
(assert (= of_56 of_55))
; 
; >=  {((sc.input.I[24].X*0.)+of.input.I[24].X)} {10.}
(assert (<= (+ (* sc_55 0.) of_55) 10.))
; 
; <=  {((sc.input.I[24].X*0.)+of.input.I[24].X)} {0.}
(assert (>= (+ (* sc_55 0.) of_55) 0.))
; 
; >=  {((sc.input.I[24].O*0.)+of.input.I[24].O)} {10.}
(assert (<= (+ (* sc_56 0.) of_56) 10.))
; 
; <=  {((sc.input.I[24].O*0.)+of.input.I[24].O)} {0.}
(assert (>= (+ (* sc_56 0.) of_56) 0.))
(declare-fun sc_57 () Real)
(assert (> sc_57 1e-08))
(declare-fun of_57 () Real)
(declare-fun sc_58 () Real)
(assert (> sc_58 1e-08))
(declare-fun of_58 () Real)
; 
; =  {sc.input.I[16].O} {sc.input.I[16].X}
(assert (= sc_58 sc_57))
; 
; =  {of.input.I[16].O} {of.input.I[16].X}
(assert (= of_58 of_57))
; 
; >=  {((sc.input.I[16].X*1.)+of.input.I[16].X)} {10.}
(assert (<= (+ (* sc_57 1.) of_57) 10.))
; 
; <=  {((sc.input.I[16].X*1.)+of.input.I[16].X)} {0.}
(assert (>= (+ (* sc_57 1.) of_57) 0.))
; 
; >=  {((sc.input.I[16].O*1.)+of.input.I[16].O)} {10.}
(assert (<= (+ (* sc_58 1.) of_58) 10.))
; 
; <=  {((sc.input.I[16].O*1.)+of.input.I[16].O)} {0.}
(assert (>= (+ (* sc_58 1.) of_58) 0.))
(declare-fun sc_59 () Real)
(assert (> sc_59 1e-08))
(declare-fun of_59 () Real)
(declare-fun sc_60 () Real)
(assert (> sc_60 1e-08))
(declare-fun of_60 () Real)
; 
; =  {sc.input.I[3].O} {sc.input.I[3].X}
(assert (= sc_60 sc_59))
; 
; =  {of.input.I[3].O} {of.input.I[3].X}
(assert (= of_60 of_59))
; 
; >=  {((sc.input.I[3].X*0.0156)+of.input.I[3].X)} {10.}
(assert (<= (+ (* sc_59 0.0156) of_59) 10.))
; 
; <=  {((sc.input.I[3].X*0.0156)+of.input.I[3].X)} {0.}
(assert (>= (+ (* sc_59 0.0156) of_59) 0.))
; 
; >=  {((sc.input.I[3].O*0.0156)+of.input.I[3].O)} {10.}
(assert (<= (+ (* sc_60 0.0156) of_60) 10.))
; 
; <=  {((sc.input.I[3].O*0.0156)+of.input.I[3].O)} {0.}
(assert (>= (+ (* sc_60 0.0156) of_60) 0.))
(declare-fun sc_61 () Real)
(assert (> sc_61 1e-08))
(declare-fun of_61 () Real)
(declare-fun sc_62 () Real)
(assert (> sc_62 1e-08))
(declare-fun of_62 () Real)
; 
; =  {sc.input.I[4].O} {sc.input.I[4].X}
(assert (= sc_62 sc_61))
; 
; =  {of.input.I[4].O} {of.input.I[4].X}
(assert (= of_62 of_61))
; 
; >=  {((sc.input.I[4].X*0.)+of.input.I[4].X)} {10.}
(assert (<= (+ (* sc_61 0.) of_61) 10.))
; 
; <=  {((sc.input.I[4].X*0.)+of.input.I[4].X)} {0.}
(assert (>= (+ (* sc_61 0.) of_61) 0.))
; 
; >=  {((sc.input.I[4].O*0.)+of.input.I[4].O)} {10.}
(assert (<= (+ (* sc_62 0.) of_62) 10.))
; 
; <=  {((sc.input.I[4].O*0.)+of.input.I[4].O)} {0.}
(assert (>= (+ (* sc_62 0.) of_62) 0.))
(declare-fun sc_63 () Real)
(assert (> sc_63 1e-08))
(declare-fun of_63 () Real)
(declare-fun sc_64 () Real)
(assert (> sc_64 1e-08))
(declare-fun of_64 () Real)
; 
; =  {sc.input.I[5].O} {sc.input.I[5].X}
(assert (= sc_64 sc_63))
; 
; =  {of.input.I[5].O} {of.input.I[5].X}
(assert (= of_64 of_63))
; 
; >=  {((sc.input.I[5].X*0.)+of.input.I[5].X)} {10.}
(assert (<= (+ (* sc_63 0.) of_63) 10.))
; 
; <=  {((sc.input.I[5].X*0.)+of.input.I[5].X)} {0.}
(assert (>= (+ (* sc_63 0.) of_63) 0.))
; 
; >=  {((sc.input.I[5].O*0.)+of.input.I[5].O)} {10.}
(assert (<= (+ (* sc_64 0.) of_64) 10.))
; 
; <=  {((sc.input.I[5].O*0.)+of.input.I[5].O)} {0.}
(assert (>= (+ (* sc_64 0.) of_64) 0.))
(declare-fun sc_65 () Real)
(assert (> sc_65 1e-08))
(declare-fun of_65 () Real)
(declare-fun sc_66 () Real)
(assert (> sc_66 1e-08))
(declare-fun of_66 () Real)
; 
; =  {sc.input.I[23].O} {sc.input.I[23].X}
(assert (= sc_66 sc_65))
; 
; =  {of.input.I[23].O} {of.input.I[23].X}
(assert (= of_66 of_65))
; 
; >=  {((sc.input.I[23].X*0.)+of.input.I[23].X)} {10.}
(assert (<= (+ (* sc_65 0.) of_65) 10.))
; 
; <=  {((sc.input.I[23].X*0.)+of.input.I[23].X)} {0.}
(assert (>= (+ (* sc_65 0.) of_65) 0.))
; 
; >=  {((sc.input.I[23].O*0.)+of.input.I[23].O)} {10.}
(assert (<= (+ (* sc_66 0.) of_66) 10.))
; 
; <=  {((sc.input.I[23].O*0.)+of.input.I[23].O)} {0.}
(assert (>= (+ (* sc_66 0.) of_66) 0.))
(declare-fun sc_67 () Real)
(assert (> sc_67 1e-08))
(declare-fun of_67 () Real)
(declare-fun sc_68 () Real)
(assert (> sc_68 1e-08))
(declare-fun of_68 () Real)
; 
; =  {sc.input.I[25].O} {sc.input.I[25].X}
(assert (= sc_68 sc_67))
; 
; =  {of.input.I[25].O} {of.input.I[25].X}
(assert (= of_68 of_67))
; 
; >=  {((sc.input.I[25].X*0.)+of.input.I[25].X)} {10.}
(assert (<= (+ (* sc_67 0.) of_67) 10.))
; 
; <=  {((sc.input.I[25].X*0.)+of.input.I[25].X)} {0.}
(assert (>= (+ (* sc_67 0.) of_67) 0.))
; 
; >=  {((sc.input.I[25].O*0.)+of.input.I[25].O)} {10.}
(assert (<= (+ (* sc_68 0.) of_68) 10.))
; 
; <=  {((sc.input.I[25].O*0.)+of.input.I[25].O)} {0.}
(assert (>= (+ (* sc_68 0.) of_68) 0.))
(declare-fun sc_69 () Real)
(assert (> sc_69 1e-08))
(declare-fun of_69 () Real)
(declare-fun sc_70 () Real)
(assert (> sc_70 1e-08))
(declare-fun of_70 () Real)
; 
; =  {sc.input.I[1].O} {sc.input.I[1].X}
(assert (= sc_70 sc_69))
; 
; =  {of.input.I[1].O} {of.input.I[1].X}
(assert (= of_70 of_69))
(declare-fun slbot_69 () Real)
(declare-fun sltop_69 () Real)
; 
; =  {(((sc.input.I[1].X*0.5)+of.input.I[1].X)+sl.min.input.I[1].X)} {0.}
(assert (= (+ (+ (* sc_69 0.5) of_69) slbot_69) 0.))
; 
; =  {(((sc.input.I[1].X*1.)+of.input.I[1].X)+sl.max.input.I[1].X)} {10.}
(assert (= (+ (+ (* sc_69 1.) of_69) sltop_69) 10.))
(declare-fun slbot_70 () Real)
(declare-fun sltop_70 () Real)
; 
; =  {(((sc.input.I[1].O*0.5)+of.input.I[1].O)+sl.min.input.I[1].O)} {0.}
(assert (= (+ (+ (* sc_70 0.5) of_70) slbot_70) 0.))
; 
; =  {(((sc.input.I[1].O*1.)+of.input.I[1].O)+sl.max.input.I[1].O)} {10.}
(assert (= (+ (+ (* sc_70 1.) of_70) sltop_70) 10.))
(declare-fun sc_71 () Real)
(assert (> sc_71 1e-08))
(declare-fun of_71 () Real)
(declare-fun sc_72 () Real)
(assert (> sc_72 1e-08))
(declare-fun of_72 () Real)
; 
; =  {sc.input.I[17].O} {sc.input.I[17].X}
(assert (= sc_72 sc_71))
; 
; =  {of.input.I[17].O} {of.input.I[17].X}
(assert (= of_72 of_71))
; 
; >=  {((sc.input.I[17].X*1.)+of.input.I[17].X)} {10.}
(assert (<= (+ (* sc_71 1.) of_71) 10.))
; 
; <=  {((sc.input.I[17].X*1.)+of.input.I[17].X)} {0.}
(assert (>= (+ (* sc_71 1.) of_71) 0.))
; 
; >=  {((sc.input.I[17].O*1.)+of.input.I[17].O)} {10.}
(assert (<= (+ (* sc_72 1.) of_72) 10.))
; 
; <=  {((sc.input.I[17].O*1.)+of.input.I[17].O)} {0.}
(assert (>= (+ (* sc_72 1.) of_72) 0.))
(declare-fun sc_73 () Real)
(assert (> sc_73 1e-08))
(declare-fun of_73 () Real)
(declare-fun sc_74 () Real)
(assert (> sc_74 1e-08))
(declare-fun of_74 () Real)
; 
; =  {sc.input.I[18].O} {sc.input.I[18].X}
(assert (= sc_74 sc_73))
; 
; =  {of.input.I[18].O} {of.input.I[18].X}
(assert (= of_74 of_73))
; 
; >=  {((sc.input.I[18].X*1.)+of.input.I[18].X)} {10.}
(assert (<= (+ (* sc_73 1.) of_73) 10.))
; 
; <=  {((sc.input.I[18].X*1.)+of.input.I[18].X)} {0.}
(assert (>= (+ (* sc_73 1.) of_73) 0.))
; 
; >=  {((sc.input.I[18].O*1.)+of.input.I[18].O)} {10.}
(assert (<= (+ (* sc_74 1.) of_74) 10.))
; 
; <=  {((sc.input.I[18].O*1.)+of.input.I[18].O)} {0.}
(assert (>= (+ (* sc_74 1.) of_74) 0.))
(declare-fun sc_75 () Real)
(assert (> sc_75 1e-08))
(declare-fun of_75 () Real)
(declare-fun sc_76 () Real)
(assert (> sc_76 1e-08))
(declare-fun of_76 () Real)
; 
; =  {sc.input.I[19].O} {sc.input.I[19].X}
(assert (= sc_76 sc_75))
; 
; =  {of.input.I[19].O} {of.input.I[19].X}
(assert (= of_76 of_75))
; 
; >=  {((sc.input.I[19].X*1.)+of.input.I[19].X)} {10.}
(assert (<= (+ (* sc_75 1.) of_75) 10.))
; 
; <=  {((sc.input.I[19].X*1.)+of.input.I[19].X)} {0.}
(assert (>= (+ (* sc_75 1.) of_75) 0.))
; 
; >=  {((sc.input.I[19].O*1.)+of.input.I[19].O)} {10.}
(assert (<= (+ (* sc_76 1.) of_76) 10.))
; 
; <=  {((sc.input.I[19].O*1.)+of.input.I[19].O)} {0.}
(assert (>= (+ (* sc_76 1.) of_76) 0.))
(declare-fun sc_77 () Real)
(assert (> sc_77 1e-08))
(declare-fun of_77 () Real)
(declare-fun sc_78 () Real)
(assert (> sc_78 1e-08))
(declare-fun of_78 () Real)
; 
; =  {sc.output.V[0].O} {sc.output.V[0].X}
(assert (= sc_78 sc_77))
; 
; =  {of.output.V[0].O} {of.output.V[0].X}
(assert (= of_78 of_77))
(declare-fun slbot_77 () Real)
(declare-fun sltop_77 () Real)
; 
; =  {(((sc.output.V[0].X*0.)+of.output.V[0].X)+sl.min.output.V[0].X)} {0.0001}
(assert (= (+ (+ (* sc_77 0.) of_77) slbot_77) 0.0001))
; 
; =  {(((sc.output.V[0].X*0.15625)+of.output.V[0].X)+sl.max.output.V[0].X)} {3300.}
(assert (= (+ (+ (* sc_77 0.15625) of_77) sltop_77) 3300.))
(declare-fun slbot_78 () Real)
(declare-fun sltop_78 () Real)
; 
; =  {(((sc.output.V[0].O*0.)+of.output.V[0].O)+sl.min.output.V[0].O)} {0.0001}
(assert (= (+ (+ (* sc_78 0.) of_78) slbot_78) 0.0001))
; 
; =  {(((sc.output.V[0].O*0.15625)+of.output.V[0].O)+sl.max.output.V[0].O)} {3300.}
(assert (= (+ (+ (* sc_78 0.15625) of_78) sltop_78) 3300.))
(declare-fun sc_79 () Real)
(assert (> sc_79 1e-08))
(declare-fun of_79 () Real)
(declare-fun sc_80 () Real)
(assert (> sc_80 1e-08))
(declare-fun of_80 () Real)
; 
; =  {sc.output.V[1].O} {sc.output.V[1].X}
(assert (= sc_80 sc_79))
; 
; =  {of.output.V[1].O} {of.output.V[1].X}
(assert (= of_80 of_79))
(declare-fun slbot_79 () Real)
(declare-fun sltop_79 () Real)
; 
; =  {(((sc.output.V[1].X*0.)+of.output.V[1].X)+sl.min.output.V[1].X)} {0.0001}
(assert (= (+ (+ (* sc_79 0.) of_79) slbot_79) 0.0001))
; 
; =  {(((sc.output.V[1].X*0.0156)+of.output.V[1].X)+sl.max.output.V[1].X)} {3300.}
(assert (= (+ (+ (* sc_79 0.0156) of_79) sltop_79) 3300.))
(declare-fun slbot_80 () Real)
(declare-fun sltop_80 () Real)
; 
; =  {(((sc.output.V[1].O*0.)+of.output.V[1].O)+sl.min.output.V[1].O)} {0.0001}
(assert (= (+ (+ (* sc_80 0.) of_80) slbot_80) 0.0001))
; 
; =  {(((sc.output.V[1].O*0.0156)+of.output.V[1].O)+sl.max.output.V[1].O)} {3300.}
(assert (= (+ (+ (* sc_80 0.0156) of_80) sltop_80) 3300.))
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
(declare-fun sc_86 () Real)
(assert (> sc_86 1e-08))
(declare-fun of_86 () Real)
(declare-fun sc_87 () Real)
(assert (> sc_87 1e-08))
(declare-fun of_87 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_82 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_83 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_85 0.))
; 
; =  {sc.vadd[2].A} {(1.*sc.vadd[2].B)}
(assert (= sc_84 (* 1. sc_85)))
; 
; =  {sc.vadd[2].A} {(1.*sc.vadd[2].C)} {(1.*sc.vadd[2].D)}
(assert (and (= sc_84 (* 1. sc_83)) (= sc_84 (* 1. sc_82))))
; no offset
(assert (= (- (+ of_84 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[2].OUT} {(sc.vadd[2].A*1.)}
(assert (= sc_86 (* sc_84 1.)))
; 
; =  {of.vadd[2].OUT} {0.}
(assert (= of_86 0.))
; no scale
(assert (= sc_82 1.))
; no scale
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_82 0.))
; no offset
(assert (= of_87 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_83 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_85 0.))
; 
; =  {sc.vadd[2].A} {(1.*sc.vadd[2].B)}
(assert (= sc_84 (* 1. sc_85)))
; 
; =  {sc.vadd[2].A} {(1.*sc.vadd[2].C)} {(1.*sc.vadd[2].D*sc.vadd[2].OUT2)}
(assert (and (= sc_84 (* 1. sc_83)) (= sc_84 (* (* 1. sc_82) sc_87))))
; no offset
(assert (= (- (+ of_84 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[2].OUT2} {(sc.vadd[2].A*1.)}
(assert (= sc_87 (* sc_84 1.)))
; no offset
(assert (= of_87 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[2].OUT2_0} {(sc.vadd[2].A*1.)}
(assert (= sc_81 (* sc_84 1.)))
; 
; =  {of.vadd[2].OUT2_0} {0.}
(assert (= of_81 0.))
; 
; >=  {((sc.vadd[2].OUT2_0*0.)+of.vadd[2].OUT2_0)} {3300.}
(assert (<= (+ (* sc_81 0.) of_81) 3300.))
; 
; <=  {((sc.vadd[2].OUT2_0*0.)+of.vadd[2].OUT2_0)} {0.}
(assert (>= (+ (* sc_81 0.) of_81) 0.))
; 
; >=  {((sc.vadd[2].D*4e-06)+of.vadd[2].D)} {3300.}
(assert (<= (+ (* sc_82 4e-06) of_82) 3300.))
; 
; <=  {((sc.vadd[2].D*4e-06)+of.vadd[2].D)} {0.}
(assert (>= (+ (* sc_82 4e-06) of_82) 0.))
; 
; >=  {((sc.vadd[2].C*0.)+of.vadd[2].C)} {3300.}
(assert (<= (+ (* sc_83 0.) of_83) 3300.))
; 
; <=  {((sc.vadd[2].C*0.)+of.vadd[2].C)} {0.}
(assert (>= (+ (* sc_83 0.) of_83) 0.))
; 
; >=  {((sc.vadd[2].A*0.)+of.vadd[2].A)} {3300.}
(assert (<= (+ (* sc_84 0.) of_84) 3300.))
; 
; <=  {((sc.vadd[2].A*0.)+of.vadd[2].A)} {0.}
(assert (>= (+ (* sc_84 0.) of_84) 0.))
(declare-fun slbot_87 () Real)
(declare-fun sltop_87 () Real)
; 
; =  {(((sc.vadd[2].OUT2*0.)+of.vadd[2].OUT2)+sl.min.vadd[2].OUT2)} {0.}
(assert (= (+ (+ (* sc_87 0.) of_87) slbot_87) 0.))
; 
; =  {(((sc.vadd[2].OUT2*0.0156)+of.vadd[2].OUT2)+sl.max.vadd[2].OUT2)} {3300.}
(assert (= (+ (+ (* sc_87 0.0156) of_87) sltop_87) 3300.))
(declare-fun slbot_85 () Real)
(declare-fun sltop_85 () Real)
; 
; =  {(((sc.vadd[2].B*0.109429385666)+of.vadd[2].B)+sl.min.vadd[2].B)} {0.}
(assert (= (+ (+ (* sc_85 0.109429385666) of_85) slbot_85) 0.))
; 
; =  {(((sc.vadd[2].B*3.53553390593)+of.vadd[2].B)+sl.max.vadd[2].B)} {3300.}
(assert (= (+ (+ (* sc_85 3.53553390593) of_85) sltop_85) 3300.))
(declare-fun slbot_86 () Real)
(declare-fun sltop_86 () Real)
; 
; =  {(((sc.vadd[2].OUT*0.109429385666)+of.vadd[2].OUT)+sl.min.vadd[2].OUT)} {-1650.}
(assert (= (+ (+ (* sc_86 0.109429385666) of_86) slbot_86) -1650.))
; 
; =  {(((sc.vadd[2].OUT*3.53553390593)+of.vadd[2].OUT)+sl.max.vadd[2].OUT)} {1650.}
(assert (= (+ (+ (* sc_86 3.53553390593) of_86) sltop_86) 1650.))
(declare-fun slbot_87 () Real)
(declare-fun sltop_87 () Real)
; 
; =  {(((sc.vadd[2].OUT2*0.)+of.vadd[2].OUT2)+sl.min.vadd[2].OUT2)} {0.}
(assert (= (+ (+ (* sc_87 0.) of_87) slbot_87) 0.))
; 
; =  {(((sc.vadd[2].OUT2*0.0156)+of.vadd[2].OUT2)+sl.max.vadd[2].OUT2)} {3300.}
(assert (= (+ (+ (* sc_87 0.0156) of_87) sltop_87) 3300.))
(declare-fun sc_88 () Real)
(assert (> sc_88 1e-08))
(declare-fun of_88 () Real)
(declare-fun sc_89 () Real)
(assert (> sc_89 1e-08))
(declare-fun of_89 () Real)
(declare-fun sc_90 () Real)
(assert (> sc_90 1e-08))
(declare-fun of_90 () Real)
(declare-fun sc_91 () Real)
(assert (> sc_91 1e-08))
(declare-fun of_91 () Real)
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
(assert (= of_89 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_90 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_92 0.))
; 
; =  {sc.vadd[5].A} {(1.*sc.vadd[5].B)}
(assert (= sc_91 (* 1. sc_92)))
; 
; =  {sc.vadd[5].A} {(1.*sc.vadd[5].C)} {(1.*sc.vadd[5].D)}
(assert (and (= sc_91 (* 1. sc_90)) (= sc_91 (* 1. sc_89))))
; no offset
(assert (= (- (+ of_91 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[5].OUT} {(sc.vadd[5].A*1.)}
(assert (= sc_93 (* sc_91 1.)))
; 
; =  {of.vadd[5].OUT} {0.}
(assert (= of_93 0.))
; no scale
(assert (= sc_89 1.))
; no scale
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_89 0.))
; no offset
(assert (= of_94 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_90 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_92 0.))
; 
; =  {sc.vadd[5].A} {(1.*sc.vadd[5].B)}
(assert (= sc_91 (* 1. sc_92)))
; 
; =  {sc.vadd[5].A} {(1.*sc.vadd[5].C)} {(1.*sc.vadd[5].D*sc.vadd[5].OUT2)}
(assert (and (= sc_91 (* 1. sc_90)) (= sc_91 (* (* 1. sc_89) sc_94))))
; no offset
(assert (= (- (+ of_91 0.) (+ 0. 0.)) 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[5].OUT2} {(sc.vadd[5].A*1.)}
(assert (= sc_94 (* sc_91 1.)))
; no offset
(assert (= of_94 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.vadd[5].OUT2_0} {(sc.vadd[5].A*1.)}
(assert (= sc_88 (* sc_91 1.)))
; 
; =  {of.vadd[5].OUT2_0} {0.}
(assert (= of_88 0.))
; 
; >=  {((sc.vadd[5].OUT2_0*0.)+of.vadd[5].OUT2_0)} {3300.}
(assert (<= (+ (* sc_88 0.) of_88) 3300.))
; 
; <=  {((sc.vadd[5].OUT2_0*0.)+of.vadd[5].OUT2_0)} {0.}
(assert (>= (+ (* sc_88 0.) of_88) 0.))
; 
; >=  {((sc.vadd[5].D*4e-06)+of.vadd[5].D)} {3300.}
(assert (<= (+ (* sc_89 4e-06) of_89) 3300.))
; 
; <=  {((sc.vadd[5].D*4e-06)+of.vadd[5].D)} {0.}
(assert (>= (+ (* sc_89 4e-06) of_89) 0.))
; 
; >=  {((sc.vadd[5].C*0.)+of.vadd[5].C)} {3300.}
(assert (<= (+ (* sc_90 0.) of_90) 3300.))
; 
; <=  {((sc.vadd[5].C*0.)+of.vadd[5].C)} {0.}
(assert (>= (+ (* sc_90 0.) of_90) 0.))
; 
; >=  {((sc.vadd[5].A*0.)+of.vadd[5].A)} {3300.}
(assert (<= (+ (* sc_91 0.) of_91) 3300.))
; 
; <=  {((sc.vadd[5].A*0.)+of.vadd[5].A)} {0.}
(assert (>= (+ (* sc_91 0.) of_91) 0.))
(declare-fun slbot_94 () Real)
(declare-fun sltop_94 () Real)
; 
; =  {(((sc.vadd[5].OUT2*0.)+of.vadd[5].OUT2)+sl.min.vadd[5].OUT2)} {0.}
(assert (= (+ (+ (* sc_94 0.) of_94) slbot_94) 0.))
; 
; =  {(((sc.vadd[5].OUT2*0.15625)+of.vadd[5].OUT2)+sl.max.vadd[5].OUT2)} {3300.}
(assert (= (+ (+ (* sc_94 0.15625) of_94) sltop_94) 3300.))
(declare-fun slbot_92 () Real)
(declare-fun sltop_92 () Real)
; 
; =  {(((sc.vadd[5].B*0.0307207562032)+of.vadd[5].B)+sl.min.vadd[5].B)} {0.}
(assert (= (+ (+ (* sc_92 0.0307207562032) of_92) slbot_92) 0.))
; 
; =  {(((sc.vadd[5].B*0.1248)+of.vadd[5].B)+sl.max.vadd[5].B)} {3300.}
(assert (= (+ (+ (* sc_92 0.1248) of_92) sltop_92) 3300.))
(declare-fun slbot_93 () Real)
(declare-fun sltop_93 () Real)
; 
; =  {(((sc.vadd[5].OUT*0.0307207562032)+of.vadd[5].OUT)+sl.min.vadd[5].OUT)} {-1650.}
(assert (= (+ (+ (* sc_93 0.0307207562032) of_93) slbot_93) -1650.))
; 
; =  {(((sc.vadd[5].OUT*0.1248)+of.vadd[5].OUT)+sl.max.vadd[5].OUT)} {1650.}
(assert (= (+ (+ (* sc_93 0.1248) of_93) sltop_93) 1650.))
(declare-fun slbot_94 () Real)
(declare-fun sltop_94 () Real)
; 
; =  {(((sc.vadd[5].OUT2*0.)+of.vadd[5].OUT2)+sl.min.vadd[5].OUT2)} {0.}
(assert (= (+ (+ (* sc_94 0.) of_94) slbot_94) 0.))
; 
; =  {(((sc.vadd[5].OUT2*0.15625)+of.vadd[5].OUT2)+sl.max.vadd[5].OUT2)} {3300.}
(assert (= (+ (+ (* sc_94 0.15625) of_94) sltop_94) 3300.))
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
(declare-fun sc_100 () Real)
(assert (> sc_100 1e-08))
(declare-fun of_100 () Real)
; no offset
(assert (= of_96 0.))
; no offset
(assert (= of_97 0.))
; no scale
(assert (= (/ sc_96 sc_97) 1.))
; no scale
(assert (= sc_95 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_95 0.))
; no offset
(assert (= of_96 0.))
; no offset
(assert (= of_97 0.))
; no scale
(assert (= (/ sc_96 sc_97) 1.))
; no scale
(assert (= sc_95 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_95 0.))
; 
; =  {1.} {1.}
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_98 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.ihill[7].STIM} {(sc.ihill[7].Vmax*(1./1.))}
(assert (= sc_99 (* sc_98 (/ 1. 1.))))
; 
; =  {of.ihill[7].STIM} {0.}
(assert (= of_99 0.))
; no scale
(assert (= sc_97 1.))
; no scale
(assert (= sc_95 1.))
; no offset
(assert (= of_97 0.))
; no offset
(assert (= of_95 0.))
; no scale
(assert (= sc_97 1.))
; no scale
(assert (= sc_95 1.))
; no offset
(assert (= of_97 0.))
; no offset
(assert (= of_95 0.))
; no scale
(assert (= sc_96 1.))
; no scale
(assert (= sc_95 1.))
; no offset
(assert (= of_96 0.))
; no offset
(assert (= of_95 0.))
; 
; =  {1.} {1.}
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_98 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.ihill[7].REP} {(sc.ihill[7].Vmax*(1./1.))}
(assert (= sc_100 (* sc_98 (/ 1. 1.))))
; 
; =  {of.ihill[7].REP} {0.}
(assert (= of_100 0.))
; 
; >=  {((sc.ihill[7].n*2.5)+of.ihill[7].n)} {5.}
(assert (<= (+ (* sc_95 2.5) of_95) 5.))
; 
; <=  {((sc.ihill[7].n*2.5)+of.ihill[7].n)} {1.}
(assert (>= (+ (* sc_95 2.5) of_95) 1.))
(declare-fun slbot_96 () Real)
(declare-fun sltop_96 () Real)
; 
; =  {(((sc.ihill[7].S*0.5)+of.ihill[7].S)+sl.min.ihill[7].S)} {1.}
(assert (= (+ (+ (* sc_96 0.5) of_96) slbot_96) 1.))
; 
; =  {(((sc.ihill[7].S*1.)+of.ihill[7].S)+sl.max.ihill[7].S)} {10.}
(assert (= (+ (+ (* sc_96 1.) of_96) sltop_96) 10.))
(declare-fun slbot_100 () Real)
(declare-fun sltop_100 () Real)
; 
; =  {(((sc.ihill[7].REP*0.0273573464165)+of.ihill[7].REP)+sl.min.ihill[7].REP)} {5e-10}
(assert (= (+ (+ (* sc_100 0.0273573464165) of_100) slbot_100) 5e-10))
; 
; =  {(((sc.ihill[7].REP*0.883883476483)+of.ihill[7].REP)+sl.max.ihill[7].REP)} {500000.}
(assert (= (+ (+ (* sc_100 0.883883476483) of_100) sltop_100) 500000.))
(declare-fun slbot_97 () Real)
(declare-fun sltop_97 () Real)
; 
; =  {(((sc.ihill[7].Km*0.)+of.ihill[7].Km)+sl.min.ihill[7].Km)} {1.}
(assert (= (+ (+ (* sc_97 0.) of_97) slbot_97) 1.))
; 
; =  {(((sc.ihill[7].Km*0.15625)+of.ihill[7].Km)+sl.max.ihill[7].Km)} {10.}
(assert (= (+ (+ (* sc_97 0.15625) of_97) sltop_97) 10.))
(declare-fun slbot_98 () Real)
(declare-fun sltop_98 () Real)
; 
; =  {(((sc.ihill[7].Vmax*0.)+of.ihill[7].Vmax)+sl.min.ihill[7].Vmax)} {0.0001}
(assert (= (+ (+ (* sc_98 0.) of_98) slbot_98) 0.0001))
; 
; =  {(((sc.ihill[7].Vmax*16.1908616201)+of.ihill[7].Vmax)+sl.max.ihill[7].Vmax)} {10.}
(assert (= (+ (+ (* sc_98 16.1908616201) of_98) sltop_98) 10.))
(declare-fun slbot_99 () Real)
(declare-fun sltop_99 () Real)
; 
; =  {(((sc.ihill[7].STIM*1.)+of.ihill[7].STIM)+sl.min.ihill[7].STIM)} {9.999900001e-15}
(assert (= (+ (+ (* sc_99 1.) of_99) slbot_99) 9.999900001e-15))
; 
; =  {(((sc.ihill[7].STIM*5.65685424949)+of.ihill[7].STIM)+sl.max.ihill[7].STIM)} {999990.0001}
(assert (= (+ (+ (* sc_99 5.65685424949) of_99) sltop_99) 999990.0001))
(declare-fun slbot_100 () Real)
(declare-fun sltop_100 () Real)
; 
; =  {(((sc.ihill[7].REP*0.0273573464165)+of.ihill[7].REP)+sl.min.ihill[7].REP)} {5e-10}
(assert (= (+ (+ (* sc_100 0.0273573464165) of_100) slbot_100) 5e-10))
; 
; =  {(((sc.ihill[7].REP*0.883883476483)+of.ihill[7].REP)+sl.max.ihill[7].REP)} {500000.}
(assert (= (+ (+ (* sc_100 0.883883476483) of_100) sltop_100) 500000.))
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
(assert (= of_102 0.))
; no offset
(assert (= of_103 0.))
; no scale
(assert (= (/ sc_102 sc_103) 1.))
; no scale
(assert (= sc_101 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_101 0.))
; no offset
(assert (= of_102 0.))
; no offset
(assert (= of_103 0.))
; no scale
(assert (= (/ sc_102 sc_103) 1.))
; no scale
(assert (= sc_101 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_101 0.))
; 
; =  {1.} {1.}
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_104 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.ihill[0].STIM} {(sc.ihill[0].Vmax*(1./1.))}
(assert (= sc_105 (* sc_104 (/ 1. 1.))))
; 
; =  {of.ihill[0].STIM} {0.}
(assert (= of_105 0.))
; no scale
(assert (= sc_103 1.))
; no scale
(assert (= sc_101 1.))
; no offset
(assert (= of_103 0.))
; no offset
(assert (= of_101 0.))
; no scale
(assert (= sc_103 1.))
; no scale
(assert (= sc_101 1.))
; no offset
(assert (= of_103 0.))
; no offset
(assert (= of_101 0.))
; no scale
(assert (= sc_102 1.))
; no scale
(assert (= sc_101 1.))
; no offset
(assert (= of_102 0.))
; no offset
(assert (= of_101 0.))
; 
; =  {1.} {1.}
(assert (= 1. 1.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_104 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.ihill[0].REP} {(sc.ihill[0].Vmax*(1./1.))}
(assert (= sc_106 (* sc_104 (/ 1. 1.))))
; 
; =  {of.ihill[0].REP} {0.}
(assert (= of_106 0.))
; 
; >=  {((sc.ihill[0].n*1.)+of.ihill[0].n)} {5.}
(assert (<= (+ (* sc_101 1.) of_101) 5.))
; 
; <=  {((sc.ihill[0].n*1.)+of.ihill[0].n)} {1.}
(assert (>= (+ (* sc_101 1.) of_101) 1.))
(declare-fun slbot_102 () Real)
(declare-fun sltop_102 () Real)
; 
; =  {(((sc.ihill[0].S*0.)+of.ihill[0].S)+sl.min.ihill[0].S)} {1.}
(assert (= (+ (+ (* sc_102 0.) of_102) slbot_102) 1.))
; 
; =  {(((sc.ihill[0].S*0.0156)+of.ihill[0].S)+sl.max.ihill[0].S)} {10.}
(assert (= (+ (+ (* sc_102 0.0156) of_102) sltop_102) 10.))
(declare-fun slbot_106 () Real)
(declare-fun sltop_106 () Real)
; 
; =  {(((sc.ihill[0].REP*0.00768018905081)+of.ihill[0].REP)+sl.min.ihill[0].REP)} {5e-10}
(assert (= (+ (+ (* sc_106 0.00768018905081) of_106) slbot_106) 5e-10))
; 
; =  {(((sc.ihill[0].REP*0.0312)+of.ihill[0].REP)+sl.max.ihill[0].REP)} {500000.}
(assert (= (+ (+ (* sc_106 0.0312) of_106) sltop_106) 500000.))
(declare-fun slbot_103 () Real)
(declare-fun sltop_103 () Real)
; 
; =  {(((sc.ihill[0].Km*0.5)+of.ihill[0].Km)+sl.min.ihill[0].Km)} {1.}
(assert (= (+ (+ (* sc_103 0.5) of_103) slbot_103) 1.))
; 
; =  {(((sc.ihill[0].Km*1.)+of.ihill[0].Km)+sl.max.ihill[0].Km)} {10.}
(assert (= (+ (+ (* sc_103 1.) of_103) sltop_103) 10.))
; 
; >=  {((sc.ihill[0].Vmax*0.0156)+of.ihill[0].Vmax)} {10.}
(assert (<= (+ (* sc_104 0.0156) of_104) 10.))
; 
; <=  {((sc.ihill[0].Vmax*0.0156)+of.ihill[0].Vmax)} {0.0001}
(assert (>= (+ (* sc_104 0.0156) of_104) 0.0001))
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
; =  {sc.vtoi[8].Y} {((1./sc.vtoi[8].K)*sc.vtoi[8].X)}
(assert (= sc_109 (* (/ 1. sc_108) sc_107)))
; 
; =  {of.vtoi[8].Y} {0.}
(assert (= of_109 0.))
(declare-fun slbot_107 () Real)
(declare-fun sltop_107 () Real)
; 
; =  {(((sc.vtoi[8].X*0.0276213586401)+of.vtoi[8].X)+sl.min.vtoi[8].X)} {1.}
(assert (= (+ (+ (* sc_107 0.0276213586401) of_107) slbot_107) 1.))
; 
; =  {(((sc.vtoi[8].X*0.15625)+of.vtoi[8].X)+sl.max.vtoi[8].X)} {3300.}
(assert (= (+ (+ (* sc_107 0.15625) of_107) sltop_107) 3300.))
(declare-fun slbot_109 () Real)
(declare-fun sltop_109 () Real)
; 
; =  {(((sc.vtoi[8].Y*0.)+of.vtoi[8].Y)+sl.min.vtoi[8].Y)} {0.00030303030303}
(assert (= (+ (+ (* sc_109 0.) of_109) slbot_109) 0.00030303030303))
; 
; =  {(((sc.vtoi[8].Y*16.1908616201)+of.vtoi[8].Y)+sl.max.vtoi[8].Y)} {3300.}
(assert (= (+ (+ (* sc_109 16.1908616201) of_109) sltop_109) 3300.))
(declare-fun slbot_108 () Real)
(declare-fun sltop_108 () Real)
; 
; =  {(((sc.vtoi[8].K*0.)+of.vtoi[8].K)+sl.min.vtoi[8].K)} {1.}
(assert (= (+ (+ (* sc_108 0.) of_108) slbot_108) 1.))
; 
; =  {(((sc.vtoi[8].K*0.00965050555471)+of.vtoi[8].K)+sl.max.vtoi[8].K)} {3300.}
(assert (= (+ (+ (* sc_108 0.00965050555471) of_108) sltop_108) 3300.))
(declare-fun slbot_109 () Real)
(declare-fun sltop_109 () Real)
; 
; =  {(((sc.vtoi[8].Y*0.)+of.vtoi[8].Y)+sl.min.vtoi[8].Y)} {0.00030303030303}
(assert (= (+ (+ (* sc_109 0.) of_109) slbot_109) 0.00030303030303))
; 
; =  {(((sc.vtoi[8].Y*16.1908616201)+of.vtoi[8].Y)+sl.max.vtoi[8].Y)} {3300.}
(assert (= (+ (+ (* sc_109 16.1908616201) of_109) sltop_109) 3300.))
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
; =  {sc.vtoi[15].Y} {((1./sc.vtoi[15].K)*sc.vtoi[15].X)}
(assert (= sc_112 (* (/ 1. sc_111) sc_110)))
; 
; =  {of.vtoi[15].Y} {0.}
(assert (= of_112 0.))
(declare-fun slbot_110 () Real)
(declare-fun sltop_110 () Real)
; 
; =  {(((sc.vtoi[15].X*0.)+of.vtoi[15].X)+sl.min.vtoi[15].X)} {1.}
(assert (= (+ (+ (* sc_110 0.) of_110) slbot_110) 1.))
; 
; =  {(((sc.vtoi[15].X*0.15625)+of.vtoi[15].X)+sl.max.vtoi[15].X)} {3300.}
(assert (= (+ (+ (* sc_110 0.15625) of_110) sltop_110) 3300.))
; 
; >=  {((sc.vtoi[15].K*1.)+of.vtoi[15].K)} {3300.}
(assert (<= (+ (* sc_111 1.) of_111) 3300.))
; 
; <=  {((sc.vtoi[15].K*1.)+of.vtoi[15].K)} {1.}
(assert (>= (+ (* sc_111 1.) of_111) 1.))
(declare-fun slbot_112 () Real)
(declare-fun sltop_112 () Real)
; 
; =  {(((sc.vtoi[15].Y*0.)+of.vtoi[15].Y)+sl.min.vtoi[15].Y)} {0.00030303030303}
(assert (= (+ (+ (* sc_112 0.) of_112) slbot_112) 0.00030303030303))
; 
; =  {(((sc.vtoi[15].Y*0.15625)+of.vtoi[15].Y)+sl.max.vtoi[15].Y)} {3300.}
(assert (= (+ (+ (* sc_112 0.15625) of_112) sltop_112) 3300.))
(declare-fun sc_113 () Real)
(assert (> sc_113 1e-08))
(declare-fun of_113 () Real)
(declare-fun sc_114 () Real)
(assert (> sc_114 1e-08))
(declare-fun of_114 () Real)
(declare-fun sc_115 () Real)
(assert (> sc_115 1e-08))
(declare-fun of_115 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_114 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_113 0.))
; 
; =  {sc.vtoi[6].Y} {((1./sc.vtoi[6].K)*sc.vtoi[6].X)}
(assert (= sc_115 (* (/ 1. sc_114) sc_113)))
; 
; =  {of.vtoi[6].Y} {0.}
(assert (= of_115 0.))
(declare-fun slbot_113 () Real)
(declare-fun sltop_113 () Real)
; 
; =  {(((sc.vtoi[6].X*0.5)+of.vtoi[6].X)+sl.min.vtoi[6].X)} {1.}
(assert (= (+ (+ (* sc_113 0.5) of_113) slbot_113) 1.))
; 
; =  {(((sc.vtoi[6].X*1.)+of.vtoi[6].X)+sl.max.vtoi[6].X)} {3300.}
(assert (= (+ (+ (* sc_113 1.) of_113) sltop_113) 3300.))
(declare-fun slbot_115 () Real)
(declare-fun sltop_115 () Real)
; 
; =  {(((sc.vtoi[6].Y*-1.)+of.vtoi[6].Y)+sl.min.vtoi[6].Y)} {0.00030303030303}
(assert (= (+ (+ (* sc_115 -1.) of_115) slbot_115) 0.00030303030303))
; 
; =  {(((sc.vtoi[6].Y*-0.5)+of.vtoi[6].Y)+sl.max.vtoi[6].Y)} {3300.}
(assert (= (+ (+ (* sc_115 -0.5) of_115) sltop_115) 3300.))
; 
; >=  {((sc.vtoi[6].K*-1.)+of.vtoi[6].K)} {3300.}
(assert (<= (+ (* sc_114 -1.) of_114) 3300.))
; 
; <=  {((sc.vtoi[6].K*-1.)+of.vtoi[6].K)} {1.}
(assert (>= (+ (* sc_114 -1.) of_114) 1.))
(declare-fun sc_116 () Real)
(assert (> sc_116 1e-08))
(declare-fun of_116 () Real)
(declare-fun sc_117 () Real)
(assert (> sc_117 1e-08))
(declare-fun of_117 () Real)
(declare-fun sc_118 () Real)
(assert (> sc_118 1e-08))
(declare-fun of_118 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_117 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_116 0.))
; 
; =  {sc.vtoi[14].Y} {((1./sc.vtoi[14].K)*sc.vtoi[14].X)}
(assert (= sc_118 (* (/ 1. sc_117) sc_116)))
; 
; =  {of.vtoi[14].Y} {0.}
(assert (= of_118 0.))
; 
; >=  {((sc.vtoi[14].X*1.)+of.vtoi[14].X)} {3300.}
(assert (<= (+ (* sc_116 1.) of_116) 3300.))
; 
; <=  {((sc.vtoi[14].X*1.)+of.vtoi[14].X)} {1.}
(assert (>= (+ (* sc_116 1.) of_116) 1.))
(declare-fun slbot_118 () Real)
(declare-fun sltop_118 () Real)
; 
; =  {(((sc.vtoi[14].Y*1.)+of.vtoi[14].Y)+sl.min.vtoi[14].Y)} {0.00030303030303}
(assert (= (+ (+ (* sc_118 1.) of_118) slbot_118) 0.00030303030303))
; 
; =  {(((sc.vtoi[14].Y*5.65685424949)+of.vtoi[14].Y)+sl.max.vtoi[14].Y)} {3300.}
(assert (= (+ (+ (* sc_118 5.65685424949) of_118) sltop_118) 3300.))
(declare-fun slbot_117 () Real)
(declare-fun sltop_117 () Real)
; 
; =  {(((sc.vtoi[14].K*0.176776695297)+of.vtoi[14].K)+sl.min.vtoi[14].K)} {1.}
(assert (= (+ (+ (* sc_117 0.176776695297) of_117) slbot_117) 1.))
; 
; =  {(((sc.vtoi[14].K*1.)+of.vtoi[14].K)+sl.max.vtoi[14].K)} {3300.}
(assert (= (+ (+ (* sc_117 1.) of_117) sltop_117) 3300.))
(declare-fun slbot_118 () Real)
(declare-fun sltop_118 () Real)
; 
; =  {(((sc.vtoi[14].Y*1.)+of.vtoi[14].Y)+sl.min.vtoi[14].Y)} {0.00030303030303}
(assert (= (+ (+ (* sc_118 1.) of_118) slbot_118) 0.00030303030303))
; 
; =  {(((sc.vtoi[14].Y*5.65685424949)+of.vtoi[14].Y)+sl.max.vtoi[14].Y)} {3300.}
(assert (= (+ (+ (* sc_118 5.65685424949) of_118) sltop_118) 3300.))
(declare-fun sc_119 () Real)
(assert (> sc_119 1e-08))
(declare-fun of_119 () Real)
(declare-fun sc_120 () Real)
(assert (> sc_120 1e-08))
(declare-fun of_120 () Real)
(declare-fun sc_121 () Real)
(assert (> sc_121 1e-08))
(declare-fun of_121 () Real)
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_120 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_119 0.))
; 
; =  {sc.vtoi[16].Y} {((1./sc.vtoi[16].K)*sc.vtoi[16].X)}
(assert (= sc_121 (* (/ 1. sc_120) sc_119)))
; 
; =  {of.vtoi[16].Y} {0.}
(assert (= of_121 0.))
(declare-fun slbot_119 () Real)
(declare-fun sltop_119 () Real)
; 
; =  {(((sc.vtoi[16].X*0.)+of.vtoi[16].X)+sl.min.vtoi[16].X)} {1.}
(assert (= (+ (+ (* sc_119 0.) of_119) slbot_119) 1.))
; 
; =  {(((sc.vtoi[16].X*0.15625)+of.vtoi[16].X)+sl.max.vtoi[16].X)} {3300.}
(assert (= (+ (+ (* sc_119 0.15625) of_119) sltop_119) 3300.))
; 
; >=  {((sc.vtoi[16].K*1.)+of.vtoi[16].K)} {3300.}
(assert (<= (+ (* sc_120 1.) of_120) 3300.))
; 
; <=  {((sc.vtoi[16].K*1.)+of.vtoi[16].K)} {1.}
(assert (>= (+ (* sc_120 1.) of_120) 1.))
(declare-fun slbot_121 () Real)
(declare-fun sltop_121 () Real)
; 
; =  {(((sc.vtoi[16].Y*0.)+of.vtoi[16].Y)+sl.min.vtoi[16].Y)} {0.00030303030303}
(assert (= (+ (+ (* sc_121 0.) of_121) slbot_121) 0.00030303030303))
; 
; =  {(((sc.vtoi[16].Y*0.15625)+of.vtoi[16].Y)+sl.max.vtoi[16].Y)} {3300.}
(assert (= (+ (+ (* sc_121 0.15625) of_121) sltop_121) 3300.))
(declare-fun sc_122 () Real)
(assert (> sc_122 1e-08))
(declare-fun of_122 () Real)
(declare-fun sc_123 () Real)
(assert (> sc_123 1e-08))
(declare-fun of_123 () Real)
; 
; =  {sc.input.V[2].O} {sc.input.V[2].X}
(assert (= sc_123 sc_122))
; 
; =  {of.input.V[2].O} {of.input.V[2].X}
(assert (= of_123 of_122))
; 
; >=  {((sc.input.V[2].X*2.)+of.input.V[2].X)} {3300.}
(assert (<= (+ (* sc_122 2.) of_122) 3300.))
; 
; <=  {((sc.input.V[2].X*2.)+of.input.V[2].X)} {0.}
(assert (>= (+ (* sc_122 2.) of_122) 0.))
; 
; >=  {((sc.input.V[2].O*2.)+of.input.V[2].O)} {3300.}
(assert (<= (+ (* sc_123 2.) of_123) 3300.))
; 
; <=  {((sc.input.V[2].O*2.)+of.input.V[2].O)} {0.}
(assert (>= (+ (* sc_123 2.) of_123) 0.))
(declare-fun sc_124 () Real)
(assert (> sc_124 1e-08))
(declare-fun of_124 () Real)
(declare-fun sc_125 () Real)
(assert (> sc_125 1e-08))
(declare-fun of_125 () Real)
; 
; =  {sc.input.V[20].O} {sc.input.V[20].X}
(assert (= sc_125 sc_124))
; 
; =  {of.input.V[20].O} {of.input.V[20].X}
(assert (= of_125 of_124))
; 
; >=  {((sc.input.V[20].X*1.)+of.input.V[20].X)} {3300.}
(assert (<= (+ (* sc_124 1.) of_124) 3300.))
; 
; <=  {((sc.input.V[20].X*1.)+of.input.V[20].X)} {0.}
(assert (>= (+ (* sc_124 1.) of_124) 0.))
; 
; >=  {((sc.input.V[20].O*1.)+of.input.V[20].O)} {3300.}
(assert (<= (+ (* sc_125 1.) of_125) 3300.))
; 
; <=  {((sc.input.V[20].O*1.)+of.input.V[20].O)} {0.}
(assert (>= (+ (* sc_125 1.) of_125) 0.))
(declare-fun sc_126 () Real)
(assert (> sc_126 1e-08))
(declare-fun of_126 () Real)
(declare-fun sc_127 () Real)
(assert (> sc_127 1e-08))
(declare-fun of_127 () Real)
; 
; =  {sc.input.V[29].O} {sc.input.V[29].X}
(assert (= sc_127 sc_126))
; 
; =  {of.input.V[29].O} {of.input.V[29].X}
(assert (= of_127 of_126))
; 
; >=  {((sc.input.V[29].X*1.)+of.input.V[29].X)} {3300.}
(assert (<= (+ (* sc_126 1.) of_126) 3300.))
; 
; <=  {((sc.input.V[29].X*1.)+of.input.V[29].X)} {0.}
(assert (>= (+ (* sc_126 1.) of_126) 0.))
; 
; >=  {((sc.input.V[29].O*1.)+of.input.V[29].O)} {3300.}
(assert (<= (+ (* sc_127 1.) of_127) 3300.))
; 
; <=  {((sc.input.V[29].O*1.)+of.input.V[29].O)} {0.}
(assert (>= (+ (* sc_127 1.) of_127) 0.))
(declare-fun sc_128 () Real)
(assert (> sc_128 1e-08))
(declare-fun of_128 () Real)
(declare-fun sc_129 () Real)
(assert (> sc_129 1e-08))
(declare-fun of_129 () Real)
; 
; =  {sc.input.V[8].O} {sc.input.V[8].X}
(assert (= sc_129 sc_128))
; 
; =  {of.input.V[8].O} {of.input.V[8].X}
(assert (= of_129 of_128))
; 
; >=  {((sc.input.V[8].X*0.)+of.input.V[8].X)} {3300.}
(assert (<= (+ (* sc_128 0.) of_128) 3300.))
; 
; <=  {((sc.input.V[8].X*0.)+of.input.V[8].X)} {0.}
(assert (>= (+ (* sc_128 0.) of_128) 0.))
; 
; >=  {((sc.input.V[8].O*0.)+of.input.V[8].O)} {3300.}
(assert (<= (+ (* sc_129 0.) of_129) 3300.))
; 
; <=  {((sc.input.V[8].O*0.)+of.input.V[8].O)} {0.}
(assert (>= (+ (* sc_129 0.) of_129) 0.))
(declare-fun sc_130 () Real)
(assert (> sc_130 1e-08))
(declare-fun of_130 () Real)
(declare-fun sc_131 () Real)
(assert (> sc_131 1e-08))
(declare-fun of_131 () Real)
; 
; =  {sc.input.V[7].O} {sc.input.V[7].X}
(assert (= sc_131 sc_130))
; 
; =  {of.input.V[7].O} {of.input.V[7].X}
(assert (= of_131 of_130))
; 
; >=  {((sc.input.V[7].X*2.5)+of.input.V[7].X)} {3300.}
(assert (<= (+ (* sc_130 2.5) of_130) 3300.))
; 
; <=  {((sc.input.V[7].X*2.5)+of.input.V[7].X)} {0.}
(assert (>= (+ (* sc_130 2.5) of_130) 0.))
; 
; >=  {((sc.input.V[7].O*2.5)+of.input.V[7].O)} {3300.}
(assert (<= (+ (* sc_131 2.5) of_131) 3300.))
; 
; <=  {((sc.input.V[7].O*2.5)+of.input.V[7].O)} {0.}
(assert (>= (+ (* sc_131 2.5) of_131) 0.))
(declare-fun sc_132 () Real)
(assert (> sc_132 1e-08))
(declare-fun of_132 () Real)
(declare-fun sc_133 () Real)
(assert (> sc_133 1e-08))
(declare-fun of_133 () Real)
; 
; =  {sc.input.V[13].O} {sc.input.V[13].X}
(assert (= sc_133 sc_132))
; 
; =  {of.input.V[13].O} {of.input.V[13].X}
(assert (= of_133 of_132))
; 
; >=  {((sc.input.V[13].X*0.)+of.input.V[13].X)} {3300.}
(assert (<= (+ (* sc_132 0.) of_132) 3300.))
; 
; <=  {((sc.input.V[13].X*0.)+of.input.V[13].X)} {0.}
(assert (>= (+ (* sc_132 0.) of_132) 0.))
; 
; >=  {((sc.input.V[13].O*0.)+of.input.V[13].O)} {3300.}
(assert (<= (+ (* sc_133 0.) of_133) 3300.))
; 
; <=  {((sc.input.V[13].O*0.)+of.input.V[13].O)} {0.}
(assert (>= (+ (* sc_133 0.) of_133) 0.))
(declare-fun sc_134 () Real)
(assert (> sc_134 1e-08))
(declare-fun of_134 () Real)
(declare-fun sc_135 () Real)
(assert (> sc_135 1e-08))
(declare-fun of_135 () Real)
; 
; =  {sc.input.V[12].O} {sc.input.V[12].X}
(assert (= sc_135 sc_134))
; 
; =  {of.input.V[12].O} {of.input.V[12].X}
(assert (= of_135 of_134))
; 
; >=  {((sc.input.V[12].X*0.)+of.input.V[12].X)} {3300.}
(assert (<= (+ (* sc_134 0.) of_134) 3300.))
; 
; <=  {((sc.input.V[12].X*0.)+of.input.V[12].X)} {0.}
(assert (>= (+ (* sc_134 0.) of_134) 0.))
; 
; >=  {((sc.input.V[12].O*0.)+of.input.V[12].O)} {3300.}
(assert (<= (+ (* sc_135 0.) of_135) 3300.))
; 
; <=  {((sc.input.V[12].O*0.)+of.input.V[12].O)} {0.}
(assert (>= (+ (* sc_135 0.) of_135) 0.))
(declare-fun sc_136 () Real)
(assert (> sc_136 1e-08))
(declare-fun of_136 () Real)
(declare-fun sc_137 () Real)
(assert (> sc_137 1e-08))
(declare-fun of_137 () Real)
; 
; =  {sc.input.V[9].O} {sc.input.V[9].X}
(assert (= sc_137 sc_136))
; 
; =  {of.input.V[9].O} {of.input.V[9].X}
(assert (= of_137 of_136))
; 
; >=  {((sc.input.V[9].X*0.)+of.input.V[9].X)} {3300.}
(assert (<= (+ (* sc_136 0.) of_136) 3300.))
; 
; <=  {((sc.input.V[9].X*0.)+of.input.V[9].X)} {0.}
(assert (>= (+ (* sc_136 0.) of_136) 0.))
; 
; >=  {((sc.input.V[9].O*0.)+of.input.V[9].O)} {3300.}
(assert (<= (+ (* sc_137 0.) of_137) 3300.))
; 
; <=  {((sc.input.V[9].O*0.)+of.input.V[9].O)} {0.}
(assert (>= (+ (* sc_137 0.) of_137) 0.))
(declare-fun sc_138 () Real)
(assert (> sc_138 1e-08))
(declare-fun of_138 () Real)
(declare-fun sc_139 () Real)
(assert (> sc_139 1e-08))
(declare-fun of_139 () Real)
; 
; =  {sc.input.V[0].O} {sc.input.V[0].X}
(assert (= sc_139 sc_138))
; 
; =  {of.input.V[0].O} {of.input.V[0].X}
(assert (= of_139 of_138))
(declare-fun slbot_138 () Real)
(declare-fun sltop_138 () Real)
; 
; =  {(((sc.input.V[0].X*0.5)+of.input.V[0].X)+sl.min.input.V[0].X)} {0.}
(assert (= (+ (+ (* sc_138 0.5) of_138) slbot_138) 0.))
; 
; =  {(((sc.input.V[0].X*1.)+of.input.V[0].X)+sl.max.input.V[0].X)} {3300.}
(assert (= (+ (+ (* sc_138 1.) of_138) sltop_138) 3300.))
(declare-fun slbot_139 () Real)
(declare-fun sltop_139 () Real)
; 
; =  {(((sc.input.V[0].O*0.5)+of.input.V[0].O)+sl.min.input.V[0].O)} {0.}
(assert (= (+ (+ (* sc_139 0.5) of_139) slbot_139) 0.))
; 
; =  {(((sc.input.V[0].O*1.)+of.input.V[0].O)+sl.max.input.V[0].O)} {3300.}
(assert (= (+ (+ (* sc_139 1.) of_139) sltop_139) 3300.))
(declare-fun sc_140 () Real)
(assert (> sc_140 1e-08))
(declare-fun of_140 () Real)
(declare-fun sc_141 () Real)
(assert (> sc_141 1e-08))
(declare-fun of_141 () Real)
; 
; =  {sc.input.V[11].O} {sc.input.V[11].X}
(assert (= sc_141 sc_140))
; 
; =  {of.input.V[11].O} {of.input.V[11].X}
(assert (= of_141 of_140))
; 
; >=  {((sc.input.V[11].X*0.)+of.input.V[11].X)} {3300.}
(assert (<= (+ (* sc_140 0.) of_140) 3300.))
; 
; <=  {((sc.input.V[11].X*0.)+of.input.V[11].X)} {0.}
(assert (>= (+ (* sc_140 0.) of_140) 0.))
; 
; >=  {((sc.input.V[11].O*0.)+of.input.V[11].O)} {3300.}
(assert (<= (+ (* sc_141 0.) of_141) 3300.))
; 
; <=  {((sc.input.V[11].O*0.)+of.input.V[11].O)} {0.}
(assert (>= (+ (* sc_141 0.) of_141) 0.))
(declare-fun sc_142 () Real)
(assert (> sc_142 1e-08))
(declare-fun of_142 () Real)
(declare-fun sc_143 () Real)
(assert (> sc_143 1e-08))
(declare-fun of_143 () Real)
; 
; =  {sc.input.V[10].O} {sc.input.V[10].X}
(assert (= sc_143 sc_142))
; 
; =  {of.input.V[10].O} {of.input.V[10].X}
(assert (= of_143 of_142))
; 
; >=  {((sc.input.V[10].X*0.)+of.input.V[10].X)} {3300.}
(assert (<= (+ (* sc_142 0.) of_142) 3300.))
; 
; <=  {((sc.input.V[10].X*0.)+of.input.V[10].X)} {0.}
(assert (>= (+ (* sc_142 0.) of_142) 0.))
; 
; >=  {((sc.input.V[10].O*0.)+of.input.V[10].O)} {3300.}
(assert (<= (+ (* sc_143 0.) of_143) 3300.))
; 
; <=  {((sc.input.V[10].O*0.)+of.input.V[10].O)} {0.}
(assert (>= (+ (* sc_143 0.) of_143) 0.))
(declare-fun sc_144 () Real)
(assert (> sc_144 1e-08))
(declare-fun of_144 () Real)
(declare-fun sc_145 () Real)
(assert (> sc_145 1e-08))
(declare-fun of_145 () Real)
; 
; =  {sc.input.V[26].O} {sc.input.V[26].X}
(assert (= sc_145 sc_144))
; 
; =  {of.input.V[26].O} {of.input.V[26].X}
(assert (= of_145 of_144))
; 
; >=  {((sc.input.V[26].X*1.)+of.input.V[26].X)} {3300.}
(assert (<= (+ (* sc_144 1.) of_144) 3300.))
; 
; <=  {((sc.input.V[26].X*1.)+of.input.V[26].X)} {0.}
(assert (>= (+ (* sc_144 1.) of_144) 0.))
; 
; >=  {((sc.input.V[26].O*1.)+of.input.V[26].O)} {3300.}
(assert (<= (+ (* sc_145 1.) of_145) 3300.))
; 
; <=  {((sc.input.V[26].O*1.)+of.input.V[26].O)} {0.}
(assert (>= (+ (* sc_145 1.) of_145) 0.))
(declare-fun sc_146 () Real)
(assert (> sc_146 1e-08))
(declare-fun of_146 () Real)
(declare-fun sc_147 () Real)
(assert (> sc_147 1e-08))
(declare-fun of_147 () Real)
; 
; =  {sc.input.V[15].O} {sc.input.V[15].X}
(assert (= sc_147 sc_146))
; 
; =  {of.input.V[15].O} {of.input.V[15].X}
(assert (= of_147 of_146))
; 
; >=  {((sc.input.V[15].X*4e-06)+of.input.V[15].X)} {3300.}
(assert (<= (+ (* sc_146 4e-06) of_146) 3300.))
; 
; <=  {((sc.input.V[15].X*4e-06)+of.input.V[15].X)} {0.}
(assert (>= (+ (* sc_146 4e-06) of_146) 0.))
; 
; >=  {((sc.input.V[15].O*4e-06)+of.input.V[15].O)} {3300.}
(assert (<= (+ (* sc_147 4e-06) of_147) 3300.))
; 
; <=  {((sc.input.V[15].O*4e-06)+of.input.V[15].O)} {0.}
(assert (>= (+ (* sc_147 4e-06) of_147) 0.))
(declare-fun sc_148 () Real)
(assert (> sc_148 1e-08))
(declare-fun of_148 () Real)
(declare-fun sc_149 () Real)
(assert (> sc_149 1e-08))
(declare-fun of_149 () Real)
; 
; =  {sc.input.V[6].O} {sc.input.V[6].X}
(assert (= sc_149 sc_148))
; 
; =  {of.input.V[6].O} {of.input.V[6].X}
(assert (= of_149 of_148))
; 
; >=  {((sc.input.V[6].X*-1250.)+of.input.V[6].X)} {3300.}
(assert (<= (+ (* sc_148 -1250.) of_148) 3300.))
; 
; <=  {((sc.input.V[6].X*-1250.)+of.input.V[6].X)} {0.}
(assert (>= (+ (* sc_148 -1250.) of_148) 0.))
; 
; >=  {((sc.input.V[6].O*-1250.)+of.input.V[6].O)} {3300.}
(assert (<= (+ (* sc_149 -1250.) of_149) 3300.))
; 
; <=  {((sc.input.V[6].O*-1250.)+of.input.V[6].O)} {0.}
(assert (>= (+ (* sc_149 -1250.) of_149) 0.))
(declare-fun sc_150 () Real)
(assert (> sc_150 1e-08))
(declare-fun of_150 () Real)
(declare-fun sc_151 () Real)
(assert (> sc_151 1e-08))
(declare-fun of_151 () Real)
; 
; =  {sc.input.V[14].O} {sc.input.V[14].X}
(assert (= sc_151 sc_150))
; 
; =  {of.input.V[14].O} {of.input.V[14].X}
(assert (= of_151 of_150))
; 
; >=  {((sc.input.V[14].X*-1.)+of.input.V[14].X)} {3300.}
(assert (<= (+ (* sc_150 -1.) of_150) 3300.))
; 
; <=  {((sc.input.V[14].X*-1.)+of.input.V[14].X)} {0.}
(assert (>= (+ (* sc_150 -1.) of_150) 0.))
; 
; >=  {((sc.input.V[14].O*-1.)+of.input.V[14].O)} {3300.}
(assert (<= (+ (* sc_151 -1.) of_151) 3300.))
; 
; <=  {((sc.input.V[14].O*-1.)+of.input.V[14].O)} {0.}
(assert (>= (+ (* sc_151 -1.) of_151) 0.))
(declare-fun sc_152 () Real)
(assert (> sc_152 1e-08))
(declare-fun of_152 () Real)
(declare-fun sc_153 () Real)
(assert (> sc_153 1e-08))
(declare-fun of_153 () Real)
; 
; =  {sc.input.V[21].O} {sc.input.V[21].X}
(assert (= sc_153 sc_152))
; 
; =  {of.input.V[21].O} {of.input.V[21].X}
(assert (= of_153 of_152))
; 
; >=  {((sc.input.V[21].X*1.)+of.input.V[21].X)} {3300.}
(assert (<= (+ (* sc_152 1.) of_152) 3300.))
; 
; <=  {((sc.input.V[21].X*1.)+of.input.V[21].X)} {0.}
(assert (>= (+ (* sc_152 1.) of_152) 0.))
; 
; >=  {((sc.input.V[21].O*1.)+of.input.V[21].O)} {3300.}
(assert (<= (+ (* sc_153 1.) of_153) 3300.))
; 
; <=  {((sc.input.V[21].O*1.)+of.input.V[21].O)} {0.}
(assert (>= (+ (* sc_153 1.) of_153) 0.))
(declare-fun sc_154 () Real)
(assert (> sc_154 1e-08))
(declare-fun of_154 () Real)
(declare-fun sc_155 () Real)
(assert (> sc_155 1e-08))
(declare-fun of_155 () Real)
; 
; =  {sc.input.V[16].O} {sc.input.V[16].X}
(assert (= sc_155 sc_154))
; 
; =  {of.input.V[16].O} {of.input.V[16].X}
(assert (= of_155 of_154))
; 
; >=  {((sc.input.V[16].X*4e-06)+of.input.V[16].X)} {3300.}
(assert (<= (+ (* sc_154 4e-06) of_154) 3300.))
; 
; <=  {((sc.input.V[16].X*4e-06)+of.input.V[16].X)} {0.}
(assert (>= (+ (* sc_154 4e-06) of_154) 0.))
; 
; >=  {((sc.input.V[16].O*4e-06)+of.input.V[16].O)} {3300.}
(assert (<= (+ (* sc_155 4e-06) of_155) 3300.))
; 
; <=  {((sc.input.V[16].O*4e-06)+of.input.V[16].O)} {0.}
(assert (>= (+ (* sc_155 4e-06) of_155) 0.))
(declare-fun sc_156 () Real)
(assert (> sc_156 1e-08))
(declare-fun of_156 () Real)
(declare-fun sc_157 () Real)
(assert (> sc_157 1e-08))
(declare-fun of_157 () Real)
; 
; =  {sc.input.V[24].O} {sc.input.V[24].X}
(assert (= sc_157 sc_156))
; 
; =  {of.input.V[24].O} {of.input.V[24].X}
(assert (= of_157 of_156))
; 
; >=  {((sc.input.V[24].X*1.)+of.input.V[24].X)} {3300.}
(assert (<= (+ (* sc_156 1.) of_156) 3300.))
; 
; <=  {((sc.input.V[24].X*1.)+of.input.V[24].X)} {0.}
(assert (>= (+ (* sc_156 1.) of_156) 0.))
; 
; >=  {((sc.input.V[24].O*1.)+of.input.V[24].O)} {3300.}
(assert (<= (+ (* sc_157 1.) of_157) 3300.))
; 
; <=  {((sc.input.V[24].O*1.)+of.input.V[24].O)} {0.}
(assert (>= (+ (* sc_157 1.) of_157) 0.))
(declare-fun sc_158 () Real)
(assert (> sc_158 1e-08))
(declare-fun of_158 () Real)
(declare-fun sc_159 () Real)
(assert (> sc_159 1e-08))
(declare-fun of_159 () Real)
; 
; =  {sc.input.V[30].O} {sc.input.V[30].X}
(assert (= sc_159 sc_158))
; 
; =  {of.input.V[30].O} {of.input.V[30].X}
(assert (= of_159 of_158))
; 
; >=  {((sc.input.V[30].X*1.)+of.input.V[30].X)} {3300.}
(assert (<= (+ (* sc_158 1.) of_158) 3300.))
; 
; <=  {((sc.input.V[30].X*1.)+of.input.V[30].X)} {0.}
(assert (>= (+ (* sc_158 1.) of_158) 0.))
; 
; >=  {((sc.input.V[30].O*1.)+of.input.V[30].O)} {3300.}
(assert (<= (+ (* sc_159 1.) of_159) 3300.))
; 
; <=  {((sc.input.V[30].O*1.)+of.input.V[30].O)} {0.}
(assert (>= (+ (* sc_159 1.) of_159) 0.))
(declare-fun sc_160 () Real)
(assert (> sc_160 1e-08))
(declare-fun of_160 () Real)
(declare-fun sc_161 () Real)
(assert (> sc_161 1e-08))
(declare-fun of_161 () Real)
; 
; =  {sc.input.V[3].O} {sc.input.V[3].X}
(assert (= sc_161 sc_160))
; 
; =  {of.input.V[3].O} {of.input.V[3].X}
(assert (= of_161 of_160))
; 
; >=  {((sc.input.V[3].X*2.)+of.input.V[3].X)} {3300.}
(assert (<= (+ (* sc_160 2.) of_160) 3300.))
; 
; <=  {((sc.input.V[3].X*2.)+of.input.V[3].X)} {0.}
(assert (>= (+ (* sc_160 2.) of_160) 0.))
; 
; >=  {((sc.input.V[3].O*2.)+of.input.V[3].O)} {3300.}
(assert (<= (+ (* sc_161 2.) of_161) 3300.))
; 
; <=  {((sc.input.V[3].O*2.)+of.input.V[3].O)} {0.}
(assert (>= (+ (* sc_161 2.) of_161) 0.))
(declare-fun sc_162 () Real)
(assert (> sc_162 1e-08))
(declare-fun of_162 () Real)
(declare-fun sc_163 () Real)
(assert (> sc_163 1e-08))
(declare-fun of_163 () Real)
; 
; =  {sc.input.V[4].O} {sc.input.V[4].X}
(assert (= sc_163 sc_162))
; 
; =  {of.input.V[4].O} {of.input.V[4].X}
(assert (= of_163 of_162))
; 
; >=  {((sc.input.V[4].X*0.3125)+of.input.V[4].X)} {3300.}
(assert (<= (+ (* sc_162 0.3125) of_162) 3300.))
; 
; <=  {((sc.input.V[4].X*0.3125)+of.input.V[4].X)} {0.}
(assert (>= (+ (* sc_162 0.3125) of_162) 0.))
; 
; >=  {((sc.input.V[4].O*0.3125)+of.input.V[4].O)} {3300.}
(assert (<= (+ (* sc_163 0.3125) of_163) 3300.))
; 
; <=  {((sc.input.V[4].O*0.3125)+of.input.V[4].O)} {0.}
(assert (>= (+ (* sc_163 0.3125) of_163) 0.))
(declare-fun sc_164 () Real)
(assert (> sc_164 1e-08))
(declare-fun of_164 () Real)
(declare-fun sc_165 () Real)
(assert (> sc_165 1e-08))
(declare-fun of_165 () Real)
; 
; =  {sc.input.V[5].O} {sc.input.V[5].X}
(assert (= sc_165 sc_164))
; 
; =  {of.input.V[5].O} {of.input.V[5].X}
(assert (= of_165 of_164))
; 
; >=  {((sc.input.V[5].X*-1250.)+of.input.V[5].X)} {3300.}
(assert (<= (+ (* sc_164 -1250.) of_164) 3300.))
; 
; <=  {((sc.input.V[5].X*-1250.)+of.input.V[5].X)} {0.}
(assert (>= (+ (* sc_164 -1250.) of_164) 0.))
; 
; >=  {((sc.input.V[5].O*-1250.)+of.input.V[5].O)} {3300.}
(assert (<= (+ (* sc_165 -1250.) of_165) 3300.))
; 
; <=  {((sc.input.V[5].O*-1250.)+of.input.V[5].O)} {0.}
(assert (>= (+ (* sc_165 -1250.) of_165) 0.))
(declare-fun sc_166 () Real)
(assert (> sc_166 1e-08))
(declare-fun of_166 () Real)
(declare-fun sc_167 () Real)
(assert (> sc_167 1e-08))
(declare-fun of_167 () Real)
; 
; =  {sc.input.V[23].O} {sc.input.V[23].X}
(assert (= sc_167 sc_166))
; 
; =  {of.input.V[23].O} {of.input.V[23].X}
(assert (= of_167 of_166))
; 
; >=  {((sc.input.V[23].X*1.)+of.input.V[23].X)} {3300.}
(assert (<= (+ (* sc_166 1.) of_166) 3300.))
; 
; <=  {((sc.input.V[23].X*1.)+of.input.V[23].X)} {0.}
(assert (>= (+ (* sc_166 1.) of_166) 0.))
; 
; >=  {((sc.input.V[23].O*1.)+of.input.V[23].O)} {3300.}
(assert (<= (+ (* sc_167 1.) of_167) 3300.))
; 
; <=  {((sc.input.V[23].O*1.)+of.input.V[23].O)} {0.}
(assert (>= (+ (* sc_167 1.) of_167) 0.))
(declare-fun sc_168 () Real)
(assert (> sc_168 1e-08))
(declare-fun of_168 () Real)
(declare-fun sc_169 () Real)
(assert (> sc_169 1e-08))
(declare-fun of_169 () Real)
; 
; =  {sc.input.V[25].O} {sc.input.V[25].X}
(assert (= sc_169 sc_168))
; 
; =  {of.input.V[25].O} {of.input.V[25].X}
(assert (= of_169 of_168))
; 
; >=  {((sc.input.V[25].X*1.)+of.input.V[25].X)} {3300.}
(assert (<= (+ (* sc_168 1.) of_168) 3300.))
; 
; <=  {((sc.input.V[25].X*1.)+of.input.V[25].X)} {0.}
(assert (>= (+ (* sc_168 1.) of_168) 0.))
; 
; >=  {((sc.input.V[25].O*1.)+of.input.V[25].O)} {3300.}
(assert (<= (+ (* sc_169 1.) of_169) 3300.))
; 
; <=  {((sc.input.V[25].O*1.)+of.input.V[25].O)} {0.}
(assert (>= (+ (* sc_169 1.) of_169) 0.))
(declare-fun sc_170 () Real)
(assert (> sc_170 1e-08))
(declare-fun of_170 () Real)
(declare-fun sc_171 () Real)
(assert (> sc_171 1e-08))
(declare-fun of_171 () Real)
; 
; =  {sc.input.V[1].O} {sc.input.V[1].X}
(assert (= sc_171 sc_170))
; 
; =  {of.input.V[1].O} {of.input.V[1].X}
(assert (= of_171 of_170))
; 
; >=  {((sc.input.V[1].X*2.)+of.input.V[1].X)} {3300.}
(assert (<= (+ (* sc_170 2.) of_170) 3300.))
; 
; <=  {((sc.input.V[1].X*2.)+of.input.V[1].X)} {0.}
(assert (>= (+ (* sc_170 2.) of_170) 0.))
; 
; >=  {((sc.input.V[1].O*2.)+of.input.V[1].O)} {3300.}
(assert (<= (+ (* sc_171 2.) of_171) 3300.))
; 
; <=  {((sc.input.V[1].O*2.)+of.input.V[1].O)} {0.}
(assert (>= (+ (* sc_171 2.) of_171) 0.))
(declare-fun sc_172 () Real)
(assert (> sc_172 1e-08))
(declare-fun of_172 () Real)
(declare-fun sc_173 () Real)
(assert (> sc_173 1e-08))
(declare-fun of_173 () Real)
; 
; =  {sc.input.V[17].O} {sc.input.V[17].X}
(assert (= sc_173 sc_172))
; 
; =  {of.input.V[17].O} {of.input.V[17].X}
(assert (= of_173 of_172))
; 
; >=  {((sc.input.V[17].X*1000.75)+of.input.V[17].X)} {3300.}
(assert (<= (+ (* sc_172 1000.75) of_172) 3300.))
; 
; <=  {((sc.input.V[17].X*1000.75)+of.input.V[17].X)} {0.}
(assert (>= (+ (* sc_172 1000.75) of_172) 0.))
; 
; >=  {((sc.input.V[17].O*1000.75)+of.input.V[17].O)} {3300.}
(assert (<= (+ (* sc_173 1000.75) of_173) 3300.))
; 
; <=  {((sc.input.V[17].O*1000.75)+of.input.V[17].O)} {0.}
(assert (>= (+ (* sc_173 1000.75) of_173) 0.))
(declare-fun sc_174 () Real)
(assert (> sc_174 1e-08))
(declare-fun of_174 () Real)
(declare-fun sc_175 () Real)
(assert (> sc_175 1e-08))
(declare-fun of_175 () Real)
; 
; =  {sc.input.V[18].O} {sc.input.V[18].X}
(assert (= sc_175 sc_174))
; 
; =  {of.input.V[18].O} {of.input.V[18].X}
(assert (= of_175 of_174))
; 
; >=  {((sc.input.V[18].X*1.)+of.input.V[18].X)} {3300.}
(assert (<= (+ (* sc_174 1.) of_174) 3300.))
; 
; <=  {((sc.input.V[18].X*1.)+of.input.V[18].X)} {0.}
(assert (>= (+ (* sc_174 1.) of_174) 0.))
; 
; >=  {((sc.input.V[18].O*1.)+of.input.V[18].O)} {3300.}
(assert (<= (+ (* sc_175 1.) of_175) 3300.))
; 
; <=  {((sc.input.V[18].O*1.)+of.input.V[18].O)} {0.}
(assert (>= (+ (* sc_175 1.) of_175) 0.))
(declare-fun sc_176 () Real)
(assert (> sc_176 1e-08))
(declare-fun of_176 () Real)
(declare-fun sc_177 () Real)
(assert (> sc_177 1e-08))
(declare-fun of_177 () Real)
; 
; =  {sc.input.V[19].O} {sc.input.V[19].X}
(assert (= sc_177 sc_176))
; 
; =  {of.input.V[19].O} {of.input.V[19].X}
(assert (= of_177 of_176))
; 
; >=  {((sc.input.V[19].X*1.)+of.input.V[19].X)} {3300.}
(assert (<= (+ (* sc_176 1.) of_176) 3300.))
; 
; <=  {((sc.input.V[19].X*1.)+of.input.V[19].X)} {0.}
(assert (>= (+ (* sc_176 1.) of_176) 0.))
; 
; >=  {((sc.input.V[19].O*1.)+of.input.V[19].O)} {3300.}
(assert (<= (+ (* sc_177 1.) of_177) 3300.))
; 
; <=  {((sc.input.V[19].O*1.)+of.input.V[19].O)} {0.}
(assert (>= (+ (* sc_177 1.) of_177) 0.))
(declare-fun sc_178 () Real)
(assert (> sc_178 1e-08))
(declare-fun of_178 () Real)
(declare-fun sc_179 () Real)
(assert (> sc_179 1e-08))
(declare-fun of_179 () Real)
; 
; =  {sc.input.V[22].O} {sc.input.V[22].X}
(assert (= sc_179 sc_178))
; 
; =  {of.input.V[22].O} {of.input.V[22].X}
(assert (= of_179 of_178))
; 
; >=  {((sc.input.V[22].X*1.)+of.input.V[22].X)} {3300.}
(assert (<= (+ (* sc_178 1.) of_178) 3300.))
; 
; <=  {((sc.input.V[22].X*1.)+of.input.V[22].X)} {0.}
(assert (>= (+ (* sc_178 1.) of_178) 0.))
; 
; >=  {((sc.input.V[22].O*1.)+of.input.V[22].O)} {3300.}
(assert (<= (+ (* sc_179 1.) of_179) 3300.))
; 
; <=  {((sc.input.V[22].O*1.)+of.input.V[22].O)} {0.}
(assert (>= (+ (* sc_179 1.) of_179) 0.))
(declare-fun sc_180 () Real)
(assert (> sc_180 1e-08))
(declare-fun of_180 () Real)
(declare-fun sc_181 () Real)
(assert (> sc_181 1e-08))
(declare-fun of_181 () Real)
(declare-fun sc_182 () Real)
(assert (> sc_182 1e-08))
(declare-fun of_182 () Real)
; no offset
(assert (= of_181 0.))
; no offset
(assert (= of_180 0.))
; 
; =  {sc.itov[12].Y} {(sc.itov[12].K*sc.itov[12].X)}
(assert (= sc_182 (* sc_181 sc_180)))
; 
; =  {of.itov[12].Y} {0.}
(assert (= of_182 0.))
(declare-fun slbot_180 () Real)
(declare-fun sltop_180 () Real)
; 
; =  {(((sc.itov[12].X*1.)+of.itov[12].X)+sl.min.itov[12].X)} {0.0001}
(assert (= (+ (+ (* sc_180 1.) of_180) slbot_180) 0.0001))
; 
; =  {(((sc.itov[12].X*5.65685424949)+of.itov[12].X)+sl.max.itov[12].X)} {10.}
(assert (= (+ (+ (* sc_180 5.65685424949) of_180) sltop_180) 10.))
(declare-fun slbot_182 () Real)
(declare-fun sltop_182 () Real)
; 
; =  {(((sc.itov[12].Y*1.)+of.itov[12].Y)+sl.min.itov[12].Y)} {0.0001}
(assert (= (+ (+ (* sc_182 1.) of_182) slbot_182) 0.0001))
; 
; =  {(((sc.itov[12].Y*5.65685424949)+of.itov[12].Y)+sl.max.itov[12].Y)} {3300.}
(assert (= (+ (+ (* sc_182 5.65685424949) of_182) sltop_182) 3300.))
; 
; >=  {((sc.itov[12].K*1.)+of.itov[12].K)} {330.}
(assert (<= (+ (* sc_181 1.) of_181) 330.))
; 
; <=  {((sc.itov[12].K*1.)+of.itov[12].K)} {1.}
(assert (>= (+ (* sc_181 1.) of_181) 1.))
(declare-fun slbot_182 () Real)
(declare-fun sltop_182 () Real)
; 
; =  {(((sc.itov[12].Y*1.)+of.itov[12].Y)+sl.min.itov[12].Y)} {0.0001}
(assert (= (+ (+ (* sc_182 1.) of_182) slbot_182) 0.0001))
; 
; =  {(((sc.itov[12].Y*5.65685424949)+of.itov[12].Y)+sl.max.itov[12].Y)} {3300.}
(assert (= (+ (+ (* sc_182 5.65685424949) of_182) sltop_182) 3300.))
(declare-fun sc_183 () Real)
(assert (> sc_183 1e-08))
(declare-fun of_183 () Real)
(declare-fun sc_184 () Real)
(assert (> sc_184 1e-08))
(declare-fun of_184 () Real)
(declare-fun sc_185 () Real)
(assert (> sc_185 1e-08))
(declare-fun of_185 () Real)
; no offset
(assert (= of_184 0.))
; no offset
(assert (= of_183 0.))
; 
; =  {sc.itov[16].Y} {(sc.itov[16].K*sc.itov[16].X)}
(assert (= sc_185 (* sc_184 sc_183)))
; 
; =  {of.itov[16].Y} {0.}
(assert (= of_185 0.))
(declare-fun slbot_183 () Real)
(declare-fun sltop_183 () Real)
; 
; =  {(((sc.itov[16].X*0.176776695297)+of.itov[16].X)+sl.min.itov[16].X)} {0.0001}
(assert (= (+ (+ (* sc_183 0.176776695297) of_183) slbot_183) 0.0001))
; 
; =  {(((sc.itov[16].X*1.)+of.itov[16].X)+sl.max.itov[16].X)} {10.}
(assert (= (+ (+ (* sc_183 1.) of_183) sltop_183) 10.))
(declare-fun slbot_185 () Real)
(declare-fun sltop_185 () Real)
; 
; =  {(((sc.itov[16].Y*0.176776695297)+of.itov[16].Y)+sl.min.itov[16].Y)} {0.0001}
(assert (= (+ (+ (* sc_185 0.176776695297) of_185) slbot_185) 0.0001))
; 
; =  {(((sc.itov[16].Y*1.)+of.itov[16].Y)+sl.max.itov[16].Y)} {3300.}
(assert (= (+ (+ (* sc_185 1.) of_185) sltop_185) 3300.))
; 
; >=  {((sc.itov[16].K*1.)+of.itov[16].K)} {330.}
(assert (<= (+ (* sc_184 1.) of_184) 330.))
; 
; <=  {((sc.itov[16].K*1.)+of.itov[16].K)} {1.}
(assert (>= (+ (* sc_184 1.) of_184) 1.))
(declare-fun slbot_185 () Real)
(declare-fun sltop_185 () Real)
; 
; =  {(((sc.itov[16].Y*0.176776695297)+of.itov[16].Y)+sl.min.itov[16].Y)} {0.0001}
(assert (= (+ (+ (* sc_185 0.176776695297) of_185) slbot_185) 0.0001))
; 
; =  {(((sc.itov[16].Y*1.)+of.itov[16].Y)+sl.max.itov[16].Y)} {3300.}
(assert (= (+ (+ (* sc_185 1.) of_185) sltop_185) 3300.))
(declare-fun sc_186 () Real)
(assert (> sc_186 1e-08))
(declare-fun of_186 () Real)
(declare-fun sc_187 () Real)
(assert (> sc_187 1e-08))
(declare-fun of_187 () Real)
(declare-fun sc_188 () Real)
(assert (> sc_188 1e-08))
(declare-fun of_188 () Real)
; no offset
(assert (= of_187 0.))
; no offset
(assert (= of_186 0.))
; 
; =  {sc.itov[4].Y} {(sc.itov[4].K*sc.itov[4].X)}
(assert (= sc_188 (* sc_187 sc_186)))
; 
; =  {of.itov[4].Y} {0.}
(assert (= of_188 0.))
; 
; >=  {((sc.itov[4].X*4.)+of.itov[4].X)} {10.}
(assert (<= (+ (* sc_186 4.) of_186) 10.))
; 
; <=  {((sc.itov[4].X*4.)+of.itov[4].X)} {0.0001}
(assert (>= (+ (* sc_186 4.) of_186) 0.0001))
(declare-fun slbot_188 () Real)
(declare-fun sltop_188 () Real)
; 
; =  {(((sc.itov[4].Y*0.0307207562032)+of.itov[4].Y)+sl.min.itov[4].Y)} {0.0001}
(assert (= (+ (+ (* sc_188 0.0307207562032) of_188) slbot_188) 0.0001))
; 
; =  {(((sc.itov[4].Y*0.1248)+of.itov[4].Y)+sl.max.itov[4].Y)} {3300.}
(assert (= (+ (+ (* sc_188 0.1248) of_188) sltop_188) 3300.))
(declare-fun slbot_187 () Real)
(declare-fun sltop_187 () Real)
; 
; =  {(((sc.itov[4].K*0.00768018905081)+of.itov[4].K)+sl.min.itov[4].K)} {1.}
(assert (= (+ (+ (* sc_187 0.00768018905081) of_187) slbot_187) 1.))
; 
; =  {(((sc.itov[4].K*0.0312)+of.itov[4].K)+sl.max.itov[4].K)} {330.}
(assert (= (+ (+ (* sc_187 0.0312) of_187) sltop_187) 330.))
(declare-fun slbot_188 () Real)
(declare-fun sltop_188 () Real)
; 
; =  {(((sc.itov[4].Y*0.0307207562032)+of.itov[4].Y)+sl.min.itov[4].Y)} {0.0001}
(assert (= (+ (+ (* sc_188 0.0307207562032) of_188) slbot_188) 0.0001))
; 
; =  {(((sc.itov[4].Y*0.1248)+of.itov[4].Y)+sl.max.itov[4].Y)} {3300.}
(assert (= (+ (+ (* sc_188 0.1248) of_188) sltop_188) 3300.))
(declare-fun sc_189 () Real)
(assert (> sc_189 1e-08))
(declare-fun of_189 () Real)
(declare-fun sc_190 () Real)
(assert (> sc_190 1e-08))
(declare-fun of_190 () Real)
(declare-fun sc_191 () Real)
(assert (> sc_191 1e-08))
(declare-fun of_191 () Real)
; no offset
(assert (= of_190 0.))
; no offset
(assert (= of_189 0.))
; 
; =  {sc.itov[1].Y} {(sc.itov[1].K*sc.itov[1].X)}
(assert (= sc_191 (* sc_190 sc_189)))
; 
; =  {of.itov[1].Y} {0.}
(assert (= of_191 0.))
; 
; >=  {((sc.itov[1].X*4.)+of.itov[1].X)} {10.}
(assert (<= (+ (* sc_189 4.) of_189) 10.))
; 
; <=  {((sc.itov[1].X*4.)+of.itov[1].X)} {0.0001}
(assert (>= (+ (* sc_189 4.) of_189) 0.0001))
(declare-fun slbot_191 () Real)
(declare-fun sltop_191 () Real)
; 
; =  {(((sc.itov[1].Y*0.109429385666)+of.itov[1].Y)+sl.min.itov[1].Y)} {0.0001}
(assert (= (+ (+ (* sc_191 0.109429385666) of_191) slbot_191) 0.0001))
; 
; =  {(((sc.itov[1].Y*3.53553390593)+of.itov[1].Y)+sl.max.itov[1].Y)} {3300.}
(assert (= (+ (+ (* sc_191 3.53553390593) of_191) sltop_191) 3300.))
(declare-fun slbot_190 () Real)
(declare-fun sltop_190 () Real)
; 
; =  {(((sc.itov[1].K*0.0273573464165)+of.itov[1].K)+sl.min.itov[1].K)} {1.}
(assert (= (+ (+ (* sc_190 0.0273573464165) of_190) slbot_190) 1.))
; 
; =  {(((sc.itov[1].K*0.883883476483)+of.itov[1].K)+sl.max.itov[1].K)} {330.}
(assert (= (+ (+ (* sc_190 0.883883476483) of_190) sltop_190) 330.))
(declare-fun slbot_191 () Real)
(declare-fun sltop_191 () Real)
; 
; =  {(((sc.itov[1].Y*0.109429385666)+of.itov[1].Y)+sl.min.itov[1].Y)} {0.0001}
(assert (= (+ (+ (* sc_191 0.109429385666) of_191) slbot_191) 0.0001))
; 
; =  {(((sc.itov[1].Y*3.53553390593)+of.itov[1].Y)+sl.max.itov[1].Y)} {3300.}
(assert (= (+ (+ (* sc_191 3.53553390593) of_191) sltop_191) 3300.))
(declare-fun sc_192 () Real)
(assert (> sc_192 1e-08))
(declare-fun of_192 () Real)
(declare-fun sc_193 () Real)
(assert (> sc_193 1e-08))
(declare-fun of_193 () Real)
(declare-fun sc_194 () Real)
(assert (> sc_194 1e-08))
(declare-fun of_194 () Real)
; no offset
(assert (= of_193 0.))
; no offset
(assert (= of_192 0.))
; 
; =  {sc.itov[18].Y} {(sc.itov[18].K*sc.itov[18].X)}
(assert (= sc_194 (* sc_193 sc_192)))
; 
; =  {of.itov[18].Y} {0.}
(assert (= of_194 0.))
(declare-fun slbot_192 () Real)
(declare-fun sltop_192 () Real)
; 
; =  {(((sc.itov[18].X*0.)+of.itov[18].X)+sl.min.itov[18].X)} {0.0001}
(assert (= (+ (+ (* sc_192 0.) of_192) slbot_192) 0.0001))
; 
; =  {(((sc.itov[18].X*0.00965050555471)+of.itov[18].X)+sl.max.itov[18].X)} {10.}
(assert (= (+ (+ (* sc_192 0.00965050555471) of_192) sltop_192) 10.))
(declare-fun slbot_194 () Real)
(declare-fun sltop_194 () Real)
; 
; =  {(((sc.itov[18].Y*0.)+of.itov[18].Y)+sl.min.itov[18].Y)} {0.0001}
(assert (= (+ (+ (* sc_194 0.) of_194) slbot_194) 0.0001))
; 
; =  {(((sc.itov[18].Y*0.00965050555471)+of.itov[18].Y)+sl.max.itov[18].Y)} {3300.}
(assert (= (+ (+ (* sc_194 0.00965050555471) of_194) sltop_194) 3300.))
; 
; >=  {((sc.itov[18].K*1.)+of.itov[18].K)} {330.}
(assert (<= (+ (* sc_193 1.) of_193) 330.))
; 
; <=  {((sc.itov[18].K*1.)+of.itov[18].K)} {1.}
(assert (>= (+ (* sc_193 1.) of_193) 1.))
(declare-fun slbot_194 () Real)
(declare-fun sltop_194 () Real)
; 
; =  {(((sc.itov[18].Y*0.)+of.itov[18].Y)+sl.min.itov[18].Y)} {0.0001}
(assert (= (+ (+ (* sc_194 0.) of_194) slbot_194) 0.0001))
; 
; =  {(((sc.itov[18].Y*0.00965050555471)+of.itov[18].Y)+sl.max.itov[18].Y)} {3300.}
(assert (= (+ (+ (* sc_194 0.00965050555471) of_194) sltop_194) 3300.))
(declare-fun sc_195 () Real)
(assert (> sc_195 1e-08))
(declare-fun of_195 () Real)
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
; 
; =  {sc.iadd[20].A} {sc.iadd[20].B}
(assert (= sc_197 sc_198))
; 
; =  {sc.iadd[20].A} {sc.iadd[20].C} {sc.iadd[20].D}
(assert (and (= sc_197 sc_196) (= sc_197 sc_195)))
; 
; =  {sc.iadd[20].OUT} {sc.iadd[20].A}
(assert (= sc_199 sc_197))
; 
; =  {of.iadd[20].OUT} {((of.iadd[20].A+of.iadd[20].B)-of.iadd[20].C-of.iadd[20].D)}
(assert (= of_199 (- (+ of_197 of_198) (+ of_196 of_195))))
; 
; >=  {((sc.iadd[20].D*1.)+of.iadd[20].D)} {5.}
(assert (<= (+ (* sc_195 1.) of_195) 5.))
; 
; <=  {((sc.iadd[20].D*1.)+of.iadd[20].D)} {0.}
(assert (>= (+ (* sc_195 1.) of_195) 0.))
; 
; >=  {((sc.iadd[20].C*0.)+of.iadd[20].C)} {5.}
(assert (<= (+ (* sc_196 0.) of_196) 5.))
; 
; <=  {((sc.iadd[20].C*0.)+of.iadd[20].C)} {0.}
(assert (>= (+ (* sc_196 0.) of_196) 0.))
(declare-fun slbot_199 () Real)
(declare-fun sltop_199 () Real)
; 
; =  {(((sc.iadd[20].OUT*-1.)+of.iadd[20].OUT)+sl.min.iadd[20].OUT)} {-10.}
(assert (= (+ (+ (* sc_199 -1.) of_199) slbot_199) -10.))
; 
; =  {(((sc.iadd[20].OUT*-0.84375)+of.iadd[20].OUT)+sl.max.iadd[20].OUT)} {10.}
(assert (= (+ (+ (* sc_199 -0.84375) of_199) sltop_199) 10.))
; 
; >=  {((sc.iadd[20].A*0.)+of.iadd[20].A)} {5.}
(assert (<= (+ (* sc_197 0.) of_197) 5.))
; 
; <=  {((sc.iadd[20].A*0.)+of.iadd[20].A)} {0.}
(assert (>= (+ (* sc_197 0.) of_197) 0.))
(declare-fun slbot_198 () Real)
(declare-fun sltop_198 () Real)
; 
; =  {(((sc.iadd[20].B*0.)+of.iadd[20].B)+sl.min.iadd[20].B)} {0.}
(assert (= (+ (+ (* sc_198 0.) of_198) slbot_198) 0.))
; 
; =  {(((sc.iadd[20].B*0.15625)+of.iadd[20].B)+sl.max.iadd[20].B)} {5.}
(assert (= (+ (+ (* sc_198 0.15625) of_198) sltop_198) 5.))
(declare-fun slbot_199 () Real)
(declare-fun sltop_199 () Real)
; 
; =  {(((sc.iadd[20].OUT*-1.)+of.iadd[20].OUT)+sl.min.iadd[20].OUT)} {-10.}
(assert (= (+ (+ (* sc_199 -1.) of_199) slbot_199) -10.))
; 
; =  {(((sc.iadd[20].OUT*-0.84375)+of.iadd[20].OUT)+sl.max.iadd[20].OUT)} {10.}
(assert (= (+ (+ (* sc_199 -0.84375) of_199) sltop_199) 10.))
(declare-fun sc_200 () Real)
(assert (> sc_200 1e-08))
(declare-fun of_200 () Real)
(declare-fun sc_201 () Real)
(assert (> sc_201 1e-08))
(declare-fun of_201 () Real)
(declare-fun sc_202 () Real)
(assert (> sc_202 1e-08))
(declare-fun of_202 () Real)
(declare-fun sc_203 () Real)
(assert (> sc_203 1e-08))
(declare-fun of_203 () Real)
(declare-fun sc_204 () Real)
(assert (> sc_204 1e-08))
(declare-fun of_204 () Real)
; 
; =  {sc.iadd[13].A} {sc.iadd[13].B}
(assert (= sc_202 sc_203))
; 
; =  {sc.iadd[13].A} {sc.iadd[13].C} {sc.iadd[13].D}
(assert (and (= sc_202 sc_201) (= sc_202 sc_200)))
; 
; =  {sc.iadd[13].OUT} {sc.iadd[13].A}
(assert (= sc_204 sc_202))
; 
; =  {of.iadd[13].OUT} {((of.iadd[13].A+of.iadd[13].B)-of.iadd[13].C-of.iadd[13].D)}
(assert (= of_204 (- (+ of_202 of_203) (+ of_201 of_200))))
; 
; >=  {((sc.iadd[13].D*0.)+of.iadd[13].D)} {5.}
(assert (<= (+ (* sc_200 0.) of_200) 5.))
; 
; <=  {((sc.iadd[13].D*0.)+of.iadd[13].D)} {0.}
(assert (>= (+ (* sc_200 0.) of_200) 0.))
; 
; >=  {((sc.iadd[13].C*0.)+of.iadd[13].C)} {5.}
(assert (<= (+ (* sc_201 0.) of_201) 5.))
; 
; <=  {((sc.iadd[13].C*0.)+of.iadd[13].C)} {0.}
(assert (>= (+ (* sc_201 0.) of_201) 0.))
(declare-fun slbot_204 () Real)
(declare-fun sltop_204 () Real)
; 
; =  {(((sc.iadd[13].OUT*1.)+of.iadd[13].OUT)+sl.min.iadd[13].OUT)} {-10.}
(assert (= (+ (+ (* sc_204 1.) of_204) slbot_204) -10.))
; 
; =  {(((sc.iadd[13].OUT*5.65685424949)+of.iadd[13].OUT)+sl.max.iadd[13].OUT)} {10.}
(assert (= (+ (+ (* sc_204 5.65685424949) of_204) sltop_204) 10.))
; 
; >=  {((sc.iadd[13].A*0.)+of.iadd[13].A)} {5.}
(assert (<= (+ (* sc_202 0.) of_202) 5.))
; 
; <=  {((sc.iadd[13].A*0.)+of.iadd[13].A)} {0.}
(assert (>= (+ (* sc_202 0.) of_202) 0.))
(declare-fun slbot_203 () Real)
(declare-fun sltop_203 () Real)
; 
; =  {(((sc.iadd[13].B*1.)+of.iadd[13].B)+sl.min.iadd[13].B)} {0.}
(assert (= (+ (+ (* sc_203 1.) of_203) slbot_203) 0.))
; 
; =  {(((sc.iadd[13].B*5.65685424949)+of.iadd[13].B)+sl.max.iadd[13].B)} {5.}
(assert (= (+ (+ (* sc_203 5.65685424949) of_203) sltop_203) 5.))
(declare-fun slbot_204 () Real)
(declare-fun sltop_204 () Real)
; 
; =  {(((sc.iadd[13].OUT*1.)+of.iadd[13].OUT)+sl.min.iadd[13].OUT)} {-10.}
(assert (= (+ (+ (* sc_204 1.) of_204) slbot_204) -10.))
; 
; =  {(((sc.iadd[13].OUT*5.65685424949)+of.iadd[13].OUT)+sl.max.iadd[13].OUT)} {10.}
(assert (= (+ (+ (* sc_204 5.65685424949) of_204) sltop_204) 10.))
(declare-fun sc_205 () Real)
(assert (> sc_205 1e-08))
(declare-fun of_205 () Real)
(declare-fun sc_206 () Real)
(assert (> sc_206 1e-08))
(declare-fun of_206 () Real)
(declare-fun sc_207 () Real)
(assert (> sc_207 1e-08))
(declare-fun of_207 () Real)
(declare-fun sc_208 () Real)
(assert (> sc_208 1e-08))
(declare-fun of_208 () Real)
(declare-fun sc_209 () Real)
(assert (> sc_209 1e-08))
(declare-fun of_209 () Real)
; 
; =  {sc.iadd[21].A} {sc.iadd[21].B}
(assert (= sc_207 sc_208))
; 
; =  {sc.iadd[21].A} {sc.iadd[21].C} {sc.iadd[21].D}
(assert (and (= sc_207 sc_206) (= sc_207 sc_205)))
; 
; =  {sc.iadd[21].OUT} {sc.iadd[21].A}
(assert (= sc_209 sc_207))
; 
; =  {of.iadd[21].OUT} {((of.iadd[21].A+of.iadd[21].B)-of.iadd[21].C-of.iadd[21].D)}
(assert (= of_209 (- (+ of_207 of_208) (+ of_206 of_205))))
(declare-fun slbot_205 () Real)
(declare-fun sltop_205 () Real)
; 
; =  {(((sc.iadd[21].D*-1.)+of.iadd[21].D)+sl.min.iadd[21].D)} {0.}
(assert (= (+ (+ (* sc_205 -1.) of_205) slbot_205) 0.))
; 
; =  {(((sc.iadd[21].D*-0.5)+of.iadd[21].D)+sl.max.iadd[21].D)} {5.}
(assert (= (+ (+ (* sc_205 -0.5) of_205) sltop_205) 5.))
; 
; >=  {((sc.iadd[21].C*1.)+of.iadd[21].C)} {5.}
(assert (<= (+ (* sc_206 1.) of_206) 5.))
; 
; <=  {((sc.iadd[21].C*1.)+of.iadd[21].C)} {0.}
(assert (>= (+ (* sc_206 1.) of_206) 0.))
(declare-fun slbot_209 () Real)
(declare-fun sltop_209 () Real)
; 
; =  {(((sc.iadd[21].OUT*-0.5)+of.iadd[21].OUT)+sl.min.iadd[21].OUT)} {-10.}
(assert (= (+ (+ (* sc_209 -0.5) of_209) slbot_209) -10.))
; 
; =  {(((sc.iadd[21].OUT*0.)+of.iadd[21].OUT)+sl.max.iadd[21].OUT)} {10.}
(assert (= (+ (+ (* sc_209 0.) of_209) sltop_209) 10.))
; 
; >=  {((sc.iadd[21].A*0.)+of.iadd[21].A)} {5.}
(assert (<= (+ (* sc_207 0.) of_207) 5.))
; 
; <=  {((sc.iadd[21].A*0.)+of.iadd[21].A)} {0.}
(assert (>= (+ (* sc_207 0.) of_207) 0.))
; 
; >=  {((sc.iadd[21].B*0.)+of.iadd[21].B)} {5.}
(assert (<= (+ (* sc_208 0.) of_208) 5.))
; 
; <=  {((sc.iadd[21].B*0.)+of.iadd[21].B)} {0.}
(assert (>= (+ (* sc_208 0.) of_208) 0.))
(declare-fun slbot_209 () Real)
(declare-fun sltop_209 () Real)
; 
; =  {(((sc.iadd[21].OUT*-0.5)+of.iadd[21].OUT)+sl.min.iadd[21].OUT)} {-10.}
(assert (= (+ (+ (* sc_209 -0.5) of_209) slbot_209) -10.))
; 
; =  {(((sc.iadd[21].OUT*0.)+of.iadd[21].OUT)+sl.max.iadd[21].OUT)} {10.}
(assert (= (+ (+ (* sc_209 0.) of_209) sltop_209) 10.))
(declare-fun sc_210 () Real)
(assert (> sc_210 1e-08))
(declare-fun of_210 () Real)
(declare-fun sc_211 () Real)
(assert (> sc_211 1e-08))
(declare-fun of_211 () Real)
(declare-fun sc_212 () Real)
(assert (> sc_212 1e-08))
(declare-fun of_212 () Real)
(declare-fun sc_213 () Real)
(assert (> sc_213 1e-08))
(declare-fun of_213 () Real)
(declare-fun sc_214 () Real)
(assert (> sc_214 1e-08))
(declare-fun of_214 () Real)
; 
; =  {sc.iadd[22].A} {sc.iadd[22].B}
(assert (= sc_212 sc_213))
; 
; =  {sc.iadd[22].A} {sc.iadd[22].C} {sc.iadd[22].D}
(assert (and (= sc_212 sc_211) (= sc_212 sc_210)))
; 
; =  {sc.iadd[22].OUT} {sc.iadd[22].A}
(assert (= sc_214 sc_212))
; 
; =  {of.iadd[22].OUT} {((of.iadd[22].A+of.iadd[22].B)-of.iadd[22].C-of.iadd[22].D)}
(assert (= of_214 (- (+ of_212 of_213) (+ of_211 of_210))))
; 
; >=  {((sc.iadd[22].D*0.)+of.iadd[22].D)} {5.}
(assert (<= (+ (* sc_210 0.) of_210) 5.))
; 
; <=  {((sc.iadd[22].D*0.)+of.iadd[22].D)} {0.}
(assert (>= (+ (* sc_210 0.) of_210) 0.))
; 
; >=  {((sc.iadd[22].C*0.)+of.iadd[22].C)} {5.}
(assert (<= (+ (* sc_211 0.) of_211) 5.))
; 
; <=  {((sc.iadd[22].C*0.)+of.iadd[22].C)} {0.}
(assert (>= (+ (* sc_211 0.) of_211) 0.))
; 
; >=  {((sc.iadd[22].A*0.)+of.iadd[22].A)} {5.}
(assert (<= (+ (* sc_212 0.) of_212) 5.))
; 
; <=  {((sc.iadd[22].A*0.)+of.iadd[22].A)} {0.}
(assert (>= (+ (* sc_212 0.) of_212) 0.))
(declare-fun slbot_213 () Real)
(declare-fun sltop_213 () Real)
; 
; =  {(((sc.iadd[22].B*0.)+of.iadd[22].B)+sl.min.iadd[22].B)} {0.}
(assert (= (+ (+ (* sc_213 0.) of_213) slbot_213) 0.))
; 
; =  {(((sc.iadd[22].B*0.0156)+of.iadd[22].B)+sl.max.iadd[22].B)} {5.}
(assert (= (+ (+ (* sc_213 0.0156) of_213) sltop_213) 5.))
(declare-fun slbot_214 () Real)
(declare-fun sltop_214 () Real)
; 
; =  {(((sc.iadd[22].OUT*0.)+of.iadd[22].OUT)+sl.min.iadd[22].OUT)} {-10.}
(assert (= (+ (+ (* sc_214 0.) of_214) slbot_214) -10.))
; 
; =  {(((sc.iadd[22].OUT*0.0156)+of.iadd[22].OUT)+sl.max.iadd[22].OUT)} {10.}
(assert (= (+ (+ (* sc_214 0.0156) of_214) sltop_214) 10.))
; 
; =  {sc.vtoi[15].Y} {sc.ihill[7].Km}
(assert (= sc_112 sc_97))
; 
; =  {of.vtoi[15].Y} {of.ihill[7].Km}
(assert (= of_112 of_97))
; 
; =  {sc.itov[12].Y} {sc.vgain[9].Y}
(assert (= sc_182 sc_1))
; 
; =  {of.itov[12].Y} {of.vgain[9].Y}
(assert (= of_182 of_1))
; 
; =  {sc.input.I[0].O} {sc.switch[3].SUB}
(assert (= sc_44 sc_17))
; 
; =  {of.input.I[0].O} {of.switch[3].SUB}
(assert (= of_44 of_17))
; 
; =  {sc.vadd[2].OUT2} {sc.output.V[1].X}
(assert (= sc_87 sc_79))
; 
; =  {of.vadd[2].OUT2} {of.output.V[1].X}
(assert (= of_87 of_79))
; 
; =  {sc.vadd[2].OUT2} {sc.switch[3].Vmax}
(assert (= sc_87 sc_19))
; 
; =  {of.vadd[2].OUT2} {of.switch[3].Vmax}
(assert (= of_87 of_19))
; 
; =  {sc.ihill[0].REP} {sc.itov[4].K}
(assert (= sc_106 sc_187))
; 
; =  {of.ihill[0].REP} {of.itov[4].K}
(assert (= of_106 of_187))
; 
; =  {sc.itov[1].Y} {sc.vadd[2].B}
(assert (= sc_191 sc_85))
; 
; =  {of.itov[1].Y} {of.vadd[2].B}
(assert (= of_191 of_85))
; 
; =  {sc.vgain[15].P} {sc.vtoi[14].K}
(assert (= sc_15 sc_117))
; 
; =  {of.vgain[15].P} {of.vtoi[14].K}
(assert (= of_15 of_117))
; 
; =  {sc.input.V[15].O} {sc.vadd[5].D}
(assert (= sc_147 sc_89))
; 
; =  {of.input.V[15].O} {of.vadd[5].D}
(assert (= of_147 of_89))
; 
; =  {sc.input.I[25].O} {sc.iadd[22].A}
(assert (= sc_68 sc_212))
; 
; =  {of.input.I[25].O} {of.iadd[22].A}
(assert (= of_68 of_212))
; 
; =  {sc.input.V[13].O} {sc.vadd[2].OUT2_0}
(assert (= sc_133 sc_81))
; 
; =  {of.input.V[13].O} {of.vadd[2].OUT2_0}
(assert (= of_133 of_81))
; 
; =  {sc.input.V[14].O} {sc.vtoi[6].K}
(assert (= sc_151 sc_114))
; 
; =  {of.input.V[14].O} {of.vtoi[6].K}
(assert (= of_151 of_114))
; 
; =  {sc.iadd[22].OUT} {sc.ihill[0].S}
(assert (= sc_214 sc_102))
; 
; =  {of.iadd[22].OUT} {of.ihill[0].S}
(assert (= of_214 of_102))
; 
; =  {sc.input.I[14].O} {sc.switch[17].Kmod}
(assert (= sc_54 sc_23))
; 
; =  {of.input.I[14].O} {of.switch[17].Kmod}
(assert (= of_54 of_23))
; 
; =  {sc.input.V[11].O} {sc.vadd[5].C}
(assert (= sc_141 sc_90))
; 
; =  {of.input.V[11].O} {of.vadd[5].C}
(assert (= of_141 of_90))
; 
; =  {sc.vadd[5].OUT2} {sc.output.V[0].X}
(assert (= sc_94 sc_77))
; 
; =  {of.vadd[5].OUT2} {of.output.V[0].X}
(assert (= of_94 of_77))
; 
; =  {sc.vadd[5].OUT2} {sc.vtoi[15].X}
(assert (= sc_94 sc_110))
; 
; =  {of.vadd[5].OUT2} {of.vtoi[15].X}
(assert (= of_94 of_110))
; 
; =  {sc.vadd[5].OUT2} {sc.vtoi[16].X}
(assert (= sc_94 sc_119))
; 
; =  {of.vadd[5].OUT2} {of.vtoi[16].X}
(assert (= of_94 of_119))
; 
; =  {sc.vtoi[14].Y} {sc.iadd[13].B}
(assert (= sc_118 sc_203))
; 
; =  {of.vtoi[14].Y} {of.iadd[13].B}
(assert (= of_118 of_203))
; 
; =  {sc.input.I[24].O} {sc.iadd[22].D}
(assert (= sc_56 sc_210))
; 
; =  {of.input.I[24].O} {of.iadd[22].D}
(assert (= of_56 of_210))
; 
; =  {sc.input.V[22].O} {sc.itov[12].K}
(assert (= sc_179 sc_181))
; 
; =  {of.input.V[22].O} {of.itov[12].K}
(assert (= of_179 of_181))
; 
; =  {sc.input.I[10].O} {sc.iadd[21].A}
(assert (= sc_48 sc_207))
; 
; =  {of.input.I[10].O} {of.iadd[21].A}
(assert (= of_48 of_207))
; 
; =  {sc.input.I[12].O} {sc.itov[1].X}
(assert (= sc_40 sc_189))
; 
; =  {of.input.I[12].O} {of.itov[1].X}
(assert (= of_40 of_189))
; 
; =  {sc.input.V[23].O} {sc.vtoi[14].X}
(assert (= sc_167 sc_116))
; 
; =  {of.input.V[23].O} {of.vtoi[14].X}
(assert (= of_167 of_116))
; 
; =  {sc.input.V[21].O} {sc.vgain[11].X}
(assert (= sc_153 sc_4))
; 
; =  {of.input.V[21].O} {of.vgain[11].X}
(assert (= of_153 of_4))
; 
; =  {sc.input.V[30].O} {sc.vtoi[15].K}
(assert (= sc_159 sc_111))
; 
; =  {of.input.V[30].O} {of.vtoi[15].K}
(assert (= of_159 of_111))
; 
; =  {sc.input.I[7].O} {sc.iadd[20].A}
(assert (= sc_36 sc_197))
; 
; =  {of.input.I[7].O} {of.iadd[20].A}
(assert (= of_36 of_197))
; 
; =  {sc.input.V[20].O} {sc.vgain[10].X}
(assert (= sc_125 sc_8))
; 
; =  {of.input.V[20].O} {of.vgain[10].X}
(assert (= of_125 of_8))
; 
; =  {sc.input.V[29].O} {sc.vtoi[16].K}
(assert (= sc_127 sc_120))
; 
; =  {of.input.V[29].O} {of.vtoi[16].K}
(assert (= of_127 of_120))
; 
; =  {sc.input.I[8].O} {sc.iadd[20].C}
(assert (= sc_34 sc_196))
; 
; =  {of.input.I[8].O} {of.iadd[20].C}
(assert (= of_34 of_196))
; 
; =  {sc.input.I[23].O} {sc.iadd[22].C}
(assert (= sc_66 sc_211))
; 
; =  {of.input.I[23].O} {of.iadd[22].C}
(assert (= of_66 of_211))
; 
; =  {sc.input.V[16].O} {sc.vadd[2].D}
(assert (= sc_155 sc_82))
; 
; =  {of.input.V[16].O} {of.vadd[2].D}
(assert (= of_155 of_82))
; 
; =  {sc.itov[16].Y} {sc.vgain[15].Z}
(assert (= sc_185 sc_14))
; 
; =  {of.itov[16].Y} {of.vgain[15].Z}
(assert (= of_185 of_14))
; 
; =  {sc.input.V[5].O} {sc.switch[19].n}
(assert (= sc_165 sc_26))
; 
; =  {of.input.V[5].O} {of.switch[19].n}
(assert (= of_165 of_26))
; 
; =  {sc.input.V[6].O} {sc.switch[17].n}
(assert (= sc_149 sc_21))
; 
; =  {of.input.V[6].O} {of.switch[17].n}
(assert (= of_149 of_21))
; 
; =  {sc.input.I[11].O} {sc.itov[4].X}
(assert (= sc_46 sc_186))
; 
; =  {of.input.I[11].O} {of.itov[4].X}
(assert (= of_46 of_186))
; 
; =  {sc.switch[19].PROD} {sc.itov[18].X}
(assert (= sc_30 sc_192))
; 
; =  {of.switch[19].PROD} {of.itov[18].X}
(assert (= of_30 of_192))
; 
; =  {sc.input.V[17].O} {sc.switch[3].n}
(assert (= sc_173 sc_16))
; 
; =  {of.input.V[17].O} {of.switch[3].n}
(assert (= of_173 of_16))
; 
; =  {sc.input.I[6].O} {sc.iadd[13].C}
(assert (= sc_52 sc_201))
; 
; =  {of.input.I[6].O} {of.iadd[13].C}
(assert (= of_52 of_201))
; 
; =  {sc.input.V[9].O} {sc.vadd[2].C}
(assert (= sc_137 sc_83))
; 
; =  {of.input.V[9].O} {of.vadd[2].C}
(assert (= of_137 of_83))
; 
; =  {sc.iadd[13].OUT} {sc.itov[12].X}
(assert (= sc_204 sc_180))
; 
; =  {of.iadd[13].OUT} {of.itov[12].X}
(assert (= of_204 of_180))
; 
; =  {sc.iadd[21].OUT} {sc.switch[17].SUB}
(assert (= sc_209 sc_22))
; 
; =  {of.iadd[21].OUT} {of.switch[17].SUB}
(assert (= of_209 of_22))
; 
; =  {sc.input.I[18].O} {sc.iadd[21].C}
(assert (= sc_74 sc_206))
; 
; =  {of.input.I[18].O} {of.iadd[21].C}
(assert (= of_74 of_206))
; 
; =  {sc.input.I[9].O} {sc.iadd[21].B}
(assert (= sc_42 sc_208))
; 
; =  {of.input.I[9].O} {of.iadd[21].B}
(assert (= of_42 of_208))
; 
; =  {sc.input.I[3].O} {sc.ihill[0].Vmax}
(assert (= sc_60 sc_104))
; 
; =  {of.input.I[3].O} {of.ihill[0].Vmax}
(assert (= of_60 of_104))
; 
; =  {sc.input.I[16].O} {sc.switch[19].Kmod}
(assert (= sc_58 sc_28))
; 
; =  {of.input.I[16].O} {of.switch[19].Kmod}
(assert (= of_58 of_28))
; 
; =  {sc.input.I[4].O} {sc.iadd[13].D}
(assert (= sc_62 sc_200))
; 
; =  {of.input.I[4].O} {of.iadd[13].D}
(assert (= of_62 of_200))
; 
; =  {sc.switch[17].PROD} {sc.itov[16].X}
(assert (= sc_25 sc_183))
; 
; =  {of.switch[17].PROD} {of.itov[16].X}
(assert (= of_25 of_183))
; 
; =  {sc.vtoi[16].Y} {sc.iadd[20].B}
(assert (= sc_121 sc_198))
; 
; =  {of.vtoi[16].Y} {of.iadd[20].B}
(assert (= of_121 of_198))
; 
; =  {sc.input.I[5].O} {sc.iadd[13].A}
(assert (= sc_64 sc_202))
; 
; =  {of.input.I[5].O} {of.iadd[13].A}
(assert (= of_64 of_202))
; 
; =  {sc.vtoi[6].Y} {sc.iadd[21].D}
(assert (= sc_115 sc_205))
; 
; =  {of.vtoi[6].Y} {of.iadd[21].D}
(assert (= of_115 of_205))
; 
; =  {sc.switch[3].PROD} {sc.iadd[22].B}
(assert (= sc_20 sc_213))
; 
; =  {of.switch[3].PROD} {of.iadd[22].B}
(assert (= of_20 of_213))
; 
; =  {sc.input.V[8].O} {sc.vadd[2].A}
(assert (= sc_129 sc_84))
; 
; =  {of.input.V[8].O} {of.vadd[2].A}
(assert (= of_129 of_84))
; 
; =  {sc.input.V[12].O} {sc.vadd[5].OUT2_0}
(assert (= sc_135 sc_88))
; 
; =  {of.input.V[12].O} {of.vadd[5].OUT2_0}
(assert (= of_135 of_88))
; 
; =  {sc.input.I[2].O} {sc.ihill[7].S}
(assert (= sc_32 sc_96))
; 
; =  {of.input.I[2].O} {of.ihill[7].S}
(assert (= of_32 of_96))
; 
; =  {sc.iadd[20].OUT} {sc.switch[19].SUB}
(assert (= sc_199 sc_27))
; 
; =  {of.iadd[20].OUT} {of.switch[19].SUB}
(assert (= of_199 of_27))
; 
; =  {sc.input.V[2].O} {sc.vgain[15].X}
(assert (= sc_123 sc_12))
; 
; =  {of.input.V[2].O} {of.vgain[15].X}
(assert (= of_123 of_12))
; 
; =  {sc.input.V[3].O} {sc.vgain[11].Z}
(assert (= sc_161 sc_6))
; 
; =  {of.input.V[3].O} {of.vgain[11].Z}
(assert (= of_161 of_6))
; 
; =  {sc.ihill[7].REP} {sc.itov[1].K}
(assert (= sc_100 sc_190))
; 
; =  {of.ihill[7].REP} {of.itov[1].K}
(assert (= of_100 of_190))
; 
; =  {sc.vgain[9].P} {sc.vtoi[8].X}
(assert (= sc_3 sc_107))
; 
; =  {of.vgain[9].P} {of.vtoi[8].X}
(assert (= of_3 of_107))
; 
; =  {sc.input.V[19].O} {sc.vgain[9].X}
(assert (= sc_177 sc_0))
; 
; =  {of.input.V[19].O} {of.vgain[9].X}
(assert (= of_177 of_0))
; 
; =  {sc.vgain[11].P} {sc.vgain[10].Y}
(assert (= sc_7 sc_9))
; 
; =  {of.vgain[11].P} {of.vgain[10].Y}
(assert (= of_7 of_9))
; 
; =  {sc.input.I[15].O} {sc.switch[17].Vmax}
(assert (= sc_50 sc_24))
; 
; =  {of.input.I[15].O} {of.switch[17].Vmax}
(assert (= of_50 of_24))
; 
; =  {sc.input.I[1].O} {sc.ihill[0].Km}
(assert (= sc_70 sc_103))
; 
; =  {of.input.I[1].O} {of.ihill[0].Km}
(assert (= of_70 of_103))
; 
; =  {sc.input.V[1].O} {sc.vgain[10].Z}
(assert (= sc_171 sc_10))
; 
; =  {of.input.V[1].O} {of.vgain[10].Z}
(assert (= of_171 of_10))
; 
; =  {sc.input.I[13].O} {sc.switch[3].Kmod}
(assert (= sc_38 sc_18))
; 
; =  {of.input.I[13].O} {of.switch[3].Kmod}
(assert (= of_38 of_18))
; 
; =  {sc.input.V[7].O} {sc.ihill[7].n}
(assert (= sc_131 sc_95))
; 
; =  {of.input.V[7].O} {of.ihill[7].n}
(assert (= of_131 of_95))
; 
; =  {sc.input.I[17].O} {sc.switch[19].Vmax}
(assert (= sc_72 sc_29))
; 
; =  {of.input.I[17].O} {of.switch[19].Vmax}
(assert (= of_72 of_29))
; 
; =  {sc.input.V[25].O} {sc.itov[16].K}
(assert (= sc_169 sc_184))
; 
; =  {of.input.V[25].O} {of.itov[16].K}
(assert (= of_169 of_184))
; 
; =  {sc.itov[18].Y} {sc.vgain[11].Y}
(assert (= sc_194 sc_5))
; 
; =  {of.itov[18].Y} {of.vgain[11].Y}
(assert (= of_194 of_5))
; 
; =  {sc.vgain[10].P} {sc.vtoi[8].K}
(assert (= sc_11 sc_108))
; 
; =  {of.vgain[10].P} {of.vtoi[8].K}
(assert (= of_11 of_108))
; 
; =  {sc.input.V[24].O} {sc.vgain[15].Y}
(assert (= sc_157 sc_13))
; 
; =  {of.input.V[24].O} {of.vgain[15].Y}
(assert (= of_157 of_13))
; 
; =  {sc.vtoi[8].Y} {sc.ihill[7].Vmax}
(assert (= sc_109 sc_98))
; 
; =  {of.vtoi[8].Y} {of.ihill[7].Vmax}
(assert (= of_109 of_98))
; 
; =  {sc.input.V[0].O} {sc.vtoi[6].X}
(assert (= sc_139 sc_113))
; 
; =  {of.input.V[0].O} {of.vtoi[6].X}
(assert (= of_139 of_113))
; 
; =  {sc.input.V[10].O} {sc.vadd[5].A}
(assert (= sc_143 sc_91))
; 
; =  {of.input.V[10].O} {of.vadd[5].A}
(assert (= of_143 of_91))
; 
; =  {sc.input.V[18].O} {sc.ihill[0].n}
(assert (= sc_175 sc_101))
; 
; =  {of.input.V[18].O} {of.ihill[0].n}
(assert (= of_175 of_101))
; 
; =  {sc.itov[4].Y} {sc.vadd[5].B}
(assert (= sc_188 sc_92))
; 
; =  {of.itov[4].Y} {of.vadd[5].B}
(assert (= of_188 of_92))
; 
; =  {sc.input.V[4].O} {sc.vgain[9].Z}
(assert (= sc_163 sc_2))
; 
; =  {of.input.V[4].O} {of.vgain[9].Z}
(assert (= of_163 of_2))
; 
; =  {sc.input.V[26].O} {sc.itov[18].K}
(assert (= sc_145 sc_193))
; 
; =  {of.input.V[26].O} {of.itov[18].K}
(assert (= of_145 of_193))
; 
; =  {sc.input.I[19].O} {sc.iadd[20].D}
(assert (= sc_76 sc_195))
; 
; =  {of.input.I[19].O} {of.iadd[20].D}
(assert (= of_76 of_195))
(assert (<= (* sc_78 0.001) 0.001))
(assert (<= (* sc_80 0.001) 0.001))
; 
; =  {sc.vadd[5].OUT2} {sc.output.V[0].O} {sc.vadd[2].OUT2} {sc.output.V[1].O}
(assert (and (and (= sc_94 sc_78) (= sc_94 sc_87)) (= sc_94 sc_80)))
(assert (= __minima__ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (ite (>= sltop_77 0.) sltop_77 (- sltop_77)) (ite (>= slbot_92 0.) slbot_92 (- slbot_92))) (ite (>= slbot_14 0.) slbot_14 (- slbot_14))) (ite (>= sltop_1 0.) sltop_1 (- sltop_1))) (ite (>= sltop_199 0.) sltop_199 (- sltop_199))) (ite (>= sltop_14 0.) sltop_14 (- sltop_14))) (ite (>= slbot_44 0.) slbot_44 (- slbot_44))) (ite (>= sltop_32 0.) sltop_32 (- sltop_32))) (ite (>= slbot_183 0.) slbot_183 (- slbot_183))) (ite (>= slbot_20 0.) slbot_20 (- slbot_20))) (ite (>= slbot_103 0.) slbot_103 (- slbot_103))) (ite (>= sltop_190 0.) sltop_190 (- sltop_190))) (ite (>= sltop_112 0.) sltop_112 (- sltop_112))) (ite (>= slbot_199 0.) slbot_199 (- slbot_199))) (ite (>= sltop_109 0.) sltop_109 (- sltop_109))) (ite (>= slbot_96 0.) slbot_96 (- slbot_96))) (ite (>= slbot_99 0.) slbot_99 (- slbot_99))) (ite (>= sltop_31 0.) sltop_31 (- sltop_31))) (ite (>= slbot_115 0.) slbot_115 (- slbot_115))) (ite (>= slbot_203 0.) slbot_203 (- slbot_203))) (ite (>= sltop_100 0.) sltop_100 (- sltop_100))) (ite (>= slbot_209 0.) slbot_209 (- slbot_209))) (ite (>= slbot_98 0.) slbot_98 (- slbot_98))) (ite (>= slbot_108 0.) slbot_108 (- slbot_108))) (ite (>= slbot_138 0.) slbot_138 (- slbot_138))) (ite (>= slbot_87 0.) slbot_87 (- slbot_87))) (ite (>= sltop_115 0.) sltop_115 (- sltop_115))) (ite (>= slbot_121 0.) slbot_121 (- slbot_121))) (ite (>= sltop_180 0.) sltop_180 (- sltop_180))) (ite (>= sltop_17 0.) sltop_17 (- sltop_17))) (ite (>= slbot_110 0.) slbot_110 (- slbot_110))) (ite (>= slbot_185 0.) slbot_185 (- slbot_185))) (ite (>= sltop_188 0.) sltop_188 (- sltop_188))) (ite (>= sltop_213 0.) sltop_213 (- sltop_213))) (ite (>= slbot_27 0.) slbot_27 (- slbot_27))) (ite (>= slbot_7 0.) slbot_7 (- slbot_7))) (ite (>= sltop_119 0.) sltop_119 (- sltop_119))) (ite (>= sltop_139 0.) sltop_139 (- sltop_139))) (ite (>= slbot_22 0.) slbot_22 (- slbot_22))) (ite (>= slbot_32 0.) slbot_32 (- slbot_32))) (ite (>= slbot_11 0.) slbot_11 (- slbot_11))) (ite (>= slbot_198 0.) slbot_198 (- slbot_198))) (ite (>= sltop_80 0.) sltop_80 (- sltop_80))) (ite (>= slbot_112 0.) slbot_112 (- slbot_112))) (ite (>= sltop_79 0.) sltop_79 (- sltop_79))) (ite (>= slbot_188 0.) slbot_188 (- slbot_188))) (ite (>= sltop_107 0.) sltop_107 (- sltop_107))) (ite (>= sltop_7 0.) sltop_7 (- sltop_7))) (ite (>= slbot_15 0.) slbot_15 (- slbot_15))) (ite (>= sltop_92 0.) sltop_92 (- sltop_92))) (ite (>= slbot_117 0.) slbot_117 (- slbot_117))) (ite (>= sltop_117 0.) sltop_117 (- sltop_117))) (ite (>= slbot_106 0.) slbot_106 (- slbot_106))) (ite (>= sltop_98 0.) sltop_98 (- sltop_98))) (ite (>= slbot_9 0.) slbot_9 (- slbot_9))) (ite (>= sltop_102 0.) sltop_102 (- sltop_102))) (ite (>= slbot_70 0.) slbot_70 (- slbot_70))) (ite (>= slbot_100 0.) slbot_100 (- slbot_100))) (ite (>= slbot_118 0.) slbot_118 (- slbot_118))) (ite (>= sltop_30 0.) sltop_30 (- sltop_30))) (ite (>= sltop_69 0.) sltop_69 (- sltop_69))) (ite (>= slbot_187 0.) slbot_187 (- slbot_187))) (ite (>= slbot_205 0.) slbot_205 (- slbot_205))) (ite (>= sltop_43 0.) sltop_43 (- sltop_43))) (ite (>= slbot_102 0.) slbot_102 (- slbot_102))) (ite (>= sltop_108 0.) sltop_108 (- sltop_108))) (ite (>= sltop_113 0.) sltop_113 (- sltop_113))) (ite (>= sltop_191 0.) sltop_191 (- sltop_191))) (ite (>= slbot_1 0.) slbot_1 (- slbot_1))) (ite (>= sltop_187 0.) sltop_187 (- sltop_187))) (ite (>= sltop_192 0.) sltop_192 (- sltop_192))) (ite (>= sltop_96 0.) sltop_96 (- sltop_96))) (ite (>= slbot_80 0.) slbot_80 (- slbot_80))) (ite (>= sltop_87 0.) sltop_87 (- sltop_87))) (ite (>= sltop_183 0.) sltop_183 (- sltop_183))) (ite (>= sltop_27 0.) sltop_27 (- sltop_27))) (ite (>= slbot_107 0.) slbot_107 (- slbot_107))) (ite (>= slbot_3 0.) slbot_3 (- slbot_3))) (ite (>= slbot_191 0.) slbot_191 (- slbot_191))) (ite (>= slbot_119 0.) slbot_119 (- slbot_119))) (ite (>= sltop_138 0.) sltop_138 (- sltop_138))) (ite (>= slbot_85 0.) slbot_85 (- slbot_85))) (ite (>= sltop_121 0.) sltop_121 (- sltop_121))) (ite (>= sltop_22 0.) sltop_22 (- sltop_22))) (ite (>= sltop_15 0.) sltop_15 (- sltop_15))) (ite (>= sltop_94 0.) sltop_94 (- sltop_94))) (ite (>= sltop_85 0.) sltop_85 (- sltop_85))) (ite (>= slbot_190 0.) slbot_190 (- slbot_190))) (ite (>= slbot_192 0.) slbot_192 (- slbot_192))) (ite (>= sltop_9 0.) sltop_9 (- sltop_9))) (ite (>= slbot_214 0.) slbot_214 (- slbot_214))) (ite (>= slbot_5 0.) slbot_5 (- slbot_5))) (ite (>= sltop_110 0.) sltop_110 (- sltop_110))) (ite (>= sltop_19 0.) sltop_19 (- sltop_19))) (ite (>= sltop_86 0.) sltop_86 (- sltop_86))) (ite (>= slbot_77 0.) slbot_77 (- slbot_77))) (ite (>= sltop_198 0.) sltop_198 (- sltop_198))) (ite (>= sltop_204 0.) sltop_204 (- sltop_204))) (ite (>= slbot_79 0.) slbot_79 (- slbot_79))) (ite (>= sltop_3 0.) sltop_3 (- sltop_3))) (ite (>= slbot_139 0.) slbot_139 (- slbot_139))) (ite (>= slbot_69 0.) slbot_69 (- slbot_69))) (ite (>= sltop_99 0.) sltop_99 (- sltop_99))) (ite (>= slbot_194 0.) slbot_194 (- slbot_194))) (ite (>= sltop_118 0.) sltop_118 (- sltop_118))) (ite (>= slbot_78 0.) slbot_78 (- slbot_78))) (ite (>= sltop_11 0.) sltop_11 (- sltop_11))) (ite (>= sltop_70 0.) sltop_70 (- sltop_70))) (ite (>= slbot_19 0.) slbot_19 (- slbot_19))) (ite (>= slbot_109 0.) slbot_109 (- slbot_109))) (ite (>= slbot_213 0.) slbot_213 (- slbot_213))) (ite (>= sltop_44 0.) sltop_44 (- sltop_44))) (ite (>= slbot_182 0.) slbot_182 (- slbot_182))) (ite (>= sltop_209 0.) sltop_209 (- sltop_209))) (ite (>= slbot_17 0.) slbot_17 (- slbot_17))) (ite (>= slbot_180 0.) slbot_180 (- slbot_180))) (ite (>= slbot_31 0.) slbot_31 (- slbot_31))) (ite (>= slbot_113 0.) slbot_113 (- slbot_113))) (ite (>= slbot_25 0.) slbot_25 (- slbot_25))) (ite (>= sltop_20 0.) sltop_20 (- sltop_20))) (ite (>= sltop_5 0.) sltop_5 (- sltop_5))) (ite (>= sltop_103 0.) sltop_103 (- sltop_103))) (ite (>= sltop_203 0.) sltop_203 (- sltop_203))) (ite (>= slbot_93 0.) slbot_93 (- slbot_93))) (ite (>= slbot_30 0.) slbot_30 (- slbot_30))) (ite (>= slbot_86 0.) slbot_86 (- slbot_86))) (ite (>= sltop_97 0.) sltop_97 (- sltop_97))) (ite (>= sltop_205 0.) sltop_205 (- sltop_205))) (ite (>= slbot_43 0.) slbot_43 (- slbot_43))) (ite (>= sltop_78 0.) sltop_78 (- sltop_78))) (ite (>= slbot_94 0.) slbot_94 (- slbot_94))) (ite (>= sltop_93 0.) sltop_93 (- sltop_93))) (ite (>= sltop_194 0.) sltop_194 (- sltop_194))) (ite (>= sltop_182 0.) sltop_182 (- sltop_182))) (ite (>= slbot_204 0.) slbot_204 (- slbot_204))) (ite (>= sltop_25 0.) sltop_25 (- sltop_25))) (ite (>= sltop_106 0.) sltop_106 (- sltop_106))) (ite (>= sltop_185 0.) sltop_185 (- sltop_185))) (ite (>= sltop_214 0.) sltop_214 (- sltop_214))) (ite (>= slbot_97 0.) slbot_97 (- slbot_97)))))
(check-sat)
