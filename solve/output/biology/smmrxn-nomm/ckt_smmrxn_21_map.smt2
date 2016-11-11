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
; =  {sc.vgain[2].P} {((sc.vgain[2].X/sc.vgain[2].Y)*sc.vgain[2].Z*1)}
(assert (= sc_3 (* (* (/ sc_0 sc_1) sc_2) 1)))
; 
; =  {of.vgain[2].P} {0}
(assert (= of_3 0.))
; 
; >=  {((sc.vgain[2].X*1.)+of.vgain[2].X)} {3300.}
(assert (<= (+ (* sc_0 1.) of_0) 3300.))
; 
; <=  {((sc.vgain[2].X*1.)+of.vgain[2].X)} {0.0001}
(assert (>= (+ (* sc_0 1.) of_0) 0.0001))
; 
; >=  {((sc.vgain[2].Y*0.125)+of.vgain[2].Y)} {3300.}
(assert (<= (+ (* sc_1 0.125) of_1) 3300.))
; 
; <=  {((sc.vgain[2].Y*0.125)+of.vgain[2].Y)} {1.}
(assert (>= (+ (* sc_1 0.125) of_1) 1.))
(declare-fun slbot_3 () Real)
(declare-fun sltop_3 () Real)
; 
; =  {(((sc.vgain[2].P*0.)+of.vgain[2].P)+sl.min.vgain[2].P)} {1.51515151515e-12}
(assert (= (+ (+ (* sc_3 0.) of_3) slbot_3) 1.51515151515e-12))
; 
; =  {(((sc.vgain[2].P*4.)+of.vgain[2].P)+sl.max.vgain[2].P)} {5445000.}
(assert (= (+ (+ (* sc_3 4.) of_3) sltop_3) 5445000.))
(declare-fun slbot_2 () Real)
(declare-fun sltop_2 () Real)
; 
; =  {(((sc.vgain[2].Z*0.)+of.vgain[2].Z)+sl.min.vgain[2].Z)} {0.0001}
(assert (= (+ (+ (* sc_2 0.) of_2) slbot_2) 0.0001))
; 
; =  {(((sc.vgain[2].Z*1.)+of.vgain[2].Z)+sl.max.vgain[2].Z)} {3300.}
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
; =  {sc.input.I[0].O} {sc.input.I[0].X}
(assert (= sc_7 sc_6))
; 
; =  {of.input.I[0].O} {of.input.I[0].X}
(assert (= of_7 of_6))
; 
; >=  {((sc.input.I[0].X*-0.11)+of.input.I[0].X)} {10.}
(assert (<= (+ (* sc_6 -0.11) of_6) 10.))
; 
; <=  {((sc.input.I[0].X*-0.11)+of.input.I[0].X)} {0.}
(assert (>= (+ (* sc_6 -0.11) of_6) 0.))
; 
; >=  {((sc.input.I[0].O*-0.11)+of.input.I[0].O)} {10.}
(assert (<= (+ (* sc_7 -0.11) of_7) 10.))
; 
; <=  {((sc.input.I[0].O*-0.11)+of.input.I[0].O)} {0.}
(assert (>= (+ (* sc_7 -0.11) of_7) 0.))
(declare-fun sc_8 () Real)
(declare-fun of_8 () Real)
(declare-fun sc_9 () Real)
(declare-fun of_9 () Real)
; 
; =  {sc.input.I[3].O} {sc.input.I[3].X}
(assert (= sc_9 sc_8))
; 
; =  {of.input.I[3].O} {of.input.I[3].X}
(assert (= of_9 of_8))
; 
; >=  {((sc.input.I[3].X*0.)+of.input.I[3].X)} {10.}
(assert (<= (+ (* sc_8 0.) of_8) 10.))
; 
; <=  {((sc.input.I[3].X*0.)+of.input.I[3].X)} {0.}
(assert (>= (+ (* sc_8 0.) of_8) 0.))
; 
; >=  {((sc.input.I[3].O*0.)+of.input.I[3].O)} {10.}
(assert (<= (+ (* sc_9 0.) of_9) 10.))
; 
; <=  {((sc.input.I[3].O*0.)+of.input.I[3].O)} {0.}
(assert (>= (+ (* sc_9 0.) of_9) 0.))
(declare-fun sc_10 () Real)
(declare-fun of_10 () Real)
(declare-fun sc_11 () Real)
(declare-fun of_11 () Real)
; 
; =  {sc.input.I[4].O} {sc.input.I[4].X}
(assert (= sc_11 sc_10))
; 
; =  {of.input.I[4].O} {of.input.I[4].X}
(assert (= of_11 of_10))
; 
; >=  {((sc.input.I[4].X*0.)+of.input.I[4].X)} {10.}
(assert (<= (+ (* sc_10 0.) of_10) 10.))
; 
; <=  {((sc.input.I[4].X*0.)+of.input.I[4].X)} {0.}
(assert (>= (+ (* sc_10 0.) of_10) 0.))
; 
; >=  {((sc.input.I[4].O*0.)+of.input.I[4].O)} {10.}
(assert (<= (+ (* sc_11 0.) of_11) 10.))
; 
; <=  {((sc.input.I[4].O*0.)+of.input.I[4].O)} {0.}
(assert (>= (+ (* sc_11 0.) of_11) 0.))
(declare-fun sc_12 () Real)
(declare-fun of_12 () Real)
(declare-fun sc_13 () Real)
(declare-fun of_13 () Real)
; 
; =  {sc.input.I[5].O} {sc.input.I[5].X}
(assert (= sc_13 sc_12))
; 
; =  {of.input.I[5].O} {of.input.I[5].X}
(assert (= of_13 of_12))
; 
; >=  {((sc.input.I[5].X*0.15)+of.input.I[5].X)} {10.}
(assert (<= (+ (* sc_12 0.15) of_12) 10.))
; 
; <=  {((sc.input.I[5].X*0.15)+of.input.I[5].X)} {0.}
(assert (>= (+ (* sc_12 0.15) of_12) 0.))
; 
; >=  {((sc.input.I[5].O*0.15)+of.input.I[5].O)} {10.}
(assert (<= (+ (* sc_13 0.15) of_13) 10.))
; 
; <=  {((sc.input.I[5].O*0.15)+of.input.I[5].O)} {0.}
(assert (>= (+ (* sc_13 0.15) of_13) 0.))
(declare-fun sc_14 () Real)
(declare-fun of_14 () Real)
(declare-fun sc_15 () Real)
(declare-fun of_15 () Real)
; 
; =  {sc.input.I[1].O} {sc.input.I[1].X}
(assert (= sc_15 sc_14))
; 
; =  {of.input.I[1].O} {of.input.I[1].X}
(assert (= of_15 of_14))
; 
; >=  {((sc.input.I[1].X*0.)+of.input.I[1].X)} {10.}
(assert (<= (+ (* sc_14 0.) of_14) 10.))
; 
; <=  {((sc.input.I[1].X*0.)+of.input.I[1].X)} {0.}
(assert (>= (+ (* sc_14 0.) of_14) 0.))
; 
; >=  {((sc.input.I[1].O*0.)+of.input.I[1].O)} {10.}
(assert (<= (+ (* sc_15 0.) of_15) 10.))
; 
; <=  {((sc.input.I[1].O*0.)+of.input.I[1].O)} {0.}
(assert (>= (+ (* sc_15 0.) of_15) 0.))
(declare-fun sc_16 () Real)
(declare-fun of_16 () Real)
(declare-fun sc_17 () Real)
(declare-fun of_17 () Real)
; 
; =  {sc.output.V[0].O} {sc.output.V[0].X}
(assert (= sc_17 sc_16))
; 
; =  {of.output.V[0].O} {of.output.V[0].X}
(assert (= of_17 of_16))
(declare-fun slbot_16 () Real)
(declare-fun sltop_16 () Real)
; 
; =  {(((sc.output.V[0].X*0.)+of.output.V[0].X)+sl.min.output.V[0].X)} {0.0001}
(assert (= (+ (+ (* sc_16 0.) of_16) slbot_16) 0.0001))
; 
; =  {(((sc.output.V[0].X*1.)+of.output.V[0].X)+sl.max.output.V[0].X)} {3300.}
(assert (= (+ (+ (* sc_16 1.) of_16) sltop_16) 3300.))
(declare-fun slbot_17 () Real)
(declare-fun sltop_17 () Real)
; 
; =  {(((sc.output.V[0].O*0.)+of.output.V[0].O)+sl.min.output.V[0].O)} {0.0001}
(assert (= (+ (+ (* sc_17 0.) of_17) slbot_17) 0.0001))
; 
; =  {(((sc.output.V[0].O*1.)+of.output.V[0].O)+sl.max.output.V[0].O)} {3300.}
(assert (= (+ (+ (* sc_17 1.) of_17) sltop_17) 3300.))
(declare-fun sc_18 () Real)
(declare-fun of_18 () Real)
(declare-fun sc_19 () Real)
(declare-fun of_19 () Real)
(declare-fun sc_20 () Real)
(declare-fun of_20 () Real)
(declare-fun sc_21 () Real)
(declare-fun of_21 () Real)
(declare-fun sc_22 () Real)
(declare-fun of_22 () Real)
(declare-fun sc_23 () Real)
(declare-fun of_23 () Real)
(declare-fun sc_24 () Real)
(declare-fun of_24 () Real)
(assert (= 0. 0))
(assert (= of_19 0))
(assert (= 0. 0))
(assert (= of_22 0))
; 
; =  {sc.vadd[3].A} {(1*sc.vadd[3].B)}
(assert (= sc_21 (* 1 sc_22)))
; 
; =  {sc.vadd[3].A} {(1*sc.vadd[3].C)} {(1*sc.vadd[3].D)}
(assert (and (= sc_21 (* 1 sc_20)) (= sc_21 (* 1 sc_19))))
(assert (= (- (+ of_21 0) (+ 0 0)) 0))
(assert (= 0. 0))
; 
; =  {sc.vadd[3].OUT} {(sc.vadd[3].A*1)}
(assert (= sc_23 (* sc_21 1)))
; 
; =  {of.vadd[3].OUT} {0}
(assert (= of_23 0.))
(assert (= 0. 0))
(assert (= of_19 0))
(assert (= 0. 0))
(assert (= 0. 0))
(assert (= of_22 0))
; 
; =  {sc.vadd[3].A} {(1*sc.vadd[3].B)}
(assert (= sc_21 (* 1 sc_22)))
; 
; =  {sc.vadd[3].A} {(1*sc.vadd[3].C)} {(1*sc.vadd[3].D*1)}
(assert (and (= sc_21 (* 1 sc_20)) (= sc_21 (* (* 1 sc_19) 1))))
(assert (= (- (+ of_21 0) (+ 0 0)) 0))
(assert (= 0. 0))
; 
; =  {sc.vadd[3].OUT2} {(sc.vadd[3].A*1)}
(assert (= sc_24 (* sc_21 1)))
(assert (= of_24 0))
(assert (= 0. 0))
; 
; =  {sc.vadd[3].OUT2_0} {(sc.vadd[3].A*1)}
(assert (= sc_18 (* sc_21 1)))
; 
; =  {of.vadd[3].OUT2_0} {0}
(assert (= of_18 0.))
; 
; >=  {((sc.vadd[3].OUT2_0*0.)+of.vadd[3].OUT2_0)} {3300.}
(assert (<= (+ (* sc_18 0.) of_18) 3300.))
; 
; <=  {((sc.vadd[3].OUT2_0*0.)+of.vadd[3].OUT2_0)} {0.}
(assert (>= (+ (* sc_18 0.) of_18) 0.))
; 
; >=  {((sc.vadd[3].D*4.)+of.vadd[3].D)} {3300.}
(assert (<= (+ (* sc_19 4.) of_19) 3300.))
; 
; <=  {((sc.vadd[3].D*4.)+of.vadd[3].D)} {0.0001}
(assert (>= (+ (* sc_19 4.) of_19) 0.0001))
; 
; >=  {((sc.vadd[3].A*0.)+of.vadd[3].A)} {3300.}
(assert (<= (+ (* sc_21 0.) of_21) 3300.))
; 
; <=  {((sc.vadd[3].A*0.)+of.vadd[3].A)} {0.0001}
(assert (>= (+ (* sc_21 0.) of_21) 0.0001))
(declare-fun slbot_24 () Real)
(declare-fun sltop_24 () Real)
; 
; =  {(((sc.vadd[3].OUT2*0.)+of.vadd[3].OUT2)+sl.min.vadd[3].OUT2)} {0.}
(assert (= (+ (+ (* sc_24 0.) of_24) slbot_24) 0.))
; 
; =  {(((sc.vadd[3].OUT2*1.)+of.vadd[3].OUT2)+sl.max.vadd[3].OUT2)} {5.}
(assert (= (+ (+ (* sc_24 1.) of_24) sltop_24) 5.))
(declare-fun slbot_22 () Real)
(declare-fun sltop_22 () Real)
; 
; =  {(((sc.vadd[3].B*0.)+of.vadd[3].B)+sl.min.vadd[3].B)} {0.0001}
(assert (= (+ (+ (* sc_22 0.) of_22) slbot_22) 0.0001))
; 
; =  {(((sc.vadd[3].B*4.)+of.vadd[3].B)+sl.max.vadd[3].B)} {3300.}
(assert (= (+ (+ (* sc_22 4.) of_22) sltop_22) 3300.))
(declare-fun slbot_23 () Real)
(declare-fun sltop_23 () Real)
; 
; =  {(((sc.vadd[3].OUT*0.)+of.vadd[3].OUT)+sl.min.vadd[3].OUT)} {-824.99995}
(assert (= (+ (+ (* sc_23 0.) of_23) slbot_23) -824.99995))
; 
; =  {(((sc.vadd[3].OUT*4.)+of.vadd[3].OUT)+sl.max.vadd[3].OUT)} {1649.999975}
(assert (= (+ (+ (* sc_23 4.) of_23) sltop_23) 1649.999975))
(declare-fun slbot_24 () Real)
(declare-fun sltop_24 () Real)
; 
; =  {(((sc.vadd[3].OUT2*0.)+of.vadd[3].OUT2)+sl.min.vadd[3].OUT2)} {0.}
(assert (= (+ (+ (* sc_24 0.) of_24) slbot_24) 0.))
; 
; =  {(((sc.vadd[3].OUT2*1.)+of.vadd[3].OUT2)+sl.max.vadd[3].OUT2)} {5.}
(assert (= (+ (+ (* sc_24 1.) of_24) sltop_24) 5.))
(declare-fun sc_25 () Real)
(declare-fun of_25 () Real)
(declare-fun sc_26 () Real)
(declare-fun of_26 () Real)
(declare-fun sc_27 () Real)
(declare-fun of_27 () Real)
(assert (= 0. 0))
(assert (= of_26 0))
(assert (= 0. 0))
(assert (= of_25 0))
; 
; =  {sc.vtoi[0].Y} {((1/sc.vtoi[0].K)*sc.vtoi[0].X)}
(assert (= sc_27 (* (/ 1 sc_26) sc_25)))
; 
; =  {of.vtoi[0].Y} {0}
(assert (= of_27 0.))
(declare-fun slbot_25 () Real)
(declare-fun sltop_25 () Real)
; 
; =  {(((sc.vtoi[0].X*0.)+of.vtoi[0].X)+sl.min.vtoi[0].X)} {1.}
(assert (= (+ (+ (* sc_25 0.) of_25) slbot_25) 1.))
; 
; =  {(((sc.vtoi[0].X*1.)+of.vtoi[0].X)+sl.max.vtoi[0].X)} {3300.}
(assert (= (+ (+ (* sc_25 1.) of_25) sltop_25) 3300.))
; 
; >=  {((sc.vtoi[0].K*1.)+of.vtoi[0].K)} {3300.}
(assert (<= (+ (* sc_26 1.) of_26) 3300.))
; 
; <=  {((sc.vtoi[0].K*1.)+of.vtoi[0].K)} {1.}
(assert (>= (+ (* sc_26 1.) of_26) 1.))
(declare-fun slbot_27 () Real)
(declare-fun sltop_27 () Real)
; 
; =  {(((sc.vtoi[0].Y*0.)+of.vtoi[0].Y)+sl.min.vtoi[0].Y)} {0.00030303030303}
(assert (= (+ (+ (* sc_27 0.) of_27) slbot_27) 0.00030303030303))
; 
; =  {(((sc.vtoi[0].Y*1.)+of.vtoi[0].Y)+sl.max.vtoi[0].Y)} {3300.}
(assert (= (+ (+ (* sc_27 1.) of_27) sltop_27) 3300.))
(declare-fun sc_28 () Real)
(declare-fun of_28 () Real)
(declare-fun sc_29 () Real)
(declare-fun of_29 () Real)
(declare-fun sc_30 () Real)
(declare-fun of_30 () Real)
(assert (= 0. 0))
(assert (= of_29 0))
(assert (= 0. 0))
(assert (= of_28 0))
; 
; =  {sc.vtoi[5].Y} {((1/sc.vtoi[5].K)*sc.vtoi[5].X)}
(assert (= sc_30 (* (/ 1 sc_29) sc_28)))
; 
; =  {of.vtoi[5].Y} {0}
(assert (= of_30 0.))
(declare-fun slbot_28 () Real)
(declare-fun sltop_28 () Real)
; 
; =  {(((sc.vtoi[5].X*0.)+of.vtoi[5].X)+sl.min.vtoi[5].X)} {1.}
(assert (= (+ (+ (* sc_28 0.) of_28) slbot_28) 1.))
; 
; =  {(((sc.vtoi[5].X*1.)+of.vtoi[5].X)+sl.max.vtoi[5].X)} {3300.}
(assert (= (+ (+ (* sc_28 1.) of_28) sltop_28) 3300.))
; 
; >=  {((sc.vtoi[5].K*1.)+of.vtoi[5].K)} {3300.}
(assert (<= (+ (* sc_29 1.) of_29) 3300.))
; 
; <=  {((sc.vtoi[5].K*1.)+of.vtoi[5].K)} {1.}
(assert (>= (+ (* sc_29 1.) of_29) 1.))
(declare-fun slbot_30 () Real)
(declare-fun sltop_30 () Real)
; 
; =  {(((sc.vtoi[5].Y*0.)+of.vtoi[5].Y)+sl.min.vtoi[5].Y)} {0.00030303030303}
(assert (= (+ (+ (* sc_30 0.) of_30) slbot_30) 0.00030303030303))
; 
; =  {(((sc.vtoi[5].Y*1.)+of.vtoi[5].Y)+sl.max.vtoi[5].Y)} {3300.}
(assert (= (+ (+ (* sc_30 1.) of_30) sltop_30) 3300.))
(declare-fun sc_31 () Real)
(declare-fun of_31 () Real)
(declare-fun sc_32 () Real)
(declare-fun of_32 () Real)
; 
; =  {sc.input.V[2].O} {sc.input.V[2].X}
(assert (= sc_32 sc_31))
; 
; =  {of.input.V[2].O} {of.input.V[2].X}
(assert (= of_32 of_31))
; 
; >=  {((sc.input.V[2].X*0.)+of.input.V[2].X)} {5.}
(assert (<= (+ (* sc_31 0.) of_31) 5.))
; 
; <=  {((sc.input.V[2].X*0.)+of.input.V[2].X)} {0.}
(assert (>= (+ (* sc_31 0.) of_31) 0.))
; 
; >=  {((sc.input.V[2].O*0.)+of.input.V[2].O)} {5.}
(assert (<= (+ (* sc_32 0.) of_32) 5.))
; 
; <=  {((sc.input.V[2].O*0.)+of.input.V[2].O)} {0.}
(assert (>= (+ (* sc_32 0.) of_32) 0.))
(declare-fun sc_33 () Real)
(declare-fun of_33 () Real)
(declare-fun sc_34 () Real)
(declare-fun of_34 () Real)
; 
; =  {sc.input.V[13].O} {sc.input.V[13].X}
(assert (= sc_34 sc_33))
; 
; =  {of.input.V[13].O} {of.input.V[13].X}
(assert (= of_34 of_33))
; 
; >=  {((sc.input.V[13].X*1.)+of.input.V[13].X)} {5.}
(assert (<= (+ (* sc_33 1.) of_33) 5.))
; 
; <=  {((sc.input.V[13].X*1.)+of.input.V[13].X)} {0.}
(assert (>= (+ (* sc_33 1.) of_33) 0.))
; 
; >=  {((sc.input.V[13].O*1.)+of.input.V[13].O)} {5.}
(assert (<= (+ (* sc_34 1.) of_34) 5.))
; 
; <=  {((sc.input.V[13].O*1.)+of.input.V[13].O)} {0.}
(assert (>= (+ (* sc_34 1.) of_34) 0.))
(declare-fun sc_35 () Real)
(declare-fun of_35 () Real)
(declare-fun sc_36 () Real)
(declare-fun of_36 () Real)
; 
; =  {sc.input.V[0].O} {sc.input.V[0].X}
(assert (= sc_36 sc_35))
; 
; =  {of.input.V[0].O} {of.input.V[0].X}
(assert (= of_36 of_35))
; 
; >=  {((sc.input.V[0].X*0.125)+of.input.V[0].X)} {5.}
(assert (<= (+ (* sc_35 0.125) of_35) 5.))
; 
; <=  {((sc.input.V[0].X*0.125)+of.input.V[0].X)} {0.}
(assert (>= (+ (* sc_35 0.125) of_35) 0.))
; 
; >=  {((sc.input.V[0].O*0.125)+of.input.V[0].O)} {5.}
(assert (<= (+ (* sc_36 0.125) of_36) 5.))
; 
; <=  {((sc.input.V[0].O*0.125)+of.input.V[0].O)} {0.}
(assert (>= (+ (* sc_36 0.125) of_36) 0.))
(declare-fun sc_37 () Real)
(declare-fun of_37 () Real)
(declare-fun sc_38 () Real)
(declare-fun of_38 () Real)
; 
; =  {sc.input.V[14].O} {sc.input.V[14].X}
(assert (= sc_38 sc_37))
; 
; =  {of.input.V[14].O} {of.input.V[14].X}
(assert (= of_38 of_37))
; 
; >=  {((sc.input.V[14].X*1.)+of.input.V[14].X)} {5.}
(assert (<= (+ (* sc_37 1.) of_37) 5.))
; 
; <=  {((sc.input.V[14].X*1.)+of.input.V[14].X)} {0.}
(assert (>= (+ (* sc_37 1.) of_37) 0.))
; 
; >=  {((sc.input.V[14].O*1.)+of.input.V[14].O)} {5.}
(assert (<= (+ (* sc_38 1.) of_38) 5.))
; 
; <=  {((sc.input.V[14].O*1.)+of.input.V[14].O)} {0.}
(assert (>= (+ (* sc_38 1.) of_38) 0.))
(declare-fun sc_39 () Real)
(declare-fun of_39 () Real)
(declare-fun sc_40 () Real)
(declare-fun of_40 () Real)
; 
; =  {sc.input.V[3].O} {sc.input.V[3].X}
(assert (= sc_40 sc_39))
; 
; =  {of.input.V[3].O} {of.input.V[3].X}
(assert (= of_40 of_39))
; 
; >=  {((sc.input.V[3].X*4.)+of.input.V[3].X)} {5.}
(assert (<= (+ (* sc_39 4.) of_39) 5.))
; 
; <=  {((sc.input.V[3].X*4.)+of.input.V[3].X)} {0.}
(assert (>= (+ (* sc_39 4.) of_39) 0.))
; 
; >=  {((sc.input.V[3].O*4.)+of.input.V[3].O)} {5.}
(assert (<= (+ (* sc_40 4.) of_40) 5.))
; 
; <=  {((sc.input.V[3].O*4.)+of.input.V[3].O)} {0.}
(assert (>= (+ (* sc_40 4.) of_40) 0.))
(declare-fun sc_41 () Real)
(declare-fun of_41 () Real)
(declare-fun sc_42 () Real)
(declare-fun of_42 () Real)
; 
; =  {sc.input.V[4].O} {sc.input.V[4].X}
(assert (= sc_42 sc_41))
; 
; =  {of.input.V[4].O} {of.input.V[4].X}
(assert (= of_42 of_41))
; 
; >=  {((sc.input.V[4].X*1.)+of.input.V[4].X)} {5.}
(assert (<= (+ (* sc_41 1.) of_41) 5.))
; 
; <=  {((sc.input.V[4].X*1.)+of.input.V[4].X)} {0.}
(assert (>= (+ (* sc_41 1.) of_41) 0.))
; 
; >=  {((sc.input.V[4].O*1.)+of.input.V[4].O)} {5.}
(assert (<= (+ (* sc_42 1.) of_42) 5.))
; 
; <=  {((sc.input.V[4].O*1.)+of.input.V[4].O)} {0.}
(assert (>= (+ (* sc_42 1.) of_42) 0.))
(declare-fun sc_43 () Real)
(declare-fun of_43 () Real)
(declare-fun sc_44 () Real)
(declare-fun of_44 () Real)
; 
; =  {sc.input.V[1].O} {sc.input.V[1].X}
(assert (= sc_44 sc_43))
; 
; =  {of.input.V[1].O} {of.input.V[1].X}
(assert (= of_44 of_43))
; 
; >=  {((sc.input.V[1].X*0.)+of.input.V[1].X)} {5.}
(assert (<= (+ (* sc_43 0.) of_43) 5.))
; 
; <=  {((sc.input.V[1].X*0.)+of.input.V[1].X)} {0.}
(assert (>= (+ (* sc_43 0.) of_43) 0.))
; 
; >=  {((sc.input.V[1].O*0.)+of.input.V[1].O)} {5.}
(assert (<= (+ (* sc_44 0.) of_44) 5.))
; 
; <=  {((sc.input.V[1].O*0.)+of.input.V[1].O)} {0.}
(assert (>= (+ (* sc_44 0.) of_44) 0.))
(declare-fun sc_45 () Real)
(declare-fun of_45 () Real)
(declare-fun sc_46 () Real)
(declare-fun of_46 () Real)
(declare-fun sc_47 () Real)
(declare-fun of_47 () Real)
(assert (= of_46 0))
(assert (= of_45 0))
; 
; =  {sc.itov[4].Y} {(sc.itov[4].K*sc.itov[4].X)}
(assert (= sc_47 (* sc_46 sc_45)))
; 
; =  {of.itov[4].Y} {0}
(assert (= of_47 0.))
(declare-fun slbot_45 () Real)
(declare-fun sltop_45 () Real)
; 
; =  {(((sc.itov[4].X*0.)+of.itov[4].X)+sl.min.itov[4].X)} {0.0001}
(assert (= (+ (+ (* sc_45 0.) of_45) slbot_45) 0.0001))
; 
; =  {(((sc.itov[4].X*1.)+of.itov[4].X)+sl.max.itov[4].X)} {10.}
(assert (= (+ (+ (* sc_45 1.) of_45) sltop_45) 10.))
(declare-fun slbot_47 () Real)
(declare-fun sltop_47 () Real)
; 
; =  {(((sc.itov[4].Y*0.)+of.itov[4].Y)+sl.min.itov[4].Y)} {0.0001}
(assert (= (+ (+ (* sc_47 0.) of_47) slbot_47) 0.0001))
; 
; =  {(((sc.itov[4].Y*4.)+of.itov[4].Y)+sl.max.itov[4].Y)} {3300.}
(assert (= (+ (+ (* sc_47 4.) of_47) sltop_47) 3300.))
(declare-fun slbot_46 () Real)
(declare-fun sltop_46 () Real)
; 
; =  {(((sc.itov[4].K*0.)+of.itov[4].K)+sl.min.itov[4].K)} {1.}
(assert (= (+ (+ (* sc_46 0.) of_46) slbot_46) 1.))
; 
; =  {(((sc.itov[4].K*4.)+of.itov[4].K)+sl.max.itov[4].K)} {330.}
(assert (= (+ (+ (* sc_46 4.) of_46) sltop_46) 330.))
(declare-fun slbot_47 () Real)
(declare-fun sltop_47 () Real)
; 
; =  {(((sc.itov[4].Y*0.)+of.itov[4].Y)+sl.min.itov[4].Y)} {0.0001}
(assert (= (+ (+ (* sc_47 0.) of_47) slbot_47) 0.0001))
; 
; =  {(((sc.itov[4].Y*4.)+of.itov[4].Y)+sl.max.itov[4].Y)} {3300.}
(assert (= (+ (+ (* sc_47 4.) of_47) sltop_47) 3300.))
(declare-fun sc_48 () Real)
(declare-fun of_48 () Real)
(declare-fun sc_49 () Real)
(declare-fun of_49 () Real)
(declare-fun sc_50 () Real)
(declare-fun of_50 () Real)
(declare-fun sc_51 () Real)
(declare-fun of_51 () Real)
(declare-fun sc_52 () Real)
(declare-fun of_52 () Real)
; 
; =  {sc.iadd[0].A} {sc.iadd[0].B}
(assert (= sc_50 sc_51))
; 
; =  {sc.iadd[0].A} {sc.iadd[0].C} {sc.iadd[0].D}
(assert (and (= sc_50 sc_49) (= sc_50 sc_48)))
; 
; =  {sc.iadd[0].OUT} {sc.iadd[0].A}
(assert (= sc_52 sc_50))
; 
; =  {of.iadd[0].OUT} {((of.iadd[0].A+of.iadd[0].B)-of.iadd[0].C-of.iadd[0].D)}
(assert (= of_52 (- (+ of_50 of_51) (+ of_49 of_48))))
(declare-fun slbot_48 () Real)
(declare-fun sltop_48 () Real)
; 
; =  {(((sc.iadd[0].D*0.)+of.iadd[0].D)+sl.min.iadd[0].D)} {0.}
(assert (= (+ (+ (* sc_48 0.) of_48) slbot_48) 0.))
; 
; =  {(((sc.iadd[0].D*1.)+of.iadd[0].D)+sl.max.iadd[0].D)} {5.}
(assert (= (+ (+ (* sc_48 1.) of_48) sltop_48) 5.))
; 
; >=  {((sc.iadd[0].C*-0.11)+of.iadd[0].C)} {5.}
(assert (<= (+ (* sc_49 -0.11) of_49) 5.))
; 
; <=  {((sc.iadd[0].C*-0.11)+of.iadd[0].C)} {0.}
(assert (>= (+ (* sc_49 -0.11) of_49) 0.))
(declare-fun slbot_52 () Real)
(declare-fun sltop_52 () Real)
; 
; =  {(((sc.iadd[0].OUT*0.)+of.iadd[0].OUT)+sl.min.iadd[0].OUT)} {-10.}
(assert (= (+ (+ (* sc_52 0.) of_52) slbot_52) -10.))
; 
; =  {(((sc.iadd[0].OUT*1.)+of.iadd[0].OUT)+sl.max.iadd[0].OUT)} {10.}
(assert (= (+ (+ (* sc_52 1.) of_52) sltop_52) 10.))
; 
; >=  {((sc.iadd[0].A*0.)+of.iadd[0].A)} {5.}
(assert (<= (+ (* sc_50 0.) of_50) 5.))
; 
; <=  {((sc.iadd[0].A*0.)+of.iadd[0].A)} {0.}
(assert (>= (+ (* sc_50 0.) of_50) 0.))
; 
; >=  {((sc.iadd[0].B*0.)+of.iadd[0].B)} {5.}
(assert (<= (+ (* sc_51 0.) of_51) 5.))
; 
; <=  {((sc.iadd[0].B*0.)+of.iadd[0].B)} {0.}
(assert (>= (+ (* sc_51 0.) of_51) 0.))
(declare-fun slbot_52 () Real)
(declare-fun sltop_52 () Real)
; 
; =  {(((sc.iadd[0].OUT*0.)+of.iadd[0].OUT)+sl.min.iadd[0].OUT)} {-10.}
(assert (= (+ (+ (* sc_52 0.) of_52) slbot_52) -10.))
; 
; =  {(((sc.iadd[0].OUT*1.)+of.iadd[0].OUT)+sl.max.iadd[0].OUT)} {10.}
(assert (= (+ (+ (* sc_52 1.) of_52) sltop_52) 10.))
(declare-fun sc_53 () Real)
(declare-fun of_53 () Real)
(declare-fun sc_54 () Real)
(declare-fun of_54 () Real)
(declare-fun sc_55 () Real)
(declare-fun of_55 () Real)
(declare-fun sc_56 () Real)
(declare-fun of_56 () Real)
(declare-fun sc_57 () Real)
(declare-fun of_57 () Real)
; 
; =  {sc.iadd[1].A} {sc.iadd[1].B}
(assert (= sc_55 sc_56))
; 
; =  {sc.iadd[1].A} {sc.iadd[1].C} {sc.iadd[1].D}
(assert (and (= sc_55 sc_54) (= sc_55 sc_53)))
; 
; =  {sc.iadd[1].OUT} {sc.iadd[1].A}
(assert (= sc_57 sc_55))
; 
; =  {of.iadd[1].OUT} {((of.iadd[1].A+of.iadd[1].B)-of.iadd[1].C-of.iadd[1].D)}
(assert (= of_57 (- (+ of_55 of_56) (+ of_54 of_53))))
(declare-fun slbot_53 () Real)
(declare-fun sltop_53 () Real)
; 
; =  {(((sc.iadd[1].D*0.)+of.iadd[1].D)+sl.min.iadd[1].D)} {0.}
(assert (= (+ (+ (* sc_53 0.) of_53) slbot_53) 0.))
; 
; =  {(((sc.iadd[1].D*1.)+of.iadd[1].D)+sl.max.iadd[1].D)} {5.}
(assert (= (+ (+ (* sc_53 1.) of_53) sltop_53) 5.))
; 
; >=  {((sc.iadd[1].C*0.)+of.iadd[1].C)} {5.}
(assert (<= (+ (* sc_54 0.) of_54) 5.))
; 
; <=  {((sc.iadd[1].C*0.)+of.iadd[1].C)} {0.}
(assert (>= (+ (* sc_54 0.) of_54) 0.))
(declare-fun slbot_57 () Real)
(declare-fun sltop_57 () Real)
; 
; =  {(((sc.iadd[1].OUT*0.)+of.iadd[1].OUT)+sl.min.iadd[1].OUT)} {-10.}
(assert (= (+ (+ (* sc_57 0.) of_57) slbot_57) -10.))
; 
; =  {(((sc.iadd[1].OUT*1.)+of.iadd[1].OUT)+sl.max.iadd[1].OUT)} {10.}
(assert (= (+ (+ (* sc_57 1.) of_57) sltop_57) 10.))
; 
; >=  {((sc.iadd[1].A*0.15)+of.iadd[1].A)} {5.}
(assert (<= (+ (* sc_55 0.15) of_55) 5.))
; 
; <=  {((sc.iadd[1].A*0.15)+of.iadd[1].A)} {0.}
(assert (>= (+ (* sc_55 0.15) of_55) 0.))
; 
; >=  {((sc.iadd[1].B*0.)+of.iadd[1].B)} {5.}
(assert (<= (+ (* sc_56 0.) of_56) 5.))
; 
; <=  {((sc.iadd[1].B*0.)+of.iadd[1].B)} {0.}
(assert (>= (+ (* sc_56 0.) of_56) 0.))
(declare-fun slbot_57 () Real)
(declare-fun sltop_57 () Real)
; 
; =  {(((sc.iadd[1].OUT*0.)+of.iadd[1].OUT)+sl.min.iadd[1].OUT)} {-10.}
(assert (= (+ (+ (* sc_57 0.) of_57) slbot_57) -10.))
; 
; =  {(((sc.iadd[1].OUT*1.)+of.iadd[1].OUT)+sl.max.iadd[1].OUT)} {10.}
(assert (= (+ (+ (* sc_57 1.) of_57) sltop_57) 10.))
(declare-fun sc_58 () Real)
(declare-fun of_58 () Real)
(declare-fun sc_59 () Real)
(declare-fun of_59 () Real)
; 
; =  {sc.output.I[0].O} {sc.output.I[0].X}
(assert (= sc_59 sc_58))
; 
; =  {of.output.I[0].O} {of.output.I[0].X}
(assert (= of_59 of_58))
(declare-fun slbot_58 () Real)
(declare-fun sltop_58 () Real)
; 
; =  {(((sc.output.I[0].X*0.)+of.output.I[0].X)+sl.min.output.I[0].X)} {0.}
(assert (= (+ (+ (* sc_58 0.) of_58) slbot_58) 0.))
; 
; =  {(((sc.output.I[0].X*1.)+of.output.I[0].X)+sl.max.output.I[0].X)} {10.}
(assert (= (+ (+ (* sc_58 1.) of_58) sltop_58) 10.))
(declare-fun slbot_59 () Real)
(declare-fun sltop_59 () Real)
; 
; =  {(((sc.output.I[0].O*0.)+of.output.I[0].O)+sl.min.output.I[0].O)} {0.}
(assert (= (+ (+ (* sc_59 0.) of_59) slbot_59) 0.))
; 
; =  {(((sc.output.I[0].O*1.)+of.output.I[0].O)+sl.max.output.I[0].O)} {10.}
(assert (= (+ (+ (* sc_59 1.) of_59) sltop_59) 10.))
(declare-fun sc_60 () Real)
(declare-fun of_60 () Real)
(declare-fun sc_61 () Real)
(declare-fun of_61 () Real)
; 
; =  {sc.output.I[1].O} {sc.output.I[1].X}
(assert (= sc_61 sc_60))
; 
; =  {of.output.I[1].O} {of.output.I[1].X}
(assert (= of_61 of_60))
(declare-fun slbot_60 () Real)
(declare-fun sltop_60 () Real)
; 
; =  {(((sc.output.I[1].X*0.)+of.output.I[1].X)+sl.min.output.I[1].X)} {0.}
(assert (= (+ (+ (* sc_60 0.) of_60) slbot_60) 0.))
; 
; =  {(((sc.output.I[1].X*1.)+of.output.I[1].X)+sl.max.output.I[1].X)} {10.}
(assert (= (+ (+ (* sc_60 1.) of_60) sltop_60) 10.))
(declare-fun slbot_61 () Real)
(declare-fun sltop_61 () Real)
; 
; =  {(((sc.output.I[1].O*0.)+of.output.I[1].O)+sl.min.output.I[1].O)} {0.}
(assert (= (+ (+ (* sc_61 0.) of_61) slbot_61) 0.))
; 
; =  {(((sc.output.I[1].O*1.)+of.output.I[1].O)+sl.max.output.I[1].O)} {10.}
(assert (= (+ (+ (* sc_61 1.) of_61) sltop_61) 10.))
; 
; =  {sc.input.I[0].O} {sc.iadd[0].C}
(assert (= sc_7 sc_49))
; 
; =  {of.input.I[0].O} {of.iadd[0].C}
(assert (= of_7 of_49))
; 
; =  {sc.vtoi[5].Y} {sc.iadd[1].D}
(assert (= sc_30 sc_53))
; 
; =  {of.vtoi[5].Y} {of.iadd[1].D}
(assert (= of_30 of_53))
; 
; =  {sc.input.V[13].O} {sc.vtoi[5].K}
(assert (= sc_34 sc_29))
; 
; =  {of.input.V[13].O} {of.vtoi[5].K}
(assert (= of_34 of_29))
; 
; =  {sc.input.I[3].O} {sc.iadd[1].C}
(assert (= sc_9 sc_54))
; 
; =  {of.input.I[3].O} {of.iadd[1].C}
(assert (= of_9 of_54))
; 
; =  {sc.input.I[4].O} {sc.iadd[1].B}
(assert (= sc_11 sc_56))
; 
; =  {of.input.I[4].O} {of.iadd[1].B}
(assert (= of_11 of_56))
; 
; =  {sc.input.I[5].O} {sc.iadd[1].A}
(assert (= sc_13 sc_55))
; 
; =  {of.input.I[5].O} {of.iadd[1].A}
(assert (= of_13 of_55))
; 
; =  {sc.input.V[14].O} {sc.vtoi[0].K}
(assert (= sc_38 sc_26))
; 
; =  {of.input.V[14].O} {of.vtoi[0].K}
(assert (= of_38 of_26))
; 
; =  {sc.vtoi[0].Y} {sc.iadd[0].D}
(assert (= sc_27 sc_48))
; 
; =  {of.vtoi[0].Y} {of.iadd[0].D}
(assert (= of_27 of_48))
; 
; =  {sc.input.I[2].O} {sc.iadd[0].B}
(assert (= sc_5 sc_51))
; 
; =  {of.input.I[2].O} {of.iadd[0].B}
(assert (= of_5 of_51))
; 
; =  {sc.input.V[3].O} {sc.vadd[3].D}
(assert (= sc_40 sc_19))
; 
; =  {of.input.V[3].O} {of.vadd[3].D}
(assert (= of_40 of_19))
; 
; =  {sc.input.V[2].O} {sc.vadd[3].OUT2_0}
(assert (= sc_32 sc_18))
; 
; =  {of.input.V[2].O} {of.vadd[3].OUT2_0}
(assert (= of_32 of_18))
; 
; =  {sc.vadd[3].OUT2} {sc.vtoi[5].X}
(assert (= sc_24 sc_28))
; 
; =  {of.vadd[3].OUT2} {of.vtoi[5].X}
(assert (= of_24 of_28))
; 
; =  {sc.vadd[3].OUT2} {sc.output.V[0].X}
(assert (= sc_24 sc_16))
; 
; =  {of.vadd[3].OUT2} {of.output.V[0].X}
(assert (= of_24 of_16))
; 
; =  {sc.vadd[3].OUT2} {sc.vtoi[0].X}
(assert (= sc_24 sc_25))
; 
; =  {of.vadd[3].OUT2} {of.vtoi[0].X}
(assert (= of_24 of_25))
; 
; =  {sc.iadd[0].OUT} {sc.output.I[0].X}
(assert (= sc_52 sc_58))
; 
; =  {of.iadd[0].OUT} {of.output.I[0].X}
(assert (= of_52 of_58))
; 
; =  {sc.iadd[0].OUT} {sc.itov[4].X}
(assert (= sc_52 sc_45))
; 
; =  {of.iadd[0].OUT} {of.itov[4].X}
(assert (= of_52 of_45))
; 
; =  {sc.input.I[1].O} {sc.iadd[0].A}
(assert (= sc_15 sc_50))
; 
; =  {of.input.I[1].O} {of.iadd[0].A}
(assert (= of_15 of_50))
; 
; =  {sc.iadd[1].OUT} {sc.output.I[1].X}
(assert (= sc_57 sc_60))
; 
; =  {of.iadd[1].OUT} {of.output.I[1].X}
(assert (= of_57 of_60))
; 
; =  {sc.iadd[1].OUT} {sc.vgain[2].Z}
(assert (= sc_57 sc_2))
; 
; =  {of.iadd[1].OUT} {of.vgain[2].Z}
(assert (= of_57 of_2))
; 
; =  {sc.input.V[1].O} {sc.vadd[3].A}
(assert (= sc_44 sc_21))
; 
; =  {of.input.V[1].O} {of.vadd[3].A}
(assert (= of_44 of_21))
; 
; =  {sc.input.V[0].O} {sc.vgain[2].Y}
(assert (= sc_36 sc_1))
; 
; =  {of.input.V[0].O} {of.vgain[2].Y}
(assert (= of_36 of_1))
; 
; =  {sc.itov[4].Y} {sc.vadd[3].B}
(assert (= sc_47 sc_22))
; 
; =  {of.itov[4].Y} {of.vadd[3].B}
(assert (= of_47 of_22))
; 
; =  {sc.input.V[4].O} {sc.vgain[2].X}
(assert (= sc_42 sc_0))
; 
; =  {of.input.V[4].O} {of.vgain[2].X}
(assert (= of_42 of_0))
; 
; =  {sc.vgain[2].P} {sc.itov[4].K}
(assert (= sc_3 sc_46))
; 
; =  {of.vgain[2].P} {of.itov[4].K}
(assert (= of_3 of_46))
(assert (<= (* sc_17 0.001) 0.001))
; 
; =  {sc.vadd[3].OUT2} {sc.output.V[0].O}
(assert (= sc_24 sc_17))
(assert (= __minima__ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (* (ite (>= slbot_22 0) slbot_22 (- slbot_22)) 1.) (* (ite (>= sltop_23 0) sltop_23 (- sltop_23)) 1.)) (* (ite (>= sltop_52 0) sltop_52 (- sltop_52)) 1.)) (* (ite (>= slbot_16 0) slbot_16 (- slbot_16)) 1.)) (* (ite (>= sltop_27 0) sltop_27 (- sltop_27)) 1.)) (* (ite (>= slbot_60 0) slbot_60 (- slbot_60)) 1.)) (* (ite (>= slbot_3 0) slbot_3 (- slbot_3)) 1.)) (* (ite (>= slbot_46 0) slbot_46 (- slbot_46)) 1.)) (* (ite (>= slbot_53 0) slbot_53 (- slbot_53)) 1.)) (* (ite (>= sltop_28 0) sltop_28 (- sltop_28)) 1.)) (* (ite (>= slbot_59 0) slbot_59 (- slbot_59)) 1.)) (* (ite (>= slbot_2 0) slbot_2 (- slbot_2)) 1.)) (* (ite (>= slbot_61 0) slbot_61 (- slbot_61)) 1.)) (* (ite (>= slbot_17 0) slbot_17 (- slbot_17)) 1.)) (* (ite (>= sltop_58 0) sltop_58 (- sltop_58)) 1.)) (* (ite (>= sltop_22 0) sltop_22 (- sltop_22)) 1.)) (* (ite (>= slbot_25 0) slbot_25 (- slbot_25)) 1.)) (* (ite (>= sltop_2 0) sltop_2 (- sltop_2)) 1.)) (* (ite (>= sltop_24 0) sltop_24 (- sltop_24)) 1.)) (* (ite (>= slbot_24 0) slbot_24 (- slbot_24)) 1.)) (* (ite (>= slbot_28 0) slbot_28 (- slbot_28)) 1.)) (* (ite (>= sltop_57 0) sltop_57 (- sltop_57)) 1.)) (* (ite (>= slbot_57 0) slbot_57 (- slbot_57)) 1.)) (* (ite (>= sltop_16 0) sltop_16 (- sltop_16)) 1.)) (* (ite (>= slbot_52 0) slbot_52 (- slbot_52)) 1.)) (* (ite (>= slbot_45 0) slbot_45 (- slbot_45)) 1.)) (* (ite (>= slbot_48 0) slbot_48 (- slbot_48)) 1.)) (* (ite (>= sltop_60 0) sltop_60 (- sltop_60)) 1.)) (* (ite (>= slbot_30 0) slbot_30 (- slbot_30)) 1.)) (* (ite (>= sltop_47 0) sltop_47 (- sltop_47)) 1.)) (* (ite (>= sltop_30 0) sltop_30 (- sltop_30)) 1.)) (* (ite (>= sltop_45 0) sltop_45 (- sltop_45)) 1.)) (* (ite (>= sltop_53 0) sltop_53 (- sltop_53)) 1.)) (* (ite (>= sltop_48 0) sltop_48 (- sltop_48)) 1.)) (* (ite (>= sltop_46 0) sltop_46 (- sltop_46)) 1.)) (* (ite (>= sltop_61 0) sltop_61 (- sltop_61)) 1.)) (* (ite (>= slbot_23 0) slbot_23 (- slbot_23)) 1.)) (* (ite (>= sltop_25 0) sltop_25 (- sltop_25)) 1.)) (* (ite (>= sltop_17 0) sltop_17 (- sltop_17)) 1.)) (* (ite (>= sltop_3 0) sltop_3 (- sltop_3)) 1.)) (* (ite (>= slbot_47 0) slbot_47 (- slbot_47)) 1.)) (* (ite (>= slbot_58 0) slbot_58 (- slbot_58)) 1.)) (* (ite (>= slbot_27 0) slbot_27 (- slbot_27)) 1.)) (* (ite (>= sltop_59 0) sltop_59 (- sltop_59)) 1.))))
(check-sat)