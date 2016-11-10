(set-logic QF_NRA)
(declare-fun __minima__ () Real)
(declare-fun sc_0 () Real)
(declare-fun of_0 () Real)
(declare-fun sc_1 () Real)
(declare-fun of_1 () Real)
(declare-fun sc_2 () Real)
(declare-fun of_2 () Real)
(declare-fun sc_3 () Real)
(declare-fun of_3 () Real)
(assert (= sc_3 1))
(assert (= of_3 0))
; 
; =  {sc.vgain[1].P} {((sc.vgain[1].X/sc.vgain[1].Y)*sc.vgain[1].Z*1)}
(assert (= sc_3 (* (* (/ sc_0 sc_1) sc_2) 1)))
; 
; =  {of.vgain[1].P} {0}
(assert (= of_3 0.))
; 
; >=  {((sc.vgain[1].X*1.)+of.vgain[1].X)} {3300.}
(assert (<= (+ (* sc_0 1.) of_0) 3300.))
; 
; <=  {((sc.vgain[1].X*1.)+of.vgain[1].X)} {0.0001}
(assert (>= (+ (* sc_0 1.) of_0) 0.0001))
; 
; >=  {((sc.vgain[1].Y*0.125)+of.vgain[1].Y)} {3300.}
(assert (<= (+ (* sc_1 0.125) of_1) 3300.))
; 
; <=  {((sc.vgain[1].Y*0.125)+of.vgain[1].Y)} {1.}
(assert (>= (+ (* sc_1 0.125) of_1) 1.))
(declare-fun slbot_3 () Real)
(declare-fun sltop_3 () Real)
; 
; =  {(((sc.vgain[1].P*0.)+of.vgain[1].P)+sl.min.vgain[1].P)} {1.51515151515e-12}
(assert (= (+ (+ (* sc_3 0.) of_3) slbot_3) 1.51515151515e-12))
; 
; =  {(((sc.vgain[1].P*4.)+of.vgain[1].P)+sl.max.vgain[1].P)} {5445000.}
(assert (= (+ (+ (* sc_3 4.) of_3) sltop_3) 5445000.))
(declare-fun slbot_2 () Real)
(declare-fun sltop_2 () Real)
; 
; =  {(((sc.vgain[1].Z*0.)+of.vgain[1].Z)+sl.min.vgain[1].Z)} {0.0001}
(assert (= (+ (+ (* sc_2 0.) of_2) slbot_2) 0.0001))
; 
; =  {(((sc.vgain[1].Z*1.)+of.vgain[1].Z)+sl.max.vgain[1].Z)} {3300.}
(assert (= (+ (+ (* sc_2 1.) of_2) sltop_2) 3300.))
(declare-fun sc_4 () Real)
(declare-fun of_4 () Real)
(declare-fun sc_5 () Real)
(declare-fun of_5 () Real)
(declare-fun sc_6 () Real)
(declare-fun of_6 () Real)
(declare-fun sc_7 () Real)
(declare-fun of_7 () Real)
(declare-fun sc_8 () Real)
(declare-fun of_8 () Real)
(assert (= sc_8 1))
(assert (= of_8 0))
; 
; =  {sc.switch[0].PROD} {(sc.switch[0].Vmax/1)}
(assert (= sc_8 (/ sc_7 1)))
; 
; =  {of.switch[0].PROD} {0}
(assert (= of_8 0.))
; 
; >=  {((sc.switch[0].n*0.)+of.switch[0].n)} {5.}
(assert (<= (+ (* sc_5 0.) of_5) 5.))
; 
; <=  {((sc.switch[0].n*0.)+of.switch[0].n)} {0.5}
(assert (>= (+ (* sc_5 0.) of_5) 0.5))
(declare-fun slbot_7 () Real)
(declare-fun sltop_7 () Real)
; 
; =  {(((sc.switch[0].Vmax*0.)+of.switch[0].Vmax)+sl.min.switch[0].Vmax)} {0.0001}
(assert (= (+ (+ (* sc_7 0.) of_7) slbot_7) 0.0001))
; 
; =  {(((sc.switch[0].Vmax*1.)+of.switch[0].Vmax)+sl.max.switch[0].Vmax)} {10.}
(assert (= (+ (+ (* sc_7 1.) of_7) sltop_7) 10.))
(declare-fun slbot_8 () Real)
(declare-fun sltop_8 () Real)
; 
; =  {(((sc.switch[0].PROD*0.)+of.switch[0].PROD)+sl.min.switch[0].PROD)} {6.20921323059e-10}
(assert (= (+ (+ (* sc_8 0.) of_8) slbot_8) 6.20921323059e-10))
; 
; =  {(((sc.switch[0].PROD*1.)+of.switch[0].PROD)+sl.max.switch[0].PROD)} {9.99995000037}
(assert (= (+ (+ (* sc_8 1.) of_8) sltop_8) 9.99995000037))
(declare-fun sc_9 () Real)
(declare-fun of_9 () Real)
(declare-fun sc_10 () Real)
(declare-fun of_10 () Real)
(assert (= sc_10 1))
(assert (= of_10 0))
; 
; =  {sc.input.I[2].O} {sc.input.I[2].X}
(assert (= sc_10 sc_9))
; 
; =  {of.input.I[2].O} {of.input.I[2].X}
(assert (= of_10 of_9))
; 
; >=  {((sc.input.I[2].X*0.15)+of.input.I[2].X)} {10.}
(assert (<= (+ (* sc_9 0.15) of_9) 10.))
; 
; <=  {((sc.input.I[2].X*0.15)+of.input.I[2].X)} {0.}
(assert (>= (+ (* sc_9 0.15) of_9) 0.))
; 
; >=  {((sc.input.I[2].O*0.15)+of.input.I[2].O)} {10.}
(assert (<= (+ (* sc_10 0.15) of_10) 10.))
; 
; <=  {((sc.input.I[2].O*0.15)+of.input.I[2].O)} {0.}
(assert (>= (+ (* sc_10 0.15) of_10) 0.))
(declare-fun sc_11 () Real)
(declare-fun of_11 () Real)
(declare-fun sc_12 () Real)
(declare-fun of_12 () Real)
(assert (= sc_12 1))
(assert (= of_12 0))
; 
; =  {sc.input.I[0].O} {sc.input.I[0].X}
(assert (= sc_12 sc_11))
; 
; =  {of.input.I[0].O} {of.input.I[0].X}
(assert (= of_12 of_11))
; 
; >=  {((sc.input.I[0].X*0.)+of.input.I[0].X)} {10.}
(assert (<= (+ (* sc_11 0.) of_11) 10.))
; 
; <=  {((sc.input.I[0].X*0.)+of.input.I[0].X)} {0.}
(assert (>= (+ (* sc_11 0.) of_11) 0.))
; 
; >=  {((sc.input.I[0].O*0.)+of.input.I[0].O)} {10.}
(assert (<= (+ (* sc_12 0.) of_12) 10.))
; 
; <=  {((sc.input.I[0].O*0.)+of.input.I[0].O)} {0.}
(assert (>= (+ (* sc_12 0.) of_12) 0.))
(declare-fun sc_13 () Real)
(declare-fun of_13 () Real)
(declare-fun sc_14 () Real)
(declare-fun of_14 () Real)
(assert (= sc_14 1))
(assert (= of_14 0))
; 
; =  {sc.input.I[3].O} {sc.input.I[3].X}
(assert (= sc_14 sc_13))
; 
; =  {of.input.I[3].O} {of.input.I[3].X}
(assert (= of_14 of_13))
; 
; >=  {((sc.input.I[3].X*1.)+of.input.I[3].X)} {10.}
(assert (<= (+ (* sc_13 1.) of_13) 10.))
; 
; <=  {((sc.input.I[3].X*1.)+of.input.I[3].X)} {0.}
(assert (>= (+ (* sc_13 1.) of_13) 0.))
; 
; >=  {((sc.input.I[3].O*1.)+of.input.I[3].O)} {10.}
(assert (<= (+ (* sc_14 1.) of_14) 10.))
; 
; <=  {((sc.input.I[3].O*1.)+of.input.I[3].O)} {0.}
(assert (>= (+ (* sc_14 1.) of_14) 0.))
(declare-fun sc_15 () Real)
(declare-fun of_15 () Real)
(declare-fun sc_16 () Real)
(declare-fun of_16 () Real)
(assert (= sc_16 1))
(assert (= of_16 0))
; 
; =  {sc.input.I[4].O} {sc.input.I[4].X}
(assert (= sc_16 sc_15))
; 
; =  {of.input.I[4].O} {of.input.I[4].X}
(assert (= of_16 of_15))
; 
; >=  {((sc.input.I[4].X*1.)+of.input.I[4].X)} {10.}
(assert (<= (+ (* sc_15 1.) of_15) 10.))
; 
; <=  {((sc.input.I[4].X*1.)+of.input.I[4].X)} {0.}
(assert (>= (+ (* sc_15 1.) of_15) 0.))
; 
; >=  {((sc.input.I[4].O*1.)+of.input.I[4].O)} {10.}
(assert (<= (+ (* sc_16 1.) of_16) 10.))
; 
; <=  {((sc.input.I[4].O*1.)+of.input.I[4].O)} {0.}
(assert (>= (+ (* sc_16 1.) of_16) 0.))
(declare-fun sc_17 () Real)
(declare-fun of_17 () Real)
(declare-fun sc_18 () Real)
(declare-fun of_18 () Real)
(assert (= sc_18 1))
(assert (= of_18 0))
; 
; =  {sc.input.I[1].O} {sc.input.I[1].X}
(assert (= sc_18 sc_17))
; 
; =  {of.input.I[1].O} {of.input.I[1].X}
(assert (= of_18 of_17))
; 
; >=  {((sc.input.I[1].X*0.)+of.input.I[1].X)} {10.}
(assert (<= (+ (* sc_17 0.) of_17) 10.))
; 
; <=  {((sc.input.I[1].X*0.)+of.input.I[1].X)} {0.}
(assert (>= (+ (* sc_17 0.) of_17) 0.))
; 
; >=  {((sc.input.I[1].O*0.)+of.input.I[1].O)} {10.}
(assert (<= (+ (* sc_18 0.) of_18) 10.))
; 
; <=  {((sc.input.I[1].O*0.)+of.input.I[1].O)} {0.}
(assert (>= (+ (* sc_18 0.) of_18) 0.))
(declare-fun sc_19 () Real)
(declare-fun of_19 () Real)
(declare-fun sc_20 () Real)
(declare-fun of_20 () Real)
(assert (= sc_20 1))
(assert (= of_20 0))
; 
; =  {sc.output.V[2].O} {sc.output.V[2].X}
(assert (= sc_20 sc_19))
; 
; =  {of.output.V[2].O} {of.output.V[2].X}
(assert (= of_20 of_19))
(declare-fun slbot_19 () Real)
(declare-fun sltop_19 () Real)
; 
; =  {(((sc.output.V[2].X*0.)+of.output.V[2].X)+sl.min.output.V[2].X)} {0.0001}
(assert (= (+ (+ (* sc_19 0.) of_19) slbot_19) 0.0001))
; 
; =  {(((sc.output.V[2].X*1.)+of.output.V[2].X)+sl.max.output.V[2].X)} {3300.}
(assert (= (+ (+ (* sc_19 1.) of_19) sltop_19) 3300.))
(declare-fun slbot_20 () Real)
(declare-fun sltop_20 () Real)
; 
; =  {(((sc.output.V[2].O*0.)+of.output.V[2].O)+sl.min.output.V[2].O)} {0.0001}
(assert (= (+ (+ (* sc_20 0.) of_20) slbot_20) 0.0001))
; 
; =  {(((sc.output.V[2].O*1.)+of.output.V[2].O)+sl.max.output.V[2].O)} {3300.}
(assert (= (+ (+ (* sc_20 1.) of_20) sltop_20) 3300.))
(declare-fun sc_21 () Real)
(declare-fun of_21 () Real)
(declare-fun sc_22 () Real)
(declare-fun of_22 () Real)
(assert (= sc_22 1))
(assert (= of_22 0))
; 
; =  {sc.output.V[0].O} {sc.output.V[0].X}
(assert (= sc_22 sc_21))
; 
; =  {of.output.V[0].O} {of.output.V[0].X}
(assert (= of_22 of_21))
(declare-fun slbot_21 () Real)
(declare-fun sltop_21 () Real)
; 
; =  {(((sc.output.V[0].X*0.)+of.output.V[0].X)+sl.min.output.V[0].X)} {0.0001}
(assert (= (+ (+ (* sc_21 0.) of_21) slbot_21) 0.0001))
; 
; =  {(((sc.output.V[0].X*1.)+of.output.V[0].X)+sl.max.output.V[0].X)} {3300.}
(assert (= (+ (+ (* sc_21 1.) of_21) sltop_21) 3300.))
(declare-fun slbot_22 () Real)
(declare-fun sltop_22 () Real)
; 
; =  {(((sc.output.V[0].O*0.)+of.output.V[0].O)+sl.min.output.V[0].O)} {0.0001}
(assert (= (+ (+ (* sc_22 0.) of_22) slbot_22) 0.0001))
; 
; =  {(((sc.output.V[0].O*1.)+of.output.V[0].O)+sl.max.output.V[0].O)} {3300.}
(assert (= (+ (+ (* sc_22 1.) of_22) sltop_22) 3300.))
(declare-fun sc_23 () Real)
(declare-fun of_23 () Real)
(declare-fun sc_24 () Real)
(declare-fun of_24 () Real)
(assert (= sc_24 1))
(assert (= of_24 0))
; 
; =  {sc.output.V[3].O} {sc.output.V[3].X}
(assert (= sc_24 sc_23))
; 
; =  {of.output.V[3].O} {of.output.V[3].X}
(assert (= of_24 of_23))
(declare-fun slbot_23 () Real)
(declare-fun sltop_23 () Real)
; 
; =  {(((sc.output.V[3].X*0.)+of.output.V[3].X)+sl.min.output.V[3].X)} {0.0001}
(assert (= (+ (+ (* sc_23 0.) of_23) slbot_23) 0.0001))
; 
; =  {(((sc.output.V[3].X*1.)+of.output.V[3].X)+sl.max.output.V[3].X)} {3300.}
(assert (= (+ (+ (* sc_23 1.) of_23) sltop_23) 3300.))
(declare-fun slbot_24 () Real)
(declare-fun sltop_24 () Real)
; 
; =  {(((sc.output.V[3].O*0.)+of.output.V[3].O)+sl.min.output.V[3].O)} {0.0001}
(assert (= (+ (+ (* sc_24 0.) of_24) slbot_24) 0.0001))
; 
; =  {(((sc.output.V[3].O*1.)+of.output.V[3].O)+sl.max.output.V[3].O)} {3300.}
(assert (= (+ (+ (* sc_24 1.) of_24) sltop_24) 3300.))
(declare-fun sc_25 () Real)
(declare-fun of_25 () Real)
(declare-fun sc_26 () Real)
(declare-fun of_26 () Real)
(assert (= sc_26 1))
(assert (= of_26 0))
; 
; =  {sc.output.V[1].O} {sc.output.V[1].X}
(assert (= sc_26 sc_25))
; 
; =  {of.output.V[1].O} {of.output.V[1].X}
(assert (= of_26 of_25))
(declare-fun slbot_25 () Real)
(declare-fun sltop_25 () Real)
; 
; =  {(((sc.output.V[1].X*0.)+of.output.V[1].X)+sl.min.output.V[1].X)} {0.0001}
(assert (= (+ (+ (* sc_25 0.) of_25) slbot_25) 0.0001))
; 
; =  {(((sc.output.V[1].X*1.)+of.output.V[1].X)+sl.max.output.V[1].X)} {3300.}
(assert (= (+ (+ (* sc_25 1.) of_25) sltop_25) 3300.))
(declare-fun slbot_26 () Real)
(declare-fun sltop_26 () Real)
; 
; =  {(((sc.output.V[1].O*0.)+of.output.V[1].O)+sl.min.output.V[1].O)} {0.0001}
(assert (= (+ (+ (* sc_26 0.) of_26) slbot_26) 0.0001))
; 
; =  {(((sc.output.V[1].O*1.)+of.output.V[1].O)+sl.max.output.V[1].O)} {3300.}
(assert (= (+ (+ (* sc_26 1.) of_26) sltop_26) 3300.))
(declare-fun sc_27 () Real)
(declare-fun of_27 () Real)
(declare-fun sc_28 () Real)
(declare-fun of_28 () Real)
(declare-fun sc_29 () Real)
(declare-fun of_29 () Real)
(declare-fun sc_30 () Real)
(declare-fun of_30 () Real)
(declare-fun sc_31 () Real)
(declare-fun of_31 () Real)
(declare-fun sc_32 () Real)
(declare-fun of_32 () Real)
(declare-fun sc_33 () Real)
(declare-fun of_33 () Real)
(assert (= sc_32 1))
(assert (= of_32 0))
; 
; =  {sc.vadd[2].OUT} {(sc.vadd[2].A*1)}
(assert (= sc_32 (* sc_30 1)))
; 
; =  {of.vadd[2].OUT} {0}
(assert (= of_32 0.))
(assert (= sc_33 1))
(assert (= of_33 0))
; 
; =  {sc.vadd[2].OUT2} {(sc.vadd[2].A*1)}
(assert (= sc_33 (* sc_30 1)))
(assert (= of_33 0))
(assert (= 0. 0))
; 
; =  {sc.vadd[2].OUT2_0} {(sc.vadd[2].A*1)}
(assert (= sc_27 (* sc_30 1)))
; 
; =  {of.vadd[2].OUT2_0} {0}
(assert (= of_27 0.))
; 
; >=  {((sc.vadd[2].OUT2_0*0.)+of.vadd[2].OUT2_0)} {3300.}
(assert (<= (+ (* sc_27 0.) of_27) 3300.))
; 
; <=  {((sc.vadd[2].OUT2_0*0.)+of.vadd[2].OUT2_0)} {0.}
(assert (>= (+ (* sc_27 0.) of_27) 0.))
; 
; >=  {((sc.vadd[2].D*4.)+of.vadd[2].D)} {3300.}
(assert (<= (+ (* sc_28 4.) of_28) 3300.))
; 
; <=  {((sc.vadd[2].D*4.)+of.vadd[2].D)} {0.0001}
(assert (>= (+ (* sc_28 4.) of_28) 0.0001))
; 
; >=  {((sc.vadd[2].C*0.)+of.vadd[2].C)} {3300.}
(assert (<= (+ (* sc_29 0.) of_29) 3300.))
; 
; <=  {((sc.vadd[2].C*0.)+of.vadd[2].C)} {0.0001}
(assert (>= (+ (* sc_29 0.) of_29) 0.0001))
; 
; >=  {((sc.vadd[2].A*0.)+of.vadd[2].A)} {3300.}
(assert (<= (+ (* sc_30 0.) of_30) 3300.))
; 
; <=  {((sc.vadd[2].A*0.)+of.vadd[2].A)} {0.0001}
(assert (>= (+ (* sc_30 0.) of_30) 0.0001))
(declare-fun slbot_33 () Real)
(declare-fun sltop_33 () Real)
; 
; =  {(((sc.vadd[2].OUT2*0.)+of.vadd[2].OUT2)+sl.min.vadd[2].OUT2)} {0.}
(assert (= (+ (+ (* sc_33 0.) of_33) slbot_33) 0.))
; 
; =  {(((sc.vadd[2].OUT2*1.)+of.vadd[2].OUT2)+sl.max.vadd[2].OUT2)} {5.}
(assert (= (+ (+ (* sc_33 1.) of_33) sltop_33) 5.))
(declare-fun slbot_31 () Real)
(declare-fun sltop_31 () Real)
; 
; =  {(((sc.vadd[2].B*0.)+of.vadd[2].B)+sl.min.vadd[2].B)} {0.0001}
(assert (= (+ (+ (* sc_31 0.) of_31) slbot_31) 0.0001))
; 
; =  {(((sc.vadd[2].B*4.)+of.vadd[2].B)+sl.max.vadd[2].B)} {3300.}
(assert (= (+ (+ (* sc_31 4.) of_31) sltop_31) 3300.))
(declare-fun slbot_32 () Real)
(declare-fun sltop_32 () Real)
; 
; =  {(((sc.vadd[2].OUT*0.)+of.vadd[2].OUT)+sl.min.vadd[2].OUT)} {-1649.99995}
(assert (= (+ (+ (* sc_32 0.) of_32) slbot_32) -1649.99995))
; 
; =  {(((sc.vadd[2].OUT*4.)+of.vadd[2].OUT)+sl.max.vadd[2].OUT)} {1649.99995}
(assert (= (+ (+ (* sc_32 4.) of_32) sltop_32) 1649.99995))
(declare-fun slbot_33 () Real)
(declare-fun sltop_33 () Real)
; 
; =  {(((sc.vadd[2].OUT2*0.)+of.vadd[2].OUT2)+sl.min.vadd[2].OUT2)} {0.}
(assert (= (+ (+ (* sc_33 0.) of_33) slbot_33) 0.))
; 
; =  {(((sc.vadd[2].OUT2*1.)+of.vadd[2].OUT2)+sl.max.vadd[2].OUT2)} {5.}
(assert (= (+ (+ (* sc_33 1.) of_33) sltop_33) 5.))
(declare-fun sc_34 () Real)
(declare-fun of_34 () Real)
(declare-fun sc_35 () Real)
(declare-fun of_35 () Real)
(declare-fun sc_36 () Real)
(declare-fun of_36 () Real)
(declare-fun sc_37 () Real)
(declare-fun of_37 () Real)
(declare-fun sc_38 () Real)
(declare-fun of_38 () Real)
(declare-fun sc_39 () Real)
(declare-fun of_39 () Real)
(declare-fun sc_40 () Real)
(declare-fun of_40 () Real)
(declare-fun sc_41 () Real)
(declare-fun of_41 () Real)
(assert (= sc_39 1))
(assert (= of_39 0))
; 
; =  {sc.mm[0].X} {sc.mm[0].Xtot}
(assert (= sc_39 sc_38))
; 
; =  {of.mm[0].X} {(of.mm[0].Xtot-of.mm[0].XY)}
(assert (= of_39 (- of_38 of_40)))
(assert (= sc_40 1))
(assert (= of_40 0))
; 
; =  {sc.mm[0].XY} {(sc.mm[0].kf*sc.mm[0].X*sc.mm[0].Y)}
(assert (= sc_40 (* (* sc_37 sc_39) sc_41)))
(assert (= of_40 0))
(assert (= 0. 0))
; 
; =  {sc.mm[0].XY0} {(sc.mm[0].kf*sc.mm[0].X*sc.mm[0].Y)}
(assert (= sc_35 (* (* sc_37 sc_39) sc_41)))
; 
; =  {of.mm[0].XY0} {(0-0)}
(assert (= of_35 0.))
(assert (= sc_41 1))
(assert (= of_41 0))
; 
; =  {sc.mm[0].Y} {sc.mm[0].Ytot}
(assert (= sc_41 sc_36))
; 
; =  {of.mm[0].Y} {(of.mm[0].Ytot-of.mm[0].XY)}
(assert (= of_41 (- of_36 of_40)))
; 
; >=  {((sc.mm[0].kr*1.)+of.mm[0].kr)} {10.}
(assert (<= (+ (* sc_34 1.) of_34) 10.))
; 
; <=  {((sc.mm[0].kr*1.)+of.mm[0].kr)} {0.0001}
(assert (>= (+ (* sc_34 1.) of_34) 0.0001))
(declare-fun slbot_39 () Real)
(declare-fun sltop_39 () Real)
; 
; =  {(((sc.mm[0].X*0.)+of.mm[0].X)+sl.min.mm[0].X)} {-0.9999}
(assert (= (+ (+ (* sc_39 0.) of_39) slbot_39) -0.9999))
; 
; =  {(((sc.mm[0].X*1.)+of.mm[0].X)+sl.max.mm[0].X)} {3300.}
(assert (= (+ (+ (* sc_39 1.) of_39) sltop_39) 3300.))
(declare-fun slbot_40 () Real)
(declare-fun sltop_40 () Real)
; 
; =  {(((sc.mm[0].XY*0.)+of.mm[0].XY)+sl.min.mm[0].XY)} {0.}
(assert (= (+ (+ (* sc_40 0.) of_40) slbot_40) 0.))
; 
; =  {(((sc.mm[0].XY*1.)+of.mm[0].XY)+sl.max.mm[0].XY)} {1.}
(assert (= (+ (+ (* sc_40 1.) of_40) sltop_40) 1.))
(declare-fun slbot_41 () Real)
(declare-fun sltop_41 () Real)
; 
; =  {(((sc.mm[0].Y*0.)+of.mm[0].Y)+sl.min.mm[0].Y)} {-0.9999}
(assert (= (+ (+ (* sc_41 0.) of_41) slbot_41) -0.9999))
; 
; =  {(((sc.mm[0].Y*1.)+of.mm[0].Y)+sl.max.mm[0].Y)} {3300.}
(assert (= (+ (+ (* sc_41 1.) of_41) sltop_41) 3300.))
; 
; >=  {((sc.mm[0].Ytot*0.11)+of.mm[0].Ytot)} {3300.}
(assert (<= (+ (* sc_36 0.11) of_36) 3300.))
; 
; <=  {((sc.mm[0].Ytot*0.11)+of.mm[0].Ytot)} {0.0001}
(assert (>= (+ (* sc_36 0.11) of_36) 0.0001))
; 
; >=  {((sc.mm[0].Xtot*0.15)+of.mm[0].Xtot)} {3300.}
(assert (<= (+ (* sc_38 0.15) of_38) 3300.))
; 
; <=  {((sc.mm[0].Xtot*0.15)+of.mm[0].Xtot)} {0.0001}
(assert (>= (+ (* sc_38 0.15) of_38) 0.0001))
; 
; >=  {((sc.mm[0].kf*1.)+of.mm[0].kf)} {10.}
(assert (<= (+ (* sc_37 1.) of_37) 10.))
; 
; <=  {((sc.mm[0].kf*1.)+of.mm[0].kf)} {0.0001}
(assert (>= (+ (* sc_37 1.) of_37) 0.0001))
(declare-fun sc_42 () Real)
(declare-fun of_42 () Real)
(declare-fun sc_43 () Real)
(declare-fun of_43 () Real)
(assert (= sc_43 1))
(assert (= of_43 0))
; 
; =  {sc.input.V[2].O} {sc.input.V[2].X}
(assert (= sc_43 sc_42))
; 
; =  {of.input.V[2].O} {of.input.V[2].X}
(assert (= of_43 of_42))
; 
; >=  {((sc.input.V[2].X*0.)+of.input.V[2].X)} {5.}
(assert (<= (+ (* sc_42 0.) of_42) 5.))
; 
; <=  {((sc.input.V[2].X*0.)+of.input.V[2].X)} {0.}
(assert (>= (+ (* sc_42 0.) of_42) 0.))
; 
; >=  {((sc.input.V[2].O*0.)+of.input.V[2].O)} {5.}
(assert (<= (+ (* sc_43 0.) of_43) 5.))
; 
; <=  {((sc.input.V[2].O*0.)+of.input.V[2].O)} {0.}
(assert (>= (+ (* sc_43 0.) of_43) 0.))
(declare-fun sc_44 () Real)
(declare-fun of_44 () Real)
(declare-fun sc_45 () Real)
(declare-fun of_45 () Real)
(assert (= sc_45 1))
(assert (= of_45 0))
; 
; =  {sc.input.V[7].O} {sc.input.V[7].X}
(assert (= sc_45 sc_44))
; 
; =  {of.input.V[7].O} {of.input.V[7].X}
(assert (= of_45 of_44))
; 
; >=  {((sc.input.V[7].X*1.)+of.input.V[7].X)} {5.}
(assert (<= (+ (* sc_44 1.) of_44) 5.))
; 
; <=  {((sc.input.V[7].X*1.)+of.input.V[7].X)} {0.}
(assert (>= (+ (* sc_44 1.) of_44) 0.))
; 
; >=  {((sc.input.V[7].O*1.)+of.input.V[7].O)} {5.}
(assert (<= (+ (* sc_45 1.) of_45) 5.))
; 
; <=  {((sc.input.V[7].O*1.)+of.input.V[7].O)} {0.}
(assert (>= (+ (* sc_45 1.) of_45) 0.))
(declare-fun sc_46 () Real)
(declare-fun of_46 () Real)
(declare-fun sc_47 () Real)
(declare-fun of_47 () Real)
(assert (= sc_47 1))
(assert (= of_47 0))
; 
; =  {sc.input.V[0].O} {sc.input.V[0].X}
(assert (= sc_47 sc_46))
; 
; =  {of.input.V[0].O} {of.input.V[0].X}
(assert (= of_47 of_46))
; 
; >=  {((sc.input.V[0].X*0.11)+of.input.V[0].X)} {5.}
(assert (<= (+ (* sc_46 0.11) of_46) 5.))
; 
; <=  {((sc.input.V[0].X*0.11)+of.input.V[0].X)} {0.}
(assert (>= (+ (* sc_46 0.11) of_46) 0.))
; 
; >=  {((sc.input.V[0].O*0.11)+of.input.V[0].O)} {5.}
(assert (<= (+ (* sc_47 0.11) of_47) 5.))
; 
; <=  {((sc.input.V[0].O*0.11)+of.input.V[0].O)} {0.}
(assert (>= (+ (* sc_47 0.11) of_47) 0.))
(declare-fun sc_48 () Real)
(declare-fun of_48 () Real)
(declare-fun sc_49 () Real)
(declare-fun of_49 () Real)
(assert (= sc_49 1))
(assert (= of_49 0))
; 
; =  {sc.input.V[10].O} {sc.input.V[10].X}
(assert (= sc_49 sc_48))
; 
; =  {of.input.V[10].O} {of.input.V[10].X}
(assert (= of_49 of_48))
; 
; >=  {((sc.input.V[10].X*0.)+of.input.V[10].X)} {5.}
(assert (<= (+ (* sc_48 0.) of_48) 5.))
; 
; <=  {((sc.input.V[10].X*0.)+of.input.V[10].X)} {0.}
(assert (>= (+ (* sc_48 0.) of_48) 0.))
; 
; >=  {((sc.input.V[10].O*0.)+of.input.V[10].O)} {5.}
(assert (<= (+ (* sc_49 0.) of_49) 5.))
; 
; <=  {((sc.input.V[10].O*0.)+of.input.V[10].O)} {0.}
(assert (>= (+ (* sc_49 0.) of_49) 0.))
(declare-fun sc_50 () Real)
(declare-fun of_50 () Real)
(declare-fun sc_51 () Real)
(declare-fun of_51 () Real)
(assert (= sc_51 1))
(assert (= of_51 0))
; 
; =  {sc.input.V[6].O} {sc.input.V[6].X}
(assert (= sc_51 sc_50))
; 
; =  {of.input.V[6].O} {of.input.V[6].X}
(assert (= of_51 of_50))
; 
; >=  {((sc.input.V[6].X*4.)+of.input.V[6].X)} {5.}
(assert (<= (+ (* sc_50 4.) of_50) 5.))
; 
; <=  {((sc.input.V[6].X*4.)+of.input.V[6].X)} {0.}
(assert (>= (+ (* sc_50 4.) of_50) 0.))
; 
; >=  {((sc.input.V[6].O*4.)+of.input.V[6].O)} {5.}
(assert (<= (+ (* sc_51 4.) of_51) 5.))
; 
; <=  {((sc.input.V[6].O*4.)+of.input.V[6].O)} {0.}
(assert (>= (+ (* sc_51 4.) of_51) 0.))
(declare-fun sc_52 () Real)
(declare-fun of_52 () Real)
(declare-fun sc_53 () Real)
(declare-fun of_53 () Real)
(assert (= sc_53 1))
(assert (= of_53 0))
; 
; =  {sc.input.V[3].O} {sc.input.V[3].X}
(assert (= sc_53 sc_52))
; 
; =  {of.input.V[3].O} {of.input.V[3].X}
(assert (= of_53 of_52))
; 
; >=  {((sc.input.V[3].X*0.)+of.input.V[3].X)} {5.}
(assert (<= (+ (* sc_52 0.) of_52) 5.))
; 
; <=  {((sc.input.V[3].X*0.)+of.input.V[3].X)} {0.}
(assert (>= (+ (* sc_52 0.) of_52) 0.))
; 
; >=  {((sc.input.V[3].O*0.)+of.input.V[3].O)} {5.}
(assert (<= (+ (* sc_53 0.) of_53) 5.))
; 
; <=  {((sc.input.V[3].O*0.)+of.input.V[3].O)} {0.}
(assert (>= (+ (* sc_53 0.) of_53) 0.))
(declare-fun sc_54 () Real)
(declare-fun of_54 () Real)
(declare-fun sc_55 () Real)
(declare-fun of_55 () Real)
(assert (= sc_55 1))
(assert (= of_55 0))
; 
; =  {sc.input.V[4].O} {sc.input.V[4].X}
(assert (= sc_55 sc_54))
; 
; =  {of.input.V[4].O} {of.input.V[4].X}
(assert (= of_55 of_54))
; 
; >=  {((sc.input.V[4].X*0.)+of.input.V[4].X)} {5.}
(assert (<= (+ (* sc_54 0.) of_54) 5.))
; 
; <=  {((sc.input.V[4].X*0.)+of.input.V[4].X)} {0.}
(assert (>= (+ (* sc_54 0.) of_54) 0.))
; 
; >=  {((sc.input.V[4].O*0.)+of.input.V[4].O)} {5.}
(assert (<= (+ (* sc_55 0.) of_55) 5.))
; 
; <=  {((sc.input.V[4].O*0.)+of.input.V[4].O)} {0.}
(assert (>= (+ (* sc_55 0.) of_55) 0.))
(declare-fun sc_56 () Real)
(declare-fun of_56 () Real)
(declare-fun sc_57 () Real)
(declare-fun of_57 () Real)
(assert (= sc_57 1))
(assert (= of_57 0))
; 
; =  {sc.input.V[5].O} {sc.input.V[5].X}
(assert (= sc_57 sc_56))
; 
; =  {of.input.V[5].O} {of.input.V[5].X}
(assert (= of_57 of_56))
; 
; >=  {((sc.input.V[5].X*0.15)+of.input.V[5].X)} {5.}
(assert (<= (+ (* sc_56 0.15) of_56) 5.))
; 
; <=  {((sc.input.V[5].X*0.15)+of.input.V[5].X)} {0.}
(assert (>= (+ (* sc_56 0.15) of_56) 0.))
; 
; >=  {((sc.input.V[5].O*0.15)+of.input.V[5].O)} {5.}
(assert (<= (+ (* sc_57 0.15) of_57) 5.))
; 
; <=  {((sc.input.V[5].O*0.15)+of.input.V[5].O)} {0.}
(assert (>= (+ (* sc_57 0.15) of_57) 0.))
(declare-fun sc_58 () Real)
(declare-fun of_58 () Real)
(declare-fun sc_59 () Real)
(declare-fun of_59 () Real)
(assert (= sc_59 1))
(assert (= of_59 0))
; 
; =  {sc.input.V[1].O} {sc.input.V[1].X}
(assert (= sc_59 sc_58))
; 
; =  {of.input.V[1].O} {of.input.V[1].X}
(assert (= of_59 of_58))
; 
; >=  {((sc.input.V[1].X*0.125)+of.input.V[1].X)} {5.}
(assert (<= (+ (* sc_58 0.125) of_58) 5.))
; 
; <=  {((sc.input.V[1].X*0.125)+of.input.V[1].X)} {0.}
(assert (>= (+ (* sc_58 0.125) of_58) 0.))
; 
; >=  {((sc.input.V[1].O*0.125)+of.input.V[1].O)} {5.}
(assert (<= (+ (* sc_59 0.125) of_59) 5.))
; 
; <=  {((sc.input.V[1].O*0.125)+of.input.V[1].O)} {0.}
(assert (>= (+ (* sc_59 0.125) of_59) 0.))
(declare-fun sc_60 () Real)
(declare-fun of_60 () Real)
(declare-fun sc_61 () Real)
(declare-fun of_61 () Real)
(declare-fun sc_62 () Real)
(declare-fun of_62 () Real)
(assert (= sc_62 1))
(assert (= of_62 0))
; 
; =  {sc.itov[3].Y} {(sc.itov[3].K*sc.itov[3].X)}
(assert (= sc_62 (* sc_61 sc_60)))
; 
; =  {of.itov[3].Y} {0}
(assert (= of_62 0.))
(declare-fun slbot_60 () Real)
(declare-fun sltop_60 () Real)
; 
; =  {(((sc.itov[3].X*0.)+of.itov[3].X)+sl.min.itov[3].X)} {0.0001}
(assert (= (+ (+ (* sc_60 0.) of_60) slbot_60) 0.0001))
; 
; =  {(((sc.itov[3].X*1.)+of.itov[3].X)+sl.max.itov[3].X)} {10.}
(assert (= (+ (+ (* sc_60 1.) of_60) sltop_60) 10.))
(declare-fun slbot_62 () Real)
(declare-fun sltop_62 () Real)
; 
; =  {(((sc.itov[3].Y*0.)+of.itov[3].Y)+sl.min.itov[3].Y)} {0.0001}
(assert (= (+ (+ (* sc_62 0.) of_62) slbot_62) 0.0001))
; 
; =  {(((sc.itov[3].Y*4.)+of.itov[3].Y)+sl.max.itov[3].Y)} {3300.}
(assert (= (+ (+ (* sc_62 4.) of_62) sltop_62) 3300.))
(declare-fun slbot_61 () Real)
(declare-fun sltop_61 () Real)
; 
; =  {(((sc.itov[3].K*0.)+of.itov[3].K)+sl.min.itov[3].K)} {1.}
(assert (= (+ (+ (* sc_61 0.) of_61) slbot_61) 1.))
; 
; =  {(((sc.itov[3].K*4.)+of.itov[3].K)+sl.max.itov[3].K)} {330.}
(assert (= (+ (+ (* sc_61 4.) of_61) sltop_61) 330.))
(declare-fun slbot_62 () Real)
(declare-fun sltop_62 () Real)
; 
; =  {(((sc.itov[3].Y*0.)+of.itov[3].Y)+sl.min.itov[3].Y)} {0.0001}
(assert (= (+ (+ (* sc_62 0.) of_62) slbot_62) 0.0001))
; 
; =  {(((sc.itov[3].Y*4.)+of.itov[3].Y)+sl.max.itov[3].Y)} {3300.}
(assert (= (+ (+ (* sc_62 4.) of_62) sltop_62) 3300.))
(declare-fun sc_63 () Real)
(declare-fun of_63 () Real)
(declare-fun sc_64 () Real)
(declare-fun of_64 () Real)
(declare-fun sc_65 () Real)
(declare-fun of_65 () Real)
(declare-fun sc_66 () Real)
(declare-fun of_66 () Real)
(declare-fun sc_67 () Real)
(declare-fun of_67 () Real)
(assert (= sc_67 1))
(assert (= of_67 0))
; 
; =  {sc.iadd[4].OUT} {sc.iadd[4].A}
(assert (= sc_67 sc_65))
; 
; =  {of.iadd[4].OUT} {((of.iadd[4].A+of.iadd[4].B)-of.iadd[4].C-of.iadd[4].D)}
(assert (= of_67 (- (+ of_65 of_66) (+ of_64 of_63))))
(declare-fun slbot_63 () Real)
(declare-fun sltop_63 () Real)
; 
; =  {(((sc.iadd[4].D*0.)+of.iadd[4].D)+sl.min.iadd[4].D)} {0.}
(assert (= (+ (+ (* sc_63 0.) of_63) slbot_63) 0.))
; 
; =  {(((sc.iadd[4].D*1.)+of.iadd[4].D)+sl.max.iadd[4].D)} {5.}
(assert (= (+ (+ (* sc_63 1.) of_63) sltop_63) 5.))
; 
; >=  {((sc.iadd[4].C*0.)+of.iadd[4].C)} {5.}
(assert (<= (+ (* sc_64 0.) of_64) 5.))
; 
; <=  {((sc.iadd[4].C*0.)+of.iadd[4].C)} {0.}
(assert (>= (+ (* sc_64 0.) of_64) 0.))
(declare-fun slbot_67 () Real)
(declare-fun sltop_67 () Real)
; 
; =  {(((sc.iadd[4].OUT*0.)+of.iadd[4].OUT)+sl.min.iadd[4].OUT)} {-10.}
(assert (= (+ (+ (* sc_67 0.) of_67) slbot_67) -10.))
; 
; =  {(((sc.iadd[4].OUT*1.)+of.iadd[4].OUT)+sl.max.iadd[4].OUT)} {10.}
(assert (= (+ (+ (* sc_67 1.) of_67) sltop_67) 10.))
; 
; >=  {((sc.iadd[4].A*0.)+of.iadd[4].A)} {5.}
(assert (<= (+ (* sc_65 0.) of_65) 5.))
; 
; <=  {((sc.iadd[4].A*0.)+of.iadd[4].A)} {0.}
(assert (>= (+ (* sc_65 0.) of_65) 0.))
; 
; >=  {((sc.iadd[4].B*0.15)+of.iadd[4].B)} {5.}
(assert (<= (+ (* sc_66 0.15) of_66) 5.))
; 
; <=  {((sc.iadd[4].B*0.15)+of.iadd[4].B)} {0.}
(assert (>= (+ (* sc_66 0.15) of_66) 0.))
(declare-fun slbot_67 () Real)
(declare-fun sltop_67 () Real)
; 
; =  {(((sc.iadd[4].OUT*0.)+of.iadd[4].OUT)+sl.min.iadd[4].OUT)} {-10.}
(assert (= (+ (+ (* sc_67 0.) of_67) slbot_67) -10.))
; 
; =  {(((sc.iadd[4].OUT*1.)+of.iadd[4].OUT)+sl.max.iadd[4].OUT)} {10.}
(assert (= (+ (+ (* sc_67 1.) of_67) sltop_67) 10.))
(declare-fun sc_68 () Real)
(declare-fun of_68 () Real)
(declare-fun sc_69 () Real)
(declare-fun of_69 () Real)
(assert (= sc_69 1))
(assert (= of_69 0))
; 
; =  {sc.output.I[0].O} {sc.output.I[0].X}
(assert (= sc_69 sc_68))
; 
; =  {of.output.I[0].O} {of.output.I[0].X}
(assert (= of_69 of_68))
(declare-fun slbot_68 () Real)
(declare-fun sltop_68 () Real)
; 
; =  {(((sc.output.I[0].X*0.)+of.output.I[0].X)+sl.min.output.I[0].X)} {0.}
(assert (= (+ (+ (* sc_68 0.) of_68) slbot_68) 0.))
; 
; =  {(((sc.output.I[0].X*1.)+of.output.I[0].X)+sl.max.output.I[0].X)} {10.}
(assert (= (+ (+ (* sc_68 1.) of_68) sltop_68) 10.))
(declare-fun slbot_69 () Real)
(declare-fun sltop_69 () Real)
; 
; =  {(((sc.output.I[0].O*0.)+of.output.I[0].O)+sl.min.output.I[0].O)} {0.}
(assert (= (+ (+ (* sc_69 0.) of_69) slbot_69) 0.))
; 
; =  {(((sc.output.I[0].O*1.)+of.output.I[0].O)+sl.max.output.I[0].O)} {10.}
(assert (= (+ (+ (* sc_69 1.) of_69) sltop_69) 10.))
; 
; =  {sc.vadd[2].OUT2} {sc.output.V[2].X}
(assert (= sc_33 sc_19))
; 
; =  {of.vadd[2].OUT2} {of.output.V[2].X}
(assert (= of_33 of_19))
; 
; =  {sc.vadd[2].OUT2} {sc.switch[0].Vmax}
(assert (= sc_33 sc_7))
; 
; =  {of.vadd[2].OUT2} {of.switch[0].Vmax}
(assert (= of_33 of_7))
; 
; =  {sc.input.I[0].O} {sc.iadd[4].C}
(assert (= sc_12 sc_64))
; 
; =  {of.input.I[0].O} {of.iadd[4].C}
(assert (= of_12 of_64))
; 
; =  {sc.iadd[4].OUT} {sc.output.I[0].X}
(assert (= sc_67 sc_68))
; 
; =  {of.iadd[4].OUT} {of.output.I[0].X}
(assert (= of_67 of_68))
; 
; =  {sc.switch[0].PROD} {sc.iadd[4].D}
(assert (= sc_8 sc_63))
; 
; =  {of.switch[0].PROD} {of.iadd[4].D}
(assert (= of_8 of_63))
; 
; =  {sc.input.I[4].O} {sc.mm[0].kr}
(assert (= sc_16 sc_34))
; 
; =  {of.input.I[4].O} {of.mm[0].kr}
(assert (= of_16 of_34))
; 
; =  {sc.input.I[3].O} {sc.mm[0].kf}
(assert (= sc_14 sc_37))
; 
; =  {of.input.I[3].O} {of.mm[0].kf}
(assert (= of_14 of_37))
; 
; =  {sc.mm[0].Y} {sc.itov[3].X}
(assert (= sc_41 sc_60))
; 
; =  {of.mm[0].Y} {of.itov[3].X}
(assert (= of_41 of_60))
; 
; =  {sc.mm[0].Y} {sc.output.V[0].X}
(assert (= sc_41 sc_21))
; 
; =  {of.mm[0].Y} {of.output.V[0].X}
(assert (= of_41 of_21))
; 
; =  {sc.mm[0].X} {sc.output.V[1].X}
(assert (= sc_39 sc_25))
; 
; =  {of.mm[0].X} {of.output.V[1].X}
(assert (= of_39 of_25))
; 
; =  {sc.mm[0].X} {sc.vgain[1].Z}
(assert (= sc_39 sc_2))
; 
; =  {of.mm[0].X} {of.vgain[1].Z}
(assert (= of_39 of_2))
; 
; =  {sc.input.I[2].O} {sc.iadd[4].B}
(assert (= sc_10 sc_66))
; 
; =  {of.input.I[2].O} {of.iadd[4].B}
(assert (= of_10 of_66))
; 
; =  {sc.input.V[2].O} {sc.vadd[2].OUT2_0}
(assert (= sc_43 sc_27))
; 
; =  {of.input.V[2].O} {of.vadd[2].OUT2_0}
(assert (= of_43 of_27))
; 
; =  {sc.input.V[3].O} {sc.vadd[2].C}
(assert (= sc_53 sc_29))
; 
; =  {of.input.V[3].O} {of.vadd[2].C}
(assert (= of_53 of_29))
; 
; =  {sc.input.I[1].O} {sc.iadd[4].A}
(assert (= sc_18 sc_65))
; 
; =  {of.input.I[1].O} {of.iadd[4].A}
(assert (= of_18 of_65))
; 
; =  {sc.input.V[1].O} {sc.vgain[1].Y}
(assert (= sc_59 sc_1))
; 
; =  {of.input.V[1].O} {of.vgain[1].Y}
(assert (= of_59 of_1))
; 
; =  {sc.input.V[7].O} {sc.vgain[1].X}
(assert (= sc_45 sc_0))
; 
; =  {of.input.V[7].O} {of.vgain[1].X}
(assert (= of_45 of_0))
; 
; =  {sc.mm[0].XY} {sc.output.V[3].X}
(assert (= sc_40 sc_23))
; 
; =  {of.mm[0].XY} {of.output.V[3].X}
(assert (= of_40 of_23))
; 
; =  {sc.vgain[1].P} {sc.itov[3].K}
(assert (= sc_3 sc_61))
; 
; =  {of.vgain[1].P} {of.itov[3].K}
(assert (= of_3 of_61))
; 
; =  {sc.itov[3].Y} {sc.vadd[2].B}
(assert (= sc_62 sc_31))
; 
; =  {of.itov[3].Y} {of.vadd[2].B}
(assert (= of_62 of_31))
; 
; =  {sc.input.V[10].O} {sc.switch[0].n}
(assert (= sc_49 sc_5))
; 
; =  {of.input.V[10].O} {of.switch[0].n}
(assert (= of_49 of_5))
; 
; =  {sc.input.V[0].O} {sc.mm[0].Ytot}
(assert (= sc_47 sc_36))
; 
; =  {of.input.V[0].O} {of.mm[0].Ytot}
(assert (= of_47 of_36))
; 
; =  {sc.input.V[5].O} {sc.mm[0].Xtot}
(assert (= sc_57 sc_38))
; 
; =  {of.input.V[5].O} {of.mm[0].Xtot}
(assert (= of_57 of_38))
; 
; =  {sc.input.V[4].O} {sc.vadd[2].A}
(assert (= sc_55 sc_30))
; 
; =  {of.input.V[4].O} {of.vadd[2].A}
(assert (= of_55 of_30))
; 
; =  {sc.input.V[6].O} {sc.vadd[2].D}
(assert (= sc_51 sc_28))
; 
; =  {of.input.V[6].O} {of.vadd[2].D}
(assert (= of_51 of_28))
(assert (<= (* sc_20 0.001) 0.001))
(assert (<= (* sc_24 0.001) 0.001))
; 
; =  {sc.output.V[2].O} {sc.output.V[3].O} {sc.vadd[2].OUT2} {sc.mm[0].XY}
(assert (and (and (= sc_20 sc_24) (= sc_20 sc_33)) (= sc_20 sc_40)))
(assert (= __minima__ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (* (ite (>= slbot_22 0) slbot_22 (- slbot_22)) 1.) (* (ite (>= sltop_23 0) sltop_23 (- sltop_23)) 1.)) (* (ite (>= slbot_32 0) slbot_32 (- slbot_32)) 1.)) (* (ite (>= sltop_41 0) sltop_41 (- sltop_41)) 1.)) (* (ite (>= sltop_32 0) sltop_32 (- sltop_32)) 1.)) (* (ite (>= slbot_20 0) slbot_20 (- slbot_20)) 1.)) (* (ite (>= slbot_60 0) slbot_60 (- slbot_60)) 1.)) (* (ite (>= slbot_3 0) slbot_3 (- slbot_3)) 1.)) (* (ite (>= slbot_19 0) slbot_19 (- slbot_19)) 1.)) (* (ite (>= slbot_63 0) slbot_63 (- slbot_63)) 1.)) (* (ite (>= slbot_26 0) slbot_26 (- slbot_26)) 1.)) (* (ite (>= slbot_2 0) slbot_2 (- slbot_2)) 1.)) (* (ite (>= slbot_61 0) slbot_61 (- slbot_61)) 1.)) (* (ite (>= sltop_7 0) sltop_7 (- sltop_7)) 1.)) (* (ite (>= sltop_67 0) sltop_67 (- sltop_67)) 1.)) (* (ite (>= sltop_39 0) sltop_39 (- sltop_39)) 1.)) (* (ite (>= slbot_31 0) slbot_31 (- slbot_31)) 1.)) (* (ite (>= sltop_22 0) sltop_22 (- sltop_22)) 1.)) (* (ite (>= slbot_25 0) slbot_25 (- slbot_25)) 1.)) (* (ite (>= slbot_41 0) slbot_41 (- slbot_41)) 1.)) (* (ite (>= sltop_2 0) sltop_2 (- sltop_2)) 1.)) (* (ite (>= sltop_8 0) sltop_8 (- sltop_8)) 1.)) (* (ite (>= sltop_20 0) sltop_20 (- sltop_20)) 1.)) (* (ite (>= sltop_24 0) sltop_24 (- sltop_24)) 1.)) (* (ite (>= sltop_31 0) sltop_31 (- sltop_31)) 1.)) (* (ite (>= slbot_24 0) slbot_24 (- slbot_24)) 1.)) (* (ite (>= sltop_62 0) sltop_62 (- sltop_62)) 1.)) (* (ite (>= slbot_67 0) slbot_67 (- slbot_67)) 1.)) (* (ite (>= slbot_62 0) slbot_62 (- slbot_62)) 1.)) (* (ite (>= slbot_21 0) slbot_21 (- slbot_21)) 1.)) (* (ite (>= sltop_60 0) sltop_60 (- sltop_60)) 1.)) (* (ite (>= slbot_68 0) slbot_68 (- slbot_68)) 1.)) (* (ite (>= sltop_19 0) sltop_19 (- sltop_19)) 1.)) (* (ite (>= sltop_61 0) sltop_61 (- sltop_61)) 1.)) (* (ite (>= sltop_68 0) sltop_68 (- sltop_68)) 1.)) (* (ite (>= slbot_23 0) slbot_23 (- slbot_23)) 1.)) (* (ite (>= sltop_25 0) sltop_25 (- sltop_25)) 1.)) (* (ite (>= sltop_69 0) sltop_69 (- sltop_69)) 1.)) (* (ite (>= sltop_63 0) sltop_63 (- sltop_63)) 1.)) (* (ite (>= sltop_3 0) sltop_3 (- sltop_3)) 1.)) (* (ite (>= sltop_26 0) sltop_26 (- sltop_26)) 1.)) (* (ite (>= slbot_39 0) slbot_39 (- slbot_39)) 1.)) (* (ite (>= sltop_40 0) sltop_40 (- sltop_40)) 1.)) (* (ite (>= slbot_69 0) slbot_69 (- slbot_69)) 1.)) (* (ite (>= slbot_7 0) slbot_7 (- slbot_7)) 1.)) (* (ite (>= slbot_8 0) slbot_8 (- slbot_8)) 1.)) (* (ite (>= slbot_33 0) slbot_33 (- slbot_33)) 1.)) (* (ite (>= sltop_33 0) sltop_33 (- sltop_33)) 1.)) (* (ite (>= slbot_40 0) slbot_40 (- slbot_40)) 1.)) (* (ite (>= sltop_21 0) sltop_21 (- sltop_21)) 1.))))
(check-sat)
