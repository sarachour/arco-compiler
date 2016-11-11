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
; =  {sc.vgain[9].P} {((sc.vgain[9].X/sc.vgain[9].Y)*sc.vgain[9].Z*1)}
(assert (= sc_3 (* (* (/ sc_0 sc_1) sc_2) 1)))
; 
; =  {of.vgain[9].P} {0}
(assert (= of_3 0.))
; 
; >=  {((sc.vgain[9].X*1.)+of.vgain[9].X)} {3300.}
(assert (<= (+ (* sc_0 1.) of_0) 3300.))
; 
; <=  {((sc.vgain[9].X*1.)+of.vgain[9].X)} {0.0001}
(assert (>= (+ (* sc_0 1.) of_0) 0.0001))
; 
; >=  {((sc.vgain[9].Y*0.0396322130628)+of.vgain[9].Y)} {3300.}
(assert (<= (+ (* sc_1 0.0396322130628) of_1) 3300.))
; 
; <=  {((sc.vgain[9].Y*0.0396322130628)+of.vgain[9].Y)} {1.}
(assert (>= (+ (* sc_1 0.0396322130628) of_1) 1.))
(declare-fun slbot_3 () Real)
(declare-fun sltop_3 () Real)
; 
; =  {(((sc.vgain[9].P*0.)+of.vgain[9].P)+sl.min.vgain[9].P)} {1.51515151515e-12}
(assert (= (+ (+ (* sc_3 0.) of_3) slbot_3) 1.51515151515e-12))
; 
; =  {(((sc.vgain[9].P*12.616)+of.vgain[9].P)+sl.max.vgain[9].P)} {5445000.}
(assert (= (+ (+ (* sc_3 12.616) of_3) sltop_3) 5445000.))
(declare-fun slbot_2 () Real)
(declare-fun sltop_2 () Real)
; 
; =  {(((sc.vgain[9].Z*0.)+of.vgain[9].Z)+sl.min.vgain[9].Z)} {0.0001}
(assert (= (+ (+ (* sc_2 0.) of_2) slbot_2) 0.0001))
; 
; =  {(((sc.vgain[9].Z*1.)+of.vgain[9].Z)+sl.max.vgain[9].Z)} {3300.}
(assert (= (+ (+ (* sc_2 1.) of_2) sltop_2) 3300.))
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
; =  {sc.vgain[3].P} {((sc.vgain[3].X/sc.vgain[3].Y)*sc.vgain[3].Z*1)}
(assert (= sc_7 (* (* (/ sc_4 sc_5) sc_6) 1)))
; 
; =  {of.vgain[3].P} {0}
(assert (= of_7 0.))
; 
; >=  {((sc.vgain[3].X*1.)+of.vgain[3].X)} {3300.}
(assert (<= (+ (* sc_4 1.) of_4) 3300.))
; 
; <=  {((sc.vgain[3].X*1.)+of.vgain[3].X)} {0.0001}
(assert (>= (+ (* sc_4 1.) of_4) 0.0001))
; 
; >=  {((sc.vgain[3].Y*0.595238095238)+of.vgain[3].Y)} {3300.}
(assert (<= (+ (* sc_5 0.595238095238) of_5) 3300.))
; 
; <=  {((sc.vgain[3].Y*0.595238095238)+of.vgain[3].Y)} {1.}
(assert (>= (+ (* sc_5 0.595238095238) of_5) 1.))
(declare-fun slbot_7 () Real)
(declare-fun sltop_7 () Real)
; 
; =  {(((sc.vgain[3].P*0.)+of.vgain[3].P)+sl.min.vgain[3].P)} {1.51515151515e-12}
(assert (= (+ (+ (* sc_7 0.) of_7) slbot_7) 1.51515151515e-12))
; 
; =  {(((sc.vgain[3].P*0.84)+of.vgain[3].P)+sl.max.vgain[3].P)} {5445000.}
(assert (= (+ (+ (* sc_7 0.84) of_7) sltop_7) 5445000.))
(declare-fun slbot_6 () Real)
(declare-fun sltop_6 () Real)
; 
; =  {(((sc.vgain[3].Z*0.)+of.vgain[3].Z)+sl.min.vgain[3].Z)} {0.0001}
(assert (= (+ (+ (* sc_6 0.) of_6) slbot_6) 0.0001))
; 
; =  {(((sc.vgain[3].Z*1.)+of.vgain[3].Z)+sl.max.vgain[3].Z)} {3300.}
(assert (= (+ (+ (* sc_6 1.) of_6) sltop_6) 3300.))
(declare-fun sc_8 () Real)
(declare-fun of_8 () Real)
(declare-fun sc_9 () Real)
(declare-fun of_9 () Real)
; 
; =  {sc.input.I[0].O} {sc.input.I[0].X}
(assert (= sc_9 sc_8))
; 
; =  {of.input.I[0].O} {of.input.I[0].X}
(assert (= of_9 of_8))
; 
; >=  {((sc.input.I[0].X*50.464)+of.input.I[0].X)} {10.}
(assert (<= (+ (* sc_8 50.464) of_8) 10.))
; 
; <=  {((sc.input.I[0].X*50.464)+of.input.I[0].X)} {0.}
(assert (>= (+ (* sc_8 50.464) of_8) 0.))
; 
; >=  {((sc.input.I[0].O*50.464)+of.input.I[0].O)} {10.}
(assert (<= (+ (* sc_9 50.464) of_9) 10.))
; 
; <=  {((sc.input.I[0].O*50.464)+of.input.I[0].O)} {0.}
(assert (>= (+ (* sc_9 50.464) of_9) 0.))
(declare-fun sc_10 () Real)
(declare-fun of_10 () Real)
(declare-fun sc_11 () Real)
(declare-fun of_11 () Real)
; 
; =  {sc.output.V[0].O} {sc.output.V[0].X}
(assert (= sc_11 sc_10))
; 
; =  {of.output.V[0].O} {of.output.V[0].X}
(assert (= of_11 of_10))
(declare-fun slbot_10 () Real)
(declare-fun sltop_10 () Real)
; 
; =  {(((sc.output.V[0].X*0.)+of.output.V[0].X)+sl.min.output.V[0].X)} {0.0001}
(assert (= (+ (+ (* sc_10 0.) of_10) slbot_10) 0.0001))
; 
; =  {(((sc.output.V[0].X*1.)+of.output.V[0].X)+sl.max.output.V[0].X)} {3300.}
(assert (= (+ (+ (* sc_10 1.) of_10) sltop_10) 3300.))
(declare-fun slbot_11 () Real)
(declare-fun sltop_11 () Real)
; 
; =  {(((sc.output.V[0].O*0.)+of.output.V[0].O)+sl.min.output.V[0].O)} {0.0001}
(assert (= (+ (+ (* sc_11 0.) of_11) slbot_11) 0.0001))
; 
; =  {(((sc.output.V[0].O*1.)+of.output.V[0].O)+sl.max.output.V[0].O)} {3300.}
(assert (= (+ (+ (* sc_11 1.) of_11) sltop_11) 3300.))
(declare-fun sc_12 () Real)
(declare-fun of_12 () Real)
(declare-fun sc_13 () Real)
(declare-fun of_13 () Real)
(declare-fun sc_14 () Real)
(declare-fun of_14 () Real)
(declare-fun sc_15 () Real)
(declare-fun of_15 () Real)
(declare-fun sc_16 () Real)
(declare-fun of_16 () Real)
(declare-fun sc_17 () Real)
(declare-fun of_17 () Real)
(declare-fun sc_18 () Real)
(declare-fun of_18 () Real)
(assert (= 0. 0))
(assert (= of_16 0))
; 
; =  {sc.vadd[8].A} {(1*sc.vadd[8].B)}
(assert (= sc_15 (* 1 sc_16)))
; 
; =  {sc.vadd[8].A} {(1*sc.vadd[8].C)} {(1*sc.vadd[8].D)}
(assert (and (= sc_15 (* 1 sc_14)) (= sc_15 (* 1 sc_13))))
(assert (= (- (+ of_15 0) (+ 0 0)) 0))
(assert (= 0. 0))
; 
; =  {sc.vadd[8].OUT} {(sc.vadd[8].A*1)}
(assert (= sc_17 (* sc_15 1)))
; 
; =  {of.vadd[8].OUT} {0}
(assert (= of_17 0.))
(assert (= 0. 0))
(assert (= of_16 0))
; 
; =  {sc.vadd[8].A} {(1*sc.vadd[8].B)}
(assert (= sc_15 (* 1 sc_16)))
; 
; =  {sc.vadd[8].A} {(1*sc.vadd[8].C)} {(1*sc.vadd[8].D*1)}
(assert (and (= sc_15 (* 1 sc_14)) (= sc_15 (* (* 1 sc_13) 1))))
(assert (= (- (+ of_15 0) (+ 0 0)) 0))
(assert (= 0. 0))
; 
; =  {sc.vadd[8].OUT2} {(sc.vadd[8].A*1)}
(assert (= sc_18 (* sc_15 1)))
(assert (= of_18 0))
(assert (= 0. 0))
; 
; =  {sc.vadd[8].OUT2_0} {(sc.vadd[8].A*1)}
(assert (= sc_12 (* sc_15 1)))
; 
; =  {of.vadd[8].OUT2_0} {0}
(assert (= of_12 0.))
(declare-fun slbot_17 () Real)
(declare-fun sltop_17 () Real)
; 
; =  {(((sc.vadd[8].OUT*0.)+of.vadd[8].OUT)+sl.min.vadd[8].OUT)} {5e-05}
(assert (= (+ (+ (* sc_17 0.) of_17) slbot_17) 5e-05))
; 
; =  {(((sc.vadd[8].OUT*12.616)+of.vadd[8].OUT)+sl.max.vadd[8].OUT)} {1650.}
(assert (= (+ (+ (* sc_17 12.616) of_17) sltop_17) 1650.))
; 
; >=  {((sc.vadd[8].A*0.)+of.vadd[8].A)} {3300.}
(assert (<= (+ (* sc_15 0.) of_15) 3300.))
; 
; <=  {((sc.vadd[8].A*0.)+of.vadd[8].A)} {0.0001}
(assert (>= (+ (* sc_15 0.) of_15) 0.0001))
(declare-fun slbot_16 () Real)
(declare-fun sltop_16 () Real)
; 
; =  {(((sc.vadd[8].B*0.)+of.vadd[8].B)+sl.min.vadd[8].B)} {0.0001}
(assert (= (+ (+ (* sc_16 0.) of_16) slbot_16) 0.0001))
; 
; =  {(((sc.vadd[8].B*50.464)+of.vadd[8].B)+sl.max.vadd[8].B)} {3300.}
(assert (= (+ (+ (* sc_16 50.464) of_16) sltop_16) 3300.))
(declare-fun slbot_17 () Real)
(declare-fun sltop_17 () Real)
; 
; =  {(((sc.vadd[8].OUT*0.)+of.vadd[8].OUT)+sl.min.vadd[8].OUT)} {5e-05}
(assert (= (+ (+ (* sc_17 0.) of_17) slbot_17) 5e-05))
; 
; =  {(((sc.vadd[8].OUT*12.616)+of.vadd[8].OUT)+sl.max.vadd[8].OUT)} {1650.}
(assert (= (+ (+ (* sc_17 12.616) of_17) sltop_17) 1650.))
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
(declare-fun sc_25 () Real)
(declare-fun of_25 () Real)
(assert (= 0. 0))
(assert (= of_20 0))
(assert (= 0. 0))
(assert (= of_23 0))
; 
; =  {sc.vadd[10].A} {(1*sc.vadd[10].B)}
(assert (= sc_22 (* 1 sc_23)))
; 
; =  {sc.vadd[10].A} {(1*sc.vadd[10].C)} {(1*sc.vadd[10].D)}
(assert (and (= sc_22 (* 1 sc_21)) (= sc_22 (* 1 sc_20))))
(assert (= (- (+ of_22 0) (+ 0 0)) 0))
(assert (= 0. 0))
; 
; =  {sc.vadd[10].OUT} {(sc.vadd[10].A*1)}
(assert (= sc_24 (* sc_22 1)))
; 
; =  {of.vadd[10].OUT} {0}
(assert (= of_24 0.))
(assert (= 0. 0))
(assert (= of_20 0))
(assert (= 0. 0))
(assert (= 0. 0))
(assert (= of_23 0))
; 
; =  {sc.vadd[10].A} {(1*sc.vadd[10].B)}
(assert (= sc_22 (* 1 sc_23)))
; 
; =  {sc.vadd[10].A} {(1*sc.vadd[10].C)} {(1*sc.vadd[10].D*1)}
(assert (and (= sc_22 (* 1 sc_21)) (= sc_22 (* (* 1 sc_20) 1))))
(assert (= (- (+ of_22 0) (+ 0 0)) 0))
(assert (= 0. 0))
; 
; =  {sc.vadd[10].OUT2} {(sc.vadd[10].A*1)}
(assert (= sc_25 (* sc_22 1)))
(assert (= of_25 0))
(assert (= 0. 0))
; 
; =  {sc.vadd[10].OUT2_0} {(sc.vadd[10].A*1)}
(assert (= sc_19 (* sc_22 1)))
; 
; =  {of.vadd[10].OUT2_0} {0}
(assert (= of_19 0.))
; 
; >=  {((sc.vadd[10].OUT2_0*0.256)+of.vadd[10].OUT2_0)} {3300.}
(assert (<= (+ (* sc_19 0.256) of_19) 3300.))
; 
; <=  {((sc.vadd[10].OUT2_0*0.256)+of.vadd[10].OUT2_0)} {0.}
(assert (>= (+ (* sc_19 0.256) of_19) 0.))
(declare-fun slbot_20 () Real)
(declare-fun sltop_20 () Real)
; 
; =  {(((sc.vadd[10].D*0.)+of.vadd[10].D)+sl.min.vadd[10].D)} {0.0001}
(assert (= (+ (+ (* sc_20 0.) of_20) slbot_20) 0.0001))
; 
; =  {(((sc.vadd[10].D*12.616)+of.vadd[10].D)+sl.max.vadd[10].D)} {3300.}
(assert (= (+ (+ (* sc_20 12.616) of_20) sltop_20) 3300.))
; 
; >=  {((sc.vadd[10].A*0.)+of.vadd[10].A)} {3300.}
(assert (<= (+ (* sc_22 0.) of_22) 3300.))
; 
; <=  {((sc.vadd[10].A*0.)+of.vadd[10].A)} {0.0001}
(assert (>= (+ (* sc_22 0.) of_22) 0.0001))
(declare-fun slbot_25 () Real)
(declare-fun sltop_25 () Real)
; 
; =  {(((sc.vadd[10].OUT2*0.)+of.vadd[10].OUT2)+sl.min.vadd[10].OUT2)} {0.}
(assert (= (+ (+ (* sc_25 0.) of_25) slbot_25) 0.))
; 
; =  {(((sc.vadd[10].OUT2*1.)+of.vadd[10].OUT2)+sl.max.vadd[10].OUT2)} {5.}
(assert (= (+ (+ (* sc_25 1.) of_25) sltop_25) 5.))
(declare-fun slbot_23 () Real)
(declare-fun sltop_23 () Real)
; 
; =  {(((sc.vadd[10].B*0.)+of.vadd[10].B)+sl.min.vadd[10].B)} {0.0001}
(assert (= (+ (+ (* sc_23 0.) of_23) slbot_23) 0.0001))
; 
; =  {(((sc.vadd[10].B*9.26)+of.vadd[10].B)+sl.max.vadd[10].B)} {3300.}
(assert (= (+ (+ (* sc_23 9.26) of_23) sltop_23) 3300.))
(declare-fun slbot_24 () Real)
(declare-fun sltop_24 () Real)
; 
; =  {(((sc.vadd[10].OUT*0.)+of.vadd[10].OUT)+sl.min.vadd[10].OUT)} {-824.99995}
(assert (= (+ (+ (* sc_24 0.) of_24) slbot_24) -824.99995))
; 
; =  {(((sc.vadd[10].OUT*9.26)+of.vadd[10].OUT)+sl.max.vadd[10].OUT)} {1649.999975}
(assert (= (+ (+ (* sc_24 9.26) of_24) sltop_24) 1649.999975))
(declare-fun slbot_25 () Real)
(declare-fun sltop_25 () Real)
; 
; =  {(((sc.vadd[10].OUT2*0.)+of.vadd[10].OUT2)+sl.min.vadd[10].OUT2)} {0.}
(assert (= (+ (+ (* sc_25 0.) of_25) slbot_25) 0.))
; 
; =  {(((sc.vadd[10].OUT2*1.)+of.vadd[10].OUT2)+sl.max.vadd[10].OUT2)} {5.}
(assert (= (+ (+ (* sc_25 1.) of_25) sltop_25) 5.))
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
(declare-fun sc_31 () Real)
(declare-fun of_31 () Real)
(declare-fun sc_32 () Real)
(declare-fun of_32 () Real)
(assert (= 0. 0))
(assert (= of_27 0))
(assert (= 0. 0))
(assert (= of_30 0))
; 
; =  {sc.vadd[6].A} {(1*sc.vadd[6].B)}
(assert (= sc_29 (* 1 sc_30)))
; 
; =  {sc.vadd[6].A} {(1*sc.vadd[6].C)} {(1*sc.vadd[6].D)}
(assert (and (= sc_29 (* 1 sc_28)) (= sc_29 (* 1 sc_27))))
(assert (= (- (+ of_29 0) (+ 0 0)) 0))
(assert (= 0. 0))
; 
; =  {sc.vadd[6].OUT} {(sc.vadd[6].A*1)}
(assert (= sc_31 (* sc_29 1)))
; 
; =  {of.vadd[6].OUT} {0}
(assert (= of_31 0.))
(assert (= 0. 0))
(assert (= of_27 0))
(assert (= 0. 0))
(assert (= 0. 0))
(assert (= of_30 0))
; 
; =  {sc.vadd[6].A} {(1*sc.vadd[6].B)}
(assert (= sc_29 (* 1 sc_30)))
; 
; =  {sc.vadd[6].A} {(1*sc.vadd[6].C)} {(1*sc.vadd[6].D*1)}
(assert (and (= sc_29 (* 1 sc_28)) (= sc_29 (* (* 1 sc_27) 1))))
(assert (= (- (+ of_29 0) (+ 0 0)) 0))
(assert (= 0. 0))
; 
; =  {sc.vadd[6].OUT2} {(sc.vadd[6].A*1)}
(assert (= sc_32 (* sc_29 1)))
(assert (= of_32 0))
(assert (= 0. 0))
; 
; =  {sc.vadd[6].OUT2_0} {(sc.vadd[6].A*1)}
(assert (= sc_26 (* sc_29 1)))
; 
; =  {of.vadd[6].OUT2_0} {0}
(assert (= of_26 0.))
; 
; >=  {((sc.vadd[6].OUT2_0*0.)+of.vadd[6].OUT2_0)} {3300.}
(assert (<= (+ (* sc_26 0.) of_26) 3300.))
; 
; <=  {((sc.vadd[6].OUT2_0*0.)+of.vadd[6].OUT2_0)} {0.}
(assert (>= (+ (* sc_26 0.) of_26) 0.))
; 
; >=  {((sc.vadd[6].D*10.1)+of.vadd[6].D)} {3300.}
(assert (<= (+ (* sc_27 10.1) of_27) 3300.))
; 
; <=  {((sc.vadd[6].D*10.1)+of.vadd[6].D)} {0.0001}
(assert (>= (+ (* sc_27 10.1) of_27) 0.0001))
; 
; >=  {((sc.vadd[6].A*0.)+of.vadd[6].A)} {3300.}
(assert (<= (+ (* sc_29 0.) of_29) 3300.))
; 
; <=  {((sc.vadd[6].A*0.)+of.vadd[6].A)} {0.0001}
(assert (>= (+ (* sc_29 0.) of_29) 0.0001))
(declare-fun slbot_32 () Real)
(declare-fun sltop_32 () Real)
; 
; =  {(((sc.vadd[6].OUT2*0.)+of.vadd[6].OUT2)+sl.min.vadd[6].OUT2)} {0.}
(assert (= (+ (+ (* sc_32 0.) of_32) slbot_32) 0.))
; 
; =  {(((sc.vadd[6].OUT2*1.)+of.vadd[6].OUT2)+sl.max.vadd[6].OUT2)} {5.}
(assert (= (+ (+ (* sc_32 1.) of_32) sltop_32) 5.))
(declare-fun slbot_30 () Real)
(declare-fun sltop_30 () Real)
; 
; =  {(((sc.vadd[6].B*0.)+of.vadd[6].B)+sl.min.vadd[6].B)} {0.0001}
(assert (= (+ (+ (* sc_30 0.) of_30) slbot_30) 0.0001))
; 
; =  {(((sc.vadd[6].B*12.616)+of.vadd[6].B)+sl.max.vadd[6].B)} {3300.}
(assert (= (+ (+ (* sc_30 12.616) of_30) sltop_30) 3300.))
(declare-fun slbot_31 () Real)
(declare-fun sltop_31 () Real)
; 
; =  {(((sc.vadd[6].OUT*0.)+of.vadd[6].OUT)+sl.min.vadd[6].OUT)} {-824.99995}
(assert (= (+ (+ (* sc_31 0.) of_31) slbot_31) -824.99995))
; 
; =  {(((sc.vadd[6].OUT*12.616)+of.vadd[6].OUT)+sl.max.vadd[6].OUT)} {1649.999975}
(assert (= (+ (+ (* sc_31 12.616) of_31) sltop_31) 1649.999975))
(declare-fun slbot_32 () Real)
(declare-fun sltop_32 () Real)
; 
; =  {(((sc.vadd[6].OUT2*0.)+of.vadd[6].OUT2)+sl.min.vadd[6].OUT2)} {0.}
(assert (= (+ (+ (* sc_32 0.) of_32) slbot_32) 0.))
; 
; =  {(((sc.vadd[6].OUT2*1.)+of.vadd[6].OUT2)+sl.max.vadd[6].OUT2)} {5.}
(assert (= (+ (+ (* sc_32 1.) of_32) sltop_32) 5.))
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
(declare-fun sc_38 () Real)
(declare-fun of_38 () Real)
(declare-fun sc_39 () Real)
(declare-fun of_39 () Real)
(assert (= 0. 0))
(assert (= of_37 0))
; 
; =  {sc.vadd[4].A} {(1*sc.vadd[4].B)}
(assert (= sc_36 (* 1 sc_37)))
; 
; =  {sc.vadd[4].A} {(1*sc.vadd[4].C)} {(1*sc.vadd[4].D)}
(assert (and (= sc_36 (* 1 sc_35)) (= sc_36 (* 1 sc_34))))
(assert (= (- (+ of_36 0) (+ 0 0)) 0))
(assert (= 0. 0))
; 
; =  {sc.vadd[4].OUT} {(sc.vadd[4].A*1)}
(assert (= sc_38 (* sc_36 1)))
; 
; =  {of.vadd[4].OUT} {0}
(assert (= of_38 0.))
(assert (= 0. 0))
(assert (= of_37 0))
; 
; =  {sc.vadd[4].A} {(1*sc.vadd[4].B)}
(assert (= sc_36 (* 1 sc_37)))
; 
; =  {sc.vadd[4].A} {(1*sc.vadd[4].C)} {(1*sc.vadd[4].D*1)}
(assert (and (= sc_36 (* 1 sc_35)) (= sc_36 (* (* 1 sc_34) 1))))
(assert (= (- (+ of_36 0) (+ 0 0)) 0))
(assert (= 0. 0))
; 
; =  {sc.vadd[4].OUT2} {(sc.vadd[4].A*1)}
(assert (= sc_39 (* sc_36 1)))
(assert (= of_39 0))
(assert (= 0. 0))
; 
; =  {sc.vadd[4].OUT2_0} {(sc.vadd[4].A*1)}
(assert (= sc_33 (* sc_36 1)))
; 
; =  {of.vadd[4].OUT2_0} {0}
(assert (= of_33 0.))
; 
; >=  {((sc.vadd[4].OUT2_0*0.)+of.vadd[4].OUT2_0)} {3300.}
(assert (<= (+ (* sc_33 0.) of_33) 3300.))
; 
; <=  {((sc.vadd[4].OUT2_0*0.)+of.vadd[4].OUT2_0)} {0.}
(assert (>= (+ (* sc_33 0.) of_33) 0.))
; 
; >=  {((sc.vadd[4].A*0.)+of.vadd[4].A)} {3300.}
(assert (<= (+ (* sc_36 0.) of_36) 3300.))
; 
; <=  {((sc.vadd[4].A*0.)+of.vadd[4].A)} {0.0001}
(assert (>= (+ (* sc_36 0.) of_36) 0.0001))
(declare-fun slbot_39 () Real)
(declare-fun sltop_39 () Real)
; 
; =  {(((sc.vadd[4].OUT2*0.)+of.vadd[4].OUT2)+sl.min.vadd[4].OUT2)} {0.}
(assert (= (+ (+ (* sc_39 0.) of_39) slbot_39) 0.))
; 
; =  {(((sc.vadd[4].OUT2*1.)+of.vadd[4].OUT2)+sl.max.vadd[4].OUT2)} {5.}
(assert (= (+ (+ (* sc_39 1.) of_39) sltop_39) 5.))
(declare-fun slbot_37 () Real)
(declare-fun sltop_37 () Real)
; 
; =  {(((sc.vadd[4].B*0.)+of.vadd[4].B)+sl.min.vadd[4].B)} {0.0001}
(assert (= (+ (+ (* sc_37 0.) of_37) slbot_37) 0.0001))
; 
; =  {(((sc.vadd[4].B*0.84)+of.vadd[4].B)+sl.max.vadd[4].B)} {3300.}
(assert (= (+ (+ (* sc_37 0.84) of_37) sltop_37) 3300.))
(declare-fun slbot_38 () Real)
(declare-fun sltop_38 () Real)
; 
; =  {(((sc.vadd[4].OUT*0.)+of.vadd[4].OUT)+sl.min.vadd[4].OUT)} {5e-05}
(assert (= (+ (+ (* sc_38 0.) of_38) slbot_38) 5e-05))
; 
; =  {(((sc.vadd[4].OUT*0.84)+of.vadd[4].OUT)+sl.max.vadd[4].OUT)} {1650.}
(assert (= (+ (+ (* sc_38 0.84) of_38) sltop_38) 1650.))
(declare-fun slbot_39 () Real)
(declare-fun sltop_39 () Real)
; 
; =  {(((sc.vadd[4].OUT2*0.)+of.vadd[4].OUT2)+sl.min.vadd[4].OUT2)} {0.}
(assert (= (+ (+ (* sc_39 0.) of_39) slbot_39) 0.))
; 
; =  {(((sc.vadd[4].OUT2*1.)+of.vadd[4].OUT2)+sl.max.vadd[4].OUT2)} {5.}
(assert (= (+ (+ (* sc_39 1.) of_39) sltop_39) 5.))
(declare-fun sc_40 () Real)
(declare-fun of_40 () Real)
(declare-fun sc_41 () Real)
(declare-fun of_41 () Real)
(declare-fun sc_42 () Real)
(declare-fun of_42 () Real)
(declare-fun sc_43 () Real)
(declare-fun of_43 () Real)
(declare-fun sc_44 () Real)
(declare-fun of_44 () Real)
(declare-fun sc_45 () Real)
(declare-fun of_45 () Real)
(declare-fun sc_46 () Real)
(declare-fun of_46 () Real)
(assert (= 0. 0))
(assert (= of_41 0))
(assert (= 0. 0))
(assert (= of_44 0))
; 
; =  {sc.vadd[1].A} {(1*sc.vadd[1].B)}
(assert (= sc_43 (* 1 sc_44)))
; 
; =  {sc.vadd[1].A} {(1*sc.vadd[1].C)} {(1*sc.vadd[1].D)}
(assert (and (= sc_43 (* 1 sc_42)) (= sc_43 (* 1 sc_41))))
(assert (= (- (+ of_43 0) (+ 0 0)) 0))
(assert (= 0. 0))
; 
; =  {sc.vadd[1].OUT} {(sc.vadd[1].A*1)}
(assert (= sc_45 (* sc_43 1)))
; 
; =  {of.vadd[1].OUT} {0}
(assert (= of_45 0.))
(assert (= 0. 0))
(assert (= of_41 0))
(assert (= 0. 0))
(assert (= 0. 0))
(assert (= of_44 0))
; 
; =  {sc.vadd[1].A} {(1*sc.vadd[1].B)}
(assert (= sc_43 (* 1 sc_44)))
; 
; =  {sc.vadd[1].A} {(1*sc.vadd[1].C)} {(1*sc.vadd[1].D*1)}
(assert (and (= sc_43 (* 1 sc_42)) (= sc_43 (* (* 1 sc_41) 1))))
(assert (= (- (+ of_43 0) (+ 0 0)) 0))
(assert (= 0. 0))
; 
; =  {sc.vadd[1].OUT2} {(sc.vadd[1].A*1)}
(assert (= sc_46 (* sc_43 1)))
(assert (= of_46 0))
(assert (= 0. 0))
; 
; =  {sc.vadd[1].OUT2_0} {(sc.vadd[1].A*1)}
(assert (= sc_40 (* sc_43 1)))
; 
; =  {of.vadd[1].OUT2_0} {0}
(assert (= of_40 0.))
; 
; >=  {((sc.vadd[1].OUT2_0*0.124)+of.vadd[1].OUT2_0)} {3300.}
(assert (<= (+ (* sc_40 0.124) of_40) 3300.))
; 
; <=  {((sc.vadd[1].OUT2_0*0.124)+of.vadd[1].OUT2_0)} {0.}
(assert (>= (+ (* sc_40 0.124) of_40) 0.))
(declare-fun slbot_41 () Real)
(declare-fun sltop_41 () Real)
; 
; =  {(((sc.vadd[1].D*0.)+of.vadd[1].D)+sl.min.vadd[1].D)} {0.0001}
(assert (= (+ (+ (* sc_41 0.) of_41) slbot_41) 0.0001))
; 
; =  {(((sc.vadd[1].D*12.616)+of.vadd[1].D)+sl.max.vadd[1].D)} {3300.}
(assert (= (+ (+ (* sc_41 12.616) of_41) sltop_41) 3300.))
; 
; >=  {((sc.vadd[1].A*0.)+of.vadd[1].A)} {3300.}
(assert (<= (+ (* sc_43 0.) of_43) 3300.))
; 
; <=  {((sc.vadd[1].A*0.)+of.vadd[1].A)} {0.0001}
(assert (>= (+ (* sc_43 0.) of_43) 0.0001))
(declare-fun slbot_46 () Real)
(declare-fun sltop_46 () Real)
; 
; =  {(((sc.vadd[1].OUT2*0.)+of.vadd[1].OUT2)+sl.min.vadd[1].OUT2)} {0.}
(assert (= (+ (+ (* sc_46 0.) of_46) slbot_46) 0.))
; 
; =  {(((sc.vadd[1].OUT2*1.)+of.vadd[1].OUT2)+sl.max.vadd[1].OUT2)} {5.}
(assert (= (+ (+ (* sc_46 1.) of_46) sltop_46) 5.))
(declare-fun slbot_44 () Real)
(declare-fun sltop_44 () Real)
; 
; =  {(((sc.vadd[1].B*0.)+of.vadd[1].B)+sl.min.vadd[1].B)} {0.0001}
(assert (= (+ (+ (* sc_44 0.) of_44) slbot_44) 0.0001))
; 
; =  {(((sc.vadd[1].B*10.1)+of.vadd[1].B)+sl.max.vadd[1].B)} {3300.}
(assert (= (+ (+ (* sc_44 10.1) of_44) sltop_44) 3300.))
(declare-fun slbot_45 () Real)
(declare-fun sltop_45 () Real)
; 
; =  {(((sc.vadd[1].OUT*0.)+of.vadd[1].OUT)+sl.min.vadd[1].OUT)} {-824.99995}
(assert (= (+ (+ (* sc_45 0.) of_45) slbot_45) -824.99995))
; 
; =  {(((sc.vadd[1].OUT*12.616)+of.vadd[1].OUT)+sl.max.vadd[1].OUT)} {1649.999975}
(assert (= (+ (+ (* sc_45 12.616) of_45) sltop_45) 1649.999975))
(declare-fun slbot_46 () Real)
(declare-fun sltop_46 () Real)
; 
; =  {(((sc.vadd[1].OUT2*0.)+of.vadd[1].OUT2)+sl.min.vadd[1].OUT2)} {0.}
(assert (= (+ (+ (* sc_46 0.) of_46) slbot_46) 0.))
; 
; =  {(((sc.vadd[1].OUT2*1.)+of.vadd[1].OUT2)+sl.max.vadd[1].OUT2)} {5.}
(assert (= (+ (+ (* sc_46 1.) of_46) sltop_46) 5.))
(declare-fun sc_47 () Real)
(declare-fun of_47 () Real)
(declare-fun sc_48 () Real)
(declare-fun of_48 () Real)
; 
; =  {sc.input.V[2].O} {sc.input.V[2].X}
(assert (= sc_48 sc_47))
; 
; =  {of.input.V[2].O} {of.input.V[2].X}
(assert (= of_48 of_47))
; 
; >=  {((sc.input.V[2].X*9.26)+of.input.V[2].X)} {5.}
(assert (<= (+ (* sc_47 9.26) of_47) 5.))
; 
; <=  {((sc.input.V[2].X*9.26)+of.input.V[2].X)} {0.}
(assert (>= (+ (* sc_47 9.26) of_47) 0.))
; 
; >=  {((sc.input.V[2].O*9.26)+of.input.V[2].O)} {5.}
(assert (<= (+ (* sc_48 9.26) of_48) 5.))
; 
; <=  {((sc.input.V[2].O*9.26)+of.input.V[2].O)} {0.}
(assert (>= (+ (* sc_48 9.26) of_48) 0.))
(declare-fun sc_49 () Real)
(declare-fun of_49 () Real)
(declare-fun sc_50 () Real)
(declare-fun of_50 () Real)
; 
; =  {sc.input.V[8].O} {sc.input.V[8].X}
(assert (= sc_50 sc_49))
; 
; =  {of.input.V[8].O} {of.input.V[8].X}
(assert (= of_50 of_49))
; 
; >=  {((sc.input.V[8].X*0.)+of.input.V[8].X)} {5.}
(assert (<= (+ (* sc_49 0.) of_49) 5.))
; 
; <=  {((sc.input.V[8].X*0.)+of.input.V[8].X)} {0.}
(assert (>= (+ (* sc_49 0.) of_49) 0.))
; 
; >=  {((sc.input.V[8].O*0.)+of.input.V[8].O)} {5.}
(assert (<= (+ (* sc_50 0.) of_50) 5.))
; 
; <=  {((sc.input.V[8].O*0.)+of.input.V[8].O)} {0.}
(assert (>= (+ (* sc_50 0.) of_50) 0.))
(declare-fun sc_51 () Real)
(declare-fun of_51 () Real)
(declare-fun sc_52 () Real)
(declare-fun of_52 () Real)
; 
; =  {sc.input.V[7].O} {sc.input.V[7].X}
(assert (= sc_52 sc_51))
; 
; =  {of.input.V[7].O} {of.input.V[7].X}
(assert (= of_52 of_51))
; 
; >=  {((sc.input.V[7].X*0.)+of.input.V[7].X)} {5.}
(assert (<= (+ (* sc_51 0.) of_51) 5.))
; 
; <=  {((sc.input.V[7].X*0.)+of.input.V[7].X)} {0.}
(assert (>= (+ (* sc_51 0.) of_51) 0.))
; 
; >=  {((sc.input.V[7].O*0.)+of.input.V[7].O)} {5.}
(assert (<= (+ (* sc_52 0.) of_52) 5.))
; 
; <=  {((sc.input.V[7].O*0.)+of.input.V[7].O)} {0.}
(assert (>= (+ (* sc_52 0.) of_52) 0.))
(declare-fun sc_53 () Real)
(declare-fun of_53 () Real)
(declare-fun sc_54 () Real)
(declare-fun of_54 () Real)
; 
; =  {sc.input.V[13].O} {sc.input.V[13].X}
(assert (= sc_54 sc_53))
; 
; =  {of.input.V[13].O} {of.input.V[13].X}
(assert (= of_54 of_53))
; 
; >=  {((sc.input.V[13].X*0.595238095238)+of.input.V[13].X)} {5.}
(assert (<= (+ (* sc_53 0.595238095238) of_53) 5.))
; 
; <=  {((sc.input.V[13].X*0.595238095238)+of.input.V[13].X)} {0.}
(assert (>= (+ (* sc_53 0.595238095238) of_53) 0.))
; 
; >=  {((sc.input.V[13].O*0.595238095238)+of.input.V[13].O)} {5.}
(assert (<= (+ (* sc_54 0.595238095238) of_54) 5.))
; 
; <=  {((sc.input.V[13].O*0.595238095238)+of.input.V[13].O)} {0.}
(assert (>= (+ (* sc_54 0.595238095238) of_54) 0.))
(declare-fun sc_55 () Real)
(declare-fun of_55 () Real)
(declare-fun sc_56 () Real)
(declare-fun of_56 () Real)
; 
; =  {sc.input.V[12].O} {sc.input.V[12].X}
(assert (= sc_56 sc_55))
; 
; =  {of.input.V[12].O} {of.input.V[12].X}
(assert (= of_56 of_55))
; 
; >=  {((sc.input.V[12].X*0.124)+of.input.V[12].X)} {5.}
(assert (<= (+ (* sc_55 0.124) of_55) 5.))
; 
; <=  {((sc.input.V[12].X*0.124)+of.input.V[12].X)} {0.}
(assert (>= (+ (* sc_55 0.124) of_55) 0.))
; 
; >=  {((sc.input.V[12].O*0.124)+of.input.V[12].O)} {5.}
(assert (<= (+ (* sc_56 0.124) of_56) 5.))
; 
; <=  {((sc.input.V[12].O*0.124)+of.input.V[12].O)} {0.}
(assert (>= (+ (* sc_56 0.124) of_56) 0.))
(declare-fun sc_57 () Real)
(declare-fun of_57 () Real)
(declare-fun sc_58 () Real)
(declare-fun of_58 () Real)
; 
; =  {sc.input.V[9].O} {sc.input.V[9].X}
(assert (= sc_58 sc_57))
; 
; =  {of.input.V[9].O} {of.input.V[9].X}
(assert (= of_58 of_57))
; 
; >=  {((sc.input.V[9].X*0.)+of.input.V[9].X)} {5.}
(assert (<= (+ (* sc_57 0.) of_57) 5.))
; 
; <=  {((sc.input.V[9].X*0.)+of.input.V[9].X)} {0.}
(assert (>= (+ (* sc_57 0.) of_57) 0.))
; 
; >=  {((sc.input.V[9].O*0.)+of.input.V[9].O)} {5.}
(assert (<= (+ (* sc_58 0.) of_58) 5.))
; 
; <=  {((sc.input.V[9].O*0.)+of.input.V[9].O)} {0.}
(assert (>= (+ (* sc_58 0.) of_58) 0.))
(declare-fun sc_59 () Real)
(declare-fun of_59 () Real)
(declare-fun sc_60 () Real)
(declare-fun of_60 () Real)
; 
; =  {sc.input.V[0].O} {sc.input.V[0].X}
(assert (= sc_60 sc_59))
; 
; =  {of.input.V[0].O} {of.input.V[0].X}
(assert (= of_60 of_59))
; 
; >=  {((sc.input.V[0].X*10.1)+of.input.V[0].X)} {5.}
(assert (<= (+ (* sc_59 10.1) of_59) 5.))
; 
; <=  {((sc.input.V[0].X*10.1)+of.input.V[0].X)} {0.}
(assert (>= (+ (* sc_59 10.1) of_59) 0.))
; 
; >=  {((sc.input.V[0].O*10.1)+of.input.V[0].O)} {5.}
(assert (<= (+ (* sc_60 10.1) of_60) 5.))
; 
; <=  {((sc.input.V[0].O*10.1)+of.input.V[0].O)} {0.}
(assert (>= (+ (* sc_60 10.1) of_60) 0.))
(declare-fun sc_61 () Real)
(declare-fun of_61 () Real)
(declare-fun sc_62 () Real)
(declare-fun of_62 () Real)
; 
; =  {sc.input.V[11].O} {sc.input.V[11].X}
(assert (= sc_62 sc_61))
; 
; =  {of.input.V[11].O} {of.input.V[11].X}
(assert (= of_62 of_61))
; 
; >=  {((sc.input.V[11].X*0.256)+of.input.V[11].X)} {5.}
(assert (<= (+ (* sc_61 0.256) of_61) 5.))
; 
; <=  {((sc.input.V[11].X*0.256)+of.input.V[11].X)} {0.}
(assert (>= (+ (* sc_61 0.256) of_61) 0.))
; 
; >=  {((sc.input.V[11].O*0.256)+of.input.V[11].O)} {5.}
(assert (<= (+ (* sc_62 0.256) of_62) 5.))
; 
; <=  {((sc.input.V[11].O*0.256)+of.input.V[11].O)} {0.}
(assert (>= (+ (* sc_62 0.256) of_62) 0.))
(declare-fun sc_63 () Real)
(declare-fun of_63 () Real)
(declare-fun sc_64 () Real)
(declare-fun of_64 () Real)
; 
; =  {sc.input.V[10].O} {sc.input.V[10].X}
(assert (= sc_64 sc_63))
; 
; =  {of.input.V[10].O} {of.input.V[10].X}
(assert (= of_64 of_63))
; 
; >=  {((sc.input.V[10].X*12.616)+of.input.V[10].X)} {5.}
(assert (<= (+ (* sc_63 12.616) of_63) 5.))
; 
; <=  {((sc.input.V[10].X*12.616)+of.input.V[10].X)} {0.}
(assert (>= (+ (* sc_63 12.616) of_63) 0.))
; 
; >=  {((sc.input.V[10].O*12.616)+of.input.V[10].O)} {5.}
(assert (<= (+ (* sc_64 12.616) of_64) 5.))
; 
; <=  {((sc.input.V[10].O*12.616)+of.input.V[10].O)} {0.}
(assert (>= (+ (* sc_64 12.616) of_64) 0.))
(declare-fun sc_65 () Real)
(declare-fun of_65 () Real)
(declare-fun sc_66 () Real)
(declare-fun of_66 () Real)
; 
; =  {sc.input.V[15].O} {sc.input.V[15].X}
(assert (= sc_66 sc_65))
; 
; =  {of.input.V[15].O} {of.input.V[15].X}
(assert (= of_66 of_65))
; 
; >=  {((sc.input.V[15].X*1.)+of.input.V[15].X)} {5.}
(assert (<= (+ (* sc_65 1.) of_65) 5.))
; 
; <=  {((sc.input.V[15].X*1.)+of.input.V[15].X)} {0.}
(assert (>= (+ (* sc_65 1.) of_65) 0.))
; 
; >=  {((sc.input.V[15].O*1.)+of.input.V[15].O)} {5.}
(assert (<= (+ (* sc_66 1.) of_66) 5.))
; 
; <=  {((sc.input.V[15].O*1.)+of.input.V[15].O)} {0.}
(assert (>= (+ (* sc_66 1.) of_66) 0.))
(declare-fun sc_67 () Real)
(declare-fun of_67 () Real)
(declare-fun sc_68 () Real)
(declare-fun of_68 () Real)
; 
; =  {sc.input.V[6].O} {sc.input.V[6].X}
(assert (= sc_68 sc_67))
; 
; =  {of.input.V[6].O} {of.input.V[6].X}
(assert (= of_68 of_67))
; 
; >=  {((sc.input.V[6].X*0.)+of.input.V[6].X)} {5.}
(assert (<= (+ (* sc_67 0.) of_67) 5.))
; 
; <=  {((sc.input.V[6].X*0.)+of.input.V[6].X)} {0.}
(assert (>= (+ (* sc_67 0.) of_67) 0.))
; 
; >=  {((sc.input.V[6].O*0.)+of.input.V[6].O)} {5.}
(assert (<= (+ (* sc_68 0.) of_68) 5.))
; 
; <=  {((sc.input.V[6].O*0.)+of.input.V[6].O)} {0.}
(assert (>= (+ (* sc_68 0.) of_68) 0.))
(declare-fun sc_69 () Real)
(declare-fun of_69 () Real)
(declare-fun sc_70 () Real)
(declare-fun of_70 () Real)
; 
; =  {sc.input.V[14].O} {sc.input.V[14].X}
(assert (= sc_70 sc_69))
; 
; =  {of.input.V[14].O} {of.input.V[14].X}
(assert (= of_70 of_69))
; 
; >=  {((sc.input.V[14].X*1.)+of.input.V[14].X)} {5.}
(assert (<= (+ (* sc_69 1.) of_69) 5.))
; 
; <=  {((sc.input.V[14].X*1.)+of.input.V[14].X)} {0.}
(assert (>= (+ (* sc_69 1.) of_69) 0.))
; 
; >=  {((sc.input.V[14].O*1.)+of.input.V[14].O)} {5.}
(assert (<= (+ (* sc_70 1.) of_70) 5.))
; 
; <=  {((sc.input.V[14].O*1.)+of.input.V[14].O)} {0.}
(assert (>= (+ (* sc_70 1.) of_70) 0.))
(declare-fun sc_71 () Real)
(declare-fun of_71 () Real)
(declare-fun sc_72 () Real)
(declare-fun of_72 () Real)
; 
; =  {sc.input.V[16].O} {sc.input.V[16].X}
(assert (= sc_72 sc_71))
; 
; =  {of.input.V[16].O} {of.input.V[16].X}
(assert (= of_72 of_71))
; 
; >=  {((sc.input.V[16].X*0.0396322130628)+of.input.V[16].X)} {5.}
(assert (<= (+ (* sc_71 0.0396322130628) of_71) 5.))
; 
; <=  {((sc.input.V[16].X*0.0396322130628)+of.input.V[16].X)} {0.}
(assert (>= (+ (* sc_71 0.0396322130628) of_71) 0.))
; 
; >=  {((sc.input.V[16].O*0.0396322130628)+of.input.V[16].O)} {5.}
(assert (<= (+ (* sc_72 0.0396322130628) of_72) 5.))
; 
; <=  {((sc.input.V[16].O*0.0396322130628)+of.input.V[16].O)} {0.}
(assert (>= (+ (* sc_72 0.0396322130628) of_72) 0.))
(declare-fun sc_73 () Real)
(declare-fun of_73 () Real)
(declare-fun sc_74 () Real)
(declare-fun of_74 () Real)
; 
; =  {sc.input.V[3].O} {sc.input.V[3].X}
(assert (= sc_74 sc_73))
; 
; =  {of.input.V[3].O} {of.input.V[3].X}
(assert (= of_74 of_73))
; 
; >=  {((sc.input.V[3].X*0.)+of.input.V[3].X)} {5.}
(assert (<= (+ (* sc_73 0.) of_73) 5.))
; 
; <=  {((sc.input.V[3].X*0.)+of.input.V[3].X)} {0.}
(assert (>= (+ (* sc_73 0.) of_73) 0.))
; 
; >=  {((sc.input.V[3].O*0.)+of.input.V[3].O)} {5.}
(assert (<= (+ (* sc_74 0.) of_74) 5.))
; 
; <=  {((sc.input.V[3].O*0.)+of.input.V[3].O)} {0.}
(assert (>= (+ (* sc_74 0.) of_74) 0.))
(declare-fun sc_75 () Real)
(declare-fun of_75 () Real)
(declare-fun sc_76 () Real)
(declare-fun of_76 () Real)
; 
; =  {sc.input.V[4].O} {sc.input.V[4].X}
(assert (= sc_76 sc_75))
; 
; =  {of.input.V[4].O} {of.input.V[4].X}
(assert (= of_76 of_75))
; 
; >=  {((sc.input.V[4].X*0.)+of.input.V[4].X)} {5.}
(assert (<= (+ (* sc_75 0.) of_75) 5.))
; 
; <=  {((sc.input.V[4].X*0.)+of.input.V[4].X)} {0.}
(assert (>= (+ (* sc_75 0.) of_75) 0.))
; 
; >=  {((sc.input.V[4].O*0.)+of.input.V[4].O)} {5.}
(assert (<= (+ (* sc_76 0.) of_76) 5.))
; 
; <=  {((sc.input.V[4].O*0.)+of.input.V[4].O)} {0.}
(assert (>= (+ (* sc_76 0.) of_76) 0.))
(declare-fun sc_77 () Real)
(declare-fun of_77 () Real)
(declare-fun sc_78 () Real)
(declare-fun of_78 () Real)
; 
; =  {sc.input.V[5].O} {sc.input.V[5].X}
(assert (= sc_78 sc_77))
; 
; =  {of.input.V[5].O} {of.input.V[5].X}
(assert (= of_78 of_77))
; 
; >=  {((sc.input.V[5].X*0.)+of.input.V[5].X)} {5.}
(assert (<= (+ (* sc_77 0.) of_77) 5.))
; 
; <=  {((sc.input.V[5].X*0.)+of.input.V[5].X)} {0.}
(assert (>= (+ (* sc_77 0.) of_77) 0.))
; 
; >=  {((sc.input.V[5].O*0.)+of.input.V[5].O)} {5.}
(assert (<= (+ (* sc_78 0.) of_78) 5.))
; 
; <=  {((sc.input.V[5].O*0.)+of.input.V[5].O)} {0.}
(assert (>= (+ (* sc_78 0.) of_78) 0.))
(declare-fun sc_79 () Real)
(declare-fun of_79 () Real)
(declare-fun sc_80 () Real)
(declare-fun of_80 () Real)
; 
; =  {sc.input.V[1].O} {sc.input.V[1].X}
(assert (= sc_80 sc_79))
; 
; =  {of.input.V[1].O} {of.input.V[1].X}
(assert (= of_80 of_79))
; 
; >=  {((sc.input.V[1].X*10.1)+of.input.V[1].X)} {5.}
(assert (<= (+ (* sc_79 10.1) of_79) 5.))
; 
; <=  {((sc.input.V[1].X*10.1)+of.input.V[1].X)} {0.}
(assert (>= (+ (* sc_79 10.1) of_79) 0.))
; 
; >=  {((sc.input.V[1].O*10.1)+of.input.V[1].O)} {5.}
(assert (<= (+ (* sc_80 10.1) of_80) 5.))
; 
; <=  {((sc.input.V[1].O*10.1)+of.input.V[1].O)} {0.}
(assert (>= (+ (* sc_80 10.1) of_80) 0.))
(declare-fun sc_81 () Real)
(declare-fun of_81 () Real)
(declare-fun sc_82 () Real)
(declare-fun of_82 () Real)
(declare-fun sc_83 () Real)
(declare-fun of_83 () Real)
(assert (= of_82 0))
(assert (= of_81 0))
; 
; =  {sc.itov[2].Y} {(sc.itov[2].K*sc.itov[2].X)}
(assert (= sc_83 (* sc_82 sc_81)))
; 
; =  {of.itov[2].Y} {0}
(assert (= of_83 0.))
(declare-fun slbot_81 () Real)
(declare-fun sltop_81 () Real)
; 
; =  {(((sc.itov[2].X*0.)+of.itov[2].X)+sl.min.itov[2].X)} {0.0001}
(assert (= (+ (+ (* sc_81 0.) of_81) slbot_81) 0.0001))
; 
; =  {(((sc.itov[2].X*1.)+of.itov[2].X)+sl.max.itov[2].X)} {10.}
(assert (= (+ (+ (* sc_81 1.) of_81) sltop_81) 10.))
(declare-fun slbot_83 () Real)
(declare-fun sltop_83 () Real)
; 
; =  {(((sc.itov[2].Y*0.)+of.itov[2].Y)+sl.min.itov[2].Y)} {0.0001}
(assert (= (+ (+ (* sc_83 0.) of_83) slbot_83) 0.0001))
; 
; =  {(((sc.itov[2].Y*12.616)+of.itov[2].Y)+sl.max.itov[2].Y)} {3300.}
(assert (= (+ (+ (* sc_83 12.616) of_83) sltop_83) 3300.))
; 
; >=  {((sc.itov[2].K*12.616)+of.itov[2].K)} {330.}
(assert (<= (+ (* sc_82 12.616) of_82) 330.))
; 
; <=  {((sc.itov[2].K*12.616)+of.itov[2].K)} {1.}
(assert (>= (+ (* sc_82 12.616) of_82) 1.))
(declare-fun slbot_83 () Real)
(declare-fun sltop_83 () Real)
; 
; =  {(((sc.itov[2].Y*0.)+of.itov[2].Y)+sl.min.itov[2].Y)} {0.0001}
(assert (= (+ (+ (* sc_83 0.) of_83) slbot_83) 0.0001))
; 
; =  {(((sc.itov[2].Y*12.616)+of.itov[2].Y)+sl.max.itov[2].Y)} {3300.}
(assert (= (+ (+ (* sc_83 12.616) of_83) sltop_83) 3300.))
(declare-fun sc_84 () Real)
(declare-fun of_84 () Real)
(declare-fun sc_85 () Real)
(declare-fun of_85 () Real)
(declare-fun sc_86 () Real)
(declare-fun of_86 () Real)
(assert (= of_85 0))
(assert (= of_84 0))
; 
; =  {sc.itov[7].Y} {(sc.itov[7].K*sc.itov[7].X)}
(assert (= sc_86 (* sc_85 sc_84)))
; 
; =  {of.itov[7].Y} {0}
(assert (= of_86 0.))
(declare-fun slbot_84 () Real)
(declare-fun sltop_84 () Real)
; 
; =  {(((sc.itov[7].X*0.)+of.itov[7].X)+sl.min.itov[7].X)} {0.0001}
(assert (= (+ (+ (* sc_84 0.) of_84) slbot_84) 0.0001))
; 
; =  {(((sc.itov[7].X*1.)+of.itov[7].X)+sl.max.itov[7].X)} {10.}
(assert (= (+ (+ (* sc_84 1.) of_84) sltop_84) 10.))
(declare-fun slbot_86 () Real)
(declare-fun sltop_86 () Real)
; 
; =  {(((sc.itov[7].Y*0.)+of.itov[7].Y)+sl.min.itov[7].Y)} {0.0001}
(assert (= (+ (+ (* sc_86 0.) of_86) slbot_86) 0.0001))
; 
; =  {(((sc.itov[7].Y*12.616)+of.itov[7].Y)+sl.max.itov[7].Y)} {3300.}
(assert (= (+ (+ (* sc_86 12.616) of_86) sltop_86) 3300.))
(declare-fun slbot_85 () Real)
(declare-fun sltop_85 () Real)
; 
; =  {(((sc.itov[7].K*0.)+of.itov[7].K)+sl.min.itov[7].K)} {1.}
(assert (= (+ (+ (* sc_85 0.) of_85) slbot_85) 1.))
; 
; =  {(((sc.itov[7].K*12.616)+of.itov[7].K)+sl.max.itov[7].K)} {330.}
(assert (= (+ (+ (* sc_85 12.616) of_85) sltop_85) 330.))
(declare-fun slbot_86 () Real)
(declare-fun sltop_86 () Real)
; 
; =  {(((sc.itov[7].Y*0.)+of.itov[7].Y)+sl.min.itov[7].Y)} {0.0001}
(assert (= (+ (+ (* sc_86 0.) of_86) slbot_86) 0.0001))
; 
; =  {(((sc.itov[7].Y*12.616)+of.itov[7].Y)+sl.max.itov[7].Y)} {3300.}
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
; =  {sc.itov[0].Y} {(sc.itov[0].K*sc.itov[0].X)}
(assert (= sc_89 (* sc_88 sc_87)))
; 
; =  {of.itov[0].Y} {0}
(assert (= of_89 0.))
(declare-fun slbot_87 () Real)
(declare-fun sltop_87 () Real)
; 
; =  {(((sc.itov[0].X*0.)+of.itov[0].X)+sl.min.itov[0].X)} {0.0001}
(assert (= (+ (+ (* sc_87 0.) of_87) slbot_87) 0.0001))
; 
; =  {(((sc.itov[0].X*1.)+of.itov[0].X)+sl.max.itov[0].X)} {10.}
(assert (= (+ (+ (* sc_87 1.) of_87) sltop_87) 10.))
(declare-fun slbot_89 () Real)
(declare-fun sltop_89 () Real)
; 
; =  {(((sc.itov[0].Y*0.)+of.itov[0].Y)+sl.min.itov[0].Y)} {0.0001}
(assert (= (+ (+ (* sc_89 0.) of_89) slbot_89) 0.0001))
; 
; =  {(((sc.itov[0].Y*10.1)+of.itov[0].Y)+sl.max.itov[0].Y)} {3300.}
(assert (= (+ (+ (* sc_89 10.1) of_89) sltop_89) 3300.))
; 
; >=  {((sc.itov[0].K*10.1)+of.itov[0].K)} {330.}
(assert (<= (+ (* sc_88 10.1) of_88) 330.))
; 
; <=  {((sc.itov[0].K*10.1)+of.itov[0].K)} {1.}
(assert (>= (+ (* sc_88 10.1) of_88) 1.))
(declare-fun slbot_89 () Real)
(declare-fun sltop_89 () Real)
; 
; =  {(((sc.itov[0].Y*0.)+of.itov[0].Y)+sl.min.itov[0].Y)} {0.0001}
(assert (= (+ (+ (* sc_89 0.) of_89) slbot_89) 0.0001))
; 
; =  {(((sc.itov[0].Y*10.1)+of.itov[0].Y)+sl.max.itov[0].Y)} {3300.}
(assert (= (+ (+ (* sc_89 10.1) of_89) sltop_89) 3300.))
(declare-fun sc_90 () Real)
(declare-fun of_90 () Real)
(declare-fun sc_91 () Real)
(declare-fun of_91 () Real)
(declare-fun sc_92 () Real)
(declare-fun of_92 () Real)
(assert (= of_91 0))
(assert (= of_90 0))
; 
; =  {sc.itov[11].Y} {(sc.itov[11].K*sc.itov[11].X)}
(assert (= sc_92 (* sc_91 sc_90)))
; 
; =  {of.itov[11].Y} {0}
(assert (= of_92 0.))
(declare-fun slbot_90 () Real)
(declare-fun sltop_90 () Real)
; 
; =  {(((sc.itov[11].X*0.)+of.itov[11].X)+sl.min.itov[11].X)} {0.0001}
(assert (= (+ (+ (* sc_90 0.) of_90) slbot_90) 0.0001))
; 
; =  {(((sc.itov[11].X*1.)+of.itov[11].X)+sl.max.itov[11].X)} {10.}
(assert (= (+ (+ (* sc_90 1.) of_90) sltop_90) 10.))
(declare-fun slbot_92 () Real)
(declare-fun sltop_92 () Real)
; 
; =  {(((sc.itov[11].Y*0.)+of.itov[11].Y)+sl.min.itov[11].Y)} {0.0001}
(assert (= (+ (+ (* sc_92 0.) of_92) slbot_92) 0.0001))
; 
; =  {(((sc.itov[11].Y*9.26)+of.itov[11].Y)+sl.max.itov[11].Y)} {3300.}
(assert (= (+ (+ (* sc_92 9.26) of_92) sltop_92) 3300.))
; 
; >=  {((sc.itov[11].K*9.26)+of.itov[11].K)} {330.}
(assert (<= (+ (* sc_91 9.26) of_91) 330.))
; 
; <=  {((sc.itov[11].K*9.26)+of.itov[11].K)} {1.}
(assert (>= (+ (* sc_91 9.26) of_91) 1.))
(declare-fun slbot_92 () Real)
(declare-fun sltop_92 () Real)
; 
; =  {(((sc.itov[11].Y*0.)+of.itov[11].Y)+sl.min.itov[11].Y)} {0.0001}
(assert (= (+ (+ (* sc_92 0.) of_92) slbot_92) 0.0001))
; 
; =  {(((sc.itov[11].Y*9.26)+of.itov[11].Y)+sl.max.itov[11].Y)} {3300.}
(assert (= (+ (+ (* sc_92 9.26) of_92) sltop_92) 3300.))
(declare-fun sc_93 () Real)
(declare-fun of_93 () Real)
(declare-fun sc_94 () Real)
(declare-fun of_94 () Real)
(declare-fun sc_95 () Real)
(declare-fun of_95 () Real)
(assert (= of_94 0))
(assert (= of_93 0))
; 
; =  {sc.itov[5].Y} {(sc.itov[5].K*sc.itov[5].X)}
(assert (= sc_95 (* sc_94 sc_93)))
; 
; =  {of.itov[5].Y} {0}
(assert (= of_95 0.))
; 
; >=  {((sc.itov[5].X*50.464)+of.itov[5].X)} {10.}
(assert (<= (+ (* sc_93 50.464) of_93) 10.))
; 
; <=  {((sc.itov[5].X*50.464)+of.itov[5].X)} {0.0001}
(assert (>= (+ (* sc_93 50.464) of_93) 0.0001))
(declare-fun slbot_95 () Real)
(declare-fun sltop_95 () Real)
; 
; =  {(((sc.itov[5].Y*0.)+of.itov[5].Y)+sl.min.itov[5].Y)} {0.0001}
(assert (= (+ (+ (* sc_95 0.) of_95) slbot_95) 0.0001))
; 
; =  {(((sc.itov[5].Y*50.464)+of.itov[5].Y)+sl.max.itov[5].Y)} {3300.}
(assert (= (+ (+ (* sc_95 50.464) of_95) sltop_95) 3300.))
(declare-fun slbot_94 () Real)
(declare-fun sltop_94 () Real)
; 
; =  {(((sc.itov[5].K*0.)+of.itov[5].K)+sl.min.itov[5].K)} {1.}
(assert (= (+ (+ (* sc_94 0.) of_94) slbot_94) 1.))
; 
; =  {(((sc.itov[5].K*1.)+of.itov[5].K)+sl.max.itov[5].K)} {330.}
(assert (= (+ (+ (* sc_94 1.) of_94) sltop_94) 330.))
(declare-fun slbot_95 () Real)
(declare-fun sltop_95 () Real)
; 
; =  {(((sc.itov[5].Y*0.)+of.itov[5].Y)+sl.min.itov[5].Y)} {0.0001}
(assert (= (+ (+ (* sc_95 0.) of_95) slbot_95) 0.0001))
; 
; =  {(((sc.itov[5].Y*50.464)+of.itov[5].Y)+sl.max.itov[5].Y)} {3300.}
(assert (= (+ (+ (* sc_95 50.464) of_95) sltop_95) 3300.))
; 
; =  {sc.itov[2].Y} {sc.vadd[1].D}
(assert (= sc_83 sc_41))
; 
; =  {of.itov[2].Y} {of.vadd[1].D}
(assert (= of_83 of_41))
; 
; =  {sc.vadd[4].OUT2} {sc.output.V[0].X}
(assert (= sc_39 sc_10))
; 
; =  {of.vadd[4].OUT2} {of.output.V[0].X}
(assert (= of_39 of_10))
; 
; =  {sc.vadd[1].OUT2} {sc.vgain[9].Z}
(assert (= sc_46 sc_2))
; 
; =  {of.vadd[1].OUT2} {of.vgain[9].Z}
(assert (= of_46 of_2))
; 
; =  {sc.vadd[1].OUT2} {sc.itov[5].K}
(assert (= sc_46 sc_94))
; 
; =  {of.vadd[1].OUT2} {of.itov[5].K}
(assert (= of_46 of_94))
; 
; =  {sc.vadd[8].OUT} {sc.itov[7].K}
(assert (= sc_17 sc_85))
; 
; =  {of.vadd[8].OUT} {of.itov[7].K}
(assert (= of_17 of_85))
; 
; =  {sc.input.I[0].O} {sc.itov[5].X}
(assert (= sc_9 sc_93))
; 
; =  {of.input.I[0].O} {of.itov[5].X}
(assert (= of_9 of_93))
; 
; =  {sc.input.V[9].O} {sc.vadd[8].A}
(assert (= sc_58 sc_15))
; 
; =  {of.input.V[9].O} {of.vadd[8].A}
(assert (= of_58 of_15))
; 
; =  {sc.itov[11].Y} {sc.vadd[10].B}
(assert (= sc_92 sc_23))
; 
; =  {of.itov[11].Y} {of.vadd[10].B}
(assert (= of_92 of_23))
; 
; =  {sc.input.V[15].O} {sc.vgain[3].X}
(assert (= sc_66 sc_4))
; 
; =  {of.input.V[15].O} {of.vgain[3].X}
(assert (= of_66 of_4))
; 
; =  {sc.input.V[13].O} {sc.vgain[3].Y}
(assert (= sc_54 sc_5))
; 
; =  {of.input.V[13].O} {of.vgain[3].Y}
(assert (= of_54 of_5))
; 
; =  {sc.input.V[14].O} {sc.vgain[9].X}
(assert (= sc_70 sc_0))
; 
; =  {of.input.V[14].O} {of.vgain[9].X}
(assert (= of_70 of_0))
; 
; =  {sc.input.V[11].O} {sc.vadd[10].OUT2_0}
(assert (= sc_62 sc_19))
; 
; =  {of.input.V[11].O} {of.vadd[10].OUT2_0}
(assert (= of_62 of_19))
; 
; =  {sc.itov[5].Y} {sc.vadd[8].B}
(assert (= sc_95 sc_16))
; 
; =  {of.itov[5].Y} {of.vadd[8].B}
(assert (= of_95 of_16))
; 
; =  {sc.input.V[12].O} {sc.vadd[1].OUT2_0}
(assert (= sc_56 sc_40))
; 
; =  {of.input.V[12].O} {of.vadd[1].OUT2_0}
(assert (= of_56 of_40))
; 
; =  {sc.input.V[8].O} {sc.vadd[10].A}
(assert (= sc_50 sc_22))
; 
; =  {of.input.V[8].O} {of.vadd[10].A}
(assert (= of_50 of_22))
; 
; =  {sc.input.V[3].O} {sc.vadd[1].A}
(assert (= sc_74 sc_43))
; 
; =  {of.input.V[3].O} {of.vadd[1].A}
(assert (= of_74 of_43))
; 
; =  {sc.input.V[2].O} {sc.itov[11].K}
(assert (= sc_48 sc_91))
; 
; =  {of.input.V[2].O} {of.itov[11].K}
(assert (= of_48 of_91))
; 
; =  {sc.vgain[3].P} {sc.vadd[4].B}
(assert (= sc_7 sc_37))
; 
; =  {of.vgain[3].P} {of.vadd[4].B}
(assert (= of_7 of_37))
; 
; =  {sc.itov[7].Y} {sc.vadd[6].B}
(assert (= sc_86 sc_30))
; 
; =  {of.itov[7].Y} {of.vadd[6].B}
(assert (= of_86 of_30))
; 
; =  {sc.vgain[9].P} {sc.vadd[10].D}
(assert (= sc_3 sc_20))
; 
; =  {of.vgain[9].P} {of.vadd[10].D}
(assert (= of_3 of_20))
; 
; =  {sc.itov[0].Y} {sc.vadd[1].B}
(assert (= sc_89 sc_44))
; 
; =  {of.itov[0].Y} {of.vadd[1].B}
(assert (= of_89 of_44))
; 
; =  {sc.vadd[10].OUT2} {sc.itov[2].X}
(assert (= sc_25 sc_81))
; 
; =  {of.vadd[10].OUT2} {of.itov[2].X}
(assert (= of_25 of_81))
; 
; =  {sc.vadd[10].OUT2} {sc.itov[7].X}
(assert (= sc_25 sc_84))
; 
; =  {of.vadd[10].OUT2} {of.itov[7].X}
(assert (= of_25 of_84))
; 
; =  {sc.input.V[1].O} {sc.itov[0].K}
(assert (= sc_80 sc_88))
; 
; =  {of.input.V[1].O} {of.itov[0].K}
(assert (= of_80 of_88))
; 
; =  {sc.input.V[7].O} {sc.vadd[6].A}
(assert (= sc_52 sc_29))
; 
; =  {of.input.V[7].O} {of.vadd[6].A}
(assert (= of_52 of_29))
; 
; =  {sc.input.V[10].O} {sc.itov[2].K}
(assert (= sc_64 sc_82))
; 
; =  {of.input.V[10].O} {of.itov[2].K}
(assert (= of_64 of_82))
; 
; =  {sc.input.V[0].O} {sc.vadd[6].D}
(assert (= sc_60 sc_27))
; 
; =  {of.input.V[0].O} {of.vadd[6].D}
(assert (= of_60 of_27))
; 
; =  {sc.input.V[16].O} {sc.vgain[9].Y}
(assert (= sc_72 sc_1))
; 
; =  {of.input.V[16].O} {of.vgain[9].Y}
(assert (= of_72 of_1))
; 
; =  {sc.input.V[4].O} {sc.vadd[4].OUT2_0}
(assert (= sc_76 sc_33))
; 
; =  {of.input.V[4].O} {of.vadd[4].OUT2_0}
(assert (= of_76 of_33))
; 
; =  {sc.input.V[5].O} {sc.vadd[4].A}
(assert (= sc_78 sc_36))
; 
; =  {of.input.V[5].O} {of.vadd[4].A}
(assert (= of_78 of_36))
; 
; =  {sc.vadd[6].OUT2} {sc.vgain[3].Z}
(assert (= sc_32 sc_6))
; 
; =  {of.vadd[6].OUT2} {of.vgain[3].Z}
(assert (= of_32 of_6))
; 
; =  {sc.vadd[6].OUT2} {sc.itov[0].X}
(assert (= sc_32 sc_87))
; 
; =  {of.vadd[6].OUT2} {of.itov[0].X}
(assert (= of_32 of_87))
; 
; =  {sc.vadd[6].OUT2} {sc.itov[11].X}
(assert (= sc_32 sc_90))
; 
; =  {of.vadd[6].OUT2} {of.itov[11].X}
(assert (= of_32 of_90))
; 
; =  {sc.input.V[6].O} {sc.vadd[6].OUT2_0}
(assert (= sc_68 sc_26))
; 
; =  {of.input.V[6].O} {of.vadd[6].OUT2_0}
(assert (= of_68 of_26))
(assert (<= (* sc_11 0.001) 1.))
; 
; =  {sc.vadd[4].OUT2} {sc.output.V[0].O} {sc.vadd[10].OUT2} {sc.vadd[1].OUT2} {sc.vadd[6].OUT2}
(assert (and (and (and (= sc_39 sc_11) (= sc_39 sc_25)) (= sc_39 sc_46)) (= sc_39 sc_32)))
(assert (= __minima__ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (* (ite (>= slbot_92 0) slbot_92 (- slbot_92)) 1.) (* (ite (>= slbot_44 0) slbot_44 (- slbot_44)) 1.)) (* (ite (>= sltop_87 0) sltop_87 (- sltop_87)) 1.)) (* (ite (>= slbot_16 0) slbot_16 (- slbot_16)) 1.)) (* (ite (>= sltop_32 0) sltop_32 (- sltop_32)) 1.)) (* (ite (>= slbot_10 0) slbot_10 (- slbot_10)) 1.)) (* (ite (>= sltop_90 0) sltop_90 (- sltop_90)) 1.)) (* (ite (>= slbot_20 0) slbot_20 (- slbot_20)) 1.)) (* (ite (>= slbot_3 0) slbot_3 (- slbot_3)) 1.)) (* (ite (>= slbot_46 0) slbot_46 (- slbot_46)) 1.)) (* (ite (>= slbot_84 0) slbot_84 (- slbot_84)) 1.)) (* (ite (>= slbot_2 0) slbot_2 (- slbot_2)) 1.)) (* (ite (>= sltop_10 0) sltop_10 (- sltop_10)) 1.)) (* (ite (>= slbot_85 0) slbot_85 (- slbot_85)) 1.)) (* (ite (>= sltop_2 0) sltop_2 (- sltop_2)) 1.)) (* (ite (>= sltop_24 0) sltop_24 (- sltop_24)) 1.)) (* (ite (>= sltop_31 0) sltop_31 (- sltop_31)) 1.)) (* (ite (>= slbot_95 0) slbot_95 (- slbot_95)) 1.)) (* (ite (>= sltop_94 0) sltop_94 (- sltop_94)) 1.)) (* (ite (>= sltop_85 0) sltop_85 (- sltop_85)) 1.)) (* (ite (>= slbot_81 0) slbot_81 (- slbot_81)) 1.)) (* (ite (>= slbot_45 0) slbot_45 (- slbot_45)) 1.)) (* (ite (>= slbot_87 0) slbot_87 (- slbot_87)) 1.)) (* (ite (>= slbot_6 0) slbot_6 (- slbot_6)) 1.)) (* (ite (>= slbot_38 0) slbot_38 (- slbot_38)) 1.)) (* (ite (>= sltop_45 0) sltop_45 (- sltop_45)) 1.)) (* (ite (>= sltop_86 0) sltop_86 (- sltop_86)) 1.)) (* (ite (>= slbot_23 0) slbot_23 (- slbot_23)) 1.)) (* (ite (>= sltop_17 0) sltop_17 (- sltop_17)) 1.)) (* (ite (>= sltop_3 0) sltop_3 (- sltop_3)) 1.)) (* (ite (>= sltop_84 0) sltop_84 (- sltop_84)) 1.)) (* (ite (>= slbot_7 0) slbot_7 (- slbot_7)) 1.)) (* (ite (>= slbot_89 0) slbot_89 (- slbot_89)) 1.)) (* (ite (>= sltop_23 0) sltop_23 (- sltop_23)) 1.)) (* (ite (>= slbot_32 0) slbot_32 (- slbot_32)) 1.)) (* (ite (>= sltop_41 0) sltop_41 (- sltop_41)) 1.)) (* (ite (>= slbot_11 0) slbot_11 (- slbot_11)) 1.)) (* (ite (>= sltop_11 0) sltop_11 (- sltop_11)) 1.)) (* (ite (>= sltop_81 0) sltop_81 (- sltop_81)) 1.)) (* (ite (>= slbot_83 0) slbot_83 (- slbot_83)) 1.)) (* (ite (>= slbot_37 0) slbot_37 (- slbot_37)) 1.)) (* (ite (>= sltop_7 0) sltop_7 (- sltop_7)) 1.)) (* (ite (>= sltop_38 0) sltop_38 (- sltop_38)) 1.)) (* (ite (>= sltop_44 0) sltop_44 (- sltop_44)) 1.)) (* (ite (>= slbot_17 0) slbot_17 (- slbot_17)) 1.)) (* (ite (>= sltop_39 0) sltop_39 (- sltop_39)) 1.)) (* (ite (>= sltop_89 0) sltop_89 (- sltop_89)) 1.)) (* (ite (>= sltop_92 0) sltop_92 (- sltop_92)) 1.)) (* (ite (>= slbot_31 0) slbot_31 (- slbot_31)) 1.)) (* (ite (>= slbot_90 0) slbot_90 (- slbot_90)) 1.)) (* (ite (>= slbot_25 0) slbot_25 (- slbot_25)) 1.)) (* (ite (>= slbot_41 0) slbot_41 (- slbot_41)) 1.)) (* (ite (>= sltop_20 0) sltop_20 (- sltop_20)) 1.)) (* (ite (>= slbot_24 0) slbot_24 (- slbot_24)) 1.)) (* (ite (>= sltop_16 0) sltop_16 (- sltop_16)) 1.)) (* (ite (>= sltop_95 0) sltop_95 (- sltop_95)) 1.)) (* (ite (>= slbot_30 0) slbot_30 (- slbot_30)) 1.)) (* (ite (>= slbot_86 0) slbot_86 (- slbot_86)) 1.)) (* (ite (>= slbot_94 0) slbot_94 (- slbot_94)) 1.)) (* (ite (>= sltop_30 0) sltop_30 (- sltop_30)) 1.)) (* (ite (>= sltop_83 0) sltop_83 (- sltop_83)) 1.)) (* (ite (>= sltop_37 0) sltop_37 (- sltop_37)) 1.)) (* (ite (>= sltop_46 0) sltop_46 (- sltop_46)) 1.)) (* (ite (>= sltop_25 0) sltop_25 (- sltop_25)) 1.)) (* (ite (>= slbot_39 0) slbot_39 (- slbot_39)) 1.)) (* (ite (>= sltop_6 0) sltop_6 (- sltop_6)) 1.))))
(check-sat)