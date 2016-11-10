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
; =  {sc.vgain[8].P} {((sc.vgain[8].X/sc.vgain[8].Y)*sc.vgain[8].Z*1)}
(assert (= sc_3 (* (* (/ sc_0 sc_1) sc_2) 1)))
; 
; =  {of.vgain[8].P} {0}
(assert (= of_3 0.))
(declare-fun slbot_0 () Real)
(declare-fun sltop_0 () Real)
; 
; =  {(((sc.vgain[8].X*0.)+of.vgain[8].X)+sl.min.vgain[8].X)} {0.0001}
(assert (= (+ (+ (* sc_0 0.) of_0) slbot_0) 0.0001))
; 
; =  {(((sc.vgain[8].X*1.)+of.vgain[8].X)+sl.max.vgain[8].X)} {3300.}
(assert (= (+ (+ (* sc_0 1.) of_0) sltop_0) 3300.))
; 
; >=  {((sc.vgain[8].Y*0.0396322130628)+of.vgain[8].Y)} {3300.}
(assert (<= (+ (* sc_1 0.0396322130628) of_1) 3300.))
; 
; <=  {((sc.vgain[8].Y*0.0396322130628)+of.vgain[8].Y)} {1.}
(assert (>= (+ (* sc_1 0.0396322130628) of_1) 1.))
(declare-fun slbot_3 () Real)
(declare-fun sltop_3 () Real)
; 
; =  {(((sc.vgain[8].P*0.)+of.vgain[8].P)+sl.min.vgain[8].P)} {1.51515151515e-12}
(assert (= (+ (+ (* sc_3 0.) of_3) slbot_3) 1.51515151515e-12))
; 
; =  {(((sc.vgain[8].P*12.616)+of.vgain[8].P)+sl.max.vgain[8].P)} {5445000.}
(assert (= (+ (+ (* sc_3 12.616) of_3) sltop_3) 5445000.))
; 
; >=  {((sc.vgain[8].Z*1.)+of.vgain[8].Z)} {3300.}
(assert (<= (+ (* sc_2 1.) of_2) 3300.))
; 
; <=  {((sc.vgain[8].Z*1.)+of.vgain[8].Z)} {0.0001}
(assert (>= (+ (* sc_2 1.) of_2) 0.0001))
(declare-fun sc_4 () Real)
(declare-fun of_4 () Real)
(declare-fun sc_5 () Real)
(declare-fun of_5 () Real)
(declare-fun sc_6 () Real)
(declare-fun of_6 () Real)
(declare-fun sc_7 () Real)
(declare-fun of_7 () Real)
(assert (= of_4 0))
(assert (= of_5 0))
(assert (= 0. 0))
(assert (= of_6 0))
(assert (= 0. 0))
; 
; =  {sc.vgain[0].P} {((sc.vgain[0].X/sc.vgain[0].Y)*sc.vgain[0].Z*1)}
(assert (= sc_7 (* (* (/ sc_4 sc_5) sc_6) 1)))
; 
; =  {of.vgain[0].P} {0}
(assert (= of_7 0.))
; 
; >=  {((sc.vgain[0].X*1.)+of.vgain[0].X)} {3300.}
(assert (<= (+ (* sc_4 1.) of_4) 3300.))
; 
; <=  {((sc.vgain[0].X*1.)+of.vgain[0].X)} {0.0001}
(assert (>= (+ (* sc_4 1.) of_4) 0.0001))
; 
; >=  {((sc.vgain[0].Y*0.595238095238)+of.vgain[0].Y)} {3300.}
(assert (<= (+ (* sc_5 0.595238095238) of_5) 3300.))
; 
; <=  {((sc.vgain[0].Y*0.595238095238)+of.vgain[0].Y)} {1.}
(assert (>= (+ (* sc_5 0.595238095238) of_5) 1.))
(declare-fun slbot_7 () Real)
(declare-fun sltop_7 () Real)
; 
; =  {(((sc.vgain[0].P*0.)+of.vgain[0].P)+sl.min.vgain[0].P)} {1.51515151515e-12}
(assert (= (+ (+ (* sc_7 0.) of_7) slbot_7) 1.51515151515e-12))
; 
; =  {(((sc.vgain[0].P*0.84)+of.vgain[0].P)+sl.max.vgain[0].P)} {5445000.}
(assert (= (+ (+ (* sc_7 0.84) of_7) sltop_7) 5445000.))
(declare-fun slbot_6 () Real)
(declare-fun sltop_6 () Real)
; 
; =  {(((sc.vgain[0].Z*0.)+of.vgain[0].Z)+sl.min.vgain[0].Z)} {0.0001}
(assert (= (+ (+ (* sc_6 0.) of_6) slbot_6) 0.0001))
; 
; =  {(((sc.vgain[0].Z*1.)+of.vgain[0].Z)+sl.max.vgain[0].Z)} {3300.}
(assert (= (+ (+ (* sc_6 1.) of_6) sltop_6) 3300.))
(declare-fun sc_8 () Real)
(declare-fun of_8 () Real)
(declare-fun sc_9 () Real)
(declare-fun of_9 () Real)
(declare-fun sc_10 () Real)
(declare-fun of_10 () Real)
(declare-fun sc_11 () Real)
(declare-fun of_11 () Real)
(assert (= of_8 0))
(assert (= of_9 0))
(assert (= 0. 0))
(assert (= of_10 0))
(assert (= 0. 0))
; 
; =  {sc.vgain[5].P} {((sc.vgain[5].X/sc.vgain[5].Y)*sc.vgain[5].Z*1)}
(assert (= sc_11 (* (* (/ sc_8 sc_9) sc_10) 1)))
; 
; =  {of.vgain[5].P} {0}
(assert (= of_11 0.))
; 
; >=  {((sc.vgain[5].X*1.)+of.vgain[5].X)} {3300.}
(assert (<= (+ (* sc_8 1.) of_8) 3300.))
; 
; <=  {((sc.vgain[5].X*1.)+of.vgain[5].X)} {0.0001}
(assert (>= (+ (* sc_8 1.) of_8) 0.0001))
; 
; >=  {((sc.vgain[5].Y*0.0396322130628)+of.vgain[5].Y)} {3300.}
(assert (<= (+ (* sc_9 0.0396322130628) of_9) 3300.))
; 
; <=  {((sc.vgain[5].Y*0.0396322130628)+of.vgain[5].Y)} {1.}
(assert (>= (+ (* sc_9 0.0396322130628) of_9) 1.))
(declare-fun slbot_11 () Real)
(declare-fun sltop_11 () Real)
; 
; =  {(((sc.vgain[5].P*0.)+of.vgain[5].P)+sl.min.vgain[5].P)} {1.51515151515e-12}
(assert (= (+ (+ (* sc_11 0.) of_11) slbot_11) 1.51515151515e-12))
; 
; =  {(((sc.vgain[5].P*12.616)+of.vgain[5].P)+sl.max.vgain[5].P)} {5445000.}
(assert (= (+ (+ (* sc_11 12.616) of_11) sltop_11) 5445000.))
(declare-fun slbot_10 () Real)
(declare-fun sltop_10 () Real)
; 
; =  {(((sc.vgain[5].Z*0.)+of.vgain[5].Z)+sl.min.vgain[5].Z)} {0.0001}
(assert (= (+ (+ (* sc_10 0.) of_10) slbot_10) 0.0001))
; 
; =  {(((sc.vgain[5].Z*1.)+of.vgain[5].Z)+sl.max.vgain[5].Z)} {3300.}
(assert (= (+ (+ (* sc_10 1.) of_10) sltop_10) 3300.))
(declare-fun sc_12 () Real)
(declare-fun of_12 () Real)
(declare-fun sc_13 () Real)
(declare-fun of_13 () Real)
; 
; =  {sc.input.I[0].O} {sc.input.I[0].X}
(assert (= sc_13 sc_12))
; 
; =  {of.input.I[0].O} {of.input.I[0].X}
(assert (= of_13 of_12))
; 
; >=  {((sc.input.I[0].X*10.1)+of.input.I[0].X)} {10.}
(assert (<= (+ (* sc_12 10.1) of_12) 10.))
; 
; <=  {((sc.input.I[0].X*10.1)+of.input.I[0].X)} {0.}
(assert (>= (+ (* sc_12 10.1) of_12) 0.))
; 
; >=  {((sc.input.I[0].O*10.1)+of.input.I[0].O)} {10.}
(assert (<= (+ (* sc_13 10.1) of_13) 10.))
; 
; <=  {((sc.input.I[0].O*10.1)+of.input.I[0].O)} {0.}
(assert (>= (+ (* sc_13 10.1) of_13) 0.))
(declare-fun sc_14 () Real)
(declare-fun of_14 () Real)
(declare-fun sc_15 () Real)
(declare-fun of_15 () Real)
; 
; =  {sc.output.V[0].O} {sc.output.V[0].X}
(assert (= sc_15 sc_14))
; 
; =  {of.output.V[0].O} {of.output.V[0].X}
(assert (= of_15 of_14))
(declare-fun slbot_14 () Real)
(declare-fun sltop_14 () Real)
; 
; =  {(((sc.output.V[0].X*0.)+of.output.V[0].X)+sl.min.output.V[0].X)} {0.0001}
(assert (= (+ (+ (* sc_14 0.) of_14) slbot_14) 0.0001))
; 
; =  {(((sc.output.V[0].X*1.)+of.output.V[0].X)+sl.max.output.V[0].X)} {3300.}
(assert (= (+ (+ (* sc_14 1.) of_14) sltop_14) 3300.))
(declare-fun slbot_15 () Real)
(declare-fun sltop_15 () Real)
; 
; =  {(((sc.output.V[0].O*0.)+of.output.V[0].O)+sl.min.output.V[0].O)} {0.0001}
(assert (= (+ (+ (* sc_15 0.) of_15) slbot_15) 0.0001))
; 
; =  {(((sc.output.V[0].O*1.)+of.output.V[0].O)+sl.max.output.V[0].O)} {3300.}
(assert (= (+ (+ (* sc_15 1.) of_15) sltop_15) 3300.))
(declare-fun sc_16 () Real)
(declare-fun of_16 () Real)
(declare-fun sc_17 () Real)
(declare-fun of_17 () Real)
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
(assert (= 0. 0))
(assert (= of_17 0))
(assert (= 0. 0))
(assert (= of_20 0))
; 
; =  {sc.vadd[9].A} {(1*sc.vadd[9].B)}
(assert (= sc_19 (* 1 sc_20)))
; 
; =  {sc.vadd[9].A} {(1*sc.vadd[9].C)} {(1*sc.vadd[9].D)}
(assert (and (= sc_19 (* 1 sc_18)) (= sc_19 (* 1 sc_17))))
(assert (= (- (+ of_19 0) (+ 0 0)) 0))
(assert (= 0. 0))
; 
; =  {sc.vadd[9].OUT} {(sc.vadd[9].A*1)}
(assert (= sc_21 (* sc_19 1)))
; 
; =  {of.vadd[9].OUT} {0}
(assert (= of_21 0.))
(assert (= 0. 0))
(assert (= of_17 0))
(assert (= 0. 0))
(assert (= 0. 0))
(assert (= of_20 0))
; 
; =  {sc.vadd[9].A} {(1*sc.vadd[9].B)}
(assert (= sc_19 (* 1 sc_20)))
; 
; =  {sc.vadd[9].A} {(1*sc.vadd[9].C)} {(1*sc.vadd[9].D*1)}
(assert (and (= sc_19 (* 1 sc_18)) (= sc_19 (* (* 1 sc_17) 1))))
(assert (= (- (+ of_19 0) (+ 0 0)) 0))
(assert (= 0. 0))
; 
; =  {sc.vadd[9].OUT2} {(sc.vadd[9].A*1)}
(assert (= sc_22 (* sc_19 1)))
(assert (= of_22 0))
(assert (= 0. 0))
; 
; =  {sc.vadd[9].OUT2_0} {(sc.vadd[9].A*1)}
(assert (= sc_16 (* sc_19 1)))
; 
; =  {of.vadd[9].OUT2_0} {0}
(assert (= of_16 0.))
; 
; >=  {((sc.vadd[9].OUT2_0*0.)+of.vadd[9].OUT2_0)} {3300.}
(assert (<= (+ (* sc_16 0.) of_16) 3300.))
; 
; <=  {((sc.vadd[9].OUT2_0*0.)+of.vadd[9].OUT2_0)} {0.}
(assert (>= (+ (* sc_16 0.) of_16) 0.))
; 
; >=  {((sc.vadd[9].D*10.1)+of.vadd[9].D)} {3300.}
(assert (<= (+ (* sc_17 10.1) of_17) 3300.))
; 
; <=  {((sc.vadd[9].D*10.1)+of.vadd[9].D)} {0.0001}
(assert (>= (+ (* sc_17 10.1) of_17) 0.0001))
; 
; >=  {((sc.vadd[9].A*0.)+of.vadd[9].A)} {3300.}
(assert (<= (+ (* sc_19 0.) of_19) 3300.))
; 
; <=  {((sc.vadd[9].A*0.)+of.vadd[9].A)} {0.0001}
(assert (>= (+ (* sc_19 0.) of_19) 0.0001))
(declare-fun slbot_22 () Real)
(declare-fun sltop_22 () Real)
; 
; =  {(((sc.vadd[9].OUT2*0.)+of.vadd[9].OUT2)+sl.min.vadd[9].OUT2)} {0.}
(assert (= (+ (+ (* sc_22 0.) of_22) slbot_22) 0.))
; 
; =  {(((sc.vadd[9].OUT2*1.)+of.vadd[9].OUT2)+sl.max.vadd[9].OUT2)} {5.}
(assert (= (+ (+ (* sc_22 1.) of_22) sltop_22) 5.))
(declare-fun slbot_20 () Real)
(declare-fun sltop_20 () Real)
; 
; =  {(((sc.vadd[9].B*0.)+of.vadd[9].B)+sl.min.vadd[9].B)} {0.0001}
(assert (= (+ (+ (* sc_20 0.) of_20) slbot_20) 0.0001))
; 
; =  {(((sc.vadd[9].B*12.616)+of.vadd[9].B)+sl.max.vadd[9].B)} {3300.}
(assert (= (+ (+ (* sc_20 12.616) of_20) sltop_20) 3300.))
(declare-fun slbot_21 () Real)
(declare-fun sltop_21 () Real)
; 
; =  {(((sc.vadd[9].OUT*0.)+of.vadd[9].OUT)+sl.min.vadd[9].OUT)} {-824.99995}
(assert (= (+ (+ (* sc_21 0.) of_21) slbot_21) -824.99995))
; 
; =  {(((sc.vadd[9].OUT*12.616)+of.vadd[9].OUT)+sl.max.vadd[9].OUT)} {1649.999975}
(assert (= (+ (+ (* sc_21 12.616) of_21) sltop_21) 1649.999975))
(declare-fun slbot_22 () Real)
(declare-fun sltop_22 () Real)
; 
; =  {(((sc.vadd[9].OUT2*0.)+of.vadd[9].OUT2)+sl.min.vadd[9].OUT2)} {0.}
(assert (= (+ (+ (* sc_22 0.) of_22) slbot_22) 0.))
; 
; =  {(((sc.vadd[9].OUT2*1.)+of.vadd[9].OUT2)+sl.max.vadd[9].OUT2)} {5.}
(assert (= (+ (+ (* sc_22 1.) of_22) sltop_22) 5.))
(declare-fun sc_23 () Real)
(declare-fun of_23 () Real)
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
(assert (= 0. 0))
(assert (= of_24 0))
(assert (= 0. 0))
(assert (= of_27 0))
; 
; =  {sc.vadd[6].A} {(1*sc.vadd[6].B)}
(assert (= sc_26 (* 1 sc_27)))
; 
; =  {sc.vadd[6].A} {(1*sc.vadd[6].C)} {(1*sc.vadd[6].D)}
(assert (and (= sc_26 (* 1 sc_25)) (= sc_26 (* 1 sc_24))))
(assert (= (- (+ of_26 0) (+ 0 0)) 0))
(assert (= 0. 0))
; 
; =  {sc.vadd[6].OUT} {(sc.vadd[6].A*1)}
(assert (= sc_28 (* sc_26 1)))
; 
; =  {of.vadd[6].OUT} {0}
(assert (= of_28 0.))
(assert (= 0. 0))
(assert (= of_24 0))
(assert (= 0. 0))
(assert (= 0. 0))
(assert (= of_27 0))
; 
; =  {sc.vadd[6].A} {(1*sc.vadd[6].B)}
(assert (= sc_26 (* 1 sc_27)))
; 
; =  {sc.vadd[6].A} {(1*sc.vadd[6].C)} {(1*sc.vadd[6].D*1)}
(assert (and (= sc_26 (* 1 sc_25)) (= sc_26 (* (* 1 sc_24) 1))))
(assert (= (- (+ of_26 0) (+ 0 0)) 0))
(assert (= 0. 0))
; 
; =  {sc.vadd[6].OUT2} {(sc.vadd[6].A*1)}
(assert (= sc_29 (* sc_26 1)))
(assert (= of_29 0))
(assert (= 0. 0))
; 
; =  {sc.vadd[6].OUT2_0} {(sc.vadd[6].A*1)}
(assert (= sc_23 (* sc_26 1)))
; 
; =  {of.vadd[6].OUT2_0} {0}
(assert (= of_23 0.))
; 
; >=  {((sc.vadd[6].OUT2_0*0.256)+of.vadd[6].OUT2_0)} {3300.}
(assert (<= (+ (* sc_23 0.256) of_23) 3300.))
; 
; <=  {((sc.vadd[6].OUT2_0*0.256)+of.vadd[6].OUT2_0)} {0.}
(assert (>= (+ (* sc_23 0.256) of_23) 0.))
(declare-fun slbot_24 () Real)
(declare-fun sltop_24 () Real)
; 
; =  {(((sc.vadd[6].D*0.)+of.vadd[6].D)+sl.min.vadd[6].D)} {0.0001}
(assert (= (+ (+ (* sc_24 0.) of_24) slbot_24) 0.0001))
; 
; =  {(((sc.vadd[6].D*12.616)+of.vadd[6].D)+sl.max.vadd[6].D)} {3300.}
(assert (= (+ (+ (* sc_24 12.616) of_24) sltop_24) 3300.))
; 
; >=  {((sc.vadd[6].A*0.)+of.vadd[6].A)} {3300.}
(assert (<= (+ (* sc_26 0.) of_26) 3300.))
; 
; <=  {((sc.vadd[6].A*0.)+of.vadd[6].A)} {0.0001}
(assert (>= (+ (* sc_26 0.) of_26) 0.0001))
(declare-fun slbot_29 () Real)
(declare-fun sltop_29 () Real)
; 
; =  {(((sc.vadd[6].OUT2*0.)+of.vadd[6].OUT2)+sl.min.vadd[6].OUT2)} {0.}
(assert (= (+ (+ (* sc_29 0.) of_29) slbot_29) 0.))
; 
; =  {(((sc.vadd[6].OUT2*1.)+of.vadd[6].OUT2)+sl.max.vadd[6].OUT2)} {5.}
(assert (= (+ (+ (* sc_29 1.) of_29) sltop_29) 5.))
(declare-fun slbot_27 () Real)
(declare-fun sltop_27 () Real)
; 
; =  {(((sc.vadd[6].B*0.)+of.vadd[6].B)+sl.min.vadd[6].B)} {0.0001}
(assert (= (+ (+ (* sc_27 0.) of_27) slbot_27) 0.0001))
; 
; =  {(((sc.vadd[6].B*9.26)+of.vadd[6].B)+sl.max.vadd[6].B)} {3300.}
(assert (= (+ (+ (* sc_27 9.26) of_27) sltop_27) 3300.))
(declare-fun slbot_28 () Real)
(declare-fun sltop_28 () Real)
; 
; =  {(((sc.vadd[6].OUT*0.)+of.vadd[6].OUT)+sl.min.vadd[6].OUT)} {-824.99995}
(assert (= (+ (+ (* sc_28 0.) of_28) slbot_28) -824.99995))
; 
; =  {(((sc.vadd[6].OUT*9.26)+of.vadd[6].OUT)+sl.max.vadd[6].OUT)} {1649.999975}
(assert (= (+ (+ (* sc_28 9.26) of_28) sltop_28) 1649.999975))
(declare-fun slbot_29 () Real)
(declare-fun sltop_29 () Real)
; 
; =  {(((sc.vadd[6].OUT2*0.)+of.vadd[6].OUT2)+sl.min.vadd[6].OUT2)} {0.}
(assert (= (+ (+ (* sc_29 0.) of_29) slbot_29) 0.))
; 
; =  {(((sc.vadd[6].OUT2*1.)+of.vadd[6].OUT2)+sl.max.vadd[6].OUT2)} {5.}
(assert (= (+ (+ (* sc_29 1.) of_29) sltop_29) 5.))
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
(declare-fun sc_35 () Real)
(declare-fun of_35 () Real)
(declare-fun sc_36 () Real)
(declare-fun of_36 () Real)
(assert (= 0. 0))
(assert (= of_31 0))
(assert (= 0. 0))
(assert (= of_34 0))
; 
; =  {sc.vadd[3].A} {(1*sc.vadd[3].B)}
(assert (= sc_33 (* 1 sc_34)))
; 
; =  {sc.vadd[3].A} {(1*sc.vadd[3].C)} {(1*sc.vadd[3].D)}
(assert (and (= sc_33 (* 1 sc_32)) (= sc_33 (* 1 sc_31))))
(assert (= (- (+ of_33 0) (+ 0 0)) 0))
(assert (= 0. 0))
; 
; =  {sc.vadd[3].OUT} {(sc.vadd[3].A*1)}
(assert (= sc_35 (* sc_33 1)))
; 
; =  {of.vadd[3].OUT} {0}
(assert (= of_35 0.))
(assert (= 0. 0))
(assert (= of_31 0))
(assert (= 0. 0))
(assert (= 0. 0))
(assert (= of_34 0))
; 
; =  {sc.vadd[3].A} {(1*sc.vadd[3].B)}
(assert (= sc_33 (* 1 sc_34)))
; 
; =  {sc.vadd[3].A} {(1*sc.vadd[3].C)} {(1*sc.vadd[3].D*1)}
(assert (and (= sc_33 (* 1 sc_32)) (= sc_33 (* (* 1 sc_31) 1))))
(assert (= (- (+ of_33 0) (+ 0 0)) 0))
(assert (= 0. 0))
; 
; =  {sc.vadd[3].OUT2} {(sc.vadd[3].A*1)}
(assert (= sc_36 (* sc_33 1)))
(assert (= of_36 0))
(assert (= 0. 0))
; 
; =  {sc.vadd[3].OUT2_0} {(sc.vadd[3].A*1)}
(assert (= sc_30 (* sc_33 1)))
; 
; =  {of.vadd[3].OUT2_0} {0}
(assert (= of_30 0.))
; 
; >=  {((sc.vadd[3].OUT2_0*0.124)+of.vadd[3].OUT2_0)} {3300.}
(assert (<= (+ (* sc_30 0.124) of_30) 3300.))
; 
; <=  {((sc.vadd[3].OUT2_0*0.124)+of.vadd[3].OUT2_0)} {0.}
(assert (>= (+ (* sc_30 0.124) of_30) 0.))
(declare-fun slbot_31 () Real)
(declare-fun sltop_31 () Real)
; 
; =  {(((sc.vadd[3].D*0.)+of.vadd[3].D)+sl.min.vadd[3].D)} {0.0001}
(assert (= (+ (+ (* sc_31 0.) of_31) slbot_31) 0.0001))
; 
; =  {(((sc.vadd[3].D*12.616)+of.vadd[3].D)+sl.max.vadd[3].D)} {3300.}
(assert (= (+ (+ (* sc_31 12.616) of_31) sltop_31) 3300.))
; 
; >=  {((sc.vadd[3].A*0.)+of.vadd[3].A)} {3300.}
(assert (<= (+ (* sc_33 0.) of_33) 3300.))
; 
; <=  {((sc.vadd[3].A*0.)+of.vadd[3].A)} {0.0001}
(assert (>= (+ (* sc_33 0.) of_33) 0.0001))
(declare-fun slbot_36 () Real)
(declare-fun sltop_36 () Real)
; 
; =  {(((sc.vadd[3].OUT2*0.)+of.vadd[3].OUT2)+sl.min.vadd[3].OUT2)} {0.}
(assert (= (+ (+ (* sc_36 0.) of_36) slbot_36) 0.))
; 
; =  {(((sc.vadd[3].OUT2*1.)+of.vadd[3].OUT2)+sl.max.vadd[3].OUT2)} {5.}
(assert (= (+ (+ (* sc_36 1.) of_36) sltop_36) 5.))
(declare-fun slbot_34 () Real)
(declare-fun sltop_34 () Real)
; 
; =  {(((sc.vadd[3].B*0.)+of.vadd[3].B)+sl.min.vadd[3].B)} {0.0001}
(assert (= (+ (+ (* sc_34 0.) of_34) slbot_34) 0.0001))
; 
; =  {(((sc.vadd[3].B*10.1)+of.vadd[3].B)+sl.max.vadd[3].B)} {3300.}
(assert (= (+ (+ (* sc_34 10.1) of_34) sltop_34) 3300.))
(declare-fun slbot_35 () Real)
(declare-fun sltop_35 () Real)
; 
; =  {(((sc.vadd[3].OUT*0.)+of.vadd[3].OUT)+sl.min.vadd[3].OUT)} {-824.99995}
(assert (= (+ (+ (* sc_35 0.) of_35) slbot_35) -824.99995))
; 
; =  {(((sc.vadd[3].OUT*12.616)+of.vadd[3].OUT)+sl.max.vadd[3].OUT)} {1649.999975}
(assert (= (+ (+ (* sc_35 12.616) of_35) sltop_35) 1649.999975))
(declare-fun slbot_36 () Real)
(declare-fun sltop_36 () Real)
; 
; =  {(((sc.vadd[3].OUT2*0.)+of.vadd[3].OUT2)+sl.min.vadd[3].OUT2)} {0.}
(assert (= (+ (+ (* sc_36 0.) of_36) slbot_36) 0.))
; 
; =  {(((sc.vadd[3].OUT2*1.)+of.vadd[3].OUT2)+sl.max.vadd[3].OUT2)} {5.}
(assert (= (+ (+ (* sc_36 1.) of_36) sltop_36) 5.))
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
(declare-fun sc_43 () Real)
(declare-fun of_43 () Real)
(assert (= 0. 0))
(assert (= of_41 0))
; 
; =  {sc.vadd[1].A} {(1*sc.vadd[1].B)}
(assert (= sc_40 (* 1 sc_41)))
; 
; =  {sc.vadd[1].A} {(1*sc.vadd[1].C)} {(1*sc.vadd[1].D)}
(assert (and (= sc_40 (* 1 sc_39)) (= sc_40 (* 1 sc_38))))
(assert (= (- (+ of_40 0) (+ 0 0)) 0))
(assert (= 0. 0))
; 
; =  {sc.vadd[1].OUT} {(sc.vadd[1].A*1)}
(assert (= sc_42 (* sc_40 1)))
; 
; =  {of.vadd[1].OUT} {0}
(assert (= of_42 0.))
(assert (= 0. 0))
(assert (= of_41 0))
; 
; =  {sc.vadd[1].A} {(1*sc.vadd[1].B)}
(assert (= sc_40 (* 1 sc_41)))
; 
; =  {sc.vadd[1].A} {(1*sc.vadd[1].C)} {(1*sc.vadd[1].D*1)}
(assert (and (= sc_40 (* 1 sc_39)) (= sc_40 (* (* 1 sc_38) 1))))
(assert (= (- (+ of_40 0) (+ 0 0)) 0))
(assert (= 0. 0))
; 
; =  {sc.vadd[1].OUT2} {(sc.vadd[1].A*1)}
(assert (= sc_43 (* sc_40 1)))
(assert (= of_43 0))
(assert (= 0. 0))
; 
; =  {sc.vadd[1].OUT2_0} {(sc.vadd[1].A*1)}
(assert (= sc_37 (* sc_40 1)))
; 
; =  {of.vadd[1].OUT2_0} {0}
(assert (= of_37 0.))
; 
; >=  {((sc.vadd[1].OUT2_0*0.)+of.vadd[1].OUT2_0)} {3300.}
(assert (<= (+ (* sc_37 0.) of_37) 3300.))
; 
; <=  {((sc.vadd[1].OUT2_0*0.)+of.vadd[1].OUT2_0)} {0.}
(assert (>= (+ (* sc_37 0.) of_37) 0.))
; 
; >=  {((sc.vadd[1].A*0.)+of.vadd[1].A)} {3300.}
(assert (<= (+ (* sc_40 0.) of_40) 3300.))
; 
; <=  {((sc.vadd[1].A*0.)+of.vadd[1].A)} {0.0001}
(assert (>= (+ (* sc_40 0.) of_40) 0.0001))
(declare-fun slbot_43 () Real)
(declare-fun sltop_43 () Real)
; 
; =  {(((sc.vadd[1].OUT2*0.)+of.vadd[1].OUT2)+sl.min.vadd[1].OUT2)} {0.}
(assert (= (+ (+ (* sc_43 0.) of_43) slbot_43) 0.))
; 
; =  {(((sc.vadd[1].OUT2*1.)+of.vadd[1].OUT2)+sl.max.vadd[1].OUT2)} {5.}
(assert (= (+ (+ (* sc_43 1.) of_43) sltop_43) 5.))
(declare-fun slbot_41 () Real)
(declare-fun sltop_41 () Real)
; 
; =  {(((sc.vadd[1].B*0.)+of.vadd[1].B)+sl.min.vadd[1].B)} {0.0001}
(assert (= (+ (+ (* sc_41 0.) of_41) slbot_41) 0.0001))
; 
; =  {(((sc.vadd[1].B*0.84)+of.vadd[1].B)+sl.max.vadd[1].B)} {3300.}
(assert (= (+ (+ (* sc_41 0.84) of_41) sltop_41) 3300.))
(declare-fun slbot_42 () Real)
(declare-fun sltop_42 () Real)
; 
; =  {(((sc.vadd[1].OUT*0.)+of.vadd[1].OUT)+sl.min.vadd[1].OUT)} {5e-05}
(assert (= (+ (+ (* sc_42 0.) of_42) slbot_42) 5e-05))
; 
; =  {(((sc.vadd[1].OUT*0.84)+of.vadd[1].OUT)+sl.max.vadd[1].OUT)} {1650.}
(assert (= (+ (+ (* sc_42 0.84) of_42) sltop_42) 1650.))
(declare-fun slbot_43 () Real)
(declare-fun sltop_43 () Real)
; 
; =  {(((sc.vadd[1].OUT2*0.)+of.vadd[1].OUT2)+sl.min.vadd[1].OUT2)} {0.}
(assert (= (+ (+ (* sc_43 0.) of_43) slbot_43) 0.))
; 
; =  {(((sc.vadd[1].OUT2*1.)+of.vadd[1].OUT2)+sl.max.vadd[1].OUT2)} {5.}
(assert (= (+ (+ (* sc_43 1.) of_43) sltop_43) 5.))
(declare-fun sc_44 () Real)
(declare-fun of_44 () Real)
(declare-fun sc_45 () Real)
(declare-fun of_45 () Real)
; 
; =  {sc.input.V[2].O} {sc.input.V[2].X}
(assert (= sc_45 sc_44))
; 
; =  {of.input.V[2].O} {of.input.V[2].X}
(assert (= of_45 of_44))
; 
; >=  {((sc.input.V[2].X*0.)+of.input.V[2].X)} {5.}
(assert (<= (+ (* sc_44 0.) of_44) 5.))
; 
; <=  {((sc.input.V[2].X*0.)+of.input.V[2].X)} {0.}
(assert (>= (+ (* sc_44 0.) of_44) 0.))
; 
; >=  {((sc.input.V[2].O*0.)+of.input.V[2].O)} {5.}
(assert (<= (+ (* sc_45 0.) of_45) 5.))
; 
; <=  {((sc.input.V[2].O*0.)+of.input.V[2].O)} {0.}
(assert (>= (+ (* sc_45 0.) of_45) 0.))
(declare-fun sc_46 () Real)
(declare-fun of_46 () Real)
(declare-fun sc_47 () Real)
(declare-fun of_47 () Real)
; 
; =  {sc.input.V[8].O} {sc.input.V[8].X}
(assert (= sc_47 sc_46))
; 
; =  {of.input.V[8].O} {of.input.V[8].X}
(assert (= of_47 of_46))
; 
; >=  {((sc.input.V[8].X*12.616)+of.input.V[8].X)} {5.}
(assert (<= (+ (* sc_46 12.616) of_46) 5.))
; 
; <=  {((sc.input.V[8].X*12.616)+of.input.V[8].X)} {0.}
(assert (>= (+ (* sc_46 12.616) of_46) 0.))
; 
; >=  {((sc.input.V[8].O*12.616)+of.input.V[8].O)} {5.}
(assert (<= (+ (* sc_47 12.616) of_47) 5.))
; 
; <=  {((sc.input.V[8].O*12.616)+of.input.V[8].O)} {0.}
(assert (>= (+ (* sc_47 12.616) of_47) 0.))
(declare-fun sc_48 () Real)
(declare-fun of_48 () Real)
(declare-fun sc_49 () Real)
(declare-fun of_49 () Real)
; 
; =  {sc.input.V[7].O} {sc.input.V[7].X}
(assert (= sc_49 sc_48))
; 
; =  {of.input.V[7].O} {of.input.V[7].X}
(assert (= of_49 of_48))
; 
; >=  {((sc.input.V[7].X*0.)+of.input.V[7].X)} {5.}
(assert (<= (+ (* sc_48 0.) of_48) 5.))
; 
; <=  {((sc.input.V[7].X*0.)+of.input.V[7].X)} {0.}
(assert (>= (+ (* sc_48 0.) of_48) 0.))
; 
; >=  {((sc.input.V[7].O*0.)+of.input.V[7].O)} {5.}
(assert (<= (+ (* sc_49 0.) of_49) 5.))
; 
; <=  {((sc.input.V[7].O*0.)+of.input.V[7].O)} {0.}
(assert (>= (+ (* sc_49 0.) of_49) 0.))
(declare-fun sc_50 () Real)
(declare-fun of_50 () Real)
(declare-fun sc_51 () Real)
(declare-fun of_51 () Real)
; 
; =  {sc.input.V[13].O} {sc.input.V[13].X}
(assert (= sc_51 sc_50))
; 
; =  {of.input.V[13].O} {of.input.V[13].X}
(assert (= of_51 of_50))
; 
; >=  {((sc.input.V[13].X*1.)+of.input.V[13].X)} {5.}
(assert (<= (+ (* sc_50 1.) of_50) 5.))
; 
; <=  {((sc.input.V[13].X*1.)+of.input.V[13].X)} {0.}
(assert (>= (+ (* sc_50 1.) of_50) 0.))
; 
; >=  {((sc.input.V[13].O*1.)+of.input.V[13].O)} {5.}
(assert (<= (+ (* sc_51 1.) of_51) 5.))
; 
; <=  {((sc.input.V[13].O*1.)+of.input.V[13].O)} {0.}
(assert (>= (+ (* sc_51 1.) of_51) 0.))
(declare-fun sc_52 () Real)
(declare-fun of_52 () Real)
(declare-fun sc_53 () Real)
(declare-fun of_53 () Real)
; 
; =  {sc.input.V[12].O} {sc.input.V[12].X}
(assert (= sc_53 sc_52))
; 
; =  {of.input.V[12].O} {of.input.V[12].X}
(assert (= of_53 of_52))
; 
; >=  {((sc.input.V[12].X*1.)+of.input.V[12].X)} {5.}
(assert (<= (+ (* sc_52 1.) of_52) 5.))
; 
; <=  {((sc.input.V[12].X*1.)+of.input.V[12].X)} {0.}
(assert (>= (+ (* sc_52 1.) of_52) 0.))
; 
; >=  {((sc.input.V[12].O*1.)+of.input.V[12].O)} {5.}
(assert (<= (+ (* sc_53 1.) of_53) 5.))
; 
; <=  {((sc.input.V[12].O*1.)+of.input.V[12].O)} {0.}
(assert (>= (+ (* sc_53 1.) of_53) 0.))
(declare-fun sc_54 () Real)
(declare-fun of_54 () Real)
(declare-fun sc_55 () Real)
(declare-fun of_55 () Real)
; 
; =  {sc.input.V[9].O} {sc.input.V[9].X}
(assert (= sc_55 sc_54))
; 
; =  {of.input.V[9].O} {of.input.V[9].X}
(assert (= of_55 of_54))
; 
; >=  {((sc.input.V[9].X*0.256)+of.input.V[9].X)} {5.}
(assert (<= (+ (* sc_54 0.256) of_54) 5.))
; 
; <=  {((sc.input.V[9].X*0.256)+of.input.V[9].X)} {0.}
(assert (>= (+ (* sc_54 0.256) of_54) 0.))
; 
; >=  {((sc.input.V[9].O*0.256)+of.input.V[9].O)} {5.}
(assert (<= (+ (* sc_55 0.256) of_55) 5.))
; 
; <=  {((sc.input.V[9].O*0.256)+of.input.V[9].O)} {0.}
(assert (>= (+ (* sc_55 0.256) of_55) 0.))
(declare-fun sc_56 () Real)
(declare-fun of_56 () Real)
(declare-fun sc_57 () Real)
(declare-fun of_57 () Real)
; 
; =  {sc.input.V[0].O} {sc.input.V[0].X}
(assert (= sc_57 sc_56))
; 
; =  {of.input.V[0].O} {of.input.V[0].X}
(assert (= of_57 of_56))
; 
; >=  {((sc.input.V[0].X*10.1)+of.input.V[0].X)} {5.}
(assert (<= (+ (* sc_56 10.1) of_56) 5.))
; 
; <=  {((sc.input.V[0].X*10.1)+of.input.V[0].X)} {0.}
(assert (>= (+ (* sc_56 10.1) of_56) 0.))
; 
; >=  {((sc.input.V[0].O*10.1)+of.input.V[0].O)} {5.}
(assert (<= (+ (* sc_57 10.1) of_57) 5.))
; 
; <=  {((sc.input.V[0].O*10.1)+of.input.V[0].O)} {0.}
(assert (>= (+ (* sc_57 10.1) of_57) 0.))
(declare-fun sc_58 () Real)
(declare-fun of_58 () Real)
(declare-fun sc_59 () Real)
(declare-fun of_59 () Real)
; 
; =  {sc.input.V[11].O} {sc.input.V[11].X}
(assert (= sc_59 sc_58))
; 
; =  {of.input.V[11].O} {of.input.V[11].X}
(assert (= of_59 of_58))
; 
; >=  {((sc.input.V[11].X*0.595238095238)+of.input.V[11].X)} {5.}
(assert (<= (+ (* sc_58 0.595238095238) of_58) 5.))
; 
; <=  {((sc.input.V[11].X*0.595238095238)+of.input.V[11].X)} {0.}
(assert (>= (+ (* sc_58 0.595238095238) of_58) 0.))
; 
; >=  {((sc.input.V[11].O*0.595238095238)+of.input.V[11].O)} {5.}
(assert (<= (+ (* sc_59 0.595238095238) of_59) 5.))
; 
; <=  {((sc.input.V[11].O*0.595238095238)+of.input.V[11].O)} {0.}
(assert (>= (+ (* sc_59 0.595238095238) of_59) 0.))
(declare-fun sc_60 () Real)
(declare-fun of_60 () Real)
(declare-fun sc_61 () Real)
(declare-fun of_61 () Real)
; 
; =  {sc.input.V[10].O} {sc.input.V[10].X}
(assert (= sc_61 sc_60))
; 
; =  {of.input.V[10].O} {of.input.V[10].X}
(assert (= of_61 of_60))
; 
; >=  {((sc.input.V[10].X*0.124)+of.input.V[10].X)} {5.}
(assert (<= (+ (* sc_60 0.124) of_60) 5.))
; 
; <=  {((sc.input.V[10].X*0.124)+of.input.V[10].X)} {0.}
(assert (>= (+ (* sc_60 0.124) of_60) 0.))
; 
; >=  {((sc.input.V[10].O*0.124)+of.input.V[10].O)} {5.}
(assert (<= (+ (* sc_61 0.124) of_61) 5.))
; 
; <=  {((sc.input.V[10].O*0.124)+of.input.V[10].O)} {0.}
(assert (>= (+ (* sc_61 0.124) of_61) 0.))
(declare-fun sc_62 () Real)
(declare-fun of_62 () Real)
(declare-fun sc_63 () Real)
(declare-fun of_63 () Real)
; 
; =  {sc.input.V[15].O} {sc.input.V[15].X}
(assert (= sc_63 sc_62))
; 
; =  {of.input.V[15].O} {of.input.V[15].X}
(assert (= of_63 of_62))
; 
; >=  {((sc.input.V[15].X*0.0396322130628)+of.input.V[15].X)} {5.}
(assert (<= (+ (* sc_62 0.0396322130628) of_62) 5.))
; 
; <=  {((sc.input.V[15].X*0.0396322130628)+of.input.V[15].X)} {0.}
(assert (>= (+ (* sc_62 0.0396322130628) of_62) 0.))
; 
; >=  {((sc.input.V[15].O*0.0396322130628)+of.input.V[15].O)} {5.}
(assert (<= (+ (* sc_63 0.0396322130628) of_63) 5.))
; 
; <=  {((sc.input.V[15].O*0.0396322130628)+of.input.V[15].O)} {0.}
(assert (>= (+ (* sc_63 0.0396322130628) of_63) 0.))
(declare-fun sc_64 () Real)
(declare-fun of_64 () Real)
(declare-fun sc_65 () Real)
(declare-fun of_65 () Real)
; 
; =  {sc.input.V[6].O} {sc.input.V[6].X}
(assert (= sc_65 sc_64))
; 
; =  {of.input.V[6].O} {of.input.V[6].X}
(assert (= of_65 of_64))
; 
; >=  {((sc.input.V[6].X*0.)+of.input.V[6].X)} {5.}
(assert (<= (+ (* sc_64 0.) of_64) 5.))
; 
; <=  {((sc.input.V[6].X*0.)+of.input.V[6].X)} {0.}
(assert (>= (+ (* sc_64 0.) of_64) 0.))
; 
; >=  {((sc.input.V[6].O*0.)+of.input.V[6].O)} {5.}
(assert (<= (+ (* sc_65 0.) of_65) 5.))
; 
; <=  {((sc.input.V[6].O*0.)+of.input.V[6].O)} {0.}
(assert (>= (+ (* sc_65 0.) of_65) 0.))
(declare-fun sc_66 () Real)
(declare-fun of_66 () Real)
(declare-fun sc_67 () Real)
(declare-fun of_67 () Real)
; 
; =  {sc.input.V[14].O} {sc.input.V[14].X}
(assert (= sc_67 sc_66))
; 
; =  {of.input.V[14].O} {of.input.V[14].X}
(assert (= of_67 of_66))
; 
; >=  {((sc.input.V[14].X*1.)+of.input.V[14].X)} {5.}
(assert (<= (+ (* sc_66 1.) of_66) 5.))
; 
; <=  {((sc.input.V[14].X*1.)+of.input.V[14].X)} {0.}
(assert (>= (+ (* sc_66 1.) of_66) 0.))
; 
; >=  {((sc.input.V[14].O*1.)+of.input.V[14].O)} {5.}
(assert (<= (+ (* sc_67 1.) of_67) 5.))
; 
; <=  {((sc.input.V[14].O*1.)+of.input.V[14].O)} {0.}
(assert (>= (+ (* sc_67 1.) of_67) 0.))
(declare-fun sc_68 () Real)
(declare-fun of_68 () Real)
(declare-fun sc_69 () Real)
(declare-fun of_69 () Real)
; 
; =  {sc.input.V[16].O} {sc.input.V[16].X}
(assert (= sc_69 sc_68))
; 
; =  {of.input.V[16].O} {of.input.V[16].X}
(assert (= of_69 of_68))
; 
; >=  {((sc.input.V[16].X*0.0396322130628)+of.input.V[16].X)} {5.}
(assert (<= (+ (* sc_68 0.0396322130628) of_68) 5.))
; 
; <=  {((sc.input.V[16].X*0.0396322130628)+of.input.V[16].X)} {0.}
(assert (>= (+ (* sc_68 0.0396322130628) of_68) 0.))
; 
; >=  {((sc.input.V[16].O*0.0396322130628)+of.input.V[16].O)} {5.}
(assert (<= (+ (* sc_69 0.0396322130628) of_69) 5.))
; 
; <=  {((sc.input.V[16].O*0.0396322130628)+of.input.V[16].O)} {0.}
(assert (>= (+ (* sc_69 0.0396322130628) of_69) 0.))
(declare-fun sc_70 () Real)
(declare-fun of_70 () Real)
(declare-fun sc_71 () Real)
(declare-fun of_71 () Real)
; 
; =  {sc.input.V[3].O} {sc.input.V[3].X}
(assert (= sc_71 sc_70))
; 
; =  {of.input.V[3].O} {of.input.V[3].X}
(assert (= of_71 of_70))
; 
; >=  {((sc.input.V[3].X*0.)+of.input.V[3].X)} {5.}
(assert (<= (+ (* sc_70 0.) of_70) 5.))
; 
; <=  {((sc.input.V[3].X*0.)+of.input.V[3].X)} {0.}
(assert (>= (+ (* sc_70 0.) of_70) 0.))
; 
; >=  {((sc.input.V[3].O*0.)+of.input.V[3].O)} {5.}
(assert (<= (+ (* sc_71 0.) of_71) 5.))
; 
; <=  {((sc.input.V[3].O*0.)+of.input.V[3].O)} {0.}
(assert (>= (+ (* sc_71 0.) of_71) 0.))
(declare-fun sc_72 () Real)
(declare-fun of_72 () Real)
(declare-fun sc_73 () Real)
(declare-fun of_73 () Real)
; 
; =  {sc.input.V[4].O} {sc.input.V[4].X}
(assert (= sc_73 sc_72))
; 
; =  {of.input.V[4].O} {of.input.V[4].X}
(assert (= of_73 of_72))
; 
; >=  {((sc.input.V[4].X*0.)+of.input.V[4].X)} {5.}
(assert (<= (+ (* sc_72 0.) of_72) 5.))
; 
; <=  {((sc.input.V[4].X*0.)+of.input.V[4].X)} {0.}
(assert (>= (+ (* sc_72 0.) of_72) 0.))
; 
; >=  {((sc.input.V[4].O*0.)+of.input.V[4].O)} {5.}
(assert (<= (+ (* sc_73 0.) of_73) 5.))
; 
; <=  {((sc.input.V[4].O*0.)+of.input.V[4].O)} {0.}
(assert (>= (+ (* sc_73 0.) of_73) 0.))
(declare-fun sc_74 () Real)
(declare-fun of_74 () Real)
(declare-fun sc_75 () Real)
(declare-fun of_75 () Real)
; 
; =  {sc.input.V[5].O} {sc.input.V[5].X}
(assert (= sc_75 sc_74))
; 
; =  {of.input.V[5].O} {of.input.V[5].X}
(assert (= of_75 of_74))
; 
; >=  {((sc.input.V[5].X*0.)+of.input.V[5].X)} {5.}
(assert (<= (+ (* sc_74 0.) of_74) 5.))
; 
; <=  {((sc.input.V[5].X*0.)+of.input.V[5].X)} {0.}
(assert (>= (+ (* sc_74 0.) of_74) 0.))
; 
; >=  {((sc.input.V[5].O*0.)+of.input.V[5].O)} {5.}
(assert (<= (+ (* sc_75 0.) of_75) 5.))
; 
; <=  {((sc.input.V[5].O*0.)+of.input.V[5].O)} {0.}
(assert (>= (+ (* sc_75 0.) of_75) 0.))
(declare-fun sc_76 () Real)
(declare-fun of_76 () Real)
(declare-fun sc_77 () Real)
(declare-fun of_77 () Real)
; 
; =  {sc.input.V[1].O} {sc.input.V[1].X}
(assert (= sc_77 sc_76))
; 
; =  {of.input.V[1].O} {of.input.V[1].X}
(assert (= of_77 of_76))
; 
; >=  {((sc.input.V[1].X*9.26)+of.input.V[1].X)} {5.}
(assert (<= (+ (* sc_76 9.26) of_76) 5.))
; 
; <=  {((sc.input.V[1].X*9.26)+of.input.V[1].X)} {0.}
(assert (>= (+ (* sc_76 9.26) of_76) 0.))
; 
; >=  {((sc.input.V[1].O*9.26)+of.input.V[1].O)} {5.}
(assert (<= (+ (* sc_77 9.26) of_77) 5.))
; 
; <=  {((sc.input.V[1].O*9.26)+of.input.V[1].O)} {0.}
(assert (>= (+ (* sc_77 9.26) of_77) 0.))
(declare-fun sc_78 () Real)
(declare-fun of_78 () Real)
(declare-fun sc_79 () Real)
(declare-fun of_79 () Real)
(declare-fun sc_80 () Real)
(declare-fun of_80 () Real)
(assert (= of_79 0))
(assert (= of_78 0))
; 
; =  {sc.itov[2].Y} {(sc.itov[2].K*sc.itov[2].X)}
(assert (= sc_80 (* sc_79 sc_78)))
; 
; =  {of.itov[2].Y} {0}
(assert (= of_80 0.))
; 
; >=  {((sc.itov[2].X*10.1)+of.itov[2].X)} {10.}
(assert (<= (+ (* sc_78 10.1) of_78) 10.))
; 
; <=  {((sc.itov[2].X*10.1)+of.itov[2].X)} {0.0001}
(assert (>= (+ (* sc_78 10.1) of_78) 0.0001))
(declare-fun slbot_80 () Real)
(declare-fun sltop_80 () Real)
; 
; =  {(((sc.itov[2].Y*0.)+of.itov[2].Y)+sl.min.itov[2].Y)} {0.0001}
(assert (= (+ (+ (* sc_80 0.) of_80) slbot_80) 0.0001))
; 
; =  {(((sc.itov[2].Y*10.1)+of.itov[2].Y)+sl.max.itov[2].Y)} {3300.}
(assert (= (+ (+ (* sc_80 10.1) of_80) sltop_80) 3300.))
(declare-fun slbot_79 () Real)
(declare-fun sltop_79 () Real)
; 
; =  {(((sc.itov[2].K*0.)+of.itov[2].K)+sl.min.itov[2].K)} {1.}
(assert (= (+ (+ (* sc_79 0.) of_79) slbot_79) 1.))
; 
; =  {(((sc.itov[2].K*1.)+of.itov[2].K)+sl.max.itov[2].K)} {330.}
(assert (= (+ (+ (* sc_79 1.) of_79) sltop_79) 330.))
(declare-fun slbot_80 () Real)
(declare-fun sltop_80 () Real)
; 
; =  {(((sc.itov[2].Y*0.)+of.itov[2].Y)+sl.min.itov[2].Y)} {0.0001}
(assert (= (+ (+ (* sc_80 0.) of_80) slbot_80) 0.0001))
; 
; =  {(((sc.itov[2].Y*10.1)+of.itov[2].Y)+sl.max.itov[2].Y)} {3300.}
(assert (= (+ (+ (* sc_80 10.1) of_80) sltop_80) 3300.))
(declare-fun sc_81 () Real)
(declare-fun of_81 () Real)
(declare-fun sc_82 () Real)
(declare-fun of_82 () Real)
(declare-fun sc_83 () Real)
(declare-fun of_83 () Real)
(assert (= of_82 0))
(assert (= of_81 0))
; 
; =  {sc.itov[7].Y} {(sc.itov[7].K*sc.itov[7].X)}
(assert (= sc_83 (* sc_82 sc_81)))
; 
; =  {of.itov[7].Y} {0}
(assert (= of_83 0.))
(declare-fun slbot_81 () Real)
(declare-fun sltop_81 () Real)
; 
; =  {(((sc.itov[7].X*0.)+of.itov[7].X)+sl.min.itov[7].X)} {0.0001}
(assert (= (+ (+ (* sc_81 0.) of_81) slbot_81) 0.0001))
; 
; =  {(((sc.itov[7].X*1.)+of.itov[7].X)+sl.max.itov[7].X)} {10.}
(assert (= (+ (+ (* sc_81 1.) of_81) sltop_81) 10.))
(declare-fun slbot_83 () Real)
(declare-fun sltop_83 () Real)
; 
; =  {(((sc.itov[7].Y*0.)+of.itov[7].Y)+sl.min.itov[7].Y)} {0.0001}
(assert (= (+ (+ (* sc_83 0.) of_83) slbot_83) 0.0001))
; 
; =  {(((sc.itov[7].Y*9.26)+of.itov[7].Y)+sl.max.itov[7].Y)} {3300.}
(assert (= (+ (+ (* sc_83 9.26) of_83) sltop_83) 3300.))
; 
; >=  {((sc.itov[7].K*9.26)+of.itov[7].K)} {330.}
(assert (<= (+ (* sc_82 9.26) of_82) 330.))
; 
; <=  {((sc.itov[7].K*9.26)+of.itov[7].K)} {1.}
(assert (>= (+ (* sc_82 9.26) of_82) 1.))
(declare-fun slbot_83 () Real)
(declare-fun sltop_83 () Real)
; 
; =  {(((sc.itov[7].Y*0.)+of.itov[7].Y)+sl.min.itov[7].Y)} {0.0001}
(assert (= (+ (+ (* sc_83 0.) of_83) slbot_83) 0.0001))
; 
; =  {(((sc.itov[7].Y*9.26)+of.itov[7].Y)+sl.max.itov[7].Y)} {3300.}
(assert (= (+ (+ (* sc_83 9.26) of_83) sltop_83) 3300.))
(declare-fun sc_84 () Real)
(declare-fun of_84 () Real)
(declare-fun sc_85 () Real)
(declare-fun of_85 () Real)
(declare-fun sc_86 () Real)
(declare-fun of_86 () Real)
(assert (= of_85 0))
(assert (= of_84 0))
; 
; =  {sc.itov[10].Y} {(sc.itov[10].K*sc.itov[10].X)}
(assert (= sc_86 (* sc_85 sc_84)))
; 
; =  {of.itov[10].Y} {0}
(assert (= of_86 0.))
(declare-fun slbot_84 () Real)
(declare-fun sltop_84 () Real)
; 
; =  {(((sc.itov[10].X*0.)+of.itov[10].X)+sl.min.itov[10].X)} {0.0001}
(assert (= (+ (+ (* sc_84 0.) of_84) slbot_84) 0.0001))
; 
; =  {(((sc.itov[10].X*1.)+of.itov[10].X)+sl.max.itov[10].X)} {10.}
(assert (= (+ (+ (* sc_84 1.) of_84) sltop_84) 10.))
(declare-fun slbot_86 () Real)
(declare-fun sltop_86 () Real)
; 
; =  {(((sc.itov[10].Y*0.)+of.itov[10].Y)+sl.min.itov[10].Y)} {0.0001}
(assert (= (+ (+ (* sc_86 0.) of_86) slbot_86) 0.0001))
; 
; =  {(((sc.itov[10].Y*12.616)+of.itov[10].Y)+sl.max.itov[10].Y)} {3300.}
(assert (= (+ (+ (* sc_86 12.616) of_86) sltop_86) 3300.))
(declare-fun slbot_85 () Real)
(declare-fun sltop_85 () Real)
; 
; =  {(((sc.itov[10].K*0.)+of.itov[10].K)+sl.min.itov[10].K)} {1.}
(assert (= (+ (+ (* sc_85 0.) of_85) slbot_85) 1.))
; 
; =  {(((sc.itov[10].K*12.616)+of.itov[10].K)+sl.max.itov[10].K)} {330.}
(assert (= (+ (+ (* sc_85 12.616) of_85) sltop_85) 330.))
(declare-fun slbot_86 () Real)
(declare-fun sltop_86 () Real)
; 
; =  {(((sc.itov[10].Y*0.)+of.itov[10].Y)+sl.min.itov[10].Y)} {0.0001}
(assert (= (+ (+ (* sc_86 0.) of_86) slbot_86) 0.0001))
; 
; =  {(((sc.itov[10].Y*12.616)+of.itov[10].Y)+sl.max.itov[10].Y)} {3300.}
(assert (= (+ (+ (* sc_86 12.616) of_86) sltop_86) 3300.))
(declare-fun sc_87 () Real)
(declare-fun of_87 () Real)
(declare-fun sc_88 () Real)
(declare-fun of_88 () Real)
(declare-fun sc_89 () Real)
(declare-fun of_89 () Real)
(assert (= of_88 0))
(assert (= of_87 0))
; 
; =  {sc.itov[4].Y} {(sc.itov[4].K*sc.itov[4].X)}
(assert (= sc_89 (* sc_88 sc_87)))
; 
; =  {of.itov[4].Y} {0}
(assert (= of_89 0.))
(declare-fun slbot_87 () Real)
(declare-fun sltop_87 () Real)
; 
; =  {(((sc.itov[4].X*0.)+of.itov[4].X)+sl.min.itov[4].X)} {0.0001}
(assert (= (+ (+ (* sc_87 0.) of_87) slbot_87) 0.0001))
; 
; =  {(((sc.itov[4].X*1.)+of.itov[4].X)+sl.max.itov[4].X)} {10.}
(assert (= (+ (+ (* sc_87 1.) of_87) sltop_87) 10.))
(declare-fun slbot_89 () Real)
(declare-fun sltop_89 () Real)
; 
; =  {(((sc.itov[4].Y*0.)+of.itov[4].Y)+sl.min.itov[4].Y)} {0.0001}
(assert (= (+ (+ (* sc_89 0.) of_89) slbot_89) 0.0001))
; 
; =  {(((sc.itov[4].Y*12.616)+of.itov[4].Y)+sl.max.itov[4].Y)} {3300.}
(assert (= (+ (+ (* sc_89 12.616) of_89) sltop_89) 3300.))
; 
; >=  {((sc.itov[4].K*12.616)+of.itov[4].K)} {330.}
(assert (<= (+ (* sc_88 12.616) of_88) 330.))
; 
; <=  {((sc.itov[4].K*12.616)+of.itov[4].K)} {1.}
(assert (>= (+ (* sc_88 12.616) of_88) 1.))
(declare-fun slbot_89 () Real)
(declare-fun sltop_89 () Real)
; 
; =  {(((sc.itov[4].Y*0.)+of.itov[4].Y)+sl.min.itov[4].Y)} {0.0001}
(assert (= (+ (+ (* sc_89 0.) of_89) slbot_89) 0.0001))
; 
; =  {(((sc.itov[4].Y*12.616)+of.itov[4].Y)+sl.max.itov[4].Y)} {3300.}
(assert (= (+ (+ (* sc_89 12.616) of_89) sltop_89) 3300.))
; 
; =  {sc.itov[2].Y} {sc.vadd[3].B}
(assert (= sc_80 sc_34))
; 
; =  {of.itov[2].Y} {of.vadd[3].B}
(assert (= of_80 of_34))
; 
; =  {sc.vadd[1].OUT2} {sc.output.V[0].X}
(assert (= sc_43 sc_14))
; 
; =  {of.vadd[1].OUT2} {of.output.V[0].X}
(assert (= of_43 of_14))
; 
; =  {sc.vgain[8].P} {sc.itov[10].K}
(assert (= sc_3 sc_85))
; 
; =  {of.vgain[8].P} {of.itov[10].K}
(assert (= of_3 of_85))
; 
; =  {sc.input.I[0].O} {sc.itov[2].X}
(assert (= sc_13 sc_78))
; 
; =  {of.input.I[0].O} {of.itov[2].X}
(assert (= of_13 of_78))
; 
; =  {sc.input.V[9].O} {sc.vadd[6].OUT2_0}
(assert (= sc_55 sc_23))
; 
; =  {of.input.V[9].O} {of.vadd[6].OUT2_0}
(assert (= of_55 of_23))
; 
; =  {sc.input.V[15].O} {sc.vgain[8].Y}
(assert (= sc_63 sc_1))
; 
; =  {of.input.V[15].O} {of.vgain[8].Y}
(assert (= of_63 of_1))
; 
; =  {sc.input.V[13].O} {sc.vgain[8].Z}
(assert (= sc_51 sc_2))
; 
; =  {of.input.V[13].O} {of.vgain[8].Z}
(assert (= of_51 of_2))
; 
; =  {sc.input.V[14].O} {sc.vgain[5].X}
(assert (= sc_67 sc_8))
; 
; =  {of.input.V[14].O} {of.vgain[5].X}
(assert (= of_67 of_8))
; 
; =  {sc.input.V[11].O} {sc.vgain[0].Y}
(assert (= sc_59 sc_5))
; 
; =  {of.input.V[11].O} {of.vgain[0].Y}
(assert (= of_59 of_5))
; 
; =  {sc.input.V[12].O} {sc.vgain[0].X}
(assert (= sc_53 sc_4))
; 
; =  {of.input.V[12].O} {of.vgain[0].X}
(assert (= of_53 of_4))
; 
; =  {sc.input.V[8].O} {sc.itov[4].K}
(assert (= sc_47 sc_88))
; 
; =  {of.input.V[8].O} {of.itov[4].K}
(assert (= of_47 of_88))
; 
; =  {sc.input.V[2].O} {sc.vadd[1].OUT2_0}
(assert (= sc_45 sc_37))
; 
; =  {of.input.V[2].O} {of.vadd[1].OUT2_0}
(assert (= of_45 of_37))
; 
; =  {sc.input.V[3].O} {sc.vadd[1].A}
(assert (= sc_71 sc_40))
; 
; =  {of.input.V[3].O} {of.vadd[1].A}
(assert (= of_71 of_40))
; 
; =  {sc.itov[7].Y} {sc.vadd[6].B}
(assert (= sc_83 sc_27))
; 
; =  {of.itov[7].Y} {of.vadd[6].B}
(assert (= of_83 of_27))
; 
; =  {sc.vadd[3].OUT2} {sc.vgain[5].Z}
(assert (= sc_36 sc_10))
; 
; =  {of.vadd[3].OUT2} {of.vgain[5].Z}
(assert (= of_36 of_10))
; 
; =  {sc.vadd[3].OUT2} {sc.vgain[8].X}
(assert (= sc_36 sc_0))
; 
; =  {of.vadd[3].OUT2} {of.vgain[8].X}
(assert (= of_36 of_0))
; 
; =  {sc.input.V[1].O} {sc.itov[7].K}
(assert (= sc_77 sc_82))
; 
; =  {of.input.V[1].O} {of.itov[7].K}
(assert (= of_77 of_82))
; 
; =  {sc.vgain[0].P} {sc.vadd[1].B}
(assert (= sc_7 sc_41))
; 
; =  {of.vgain[0].P} {of.vadd[1].B}
(assert (= of_7 of_41))
; 
; =  {sc.input.V[7].O} {sc.vadd[9].OUT2_0}
(assert (= sc_49 sc_16))
; 
; =  {of.input.V[7].O} {of.vadd[9].OUT2_0}
(assert (= of_49 of_16))
; 
; =  {sc.vadd[9].OUT2} {sc.vgain[0].Z}
(assert (= sc_22 sc_6))
; 
; =  {of.vadd[9].OUT2} {of.vgain[0].Z}
(assert (= of_22 of_6))
; 
; =  {sc.vadd[9].OUT2} {sc.itov[2].K}
(assert (= sc_22 sc_79))
; 
; =  {of.vadd[9].OUT2} {of.itov[2].K}
(assert (= of_22 of_79))
; 
; =  {sc.vadd[9].OUT2} {sc.itov[7].X}
(assert (= sc_22 sc_81))
; 
; =  {of.vadd[9].OUT2} {of.itov[7].X}
(assert (= of_22 of_81))
; 
; =  {sc.input.V[10].O} {sc.vadd[3].OUT2_0}
(assert (= sc_61 sc_30))
; 
; =  {of.input.V[10].O} {of.vadd[3].OUT2_0}
(assert (= of_61 of_30))
; 
; =  {sc.input.V[0].O} {sc.vadd[9].D}
(assert (= sc_57 sc_17))
; 
; =  {of.input.V[0].O} {of.vadd[9].D}
(assert (= of_57 of_17))
; 
; =  {sc.itov[10].Y} {sc.vadd[9].B}
(assert (= sc_86 sc_20))
; 
; =  {of.itov[10].Y} {of.vadd[9].B}
(assert (= of_86 of_20))
; 
; =  {sc.input.V[16].O} {sc.vgain[5].Y}
(assert (= sc_69 sc_9))
; 
; =  {of.input.V[16].O} {of.vgain[5].Y}
(assert (= of_69 of_9))
; 
; =  {sc.itov[4].Y} {sc.vadd[3].D}
(assert (= sc_89 sc_31))
; 
; =  {of.itov[4].Y} {of.vadd[3].D}
(assert (= of_89 of_31))
; 
; =  {sc.input.V[5].O} {sc.vadd[6].A}
(assert (= sc_75 sc_26))
; 
; =  {of.input.V[5].O} {of.vadd[6].A}
(assert (= of_75 of_26))
; 
; =  {sc.vadd[6].OUT2} {sc.itov[10].X}
(assert (= sc_29 sc_84))
; 
; =  {of.vadd[6].OUT2} {of.itov[10].X}
(assert (= of_29 of_84))
; 
; =  {sc.vadd[6].OUT2} {sc.itov[4].X}
(assert (= sc_29 sc_87))
; 
; =  {of.vadd[6].OUT2} {of.itov[4].X}
(assert (= of_29 of_87))
; 
; =  {sc.input.V[4].O} {sc.vadd[3].A}
(assert (= sc_73 sc_33))
; 
; =  {of.input.V[4].O} {of.vadd[3].A}
(assert (= of_73 of_33))
; 
; =  {sc.input.V[6].O} {sc.vadd[9].A}
(assert (= sc_65 sc_19))
; 
; =  {of.input.V[6].O} {of.vadd[9].A}
(assert (= of_65 of_19))
; 
; =  {sc.vgain[5].P} {sc.vadd[6].D}
(assert (= sc_11 sc_24))
; 
; =  {of.vgain[5].P} {of.vadd[6].D}
(assert (= of_11 of_24))
(assert (<= (* sc_15 0.001) 1.))
; 
; =  {sc.vadd[1].OUT2} {sc.output.V[0].O} {sc.vadd[6].OUT2} {sc.vadd[3].OUT2} {sc.vadd[9].OUT2}
(assert (and (and (and (= sc_43 sc_15) (= sc_43 sc_29)) (= sc_43 sc_36)) (= sc_43 sc_22)))
(assert (= __minima__ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (* (ite (>= sltop_36 0) sltop_36 (- sltop_36)) 1.) (* (ite (>= slbot_0 0) slbot_0 (- slbot_0)) 1.)) (* (ite (>= slbot_14 0) slbot_14 (- slbot_14)) 1.)) (* (ite (>= slbot_89 0) slbot_89 (- slbot_89)) 1.)) (* (ite (>= slbot_29 0) slbot_29 (- slbot_29)) 1.)) (* (ite (>= sltop_14 0) sltop_14 (- sltop_14)) 1.)) (* (ite (>= slbot_22 0) slbot_22 (- slbot_22)) 1.)) (* (ite (>= sltop_41 0) sltop_41 (- sltop_41)) 1.)) (* (ite (>= slbot_80 0) slbot_80 (- slbot_80)) 1.)) (* (ite (>= sltop_87 0) sltop_87 (- sltop_87)) 1.)) (* (ite (>= slbot_11 0) slbot_11 (- slbot_11)) 1.)) (* (ite (>= slbot_10 0) slbot_10 (- slbot_10)) 1.)) (* (ite (>= slbot_35 0) slbot_35 (- slbot_35)) 1.)) (* (ite (>= sltop_0 0) sltop_0 (- sltop_0)) 1.)) (* (ite (>= sltop_11 0) sltop_11 (- sltop_11)) 1.)) (* (ite (>= slbot_20 0) slbot_20 (- slbot_20)) 1.)) (* (ite (>= sltop_27 0) sltop_27 (- sltop_27)) 1.)) (* (ite (>= sltop_80 0) sltop_80 (- sltop_80)) 1.)) (* (ite (>= sltop_81 0) sltop_81 (- sltop_81)) 1.)) (* (ite (>= slbot_83 0) slbot_83 (- slbot_83)) 1.)) (* (ite (>= slbot_3 0) slbot_3 (- slbot_3)) 1.)) (* (ite (>= sltop_42 0) sltop_42 (- sltop_42)) 1.)) (* (ite (>= sltop_79 0) sltop_79 (- sltop_79)) 1.)) (* (ite (>= slbot_84 0) slbot_84 (- slbot_84)) 1.)) (* (ite (>= sltop_28 0) sltop_28 (- sltop_28)) 1.)) (* (ite (>= sltop_10 0) sltop_10 (- sltop_10)) 1.)) (* (ite (>= sltop_7 0) sltop_7 (- sltop_7)) 1.)) (* (ite (>= slbot_15 0) slbot_15 (- slbot_15)) 1.)) (* (ite (>= sltop_29 0) sltop_29 (- sltop_29)) 1.)) (* (ite (>= sltop_89 0) sltop_89 (- sltop_89)) 1.)) (* (ite (>= slbot_31 0) slbot_31 (- slbot_31)) 1.)) (* (ite (>= slbot_36 0) slbot_36 (- slbot_36)) 1.)) (* (ite (>= slbot_85 0) slbot_85 (- slbot_85)) 1.)) (* (ite (>= sltop_22 0) sltop_22 (- sltop_22)) 1.)) (* (ite (>= slbot_41 0) slbot_41 (- slbot_41)) 1.)) (* (ite (>= sltop_15 0) sltop_15 (- sltop_15)) 1.)) (* (ite (>= sltop_20 0) sltop_20 (- sltop_20)) 1.)) (* (ite (>= sltop_24 0) sltop_24 (- sltop_24)) 1.)) (* (ite (>= sltop_31 0) sltop_31 (- sltop_31)) 1.)) (* (ite (>= slbot_24 0) slbot_24 (- slbot_24)) 1.)) (* (ite (>= slbot_28 0) slbot_28 (- slbot_28)) 1.)) (* (ite (>= sltop_85 0) sltop_85 (- sltop_85)) 1.)) (* (ite (>= slbot_21 0) slbot_21 (- slbot_21)) 1.)) (* (ite (>= slbot_81 0) slbot_81 (- slbot_81)) 1.)) (* (ite (>= sltop_34 0) sltop_34 (- sltop_34)) 1.)) (* (ite (>= slbot_86 0) slbot_86 (- slbot_86)) 1.)) (* (ite (>= slbot_43 0) slbot_43 (- slbot_43)) 1.)) (* (ite (>= slbot_87 0) slbot_87 (- slbot_87)) 1.)) (* (ite (>= slbot_6 0) slbot_6 (- slbot_6)) 1.)) (* (ite (>= sltop_86 0) sltop_86 (- sltop_86)) 1.)) (* (ite (>= sltop_83 0) sltop_83 (- sltop_83)) 1.)) (* (ite (>= slbot_42 0) slbot_42 (- slbot_42)) 1.)) (* (ite (>= slbot_34 0) slbot_34 (- slbot_34)) 1.)) (* (ite (>= slbot_79 0) slbot_79 (- slbot_79)) 1.)) (* (ite (>= sltop_3 0) sltop_3 (- sltop_3)) 1.)) (* (ite (>= sltop_35 0) sltop_35 (- sltop_35)) 1.)) (* (ite (>= sltop_6 0) sltop_6 (- sltop_6)) 1.)) (* (ite (>= slbot_27 0) slbot_27 (- slbot_27)) 1.)) (* (ite (>= sltop_43 0) sltop_43 (- sltop_43)) 1.)) (* (ite (>= sltop_84 0) sltop_84 (- sltop_84)) 1.)) (* (ite (>= slbot_7 0) slbot_7 (- slbot_7)) 1.)) (* (ite (>= sltop_21 0) sltop_21 (- sltop_21)) 1.))))
(check-sat)
