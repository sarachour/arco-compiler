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
(declare-fun sc_6 () Real)
(declare-fun of_6 () Real)
(declare-fun sc_7 () Real)
(declare-fun of_7 () Real)
(assert (= sc_7 1))
(assert (= of_7 0))
; 
; =  {sc.vgain[5].P} {((sc.vgain[5].X/sc.vgain[5].Y)*sc.vgain[5].Z*1)}
(assert (= sc_7 (* (* (/ sc_4 sc_5) sc_6) 1)))
; 
; =  {of.vgain[5].P} {0}
(assert (= of_7 0.))
; 
; >=  {((sc.vgain[5].X*1.)+of.vgain[5].X)} {3300.}
(assert (<= (+ (* sc_4 1.) of_4) 3300.))
; 
; <=  {((sc.vgain[5].X*1.)+of.vgain[5].X)} {0.0001}
(assert (>= (+ (* sc_4 1.) of_4) 0.0001))
; 
; >=  {((sc.vgain[5].Y*0.125)+of.vgain[5].Y)} {3300.}
(assert (<= (+ (* sc_5 0.125) of_5) 3300.))
; 
; <=  {((sc.vgain[5].Y*0.125)+of.vgain[5].Y)} {1.}
(assert (>= (+ (* sc_5 0.125) of_5) 1.))
(declare-fun slbot_7 () Real)
(declare-fun sltop_7 () Real)
; 
; =  {(((sc.vgain[5].P*0.)+of.vgain[5].P)+sl.min.vgain[5].P)} {1.51515151515e-12}
(assert (= (+ (+ (* sc_7 0.) of_7) slbot_7) 1.51515151515e-12))
; 
; =  {(((sc.vgain[5].P*4.)+of.vgain[5].P)+sl.max.vgain[5].P)} {5445000.}
(assert (= (+ (+ (* sc_7 4.) of_7) sltop_7) 5445000.))
(declare-fun slbot_6 () Real)
(declare-fun sltop_6 () Real)
; 
; =  {(((sc.vgain[5].Z*0.)+of.vgain[5].Z)+sl.min.vgain[5].Z)} {0.0001}
(assert (= (+ (+ (* sc_6 0.) of_6) slbot_6) 0.0001))
; 
; =  {(((sc.vgain[5].Z*1.)+of.vgain[5].Z)+sl.max.vgain[5].Z)} {3300.}
(assert (= (+ (+ (* sc_6 1.) of_6) sltop_6) 3300.))
(declare-fun sc_8 () Real)
(declare-fun of_8 () Real)
(declare-fun sc_9 () Real)
(declare-fun of_9 () Real)
(assert (= sc_9 1))
(assert (= of_9 0))
; 
; =  {sc.input.I[2].O} {sc.input.I[2].X}
(assert (= sc_9 sc_8))
; 
; =  {of.input.I[2].O} {of.input.I[2].X}
(assert (= of_9 of_8))
; 
; >=  {((sc.input.I[2].X*0.)+of.input.I[2].X)} {10.}
(assert (<= (+ (* sc_8 0.) of_8) 10.))
; 
; <=  {((sc.input.I[2].X*0.)+of.input.I[2].X)} {0.}
(assert (>= (+ (* sc_8 0.) of_8) 0.))
; 
; >=  {((sc.input.I[2].O*0.)+of.input.I[2].O)} {10.}
(assert (<= (+ (* sc_9 0.) of_9) 10.))
; 
; <=  {((sc.input.I[2].O*0.)+of.input.I[2].O)} {0.}
(assert (>= (+ (* sc_9 0.) of_9) 0.))
(declare-fun sc_10 () Real)
(declare-fun of_10 () Real)
(declare-fun sc_11 () Real)
(declare-fun of_11 () Real)
(assert (= sc_11 1))
(assert (= of_11 0))
; 
; =  {sc.input.I[0].O} {sc.input.I[0].X}
(assert (= sc_11 sc_10))
; 
; =  {of.input.I[0].O} {of.input.I[0].X}
(assert (= of_11 of_10))
; 
; >=  {((sc.input.I[0].X*0.11)+of.input.I[0].X)} {10.}
(assert (<= (+ (* sc_10 0.11) of_10) 10.))
; 
; <=  {((sc.input.I[0].X*0.11)+of.input.I[0].X)} {0.}
(assert (>= (+ (* sc_10 0.11) of_10) 0.))
; 
; >=  {((sc.input.I[0].O*0.11)+of.input.I[0].O)} {10.}
(assert (<= (+ (* sc_11 0.11) of_11) 10.))
; 
; <=  {((sc.input.I[0].O*0.11)+of.input.I[0].O)} {0.}
(assert (>= (+ (* sc_11 0.11) of_11) 0.))
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
; =  {sc.output.V[0].O} {sc.output.V[0].X}
(assert (= sc_21 sc_20))
; 
; =  {of.output.V[0].O} {of.output.V[0].X}
(assert (= of_21 of_20))
(declare-fun slbot_20 () Real)
(declare-fun sltop_20 () Real)
; 
; =  {(((sc.output.V[0].X*0.)+of.output.V[0].X)+sl.min.output.V[0].X)} {0.0001}
(assert (= (+ (+ (* sc_20 0.) of_20) slbot_20) 0.0001))
; 
; =  {(((sc.output.V[0].X*1.)+of.output.V[0].X)+sl.max.output.V[0].X)} {3300.}
(assert (= (+ (+ (* sc_20 1.) of_20) sltop_20) 3300.))
(declare-fun slbot_21 () Real)
(declare-fun sltop_21 () Real)
; 
; =  {(((sc.output.V[0].O*0.)+of.output.V[0].O)+sl.min.output.V[0].O)} {0.0001}
(assert (= (+ (+ (* sc_21 0.) of_21) slbot_21) 0.0001))
; 
; =  {(((sc.output.V[0].O*1.)+of.output.V[0].O)+sl.max.output.V[0].O)} {3300.}
(assert (= (+ (+ (* sc_21 1.) of_21) sltop_21) 3300.))
(declare-fun sc_22 () Real)
(declare-fun of_22 () Real)
(declare-fun sc_23 () Real)
(declare-fun of_23 () Real)
(assert (= sc_23 1))
(assert (= of_23 0))
; 
; =  {sc.output.V[1].O} {sc.output.V[1].X}
(assert (= sc_23 sc_22))
; 
; =  {of.output.V[1].O} {of.output.V[1].X}
(assert (= of_23 of_22))
(declare-fun slbot_22 () Real)
(declare-fun sltop_22 () Real)
; 
; =  {(((sc.output.V[1].X*0.)+of.output.V[1].X)+sl.min.output.V[1].X)} {0.0001}
(assert (= (+ (+ (* sc_22 0.) of_22) slbot_22) 0.0001))
; 
; =  {(((sc.output.V[1].X*1.)+of.output.V[1].X)+sl.max.output.V[1].X)} {3300.}
(assert (= (+ (+ (* sc_22 1.) of_22) sltop_22) 3300.))
(declare-fun slbot_23 () Real)
(declare-fun sltop_23 () Real)
; 
; =  {(((sc.output.V[1].O*0.)+of.output.V[1].O)+sl.min.output.V[1].O)} {0.0001}
(assert (= (+ (+ (* sc_23 0.) of_23) slbot_23) 0.0001))
; 
; =  {(((sc.output.V[1].O*1.)+of.output.V[1].O)+sl.max.output.V[1].O)} {3300.}
(assert (= (+ (+ (* sc_23 1.) of_23) sltop_23) 3300.))
(declare-fun sc_24 () Real)
(declare-fun of_24 () Real)
(declare-fun sc_25 () Real)
(declare-fun of_25 () Real)
(declare-fun sc_26 () Real)
(declare-fun of_26 () Real)
(declare-fun sc_27 () Real)
(declare-fun of_27 () Real)
(declare-fun sc_28 () Real)
(declare-fun of_28 () Real)
(declare-fun sc_29 () Real)
(declare-fun of_29 () Real)
(declare-fun sc_30 () Real)
(declare-fun of_30 () Real)
(assert (= sc_29 1))
(assert (= of_29 0))
; 
; =  {sc.vadd[6].OUT} {(sc.vadd[6].A*1)}
(assert (= sc_29 (* sc_27 1)))
; 
; =  {of.vadd[6].OUT} {0}
(assert (= of_29 0.))
(assert (= sc_30 1))
(assert (= of_30 0))
; 
; =  {sc.vadd[6].OUT2} {(sc.vadd[6].A*1)}
(assert (= sc_30 (* sc_27 1)))
(assert (= of_30 0))
(assert (= 0. 0))
; 
; =  {sc.vadd[6].OUT2_0} {(sc.vadd[6].A*1)}
(assert (= sc_24 (* sc_27 1)))
; 
; =  {of.vadd[6].OUT2_0} {0}
(assert (= of_24 0.))
; 
; >=  {((sc.vadd[6].OUT2_0*0.)+of.vadd[6].OUT2_0)} {3300.}
(assert (<= (+ (* sc_24 0.) of_24) 3300.))
; 
; <=  {((sc.vadd[6].OUT2_0*0.)+of.vadd[6].OUT2_0)} {0.}
(assert (>= (+ (* sc_24 0.) of_24) 0.))
; 
; >=  {((sc.vadd[6].D*4.)+of.vadd[6].D)} {3300.}
(assert (<= (+ (* sc_25 4.) of_25) 3300.))
; 
; <=  {((sc.vadd[6].D*4.)+of.vadd[6].D)} {0.0001}
(assert (>= (+ (* sc_25 4.) of_25) 0.0001))
; 
; >=  {((sc.vadd[6].C*0.)+of.vadd[6].C)} {3300.}
(assert (<= (+ (* sc_26 0.) of_26) 3300.))
; 
; <=  {((sc.vadd[6].C*0.)+of.vadd[6].C)} {0.0001}
(assert (>= (+ (* sc_26 0.) of_26) 0.0001))
; 
; >=  {((sc.vadd[6].A*0.)+of.vadd[6].A)} {3300.}
(assert (<= (+ (* sc_27 0.) of_27) 3300.))
; 
; <=  {((sc.vadd[6].A*0.)+of.vadd[6].A)} {0.0001}
(assert (>= (+ (* sc_27 0.) of_27) 0.0001))
(declare-fun slbot_30 () Real)
(declare-fun sltop_30 () Real)
; 
; =  {(((sc.vadd[6].OUT2*0.)+of.vadd[6].OUT2)+sl.min.vadd[6].OUT2)} {0.}
(assert (= (+ (+ (* sc_30 0.) of_30) slbot_30) 0.))
; 
; =  {(((sc.vadd[6].OUT2*1.)+of.vadd[6].OUT2)+sl.max.vadd[6].OUT2)} {5.}
(assert (= (+ (+ (* sc_30 1.) of_30) sltop_30) 5.))
(declare-fun slbot_28 () Real)
(declare-fun sltop_28 () Real)
; 
; =  {(((sc.vadd[6].B*0.)+of.vadd[6].B)+sl.min.vadd[6].B)} {0.0001}
(assert (= (+ (+ (* sc_28 0.) of_28) slbot_28) 0.0001))
; 
; =  {(((sc.vadd[6].B*4.)+of.vadd[6].B)+sl.max.vadd[6].B)} {3300.}
(assert (= (+ (+ (* sc_28 4.) of_28) sltop_28) 3300.))
(declare-fun slbot_29 () Real)
(declare-fun sltop_29 () Real)
; 
; =  {(((sc.vadd[6].OUT*0.)+of.vadd[6].OUT)+sl.min.vadd[6].OUT)} {-1649.99995}
(assert (= (+ (+ (* sc_29 0.) of_29) slbot_29) -1649.99995))
; 
; =  {(((sc.vadd[6].OUT*4.)+of.vadd[6].OUT)+sl.max.vadd[6].OUT)} {1649.99995}
(assert (= (+ (+ (* sc_29 4.) of_29) sltop_29) 1649.99995))
(declare-fun slbot_30 () Real)
(declare-fun sltop_30 () Real)
; 
; =  {(((sc.vadd[6].OUT2*0.)+of.vadd[6].OUT2)+sl.min.vadd[6].OUT2)} {0.}
(assert (= (+ (+ (* sc_30 0.) of_30) slbot_30) 0.))
; 
; =  {(((sc.vadd[6].OUT2*1.)+of.vadd[6].OUT2)+sl.max.vadd[6].OUT2)} {5.}
(assert (= (+ (+ (* sc_30 1.) of_30) sltop_30) 5.))
(declare-fun sc_31 () Real)
(declare-fun of_31 () Real)
(declare-fun sc_32 () Real)
(declare-fun of_32 () Real)
(declare-fun sc_33 () Real)
(declare-fun of_33 () Real)
(declare-fun sc_34 () Real)
(declare-fun of_34 () Real)
(declare-fun sc_35 () Real)
(declare-fun of_35 () Real)
(declare-fun sc_36 () Real)
(declare-fun of_36 () Real)
(declare-fun sc_37 () Real)
(declare-fun of_37 () Real)
(assert (= sc_36 1))
(assert (= of_36 0))
; 
; =  {sc.vadd[1].OUT} {(sc.vadd[1].A*1)}
(assert (= sc_36 (* sc_34 1)))
; 
; =  {of.vadd[1].OUT} {0}
(assert (= of_36 0.))
(assert (= sc_37 1))
(assert (= of_37 0))
; 
; =  {sc.vadd[1].OUT2} {(sc.vadd[1].A*1)}
(assert (= sc_37 (* sc_34 1)))
(assert (= of_37 0))
(assert (= 0. 0))
; 
; =  {sc.vadd[1].OUT2_0} {(sc.vadd[1].A*1)}
(assert (= sc_31 (* sc_34 1)))
; 
; =  {of.vadd[1].OUT2_0} {0}
(assert (= of_31 0.))
; 
; >=  {((sc.vadd[1].OUT2_0*0.)+of.vadd[1].OUT2_0)} {3300.}
(assert (<= (+ (* sc_31 0.) of_31) 3300.))
; 
; <=  {((sc.vadd[1].OUT2_0*0.)+of.vadd[1].OUT2_0)} {0.}
(assert (>= (+ (* sc_31 0.) of_31) 0.))
; 
; >=  {((sc.vadd[1].D*4.)+of.vadd[1].D)} {3300.}
(assert (<= (+ (* sc_32 4.) of_32) 3300.))
; 
; <=  {((sc.vadd[1].D*4.)+of.vadd[1].D)} {0.0001}
(assert (>= (+ (* sc_32 4.) of_32) 0.0001))
; 
; >=  {((sc.vadd[1].C*0.)+of.vadd[1].C)} {3300.}
(assert (<= (+ (* sc_33 0.) of_33) 3300.))
; 
; <=  {((sc.vadd[1].C*0.)+of.vadd[1].C)} {0.0001}
(assert (>= (+ (* sc_33 0.) of_33) 0.0001))
; 
; >=  {((sc.vadd[1].A*0.)+of.vadd[1].A)} {3300.}
(assert (<= (+ (* sc_34 0.) of_34) 3300.))
; 
; <=  {((sc.vadd[1].A*0.)+of.vadd[1].A)} {0.0001}
(assert (>= (+ (* sc_34 0.) of_34) 0.0001))
(declare-fun slbot_37 () Real)
(declare-fun sltop_37 () Real)
; 
; =  {(((sc.vadd[1].OUT2*0.)+of.vadd[1].OUT2)+sl.min.vadd[1].OUT2)} {0.}
(assert (= (+ (+ (* sc_37 0.) of_37) slbot_37) 0.))
; 
; =  {(((sc.vadd[1].OUT2*1.)+of.vadd[1].OUT2)+sl.max.vadd[1].OUT2)} {5.}
(assert (= (+ (+ (* sc_37 1.) of_37) sltop_37) 5.))
(declare-fun slbot_35 () Real)
(declare-fun sltop_35 () Real)
; 
; =  {(((sc.vadd[1].B*0.)+of.vadd[1].B)+sl.min.vadd[1].B)} {0.0001}
(assert (= (+ (+ (* sc_35 0.) of_35) slbot_35) 0.0001))
; 
; =  {(((sc.vadd[1].B*4.)+of.vadd[1].B)+sl.max.vadd[1].B)} {3300.}
(assert (= (+ (+ (* sc_35 4.) of_35) sltop_35) 3300.))
(declare-fun slbot_36 () Real)
(declare-fun sltop_36 () Real)
; 
; =  {(((sc.vadd[1].OUT*0.)+of.vadd[1].OUT)+sl.min.vadd[1].OUT)} {-1649.99995}
(assert (= (+ (+ (* sc_36 0.) of_36) slbot_36) -1649.99995))
; 
; =  {(((sc.vadd[1].OUT*4.)+of.vadd[1].OUT)+sl.max.vadd[1].OUT)} {1649.99995}
(assert (= (+ (+ (* sc_36 4.) of_36) sltop_36) 1649.99995))
(declare-fun slbot_37 () Real)
(declare-fun sltop_37 () Real)
; 
; =  {(((sc.vadd[1].OUT2*0.)+of.vadd[1].OUT2)+sl.min.vadd[1].OUT2)} {0.}
(assert (= (+ (+ (* sc_37 0.) of_37) slbot_37) 0.))
; 
; =  {(((sc.vadd[1].OUT2*1.)+of.vadd[1].OUT2)+sl.max.vadd[1].OUT2)} {5.}
(assert (= (+ (+ (* sc_37 1.) of_37) sltop_37) 5.))
(declare-fun sc_38 () Real)
(declare-fun of_38 () Real)
(declare-fun sc_39 () Real)
(declare-fun of_39 () Real)
(declare-fun sc_40 () Real)
(declare-fun of_40 () Real)
(assert (= sc_40 1))
(assert (= of_40 0))
; 
; =  {sc.vtoi[0].Y} {((1/sc.vtoi[0].K)*sc.vtoi[0].X)}
(assert (= sc_40 (* (/ 1 sc_39) sc_38)))
; 
; =  {of.vtoi[0].Y} {0}
(assert (= of_40 0.))
(declare-fun slbot_38 () Real)
(declare-fun sltop_38 () Real)
; 
; =  {(((sc.vtoi[0].X*0.)+of.vtoi[0].X)+sl.min.vtoi[0].X)} {1.}
(assert (= (+ (+ (* sc_38 0.) of_38) slbot_38) 1.))
; 
; =  {(((sc.vtoi[0].X*1.)+of.vtoi[0].X)+sl.max.vtoi[0].X)} {3300.}
(assert (= (+ (+ (* sc_38 1.) of_38) sltop_38) 3300.))
; 
; >=  {((sc.vtoi[0].K*1.)+of.vtoi[0].K)} {3300.}
(assert (<= (+ (* sc_39 1.) of_39) 3300.))
; 
; <=  {((sc.vtoi[0].K*1.)+of.vtoi[0].K)} {1.}
(assert (>= (+ (* sc_39 1.) of_39) 1.))
(declare-fun slbot_40 () Real)
(declare-fun sltop_40 () Real)
; 
; =  {(((sc.vtoi[0].Y*0.)+of.vtoi[0].Y)+sl.min.vtoi[0].Y)} {0.00030303030303}
(assert (= (+ (+ (* sc_40 0.) of_40) slbot_40) 0.00030303030303))
; 
; =  {(((sc.vtoi[0].Y*1.)+of.vtoi[0].Y)+sl.max.vtoi[0].Y)} {3300.}
(assert (= (+ (+ (* sc_40 1.) of_40) sltop_40) 3300.))
(declare-fun sc_41 () Real)
(declare-fun of_41 () Real)
(declare-fun sc_42 () Real)
(declare-fun of_42 () Real)
(declare-fun sc_43 () Real)
(declare-fun of_43 () Real)
(assert (= sc_43 1))
(assert (= of_43 0))
; 
; =  {sc.vtoi[3].Y} {((1/sc.vtoi[3].K)*sc.vtoi[3].X)}
(assert (= sc_43 (* (/ 1 sc_42) sc_41)))
; 
; =  {of.vtoi[3].Y} {0}
(assert (= of_43 0.))
(declare-fun slbot_41 () Real)
(declare-fun sltop_41 () Real)
; 
; =  {(((sc.vtoi[3].X*0.)+of.vtoi[3].X)+sl.min.vtoi[3].X)} {1.}
(assert (= (+ (+ (* sc_41 0.) of_41) slbot_41) 1.))
; 
; =  {(((sc.vtoi[3].X*1.)+of.vtoi[3].X)+sl.max.vtoi[3].X)} {3300.}
(assert (= (+ (+ (* sc_41 1.) of_41) sltop_41) 3300.))
; 
; >=  {((sc.vtoi[3].K*1.)+of.vtoi[3].K)} {3300.}
(assert (<= (+ (* sc_42 1.) of_42) 3300.))
; 
; <=  {((sc.vtoi[3].K*1.)+of.vtoi[3].K)} {1.}
(assert (>= (+ (* sc_42 1.) of_42) 1.))
(declare-fun slbot_43 () Real)
(declare-fun sltop_43 () Real)
; 
; =  {(((sc.vtoi[3].Y*0.)+of.vtoi[3].Y)+sl.min.vtoi[3].Y)} {0.00030303030303}
(assert (= (+ (+ (* sc_43 0.) of_43) slbot_43) 0.00030303030303))
; 
; =  {(((sc.vtoi[3].Y*1.)+of.vtoi[3].Y)+sl.max.vtoi[3].Y)} {3300.}
(assert (= (+ (+ (* sc_43 1.) of_43) sltop_43) 3300.))
(declare-fun sc_44 () Real)
(declare-fun of_44 () Real)
(declare-fun sc_45 () Real)
(declare-fun of_45 () Real)
(assert (= sc_45 1))
(assert (= of_45 0))
; 
; =  {sc.input.V[20].O} {sc.input.V[20].X}
(assert (= sc_45 sc_44))
; 
; =  {of.input.V[20].O} {of.input.V[20].X}
(assert (= of_45 of_44))
; 
; >=  {((sc.input.V[20].X*1.)+of.input.V[20].X)} {5.}
(assert (<= (+ (* sc_44 1.) of_44) 5.))
; 
; <=  {((sc.input.V[20].X*1.)+of.input.V[20].X)} {0.}
(assert (>= (+ (* sc_44 1.) of_44) 0.))
; 
; >=  {((sc.input.V[20].O*1.)+of.input.V[20].O)} {5.}
(assert (<= (+ (* sc_45 1.) of_45) 5.))
; 
; <=  {((sc.input.V[20].O*1.)+of.input.V[20].O)} {0.}
(assert (>= (+ (* sc_45 1.) of_45) 0.))
(declare-fun sc_46 () Real)
(declare-fun of_46 () Real)
(declare-fun sc_47 () Real)
(declare-fun of_47 () Real)
(assert (= sc_47 1))
(assert (= of_47 0))
; 
; =  {sc.input.V[2].O} {sc.input.V[2].X}
(assert (= sc_47 sc_46))
; 
; =  {of.input.V[2].O} {of.input.V[2].X}
(assert (= of_47 of_46))
; 
; >=  {((sc.input.V[2].X*0.)+of.input.V[2].X)} {5.}
(assert (<= (+ (* sc_46 0.) of_46) 5.))
; 
; <=  {((sc.input.V[2].X*0.)+of.input.V[2].X)} {0.}
(assert (>= (+ (* sc_46 0.) of_46) 0.))
; 
; >=  {((sc.input.V[2].O*0.)+of.input.V[2].O)} {5.}
(assert (<= (+ (* sc_47 0.) of_47) 5.))
; 
; <=  {((sc.input.V[2].O*0.)+of.input.V[2].O)} {0.}
(assert (>= (+ (* sc_47 0.) of_47) 0.))
(declare-fun sc_48 () Real)
(declare-fun of_48 () Real)
(declare-fun sc_49 () Real)
(declare-fun of_49 () Real)
(assert (= sc_49 1))
(assert (= of_49 0))
; 
; =  {sc.input.V[8].O} {sc.input.V[8].X}
(assert (= sc_49 sc_48))
; 
; =  {of.input.V[8].O} {of.input.V[8].X}
(assert (= of_49 of_48))
; 
; >=  {((sc.input.V[8].X*4.)+of.input.V[8].X)} {5.}
(assert (<= (+ (* sc_48 4.) of_48) 5.))
; 
; <=  {((sc.input.V[8].X*4.)+of.input.V[8].X)} {0.}
(assert (>= (+ (* sc_48 4.) of_48) 0.))
; 
; >=  {((sc.input.V[8].O*4.)+of.input.V[8].O)} {5.}
(assert (<= (+ (* sc_49 4.) of_49) 5.))
; 
; <=  {((sc.input.V[8].O*4.)+of.input.V[8].O)} {0.}
(assert (>= (+ (* sc_49 4.) of_49) 0.))
(declare-fun sc_50 () Real)
(declare-fun of_50 () Real)
(declare-fun sc_51 () Real)
(declare-fun of_51 () Real)
(assert (= sc_51 1))
(assert (= of_51 0))
; 
; =  {sc.input.V[7].O} {sc.input.V[7].X}
(assert (= sc_51 sc_50))
; 
; =  {of.input.V[7].O} {of.input.V[7].X}
(assert (= of_51 of_50))
; 
; >=  {((sc.input.V[7].X*0.)+of.input.V[7].X)} {5.}
(assert (<= (+ (* sc_50 0.) of_50) 5.))
; 
; <=  {((sc.input.V[7].X*0.)+of.input.V[7].X)} {0.}
(assert (>= (+ (* sc_50 0.) of_50) 0.))
; 
; >=  {((sc.input.V[7].O*0.)+of.input.V[7].O)} {5.}
(assert (<= (+ (* sc_51 0.) of_51) 5.))
; 
; <=  {((sc.input.V[7].O*0.)+of.input.V[7].O)} {0.}
(assert (>= (+ (* sc_51 0.) of_51) 0.))
(declare-fun sc_52 () Real)
(declare-fun of_52 () Real)
(declare-fun sc_53 () Real)
(declare-fun of_53 () Real)
(assert (= sc_53 1))
(assert (= of_53 0))
; 
; =  {sc.input.V[9].O} {sc.input.V[9].X}
(assert (= sc_53 sc_52))
; 
; =  {of.input.V[9].O} {of.input.V[9].X}
(assert (= of_53 of_52))
; 
; >=  {((sc.input.V[9].X*4.)+of.input.V[9].X)} {5.}
(assert (<= (+ (* sc_52 4.) of_52) 5.))
; 
; <=  {((sc.input.V[9].X*4.)+of.input.V[9].X)} {0.}
(assert (>= (+ (* sc_52 4.) of_52) 0.))
; 
; >=  {((sc.input.V[9].O*4.)+of.input.V[9].O)} {5.}
(assert (<= (+ (* sc_53 4.) of_53) 5.))
; 
; <=  {((sc.input.V[9].O*4.)+of.input.V[9].O)} {0.}
(assert (>= (+ (* sc_53 4.) of_53) 0.))
(declare-fun sc_54 () Real)
(declare-fun of_54 () Real)
(declare-fun sc_55 () Real)
(declare-fun of_55 () Real)
(assert (= sc_55 1))
(assert (= of_55 0))
; 
; =  {sc.input.V[0].O} {sc.input.V[0].X}
(assert (= sc_55 sc_54))
; 
; =  {of.input.V[0].O} {of.input.V[0].X}
(assert (= of_55 of_54))
; 
; >=  {((sc.input.V[0].X*0.125)+of.input.V[0].X)} {5.}
(assert (<= (+ (* sc_54 0.125) of_54) 5.))
; 
; <=  {((sc.input.V[0].X*0.125)+of.input.V[0].X)} {0.}
(assert (>= (+ (* sc_54 0.125) of_54) 0.))
; 
; >=  {((sc.input.V[0].O*0.125)+of.input.V[0].O)} {5.}
(assert (<= (+ (* sc_55 0.125) of_55) 5.))
; 
; <=  {((sc.input.V[0].O*0.125)+of.input.V[0].O)} {0.}
(assert (>= (+ (* sc_55 0.125) of_55) 0.))
(declare-fun sc_56 () Real)
(declare-fun of_56 () Real)
(declare-fun sc_57 () Real)
(declare-fun of_57 () Real)
(assert (= sc_57 1))
(assert (= of_57 0))
; 
; =  {sc.input.V[11].O} {sc.input.V[11].X}
(assert (= sc_57 sc_56))
; 
; =  {of.input.V[11].O} {of.input.V[11].X}
(assert (= of_57 of_56))
; 
; >=  {((sc.input.V[11].X*1.)+of.input.V[11].X)} {5.}
(assert (<= (+ (* sc_56 1.) of_56) 5.))
; 
; <=  {((sc.input.V[11].X*1.)+of.input.V[11].X)} {0.}
(assert (>= (+ (* sc_56 1.) of_56) 0.))
; 
; >=  {((sc.input.V[11].O*1.)+of.input.V[11].O)} {5.}
(assert (<= (+ (* sc_57 1.) of_57) 5.))
; 
; <=  {((sc.input.V[11].O*1.)+of.input.V[11].O)} {0.}
(assert (>= (+ (* sc_57 1.) of_57) 0.))
(declare-fun sc_58 () Real)
(declare-fun of_58 () Real)
(declare-fun sc_59 () Real)
(declare-fun of_59 () Real)
(assert (= sc_59 1))
(assert (= of_59 0))
; 
; =  {sc.input.V[10].O} {sc.input.V[10].X}
(assert (= sc_59 sc_58))
; 
; =  {of.input.V[10].O} {of.input.V[10].X}
(assert (= of_59 of_58))
; 
; >=  {((sc.input.V[10].X*1.)+of.input.V[10].X)} {5.}
(assert (<= (+ (* sc_58 1.) of_58) 5.))
; 
; <=  {((sc.input.V[10].X*1.)+of.input.V[10].X)} {0.}
(assert (>= (+ (* sc_58 1.) of_58) 0.))
; 
; >=  {((sc.input.V[10].O*1.)+of.input.V[10].O)} {5.}
(assert (<= (+ (* sc_59 1.) of_59) 5.))
; 
; <=  {((sc.input.V[10].O*1.)+of.input.V[10].O)} {0.}
(assert (>= (+ (* sc_59 1.) of_59) 0.))
(declare-fun sc_60 () Real)
(declare-fun of_60 () Real)
(declare-fun sc_61 () Real)
(declare-fun of_61 () Real)
(assert (= sc_61 1))
(assert (= of_61 0))
; 
; =  {sc.input.V[6].O} {sc.input.V[6].X}
(assert (= sc_61 sc_60))
; 
; =  {of.input.V[6].O} {of.input.V[6].X}
(assert (= of_61 of_60))
; 
; >=  {((sc.input.V[6].X*0.)+of.input.V[6].X)} {5.}
(assert (<= (+ (* sc_60 0.) of_60) 5.))
; 
; <=  {((sc.input.V[6].X*0.)+of.input.V[6].X)} {0.}
(assert (>= (+ (* sc_60 0.) of_60) 0.))
; 
; >=  {((sc.input.V[6].O*0.)+of.input.V[6].O)} {5.}
(assert (<= (+ (* sc_61 0.) of_61) 5.))
; 
; <=  {((sc.input.V[6].O*0.)+of.input.V[6].O)} {0.}
(assert (>= (+ (* sc_61 0.) of_61) 0.))
(declare-fun sc_62 () Real)
(declare-fun of_62 () Real)
(declare-fun sc_63 () Real)
(declare-fun of_63 () Real)
(assert (= sc_63 1))
(assert (= of_63 0))
; 
; =  {sc.input.V[21].O} {sc.input.V[21].X}
(assert (= sc_63 sc_62))
; 
; =  {of.input.V[21].O} {of.input.V[21].X}
(assert (= of_63 of_62))
; 
; >=  {((sc.input.V[21].X*1.)+of.input.V[21].X)} {5.}
(assert (<= (+ (* sc_62 1.) of_62) 5.))
; 
; <=  {((sc.input.V[21].X*1.)+of.input.V[21].X)} {0.}
(assert (>= (+ (* sc_62 1.) of_62) 0.))
; 
; >=  {((sc.input.V[21].O*1.)+of.input.V[21].O)} {5.}
(assert (<= (+ (* sc_63 1.) of_63) 5.))
; 
; <=  {((sc.input.V[21].O*1.)+of.input.V[21].O)} {0.}
(assert (>= (+ (* sc_63 1.) of_63) 0.))
(declare-fun sc_64 () Real)
(declare-fun of_64 () Real)
(declare-fun sc_65 () Real)
(declare-fun of_65 () Real)
(assert (= sc_65 1))
(assert (= of_65 0))
; 
; =  {sc.input.V[3].O} {sc.input.V[3].X}
(assert (= sc_65 sc_64))
; 
; =  {of.input.V[3].O} {of.input.V[3].X}
(assert (= of_65 of_64))
; 
; >=  {((sc.input.V[3].X*0.)+of.input.V[3].X)} {5.}
(assert (<= (+ (* sc_64 0.) of_64) 5.))
; 
; <=  {((sc.input.V[3].X*0.)+of.input.V[3].X)} {0.}
(assert (>= (+ (* sc_64 0.) of_64) 0.))
; 
; >=  {((sc.input.V[3].O*0.)+of.input.V[3].O)} {5.}
(assert (<= (+ (* sc_65 0.) of_65) 5.))
; 
; <=  {((sc.input.V[3].O*0.)+of.input.V[3].O)} {0.}
(assert (>= (+ (* sc_65 0.) of_65) 0.))
(declare-fun sc_66 () Real)
(declare-fun of_66 () Real)
(declare-fun sc_67 () Real)
(declare-fun of_67 () Real)
(assert (= sc_67 1))
(assert (= of_67 0))
; 
; =  {sc.input.V[4].O} {sc.input.V[4].X}
(assert (= sc_67 sc_66))
; 
; =  {of.input.V[4].O} {of.input.V[4].X}
(assert (= of_67 of_66))
; 
; >=  {((sc.input.V[4].X*0.)+of.input.V[4].X)} {5.}
(assert (<= (+ (* sc_66 0.) of_66) 5.))
; 
; <=  {((sc.input.V[4].X*0.)+of.input.V[4].X)} {0.}
(assert (>= (+ (* sc_66 0.) of_66) 0.))
; 
; >=  {((sc.input.V[4].O*0.)+of.input.V[4].O)} {5.}
(assert (<= (+ (* sc_67 0.) of_67) 5.))
; 
; <=  {((sc.input.V[4].O*0.)+of.input.V[4].O)} {0.}
(assert (>= (+ (* sc_67 0.) of_67) 0.))
(declare-fun sc_68 () Real)
(declare-fun of_68 () Real)
(declare-fun sc_69 () Real)
(declare-fun of_69 () Real)
(assert (= sc_69 1))
(assert (= of_69 0))
; 
; =  {sc.input.V[5].O} {sc.input.V[5].X}
(assert (= sc_69 sc_68))
; 
; =  {of.input.V[5].O} {of.input.V[5].X}
(assert (= of_69 of_68))
; 
; >=  {((sc.input.V[5].X*0.)+of.input.V[5].X)} {5.}
(assert (<= (+ (* sc_68 0.) of_68) 5.))
; 
; <=  {((sc.input.V[5].X*0.)+of.input.V[5].X)} {0.}
(assert (>= (+ (* sc_68 0.) of_68) 0.))
; 
; >=  {((sc.input.V[5].O*0.)+of.input.V[5].O)} {5.}
(assert (<= (+ (* sc_69 0.) of_69) 5.))
; 
; <=  {((sc.input.V[5].O*0.)+of.input.V[5].O)} {0.}
(assert (>= (+ (* sc_69 0.) of_69) 0.))
(declare-fun sc_70 () Real)
(declare-fun of_70 () Real)
(declare-fun sc_71 () Real)
(declare-fun of_71 () Real)
(assert (= sc_71 1))
(assert (= of_71 0))
; 
; =  {sc.input.V[1].O} {sc.input.V[1].X}
(assert (= sc_71 sc_70))
; 
; =  {of.input.V[1].O} {of.input.V[1].X}
(assert (= of_71 of_70))
; 
; >=  {((sc.input.V[1].X*0.125)+of.input.V[1].X)} {5.}
(assert (<= (+ (* sc_70 0.125) of_70) 5.))
; 
; <=  {((sc.input.V[1].X*0.125)+of.input.V[1].X)} {0.}
(assert (>= (+ (* sc_70 0.125) of_70) 0.))
; 
; >=  {((sc.input.V[1].O*0.125)+of.input.V[1].O)} {5.}
(assert (<= (+ (* sc_71 0.125) of_71) 5.))
; 
; <=  {((sc.input.V[1].O*0.125)+of.input.V[1].O)} {0.}
(assert (>= (+ (* sc_71 0.125) of_71) 0.))
(declare-fun sc_72 () Real)
(declare-fun of_72 () Real)
(declare-fun sc_73 () Real)
(declare-fun of_73 () Real)
(declare-fun sc_74 () Real)
(declare-fun of_74 () Real)
(assert (= sc_74 1))
(assert (= of_74 0))
; 
; =  {sc.itov[2].Y} {(sc.itov[2].K*sc.itov[2].X)}
(assert (= sc_74 (* sc_73 sc_72)))
; 
; =  {of.itov[2].Y} {0}
(assert (= of_74 0.))
(declare-fun slbot_72 () Real)
(declare-fun sltop_72 () Real)
; 
; =  {(((sc.itov[2].X*0.)+of.itov[2].X)+sl.min.itov[2].X)} {0.0001}
(assert (= (+ (+ (* sc_72 0.) of_72) slbot_72) 0.0001))
; 
; =  {(((sc.itov[2].X*1.)+of.itov[2].X)+sl.max.itov[2].X)} {10.}
(assert (= (+ (+ (* sc_72 1.) of_72) sltop_72) 10.))
(declare-fun slbot_74 () Real)
(declare-fun sltop_74 () Real)
; 
; =  {(((sc.itov[2].Y*0.)+of.itov[2].Y)+sl.min.itov[2].Y)} {0.0001}
(assert (= (+ (+ (* sc_74 0.) of_74) slbot_74) 0.0001))
; 
; =  {(((sc.itov[2].Y*4.)+of.itov[2].Y)+sl.max.itov[2].Y)} {3300.}
(assert (= (+ (+ (* sc_74 4.) of_74) sltop_74) 3300.))
(declare-fun slbot_73 () Real)
(declare-fun sltop_73 () Real)
; 
; =  {(((sc.itov[2].K*0.)+of.itov[2].K)+sl.min.itov[2].K)} {1.}
(assert (= (+ (+ (* sc_73 0.) of_73) slbot_73) 1.))
; 
; =  {(((sc.itov[2].K*4.)+of.itov[2].K)+sl.max.itov[2].K)} {330.}
(assert (= (+ (+ (* sc_73 4.) of_73) sltop_73) 330.))
(declare-fun slbot_74 () Real)
(declare-fun sltop_74 () Real)
; 
; =  {(((sc.itov[2].Y*0.)+of.itov[2].Y)+sl.min.itov[2].Y)} {0.0001}
(assert (= (+ (+ (* sc_74 0.) of_74) slbot_74) 0.0001))
; 
; =  {(((sc.itov[2].Y*4.)+of.itov[2].Y)+sl.max.itov[2].Y)} {3300.}
(assert (= (+ (+ (* sc_74 4.) of_74) sltop_74) 3300.))
(declare-fun sc_75 () Real)
(declare-fun of_75 () Real)
(declare-fun sc_76 () Real)
(declare-fun of_76 () Real)
(declare-fun sc_77 () Real)
(declare-fun of_77 () Real)
(assert (= sc_77 1))
(assert (= of_77 0))
; 
; =  {sc.itov[7].Y} {(sc.itov[7].K*sc.itov[7].X)}
(assert (= sc_77 (* sc_76 sc_75)))
; 
; =  {of.itov[7].Y} {0}
(assert (= of_77 0.))
(declare-fun slbot_75 () Real)
(declare-fun sltop_75 () Real)
; 
; =  {(((sc.itov[7].X*0.)+of.itov[7].X)+sl.min.itov[7].X)} {0.0001}
(assert (= (+ (+ (* sc_75 0.) of_75) slbot_75) 0.0001))
; 
; =  {(((sc.itov[7].X*1.)+of.itov[7].X)+sl.max.itov[7].X)} {10.}
(assert (= (+ (+ (* sc_75 1.) of_75) sltop_75) 10.))
(declare-fun slbot_77 () Real)
(declare-fun sltop_77 () Real)
; 
; =  {(((sc.itov[7].Y*0.)+of.itov[7].Y)+sl.min.itov[7].Y)} {0.0001}
(assert (= (+ (+ (* sc_77 0.) of_77) slbot_77) 0.0001))
; 
; =  {(((sc.itov[7].Y*4.)+of.itov[7].Y)+sl.max.itov[7].Y)} {3300.}
(assert (= (+ (+ (* sc_77 4.) of_77) sltop_77) 3300.))
(declare-fun slbot_76 () Real)
(declare-fun sltop_76 () Real)
; 
; =  {(((sc.itov[7].K*0.)+of.itov[7].K)+sl.min.itov[7].K)} {1.}
(assert (= (+ (+ (* sc_76 0.) of_76) slbot_76) 1.))
; 
; =  {(((sc.itov[7].K*4.)+of.itov[7].K)+sl.max.itov[7].K)} {330.}
(assert (= (+ (+ (* sc_76 4.) of_76) sltop_76) 330.))
(declare-fun slbot_77 () Real)
(declare-fun sltop_77 () Real)
; 
; =  {(((sc.itov[7].Y*0.)+of.itov[7].Y)+sl.min.itov[7].Y)} {0.0001}
(assert (= (+ (+ (* sc_77 0.) of_77) slbot_77) 0.0001))
; 
; =  {(((sc.itov[7].Y*4.)+of.itov[7].Y)+sl.max.itov[7].Y)} {3300.}
(assert (= (+ (+ (* sc_77 4.) of_77) sltop_77) 3300.))
(declare-fun sc_78 () Real)
(declare-fun of_78 () Real)
(declare-fun sc_79 () Real)
(declare-fun of_79 () Real)
(declare-fun sc_80 () Real)
(declare-fun of_80 () Real)
(declare-fun sc_81 () Real)
(declare-fun of_81 () Real)
(declare-fun sc_82 () Real)
(declare-fun of_82 () Real)
(assert (= sc_82 1))
(assert (= of_82 0))
; 
; =  {sc.iadd[3].OUT} {sc.iadd[3].A}
(assert (= sc_82 sc_80))
; 
; =  {of.iadd[3].OUT} {((of.iadd[3].A+of.iadd[3].B)-of.iadd[3].C-of.iadd[3].D)}
(assert (= of_82 (- (+ of_80 of_81) (+ of_79 of_78))))
(declare-fun slbot_78 () Real)
(declare-fun sltop_78 () Real)
; 
; =  {(((sc.iadd[3].D*0.)+of.iadd[3].D)+sl.min.iadd[3].D)} {0.}
(assert (= (+ (+ (* sc_78 0.) of_78) slbot_78) 0.))
; 
; =  {(((sc.iadd[3].D*1.)+of.iadd[3].D)+sl.max.iadd[3].D)} {5.}
(assert (= (+ (+ (* sc_78 1.) of_78) sltop_78) 5.))
; 
; >=  {((sc.iadd[3].C*0.)+of.iadd[3].C)} {5.}
(assert (<= (+ (* sc_79 0.) of_79) 5.))
; 
; <=  {((sc.iadd[3].C*0.)+of.iadd[3].C)} {0.}
(assert (>= (+ (* sc_79 0.) of_79) 0.))
(declare-fun slbot_82 () Real)
(declare-fun sltop_82 () Real)
; 
; =  {(((sc.iadd[3].OUT*0.)+of.iadd[3].OUT)+sl.min.iadd[3].OUT)} {-10.}
(assert (= (+ (+ (* sc_82 0.) of_82) slbot_82) -10.))
; 
; =  {(((sc.iadd[3].OUT*1.)+of.iadd[3].OUT)+sl.max.iadd[3].OUT)} {10.}
(assert (= (+ (+ (* sc_82 1.) of_82) sltop_82) 10.))
; 
; >=  {((sc.iadd[3].A*0.11)+of.iadd[3].A)} {5.}
(assert (<= (+ (* sc_80 0.11) of_80) 5.))
; 
; <=  {((sc.iadd[3].A*0.11)+of.iadd[3].A)} {0.}
(assert (>= (+ (* sc_80 0.11) of_80) 0.))
; 
; >=  {((sc.iadd[3].B*0.)+of.iadd[3].B)} {5.}
(assert (<= (+ (* sc_81 0.) of_81) 5.))
; 
; <=  {((sc.iadd[3].B*0.)+of.iadd[3].B)} {0.}
(assert (>= (+ (* sc_81 0.) of_81) 0.))
(declare-fun slbot_82 () Real)
(declare-fun sltop_82 () Real)
; 
; =  {(((sc.iadd[3].OUT*0.)+of.iadd[3].OUT)+sl.min.iadd[3].OUT)} {-10.}
(assert (= (+ (+ (* sc_82 0.) of_82) slbot_82) -10.))
; 
; =  {(((sc.iadd[3].OUT*1.)+of.iadd[3].OUT)+sl.max.iadd[3].OUT)} {10.}
(assert (= (+ (+ (* sc_82 1.) of_82) sltop_82) 10.))
(declare-fun sc_83 () Real)
(declare-fun of_83 () Real)
(declare-fun sc_84 () Real)
(declare-fun of_84 () Real)
(declare-fun sc_85 () Real)
(declare-fun of_85 () Real)
(declare-fun sc_86 () Real)
(declare-fun of_86 () Real)
(declare-fun sc_87 () Real)
(declare-fun of_87 () Real)
(assert (= sc_87 1))
(assert (= of_87 0))
; 
; =  {sc.iadd[4].OUT} {sc.iadd[4].A}
(assert (= sc_87 sc_85))
; 
; =  {of.iadd[4].OUT} {((of.iadd[4].A+of.iadd[4].B)-of.iadd[4].C-of.iadd[4].D)}
(assert (= of_87 (- (+ of_85 of_86) (+ of_84 of_83))))
(declare-fun slbot_83 () Real)
(declare-fun sltop_83 () Real)
; 
; =  {(((sc.iadd[4].D*0.)+of.iadd[4].D)+sl.min.iadd[4].D)} {0.}
(assert (= (+ (+ (* sc_83 0.) of_83) slbot_83) 0.))
; 
; =  {(((sc.iadd[4].D*1.)+of.iadd[4].D)+sl.max.iadd[4].D)} {5.}
(assert (= (+ (+ (* sc_83 1.) of_83) sltop_83) 5.))
; 
; >=  {((sc.iadd[4].C*0.)+of.iadd[4].C)} {5.}
(assert (<= (+ (* sc_84 0.) of_84) 5.))
; 
; <=  {((sc.iadd[4].C*0.)+of.iadd[4].C)} {0.}
(assert (>= (+ (* sc_84 0.) of_84) 0.))
(declare-fun slbot_87 () Real)
(declare-fun sltop_87 () Real)
; 
; =  {(((sc.iadd[4].OUT*0.)+of.iadd[4].OUT)+sl.min.iadd[4].OUT)} {-10.}
(assert (= (+ (+ (* sc_87 0.) of_87) slbot_87) -10.))
; 
; =  {(((sc.iadd[4].OUT*1.)+of.iadd[4].OUT)+sl.max.iadd[4].OUT)} {10.}
(assert (= (+ (+ (* sc_87 1.) of_87) sltop_87) 10.))
; 
; >=  {((sc.iadd[4].A*0.)+of.iadd[4].A)} {5.}
(assert (<= (+ (* sc_85 0.) of_85) 5.))
; 
; <=  {((sc.iadd[4].A*0.)+of.iadd[4].A)} {0.}
(assert (>= (+ (* sc_85 0.) of_85) 0.))
; 
; >=  {((sc.iadd[4].B*0.15)+of.iadd[4].B)} {5.}
(assert (<= (+ (* sc_86 0.15) of_86) 5.))
; 
; <=  {((sc.iadd[4].B*0.15)+of.iadd[4].B)} {0.}
(assert (>= (+ (* sc_86 0.15) of_86) 0.))
(declare-fun slbot_87 () Real)
(declare-fun sltop_87 () Real)
; 
; =  {(((sc.iadd[4].OUT*0.)+of.iadd[4].OUT)+sl.min.iadd[4].OUT)} {-10.}
(assert (= (+ (+ (* sc_87 0.) of_87) slbot_87) -10.))
; 
; =  {(((sc.iadd[4].OUT*1.)+of.iadd[4].OUT)+sl.max.iadd[4].OUT)} {10.}
(assert (= (+ (+ (* sc_87 1.) of_87) sltop_87) 10.))
(declare-fun sc_88 () Real)
(declare-fun of_88 () Real)
(declare-fun sc_89 () Real)
(declare-fun of_89 () Real)
(assert (= sc_89 1))
(assert (= of_89 0))
; 
; =  {sc.output.I[0].O} {sc.output.I[0].X}
(assert (= sc_89 sc_88))
; 
; =  {of.output.I[0].O} {of.output.I[0].X}
(assert (= of_89 of_88))
(declare-fun slbot_88 () Real)
(declare-fun sltop_88 () Real)
; 
; =  {(((sc.output.I[0].X*0.)+of.output.I[0].X)+sl.min.output.I[0].X)} {0.}
(assert (= (+ (+ (* sc_88 0.) of_88) slbot_88) 0.))
; 
; =  {(((sc.output.I[0].X*1.)+of.output.I[0].X)+sl.max.output.I[0].X)} {10.}
(assert (= (+ (+ (* sc_88 1.) of_88) sltop_88) 10.))
(declare-fun slbot_89 () Real)
(declare-fun sltop_89 () Real)
; 
; =  {(((sc.output.I[0].O*0.)+of.output.I[0].O)+sl.min.output.I[0].O)} {0.}
(assert (= (+ (+ (* sc_89 0.) of_89) slbot_89) 0.))
; 
; =  {(((sc.output.I[0].O*1.)+of.output.I[0].O)+sl.max.output.I[0].O)} {10.}
(assert (= (+ (+ (* sc_89 1.) of_89) sltop_89) 10.))
(declare-fun sc_90 () Real)
(declare-fun of_90 () Real)
(declare-fun sc_91 () Real)
(declare-fun of_91 () Real)
(assert (= sc_91 1))
(assert (= of_91 0))
; 
; =  {sc.output.I[1].O} {sc.output.I[1].X}
(assert (= sc_91 sc_90))
; 
; =  {of.output.I[1].O} {of.output.I[1].X}
(assert (= of_91 of_90))
(declare-fun slbot_90 () Real)
(declare-fun sltop_90 () Real)
; 
; =  {(((sc.output.I[1].X*0.)+of.output.I[1].X)+sl.min.output.I[1].X)} {0.}
(assert (= (+ (+ (* sc_90 0.) of_90) slbot_90) 0.))
; 
; =  {(((sc.output.I[1].X*1.)+of.output.I[1].X)+sl.max.output.I[1].X)} {10.}
(assert (= (+ (+ (* sc_90 1.) of_90) sltop_90) 10.))
(declare-fun slbot_91 () Real)
(declare-fun sltop_91 () Real)
; 
; =  {(((sc.output.I[1].O*0.)+of.output.I[1].O)+sl.min.output.I[1].O)} {0.}
(assert (= (+ (+ (* sc_91 0.) of_91) slbot_91) 0.))
; 
; =  {(((sc.output.I[1].O*1.)+of.output.I[1].O)+sl.max.output.I[1].O)} {10.}
(assert (= (+ (+ (* sc_91 1.) of_91) sltop_91) 10.))
; 
; =  {sc.itov[2].Y} {sc.vadd[1].B}
(assert (= sc_74 sc_35))
; 
; =  {of.itov[2].Y} {of.vadd[1].B}
(assert (= of_74 of_35))
; 
; =  {sc.vadd[1].OUT2} {sc.output.V[1].X}
(assert (= sc_37 sc_22))
; 
; =  {of.vadd[1].OUT2} {of.output.V[1].X}
(assert (= of_37 of_22))
; 
; =  {sc.vtoi[3].Y} {sc.iadd[3].D}
(assert (= sc_43 sc_78))
; 
; =  {of.vtoi[3].Y} {of.iadd[3].D}
(assert (= of_43 of_78))
; 
; =  {sc.input.I[0].O} {sc.iadd[3].A}
(assert (= sc_11 sc_80))
; 
; =  {of.input.I[0].O} {of.iadd[3].A}
(assert (= of_11 of_80))
; 
; =  {sc.input.V[9].O} {sc.vadd[1].D}
(assert (= sc_53 sc_32))
; 
; =  {of.input.V[9].O} {of.vadd[1].D}
(assert (= of_53 of_32))
; 
; =  {sc.iadd[4].OUT} {sc.output.I[1].X}
(assert (= sc_87 sc_90))
; 
; =  {of.iadd[4].OUT} {of.output.I[1].X}
(assert (= of_87 of_90))
; 
; =  {sc.iadd[4].OUT} {sc.vgain[5].Z}
(assert (= sc_87 sc_6))
; 
; =  {of.iadd[4].OUT} {of.vgain[5].Z}
(assert (= of_87 of_6))
; 
; =  {sc.iadd[4].OUT} {sc.vgain[0].Z}
(assert (= sc_87 sc_2))
; 
; =  {of.iadd[4].OUT} {of.vgain[0].Z}
(assert (= of_87 of_2))
; 
; =  {sc.input.I[3].O} {sc.iadd[4].A}
(assert (= sc_13 sc_85))
; 
; =  {of.input.I[3].O} {of.iadd[4].A}
(assert (= of_13 of_85))
; 
; =  {sc.input.I[4].O} {sc.iadd[4].C}
(assert (= sc_15 sc_84))
; 
; =  {of.input.I[4].O} {of.iadd[4].C}
(assert (= of_15 of_84))
; 
; =  {sc.input.I[5].O} {sc.iadd[4].B}
(assert (= sc_17 sc_86))
; 
; =  {of.input.I[5].O} {of.iadd[4].B}
(assert (= of_17 of_86))
; 
; =  {sc.vtoi[0].Y} {sc.iadd[4].D}
(assert (= sc_40 sc_83))
; 
; =  {of.vtoi[0].Y} {of.iadd[4].D}
(assert (= of_40 of_83))
; 
; =  {sc.input.V[11].O} {sc.vgain[0].X}
(assert (= sc_57 sc_0))
; 
; =  {of.input.V[11].O} {of.vgain[0].X}
(assert (= of_57 of_0))
; 
; =  {sc.input.I[2].O} {sc.iadd[3].C}
(assert (= sc_9 sc_79))
; 
; =  {of.input.I[2].O} {of.iadd[3].C}
(assert (= of_9 of_79))
; 
; =  {sc.input.V[8].O} {sc.vadd[6].D}
(assert (= sc_49 sc_25))
; 
; =  {of.input.V[8].O} {of.vadd[6].D}
(assert (= of_49 of_25))
; 
; =  {sc.input.V[2].O} {sc.vadd[1].OUT2_0}
(assert (= sc_47 sc_31))
; 
; =  {of.input.V[2].O} {of.vadd[1].OUT2_0}
(assert (= of_47 of_31))
; 
; =  {sc.input.V[3].O} {sc.vadd[1].C}
(assert (= sc_65 sc_33))
; 
; =  {of.input.V[3].O} {of.vadd[1].C}
(assert (= of_65 of_33))
; 
; =  {sc.itov[7].Y} {sc.vadd[6].B}
(assert (= sc_77 sc_28))
; 
; =  {of.itov[7].Y} {of.vadd[6].B}
(assert (= of_77 of_28))
; 
; =  {sc.input.I[1].O} {sc.iadd[3].B}
(assert (= sc_19 sc_81))
; 
; =  {of.input.I[1].O} {of.iadd[3].B}
(assert (= of_19 of_81))
; 
; =  {sc.input.V[21].O} {sc.vtoi[0].K}
(assert (= sc_63 sc_39))
; 
; =  {of.input.V[21].O} {of.vtoi[0].K}
(assert (= of_63 of_39))
; 
; =  {sc.input.V[20].O} {sc.vtoi[3].K}
(assert (= sc_45 sc_42))
; 
; =  {of.input.V[20].O} {of.vtoi[3].K}
(assert (= of_45 of_42))
; 
; =  {sc.input.V[1].O} {sc.vgain[0].Y}
(assert (= sc_71 sc_1))
; 
; =  {of.input.V[1].O} {of.vgain[0].Y}
(assert (= of_71 of_1))
; 
; =  {sc.iadd[3].OUT} {sc.itov[2].X}
(assert (= sc_82 sc_72))
; 
; =  {of.iadd[3].OUT} {of.itov[2].X}
(assert (= of_82 of_72))
; 
; =  {sc.iadd[3].OUT} {sc.output.I[0].X}
(assert (= sc_82 sc_88))
; 
; =  {of.iadd[3].OUT} {of.output.I[0].X}
(assert (= of_82 of_88))
; 
; =  {sc.iadd[3].OUT} {sc.itov[7].X}
(assert (= sc_82 sc_75))
; 
; =  {of.iadd[3].OUT} {of.itov[7].X}
(assert (= of_82 of_75))
; 
; =  {sc.vgain[0].P} {sc.itov[2].K}
(assert (= sc_3 sc_73))
; 
; =  {of.vgain[0].P} {of.itov[2].K}
(assert (= of_3 of_73))
; 
; =  {sc.input.V[7].O} {sc.vadd[6].C}
(assert (= sc_51 sc_26))
; 
; =  {of.input.V[7].O} {of.vadd[6].C}
(assert (= of_51 of_26))
; 
; =  {sc.input.V[0].O} {sc.vgain[5].Y}
(assert (= sc_55 sc_5))
; 
; =  {of.input.V[0].O} {of.vgain[5].Y}
(assert (= of_55 of_5))
; 
; =  {sc.input.V[10].O} {sc.vgain[5].X}
(assert (= sc_59 sc_4))
; 
; =  {of.input.V[10].O} {of.vgain[5].X}
(assert (= of_59 of_4))
; 
; =  {sc.input.V[4].O} {sc.vadd[1].A}
(assert (= sc_67 sc_34))
; 
; =  {of.input.V[4].O} {of.vadd[1].A}
(assert (= of_67 of_34))
; 
; =  {sc.input.V[5].O} {sc.vadd[6].OUT2_0}
(assert (= sc_69 sc_24))
; 
; =  {of.input.V[5].O} {of.vadd[6].OUT2_0}
(assert (= of_69 of_24))
; 
; =  {sc.vadd[6].OUT2} {sc.vtoi[3].X}
(assert (= sc_30 sc_41))
; 
; =  {of.vadd[6].OUT2} {of.vtoi[3].X}
(assert (= of_30 of_41))
; 
; =  {sc.vadd[6].OUT2} {sc.output.V[0].X}
(assert (= sc_30 sc_20))
; 
; =  {of.vadd[6].OUT2} {of.output.V[0].X}
(assert (= of_30 of_20))
; 
; =  {sc.vadd[6].OUT2} {sc.vtoi[0].X}
(assert (= sc_30 sc_38))
; 
; =  {of.vadd[6].OUT2} {of.vtoi[0].X}
(assert (= of_30 of_38))
; 
; =  {sc.input.V[6].O} {sc.vadd[6].A}
(assert (= sc_61 sc_27))
; 
; =  {of.input.V[6].O} {of.vadd[6].A}
(assert (= of_61 of_27))
; 
; =  {sc.vgain[5].P} {sc.itov[7].K}
(assert (= sc_7 sc_76))
; 
; =  {of.vgain[5].P} {of.itov[7].K}
(assert (= of_7 of_76))
(assert (<= (* sc_21 0.001) 0.001))
(assert (<= (* sc_23 0.001) 0.001))
; 
; =  {sc.output.V[0].O} {sc.output.V[1].O} {sc.vadd[6].OUT2} {sc.vadd[1].OUT2}
(assert (and (and (= sc_21 sc_23) (= sc_21 sc_30)) (= sc_21 sc_37)))
(assert (= __minima__ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (* (ite (>= sltop_36 0) sltop_36 (- sltop_36)) 1.) (* (ite (>= sltop_77 0) sltop_77 (- sltop_77)) 1.)) (* (ite (>= slbot_89 0) slbot_89 (- slbot_89)) 1.)) (* (ite (>= slbot_29 0) slbot_29 (- slbot_29)) 1.)) (* (ite (>= sltop_72 0) sltop_72 (- sltop_72)) 1.)) (* (ite (>= slbot_22 0) slbot_22 (- slbot_22)) 1.)) (* (ite (>= sltop_23 0) sltop_23 (- sltop_23)) 1.)) (* (ite (>= sltop_41 0) sltop_41 (- sltop_41)) 1.)) (* (ite (>= slbot_78 0) slbot_78 (- slbot_78)) 1.)) (* (ite (>= sltop_87 0) sltop_87 (- sltop_87)) 1.)) (* (ite (>= slbot_72 0) slbot_72 (- slbot_72)) 1.)) (* (ite (>= sltop_91 0) sltop_91 (- sltop_91)) 1.)) (* (ite (>= slbot_35 0) slbot_35 (- slbot_35)) 1.)) (* (ite (>= slbot_88 0) slbot_88 (- slbot_88)) 1.)) (* (ite (>= sltop_90 0) sltop_90 (- sltop_90)) 1.)) (* (ite (>= slbot_20 0) slbot_20 (- slbot_20)) 1.)) (* (ite (>= sltop_76 0) sltop_76 (- sltop_76)) 1.)) (* (ite (>= slbot_83 0) slbot_83 (- slbot_83)) 1.)) (* (ite (>= sltop_88 0) sltop_88 (- sltop_88)) 1.)) (* (ite (>= slbot_3 0) slbot_3 (- slbot_3)) 1.)) (* (ite (>= sltop_28 0) sltop_28 (- sltop_28)) 1.)) (* (ite (>= slbot_2 0) slbot_2 (- slbot_2)) 1.)) (* (ite (>= slbot_37 0) slbot_37 (- slbot_37)) 1.)) (* (ite (>= slbot_76 0) slbot_76 (- slbot_76)) 1.)) (* (ite (>= sltop_7 0) sltop_7 (- sltop_7)) 1.)) (* (ite (>= sltop_38 0) sltop_38 (- sltop_38)) 1.)) (* (ite (>= sltop_29 0) sltop_29 (- sltop_29)) 1.)) (* (ite (>= sltop_89 0) sltop_89 (- sltop_89)) 1.)) (* (ite (>= slbot_36 0) slbot_36 (- slbot_36)) 1.)) (* (ite (>= sltop_82 0) sltop_82 (- sltop_82)) 1.)) (* (ite (>= slbot_90 0) slbot_90 (- slbot_90)) 1.)) (* (ite (>= sltop_22 0) sltop_22 (- sltop_22)) 1.)) (* (ite (>= slbot_41 0) slbot_41 (- slbot_41)) 1.)) (* (ite (>= slbot_82 0) slbot_82 (- slbot_82)) 1.)) (* (ite (>= sltop_2 0) sltop_2 (- sltop_2)) 1.)) (* (ite (>= sltop_20 0) sltop_20 (- sltop_20)) 1.)) (* (ite (>= slbot_28 0) slbot_28 (- slbot_28)) 1.)) (* (ite (>= sltop_74 0) sltop_74 (- sltop_74)) 1.)) (* (ite (>= slbot_21 0) slbot_21 (- slbot_21)) 1.)) (* (ite (>= slbot_91 0) slbot_91 (- slbot_91)) 1.)) (* (ite (>= slbot_30 0) slbot_30 (- slbot_30)) 1.)) (* (ite (>= slbot_73 0) slbot_73 (- slbot_73)) 1.)) (* (ite (>= slbot_43 0) slbot_43 (- slbot_43)) 1.)) (* (ite (>= sltop_78 0) sltop_78 (- sltop_78)) 1.)) (* (ite (>= slbot_87 0) slbot_87 (- slbot_87)) 1.)) (* (ite (>= slbot_6 0) slbot_6 (- slbot_6)) 1.)) (* (ite (>= sltop_30 0) sltop_30 (- sltop_30)) 1.)) (* (ite (>= slbot_38 0) slbot_38 (- slbot_38)) 1.)) (* (ite (>= sltop_83 0) sltop_83 (- sltop_83)) 1.)) (* (ite (>= sltop_37 0) sltop_37 (- sltop_37)) 1.)) (* (ite (>= slbot_74 0) slbot_74 (- slbot_74)) 1.)) (* (ite (>= sltop_75 0) sltop_75 (- sltop_75)) 1.)) (* (ite (>= slbot_77 0) slbot_77 (- slbot_77)) 1.)) (* (ite (>= slbot_23 0) slbot_23 (- slbot_23)) 1.)) (* (ite (>= sltop_73 0) sltop_73 (- sltop_73)) 1.)) (* (ite (>= slbot_75 0) slbot_75 (- slbot_75)) 1.)) (* (ite (>= sltop_3 0) sltop_3 (- sltop_3)) 1.)) (* (ite (>= sltop_35 0) sltop_35 (- sltop_35)) 1.)) (* (ite (>= sltop_40 0) sltop_40 (- sltop_40)) 1.)) (* (ite (>= sltop_6 0) sltop_6 (- sltop_6)) 1.)) (* (ite (>= sltop_43 0) sltop_43 (- sltop_43)) 1.)) (* (ite (>= slbot_7 0) slbot_7 (- slbot_7)) 1.)) (* (ite (>= slbot_40 0) slbot_40 (- slbot_40)) 1.)) (* (ite (>= sltop_21 0) sltop_21 (- sltop_21)) 1.))))
(check-sat)
