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
; 
; >=  {((sc.vgain[8].X*1.)+of.vgain[8].X)} {3300.}
(assert (<= (+ (* sc_0 1.) of_0) 3300.))
; 
; <=  {((sc.vgain[8].X*1.)+of.vgain[8].X)} {0.0001}
(assert (>= (+ (* sc_0 1.) of_0) 0.0001))
; 
; >=  {((sc.vgain[8].Y*0.00990805326569)+of.vgain[8].Y)} {3300.}
(assert (<= (+ (* sc_1 0.00990805326569) of_1) 3300.))
; 
; <=  {((sc.vgain[8].Y*0.00990805326569)+of.vgain[8].Y)} {1.}
(assert (>= (+ (* sc_1 0.00990805326569) of_1) 1.))
(declare-fun slbot_3 () Real)
(declare-fun sltop_3 () Real)
; 
; =  {(((sc.vgain[8].P*0.)+of.vgain[8].P)+sl.min.vgain[8].P)} {1.51515151515e-12}
(assert (= (+ (+ (* sc_3 0.) of_3) slbot_3) 1.51515151515e-12))
; 
; =  {(((sc.vgain[8].P*50.464)+of.vgain[8].P)+sl.max.vgain[8].P)} {5445000.}
(assert (= (+ (+ (* sc_3 50.464) of_3) sltop_3) 5445000.))
(declare-fun slbot_2 () Real)
(declare-fun sltop_2 () Real)
; 
; =  {(((sc.vgain[8].Z*0.)+of.vgain[8].Z)+sl.min.vgain[8].Z)} {0.0001}
(assert (= (+ (+ (* sc_2 0.) of_2) slbot_2) 0.0001))
; 
; =  {(((sc.vgain[8].Z*1.)+of.vgain[8].Z)+sl.max.vgain[8].Z)} {3300.}
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
; =  {sc.output.V[0].O} {sc.output.V[0].X}
(assert (= sc_13 sc_12))
; 
; =  {of.output.V[0].O} {of.output.V[0].X}
(assert (= of_13 of_12))
(declare-fun slbot_12 () Real)
(declare-fun sltop_12 () Real)
; 
; =  {(((sc.output.V[0].X*0.)+of.output.V[0].X)+sl.min.output.V[0].X)} {0.0001}
(assert (= (+ (+ (* sc_12 0.) of_12) slbot_12) 0.0001))
; 
; =  {(((sc.output.V[0].X*1.)+of.output.V[0].X)+sl.max.output.V[0].X)} {3300.}
(assert (= (+ (+ (* sc_12 1.) of_12) sltop_12) 3300.))
(declare-fun slbot_13 () Real)
(declare-fun sltop_13 () Real)
; 
; =  {(((sc.output.V[0].O*0.)+of.output.V[0].O)+sl.min.output.V[0].O)} {0.0001}
(assert (= (+ (+ (* sc_13 0.) of_13) slbot_13) 0.0001))
; 
; =  {(((sc.output.V[0].O*1.)+of.output.V[0].O)+sl.max.output.V[0].O)} {3300.}
(assert (= (+ (+ (* sc_13 1.) of_13) sltop_13) 3300.))
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
(declare-fun sc_19 () Real)
(declare-fun of_19 () Real)
(declare-fun sc_20 () Real)
(declare-fun of_20 () Real)
(assert (= 0. 0))
(assert (= of_15 0))
(assert (= 0. 0))
(assert (= of_18 0))
; 
; =  {sc.vadd[9].A} {(1*sc.vadd[9].B)}
(assert (= sc_17 (* 1 sc_18)))
; 
; =  {sc.vadd[9].A} {(1*sc.vadd[9].C)} {(1*sc.vadd[9].D)}
(assert (and (= sc_17 (* 1 sc_16)) (= sc_17 (* 1 sc_15))))
(assert (= (- (+ of_17 0) (+ 0 0)) 0))
(assert (= 0. 0))
; 
; =  {sc.vadd[9].OUT} {(sc.vadd[9].A*1)}
(assert (= sc_19 (* sc_17 1)))
; 
; =  {of.vadd[9].OUT} {0}
(assert (= of_19 0.))
(assert (= 0. 0))
(assert (= of_15 0))
(assert (= 0. 0))
(assert (= 0. 0))
(assert (= of_18 0))
; 
; =  {sc.vadd[9].A} {(1*sc.vadd[9].B)}
(assert (= sc_17 (* 1 sc_18)))
; 
; =  {sc.vadd[9].A} {(1*sc.vadd[9].C)} {(1*sc.vadd[9].D*1)}
(assert (and (= sc_17 (* 1 sc_16)) (= sc_17 (* (* 1 sc_15) 1))))
(assert (= (- (+ of_17 0) (+ 0 0)) 0))
(assert (= 0. 0))
; 
; =  {sc.vadd[9].OUT2} {(sc.vadd[9].A*1)}
(assert (= sc_20 (* sc_17 1)))
(assert (= of_20 0))
(assert (= 0. 0))
; 
; =  {sc.vadd[9].OUT2_0} {(sc.vadd[9].A*1)}
(assert (= sc_14 (* sc_17 1)))
; 
; =  {of.vadd[9].OUT2_0} {0}
(assert (= of_14 0.))
; 
; >=  {((sc.vadd[9].OUT2_0*0.)+of.vadd[9].OUT2_0)} {3300.}
(assert (<= (+ (* sc_14 0.) of_14) 3300.))
; 
; <=  {((sc.vadd[9].OUT2_0*0.)+of.vadd[9].OUT2_0)} {0.}
(assert (>= (+ (* sc_14 0.) of_14) 0.))
; 
; >=  {((sc.vadd[9].D*10.1)+of.vadd[9].D)} {3300.}
(assert (<= (+ (* sc_15 10.1) of_15) 3300.))
; 
; <=  {((sc.vadd[9].D*10.1)+of.vadd[9].D)} {0.0001}
(assert (>= (+ (* sc_15 10.1) of_15) 0.0001))
; 
; >=  {((sc.vadd[9].A*0.)+of.vadd[9].A)} {3300.}
(assert (<= (+ (* sc_17 0.) of_17) 3300.))
; 
; <=  {((sc.vadd[9].A*0.)+of.vadd[9].A)} {0.0001}
(assert (>= (+ (* sc_17 0.) of_17) 0.0001))
(declare-fun slbot_20 () Real)
(declare-fun sltop_20 () Real)
; 
; =  {(((sc.vadd[9].OUT2*0.)+of.vadd[9].OUT2)+sl.min.vadd[9].OUT2)} {0.}
(assert (= (+ (+ (* sc_20 0.) of_20) slbot_20) 0.))
; 
; =  {(((sc.vadd[9].OUT2*1.)+of.vadd[9].OUT2)+sl.max.vadd[9].OUT2)} {5.}
(assert (= (+ (+ (* sc_20 1.) of_20) sltop_20) 5.))
(declare-fun slbot_18 () Real)
(declare-fun sltop_18 () Real)
; 
; =  {(((sc.vadd[9].B*0.)+of.vadd[9].B)+sl.min.vadd[9].B)} {0.0001}
(assert (= (+ (+ (* sc_18 0.) of_18) slbot_18) 0.0001))
; 
; =  {(((sc.vadd[9].B*12.616)+of.vadd[9].B)+sl.max.vadd[9].B)} {3300.}
(assert (= (+ (+ (* sc_18 12.616) of_18) sltop_18) 3300.))
(declare-fun slbot_19 () Real)
(declare-fun sltop_19 () Real)
; 
; =  {(((sc.vadd[9].OUT*0.)+of.vadd[9].OUT)+sl.min.vadd[9].OUT)} {-824.99995}
(assert (= (+ (+ (* sc_19 0.) of_19) slbot_19) -824.99995))
; 
; =  {(((sc.vadd[9].OUT*12.616)+of.vadd[9].OUT)+sl.max.vadd[9].OUT)} {1649.999975}
(assert (= (+ (+ (* sc_19 12.616) of_19) sltop_19) 1649.999975))
(declare-fun slbot_20 () Real)
(declare-fun sltop_20 () Real)
; 
; =  {(((sc.vadd[9].OUT2*0.)+of.vadd[9].OUT2)+sl.min.vadd[9].OUT2)} {0.}
(assert (= (+ (+ (* sc_20 0.) of_20) slbot_20) 0.))
; 
; =  {(((sc.vadd[9].OUT2*1.)+of.vadd[9].OUT2)+sl.max.vadd[9].OUT2)} {5.}
(assert (= (+ (+ (* sc_20 1.) of_20) sltop_20) 5.))
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
(declare-fun sc_26 () Real)
(declare-fun of_26 () Real)
(declare-fun sc_27 () Real)
(declare-fun of_27 () Real)
(assert (= 0. 0))
(assert (= of_25 0))
; 
; =  {sc.vadd[11].A} {(1*sc.vadd[11].B)}
(assert (= sc_24 (* 1 sc_25)))
; 
; =  {sc.vadd[11].A} {(1*sc.vadd[11].C)} {(1*sc.vadd[11].D)}
(assert (and (= sc_24 (* 1 sc_23)) (= sc_24 (* 1 sc_22))))
(assert (= (- (+ of_24 0) (+ 0 0)) 0))
(assert (= 0. 0))
; 
; =  {sc.vadd[11].OUT} {(sc.vadd[11].A*1)}
(assert (= sc_26 (* sc_24 1)))
; 
; =  {of.vadd[11].OUT} {0}
(assert (= of_26 0.))
(assert (= 0. 0))
(assert (= of_25 0))
; 
; =  {sc.vadd[11].A} {(1*sc.vadd[11].B)}
(assert (= sc_24 (* 1 sc_25)))
; 
; =  {sc.vadd[11].A} {(1*sc.vadd[11].C)} {(1*sc.vadd[11].D*1)}
(assert (and (= sc_24 (* 1 sc_23)) (= sc_24 (* (* 1 sc_22) 1))))
(assert (= (- (+ of_24 0) (+ 0 0)) 0))
(assert (= 0. 0))
; 
; =  {sc.vadd[11].OUT2} {(sc.vadd[11].A*1)}
(assert (= sc_27 (* sc_24 1)))
(assert (= of_27 0))
(assert (= 0. 0))
; 
; =  {sc.vadd[11].OUT2_0} {(sc.vadd[11].A*1)}
(assert (= sc_21 (* sc_24 1)))
; 
; =  {of.vadd[11].OUT2_0} {0}
(assert (= of_21 0.))
(declare-fun slbot_26 () Real)
(declare-fun sltop_26 () Real)
; 
; =  {(((sc.vadd[11].OUT*0.)+of.vadd[11].OUT)+sl.min.vadd[11].OUT)} {5e-05}
(assert (= (+ (+ (* sc_26 0.) of_26) slbot_26) 5e-05))
; 
; =  {(((sc.vadd[11].OUT*12.616)+of.vadd[11].OUT)+sl.max.vadd[11].OUT)} {1650.}
(assert (= (+ (+ (* sc_26 12.616) of_26) sltop_26) 1650.))
; 
; >=  {((sc.vadd[11].A*0.)+of.vadd[11].A)} {3300.}
(assert (<= (+ (* sc_24 0.) of_24) 3300.))
; 
; <=  {((sc.vadd[11].A*0.)+of.vadd[11].A)} {0.0001}
(assert (>= (+ (* sc_24 0.) of_24) 0.0001))
(declare-fun slbot_25 () Real)
(declare-fun sltop_25 () Real)
; 
; =  {(((sc.vadd[11].B*0.)+of.vadd[11].B)+sl.min.vadd[11].B)} {0.0001}
(assert (= (+ (+ (* sc_25 0.) of_25) slbot_25) 0.0001))
; 
; =  {(((sc.vadd[11].B*50.464)+of.vadd[11].B)+sl.max.vadd[11].B)} {3300.}
(assert (= (+ (+ (* sc_25 50.464) of_25) sltop_25) 3300.))
(declare-fun slbot_26 () Real)
(declare-fun sltop_26 () Real)
; 
; =  {(((sc.vadd[11].OUT*0.)+of.vadd[11].OUT)+sl.min.vadd[11].OUT)} {5e-05}
(assert (= (+ (+ (* sc_26 0.) of_26) slbot_26) 5e-05))
; 
; =  {(((sc.vadd[11].OUT*12.616)+of.vadd[11].OUT)+sl.max.vadd[11].OUT)} {1650.}
(assert (= (+ (+ (* sc_26 12.616) of_26) sltop_26) 1650.))
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
(assert (= 0. 0))
(assert (= of_29 0))
(assert (= 0. 0))
(assert (= of_32 0))
; 
; =  {sc.vadd[6].A} {(1*sc.vadd[6].B)}
(assert (= sc_31 (* 1 sc_32)))
; 
; =  {sc.vadd[6].A} {(1*sc.vadd[6].C)} {(1*sc.vadd[6].D)}
(assert (and (= sc_31 (* 1 sc_30)) (= sc_31 (* 1 sc_29))))
(assert (= (- (+ of_31 0) (+ 0 0)) 0))
(assert (= 0. 0))
; 
; =  {sc.vadd[6].OUT} {(sc.vadd[6].A*1)}
(assert (= sc_33 (* sc_31 1)))
; 
; =  {of.vadd[6].OUT} {0}
(assert (= of_33 0.))
(assert (= 0. 0))
(assert (= of_29 0))
(assert (= 0. 0))
(assert (= 0. 0))
(assert (= of_32 0))
; 
; =  {sc.vadd[6].A} {(1*sc.vadd[6].B)}
(assert (= sc_31 (* 1 sc_32)))
; 
; =  {sc.vadd[6].A} {(1*sc.vadd[6].C)} {(1*sc.vadd[6].D*1)}
(assert (and (= sc_31 (* 1 sc_30)) (= sc_31 (* (* 1 sc_29) 1))))
(assert (= (- (+ of_31 0) (+ 0 0)) 0))
(assert (= 0. 0))
; 
; =  {sc.vadd[6].OUT2} {(sc.vadd[6].A*1)}
(assert (= sc_34 (* sc_31 1)))
(assert (= of_34 0))
(assert (= 0. 0))
; 
; =  {sc.vadd[6].OUT2_0} {(sc.vadd[6].A*1)}
(assert (= sc_28 (* sc_31 1)))
; 
; =  {of.vadd[6].OUT2_0} {0}
(assert (= of_28 0.))
; 
; >=  {((sc.vadd[6].OUT2_0*0.256)+of.vadd[6].OUT2_0)} {3300.}
(assert (<= (+ (* sc_28 0.256) of_28) 3300.))
; 
; <=  {((sc.vadd[6].OUT2_0*0.256)+of.vadd[6].OUT2_0)} {0.}
(assert (>= (+ (* sc_28 0.256) of_28) 0.))
(declare-fun slbot_29 () Real)
(declare-fun sltop_29 () Real)
; 
; =  {(((sc.vadd[6].D*0.)+of.vadd[6].D)+sl.min.vadd[6].D)} {0.0001}
(assert (= (+ (+ (* sc_29 0.) of_29) slbot_29) 0.0001))
; 
; =  {(((sc.vadd[6].D*12.616)+of.vadd[6].D)+sl.max.vadd[6].D)} {3300.}
(assert (= (+ (+ (* sc_29 12.616) of_29) sltop_29) 3300.))
; 
; >=  {((sc.vadd[6].A*0.)+of.vadd[6].A)} {3300.}
(assert (<= (+ (* sc_31 0.) of_31) 3300.))
; 
; <=  {((sc.vadd[6].A*0.)+of.vadd[6].A)} {0.0001}
(assert (>= (+ (* sc_31 0.) of_31) 0.0001))
(declare-fun slbot_34 () Real)
(declare-fun sltop_34 () Real)
; 
; =  {(((sc.vadd[6].OUT2*0.)+of.vadd[6].OUT2)+sl.min.vadd[6].OUT2)} {0.}
(assert (= (+ (+ (* sc_34 0.) of_34) slbot_34) 0.))
; 
; =  {(((sc.vadd[6].OUT2*1.)+of.vadd[6].OUT2)+sl.max.vadd[6].OUT2)} {5.}
(assert (= (+ (+ (* sc_34 1.) of_34) sltop_34) 5.))
(declare-fun slbot_32 () Real)
(declare-fun sltop_32 () Real)
; 
; =  {(((sc.vadd[6].B*0.)+of.vadd[6].B)+sl.min.vadd[6].B)} {0.0001}
(assert (= (+ (+ (* sc_32 0.) of_32) slbot_32) 0.0001))
; 
; =  {(((sc.vadd[6].B*9.26)+of.vadd[6].B)+sl.max.vadd[6].B)} {3300.}
(assert (= (+ (+ (* sc_32 9.26) of_32) sltop_32) 3300.))
(declare-fun slbot_33 () Real)
(declare-fun sltop_33 () Real)
; 
; =  {(((sc.vadd[6].OUT*0.)+of.vadd[6].OUT)+sl.min.vadd[6].OUT)} {-824.99995}
(assert (= (+ (+ (* sc_33 0.) of_33) slbot_33) -824.99995))
; 
; =  {(((sc.vadd[6].OUT*9.26)+of.vadd[6].OUT)+sl.max.vadd[6].OUT)} {1649.999975}
(assert (= (+ (+ (* sc_33 9.26) of_33) sltop_33) 1649.999975))
(declare-fun slbot_34 () Real)
(declare-fun sltop_34 () Real)
; 
; =  {(((sc.vadd[6].OUT2*0.)+of.vadd[6].OUT2)+sl.min.vadd[6].OUT2)} {0.}
(assert (= (+ (+ (* sc_34 0.) of_34) slbot_34) 0.))
; 
; =  {(((sc.vadd[6].OUT2*1.)+of.vadd[6].OUT2)+sl.max.vadd[6].OUT2)} {5.}
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
(assert (= 0. 0))
(assert (= of_39 0))
; 
; =  {sc.vadd[4].A} {(1*sc.vadd[4].B)}
(assert (= sc_38 (* 1 sc_39)))
; 
; =  {sc.vadd[4].A} {(1*sc.vadd[4].C)} {(1*sc.vadd[4].D)}
(assert (and (= sc_38 (* 1 sc_37)) (= sc_38 (* 1 sc_36))))
(assert (= (- (+ of_38 0) (+ 0 0)) 0))
(assert (= 0. 0))
; 
; =  {sc.vadd[4].OUT} {(sc.vadd[4].A*1)}
(assert (= sc_40 (* sc_38 1)))
; 
; =  {of.vadd[4].OUT} {0}
(assert (= of_40 0.))
(assert (= 0. 0))
(assert (= of_39 0))
; 
; =  {sc.vadd[4].A} {(1*sc.vadd[4].B)}
(assert (= sc_38 (* 1 sc_39)))
; 
; =  {sc.vadd[4].A} {(1*sc.vadd[4].C)} {(1*sc.vadd[4].D*1)}
(assert (and (= sc_38 (* 1 sc_37)) (= sc_38 (* (* 1 sc_36) 1))))
(assert (= (- (+ of_38 0) (+ 0 0)) 0))
(assert (= 0. 0))
; 
; =  {sc.vadd[4].OUT2} {(sc.vadd[4].A*1)}
(assert (= sc_41 (* sc_38 1)))
(assert (= of_41 0))
(assert (= 0. 0))
; 
; =  {sc.vadd[4].OUT2_0} {(sc.vadd[4].A*1)}
(assert (= sc_35 (* sc_38 1)))
; 
; =  {of.vadd[4].OUT2_0} {0}
(assert (= of_35 0.))
; 
; >=  {((sc.vadd[4].OUT2_0*0.)+of.vadd[4].OUT2_0)} {3300.}
(assert (<= (+ (* sc_35 0.) of_35) 3300.))
; 
; <=  {((sc.vadd[4].OUT2_0*0.)+of.vadd[4].OUT2_0)} {0.}
(assert (>= (+ (* sc_35 0.) of_35) 0.))
; 
; >=  {((sc.vadd[4].A*0.)+of.vadd[4].A)} {3300.}
(assert (<= (+ (* sc_38 0.) of_38) 3300.))
; 
; <=  {((sc.vadd[4].A*0.)+of.vadd[4].A)} {0.0001}
(assert (>= (+ (* sc_38 0.) of_38) 0.0001))
(declare-fun slbot_41 () Real)
(declare-fun sltop_41 () Real)
; 
; =  {(((sc.vadd[4].OUT2*0.)+of.vadd[4].OUT2)+sl.min.vadd[4].OUT2)} {0.}
(assert (= (+ (+ (* sc_41 0.) of_41) slbot_41) 0.))
; 
; =  {(((sc.vadd[4].OUT2*1.)+of.vadd[4].OUT2)+sl.max.vadd[4].OUT2)} {5.}
(assert (= (+ (+ (* sc_41 1.) of_41) sltop_41) 5.))
(declare-fun slbot_39 () Real)
(declare-fun sltop_39 () Real)
; 
; =  {(((sc.vadd[4].B*0.)+of.vadd[4].B)+sl.min.vadd[4].B)} {0.0001}
(assert (= (+ (+ (* sc_39 0.) of_39) slbot_39) 0.0001))
; 
; =  {(((sc.vadd[4].B*0.84)+of.vadd[4].B)+sl.max.vadd[4].B)} {3300.}
(assert (= (+ (+ (* sc_39 0.84) of_39) sltop_39) 3300.))
(declare-fun slbot_40 () Real)
(declare-fun sltop_40 () Real)
; 
; =  {(((sc.vadd[4].OUT*0.)+of.vadd[4].OUT)+sl.min.vadd[4].OUT)} {5e-05}
(assert (= (+ (+ (* sc_40 0.) of_40) slbot_40) 5e-05))
; 
; =  {(((sc.vadd[4].OUT*0.84)+of.vadd[4].OUT)+sl.max.vadd[4].OUT)} {1650.}
(assert (= (+ (+ (* sc_40 0.84) of_40) sltop_40) 1650.))
(declare-fun slbot_41 () Real)
(declare-fun sltop_41 () Real)
; 
; =  {(((sc.vadd[4].OUT2*0.)+of.vadd[4].OUT2)+sl.min.vadd[4].OUT2)} {0.}
(assert (= (+ (+ (* sc_41 0.) of_41) slbot_41) 0.))
; 
; =  {(((sc.vadd[4].OUT2*1.)+of.vadd[4].OUT2)+sl.max.vadd[4].OUT2)} {5.}
(assert (= (+ (+ (* sc_41 1.) of_41) sltop_41) 5.))
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
(declare-fun sc_47 () Real)
(declare-fun of_47 () Real)
(declare-fun sc_48 () Real)
(declare-fun of_48 () Real)
(assert (= 0. 0))
(assert (= of_43 0))
(assert (= 0. 0))
(assert (= of_46 0))
; 
; =  {sc.vadd[1].A} {(1*sc.vadd[1].B)}
(assert (= sc_45 (* 1 sc_46)))
; 
; =  {sc.vadd[1].A} {(1*sc.vadd[1].C)} {(1*sc.vadd[1].D)}
(assert (and (= sc_45 (* 1 sc_44)) (= sc_45 (* 1 sc_43))))
(assert (= (- (+ of_45 0) (+ 0 0)) 0))
(assert (= 0. 0))
; 
; =  {sc.vadd[1].OUT} {(sc.vadd[1].A*1)}
(assert (= sc_47 (* sc_45 1)))
; 
; =  {of.vadd[1].OUT} {0}
(assert (= of_47 0.))
(assert (= 0. 0))
(assert (= of_43 0))
(assert (= 0. 0))
(assert (= 0. 0))
(assert (= of_46 0))
; 
; =  {sc.vadd[1].A} {(1*sc.vadd[1].B)}
(assert (= sc_45 (* 1 sc_46)))
; 
; =  {sc.vadd[1].A} {(1*sc.vadd[1].C)} {(1*sc.vadd[1].D*1)}
(assert (and (= sc_45 (* 1 sc_44)) (= sc_45 (* (* 1 sc_43) 1))))
(assert (= (- (+ of_45 0) (+ 0 0)) 0))
(assert (= 0. 0))
; 
; =  {sc.vadd[1].OUT2} {(sc.vadd[1].A*1)}
(assert (= sc_48 (* sc_45 1)))
(assert (= of_48 0))
(assert (= 0. 0))
; 
; =  {sc.vadd[1].OUT2_0} {(sc.vadd[1].A*1)}
(assert (= sc_42 (* sc_45 1)))
; 
; =  {of.vadd[1].OUT2_0} {0}
(assert (= of_42 0.))
; 
; >=  {((sc.vadd[1].OUT2_0*0.124)+of.vadd[1].OUT2_0)} {3300.}
(assert (<= (+ (* sc_42 0.124) of_42) 3300.))
; 
; <=  {((sc.vadd[1].OUT2_0*0.124)+of.vadd[1].OUT2_0)} {0.}
(assert (>= (+ (* sc_42 0.124) of_42) 0.))
(declare-fun slbot_43 () Real)
(declare-fun sltop_43 () Real)
; 
; =  {(((sc.vadd[1].D*0.)+of.vadd[1].D)+sl.min.vadd[1].D)} {0.0001}
(assert (= (+ (+ (* sc_43 0.) of_43) slbot_43) 0.0001))
; 
; =  {(((sc.vadd[1].D*12.616)+of.vadd[1].D)+sl.max.vadd[1].D)} {3300.}
(assert (= (+ (+ (* sc_43 12.616) of_43) sltop_43) 3300.))
; 
; >=  {((sc.vadd[1].A*0.)+of.vadd[1].A)} {3300.}
(assert (<= (+ (* sc_45 0.) of_45) 3300.))
; 
; <=  {((sc.vadd[1].A*0.)+of.vadd[1].A)} {0.0001}
(assert (>= (+ (* sc_45 0.) of_45) 0.0001))
(declare-fun slbot_48 () Real)
(declare-fun sltop_48 () Real)
; 
; =  {(((sc.vadd[1].OUT2*0.)+of.vadd[1].OUT2)+sl.min.vadd[1].OUT2)} {0.}
(assert (= (+ (+ (* sc_48 0.) of_48) slbot_48) 0.))
; 
; =  {(((sc.vadd[1].OUT2*1.)+of.vadd[1].OUT2)+sl.max.vadd[1].OUT2)} {5.}
(assert (= (+ (+ (* sc_48 1.) of_48) sltop_48) 5.))
(declare-fun slbot_46 () Real)
(declare-fun sltop_46 () Real)
; 
; =  {(((sc.vadd[1].B*0.)+of.vadd[1].B)+sl.min.vadd[1].B)} {0.0001}
(assert (= (+ (+ (* sc_46 0.) of_46) slbot_46) 0.0001))
; 
; =  {(((sc.vadd[1].B*10.1)+of.vadd[1].B)+sl.max.vadd[1].B)} {3300.}
(assert (= (+ (+ (* sc_46 10.1) of_46) sltop_46) 3300.))
(declare-fun slbot_47 () Real)
(declare-fun sltop_47 () Real)
; 
; =  {(((sc.vadd[1].OUT*0.)+of.vadd[1].OUT)+sl.min.vadd[1].OUT)} {-824.99995}
(assert (= (+ (+ (* sc_47 0.) of_47) slbot_47) -824.99995))
; 
; =  {(((sc.vadd[1].OUT*12.616)+of.vadd[1].OUT)+sl.max.vadd[1].OUT)} {1649.999975}
(assert (= (+ (+ (* sc_47 12.616) of_47) sltop_47) 1649.999975))
(declare-fun slbot_48 () Real)
(declare-fun sltop_48 () Real)
; 
; =  {(((sc.vadd[1].OUT2*0.)+of.vadd[1].OUT2)+sl.min.vadd[1].OUT2)} {0.}
(assert (= (+ (+ (* sc_48 0.) of_48) slbot_48) 0.))
; 
; =  {(((sc.vadd[1].OUT2*1.)+of.vadd[1].OUT2)+sl.max.vadd[1].OUT2)} {5.}
(assert (= (+ (+ (* sc_48 1.) of_48) sltop_48) 5.))
(declare-fun sc_49 () Real)
(declare-fun of_49 () Real)
(declare-fun sc_50 () Real)
(declare-fun of_50 () Real)
; 
; =  {sc.input.V[2].O} {sc.input.V[2].X}
(assert (= sc_50 sc_49))
; 
; =  {of.input.V[2].O} {of.input.V[2].X}
(assert (= of_50 of_49))
; 
; >=  {((sc.input.V[2].X*0.00990805326569)+of.input.V[2].X)} {5.}
(assert (<= (+ (* sc_49 0.00990805326569) of_49) 5.))
; 
; <=  {((sc.input.V[2].X*0.00990805326569)+of.input.V[2].X)} {0.}
(assert (>= (+ (* sc_49 0.00990805326569) of_49) 0.))
; 
; >=  {((sc.input.V[2].O*0.00990805326569)+of.input.V[2].O)} {5.}
(assert (<= (+ (* sc_50 0.00990805326569) of_50) 5.))
; 
; <=  {((sc.input.V[2].O*0.00990805326569)+of.input.V[2].O)} {0.}
(assert (>= (+ (* sc_50 0.00990805326569) of_50) 0.))
(declare-fun sc_51 () Real)
(declare-fun of_51 () Real)
(declare-fun sc_52 () Real)
(declare-fun of_52 () Real)
; 
; =  {sc.input.V[8].O} {sc.input.V[8].X}
(assert (= sc_52 sc_51))
; 
; =  {of.input.V[8].O} {of.input.V[8].X}
(assert (= of_52 of_51))
; 
; >=  {((sc.input.V[8].X*0.)+of.input.V[8].X)} {5.}
(assert (<= (+ (* sc_51 0.) of_51) 5.))
; 
; <=  {((sc.input.V[8].X*0.)+of.input.V[8].X)} {0.}
(assert (>= (+ (* sc_51 0.) of_51) 0.))
; 
; >=  {((sc.input.V[8].O*0.)+of.input.V[8].O)} {5.}
(assert (<= (+ (* sc_52 0.) of_52) 5.))
; 
; <=  {((sc.input.V[8].O*0.)+of.input.V[8].O)} {0.}
(assert (>= (+ (* sc_52 0.) of_52) 0.))
(declare-fun sc_53 () Real)
(declare-fun of_53 () Real)
(declare-fun sc_54 () Real)
(declare-fun of_54 () Real)
; 
; =  {sc.input.V[7].O} {sc.input.V[7].X}
(assert (= sc_54 sc_53))
; 
; =  {of.input.V[7].O} {of.input.V[7].X}
(assert (= of_54 of_53))
; 
; >=  {((sc.input.V[7].X*0.)+of.input.V[7].X)} {5.}
(assert (<= (+ (* sc_53 0.) of_53) 5.))
; 
; <=  {((sc.input.V[7].X*0.)+of.input.V[7].X)} {0.}
(assert (>= (+ (* sc_53 0.) of_53) 0.))
; 
; >=  {((sc.input.V[7].O*0.)+of.input.V[7].O)} {5.}
(assert (<= (+ (* sc_54 0.) of_54) 5.))
; 
; <=  {((sc.input.V[7].O*0.)+of.input.V[7].O)} {0.}
(assert (>= (+ (* sc_54 0.) of_54) 0.))
(declare-fun sc_55 () Real)
(declare-fun of_55 () Real)
(declare-fun sc_56 () Real)
(declare-fun of_56 () Real)
; 
; =  {sc.input.V[13].O} {sc.input.V[13].X}
(assert (= sc_56 sc_55))
; 
; =  {of.input.V[13].O} {of.input.V[13].X}
(assert (= of_56 of_55))
; 
; >=  {((sc.input.V[13].X*0.124)+of.input.V[13].X)} {5.}
(assert (<= (+ (* sc_55 0.124) of_55) 5.))
; 
; <=  {((sc.input.V[13].X*0.124)+of.input.V[13].X)} {0.}
(assert (>= (+ (* sc_55 0.124) of_55) 0.))
; 
; >=  {((sc.input.V[13].O*0.124)+of.input.V[13].O)} {5.}
(assert (<= (+ (* sc_56 0.124) of_56) 5.))
; 
; <=  {((sc.input.V[13].O*0.124)+of.input.V[13].O)} {0.}
(assert (>= (+ (* sc_56 0.124) of_56) 0.))
(declare-fun sc_57 () Real)
(declare-fun of_57 () Real)
(declare-fun sc_58 () Real)
(declare-fun of_58 () Real)
; 
; =  {sc.input.V[12].O} {sc.input.V[12].X}
(assert (= sc_58 sc_57))
; 
; =  {of.input.V[12].O} {of.input.V[12].X}
(assert (= of_58 of_57))
; 
; >=  {((sc.input.V[12].X*0.256)+of.input.V[12].X)} {5.}
(assert (<= (+ (* sc_57 0.256) of_57) 5.))
; 
; <=  {((sc.input.V[12].X*0.256)+of.input.V[12].X)} {0.}
(assert (>= (+ (* sc_57 0.256) of_57) 0.))
; 
; >=  {((sc.input.V[12].O*0.256)+of.input.V[12].O)} {5.}
(assert (<= (+ (* sc_58 0.256) of_58) 5.))
; 
; <=  {((sc.input.V[12].O*0.256)+of.input.V[12].O)} {0.}
(assert (>= (+ (* sc_58 0.256) of_58) 0.))
(declare-fun sc_59 () Real)
(declare-fun of_59 () Real)
(declare-fun sc_60 () Real)
(declare-fun of_60 () Real)
; 
; =  {sc.input.V[9].O} {sc.input.V[9].X}
(assert (= sc_60 sc_59))
; 
; =  {of.input.V[9].O} {of.input.V[9].X}
(assert (= of_60 of_59))
; 
; >=  {((sc.input.V[9].X*0.)+of.input.V[9].X)} {5.}
(assert (<= (+ (* sc_59 0.) of_59) 5.))
; 
; <=  {((sc.input.V[9].X*0.)+of.input.V[9].X)} {0.}
(assert (>= (+ (* sc_59 0.) of_59) 0.))
; 
; >=  {((sc.input.V[9].O*0.)+of.input.V[9].O)} {5.}
(assert (<= (+ (* sc_60 0.) of_60) 5.))
; 
; <=  {((sc.input.V[9].O*0.)+of.input.V[9].O)} {0.}
(assert (>= (+ (* sc_60 0.) of_60) 0.))
(declare-fun sc_61 () Real)
(declare-fun of_61 () Real)
(declare-fun sc_62 () Real)
(declare-fun of_62 () Real)
; 
; =  {sc.input.V[0].O} {sc.input.V[0].X}
(assert (= sc_62 sc_61))
; 
; =  {of.input.V[0].O} {of.input.V[0].X}
(assert (= of_62 of_61))
; 
; >=  {((sc.input.V[0].X*10.1)+of.input.V[0].X)} {5.}
(assert (<= (+ (* sc_61 10.1) of_61) 5.))
; 
; <=  {((sc.input.V[0].X*10.1)+of.input.V[0].X)} {0.}
(assert (>= (+ (* sc_61 10.1) of_61) 0.))
; 
; >=  {((sc.input.V[0].O*10.1)+of.input.V[0].O)} {5.}
(assert (<= (+ (* sc_62 10.1) of_62) 5.))
; 
; <=  {((sc.input.V[0].O*10.1)+of.input.V[0].O)} {0.}
(assert (>= (+ (* sc_62 10.1) of_62) 0.))
(declare-fun sc_63 () Real)
(declare-fun of_63 () Real)
(declare-fun sc_64 () Real)
(declare-fun of_64 () Real)
; 
; =  {sc.input.V[11].O} {sc.input.V[11].X}
(assert (= sc_64 sc_63))
; 
; =  {of.input.V[11].O} {of.input.V[11].X}
(assert (= of_64 of_63))
; 
; >=  {((sc.input.V[11].X*12.616)+of.input.V[11].X)} {5.}
(assert (<= (+ (* sc_63 12.616) of_63) 5.))
; 
; <=  {((sc.input.V[11].X*12.616)+of.input.V[11].X)} {0.}
(assert (>= (+ (* sc_63 12.616) of_63) 0.))
; 
; >=  {((sc.input.V[11].O*12.616)+of.input.V[11].O)} {5.}
(assert (<= (+ (* sc_64 12.616) of_64) 5.))
; 
; <=  {((sc.input.V[11].O*12.616)+of.input.V[11].O)} {0.}
(assert (>= (+ (* sc_64 12.616) of_64) 0.))
(declare-fun sc_65 () Real)
(declare-fun of_65 () Real)
(declare-fun sc_66 () Real)
(declare-fun of_66 () Real)
; 
; =  {sc.input.V[10].O} {sc.input.V[10].X}
(assert (= sc_66 sc_65))
; 
; =  {of.input.V[10].O} {of.input.V[10].X}
(assert (= of_66 of_65))
; 
; >=  {((sc.input.V[10].X*0.)+of.input.V[10].X)} {5.}
(assert (<= (+ (* sc_65 0.) of_65) 5.))
; 
; <=  {((sc.input.V[10].X*0.)+of.input.V[10].X)} {0.}
(assert (>= (+ (* sc_65 0.) of_65) 0.))
; 
; >=  {((sc.input.V[10].O*0.)+of.input.V[10].O)} {5.}
(assert (<= (+ (* sc_66 0.) of_66) 5.))
; 
; <=  {((sc.input.V[10].O*0.)+of.input.V[10].O)} {0.}
(assert (>= (+ (* sc_66 0.) of_66) 0.))
(declare-fun sc_67 () Real)
(declare-fun of_67 () Real)
(declare-fun sc_68 () Real)
(declare-fun of_68 () Real)
; 
; =  {sc.input.V[15].O} {sc.input.V[15].X}
(assert (= sc_68 sc_67))
; 
; =  {of.input.V[15].O} {of.input.V[15].X}
(assert (= of_68 of_67))
; 
; >=  {((sc.input.V[15].X*1.)+of.input.V[15].X)} {5.}
(assert (<= (+ (* sc_67 1.) of_67) 5.))
; 
; <=  {((sc.input.V[15].X*1.)+of.input.V[15].X)} {0.}
(assert (>= (+ (* sc_67 1.) of_67) 0.))
; 
; >=  {((sc.input.V[15].O*1.)+of.input.V[15].O)} {5.}
(assert (<= (+ (* sc_68 1.) of_68) 5.))
; 
; <=  {((sc.input.V[15].O*1.)+of.input.V[15].O)} {0.}
(assert (>= (+ (* sc_68 1.) of_68) 0.))
(declare-fun sc_69 () Real)
(declare-fun of_69 () Real)
(declare-fun sc_70 () Real)
(declare-fun of_70 () Real)
; 
; =  {sc.input.V[6].O} {sc.input.V[6].X}
(assert (= sc_70 sc_69))
; 
; =  {of.input.V[6].O} {of.input.V[6].X}
(assert (= of_70 of_69))
; 
; >=  {((sc.input.V[6].X*0.)+of.input.V[6].X)} {5.}
(assert (<= (+ (* sc_69 0.) of_69) 5.))
; 
; <=  {((sc.input.V[6].X*0.)+of.input.V[6].X)} {0.}
(assert (>= (+ (* sc_69 0.) of_69) 0.))
; 
; >=  {((sc.input.V[6].O*0.)+of.input.V[6].O)} {5.}
(assert (<= (+ (* sc_70 0.) of_70) 5.))
; 
; <=  {((sc.input.V[6].O*0.)+of.input.V[6].O)} {0.}
(assert (>= (+ (* sc_70 0.) of_70) 0.))
(declare-fun sc_71 () Real)
(declare-fun of_71 () Real)
(declare-fun sc_72 () Real)
(declare-fun of_72 () Real)
; 
; =  {sc.input.V[14].O} {sc.input.V[14].X}
(assert (= sc_72 sc_71))
; 
; =  {of.input.V[14].O} {of.input.V[14].X}
(assert (= of_72 of_71))
; 
; >=  {((sc.input.V[14].X*0.595238095238)+of.input.V[14].X)} {5.}
(assert (<= (+ (* sc_71 0.595238095238) of_71) 5.))
; 
; <=  {((sc.input.V[14].X*0.595238095238)+of.input.V[14].X)} {0.}
(assert (>= (+ (* sc_71 0.595238095238) of_71) 0.))
; 
; >=  {((sc.input.V[14].O*0.595238095238)+of.input.V[14].O)} {5.}
(assert (<= (+ (* sc_72 0.595238095238) of_72) 5.))
; 
; <=  {((sc.input.V[14].O*0.595238095238)+of.input.V[14].O)} {0.}
(assert (>= (+ (* sc_72 0.595238095238) of_72) 0.))
(declare-fun sc_73 () Real)
(declare-fun of_73 () Real)
(declare-fun sc_74 () Real)
(declare-fun of_74 () Real)
; 
; =  {sc.input.V[16].O} {sc.input.V[16].X}
(assert (= sc_74 sc_73))
; 
; =  {of.input.V[16].O} {of.input.V[16].X}
(assert (= of_74 of_73))
; 
; >=  {((sc.input.V[16].X*1.)+of.input.V[16].X)} {5.}
(assert (<= (+ (* sc_73 1.) of_73) 5.))
; 
; <=  {((sc.input.V[16].X*1.)+of.input.V[16].X)} {0.}
(assert (>= (+ (* sc_73 1.) of_73) 0.))
; 
; >=  {((sc.input.V[16].O*1.)+of.input.V[16].O)} {5.}
(assert (<= (+ (* sc_74 1.) of_74) 5.))
; 
; <=  {((sc.input.V[16].O*1.)+of.input.V[16].O)} {0.}
(assert (>= (+ (* sc_74 1.) of_74) 0.))
(declare-fun sc_75 () Real)
(declare-fun of_75 () Real)
(declare-fun sc_76 () Real)
(declare-fun of_76 () Real)
; 
; =  {sc.input.V[3].O} {sc.input.V[3].X}
(assert (= sc_76 sc_75))
; 
; =  {of.input.V[3].O} {of.input.V[3].X}
(assert (= of_76 of_75))
; 
; >=  {((sc.input.V[3].X*9.26)+of.input.V[3].X)} {5.}
(assert (<= (+ (* sc_75 9.26) of_75) 5.))
; 
; <=  {((sc.input.V[3].X*9.26)+of.input.V[3].X)} {0.}
(assert (>= (+ (* sc_75 9.26) of_75) 0.))
; 
; >=  {((sc.input.V[3].O*9.26)+of.input.V[3].O)} {5.}
(assert (<= (+ (* sc_76 9.26) of_76) 5.))
; 
; <=  {((sc.input.V[3].O*9.26)+of.input.V[3].O)} {0.}
(assert (>= (+ (* sc_76 9.26) of_76) 0.))
(declare-fun sc_77 () Real)
(declare-fun of_77 () Real)
(declare-fun sc_78 () Real)
(declare-fun of_78 () Real)
; 
; =  {sc.input.V[4].O} {sc.input.V[4].X}
(assert (= sc_78 sc_77))
; 
; =  {of.input.V[4].O} {of.input.V[4].X}
(assert (= of_78 of_77))
; 
; >=  {((sc.input.V[4].X*0.)+of.input.V[4].X)} {5.}
(assert (<= (+ (* sc_77 0.) of_77) 5.))
; 
; <=  {((sc.input.V[4].X*0.)+of.input.V[4].X)} {0.}
(assert (>= (+ (* sc_77 0.) of_77) 0.))
; 
; >=  {((sc.input.V[4].O*0.)+of.input.V[4].O)} {5.}
(assert (<= (+ (* sc_78 0.) of_78) 5.))
; 
; <=  {((sc.input.V[4].O*0.)+of.input.V[4].O)} {0.}
(assert (>= (+ (* sc_78 0.) of_78) 0.))
(declare-fun sc_79 () Real)
(declare-fun of_79 () Real)
(declare-fun sc_80 () Real)
(declare-fun of_80 () Real)
; 
; =  {sc.input.V[5].O} {sc.input.V[5].X}
(assert (= sc_80 sc_79))
; 
; =  {of.input.V[5].O} {of.input.V[5].X}
(assert (= of_80 of_79))
; 
; >=  {((sc.input.V[5].X*0.)+of.input.V[5].X)} {5.}
(assert (<= (+ (* sc_79 0.) of_79) 5.))
; 
; <=  {((sc.input.V[5].X*0.)+of.input.V[5].X)} {0.}
(assert (>= (+ (* sc_79 0.) of_79) 0.))
; 
; >=  {((sc.input.V[5].O*0.)+of.input.V[5].O)} {5.}
(assert (<= (+ (* sc_80 0.) of_80) 5.))
; 
; <=  {((sc.input.V[5].O*0.)+of.input.V[5].O)} {0.}
(assert (>= (+ (* sc_80 0.) of_80) 0.))
(declare-fun sc_81 () Real)
(declare-fun of_81 () Real)
(declare-fun sc_82 () Real)
(declare-fun of_82 () Real)
; 
; =  {sc.input.V[1].O} {sc.input.V[1].X}
(assert (= sc_82 sc_81))
; 
; =  {of.input.V[1].O} {of.input.V[1].X}
(assert (= of_82 of_81))
; 
; >=  {((sc.input.V[1].X*10.1)+of.input.V[1].X)} {5.}
(assert (<= (+ (* sc_81 10.1) of_81) 5.))
; 
; <=  {((sc.input.V[1].X*10.1)+of.input.V[1].X)} {0.}
(assert (>= (+ (* sc_81 10.1) of_81) 0.))
; 
; >=  {((sc.input.V[1].O*10.1)+of.input.V[1].O)} {5.}
(assert (<= (+ (* sc_82 10.1) of_82) 5.))
; 
; <=  {((sc.input.V[1].O*10.1)+of.input.V[1].O)} {0.}
(assert (>= (+ (* sc_82 10.1) of_82) 0.))
(declare-fun sc_83 () Real)
(declare-fun of_83 () Real)
(declare-fun sc_84 () Real)
(declare-fun of_84 () Real)
; 
; =  {sc.input.V[17].O} {sc.input.V[17].X}
(assert (= sc_84 sc_83))
; 
; =  {of.input.V[17].O} {of.input.V[17].X}
(assert (= of_84 of_83))
; 
; >=  {((sc.input.V[17].X*1.)+of.input.V[17].X)} {5.}
(assert (<= (+ (* sc_83 1.) of_83) 5.))
; 
; <=  {((sc.input.V[17].X*1.)+of.input.V[17].X)} {0.}
(assert (>= (+ (* sc_83 1.) of_83) 0.))
; 
; >=  {((sc.input.V[17].O*1.)+of.input.V[17].O)} {5.}
(assert (<= (+ (* sc_84 1.) of_84) 5.))
; 
; <=  {((sc.input.V[17].O*1.)+of.input.V[17].O)} {0.}
(assert (>= (+ (* sc_84 1.) of_84) 0.))
(declare-fun sc_85 () Real)
(declare-fun of_85 () Real)
(declare-fun sc_86 () Real)
(declare-fun of_86 () Real)
; 
; =  {sc.input.V[18].O} {sc.input.V[18].X}
(assert (= sc_86 sc_85))
; 
; =  {of.input.V[18].O} {of.input.V[18].X}
(assert (= of_86 of_85))
; 
; >=  {((sc.input.V[18].X*0.0396322130628)+of.input.V[18].X)} {5.}
(assert (<= (+ (* sc_85 0.0396322130628) of_85) 5.))
; 
; <=  {((sc.input.V[18].X*0.0396322130628)+of.input.V[18].X)} {0.}
(assert (>= (+ (* sc_85 0.0396322130628) of_85) 0.))
; 
; >=  {((sc.input.V[18].O*0.0396322130628)+of.input.V[18].O)} {5.}
(assert (<= (+ (* sc_86 0.0396322130628) of_86) 5.))
; 
; <=  {((sc.input.V[18].O*0.0396322130628)+of.input.V[18].O)} {0.}
(assert (>= (+ (* sc_86 0.0396322130628) of_86) 0.))
(declare-fun sc_87 () Real)
(declare-fun of_87 () Real)
(declare-fun sc_88 () Real)
(declare-fun of_88 () Real)
(declare-fun sc_89 () Real)
(declare-fun of_89 () Real)
(assert (= of_88 0))
(assert (= of_87 0))
; 
; =  {sc.itov[2].Y} {(sc.itov[2].K*sc.itov[2].X)}
(assert (= sc_89 (* sc_88 sc_87)))
; 
; =  {of.itov[2].Y} {0}
(assert (= of_89 0.))
(declare-fun slbot_87 () Real)
(declare-fun sltop_87 () Real)
; 
; =  {(((sc.itov[2].X*0.)+of.itov[2].X)+sl.min.itov[2].X)} {0.0001}
(assert (= (+ (+ (* sc_87 0.) of_87) slbot_87) 0.0001))
; 
; =  {(((sc.itov[2].X*1.)+of.itov[2].X)+sl.max.itov[2].X)} {10.}
(assert (= (+ (+ (* sc_87 1.) of_87) sltop_87) 10.))
(declare-fun slbot_89 () Real)
(declare-fun sltop_89 () Real)
; 
; =  {(((sc.itov[2].Y*0.)+of.itov[2].Y)+sl.min.itov[2].Y)} {0.0001}
(assert (= (+ (+ (* sc_89 0.) of_89) slbot_89) 0.0001))
; 
; =  {(((sc.itov[2].Y*12.616)+of.itov[2].Y)+sl.max.itov[2].Y)} {3300.}
(assert (= (+ (+ (* sc_89 12.616) of_89) sltop_89) 3300.))
; 
; >=  {((sc.itov[2].K*12.616)+of.itov[2].K)} {330.}
(assert (<= (+ (* sc_88 12.616) of_88) 330.))
; 
; <=  {((sc.itov[2].K*12.616)+of.itov[2].K)} {1.}
(assert (>= (+ (* sc_88 12.616) of_88) 1.))
(declare-fun slbot_89 () Real)
(declare-fun sltop_89 () Real)
; 
; =  {(((sc.itov[2].Y*0.)+of.itov[2].Y)+sl.min.itov[2].Y)} {0.0001}
(assert (= (+ (+ (* sc_89 0.) of_89) slbot_89) 0.0001))
; 
; =  {(((sc.itov[2].Y*12.616)+of.itov[2].Y)+sl.max.itov[2].Y)} {3300.}
(assert (= (+ (+ (* sc_89 12.616) of_89) sltop_89) 3300.))
(declare-fun sc_90 () Real)
(declare-fun of_90 () Real)
(declare-fun sc_91 () Real)
(declare-fun of_91 () Real)
(declare-fun sc_92 () Real)
(declare-fun of_92 () Real)
(assert (= of_91 0))
(assert (= of_90 0))
; 
; =  {sc.itov[7].Y} {(sc.itov[7].K*sc.itov[7].X)}
(assert (= sc_92 (* sc_91 sc_90)))
; 
; =  {of.itov[7].Y} {0}
(assert (= of_92 0.))
(declare-fun slbot_90 () Real)
(declare-fun sltop_90 () Real)
; 
; =  {(((sc.itov[7].X*0.)+of.itov[7].X)+sl.min.itov[7].X)} {0.0001}
(assert (= (+ (+ (* sc_90 0.) of_90) slbot_90) 0.0001))
; 
; =  {(((sc.itov[7].X*1.)+of.itov[7].X)+sl.max.itov[7].X)} {10.}
(assert (= (+ (+ (* sc_90 1.) of_90) sltop_90) 10.))
(declare-fun slbot_92 () Real)
(declare-fun sltop_92 () Real)
; 
; =  {(((sc.itov[7].Y*0.)+of.itov[7].Y)+sl.min.itov[7].Y)} {0.0001}
(assert (= (+ (+ (* sc_92 0.) of_92) slbot_92) 0.0001))
; 
; =  {(((sc.itov[7].Y*9.26)+of.itov[7].Y)+sl.max.itov[7].Y)} {3300.}
(assert (= (+ (+ (* sc_92 9.26) of_92) sltop_92) 3300.))
; 
; >=  {((sc.itov[7].K*9.26)+of.itov[7].K)} {330.}
(assert (<= (+ (* sc_91 9.26) of_91) 330.))
; 
; <=  {((sc.itov[7].K*9.26)+of.itov[7].K)} {1.}
(assert (>= (+ (* sc_91 9.26) of_91) 1.))
(declare-fun slbot_92 () Real)
(declare-fun sltop_92 () Real)
; 
; =  {(((sc.itov[7].Y*0.)+of.itov[7].Y)+sl.min.itov[7].Y)} {0.0001}
(assert (= (+ (+ (* sc_92 0.) of_92) slbot_92) 0.0001))
; 
; =  {(((sc.itov[7].Y*9.26)+of.itov[7].Y)+sl.max.itov[7].Y)} {3300.}
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
; =  {sc.itov[0].Y} {(sc.itov[0].K*sc.itov[0].X)}
(assert (= sc_95 (* sc_94 sc_93)))
; 
; =  {of.itov[0].Y} {0}
(assert (= of_95 0.))
(declare-fun slbot_93 () Real)
(declare-fun sltop_93 () Real)
; 
; =  {(((sc.itov[0].X*0.)+of.itov[0].X)+sl.min.itov[0].X)} {0.0001}
(assert (= (+ (+ (* sc_93 0.) of_93) slbot_93) 0.0001))
; 
; =  {(((sc.itov[0].X*1.)+of.itov[0].X)+sl.max.itov[0].X)} {10.}
(assert (= (+ (+ (* sc_93 1.) of_93) sltop_93) 10.))
(declare-fun slbot_95 () Real)
(declare-fun sltop_95 () Real)
; 
; =  {(((sc.itov[0].Y*0.)+of.itov[0].Y)+sl.min.itov[0].Y)} {0.0001}
(assert (= (+ (+ (* sc_95 0.) of_95) slbot_95) 0.0001))
; 
; =  {(((sc.itov[0].Y*10.1)+of.itov[0].Y)+sl.max.itov[0].Y)} {3300.}
(assert (= (+ (+ (* sc_95 10.1) of_95) sltop_95) 3300.))
; 
; >=  {((sc.itov[0].K*10.1)+of.itov[0].K)} {330.}
(assert (<= (+ (* sc_94 10.1) of_94) 330.))
; 
; <=  {((sc.itov[0].K*10.1)+of.itov[0].K)} {1.}
(assert (>= (+ (* sc_94 10.1) of_94) 1.))
(declare-fun slbot_95 () Real)
(declare-fun sltop_95 () Real)
; 
; =  {(((sc.itov[0].Y*0.)+of.itov[0].Y)+sl.min.itov[0].Y)} {0.0001}
(assert (= (+ (+ (* sc_95 0.) of_95) slbot_95) 0.0001))
; 
; =  {(((sc.itov[0].Y*10.1)+of.itov[0].Y)+sl.max.itov[0].Y)} {3300.}
(assert (= (+ (+ (* sc_95 10.1) of_95) sltop_95) 3300.))
(declare-fun sc_96 () Real)
(declare-fun of_96 () Real)
(declare-fun sc_97 () Real)
(declare-fun of_97 () Real)
(declare-fun sc_98 () Real)
(declare-fun of_98 () Real)
(assert (= of_97 0))
(assert (= of_96 0))
; 
; =  {sc.itov[10].Y} {(sc.itov[10].K*sc.itov[10].X)}
(assert (= sc_98 (* sc_97 sc_96)))
; 
; =  {of.itov[10].Y} {0}
(assert (= of_98 0.))
(declare-fun slbot_96 () Real)
(declare-fun sltop_96 () Real)
; 
; =  {(((sc.itov[10].X*0.)+of.itov[10].X)+sl.min.itov[10].X)} {0.0001}
(assert (= (+ (+ (* sc_96 0.) of_96) slbot_96) 0.0001))
; 
; =  {(((sc.itov[10].X*1.)+of.itov[10].X)+sl.max.itov[10].X)} {10.}
(assert (= (+ (+ (* sc_96 1.) of_96) sltop_96) 10.))
(declare-fun slbot_98 () Real)
(declare-fun sltop_98 () Real)
; 
; =  {(((sc.itov[10].Y*0.)+of.itov[10].Y)+sl.min.itov[10].Y)} {0.0001}
(assert (= (+ (+ (* sc_98 0.) of_98) slbot_98) 0.0001))
; 
; =  {(((sc.itov[10].Y*12.616)+of.itov[10].Y)+sl.max.itov[10].Y)} {3300.}
(assert (= (+ (+ (* sc_98 12.616) of_98) sltop_98) 3300.))
(declare-fun slbot_97 () Real)
(declare-fun sltop_97 () Real)
; 
; =  {(((sc.itov[10].K*0.)+of.itov[10].K)+sl.min.itov[10].K)} {1.}
(assert (= (+ (+ (* sc_97 0.) of_97) slbot_97) 1.))
; 
; =  {(((sc.itov[10].K*12.616)+of.itov[10].K)+sl.max.itov[10].K)} {330.}
(assert (= (+ (+ (* sc_97 12.616) of_97) sltop_97) 330.))
(declare-fun slbot_98 () Real)
(declare-fun sltop_98 () Real)
; 
; =  {(((sc.itov[10].Y*0.)+of.itov[10].Y)+sl.min.itov[10].Y)} {0.0001}
(assert (= (+ (+ (* sc_98 0.) of_98) slbot_98) 0.0001))
; 
; =  {(((sc.itov[10].Y*12.616)+of.itov[10].Y)+sl.max.itov[10].Y)} {3300.}
(assert (= (+ (+ (* sc_98 12.616) of_98) sltop_98) 3300.))
; 
; =  {sc.itov[2].Y} {sc.vadd[1].D}
(assert (= sc_89 sc_43))
; 
; =  {of.itov[2].Y} {of.vadd[1].D}
(assert (= of_89 of_43))
; 
; =  {sc.vadd[4].OUT2} {sc.output.V[0].X}
(assert (= sc_41 sc_12))
; 
; =  {of.vadd[4].OUT2} {of.output.V[0].X}
(assert (= of_41 of_12))
; 
; =  {sc.input.V[17].O} {sc.vgain[5].X}
(assert (= sc_84 sc_8))
; 
; =  {of.input.V[17].O} {of.vgain[5].X}
(assert (= of_84 of_8))
; 
; =  {sc.vadd[1].OUT2} {sc.vgain[5].Z}
(assert (= sc_48 sc_10))
; 
; =  {of.vadd[1].OUT2} {of.vgain[5].Z}
(assert (= of_48 of_10))
; 
; =  {sc.vadd[1].OUT2} {sc.vgain[8].Z}
(assert (= sc_48 sc_2))
; 
; =  {of.vadd[1].OUT2} {of.vgain[8].Z}
(assert (= of_48 of_2))
; 
; =  {sc.vgain[8].P} {sc.vadd[11].B}
(assert (= sc_3 sc_25))
; 
; =  {of.vgain[8].P} {of.vadd[11].B}
(assert (= of_3 of_25))
; 
; =  {sc.input.V[9].O} {sc.vadd[11].A}
(assert (= sc_60 sc_24))
; 
; =  {of.input.V[9].O} {of.vadd[11].A}
(assert (= of_60 of_24))
; 
; =  {sc.input.V[15].O} {sc.vgain[3].X}
(assert (= sc_68 sc_4))
; 
; =  {of.input.V[15].O} {of.vgain[3].X}
(assert (= of_68 of_4))
; 
; =  {sc.input.V[13].O} {sc.vadd[1].OUT2_0}
(assert (= sc_56 sc_42))
; 
; =  {of.input.V[13].O} {of.vadd[1].OUT2_0}
(assert (= of_56 of_42))
; 
; =  {sc.input.V[14].O} {sc.vgain[3].Y}
(assert (= sc_72 sc_5))
; 
; =  {of.input.V[14].O} {of.vgain[3].Y}
(assert (= of_72 of_5))
; 
; =  {sc.input.V[11].O} {sc.itov[2].K}
(assert (= sc_64 sc_88))
; 
; =  {of.input.V[11].O} {of.itov[2].K}
(assert (= of_64 of_88))
; 
; =  {sc.input.V[12].O} {sc.vadd[6].OUT2_0}
(assert (= sc_58 sc_28))
; 
; =  {of.input.V[12].O} {of.vadd[6].OUT2_0}
(assert (= of_58 of_28))
; 
; =  {sc.input.V[8].O} {sc.vadd[9].OUT2_0}
(assert (= sc_52 sc_14))
; 
; =  {of.input.V[8].O} {of.vadd[9].OUT2_0}
(assert (= of_52 of_14))
; 
; =  {sc.input.V[3].O} {sc.itov[7].K}
(assert (= sc_76 sc_91))
; 
; =  {of.input.V[3].O} {of.itov[7].K}
(assert (= of_76 of_91))
; 
; =  {sc.input.V[2].O} {sc.vgain[8].Y}
(assert (= sc_50 sc_1))
; 
; =  {of.input.V[2].O} {of.vgain[8].Y}
(assert (= of_50 of_1))
; 
; =  {sc.vgain[3].P} {sc.vadd[4].B}
(assert (= sc_7 sc_39))
; 
; =  {of.vgain[3].P} {of.vadd[4].B}
(assert (= of_7 of_39))
; 
; =  {sc.itov[7].Y} {sc.vadd[6].B}
(assert (= sc_92 sc_32))
; 
; =  {of.itov[7].Y} {of.vadd[6].B}
(assert (= of_92 of_32))
; 
; =  {sc.vadd[11].OUT} {sc.itov[10].K}
(assert (= sc_26 sc_97))
; 
; =  {of.vadd[11].OUT} {of.itov[10].K}
(assert (= of_26 of_97))
; 
; =  {sc.itov[0].Y} {sc.vadd[1].B}
(assert (= sc_95 sc_46))
; 
; =  {of.itov[0].Y} {of.vadd[1].B}
(assert (= of_95 of_46))
; 
; =  {sc.input.V[1].O} {sc.itov[0].K}
(assert (= sc_82 sc_94))
; 
; =  {of.input.V[1].O} {of.itov[0].K}
(assert (= of_82 of_94))
; 
; =  {sc.vadd[9].OUT2} {sc.vgain[3].Z}
(assert (= sc_20 sc_6))
; 
; =  {of.vadd[9].OUT2} {of.vgain[3].Z}
(assert (= of_20 of_6))
; 
; =  {sc.vadd[9].OUT2} {sc.itov[0].X}
(assert (= sc_20 sc_93))
; 
; =  {of.vadd[9].OUT2} {of.itov[0].X}
(assert (= of_20 of_93))
; 
; =  {sc.vadd[9].OUT2} {sc.itov[7].X}
(assert (= sc_20 sc_90))
; 
; =  {of.vadd[9].OUT2} {of.itov[7].X}
(assert (= of_20 of_90))
; 
; =  {sc.input.V[7].O} {sc.vadd[6].A}
(assert (= sc_54 sc_31))
; 
; =  {of.input.V[7].O} {of.vadd[6].A}
(assert (= of_54 of_31))
; 
; =  {sc.input.V[10].O} {sc.vadd[9].A}
(assert (= sc_66 sc_17))
; 
; =  {of.input.V[10].O} {of.vadd[9].A}
(assert (= of_66 of_17))
; 
; =  {sc.input.V[0].O} {sc.vadd[9].D}
(assert (= sc_62 sc_15))
; 
; =  {of.input.V[0].O} {of.vadd[9].D}
(assert (= of_62 of_15))
; 
; =  {sc.itov[10].Y} {sc.vadd[9].B}
(assert (= sc_98 sc_18))
; 
; =  {of.itov[10].Y} {of.vadd[9].B}
(assert (= of_98 of_18))
; 
; =  {sc.input.V[18].O} {sc.vgain[5].Y}
(assert (= sc_86 sc_9))
; 
; =  {of.input.V[18].O} {of.vgain[5].Y}
(assert (= of_86 of_9))
; 
; =  {sc.input.V[16].O} {sc.vgain[8].X}
(assert (= sc_74 sc_0))
; 
; =  {of.input.V[16].O} {of.vgain[8].X}
(assert (= of_74 of_0))
; 
; =  {sc.input.V[5].O} {sc.vadd[4].OUT2_0}
(assert (= sc_80 sc_35))
; 
; =  {of.input.V[5].O} {of.vadd[4].OUT2_0}
(assert (= of_80 of_35))
; 
; =  {sc.vadd[6].OUT2} {sc.itov[2].X}
(assert (= sc_34 sc_87))
; 
; =  {of.vadd[6].OUT2} {of.itov[2].X}
(assert (= of_34 of_87))
; 
; =  {sc.vadd[6].OUT2} {sc.itov[10].X}
(assert (= sc_34 sc_96))
; 
; =  {of.vadd[6].OUT2} {of.itov[10].X}
(assert (= of_34 of_96))
; 
; =  {sc.input.V[4].O} {sc.vadd[1].A}
(assert (= sc_78 sc_45))
; 
; =  {of.input.V[4].O} {of.vadd[1].A}
(assert (= of_78 of_45))
; 
; =  {sc.input.V[6].O} {sc.vadd[4].A}
(assert (= sc_70 sc_38))
; 
; =  {of.input.V[6].O} {of.vadd[4].A}
(assert (= of_70 of_38))
; 
; =  {sc.vgain[5].P} {sc.vadd[6].D}
(assert (= sc_11 sc_29))
; 
; =  {of.vgain[5].P} {of.vadd[6].D}
(assert (= of_11 of_29))
(assert (<= (* sc_13 0.001) 1.))
; 
; =  {sc.vadd[4].OUT2} {sc.output.V[0].O} {sc.vadd[6].OUT2} {sc.vadd[1].OUT2} {sc.vadd[9].OUT2}
(assert (and (and (and (= sc_41 sc_13) (= sc_41 sc_34)) (= sc_41 sc_48)) (= sc_41 sc_20)))
(assert (= __minima__ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (* (ite (>= slbot_92 0) slbot_92 (- slbot_92)) 1.) (* (ite (>= sltop_96 0) sltop_96 (- sltop_96)) 1.)) (* (ite (>= sltop_18 0) sltop_18 (- sltop_18)) 1.)) (* (ite (>= sltop_87 0) sltop_87 (- sltop_87)) 1.)) (* (ite (>= sltop_32 0) sltop_32 (- sltop_32)) 1.)) (* (ite (>= slbot_10 0) slbot_10 (- slbot_10)) 1.)) (* (ite (>= sltop_90 0) sltop_90 (- sltop_90)) 1.)) (* (ite (>= slbot_20 0) slbot_20 (- slbot_20)) 1.)) (* (ite (>= slbot_3 0) slbot_3 (- slbot_3)) 1.)) (* (ite (>= slbot_46 0) slbot_46 (- slbot_46)) 1.)) (* (ite (>= slbot_26 0) slbot_26 (- slbot_26)) 1.)) (* (ite (>= slbot_2 0) slbot_2 (- slbot_2)) 1.)) (* (ite (>= sltop_10 0) sltop_10 (- sltop_10)) 1.)) (* (ite (>= slbot_18 0) slbot_18 (- slbot_18)) 1.)) (* (ite (>= slbot_96 0) slbot_96 (- slbot_96)) 1.)) (* (ite (>= sltop_2 0) sltop_2 (- sltop_2)) 1.)) (* (ite (>= sltop_13 0) sltop_13 (- sltop_13)) 1.)) (* (ite (>= slbot_95 0) slbot_95 (- slbot_95)) 1.)) (* (ite (>= slbot_98 0) slbot_98 (- slbot_98)) 1.)) (* (ite (>= sltop_34 0) sltop_34 (- sltop_34)) 1.)) (* (ite (>= slbot_87 0) slbot_87 (- slbot_87)) 1.)) (* (ite (>= slbot_6 0) slbot_6 (- slbot_6)) 1.)) (* (ite (>= sltop_19 0) sltop_19 (- sltop_19)) 1.)) (* (ite (>= slbot_34 0) slbot_34 (- slbot_34)) 1.)) (* (ite (>= sltop_3 0) sltop_3 (- sltop_3)) 1.)) (* (ite (>= sltop_40 0) sltop_40 (- sltop_40)) 1.)) (* (ite (>= slbot_7 0) slbot_7 (- slbot_7)) 1.)) (* (ite (>= slbot_12 0) slbot_12 (- slbot_12)) 1.)) (* (ite (>= slbot_89 0) slbot_89 (- slbot_89)) 1.)) (* (ite (>= slbot_13 0) slbot_13 (- slbot_13)) 1.)) (* (ite (>= slbot_29 0) slbot_29 (- slbot_29)) 1.)) (* (ite (>= slbot_32 0) slbot_32 (- slbot_32)) 1.)) (* (ite (>= sltop_41 0) sltop_41 (- sltop_41)) 1.)) (* (ite (>= slbot_11 0) slbot_11 (- slbot_11)) 1.)) (* (ite (>= sltop_11 0) sltop_11 (- sltop_11)) 1.)) (* (ite (>= slbot_19 0) slbot_19 (- slbot_19)) 1.)) (* (ite (>= sltop_7 0) sltop_7 (- sltop_7)) 1.)) (* (ite (>= sltop_29 0) sltop_29 (- sltop_29)) 1.)) (* (ite (>= sltop_39 0) sltop_39 (- sltop_39)) 1.)) (* (ite (>= sltop_89 0) sltop_89 (- sltop_89)) 1.)) (* (ite (>= sltop_92 0) sltop_92 (- sltop_92)) 1.)) (* (ite (>= sltop_12 0) sltop_12 (- sltop_12)) 1.)) (* (ite (>= slbot_90 0) slbot_90 (- slbot_90)) 1.)) (* (ite (>= slbot_25 0) slbot_25 (- slbot_25)) 1.)) (* (ite (>= slbot_41 0) slbot_41 (- slbot_41)) 1.)) (* (ite (>= sltop_20 0) sltop_20 (- sltop_20)) 1.)) (* (ite (>= sltop_98 0) sltop_98 (- sltop_98)) 1.)) (* (ite (>= sltop_95 0) sltop_95 (- sltop_95)) 1.)) (* (ite (>= slbot_48 0) slbot_48 (- slbot_48)) 1.)) (* (ite (>= slbot_93 0) slbot_93 (- slbot_93)) 1.)) (* (ite (>= sltop_97 0) sltop_97 (- sltop_97)) 1.)) (* (ite (>= slbot_43 0) slbot_43 (- slbot_43)) 1.)) (* (ite (>= sltop_47 0) sltop_47 (- sltop_47)) 1.)) (* (ite (>= sltop_93 0) sltop_93 (- sltop_93)) 1.)) (* (ite (>= sltop_48 0) sltop_48 (- sltop_48)) 1.)) (* (ite (>= sltop_46 0) sltop_46 (- sltop_46)) 1.)) (* (ite (>= sltop_25 0) sltop_25 (- sltop_25)) 1.)) (* (ite (>= sltop_26 0) sltop_26 (- sltop_26)) 1.)) (* (ite (>= slbot_39 0) slbot_39 (- slbot_39)) 1.)) (* (ite (>= slbot_47 0) slbot_47 (- slbot_47)) 1.)) (* (ite (>= sltop_6 0) sltop_6 (- sltop_6)) 1.)) (* (ite (>= sltop_43 0) sltop_43 (- sltop_43)) 1.)) (* (ite (>= slbot_33 0) slbot_33 (- slbot_33)) 1.)) (* (ite (>= sltop_33 0) sltop_33 (- sltop_33)) 1.)) (* (ite (>= slbot_40 0) slbot_40 (- slbot_40)) 1.)) (* (ite (>= slbot_97 0) slbot_97 (- slbot_97)) 1.))))
(check-sat)
