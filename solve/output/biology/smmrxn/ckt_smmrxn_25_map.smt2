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
; =  {sc.vgain[0].P} {((sc.vgain[0].X/sc.vgain[0].Y)*sc.vgain[0].Z*1)}
(assert (= sc_3 (* (* (/ sc_0 sc_1) sc_2) 1)))
; 
; =  {of.vgain[0].P} {0}
(assert (= of_3 0.))
; 
; >=  {((sc.vgain[0].X*1.)+of.vgain[0].X)} {3300.}
(assert (<= (+ (* sc_0 1.) of_0) 3300.))
; 
; <=  {((sc.vgain[0].X*1.)+of.vgain[0].X)} {0.0001}
(assert (>= (+ (* sc_0 1.) of_0) 0.0001))
; 
; >=  {((sc.vgain[0].Y*0.125)+of.vgain[0].Y)} {3300.}
(assert (<= (+ (* sc_1 0.125) of_1) 3300.))
; 
; <=  {((sc.vgain[0].Y*0.125)+of.vgain[0].Y)} {1.}
(assert (>= (+ (* sc_1 0.125) of_1) 1.))
(declare-fun slbot_3 () Real)
(declare-fun sltop_3 () Real)
; 
; =  {(((sc.vgain[0].P*0.)+of.vgain[0].P)+sl.min.vgain[0].P)} {1.51515151515e-12}
(assert (= (+ (+ (* sc_3 0.) of_3) slbot_3) 1.51515151515e-12))
; 
; =  {(((sc.vgain[0].P*4.)+of.vgain[0].P)+sl.max.vgain[0].P)} {5445000.}
(assert (= (+ (+ (* sc_3 4.) of_3) sltop_3) 5445000.))
(declare-fun slbot_2 () Real)
(declare-fun sltop_2 () Real)
; 
; =  {(((sc.vgain[0].Z*0.)+of.vgain[0].Z)+sl.min.vgain[0].Z)} {0.0001}
(assert (= (+ (+ (* sc_2 0.) of_2) slbot_2) 0.0001))
; 
; =  {(((sc.vgain[0].Z*1.)+of.vgain[0].Z)+sl.max.vgain[0].Z)} {3300.}
(assert (= (+ (+ (* sc_2 1.) of_2) sltop_2) 3300.))
(declare-fun sc_4 () Real)
(declare-fun of_4 () Real)
(declare-fun sc_5 () Real)
(declare-fun of_5 () Real)
(assert (= sc_5 1))
(assert (= of_5 0))
; 
; =  {sc.input.I[2].O} {sc.input.I[2].X}
(assert (= sc_5 sc_4))
; 
; =  {of.input.I[2].O} {of.input.I[2].X}
(assert (= of_5 of_4))
; 
; >=  {((sc.input.I[2].X*0.)+of.input.I[2].X)} {10.}
(assert (<= (+ (* sc_4 0.) of_4) 10.))
; 
; <=  {((sc.input.I[2].X*0.)+of.input.I[2].X)} {0.}
(assert (>= (+ (* sc_4 0.) of_4) 0.))
; 
; >=  {((sc.input.I[2].O*0.)+of.input.I[2].O)} {10.}
(assert (<= (+ (* sc_5 0.) of_5) 10.))
; 
; <=  {((sc.input.I[2].O*0.)+of.input.I[2].O)} {0.}
(assert (>= (+ (* sc_5 0.) of_5) 0.))
(declare-fun sc_6 () Real)
(declare-fun of_6 () Real)
(declare-fun sc_7 () Real)
(declare-fun of_7 () Real)
(assert (= sc_7 1))
(assert (= of_7 0))
; 
; =  {sc.input.I[7].O} {sc.input.I[7].X}
(assert (= sc_7 sc_6))
; 
; =  {of.input.I[7].O} {of.input.I[7].X}
(assert (= of_7 of_6))
; 
; >=  {((sc.input.I[7].X*1.)+of.input.I[7].X)} {10.}
(assert (<= (+ (* sc_6 1.) of_6) 10.))
; 
; <=  {((sc.input.I[7].X*1.)+of.input.I[7].X)} {0.}
(assert (>= (+ (* sc_6 1.) of_6) 0.))
; 
; >=  {((sc.input.I[7].O*1.)+of.input.I[7].O)} {10.}
(assert (<= (+ (* sc_7 1.) of_7) 10.))
; 
; <=  {((sc.input.I[7].O*1.)+of.input.I[7].O)} {0.}
(assert (>= (+ (* sc_7 1.) of_7) 0.))
(declare-fun sc_8 () Real)
(declare-fun of_8 () Real)
(declare-fun sc_9 () Real)
(declare-fun of_9 () Real)
(assert (= sc_9 1))
(assert (= of_9 0))
; 
; =  {sc.input.I[0].O} {sc.input.I[0].X}
(assert (= sc_9 sc_8))
; 
; =  {of.input.I[0].O} {of.input.I[0].X}
(assert (= of_9 of_8))
; 
; >=  {((sc.input.I[0].X*0.11)+of.input.I[0].X)} {10.}
(assert (<= (+ (* sc_8 0.11) of_8) 10.))
; 
; <=  {((sc.input.I[0].X*0.11)+of.input.I[0].X)} {0.}
(assert (>= (+ (* sc_8 0.11) of_8) 0.))
; 
; >=  {((sc.input.I[0].O*0.11)+of.input.I[0].O)} {10.}
(assert (<= (+ (* sc_9 0.11) of_9) 10.))
; 
; <=  {((sc.input.I[0].O*0.11)+of.input.I[0].O)} {0.}
(assert (>= (+ (* sc_9 0.11) of_9) 0.))
(declare-fun sc_10 () Real)
(declare-fun of_10 () Real)
(declare-fun sc_11 () Real)
(declare-fun of_11 () Real)
(assert (= sc_11 1))
(assert (= of_11 0))
; 
; =  {sc.input.I[6].O} {sc.input.I[6].X}
(assert (= sc_11 sc_10))
; 
; =  {of.input.I[6].O} {of.input.I[6].X}
(assert (= of_11 of_10))
; 
; >=  {((sc.input.I[6].X*1.)+of.input.I[6].X)} {10.}
(assert (<= (+ (* sc_10 1.) of_10) 10.))
; 
; <=  {((sc.input.I[6].X*1.)+of.input.I[6].X)} {0.}
(assert (>= (+ (* sc_10 1.) of_10) 0.))
; 
; >=  {((sc.input.I[6].O*1.)+of.input.I[6].O)} {10.}
(assert (<= (+ (* sc_11 1.) of_11) 10.))
; 
; <=  {((sc.input.I[6].O*1.)+of.input.I[6].O)} {0.}
(assert (>= (+ (* sc_11 1.) of_11) 0.))
(declare-fun sc_12 () Real)
(declare-fun of_12 () Real)
(declare-fun sc_13 () Real)
(declare-fun of_13 () Real)
(assert (= sc_13 1))
(assert (= of_13 0))
; 
; =  {sc.input.I[3].O} {sc.input.I[3].X}
(assert (= sc_13 sc_12))
; 
; =  {of.input.I[3].O} {of.input.I[3].X}
(assert (= of_13 of_12))
; 
; >=  {((sc.input.I[3].X*0.)+of.input.I[3].X)} {10.}
(assert (<= (+ (* sc_12 0.) of_12) 10.))
; 
; <=  {((sc.input.I[3].X*0.)+of.input.I[3].X)} {0.}
(assert (>= (+ (* sc_12 0.) of_12) 0.))
; 
; >=  {((sc.input.I[3].O*0.)+of.input.I[3].O)} {10.}
(assert (<= (+ (* sc_13 0.) of_13) 10.))
; 
; <=  {((sc.input.I[3].O*0.)+of.input.I[3].O)} {0.}
(assert (>= (+ (* sc_13 0.) of_13) 0.))
(declare-fun sc_14 () Real)
(declare-fun of_14 () Real)
(declare-fun sc_15 () Real)
(declare-fun of_15 () Real)
(assert (= sc_15 1))
(assert (= of_15 0))
; 
; =  {sc.input.I[4].O} {sc.input.I[4].X}
(assert (= sc_15 sc_14))
; 
; =  {of.input.I[4].O} {of.input.I[4].X}
(assert (= of_15 of_14))
; 
; >=  {((sc.input.I[4].X*0.)+of.input.I[4].X)} {10.}
(assert (<= (+ (* sc_14 0.) of_14) 10.))
; 
; <=  {((sc.input.I[4].X*0.)+of.input.I[4].X)} {0.}
(assert (>= (+ (* sc_14 0.) of_14) 0.))
; 
; >=  {((sc.input.I[4].O*0.)+of.input.I[4].O)} {10.}
(assert (<= (+ (* sc_15 0.) of_15) 10.))
; 
; <=  {((sc.input.I[4].O*0.)+of.input.I[4].O)} {0.}
(assert (>= (+ (* sc_15 0.) of_15) 0.))
(declare-fun sc_16 () Real)
(declare-fun of_16 () Real)
(declare-fun sc_17 () Real)
(declare-fun of_17 () Real)
(assert (= sc_17 1))
(assert (= of_17 0))
; 
; =  {sc.input.I[5].O} {sc.input.I[5].X}
(assert (= sc_17 sc_16))
; 
; =  {of.input.I[5].O} {of.input.I[5].X}
(assert (= of_17 of_16))
; 
; >=  {((sc.input.I[5].X*0.15)+of.input.I[5].X)} {10.}
(assert (<= (+ (* sc_16 0.15) of_16) 10.))
; 
; <=  {((sc.input.I[5].X*0.15)+of.input.I[5].X)} {0.}
(assert (>= (+ (* sc_16 0.15) of_16) 0.))
; 
; >=  {((sc.input.I[5].O*0.15)+of.input.I[5].O)} {10.}
(assert (<= (+ (* sc_17 0.15) of_17) 10.))
; 
; <=  {((sc.input.I[5].O*0.15)+of.input.I[5].O)} {0.}
(assert (>= (+ (* sc_17 0.15) of_17) 0.))
(declare-fun sc_18 () Real)
(declare-fun of_18 () Real)
(declare-fun sc_19 () Real)
(declare-fun of_19 () Real)
(assert (= sc_19 1))
(assert (= of_19 0))
; 
; =  {sc.input.I[1].O} {sc.input.I[1].X}
(assert (= sc_19 sc_18))
; 
; =  {of.input.I[1].O} {of.input.I[1].X}
(assert (= of_19 of_18))
; 
; >=  {((sc.input.I[1].X*0.)+of.input.I[1].X)} {10.}
(assert (<= (+ (* sc_18 0.) of_18) 10.))
; 
; <=  {((sc.input.I[1].X*0.)+of.input.I[1].X)} {0.}
(assert (>= (+ (* sc_18 0.) of_18) 0.))
; 
; >=  {((sc.input.I[1].O*0.)+of.input.I[1].O)} {10.}
(assert (<= (+ (* sc_19 0.) of_19) 10.))
; 
; <=  {((sc.input.I[1].O*0.)+of.input.I[1].O)} {0.}
(assert (>= (+ (* sc_19 0.) of_19) 0.))
(declare-fun sc_20 () Real)
(declare-fun of_20 () Real)
(declare-fun sc_21 () Real)
(declare-fun of_21 () Real)
(assert (= sc_21 1))
(assert (= of_21 0))
; 
; =  {sc.output.V[2].O} {sc.output.V[2].X}
(assert (= sc_21 sc_20))
; 
; =  {of.output.V[2].O} {of.output.V[2].X}
(assert (= of_21 of_20))
(declare-fun slbot_20 () Real)
(declare-fun sltop_20 () Real)
; 
; =  {(((sc.output.V[2].X*0.)+of.output.V[2].X)+sl.min.output.V[2].X)} {0.0001}
(assert (= (+ (+ (* sc_20 0.) of_20) slbot_20) 0.0001))
; 
; =  {(((sc.output.V[2].X*1.)+of.output.V[2].X)+sl.max.output.V[2].X)} {3300.}
(assert (= (+ (+ (* sc_20 1.) of_20) sltop_20) 3300.))
(declare-fun slbot_21 () Real)
(declare-fun sltop_21 () Real)
; 
; =  {(((sc.output.V[2].O*0.)+of.output.V[2].O)+sl.min.output.V[2].O)} {0.0001}
(assert (= (+ (+ (* sc_21 0.) of_21) slbot_21) 0.0001))
; 
; =  {(((sc.output.V[2].O*1.)+of.output.V[2].O)+sl.max.output.V[2].O)} {3300.}
(assert (= (+ (+ (* sc_21 1.) of_21) sltop_21) 3300.))
(declare-fun sc_22 () Real)
(declare-fun of_22 () Real)
(declare-fun sc_23 () Real)
(declare-fun of_23 () Real)
(assert (= sc_23 1))
(assert (= of_23 0))
; 
; =  {sc.output.V[0].O} {sc.output.V[0].X}
(assert (= sc_23 sc_22))
; 
; =  {of.output.V[0].O} {of.output.V[0].X}
(assert (= of_23 of_22))
(declare-fun slbot_22 () Real)
(declare-fun sltop_22 () Real)
; 
; =  {(((sc.output.V[0].X*0.)+of.output.V[0].X)+sl.min.output.V[0].X)} {0.0001}
(assert (= (+ (+ (* sc_22 0.) of_22) slbot_22) 0.0001))
; 
; =  {(((sc.output.V[0].X*1.)+of.output.V[0].X)+sl.max.output.V[0].X)} {3300.}
(assert (= (+ (+ (* sc_22 1.) of_22) sltop_22) 3300.))
(declare-fun slbot_23 () Real)
(declare-fun sltop_23 () Real)
; 
; =  {(((sc.output.V[0].O*0.)+of.output.V[0].O)+sl.min.output.V[0].O)} {0.0001}
(assert (= (+ (+ (* sc_23 0.) of_23) slbot_23) 0.0001))
; 
; =  {(((sc.output.V[0].O*1.)+of.output.V[0].O)+sl.max.output.V[0].O)} {3300.}
(assert (= (+ (+ (* sc_23 1.) of_23) sltop_23) 3300.))
(declare-fun sc_24 () Real)
(declare-fun of_24 () Real)
(declare-fun sc_25 () Real)
(declare-fun of_25 () Real)
(assert (= sc_25 1))
(assert (= of_25 0))
; 
; =  {sc.output.V[3].O} {sc.output.V[3].X}
(assert (= sc_25 sc_24))
; 
; =  {of.output.V[3].O} {of.output.V[3].X}
(assert (= of_25 of_24))
(declare-fun slbot_24 () Real)
(declare-fun sltop_24 () Real)
; 
; =  {(((sc.output.V[3].X*0.)+of.output.V[3].X)+sl.min.output.V[3].X)} {0.0001}
(assert (= (+ (+ (* sc_24 0.) of_24) slbot_24) 0.0001))
; 
; =  {(((sc.output.V[3].X*1.)+of.output.V[3].X)+sl.max.output.V[3].X)} {3300.}
(assert (= (+ (+ (* sc_24 1.) of_24) sltop_24) 3300.))
(declare-fun slbot_25 () Real)
(declare-fun sltop_25 () Real)
; 
; =  {(((sc.output.V[3].O*0.)+of.output.V[3].O)+sl.min.output.V[3].O)} {0.0001}
(assert (= (+ (+ (* sc_25 0.) of_25) slbot_25) 0.0001))
; 
; =  {(((sc.output.V[3].O*1.)+of.output.V[3].O)+sl.max.output.V[3].O)} {3300.}
(assert (= (+ (+ (* sc_25 1.) of_25) sltop_25) 3300.))
(declare-fun sc_26 () Real)
(declare-fun of_26 () Real)
(declare-fun sc_27 () Real)
(declare-fun of_27 () Real)
(assert (= sc_27 1))
(assert (= of_27 0))
; 
; =  {sc.output.V[1].O} {sc.output.V[1].X}
(assert (= sc_27 sc_26))
; 
; =  {of.output.V[1].O} {of.output.V[1].X}
(assert (= of_27 of_26))
(declare-fun slbot_26 () Real)
(declare-fun sltop_26 () Real)
; 
; =  {(((sc.output.V[1].X*0.)+of.output.V[1].X)+sl.min.output.V[1].X)} {0.0001}
(assert (= (+ (+ (* sc_26 0.) of_26) slbot_26) 0.0001))
; 
; =  {(((sc.output.V[1].X*1.)+of.output.V[1].X)+sl.max.output.V[1].X)} {3300.}
(assert (= (+ (+ (* sc_26 1.) of_26) sltop_26) 3300.))
(declare-fun slbot_27 () Real)
(declare-fun sltop_27 () Real)
; 
; =  {(((sc.output.V[1].O*0.)+of.output.V[1].O)+sl.min.output.V[1].O)} {0.0001}
(assert (= (+ (+ (* sc_27 0.) of_27) slbot_27) 0.0001))
; 
; =  {(((sc.output.V[1].O*1.)+of.output.V[1].O)+sl.max.output.V[1].O)} {3300.}
(assert (= (+ (+ (* sc_27 1.) of_27) sltop_27) 3300.))
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
(declare-fun sc_34 () Real)
(declare-fun of_34 () Real)
(assert (= sc_33 1))
(assert (= of_33 0))
; 
; =  {sc.vadd[1].OUT} {(sc.vadd[1].A*1)}
(assert (= sc_33 (* sc_31 1)))
; 
; =  {of.vadd[1].OUT} {0}
(assert (= of_33 0.))
(assert (= sc_34 1))
(assert (= of_34 0))
; 
; =  {sc.vadd[1].OUT2} {(sc.vadd[1].A*1)}
(assert (= sc_34 (* sc_31 1)))
(assert (= of_34 0))
(assert (= 0. 0))
; 
; =  {sc.vadd[1].OUT2_0} {(sc.vadd[1].A*1)}
(assert (= sc_28 (* sc_31 1)))
; 
; =  {of.vadd[1].OUT2_0} {0}
(assert (= of_28 0.))
; 
; >=  {((sc.vadd[1].OUT2_0*0.)+of.vadd[1].OUT2_0)} {3300.}
(assert (<= (+ (* sc_28 0.) of_28) 3300.))
; 
; <=  {((sc.vadd[1].OUT2_0*0.)+of.vadd[1].OUT2_0)} {0.}
(assert (>= (+ (* sc_28 0.) of_28) 0.))
; 
; >=  {((sc.vadd[1].D*4.)+of.vadd[1].D)} {3300.}
(assert (<= (+ (* sc_29 4.) of_29) 3300.))
; 
; <=  {((sc.vadd[1].D*4.)+of.vadd[1].D)} {0.0001}
(assert (>= (+ (* sc_29 4.) of_29) 0.0001))
; 
; >=  {((sc.vadd[1].C*0.)+of.vadd[1].C)} {3300.}
(assert (<= (+ (* sc_30 0.) of_30) 3300.))
; 
; <=  {((sc.vadd[1].C*0.)+of.vadd[1].C)} {0.0001}
(assert (>= (+ (* sc_30 0.) of_30) 0.0001))
; 
; >=  {((sc.vadd[1].A*0.)+of.vadd[1].A)} {3300.}
(assert (<= (+ (* sc_31 0.) of_31) 3300.))
; 
; <=  {((sc.vadd[1].A*0.)+of.vadd[1].A)} {0.0001}
(assert (>= (+ (* sc_31 0.) of_31) 0.0001))
(declare-fun slbot_34 () Real)
(declare-fun sltop_34 () Real)
; 
; =  {(((sc.vadd[1].OUT2*0.)+of.vadd[1].OUT2)+sl.min.vadd[1].OUT2)} {0.}
(assert (= (+ (+ (* sc_34 0.) of_34) slbot_34) 0.))
; 
; =  {(((sc.vadd[1].OUT2*1.)+of.vadd[1].OUT2)+sl.max.vadd[1].OUT2)} {5.}
(assert (= (+ (+ (* sc_34 1.) of_34) sltop_34) 5.))
(declare-fun slbot_32 () Real)
(declare-fun sltop_32 () Real)
; 
; =  {(((sc.vadd[1].B*0.)+of.vadd[1].B)+sl.min.vadd[1].B)} {0.0001}
(assert (= (+ (+ (* sc_32 0.) of_32) slbot_32) 0.0001))
; 
; =  {(((sc.vadd[1].B*4.)+of.vadd[1].B)+sl.max.vadd[1].B)} {3300.}
(assert (= (+ (+ (* sc_32 4.) of_32) sltop_32) 3300.))
(declare-fun slbot_33 () Real)
(declare-fun sltop_33 () Real)
; 
; =  {(((sc.vadd[1].OUT*0.)+of.vadd[1].OUT)+sl.min.vadd[1].OUT)} {-1649.99995}
(assert (= (+ (+ (* sc_33 0.) of_33) slbot_33) -1649.99995))
; 
; =  {(((sc.vadd[1].OUT*4.)+of.vadd[1].OUT)+sl.max.vadd[1].OUT)} {1649.99995}
(assert (= (+ (+ (* sc_33 4.) of_33) sltop_33) 1649.99995))
(declare-fun slbot_34 () Real)
(declare-fun sltop_34 () Real)
; 
; =  {(((sc.vadd[1].OUT2*0.)+of.vadd[1].OUT2)+sl.min.vadd[1].OUT2)} {0.}
(assert (= (+ (+ (* sc_34 0.) of_34) slbot_34) 0.))
; 
; =  {(((sc.vadd[1].OUT2*1.)+of.vadd[1].OUT2)+sl.max.vadd[1].OUT2)} {5.}
(assert (= (+ (+ (* sc_34 1.) of_34) sltop_34) 5.))
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
(declare-fun sc_42 () Real)
(declare-fun of_42 () Real)
(assert (= sc_40 1))
(assert (= of_40 0))
; 
; =  {sc.mm[3].X} {sc.mm[3].Xtot}
(assert (= sc_40 sc_39))
; 
; =  {of.mm[3].X} {(of.mm[3].Xtot-of.mm[3].XY)}
(assert (= of_40 (- of_39 of_41)))
(assert (= sc_41 1))
(assert (= of_41 0))
; 
; =  {sc.mm[3].XY} {(sc.mm[3].kf*sc.mm[3].X*sc.mm[3].Y)}
(assert (= sc_41 (* (* sc_38 sc_40) sc_42)))
(assert (= of_41 0))
(assert (= 0. 0))
; 
; =  {sc.mm[3].XY0} {(sc.mm[3].kf*sc.mm[3].X*sc.mm[3].Y)}
(assert (= sc_36 (* (* sc_38 sc_40) sc_42)))
; 
; =  {of.mm[3].XY0} {(0-0)}
(assert (= of_36 0.))
(assert (= sc_42 1))
(assert (= of_42 0))
; 
; =  {sc.mm[3].Y} {sc.mm[3].Ytot}
(assert (= sc_42 sc_37))
; 
; =  {of.mm[3].Y} {(of.mm[3].Ytot-of.mm[3].XY)}
(assert (= of_42 (- of_37 of_41)))
; 
; >=  {((sc.mm[3].kr*1.)+of.mm[3].kr)} {10.}
(assert (<= (+ (* sc_35 1.) of_35) 10.))
; 
; <=  {((sc.mm[3].kr*1.)+of.mm[3].kr)} {0.0001}
(assert (>= (+ (* sc_35 1.) of_35) 0.0001))
(declare-fun slbot_40 () Real)
(declare-fun sltop_40 () Real)
; 
; =  {(((sc.mm[3].X*0.)+of.mm[3].X)+sl.min.mm[3].X)} {-0.9999}
(assert (= (+ (+ (* sc_40 0.) of_40) slbot_40) -0.9999))
; 
; =  {(((sc.mm[3].X*1.)+of.mm[3].X)+sl.max.mm[3].X)} {3300.}
(assert (= (+ (+ (* sc_40 1.) of_40) sltop_40) 3300.))
(declare-fun slbot_41 () Real)
(declare-fun sltop_41 () Real)
; 
; =  {(((sc.mm[3].XY*0.)+of.mm[3].XY)+sl.min.mm[3].XY)} {0.}
(assert (= (+ (+ (* sc_41 0.) of_41) slbot_41) 0.))
; 
; =  {(((sc.mm[3].XY*1.)+of.mm[3].XY)+sl.max.mm[3].XY)} {1.}
(assert (= (+ (+ (* sc_41 1.) of_41) sltop_41) 1.))
(declare-fun slbot_42 () Real)
(declare-fun sltop_42 () Real)
; 
; =  {(((sc.mm[3].Y*0.)+of.mm[3].Y)+sl.min.mm[3].Y)} {-0.9999}
(assert (= (+ (+ (* sc_42 0.) of_42) slbot_42) -0.9999))
; 
; =  {(((sc.mm[3].Y*1.)+of.mm[3].Y)+sl.max.mm[3].Y)} {3300.}
(assert (= (+ (+ (* sc_42 1.) of_42) sltop_42) 3300.))
; 
; >=  {((sc.mm[3].XY0*0.)+of.mm[3].XY0)} {3300.}
(assert (<= (+ (* sc_36 0.) of_36) 3300.))
; 
; <=  {((sc.mm[3].XY0*0.)+of.mm[3].XY0)} {0.}
(assert (>= (+ (* sc_36 0.) of_36) 0.))
; 
; >=  {((sc.mm[3].Ytot*0.11)+of.mm[3].Ytot)} {3300.}
(assert (<= (+ (* sc_37 0.11) of_37) 3300.))
; 
; <=  {((sc.mm[3].Ytot*0.11)+of.mm[3].Ytot)} {0.0001}
(assert (>= (+ (* sc_37 0.11) of_37) 0.0001))
; 
; >=  {((sc.mm[3].Xtot*0.15)+of.mm[3].Xtot)} {3300.}
(assert (<= (+ (* sc_39 0.15) of_39) 3300.))
; 
; <=  {((sc.mm[3].Xtot*0.15)+of.mm[3].Xtot)} {0.0001}
(assert (>= (+ (* sc_39 0.15) of_39) 0.0001))
; 
; >=  {((sc.mm[3].kf*1.)+of.mm[3].kf)} {10.}
(assert (<= (+ (* sc_38 1.) of_38) 10.))
; 
; <=  {((sc.mm[3].kf*1.)+of.mm[3].kf)} {0.0001}
(assert (>= (+ (* sc_38 1.) of_38) 0.0001))
(declare-fun sc_43 () Real)
(declare-fun of_43 () Real)
(declare-fun sc_44 () Real)
(declare-fun of_44 () Real)
(assert (= sc_44 1))
(assert (= of_44 0))
; 
; =  {sc.input.V[2].O} {sc.input.V[2].X}
(assert (= sc_44 sc_43))
; 
; =  {of.input.V[2].O} {of.input.V[2].X}
(assert (= of_44 of_43))
; 
; >=  {((sc.input.V[2].X*0.)+of.input.V[2].X)} {5.}
(assert (<= (+ (* sc_43 0.) of_43) 5.))
; 
; <=  {((sc.input.V[2].X*0.)+of.input.V[2].X)} {0.}
(assert (>= (+ (* sc_43 0.) of_43) 0.))
; 
; >=  {((sc.input.V[2].O*0.)+of.input.V[2].O)} {5.}
(assert (<= (+ (* sc_44 0.) of_44) 5.))
; 
; <=  {((sc.input.V[2].O*0.)+of.input.V[2].O)} {0.}
(assert (>= (+ (* sc_44 0.) of_44) 0.))
(declare-fun sc_45 () Real)
(declare-fun of_45 () Real)
(declare-fun sc_46 () Real)
(declare-fun of_46 () Real)
(assert (= sc_46 1))
(assert (= of_46 0))
; 
; =  {sc.input.V[8].O} {sc.input.V[8].X}
(assert (= sc_46 sc_45))
; 
; =  {of.input.V[8].O} {of.input.V[8].X}
(assert (= of_46 of_45))
; 
; >=  {((sc.input.V[8].X*1.)+of.input.V[8].X)} {5.}
(assert (<= (+ (* sc_45 1.) of_45) 5.))
; 
; <=  {((sc.input.V[8].X*1.)+of.input.V[8].X)} {0.}
(assert (>= (+ (* sc_45 1.) of_45) 0.))
; 
; >=  {((sc.input.V[8].O*1.)+of.input.V[8].O)} {5.}
(assert (<= (+ (* sc_46 1.) of_46) 5.))
; 
; <=  {((sc.input.V[8].O*1.)+of.input.V[8].O)} {0.}
(assert (>= (+ (* sc_46 1.) of_46) 0.))
(declare-fun sc_47 () Real)
(declare-fun of_47 () Real)
(declare-fun sc_48 () Real)
(declare-fun of_48 () Real)
(assert (= sc_48 1))
(assert (= of_48 0))
; 
; =  {sc.input.V[7].O} {sc.input.V[7].X}
(assert (= sc_48 sc_47))
; 
; =  {of.input.V[7].O} {of.input.V[7].X}
(assert (= of_48 of_47))
; 
; >=  {((sc.input.V[7].X*4.)+of.input.V[7].X)} {5.}
(assert (<= (+ (* sc_47 4.) of_47) 5.))
; 
; <=  {((sc.input.V[7].X*4.)+of.input.V[7].X)} {0.}
(assert (>= (+ (* sc_47 4.) of_47) 0.))
; 
; >=  {((sc.input.V[7].O*4.)+of.input.V[7].O)} {5.}
(assert (<= (+ (* sc_48 4.) of_48) 5.))
; 
; <=  {((sc.input.V[7].O*4.)+of.input.V[7].O)} {0.}
(assert (>= (+ (* sc_48 4.) of_48) 0.))
(declare-fun sc_49 () Real)
(declare-fun of_49 () Real)
(declare-fun sc_50 () Real)
(declare-fun of_50 () Real)
(assert (= sc_50 1))
(assert (= of_50 0))
; 
; =  {sc.input.V[0].O} {sc.input.V[0].X}
(assert (= sc_50 sc_49))
; 
; =  {of.input.V[0].O} {of.input.V[0].X}
(assert (= of_50 of_49))
; 
; >=  {((sc.input.V[0].X*0.11)+of.input.V[0].X)} {5.}
(assert (<= (+ (* sc_49 0.11) of_49) 5.))
; 
; <=  {((sc.input.V[0].X*0.11)+of.input.V[0].X)} {0.}
(assert (>= (+ (* sc_49 0.11) of_49) 0.))
; 
; >=  {((sc.input.V[0].O*0.11)+of.input.V[0].O)} {5.}
(assert (<= (+ (* sc_50 0.11) of_50) 5.))
; 
; <=  {((sc.input.V[0].O*0.11)+of.input.V[0].O)} {0.}
(assert (>= (+ (* sc_50 0.11) of_50) 0.))
(declare-fun sc_51 () Real)
(declare-fun of_51 () Real)
(declare-fun sc_52 () Real)
(declare-fun of_52 () Real)
(assert (= sc_52 1))
(assert (= of_52 0))
; 
; =  {sc.input.V[6].O} {sc.input.V[6].X}
(assert (= sc_52 sc_51))
; 
; =  {of.input.V[6].O} {of.input.V[6].X}
(assert (= of_52 of_51))
; 
; >=  {((sc.input.V[6].X*0.15)+of.input.V[6].X)} {5.}
(assert (<= (+ (* sc_51 0.15) of_51) 5.))
; 
; <=  {((sc.input.V[6].X*0.15)+of.input.V[6].X)} {0.}
(assert (>= (+ (* sc_51 0.15) of_51) 0.))
; 
; >=  {((sc.input.V[6].O*0.15)+of.input.V[6].O)} {5.}
(assert (<= (+ (* sc_52 0.15) of_52) 5.))
; 
; <=  {((sc.input.V[6].O*0.15)+of.input.V[6].O)} {0.}
(assert (>= (+ (* sc_52 0.15) of_52) 0.))
(declare-fun sc_53 () Real)
(declare-fun of_53 () Real)
(declare-fun sc_54 () Real)
(declare-fun of_54 () Real)
(assert (= sc_54 1))
(assert (= of_54 0))
; 
; =  {sc.input.V[3].O} {sc.input.V[3].X}
(assert (= sc_54 sc_53))
; 
; =  {of.input.V[3].O} {of.input.V[3].X}
(assert (= of_54 of_53))
; 
; >=  {((sc.input.V[3].X*0.)+of.input.V[3].X)} {5.}
(assert (<= (+ (* sc_53 0.) of_53) 5.))
; 
; <=  {((sc.input.V[3].X*0.)+of.input.V[3].X)} {0.}
(assert (>= (+ (* sc_53 0.) of_53) 0.))
; 
; >=  {((sc.input.V[3].O*0.)+of.input.V[3].O)} {5.}
(assert (<= (+ (* sc_54 0.) of_54) 5.))
; 
; <=  {((sc.input.V[3].O*0.)+of.input.V[3].O)} {0.}
(assert (>= (+ (* sc_54 0.) of_54) 0.))
(declare-fun sc_55 () Real)
(declare-fun of_55 () Real)
(declare-fun sc_56 () Real)
(declare-fun of_56 () Real)
(assert (= sc_56 1))
(assert (= of_56 0))
; 
; =  {sc.input.V[4].O} {sc.input.V[4].X}
(assert (= sc_56 sc_55))
; 
; =  {of.input.V[4].O} {of.input.V[4].X}
(assert (= of_56 of_55))
; 
; >=  {((sc.input.V[4].X*0.)+of.input.V[4].X)} {5.}
(assert (<= (+ (* sc_55 0.) of_55) 5.))
; 
; <=  {((sc.input.V[4].X*0.)+of.input.V[4].X)} {0.}
(assert (>= (+ (* sc_55 0.) of_55) 0.))
; 
; >=  {((sc.input.V[4].O*0.)+of.input.V[4].O)} {5.}
(assert (<= (+ (* sc_56 0.) of_56) 5.))
; 
; <=  {((sc.input.V[4].O*0.)+of.input.V[4].O)} {0.}
(assert (>= (+ (* sc_56 0.) of_56) 0.))
(declare-fun sc_57 () Real)
(declare-fun of_57 () Real)
(declare-fun sc_58 () Real)
(declare-fun of_58 () Real)
(assert (= sc_58 1))
(assert (= of_58 0))
; 
; =  {sc.input.V[5].O} {sc.input.V[5].X}
(assert (= sc_58 sc_57))
; 
; =  {of.input.V[5].O} {of.input.V[5].X}
(assert (= of_58 of_57))
; 
; >=  {((sc.input.V[5].X*0.)+of.input.V[5].X)} {5.}
(assert (<= (+ (* sc_57 0.) of_57) 5.))
; 
; <=  {((sc.input.V[5].X*0.)+of.input.V[5].X)} {0.}
(assert (>= (+ (* sc_57 0.) of_57) 0.))
; 
; >=  {((sc.input.V[5].O*0.)+of.input.V[5].O)} {5.}
(assert (<= (+ (* sc_58 0.) of_58) 5.))
; 
; <=  {((sc.input.V[5].O*0.)+of.input.V[5].O)} {0.}
(assert (>= (+ (* sc_58 0.) of_58) 0.))
(declare-fun sc_59 () Real)
(declare-fun of_59 () Real)
(declare-fun sc_60 () Real)
(declare-fun of_60 () Real)
(assert (= sc_60 1))
(assert (= of_60 0))
; 
; =  {sc.input.V[1].O} {sc.input.V[1].X}
(assert (= sc_60 sc_59))
; 
; =  {of.input.V[1].O} {of.input.V[1].X}
(assert (= of_60 of_59))
; 
; >=  {((sc.input.V[1].X*0.125)+of.input.V[1].X)} {5.}
(assert (<= (+ (* sc_59 0.125) of_59) 5.))
; 
; <=  {((sc.input.V[1].X*0.125)+of.input.V[1].X)} {0.}
(assert (>= (+ (* sc_59 0.125) of_59) 0.))
; 
; >=  {((sc.input.V[1].O*0.125)+of.input.V[1].O)} {5.}
(assert (<= (+ (* sc_60 0.125) of_60) 5.))
; 
; <=  {((sc.input.V[1].O*0.125)+of.input.V[1].O)} {0.}
(assert (>= (+ (* sc_60 0.125) of_60) 0.))
(declare-fun sc_61 () Real)
(declare-fun of_61 () Real)
(declare-fun sc_62 () Real)
(declare-fun of_62 () Real)
(declare-fun sc_63 () Real)
(declare-fun of_63 () Real)
(assert (= sc_63 1))
(assert (= of_63 0))
; 
; =  {sc.itov[2].Y} {(sc.itov[2].K*sc.itov[2].X)}
(assert (= sc_63 (* sc_62 sc_61)))
; 
; =  {of.itov[2].Y} {0}
(assert (= of_63 0.))
(declare-fun slbot_61 () Real)
(declare-fun sltop_61 () Real)
; 
; =  {(((sc.itov[2].X*0.)+of.itov[2].X)+sl.min.itov[2].X)} {0.0001}
(assert (= (+ (+ (* sc_61 0.) of_61) slbot_61) 0.0001))
; 
; =  {(((sc.itov[2].X*1.)+of.itov[2].X)+sl.max.itov[2].X)} {10.}
(assert (= (+ (+ (* sc_61 1.) of_61) sltop_61) 10.))
(declare-fun slbot_63 () Real)
(declare-fun sltop_63 () Real)
; 
; =  {(((sc.itov[2].Y*0.)+of.itov[2].Y)+sl.min.itov[2].Y)} {0.0001}
(assert (= (+ (+ (* sc_63 0.) of_63) slbot_63) 0.0001))
; 
; =  {(((sc.itov[2].Y*4.)+of.itov[2].Y)+sl.max.itov[2].Y)} {3300.}
(assert (= (+ (+ (* sc_63 4.) of_63) sltop_63) 3300.))
(declare-fun slbot_62 () Real)
(declare-fun sltop_62 () Real)
; 
; =  {(((sc.itov[2].K*0.)+of.itov[2].K)+sl.min.itov[2].K)} {1.}
(assert (= (+ (+ (* sc_62 0.) of_62) slbot_62) 1.))
; 
; =  {(((sc.itov[2].K*4.)+of.itov[2].K)+sl.max.itov[2].K)} {330.}
(assert (= (+ (+ (* sc_62 4.) of_62) sltop_62) 330.))
(declare-fun slbot_63 () Real)
(declare-fun sltop_63 () Real)
; 
; =  {(((sc.itov[2].Y*0.)+of.itov[2].Y)+sl.min.itov[2].Y)} {0.0001}
(assert (= (+ (+ (* sc_63 0.) of_63) slbot_63) 0.0001))
; 
; =  {(((sc.itov[2].Y*4.)+of.itov[2].Y)+sl.max.itov[2].Y)} {3300.}
(assert (= (+ (+ (* sc_63 4.) of_63) sltop_63) 3300.))
(declare-fun sc_64 () Real)
(declare-fun of_64 () Real)
(declare-fun sc_65 () Real)
(declare-fun of_65 () Real)
(declare-fun sc_66 () Real)
(declare-fun of_66 () Real)
(declare-fun sc_67 () Real)
(declare-fun of_67 () Real)
(declare-fun sc_68 () Real)
(declare-fun of_68 () Real)
(assert (= sc_68 1))
(assert (= of_68 0))
; 
; =  {sc.iadd[4].OUT} {sc.iadd[4].A}
(assert (= sc_68 sc_66))
; 
; =  {of.iadd[4].OUT} {((of.iadd[4].A+of.iadd[4].B)-of.iadd[4].C-of.iadd[4].D)}
(assert (= of_68 (- (+ of_66 of_67) (+ of_65 of_64))))
(declare-fun slbot_64 () Real)
(declare-fun sltop_64 () Real)
; 
; =  {(((sc.iadd[4].D*0.)+of.iadd[4].D)+sl.min.iadd[4].D)} {0.}
(assert (= (+ (+ (* sc_64 0.) of_64) slbot_64) 0.))
; 
; =  {(((sc.iadd[4].D*1.)+of.iadd[4].D)+sl.max.iadd[4].D)} {5.}
(assert (= (+ (+ (* sc_64 1.) of_64) sltop_64) 5.))
; 
; >=  {((sc.iadd[4].C*0.)+of.iadd[4].C)} {5.}
(assert (<= (+ (* sc_65 0.) of_65) 5.))
; 
; <=  {((sc.iadd[4].C*0.)+of.iadd[4].C)} {0.}
(assert (>= (+ (* sc_65 0.) of_65) 0.))
(declare-fun slbot_68 () Real)
(declare-fun sltop_68 () Real)
; 
; =  {(((sc.iadd[4].OUT*0.)+of.iadd[4].OUT)+sl.min.iadd[4].OUT)} {-10.}
(assert (= (+ (+ (* sc_68 0.) of_68) slbot_68) -10.))
; 
; =  {(((sc.iadd[4].OUT*1.)+of.iadd[4].OUT)+sl.max.iadd[4].OUT)} {10.}
(assert (= (+ (+ (* sc_68 1.) of_68) sltop_68) 10.))
; 
; >=  {((sc.iadd[4].A*0.11)+of.iadd[4].A)} {5.}
(assert (<= (+ (* sc_66 0.11) of_66) 5.))
; 
; <=  {((sc.iadd[4].A*0.11)+of.iadd[4].A)} {0.}
(assert (>= (+ (* sc_66 0.11) of_66) 0.))
; 
; >=  {((sc.iadd[4].B*0.)+of.iadd[4].B)} {5.}
(assert (<= (+ (* sc_67 0.) of_67) 5.))
; 
; <=  {((sc.iadd[4].B*0.)+of.iadd[4].B)} {0.}
(assert (>= (+ (* sc_67 0.) of_67) 0.))
(declare-fun slbot_68 () Real)
(declare-fun sltop_68 () Real)
; 
; =  {(((sc.iadd[4].OUT*0.)+of.iadd[4].OUT)+sl.min.iadd[4].OUT)} {-10.}
(assert (= (+ (+ (* sc_68 0.) of_68) slbot_68) -10.))
; 
; =  {(((sc.iadd[4].OUT*1.)+of.iadd[4].OUT)+sl.max.iadd[4].OUT)} {10.}
(assert (= (+ (+ (* sc_68 1.) of_68) sltop_68) 10.))
(declare-fun sc_69 () Real)
(declare-fun of_69 () Real)
(declare-fun sc_70 () Real)
(declare-fun of_70 () Real)
(declare-fun sc_71 () Real)
(declare-fun of_71 () Real)
(declare-fun sc_72 () Real)
(declare-fun of_72 () Real)
(declare-fun sc_73 () Real)
(declare-fun of_73 () Real)
(assert (= sc_73 1))
(assert (= of_73 0))
; 
; =  {sc.iadd[5].OUT} {sc.iadd[5].A}
(assert (= sc_73 sc_71))
; 
; =  {of.iadd[5].OUT} {((of.iadd[5].A+of.iadd[5].B)-of.iadd[5].C-of.iadd[5].D)}
(assert (= of_73 (- (+ of_71 of_72) (+ of_70 of_69))))
(declare-fun slbot_69 () Real)
(declare-fun sltop_69 () Real)
; 
; =  {(((sc.iadd[5].D*0.)+of.iadd[5].D)+sl.min.iadd[5].D)} {0.}
(assert (= (+ (+ (* sc_69 0.) of_69) slbot_69) 0.))
; 
; =  {(((sc.iadd[5].D*1.)+of.iadd[5].D)+sl.max.iadd[5].D)} {5.}
(assert (= (+ (+ (* sc_69 1.) of_69) sltop_69) 5.))
; 
; >=  {((sc.iadd[5].C*0.)+of.iadd[5].C)} {5.}
(assert (<= (+ (* sc_70 0.) of_70) 5.))
; 
; <=  {((sc.iadd[5].C*0.)+of.iadd[5].C)} {0.}
(assert (>= (+ (* sc_70 0.) of_70) 0.))
(declare-fun slbot_73 () Real)
(declare-fun sltop_73 () Real)
; 
; =  {(((sc.iadd[5].OUT*0.)+of.iadd[5].OUT)+sl.min.iadd[5].OUT)} {-10.}
(assert (= (+ (+ (* sc_73 0.) of_73) slbot_73) -10.))
; 
; =  {(((sc.iadd[5].OUT*1.)+of.iadd[5].OUT)+sl.max.iadd[5].OUT)} {10.}
(assert (= (+ (+ (* sc_73 1.) of_73) sltop_73) 10.))
; 
; >=  {((sc.iadd[5].A*0.)+of.iadd[5].A)} {5.}
(assert (<= (+ (* sc_71 0.) of_71) 5.))
; 
; <=  {((sc.iadd[5].A*0.)+of.iadd[5].A)} {0.}
(assert (>= (+ (* sc_71 0.) of_71) 0.))
; 
; >=  {((sc.iadd[5].B*0.15)+of.iadd[5].B)} {5.}
(assert (<= (+ (* sc_72 0.15) of_72) 5.))
; 
; <=  {((sc.iadd[5].B*0.15)+of.iadd[5].B)} {0.}
(assert (>= (+ (* sc_72 0.15) of_72) 0.))
(declare-fun slbot_73 () Real)
(declare-fun sltop_73 () Real)
; 
; =  {(((sc.iadd[5].OUT*0.)+of.iadd[5].OUT)+sl.min.iadd[5].OUT)} {-10.}
(assert (= (+ (+ (* sc_73 0.) of_73) slbot_73) -10.))
; 
; =  {(((sc.iadd[5].OUT*1.)+of.iadd[5].OUT)+sl.max.iadd[5].OUT)} {10.}
(assert (= (+ (+ (* sc_73 1.) of_73) sltop_73) 10.))
(declare-fun sc_74 () Real)
(declare-fun of_74 () Real)
(declare-fun sc_75 () Real)
(declare-fun of_75 () Real)
(assert (= sc_75 1))
(assert (= of_75 0))
; 
; =  {sc.output.I[0].O} {sc.output.I[0].X}
(assert (= sc_75 sc_74))
; 
; =  {of.output.I[0].O} {of.output.I[0].X}
(assert (= of_75 of_74))
(declare-fun slbot_74 () Real)
(declare-fun sltop_74 () Real)
; 
; =  {(((sc.output.I[0].X*0.)+of.output.I[0].X)+sl.min.output.I[0].X)} {0.}
(assert (= (+ (+ (* sc_74 0.) of_74) slbot_74) 0.))
; 
; =  {(((sc.output.I[0].X*1.)+of.output.I[0].X)+sl.max.output.I[0].X)} {10.}
(assert (= (+ (+ (* sc_74 1.) of_74) sltop_74) 10.))
(declare-fun slbot_75 () Real)
(declare-fun sltop_75 () Real)
; 
; =  {(((sc.output.I[0].O*0.)+of.output.I[0].O)+sl.min.output.I[0].O)} {0.}
(assert (= (+ (+ (* sc_75 0.) of_75) slbot_75) 0.))
; 
; =  {(((sc.output.I[0].O*1.)+of.output.I[0].O)+sl.max.output.I[0].O)} {10.}
(assert (= (+ (+ (* sc_75 1.) of_75) sltop_75) 10.))
(declare-fun sc_76 () Real)
(declare-fun of_76 () Real)
(declare-fun sc_77 () Real)
(declare-fun of_77 () Real)
(assert (= sc_77 1))
(assert (= of_77 0))
; 
; =  {sc.output.I[1].O} {sc.output.I[1].X}
(assert (= sc_77 sc_76))
; 
; =  {of.output.I[1].O} {of.output.I[1].X}
(assert (= of_77 of_76))
(declare-fun slbot_76 () Real)
(declare-fun sltop_76 () Real)
; 
; =  {(((sc.output.I[1].X*0.)+of.output.I[1].X)+sl.min.output.I[1].X)} {0.}
(assert (= (+ (+ (* sc_76 0.) of_76) slbot_76) 0.))
; 
; =  {(((sc.output.I[1].X*1.)+of.output.I[1].X)+sl.max.output.I[1].X)} {10.}
(assert (= (+ (+ (* sc_76 1.) of_76) sltop_76) 10.))
(declare-fun slbot_77 () Real)
(declare-fun sltop_77 () Real)
; 
; =  {(((sc.output.I[1].O*0.)+of.output.I[1].O)+sl.min.output.I[1].O)} {0.}
(assert (= (+ (+ (* sc_77 0.) of_77) slbot_77) 0.))
; 
; =  {(((sc.output.I[1].O*1.)+of.output.I[1].O)+sl.max.output.I[1].O)} {10.}
(assert (= (+ (+ (* sc_77 1.) of_77) sltop_77) 10.))
; 
; =  {sc.itov[2].Y} {sc.vadd[1].B}
(assert (= sc_63 sc_32))
; 
; =  {of.itov[2].Y} {of.vadd[1].B}
(assert (= of_63 of_32))
; 
; =  {sc.input.I[6].O} {sc.mm[3].kr}
(assert (= sc_11 sc_35))
; 
; =  {of.input.I[6].O} {of.mm[3].kr}
(assert (= of_11 of_35))
; 
; =  {sc.vadd[1].OUT2} {sc.output.V[3].X}
(assert (= sc_34 sc_24))
; 
; =  {of.vadd[1].OUT2} {of.output.V[3].X}
(assert (= of_34 of_24))
; 
; =  {sc.input.I[0].O} {sc.iadd[4].A}
(assert (= sc_9 sc_66))
; 
; =  {of.input.I[0].O} {of.iadd[4].A}
(assert (= of_9 of_66))
; 
; =  {sc.iadd[4].OUT} {sc.itov[2].X}
(assert (= sc_68 sc_61))
; 
; =  {of.iadd[4].OUT} {of.itov[2].X}
(assert (= of_68 of_61))
; 
; =  {sc.iadd[4].OUT} {sc.output.I[0].X}
(assert (= sc_68 sc_74))
; 
; =  {of.iadd[4].OUT} {of.output.I[0].X}
(assert (= of_68 of_74))
; 
; =  {sc.input.I[4].O} {sc.iadd[5].A}
(assert (= sc_15 sc_71))
; 
; =  {of.input.I[4].O} {of.iadd[5].A}
(assert (= of_15 of_71))
; 
; =  {sc.input.I[3].O} {sc.iadd[5].C}
(assert (= sc_13 sc_70))
; 
; =  {of.input.I[3].O} {of.iadd[5].C}
(assert (= of_13 of_70))
; 
; =  {sc.mm[3].X} {sc.output.V[1].X}
(assert (= sc_40 sc_26))
; 
; =  {of.mm[3].X} {of.output.V[1].X}
(assert (= of_40 of_26))
; 
; =  {sc.input.I[5].O} {sc.iadd[5].B}
(assert (= sc_17 sc_72))
; 
; =  {of.input.I[5].O} {of.iadd[5].B}
(assert (= of_17 of_72))
; 
; =  {sc.input.I[2].O} {sc.iadd[4].C}
(assert (= sc_5 sc_65))
; 
; =  {of.input.I[2].O} {of.iadd[4].C}
(assert (= of_5 of_65))
; 
; =  {sc.input.V[8].O} {sc.vgain[0].X}
(assert (= sc_46 sc_0))
; 
; =  {of.input.V[8].O} {of.vgain[0].X}
(assert (= of_46 of_0))
; 
; =  {sc.input.V[3].O} {sc.vadd[1].C}
(assert (= sc_54 sc_30))
; 
; =  {of.input.V[3].O} {of.vadd[1].C}
(assert (= of_54 of_30))
; 
; =  {sc.input.V[2].O} {sc.vadd[1].OUT2_0}
(assert (= sc_44 sc_28))
; 
; =  {of.input.V[2].O} {of.vadd[1].OUT2_0}
(assert (= of_44 of_28))
; 
; =  {sc.mm[3].Y} {sc.output.V[0].X}
(assert (= sc_42 sc_22))
; 
; =  {of.mm[3].Y} {of.output.V[0].X}
(assert (= of_42 of_22))
; 
; =  {sc.iadd[5].OUT} {sc.output.I[1].X}
(assert (= sc_73 sc_76))
; 
; =  {of.iadd[5].OUT} {of.output.I[1].X}
(assert (= of_73 of_76))
; 
; =  {sc.iadd[5].OUT} {sc.vgain[0].Z}
(assert (= sc_73 sc_2))
; 
; =  {of.iadd[5].OUT} {of.vgain[0].Z}
(assert (= of_73 of_2))
; 
; =  {sc.input.I[1].O} {sc.iadd[4].B}
(assert (= sc_19 sc_67))
; 
; =  {of.input.I[1].O} {of.iadd[4].B}
(assert (= of_19 of_67))
; 
; =  {sc.input.V[1].O} {sc.vgain[0].Y}
(assert (= sc_60 sc_1))
; 
; =  {of.input.V[1].O} {of.vgain[0].Y}
(assert (= of_60 of_1))
; 
; =  {sc.input.I[7].O} {sc.mm[3].kf}
(assert (= sc_7 sc_38))
; 
; =  {of.input.I[7].O} {of.mm[3].kf}
(assert (= of_7 of_38))
; 
; =  {sc.mm[3].XY} {sc.iadd[4].D}
(assert (= sc_41 sc_64))
; 
; =  {of.mm[3].XY} {of.iadd[4].D}
(assert (= of_41 of_64))
; 
; =  {sc.mm[3].XY} {sc.output.V[2].X}
(assert (= sc_41 sc_20))
; 
; =  {of.mm[3].XY} {of.output.V[2].X}
(assert (= of_41 of_20))
; 
; =  {sc.mm[3].XY} {sc.iadd[5].D}
(assert (= sc_41 sc_69))
; 
; =  {of.mm[3].XY} {of.iadd[5].D}
(assert (= of_41 of_69))
; 
; =  {sc.vgain[0].P} {sc.itov[2].K}
(assert (= sc_3 sc_62))
; 
; =  {of.vgain[0].P} {of.itov[2].K}
(assert (= of_3 of_62))
; 
; =  {sc.input.V[7].O} {sc.vadd[1].D}
(assert (= sc_48 sc_29))
; 
; =  {of.input.V[7].O} {of.vadd[1].D}
(assert (= of_48 of_29))
; 
; =  {sc.input.V[0].O} {sc.mm[3].Ytot}
(assert (= sc_50 sc_37))
; 
; =  {of.input.V[0].O} {of.mm[3].Ytot}
(assert (= of_50 of_37))
; 
; =  {sc.input.V[4].O} {sc.vadd[1].A}
(assert (= sc_56 sc_31))
; 
; =  {of.input.V[4].O} {of.vadd[1].A}
(assert (= of_56 of_31))
; 
; =  {sc.input.V[5].O} {sc.mm[3].XY0}
(assert (= sc_58 sc_36))
; 
; =  {of.input.V[5].O} {of.mm[3].XY0}
(assert (= of_58 of_36))
; 
; =  {sc.input.V[6].O} {sc.mm[3].Xtot}
(assert (= sc_52 sc_39))
; 
; =  {of.input.V[6].O} {of.mm[3].Xtot}
(assert (= of_52 of_39))
(assert (<= (* sc_21 0.001) 0.001))
(assert (<= (* sc_25 0.001) 0.001))
; 
; =  {sc.output.V[2].O} {sc.output.V[3].O} {sc.mm[3].XY} {sc.vadd[1].OUT2}
(assert (and (and (= sc_21 sc_25) (= sc_21 sc_41)) (= sc_21 sc_34)))
(assert (= __minima__ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (* (ite (>= sltop_77 0) sltop_77 (- sltop_77)) 1.) (* (ite (>= slbot_22 0) slbot_22 (- slbot_22)) 1.)) (* (ite (>= sltop_23 0) sltop_23 (- sltop_23)) 1.)) (* (ite (>= slbot_32 0) slbot_32 (- slbot_32)) 1.)) (* (ite (>= sltop_41 0) sltop_41 (- sltop_41)) 1.)) (* (ite (>= sltop_32 0) sltop_32 (- sltop_32)) 1.)) (* (ite (>= slbot_20 0) slbot_20 (- slbot_20)) 1.)) (* (ite (>= sltop_27 0) sltop_27 (- sltop_27)) 1.)) (* (ite (>= sltop_76 0) sltop_76 (- sltop_76)) 1.)) (* (ite (>= slbot_3 0) slbot_3 (- slbot_3)) 1.)) (* (ite (>= sltop_42 0) sltop_42 (- sltop_42)) 1.)) (* (ite (>= slbot_63 0) slbot_63 (- slbot_63)) 1.)) (* (ite (>= slbot_26 0) slbot_26 (- slbot_26)) 1.)) (* (ite (>= slbot_64 0) slbot_64 (- slbot_64)) 1.)) (* (ite (>= slbot_2 0) slbot_2 (- slbot_2)) 1.)) (* (ite (>= slbot_61 0) slbot_61 (- slbot_61)) 1.)) (* (ite (>= slbot_76 0) slbot_76 (- slbot_76)) 1.)) (* (ite (>= sltop_22 0) sltop_22 (- sltop_22)) 1.)) (* (ite (>= slbot_25 0) slbot_25 (- slbot_25)) 1.)) (* (ite (>= slbot_41 0) slbot_41 (- slbot_41)) 1.)) (* (ite (>= sltop_2 0) sltop_2 (- sltop_2)) 1.)) (* (ite (>= sltop_20 0) sltop_20 (- sltop_20)) 1.)) (* (ite (>= sltop_24 0) sltop_24 (- sltop_24)) 1.)) (* (ite (>= slbot_24 0) slbot_24 (- slbot_24)) 1.)) (* (ite (>= sltop_62 0) sltop_62 (- sltop_62)) 1.)) (* (ite (>= slbot_62 0) slbot_62 (- slbot_62)) 1.)) (* (ite (>= sltop_74 0) sltop_74 (- sltop_74)) 1.)) (* (ite (>= slbot_21 0) slbot_21 (- slbot_21)) 1.)) (* (ite (>= sltop_34 0) sltop_34 (- sltop_34)) 1.)) (* (ite (>= slbot_68 0) slbot_68 (- slbot_68)) 1.)) (* (ite (>= slbot_73 0) slbot_73 (- slbot_73)) 1.)) (* (ite (>= sltop_64 0) sltop_64 (- sltop_64)) 1.)) (* (ite (>= slbot_42 0) slbot_42 (- slbot_42)) 1.)) (* (ite (>= sltop_61 0) sltop_61 (- sltop_61)) 1.)) (* (ite (>= sltop_68 0) sltop_68 (- sltop_68)) 1.)) (* (ite (>= slbot_74 0) slbot_74 (- slbot_74)) 1.)) (* (ite (>= sltop_75 0) sltop_75 (- sltop_75)) 1.)) (* (ite (>= slbot_77 0) slbot_77 (- slbot_77)) 1.)) (* (ite (>= slbot_23 0) slbot_23 (- slbot_23)) 1.)) (* (ite (>= sltop_25 0) sltop_25 (- sltop_25)) 1.)) (* (ite (>= sltop_69 0) sltop_69 (- sltop_69)) 1.)) (* (ite (>= slbot_34 0) slbot_34 (- slbot_34)) 1.)) (* (ite (>= sltop_63 0) sltop_63 (- sltop_63)) 1.)) (* (ite (>= sltop_73 0) sltop_73 (- sltop_73)) 1.)) (* (ite (>= slbot_75 0) slbot_75 (- slbot_75)) 1.)) (* (ite (>= sltop_3 0) sltop_3 (- sltop_3)) 1.)) (* (ite (>= sltop_26 0) sltop_26 (- sltop_26)) 1.)) (* (ite (>= sltop_40 0) sltop_40 (- sltop_40)) 1.)) (* (ite (>= slbot_27 0) slbot_27 (- slbot_27)) 1.)) (* (ite (>= slbot_69 0) slbot_69 (- slbot_69)) 1.)) (* (ite (>= slbot_33 0) slbot_33 (- slbot_33)) 1.)) (* (ite (>= sltop_33 0) sltop_33 (- sltop_33)) 1.)) (* (ite (>= slbot_40 0) slbot_40 (- slbot_40)) 1.)) (* (ite (>= sltop_21 0) sltop_21 (- sltop_21)) 1.))))
(check-sat)
