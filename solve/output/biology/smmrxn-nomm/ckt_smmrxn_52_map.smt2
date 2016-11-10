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
(assert (= of_0 0))
(assert (= of_1 0))
(assert (= 0. 0))
(assert (= of_2 0))
(assert (= 0. 0))
; 
; =  {sc.vgain[3].P} {((sc.vgain[3].X/sc.vgain[3].Y)*sc.vgain[3].Z*1)}
(assert (= sc_3 (* (* (/ sc_0 sc_1) sc_2) 1)))
; 
; =  {of.vgain[3].P} {0}
(assert (= of_3 0.))
; 
; >=  {((sc.vgain[3].X*1.)+of.vgain[3].X)} {3300.}
(assert (<= (+ (* sc_0 1.) of_0) 3300.))
; 
; <=  {((sc.vgain[3].X*1.)+of.vgain[3].X)} {0.0001}
(assert (>= (+ (* sc_0 1.) of_0) 0.0001))
; 
; >=  {((sc.vgain[3].Y*0.125)+of.vgain[3].Y)} {3300.}
(assert (<= (+ (* sc_1 0.125) of_1) 3300.))
; 
; <=  {((sc.vgain[3].Y*0.125)+of.vgain[3].Y)} {1.}
(assert (>= (+ (* sc_1 0.125) of_1) 1.))
(declare-fun slbot_3 () Real)
(declare-fun sltop_3 () Real)
; 
; =  {(((sc.vgain[3].P*0.)+of.vgain[3].P)+sl.min.vgain[3].P)} {1.51515151515e-12}
(assert (= (+ (+ (* sc_3 0.) of_3) slbot_3) 1.51515151515e-12))
; 
; =  {(((sc.vgain[3].P*4.)+of.vgain[3].P)+sl.max.vgain[3].P)} {5445000.}
(assert (= (+ (+ (* sc_3 4.) of_3) sltop_3) 5445000.))
(declare-fun slbot_2 () Real)
(declare-fun sltop_2 () Real)
; 
; =  {(((sc.vgain[3].Z*0.)+of.vgain[3].Z)+sl.min.vgain[3].Z)} {0.0001}
(assert (= (+ (+ (* sc_2 0.) of_2) slbot_2) 0.0001))
; 
; =  {(((sc.vgain[3].Z*1.)+of.vgain[3].Z)+sl.max.vgain[3].Z)} {3300.}
(assert (= (+ (+ (* sc_2 1.) of_2) sltop_2) 3300.))
(declare-fun sc_4 () Real)
(declare-fun of_4 () Real)
(declare-fun sc_5 () Real)
(declare-fun of_5 () Real)
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
; 
; =  {sc.input.I[8].O} {sc.input.I[8].X}
(assert (= sc_7 sc_6))
; 
; =  {of.input.I[8].O} {of.input.I[8].X}
(assert (= of_7 of_6))
; 
; >=  {((sc.input.I[8].X*-0.15)+of.input.I[8].X)} {10.}
(assert (<= (+ (* sc_6 -0.15) of_6) 10.))
; 
; <=  {((sc.input.I[8].X*-0.15)+of.input.I[8].X)} {0.}
(assert (>= (+ (* sc_6 -0.15) of_6) 0.))
; 
; >=  {((sc.input.I[8].O*-0.15)+of.input.I[8].O)} {10.}
(assert (<= (+ (* sc_7 -0.15) of_7) 10.))
; 
; <=  {((sc.input.I[8].O*-0.15)+of.input.I[8].O)} {0.}
(assert (>= (+ (* sc_7 -0.15) of_7) 0.))
(declare-fun sc_8 () Real)
(declare-fun of_8 () Real)
(declare-fun sc_9 () Real)
(declare-fun of_9 () Real)
; 
; =  {sc.input.I[7].O} {sc.input.I[7].X}
(assert (= sc_9 sc_8))
; 
; =  {of.input.I[7].O} {of.input.I[7].X}
(assert (= of_9 of_8))
; 
; >=  {((sc.input.I[7].X*0.)+of.input.I[7].X)} {10.}
(assert (<= (+ (* sc_8 0.) of_8) 10.))
; 
; <=  {((sc.input.I[7].X*0.)+of.input.I[7].X)} {0.}
(assert (>= (+ (* sc_8 0.) of_8) 0.))
; 
; >=  {((sc.input.I[7].O*0.)+of.input.I[7].O)} {10.}
(assert (<= (+ (* sc_9 0.) of_9) 10.))
; 
; <=  {((sc.input.I[7].O*0.)+of.input.I[7].O)} {0.}
(assert (>= (+ (* sc_9 0.) of_9) 0.))
(declare-fun sc_10 () Real)
(declare-fun of_10 () Real)
(declare-fun sc_11 () Real)
(declare-fun of_11 () Real)
; 
; =  {sc.input.I[0].O} {sc.input.I[0].X}
(assert (= sc_11 sc_10))
; 
; =  {of.input.I[0].O} {of.input.I[0].X}
(assert (= of_11 of_10))
; 
; >=  {((sc.input.I[0].X*-0.11)+of.input.I[0].X)} {10.}
(assert (<= (+ (* sc_10 -0.11) of_10) 10.))
; 
; <=  {((sc.input.I[0].X*-0.11)+of.input.I[0].X)} {0.}
(assert (>= (+ (* sc_10 -0.11) of_10) 0.))
; 
; >=  {((sc.input.I[0].O*-0.11)+of.input.I[0].O)} {10.}
(assert (<= (+ (* sc_11 -0.11) of_11) 10.))
; 
; <=  {((sc.input.I[0].O*-0.11)+of.input.I[0].O)} {0.}
(assert (>= (+ (* sc_11 -0.11) of_11) 0.))
(declare-fun sc_12 () Real)
(declare-fun of_12 () Real)
(declare-fun sc_13 () Real)
(declare-fun of_13 () Real)
; 
; =  {sc.input.I[6].O} {sc.input.I[6].X}
(assert (= sc_13 sc_12))
; 
; =  {of.input.I[6].O} {of.input.I[6].X}
(assert (= of_13 of_12))
; 
; >=  {((sc.input.I[6].X*0.)+of.input.I[6].X)} {10.}
(assert (<= (+ (* sc_12 0.) of_12) 10.))
; 
; <=  {((sc.input.I[6].X*0.)+of.input.I[6].X)} {0.}
(assert (>= (+ (* sc_12 0.) of_12) 0.))
; 
; >=  {((sc.input.I[6].O*0.)+of.input.I[6].O)} {10.}
(assert (<= (+ (* sc_13 0.) of_13) 10.))
; 
; <=  {((sc.input.I[6].O*0.)+of.input.I[6].O)} {0.}
(assert (>= (+ (* sc_13 0.) of_13) 0.))
(declare-fun sc_14 () Real)
(declare-fun of_14 () Real)
(declare-fun sc_15 () Real)
(declare-fun of_15 () Real)
; 
; =  {sc.input.I[3].O} {sc.input.I[3].X}
(assert (= sc_15 sc_14))
; 
; =  {of.input.I[3].O} {of.input.I[3].X}
(assert (= of_15 of_14))
; 
; >=  {((sc.input.I[3].X*0.)+of.input.I[3].X)} {10.}
(assert (<= (+ (* sc_14 0.) of_14) 10.))
; 
; <=  {((sc.input.I[3].X*0.)+of.input.I[3].X)} {0.}
(assert (>= (+ (* sc_14 0.) of_14) 0.))
; 
; >=  {((sc.input.I[3].O*0.)+of.input.I[3].O)} {10.}
(assert (<= (+ (* sc_15 0.) of_15) 10.))
; 
; <=  {((sc.input.I[3].O*0.)+of.input.I[3].O)} {0.}
(assert (>= (+ (* sc_15 0.) of_15) 0.))
(declare-fun sc_16 () Real)
(declare-fun of_16 () Real)
(declare-fun sc_17 () Real)
(declare-fun of_17 () Real)
; 
; =  {sc.input.I[4].O} {sc.input.I[4].X}
(assert (= sc_17 sc_16))
; 
; =  {of.input.I[4].O} {of.input.I[4].X}
(assert (= of_17 of_16))
; 
; >=  {((sc.input.I[4].X*0.)+of.input.I[4].X)} {10.}
(assert (<= (+ (* sc_16 0.) of_16) 10.))
; 
; <=  {((sc.input.I[4].X*0.)+of.input.I[4].X)} {0.}
(assert (>= (+ (* sc_16 0.) of_16) 0.))
; 
; >=  {((sc.input.I[4].O*0.)+of.input.I[4].O)} {10.}
(assert (<= (+ (* sc_17 0.) of_17) 10.))
; 
; <=  {((sc.input.I[4].O*0.)+of.input.I[4].O)} {0.}
(assert (>= (+ (* sc_17 0.) of_17) 0.))
(declare-fun sc_18 () Real)
(declare-fun of_18 () Real)
(declare-fun sc_19 () Real)
(declare-fun of_19 () Real)
; 
; =  {sc.input.I[5].O} {sc.input.I[5].X}
(assert (= sc_19 sc_18))
; 
; =  {of.input.I[5].O} {of.input.I[5].X}
(assert (= of_19 of_18))
; 
; >=  {((sc.input.I[5].X*0.)+of.input.I[5].X)} {10.}
(assert (<= (+ (* sc_18 0.) of_18) 10.))
; 
; <=  {((sc.input.I[5].X*0.)+of.input.I[5].X)} {0.}
(assert (>= (+ (* sc_18 0.) of_18) 0.))
; 
; >=  {((sc.input.I[5].O*0.)+of.input.I[5].O)} {10.}
(assert (<= (+ (* sc_19 0.) of_19) 10.))
; 
; <=  {((sc.input.I[5].O*0.)+of.input.I[5].O)} {0.}
(assert (>= (+ (* sc_19 0.) of_19) 0.))
(declare-fun sc_20 () Real)
(declare-fun of_20 () Real)
(declare-fun sc_21 () Real)
(declare-fun of_21 () Real)
; 
; =  {sc.input.I[1].O} {sc.input.I[1].X}
(assert (= sc_21 sc_20))
; 
; =  {of.input.I[1].O} {of.input.I[1].X}
(assert (= of_21 of_20))
; 
; >=  {((sc.input.I[1].X*0.)+of.input.I[1].X)} {10.}
(assert (<= (+ (* sc_20 0.) of_20) 10.))
; 
; <=  {((sc.input.I[1].X*0.)+of.input.I[1].X)} {0.}
(assert (>= (+ (* sc_20 0.) of_20) 0.))
; 
; >=  {((sc.input.I[1].O*0.)+of.input.I[1].O)} {10.}
(assert (<= (+ (* sc_21 0.) of_21) 10.))
; 
; <=  {((sc.input.I[1].O*0.)+of.input.I[1].O)} {0.}
(assert (>= (+ (* sc_21 0.) of_21) 0.))
(declare-fun sc_22 () Real)
(declare-fun of_22 () Real)
(declare-fun sc_23 () Real)
(declare-fun of_23 () Real)
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
(assert (= 0. 0))
(assert (= of_25 0))
(assert (= 0. 0))
(assert (= of_28 0))
; 
; =  {sc.vadd[4].A} {(1*sc.vadd[4].B)}
(assert (= sc_27 (* 1 sc_28)))
; 
; =  {sc.vadd[4].A} {(1*sc.vadd[4].C)} {(1*sc.vadd[4].D)}
(assert (and (= sc_27 (* 1 sc_26)) (= sc_27 (* 1 sc_25))))
(assert (= (- (+ of_27 0) (+ 0 0)) 0))
(assert (= 0. 0))
; 
; =  {sc.vadd[4].OUT} {(sc.vadd[4].A*1)}
(assert (= sc_29 (* sc_27 1)))
; 
; =  {of.vadd[4].OUT} {0}
(assert (= of_29 0.))
(assert (= 0. 0))
(assert (= of_25 0))
(assert (= 0. 0))
(assert (= 0. 0))
(assert (= of_28 0))
; 
; =  {sc.vadd[4].A} {(1*sc.vadd[4].B)}
(assert (= sc_27 (* 1 sc_28)))
; 
; =  {sc.vadd[4].A} {(1*sc.vadd[4].C)} {(1*sc.vadd[4].D*1)}
(assert (and (= sc_27 (* 1 sc_26)) (= sc_27 (* (* 1 sc_25) 1))))
(assert (= (- (+ of_27 0) (+ 0 0)) 0))
(assert (= 0. 0))
; 
; =  {sc.vadd[4].OUT2} {(sc.vadd[4].A*1)}
(assert (= sc_30 (* sc_27 1)))
(assert (= of_30 0))
(assert (= 0. 0))
; 
; =  {sc.vadd[4].OUT2_0} {(sc.vadd[4].A*1)}
(assert (= sc_24 (* sc_27 1)))
; 
; =  {of.vadd[4].OUT2_0} {0}
(assert (= of_24 0.))
; 
; >=  {((sc.vadd[4].OUT2_0*0.)+of.vadd[4].OUT2_0)} {3300.}
(assert (<= (+ (* sc_24 0.) of_24) 3300.))
; 
; <=  {((sc.vadd[4].OUT2_0*0.)+of.vadd[4].OUT2_0)} {0.}
(assert (>= (+ (* sc_24 0.) of_24) 0.))
; 
; >=  {((sc.vadd[4].D*4.)+of.vadd[4].D)} {3300.}
(assert (<= (+ (* sc_25 4.) of_25) 3300.))
; 
; <=  {((sc.vadd[4].D*4.)+of.vadd[4].D)} {0.0001}
(assert (>= (+ (* sc_25 4.) of_25) 0.0001))
; 
; >=  {((sc.vadd[4].A*0.)+of.vadd[4].A)} {3300.}
(assert (<= (+ (* sc_27 0.) of_27) 3300.))
; 
; <=  {((sc.vadd[4].A*0.)+of.vadd[4].A)} {0.0001}
(assert (>= (+ (* sc_27 0.) of_27) 0.0001))
(declare-fun slbot_30 () Real)
(declare-fun sltop_30 () Real)
; 
; =  {(((sc.vadd[4].OUT2*0.)+of.vadd[4].OUT2)+sl.min.vadd[4].OUT2)} {0.}
(assert (= (+ (+ (* sc_30 0.) of_30) slbot_30) 0.))
; 
; =  {(((sc.vadd[4].OUT2*1.)+of.vadd[4].OUT2)+sl.max.vadd[4].OUT2)} {5.}
(assert (= (+ (+ (* sc_30 1.) of_30) sltop_30) 5.))
(declare-fun slbot_28 () Real)
(declare-fun sltop_28 () Real)
; 
; =  {(((sc.vadd[4].B*0.)+of.vadd[4].B)+sl.min.vadd[4].B)} {0.0001}
(assert (= (+ (+ (* sc_28 0.) of_28) slbot_28) 0.0001))
; 
; =  {(((sc.vadd[4].B*4.)+of.vadd[4].B)+sl.max.vadd[4].B)} {3300.}
(assert (= (+ (+ (* sc_28 4.) of_28) sltop_28) 3300.))
(declare-fun slbot_29 () Real)
(declare-fun sltop_29 () Real)
; 
; =  {(((sc.vadd[4].OUT*0.)+of.vadd[4].OUT)+sl.min.vadd[4].OUT)} {-824.99995}
(assert (= (+ (+ (* sc_29 0.) of_29) slbot_29) -824.99995))
; 
; =  {(((sc.vadd[4].OUT*4.)+of.vadd[4].OUT)+sl.max.vadd[4].OUT)} {1649.999975}
(assert (= (+ (+ (* sc_29 4.) of_29) sltop_29) 1649.999975))
(declare-fun slbot_30 () Real)
(declare-fun sltop_30 () Real)
; 
; =  {(((sc.vadd[4].OUT2*0.)+of.vadd[4].OUT2)+sl.min.vadd[4].OUT2)} {0.}
(assert (= (+ (+ (* sc_30 0.) of_30) slbot_30) 0.))
; 
; =  {(((sc.vadd[4].OUT2*1.)+of.vadd[4].OUT2)+sl.max.vadd[4].OUT2)} {5.}
(assert (= (+ (+ (* sc_30 1.) of_30) sltop_30) 5.))
(declare-fun sc_31 () Real)
(declare-fun of_31 () Real)
(declare-fun sc_32 () Real)
(declare-fun of_32 () Real)
(declare-fun sc_33 () Real)
(declare-fun of_33 () Real)
(assert (= 0. 0))
(assert (= of_32 0))
(assert (= 0. 0))
(assert (= of_31 0))
; 
; =  {sc.vtoi[7].Y} {((1/sc.vtoi[7].K)*sc.vtoi[7].X)}
(assert (= sc_33 (* (/ 1 sc_32) sc_31)))
; 
; =  {of.vtoi[7].Y} {0}
(assert (= of_33 0.))
(declare-fun slbot_31 () Real)
(declare-fun sltop_31 () Real)
; 
; =  {(((sc.vtoi[7].X*0.)+of.vtoi[7].X)+sl.min.vtoi[7].X)} {1.}
(assert (= (+ (+ (* sc_31 0.) of_31) slbot_31) 1.))
; 
; =  {(((sc.vtoi[7].X*1.)+of.vtoi[7].X)+sl.max.vtoi[7].X)} {3300.}
(assert (= (+ (+ (* sc_31 1.) of_31) sltop_31) 3300.))
; 
; >=  {((sc.vtoi[7].K*1.)+of.vtoi[7].K)} {3300.}
(assert (<= (+ (* sc_32 1.) of_32) 3300.))
; 
; <=  {((sc.vtoi[7].K*1.)+of.vtoi[7].K)} {1.}
(assert (>= (+ (* sc_32 1.) of_32) 1.))
(declare-fun slbot_33 () Real)
(declare-fun sltop_33 () Real)
; 
; =  {(((sc.vtoi[7].Y*0.)+of.vtoi[7].Y)+sl.min.vtoi[7].Y)} {0.00030303030303}
(assert (= (+ (+ (* sc_33 0.) of_33) slbot_33) 0.00030303030303))
; 
; =  {(((sc.vtoi[7].Y*1.)+of.vtoi[7].Y)+sl.max.vtoi[7].Y)} {3300.}
(assert (= (+ (+ (* sc_33 1.) of_33) sltop_33) 3300.))
(declare-fun sc_34 () Real)
(declare-fun of_34 () Real)
(declare-fun sc_35 () Real)
(declare-fun of_35 () Real)
(declare-fun sc_36 () Real)
(declare-fun of_36 () Real)
(assert (= 0. 0))
(assert (= of_35 0))
(assert (= 0. 0))
(assert (= of_34 0))
; 
; =  {sc.vtoi[0].Y} {((1/sc.vtoi[0].K)*sc.vtoi[0].X)}
(assert (= sc_36 (* (/ 1 sc_35) sc_34)))
; 
; =  {of.vtoi[0].Y} {0}
(assert (= of_36 0.))
(declare-fun slbot_34 () Real)
(declare-fun sltop_34 () Real)
; 
; =  {(((sc.vtoi[0].X*0.)+of.vtoi[0].X)+sl.min.vtoi[0].X)} {1.}
(assert (= (+ (+ (* sc_34 0.) of_34) slbot_34) 1.))
; 
; =  {(((sc.vtoi[0].X*1.)+of.vtoi[0].X)+sl.max.vtoi[0].X)} {3300.}
(assert (= (+ (+ (* sc_34 1.) of_34) sltop_34) 3300.))
; 
; >=  {((sc.vtoi[0].K*1.)+of.vtoi[0].K)} {3300.}
(assert (<= (+ (* sc_35 1.) of_35) 3300.))
; 
; <=  {((sc.vtoi[0].K*1.)+of.vtoi[0].K)} {1.}
(assert (>= (+ (* sc_35 1.) of_35) 1.))
(declare-fun slbot_36 () Real)
(declare-fun sltop_36 () Real)
; 
; =  {(((sc.vtoi[0].Y*0.)+of.vtoi[0].Y)+sl.min.vtoi[0].Y)} {0.00030303030303}
(assert (= (+ (+ (* sc_36 0.) of_36) slbot_36) 0.00030303030303))
; 
; =  {(((sc.vtoi[0].Y*1.)+of.vtoi[0].Y)+sl.max.vtoi[0].Y)} {3300.}
(assert (= (+ (+ (* sc_36 1.) of_36) sltop_36) 3300.))
(declare-fun sc_37 () Real)
(declare-fun of_37 () Real)
(declare-fun sc_38 () Real)
(declare-fun of_38 () Real)
; 
; =  {sc.input.V[2].O} {sc.input.V[2].X}
(assert (= sc_38 sc_37))
; 
; =  {of.input.V[2].O} {of.input.V[2].X}
(assert (= of_38 of_37))
; 
; >=  {((sc.input.V[2].X*0.)+of.input.V[2].X)} {5.}
(assert (<= (+ (* sc_37 0.) of_37) 5.))
; 
; <=  {((sc.input.V[2].X*0.)+of.input.V[2].X)} {0.}
(assert (>= (+ (* sc_37 0.) of_37) 0.))
; 
; >=  {((sc.input.V[2].O*0.)+of.input.V[2].O)} {5.}
(assert (<= (+ (* sc_38 0.) of_38) 5.))
; 
; <=  {((sc.input.V[2].O*0.)+of.input.V[2].O)} {0.}
(assert (>= (+ (* sc_38 0.) of_38) 0.))
(declare-fun sc_39 () Real)
(declare-fun of_39 () Real)
(declare-fun sc_40 () Real)
(declare-fun of_40 () Real)
; 
; =  {sc.input.V[0].O} {sc.input.V[0].X}
(assert (= sc_40 sc_39))
; 
; =  {of.input.V[0].O} {of.input.V[0].X}
(assert (= of_40 of_39))
; 
; >=  {((sc.input.V[0].X*0.125)+of.input.V[0].X)} {5.}
(assert (<= (+ (* sc_39 0.125) of_39) 5.))
; 
; <=  {((sc.input.V[0].X*0.125)+of.input.V[0].X)} {0.}
(assert (>= (+ (* sc_39 0.125) of_39) 0.))
; 
; >=  {((sc.input.V[0].O*0.125)+of.input.V[0].O)} {5.}
(assert (<= (+ (* sc_40 0.125) of_40) 5.))
; 
; <=  {((sc.input.V[0].O*0.125)+of.input.V[0].O)} {0.}
(assert (>= (+ (* sc_40 0.125) of_40) 0.))
(declare-fun sc_41 () Real)
(declare-fun of_41 () Real)
(declare-fun sc_42 () Real)
(declare-fun of_42 () Real)
; 
; =  {sc.input.V[15].O} {sc.input.V[15].X}
(assert (= sc_42 sc_41))
; 
; =  {of.input.V[15].O} {of.input.V[15].X}
(assert (= of_42 of_41))
; 
; >=  {((sc.input.V[15].X*1.)+of.input.V[15].X)} {5.}
(assert (<= (+ (* sc_41 1.) of_41) 5.))
; 
; <=  {((sc.input.V[15].X*1.)+of.input.V[15].X)} {0.}
(assert (>= (+ (* sc_41 1.) of_41) 0.))
; 
; >=  {((sc.input.V[15].O*1.)+of.input.V[15].O)} {5.}
(assert (<= (+ (* sc_42 1.) of_42) 5.))
; 
; <=  {((sc.input.V[15].O*1.)+of.input.V[15].O)} {0.}
(assert (>= (+ (* sc_42 1.) of_42) 0.))
(declare-fun sc_43 () Real)
(declare-fun of_43 () Real)
(declare-fun sc_44 () Real)
(declare-fun of_44 () Real)
; 
; =  {sc.input.V[16].O} {sc.input.V[16].X}
(assert (= sc_44 sc_43))
; 
; =  {of.input.V[16].O} {of.input.V[16].X}
(assert (= of_44 of_43))
; 
; >=  {((sc.input.V[16].X*1.)+of.input.V[16].X)} {5.}
(assert (<= (+ (* sc_43 1.) of_43) 5.))
; 
; <=  {((sc.input.V[16].X*1.)+of.input.V[16].X)} {0.}
(assert (>= (+ (* sc_43 1.) of_43) 0.))
; 
; >=  {((sc.input.V[16].O*1.)+of.input.V[16].O)} {5.}
(assert (<= (+ (* sc_44 1.) of_44) 5.))
; 
; <=  {((sc.input.V[16].O*1.)+of.input.V[16].O)} {0.}
(assert (>= (+ (* sc_44 1.) of_44) 0.))
(declare-fun sc_45 () Real)
(declare-fun of_45 () Real)
(declare-fun sc_46 () Real)
(declare-fun of_46 () Real)
; 
; =  {sc.input.V[3].O} {sc.input.V[3].X}
(assert (= sc_46 sc_45))
; 
; =  {of.input.V[3].O} {of.input.V[3].X}
(assert (= of_46 of_45))
; 
; >=  {((sc.input.V[3].X*4.)+of.input.V[3].X)} {5.}
(assert (<= (+ (* sc_45 4.) of_45) 5.))
; 
; <=  {((sc.input.V[3].X*4.)+of.input.V[3].X)} {0.}
(assert (>= (+ (* sc_45 4.) of_45) 0.))
; 
; >=  {((sc.input.V[3].O*4.)+of.input.V[3].O)} {5.}
(assert (<= (+ (* sc_46 4.) of_46) 5.))
; 
; <=  {((sc.input.V[3].O*4.)+of.input.V[3].O)} {0.}
(assert (>= (+ (* sc_46 4.) of_46) 0.))
(declare-fun sc_47 () Real)
(declare-fun of_47 () Real)
(declare-fun sc_48 () Real)
(declare-fun of_48 () Real)
; 
; =  {sc.input.V[4].O} {sc.input.V[4].X}
(assert (= sc_48 sc_47))
; 
; =  {of.input.V[4].O} {of.input.V[4].X}
(assert (= of_48 of_47))
; 
; >=  {((sc.input.V[4].X*1.)+of.input.V[4].X)} {5.}
(assert (<= (+ (* sc_47 1.) of_47) 5.))
; 
; <=  {((sc.input.V[4].X*1.)+of.input.V[4].X)} {0.}
(assert (>= (+ (* sc_47 1.) of_47) 0.))
; 
; >=  {((sc.input.V[4].O*1.)+of.input.V[4].O)} {5.}
(assert (<= (+ (* sc_48 1.) of_48) 5.))
; 
; <=  {((sc.input.V[4].O*1.)+of.input.V[4].O)} {0.}
(assert (>= (+ (* sc_48 1.) of_48) 0.))
(declare-fun sc_49 () Real)
(declare-fun of_49 () Real)
(declare-fun sc_50 () Real)
(declare-fun of_50 () Real)
; 
; =  {sc.input.V[1].O} {sc.input.V[1].X}
(assert (= sc_50 sc_49))
; 
; =  {of.input.V[1].O} {of.input.V[1].X}
(assert (= of_50 of_49))
; 
; >=  {((sc.input.V[1].X*0.)+of.input.V[1].X)} {5.}
(assert (<= (+ (* sc_49 0.) of_49) 5.))
; 
; <=  {((sc.input.V[1].X*0.)+of.input.V[1].X)} {0.}
(assert (>= (+ (* sc_49 0.) of_49) 0.))
; 
; >=  {((sc.input.V[1].O*0.)+of.input.V[1].O)} {5.}
(assert (<= (+ (* sc_50 0.) of_50) 5.))
; 
; <=  {((sc.input.V[1].O*0.)+of.input.V[1].O)} {0.}
(assert (>= (+ (* sc_50 0.) of_50) 0.))
(declare-fun sc_51 () Real)
(declare-fun of_51 () Real)
(declare-fun sc_52 () Real)
(declare-fun of_52 () Real)
(declare-fun sc_53 () Real)
(declare-fun of_53 () Real)
(assert (= of_52 0))
(assert (= of_51 0))
; 
; =  {sc.itov[5].Y} {(sc.itov[5].K*sc.itov[5].X)}
(assert (= sc_53 (* sc_52 sc_51)))
; 
; =  {of.itov[5].Y} {0}
(assert (= of_53 0.))
(declare-fun slbot_51 () Real)
(declare-fun sltop_51 () Real)
; 
; =  {(((sc.itov[5].X*0.)+of.itov[5].X)+sl.min.itov[5].X)} {0.0001}
(assert (= (+ (+ (* sc_51 0.) of_51) slbot_51) 0.0001))
; 
; =  {(((sc.itov[5].X*1.)+of.itov[5].X)+sl.max.itov[5].X)} {10.}
(assert (= (+ (+ (* sc_51 1.) of_51) sltop_51) 10.))
(declare-fun slbot_53 () Real)
(declare-fun sltop_53 () Real)
; 
; =  {(((sc.itov[5].Y*0.)+of.itov[5].Y)+sl.min.itov[5].Y)} {0.0001}
(assert (= (+ (+ (* sc_53 0.) of_53) slbot_53) 0.0001))
; 
; =  {(((sc.itov[5].Y*4.)+of.itov[5].Y)+sl.max.itov[5].Y)} {3300.}
(assert (= (+ (+ (* sc_53 4.) of_53) sltop_53) 3300.))
(declare-fun slbot_52 () Real)
(declare-fun sltop_52 () Real)
; 
; =  {(((sc.itov[5].K*0.)+of.itov[5].K)+sl.min.itov[5].K)} {1.}
(assert (= (+ (+ (* sc_52 0.) of_52) slbot_52) 1.))
; 
; =  {(((sc.itov[5].K*4.)+of.itov[5].K)+sl.max.itov[5].K)} {330.}
(assert (= (+ (+ (* sc_52 4.) of_52) sltop_52) 330.))
(declare-fun slbot_53 () Real)
(declare-fun sltop_53 () Real)
; 
; =  {(((sc.itov[5].Y*0.)+of.itov[5].Y)+sl.min.itov[5].Y)} {0.0001}
(assert (= (+ (+ (* sc_53 0.) of_53) slbot_53) 0.0001))
; 
; =  {(((sc.itov[5].Y*4.)+of.itov[5].Y)+sl.max.itov[5].Y)} {3300.}
(assert (= (+ (+ (* sc_53 4.) of_53) sltop_53) 3300.))
(declare-fun sc_54 () Real)
(declare-fun of_54 () Real)
(declare-fun sc_55 () Real)
(declare-fun of_55 () Real)
(declare-fun sc_56 () Real)
(declare-fun of_56 () Real)
(declare-fun sc_57 () Real)
(declare-fun of_57 () Real)
(declare-fun sc_58 () Real)
(declare-fun of_58 () Real)
; 
; =  {sc.iadd[2].A} {sc.iadd[2].B}
(assert (= sc_56 sc_57))
; 
; =  {sc.iadd[2].A} {sc.iadd[2].C} {sc.iadd[2].D}
(assert (and (= sc_56 sc_55) (= sc_56 sc_54)))
; 
; =  {sc.iadd[2].OUT} {sc.iadd[2].A}
(assert (= sc_58 sc_56))
; 
; =  {of.iadd[2].OUT} {((of.iadd[2].A+of.iadd[2].B)-of.iadd[2].C-of.iadd[2].D)}
(assert (= of_58 (- (+ of_56 of_57) (+ of_55 of_54))))
; 
; >=  {((sc.iadd[2].D*-0.15)+of.iadd[2].D)} {5.}
(assert (<= (+ (* sc_54 -0.15) of_54) 5.))
; 
; <=  {((sc.iadd[2].D*-0.15)+of.iadd[2].D)} {0.}
(assert (>= (+ (* sc_54 -0.15) of_54) 0.))
; 
; >=  {((sc.iadd[2].C*0.)+of.iadd[2].C)} {5.}
(assert (<= (+ (* sc_55 0.) of_55) 5.))
; 
; <=  {((sc.iadd[2].C*0.)+of.iadd[2].C)} {0.}
(assert (>= (+ (* sc_55 0.) of_55) 0.))
(declare-fun slbot_58 () Real)
(declare-fun sltop_58 () Real)
; 
; =  {(((sc.iadd[2].OUT*0.)+of.iadd[2].OUT)+sl.min.iadd[2].OUT)} {-10.}
(assert (= (+ (+ (* sc_58 0.) of_58) slbot_58) -10.))
; 
; =  {(((sc.iadd[2].OUT*1.)+of.iadd[2].OUT)+sl.max.iadd[2].OUT)} {10.}
(assert (= (+ (+ (* sc_58 1.) of_58) sltop_58) 10.))
; 
; >=  {((sc.iadd[2].A*0.)+of.iadd[2].A)} {5.}
(assert (<= (+ (* sc_56 0.) of_56) 5.))
; 
; <=  {((sc.iadd[2].A*0.)+of.iadd[2].A)} {0.}
(assert (>= (+ (* sc_56 0.) of_56) 0.))
(declare-fun slbot_57 () Real)
(declare-fun sltop_57 () Real)
; 
; =  {(((sc.iadd[2].B*-1.)+of.iadd[2].B)+sl.min.iadd[2].B)} {0.}
(assert (= (+ (+ (* sc_57 -1.) of_57) slbot_57) 0.))
; 
; =  {(((sc.iadd[2].B*0.)+of.iadd[2].B)+sl.max.iadd[2].B)} {5.}
(assert (= (+ (+ (* sc_57 0.) of_57) sltop_57) 5.))
(declare-fun slbot_58 () Real)
(declare-fun sltop_58 () Real)
; 
; =  {(((sc.iadd[2].OUT*0.)+of.iadd[2].OUT)+sl.min.iadd[2].OUT)} {-10.}
(assert (= (+ (+ (* sc_58 0.) of_58) slbot_58) -10.))
; 
; =  {(((sc.iadd[2].OUT*1.)+of.iadd[2].OUT)+sl.max.iadd[2].OUT)} {10.}
(assert (= (+ (+ (* sc_58 1.) of_58) sltop_58) 10.))
(declare-fun sc_59 () Real)
(declare-fun of_59 () Real)
(declare-fun sc_60 () Real)
(declare-fun of_60 () Real)
(declare-fun sc_61 () Real)
(declare-fun of_61 () Real)
(declare-fun sc_62 () Real)
(declare-fun of_62 () Real)
(declare-fun sc_63 () Real)
(declare-fun of_63 () Real)
; 
; =  {sc.iadd[0].A} {sc.iadd[0].B}
(assert (= sc_61 sc_62))
; 
; =  {sc.iadd[0].A} {sc.iadd[0].C} {sc.iadd[0].D}
(assert (and (= sc_61 sc_60) (= sc_61 sc_59)))
; 
; =  {sc.iadd[0].OUT} {sc.iadd[0].A}
(assert (= sc_63 sc_61))
; 
; =  {of.iadd[0].OUT} {((of.iadd[0].A+of.iadd[0].B)-of.iadd[0].C-of.iadd[0].D)}
(assert (= of_63 (- (+ of_61 of_62) (+ of_60 of_59))))
(declare-fun slbot_59 () Real)
(declare-fun sltop_59 () Real)
; 
; =  {(((sc.iadd[0].D*0.)+of.iadd[0].D)+sl.min.iadd[0].D)} {0.}
(assert (= (+ (+ (* sc_59 0.) of_59) slbot_59) 0.))
; 
; =  {(((sc.iadd[0].D*1.)+of.iadd[0].D)+sl.max.iadd[0].D)} {5.}
(assert (= (+ (+ (* sc_59 1.) of_59) sltop_59) 5.))
; 
; >=  {((sc.iadd[0].C*-0.11)+of.iadd[0].C)} {5.}
(assert (<= (+ (* sc_60 -0.11) of_60) 5.))
; 
; <=  {((sc.iadd[0].C*-0.11)+of.iadd[0].C)} {0.}
(assert (>= (+ (* sc_60 -0.11) of_60) 0.))
(declare-fun slbot_63 () Real)
(declare-fun sltop_63 () Real)
; 
; =  {(((sc.iadd[0].OUT*0.)+of.iadd[0].OUT)+sl.min.iadd[0].OUT)} {-10.}
(assert (= (+ (+ (* sc_63 0.) of_63) slbot_63) -10.))
; 
; =  {(((sc.iadd[0].OUT*1.)+of.iadd[0].OUT)+sl.max.iadd[0].OUT)} {10.}
(assert (= (+ (+ (* sc_63 1.) of_63) sltop_63) 10.))
; 
; >=  {((sc.iadd[0].A*0.)+of.iadd[0].A)} {5.}
(assert (<= (+ (* sc_61 0.) of_61) 5.))
; 
; <=  {((sc.iadd[0].A*0.)+of.iadd[0].A)} {0.}
(assert (>= (+ (* sc_61 0.) of_61) 0.))
; 
; >=  {((sc.iadd[0].B*0.)+of.iadd[0].B)} {5.}
(assert (<= (+ (* sc_62 0.) of_62) 5.))
; 
; <=  {((sc.iadd[0].B*0.)+of.iadd[0].B)} {0.}
(assert (>= (+ (* sc_62 0.) of_62) 0.))
(declare-fun slbot_63 () Real)
(declare-fun sltop_63 () Real)
; 
; =  {(((sc.iadd[0].OUT*0.)+of.iadd[0].OUT)+sl.min.iadd[0].OUT)} {-10.}
(assert (= (+ (+ (* sc_63 0.) of_63) slbot_63) -10.))
; 
; =  {(((sc.iadd[0].OUT*1.)+of.iadd[0].OUT)+sl.max.iadd[0].OUT)} {10.}
(assert (= (+ (+ (* sc_63 1.) of_63) sltop_63) 10.))
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
; 
; =  {sc.iadd[1].A} {sc.iadd[1].B}
(assert (= sc_66 sc_67))
; 
; =  {sc.iadd[1].A} {sc.iadd[1].C} {sc.iadd[1].D}
(assert (and (= sc_66 sc_65) (= sc_66 sc_64)))
; 
; =  {sc.iadd[1].OUT} {sc.iadd[1].A}
(assert (= sc_68 sc_66))
; 
; =  {of.iadd[1].OUT} {((of.iadd[1].A+of.iadd[1].B)-of.iadd[1].C-of.iadd[1].D)}
(assert (= of_68 (- (+ of_66 of_67) (+ of_65 of_64))))
(declare-fun slbot_64 () Real)
(declare-fun sltop_64 () Real)
; 
; =  {(((sc.iadd[1].D*0.)+of.iadd[1].D)+sl.min.iadd[1].D)} {0.}
(assert (= (+ (+ (* sc_64 0.) of_64) slbot_64) 0.))
; 
; =  {(((sc.iadd[1].D*1.)+of.iadd[1].D)+sl.max.iadd[1].D)} {5.}
(assert (= (+ (+ (* sc_64 1.) of_64) sltop_64) 5.))
; 
; >=  {((sc.iadd[1].C*0.)+of.iadd[1].C)} {5.}
(assert (<= (+ (* sc_65 0.) of_65) 5.))
; 
; <=  {((sc.iadd[1].C*0.)+of.iadd[1].C)} {0.}
(assert (>= (+ (* sc_65 0.) of_65) 0.))
(declare-fun slbot_68 () Real)
(declare-fun sltop_68 () Real)
; 
; =  {(((sc.iadd[1].OUT*-1.)+of.iadd[1].OUT)+sl.min.iadd[1].OUT)} {-10.}
(assert (= (+ (+ (* sc_68 -1.) of_68) slbot_68) -10.))
; 
; =  {(((sc.iadd[1].OUT*0.)+of.iadd[1].OUT)+sl.max.iadd[1].OUT)} {10.}
(assert (= (+ (+ (* sc_68 0.) of_68) sltop_68) 10.))
; 
; >=  {((sc.iadd[1].A*0.)+of.iadd[1].A)} {5.}
(assert (<= (+ (* sc_66 0.) of_66) 5.))
; 
; <=  {((sc.iadd[1].A*0.)+of.iadd[1].A)} {0.}
(assert (>= (+ (* sc_66 0.) of_66) 0.))
; 
; >=  {((sc.iadd[1].B*0.)+of.iadd[1].B)} {5.}
(assert (<= (+ (* sc_67 0.) of_67) 5.))
; 
; <=  {((sc.iadd[1].B*0.)+of.iadd[1].B)} {0.}
(assert (>= (+ (* sc_67 0.) of_67) 0.))
(declare-fun slbot_68 () Real)
(declare-fun sltop_68 () Real)
; 
; =  {(((sc.iadd[1].OUT*-1.)+of.iadd[1].OUT)+sl.min.iadd[1].OUT)} {-10.}
(assert (= (+ (+ (* sc_68 -1.) of_68) slbot_68) -10.))
; 
; =  {(((sc.iadd[1].OUT*0.)+of.iadd[1].OUT)+sl.max.iadd[1].OUT)} {10.}
(assert (= (+ (+ (* sc_68 0.) of_68) sltop_68) 10.))
(declare-fun sc_69 () Real)
(declare-fun of_69 () Real)
(declare-fun sc_70 () Real)
(declare-fun of_70 () Real)
; 
; =  {sc.output.I[0].O} {sc.output.I[0].X}
(assert (= sc_70 sc_69))
; 
; =  {of.output.I[0].O} {of.output.I[0].X}
(assert (= of_70 of_69))
(declare-fun slbot_69 () Real)
(declare-fun sltop_69 () Real)
; 
; =  {(((sc.output.I[0].X*0.)+of.output.I[0].X)+sl.min.output.I[0].X)} {0.}
(assert (= (+ (+ (* sc_69 0.) of_69) slbot_69) 0.))
; 
; =  {(((sc.output.I[0].X*1.)+of.output.I[0].X)+sl.max.output.I[0].X)} {10.}
(assert (= (+ (+ (* sc_69 1.) of_69) sltop_69) 10.))
(declare-fun slbot_70 () Real)
(declare-fun sltop_70 () Real)
; 
; =  {(((sc.output.I[0].O*0.)+of.output.I[0].O)+sl.min.output.I[0].O)} {0.}
(assert (= (+ (+ (* sc_70 0.) of_70) slbot_70) 0.))
; 
; =  {(((sc.output.I[0].O*1.)+of.output.I[0].O)+sl.max.output.I[0].O)} {10.}
(assert (= (+ (+ (* sc_70 1.) of_70) sltop_70) 10.))
(declare-fun sc_71 () Real)
(declare-fun of_71 () Real)
(declare-fun sc_72 () Real)
(declare-fun of_72 () Real)
; 
; =  {sc.output.I[1].O} {sc.output.I[1].X}
(assert (= sc_72 sc_71))
; 
; =  {of.output.I[1].O} {of.output.I[1].X}
(assert (= of_72 of_71))
(declare-fun slbot_71 () Real)
(declare-fun sltop_71 () Real)
; 
; =  {(((sc.output.I[1].X*0.)+of.output.I[1].X)+sl.min.output.I[1].X)} {0.}
(assert (= (+ (+ (* sc_71 0.) of_71) slbot_71) 0.))
; 
; =  {(((sc.output.I[1].X*1.)+of.output.I[1].X)+sl.max.output.I[1].X)} {10.}
(assert (= (+ (+ (* sc_71 1.) of_71) sltop_71) 10.))
(declare-fun slbot_72 () Real)
(declare-fun sltop_72 () Real)
; 
; =  {(((sc.output.I[1].O*0.)+of.output.I[1].O)+sl.min.output.I[1].O)} {0.}
(assert (= (+ (+ (* sc_72 0.) of_72) slbot_72) 0.))
; 
; =  {(((sc.output.I[1].O*1.)+of.output.I[1].O)+sl.max.output.I[1].O)} {10.}
(assert (= (+ (+ (* sc_72 1.) of_72) sltop_72) 10.))
; 
; =  {sc.vadd[4].OUT2} {sc.output.V[0].X}
(assert (= sc_30 sc_22))
; 
; =  {of.vadd[4].OUT2} {of.output.V[0].X}
(assert (= of_30 of_22))
; 
; =  {sc.vadd[4].OUT2} {sc.vtoi[0].X}
(assert (= sc_30 sc_34))
; 
; =  {of.vadd[4].OUT2} {of.vtoi[0].X}
(assert (= of_30 of_34))
; 
; =  {sc.vadd[4].OUT2} {sc.vtoi[7].X}
(assert (= sc_30 sc_31))
; 
; =  {of.vadd[4].OUT2} {of.vtoi[7].X}
(assert (= of_30 of_31))
; 
; =  {sc.input.I[6].O} {sc.iadd[2].A}
(assert (= sc_13 sc_56))
; 
; =  {of.input.I[6].O} {of.iadd[2].A}
(assert (= of_13 of_56))
; 
; =  {sc.input.I[0].O} {sc.iadd[0].C}
(assert (= sc_11 sc_60))
; 
; =  {of.input.I[0].O} {of.iadd[0].C}
(assert (= of_11 of_60))
; 
; =  {sc.input.V[15].O} {sc.vtoi[7].K}
(assert (= sc_42 sc_32))
; 
; =  {of.input.V[15].O} {of.vtoi[7].K}
(assert (= of_42 of_32))
; 
; =  {sc.vtoi[7].Y} {sc.iadd[1].D}
(assert (= sc_33 sc_64))
; 
; =  {of.vtoi[7].Y} {of.iadd[1].D}
(assert (= of_33 of_64))
; 
; =  {sc.input.I[4].O} {sc.iadd[1].B}
(assert (= sc_17 sc_67))
; 
; =  {of.input.I[4].O} {of.iadd[1].B}
(assert (= of_17 of_67))
; 
; =  {sc.input.I[3].O} {sc.iadd[1].A}
(assert (= sc_15 sc_66))
; 
; =  {of.input.I[3].O} {of.iadd[1].A}
(assert (= of_15 of_66))
; 
; =  {sc.input.I[5].O} {sc.iadd[1].C}
(assert (= sc_19 sc_65))
; 
; =  {of.input.I[5].O} {of.iadd[1].C}
(assert (= of_19 of_65))
; 
; =  {sc.vtoi[0].Y} {sc.iadd[0].D}
(assert (= sc_36 sc_59))
; 
; =  {of.vtoi[0].Y} {of.iadd[0].D}
(assert (= of_36 of_59))
; 
; =  {sc.itov[5].Y} {sc.vadd[4].B}
(assert (= sc_53 sc_28))
; 
; =  {of.itov[5].Y} {of.vadd[4].B}
(assert (= of_53 of_28))
; 
; =  {sc.input.I[2].O} {sc.iadd[0].B}
(assert (= sc_5 sc_62))
; 
; =  {of.input.I[2].O} {of.iadd[0].B}
(assert (= of_5 of_62))
; 
; =  {sc.input.V[3].O} {sc.vadd[4].D}
(assert (= sc_46 sc_25))
; 
; =  {of.input.V[3].O} {of.vadd[4].D}
(assert (= of_46 of_25))
; 
; =  {sc.input.V[2].O} {sc.vadd[4].OUT2_0}
(assert (= sc_38 sc_24))
; 
; =  {of.input.V[2].O} {of.vadd[4].OUT2_0}
(assert (= of_38 of_24))
; 
; =  {sc.vgain[3].P} {sc.itov[5].K}
(assert (= sc_3 sc_52))
; 
; =  {of.vgain[3].P} {of.itov[5].K}
(assert (= of_3 of_52))
; 
; =  {sc.iadd[0].OUT} {sc.itov[5].X}
(assert (= sc_63 sc_51))
; 
; =  {of.iadd[0].OUT} {of.itov[5].X}
(assert (= of_63 of_51))
; 
; =  {sc.iadd[0].OUT} {sc.output.I[0].X}
(assert (= sc_63 sc_69))
; 
; =  {of.iadd[0].OUT} {of.output.I[0].X}
(assert (= of_63 of_69))
; 
; =  {sc.input.I[1].O} {sc.iadd[0].A}
(assert (= sc_21 sc_61))
; 
; =  {of.input.I[1].O} {of.iadd[0].A}
(assert (= of_21 of_61))
; 
; =  {sc.iadd[1].OUT} {sc.iadd[2].B}
(assert (= sc_68 sc_57))
; 
; =  {of.iadd[1].OUT} {of.iadd[2].B}
(assert (= of_68 of_57))
; 
; =  {sc.input.I[7].O} {sc.iadd[2].C}
(assert (= sc_9 sc_55))
; 
; =  {of.input.I[7].O} {of.iadd[2].C}
(assert (= of_9 of_55))
; 
; =  {sc.input.V[1].O} {sc.vadd[4].A}
(assert (= sc_50 sc_27))
; 
; =  {of.input.V[1].O} {of.vadd[4].A}
(assert (= of_50 of_27))
; 
; =  {sc.iadd[2].OUT} {sc.output.I[1].X}
(assert (= sc_58 sc_71))
; 
; =  {of.iadd[2].OUT} {of.output.I[1].X}
(assert (= of_58 of_71))
; 
; =  {sc.iadd[2].OUT} {sc.vgain[3].Z}
(assert (= sc_58 sc_2))
; 
; =  {of.iadd[2].OUT} {of.vgain[3].Z}
(assert (= of_58 of_2))
; 
; =  {sc.input.I[8].O} {sc.iadd[2].D}
(assert (= sc_7 sc_54))
; 
; =  {of.input.I[8].O} {of.iadd[2].D}
(assert (= of_7 of_54))
; 
; =  {sc.input.V[0].O} {sc.vgain[3].Y}
(assert (= sc_40 sc_1))
; 
; =  {of.input.V[0].O} {of.vgain[3].Y}
(assert (= of_40 of_1))
; 
; =  {sc.input.V[16].O} {sc.vtoi[0].K}
(assert (= sc_44 sc_35))
; 
; =  {of.input.V[16].O} {of.vtoi[0].K}
(assert (= of_44 of_35))
; 
; =  {sc.input.V[4].O} {sc.vgain[3].X}
(assert (= sc_48 sc_0))
; 
; =  {of.input.V[4].O} {of.vgain[3].X}
(assert (= of_48 of_0))
(assert (<= (* sc_23 0.001) 0.001))
; 
; =  {sc.vadd[4].OUT2} {sc.output.V[0].O}
(assert (= sc_30 sc_23))
(assert (= __minima__ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (* (ite (>= sltop_36 0) sltop_36 (- sltop_36)) 1.) (* (ite (>= slbot_29 0) slbot_29 (- slbot_29)) 1.)) (* (ite (>= sltop_72 0) sltop_72 (- sltop_72)) 1.)) (* (ite (>= slbot_22 0) slbot_22 (- slbot_22)) 1.)) (* (ite (>= sltop_23 0) sltop_23 (- sltop_23)) 1.)) (* (ite (>= sltop_52 0) sltop_52 (- sltop_52)) 1.)) (* (ite (>= slbot_72 0) slbot_72 (- slbot_72)) 1.)) (* (ite (>= sltop_70 0) sltop_70 (- sltop_70)) 1.)) (* (ite (>= slbot_3 0) slbot_3 (- slbot_3)) 1.)) (* (ite (>= slbot_53 0) slbot_53 (- slbot_53)) 1.)) (* (ite (>= slbot_63 0) slbot_63 (- slbot_63)) 1.)) (* (ite (>= sltop_28 0) sltop_28 (- sltop_28)) 1.)) (* (ite (>= slbot_59 0) slbot_59 (- slbot_59)) 1.)) (* (ite (>= slbot_64 0) slbot_64 (- slbot_64)) 1.)) (* (ite (>= slbot_2 0) slbot_2 (- slbot_2)) 1.)) (* (ite (>= sltop_71 0) sltop_71 (- sltop_71)) 1.)) (* (ite (>= sltop_29 0) sltop_29 (- sltop_29)) 1.)) (* (ite (>= sltop_58 0) sltop_58 (- sltop_58)) 1.)) (* (ite (>= slbot_31 0) slbot_31 (- slbot_31)) 1.)) (* (ite (>= slbot_36 0) slbot_36 (- slbot_36)) 1.)) (* (ite (>= slbot_71 0) slbot_71 (- slbot_71)) 1.)) (* (ite (>= sltop_22 0) sltop_22 (- sltop_22)) 1.)) (* (ite (>= sltop_2 0) sltop_2 (- sltop_2)) 1.)) (* (ite (>= sltop_31 0) sltop_31 (- sltop_31)) 1.)) (* (ite (>= slbot_28 0) slbot_28 (- slbot_28)) 1.)) (* (ite (>= sltop_57 0) sltop_57 (- sltop_57)) 1.)) (* (ite (>= slbot_57 0) slbot_57 (- slbot_57)) 1.)) (* (ite (>= slbot_52 0) slbot_52 (- slbot_52)) 1.)) (* (ite (>= slbot_51 0) slbot_51 (- slbot_51)) 1.)) (* (ite (>= sltop_51 0) sltop_51 (- sltop_51)) 1.)) (* (ite (>= sltop_34 0) sltop_34 (- sltop_34)) 1.)) (* (ite (>= slbot_30 0) slbot_30 (- slbot_30)) 1.)) (* (ite (>= slbot_68 0) slbot_68 (- slbot_68)) 1.)) (* (ite (>= slbot_70 0) slbot_70 (- slbot_70)) 1.)) (* (ite (>= sltop_30 0) sltop_30 (- sltop_30)) 1.)) (* (ite (>= sltop_53 0) sltop_53 (- sltop_53)) 1.)) (* (ite (>= sltop_64 0) sltop_64 (- sltop_64)) 1.)) (* (ite (>= sltop_68 0) sltop_68 (- sltop_68)) 1.)) (* (ite (>= slbot_23 0) slbot_23 (- slbot_23)) 1.)) (* (ite (>= sltop_69 0) sltop_69 (- sltop_69)) 1.)) (* (ite (>= slbot_34 0) slbot_34 (- slbot_34)) 1.)) (* (ite (>= sltop_63 0) sltop_63 (- sltop_63)) 1.)) (* (ite (>= sltop_3 0) sltop_3 (- sltop_3)) 1.)) (* (ite (>= slbot_58 0) slbot_58 (- slbot_58)) 1.)) (* (ite (>= slbot_69 0) slbot_69 (- slbot_69)) 1.)) (* (ite (>= slbot_33 0) slbot_33 (- slbot_33)) 1.)) (* (ite (>= sltop_33 0) sltop_33 (- sltop_33)) 1.)) (* (ite (>= sltop_59 0) sltop_59 (- sltop_59)) 1.))))
(check-sat)
