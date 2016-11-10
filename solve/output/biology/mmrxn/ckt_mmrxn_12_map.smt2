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
; >=  {((sc.vgain[2].Y*0.049504950495)+of.vgain[2].Y)} {3300.}
(assert (<= (+ (* sc_1 0.049504950495) of_1) 3300.))
; 
; <=  {((sc.vgain[2].Y*0.049504950495)+of.vgain[2].Y)} {1.}
(assert (>= (+ (* sc_1 0.049504950495) of_1) 1.))
(declare-fun slbot_3 () Real)
(declare-fun sltop_3 () Real)
; 
; =  {(((sc.vgain[2].P*0.)+of.vgain[2].P)+sl.min.vgain[2].P)} {1.51515151515e-12}
(assert (= (+ (+ (* sc_3 0.) of_3) slbot_3) 1.51515151515e-12))
; 
; =  {(((sc.vgain[2].P*10.1)+of.vgain[2].P)+sl.max.vgain[2].P)} {5445000.}
(assert (= (+ (+ (* sc_3 10.1) of_3) sltop_3) 5445000.))
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
; =  {sc.vgain[8].P} {((sc.vgain[8].X/sc.vgain[8].Y)*sc.vgain[8].Z*1)}
(assert (= sc_7 (* (* (/ sc_4 sc_5) sc_6) 1)))
; 
; =  {of.vgain[8].P} {0}
(assert (= of_7 0.))
; 
; >=  {((sc.vgain[8].X*1.)+of.vgain[8].X)} {3300.}
(assert (<= (+ (* sc_4 1.) of_4) 3300.))
; 
; <=  {((sc.vgain[8].X*1.)+of.vgain[8].X)} {0.0001}
(assert (>= (+ (* sc_4 1.) of_4) 0.0001))
; 
; >=  {((sc.vgain[8].Y*0.00990805326569)+of.vgain[8].Y)} {3300.}
(assert (<= (+ (* sc_5 0.00990805326569) of_5) 3300.))
; 
; <=  {((sc.vgain[8].Y*0.00990805326569)+of.vgain[8].Y)} {1.}
(assert (>= (+ (* sc_5 0.00990805326569) of_5) 1.))
(declare-fun slbot_7 () Real)
(declare-fun sltop_7 () Real)
; 
; =  {(((sc.vgain[8].P*0.)+of.vgain[8].P)+sl.min.vgain[8].P)} {1.51515151515e-12}
(assert (= (+ (+ (* sc_7 0.) of_7) slbot_7) 1.51515151515e-12))
; 
; =  {(((sc.vgain[8].P*50.464)+of.vgain[8].P)+sl.max.vgain[8].P)} {5445000.}
(assert (= (+ (+ (* sc_7 50.464) of_7) sltop_7) 5445000.))
(declare-fun slbot_6 () Real)
(declare-fun sltop_6 () Real)
; 
; =  {(((sc.vgain[8].Z*0.)+of.vgain[8].Z)+sl.min.vgain[8].Z)} {0.0001}
(assert (= (+ (+ (* sc_6 0.) of_6) slbot_6) 0.0001))
; 
; =  {(((sc.vgain[8].Z*1.)+of.vgain[8].Z)+sl.max.vgain[8].Z)} {3300.}
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
; =  {sc.vgain[0].P} {((sc.vgain[0].X/sc.vgain[0].Y)*sc.vgain[0].Z*1)}
(assert (= sc_11 (* (* (/ sc_8 sc_9) sc_10) 1)))
; 
; =  {of.vgain[0].P} {0}
(assert (= of_11 0.))
; 
; >=  {((sc.vgain[0].X*1.)+of.vgain[0].X)} {3300.}
(assert (<= (+ (* sc_8 1.) of_8) 3300.))
; 
; <=  {((sc.vgain[0].X*1.)+of.vgain[0].X)} {0.0001}
(assert (>= (+ (* sc_8 1.) of_8) 0.0001))
; 
; >=  {((sc.vgain[0].Y*0.595238095238)+of.vgain[0].Y)} {3300.}
(assert (<= (+ (* sc_9 0.595238095238) of_9) 3300.))
; 
; <=  {((sc.vgain[0].Y*0.595238095238)+of.vgain[0].Y)} {1.}
(assert (>= (+ (* sc_9 0.595238095238) of_9) 1.))
(declare-fun slbot_11 () Real)
(declare-fun sltop_11 () Real)
; 
; =  {(((sc.vgain[0].P*0.)+of.vgain[0].P)+sl.min.vgain[0].P)} {1.51515151515e-12}
(assert (= (+ (+ (* sc_11 0.) of_11) slbot_11) 1.51515151515e-12))
; 
; =  {(((sc.vgain[0].P*0.84)+of.vgain[0].P)+sl.max.vgain[0].P)} {5445000.}
(assert (= (+ (+ (* sc_11 0.84) of_11) sltop_11) 5445000.))
(declare-fun slbot_10 () Real)
(declare-fun sltop_10 () Real)
; 
; =  {(((sc.vgain[0].Z*0.)+of.vgain[0].Z)+sl.min.vgain[0].Z)} {0.0001}
(assert (= (+ (+ (* sc_10 0.) of_10) slbot_10) 0.0001))
; 
; =  {(((sc.vgain[0].Z*1.)+of.vgain[0].Z)+sl.max.vgain[0].Z)} {3300.}
(assert (= (+ (+ (* sc_10 1.) of_10) sltop_10) 3300.))
(declare-fun sc_12 () Real)
(declare-fun of_12 () Real)
(declare-fun sc_13 () Real)
(declare-fun of_13 () Real)
(declare-fun sc_14 () Real)
(declare-fun of_14 () Real)
(declare-fun sc_15 () Real)
(declare-fun of_15 () Real)
(assert (= of_12 0))
(assert (= of_13 0))
(assert (= 0. 0))
(assert (= of_14 0))
(assert (= 0. 0))
; 
; =  {sc.vgain[5].P} {((sc.vgain[5].X/sc.vgain[5].Y)*sc.vgain[5].Z*1)}
(assert (= sc_15 (* (* (/ sc_12 sc_13) sc_14) 1)))
; 
; =  {of.vgain[5].P} {0}
(assert (= of_15 0.))
; 
; >=  {((sc.vgain[5].X*1.)+of.vgain[5].X)} {3300.}
(assert (<= (+ (* sc_12 1.) of_12) 3300.))
; 
; <=  {((sc.vgain[5].X*1.)+of.vgain[5].X)} {0.0001}
(assert (>= (+ (* sc_12 1.) of_12) 0.0001))
; 
; >=  {((sc.vgain[5].Y*0.0396322130628)+of.vgain[5].Y)} {3300.}
(assert (<= (+ (* sc_13 0.0396322130628) of_13) 3300.))
; 
; <=  {((sc.vgain[5].Y*0.0396322130628)+of.vgain[5].Y)} {1.}
(assert (>= (+ (* sc_13 0.0396322130628) of_13) 1.))
(declare-fun slbot_15 () Real)
(declare-fun sltop_15 () Real)
; 
; =  {(((sc.vgain[5].P*0.)+of.vgain[5].P)+sl.min.vgain[5].P)} {1.51515151515e-12}
(assert (= (+ (+ (* sc_15 0.) of_15) slbot_15) 1.51515151515e-12))
; 
; =  {(((sc.vgain[5].P*12.616)+of.vgain[5].P)+sl.max.vgain[5].P)} {5445000.}
(assert (= (+ (+ (* sc_15 12.616) of_15) sltop_15) 5445000.))
(declare-fun slbot_14 () Real)
(declare-fun sltop_14 () Real)
; 
; =  {(((sc.vgain[5].Z*0.)+of.vgain[5].Z)+sl.min.vgain[5].Z)} {0.0001}
(assert (= (+ (+ (* sc_14 0.) of_14) slbot_14) 0.0001))
; 
; =  {(((sc.vgain[5].Z*1.)+of.vgain[5].Z)+sl.max.vgain[5].Z)} {3300.}
(assert (= (+ (+ (* sc_14 1.) of_14) sltop_14) 3300.))
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
; =  {sc.vadd[9].A} {(1*sc.vadd[9].B)}
(assert (= sc_21 (* 1 sc_22)))
; 
; =  {sc.vadd[9].A} {(1*sc.vadd[9].C)} {(1*sc.vadd[9].D)}
(assert (and (= sc_21 (* 1 sc_20)) (= sc_21 (* 1 sc_19))))
(assert (= (- (+ of_21 0) (+ 0 0)) 0))
(assert (= 0. 0))
; 
; =  {sc.vadd[9].OUT} {(sc.vadd[9].A*1)}
(assert (= sc_23 (* sc_21 1)))
; 
; =  {of.vadd[9].OUT} {0}
(assert (= of_23 0.))
(assert (= 0. 0))
(assert (= of_19 0))
(assert (= 0. 0))
(assert (= 0. 0))
(assert (= of_22 0))
; 
; =  {sc.vadd[9].A} {(1*sc.vadd[9].B)}
(assert (= sc_21 (* 1 sc_22)))
; 
; =  {sc.vadd[9].A} {(1*sc.vadd[9].C)} {(1*sc.vadd[9].D*1)}
(assert (and (= sc_21 (* 1 sc_20)) (= sc_21 (* (* 1 sc_19) 1))))
(assert (= (- (+ of_21 0) (+ 0 0)) 0))
(assert (= 0. 0))
; 
; =  {sc.vadd[9].OUT2} {(sc.vadd[9].A*1)}
(assert (= sc_24 (* sc_21 1)))
(assert (= of_24 0))
(assert (= 0. 0))
; 
; =  {sc.vadd[9].OUT2_0} {(sc.vadd[9].A*1)}
(assert (= sc_18 (* sc_21 1)))
; 
; =  {of.vadd[9].OUT2_0} {0}
(assert (= of_18 0.))
; 
; >=  {((sc.vadd[9].OUT2_0*0.)+of.vadd[9].OUT2_0)} {3300.}
(assert (<= (+ (* sc_18 0.) of_18) 3300.))
; 
; <=  {((sc.vadd[9].OUT2_0*0.)+of.vadd[9].OUT2_0)} {0.}
(assert (>= (+ (* sc_18 0.) of_18) 0.))
; 
; >=  {((sc.vadd[9].D*10.1)+of.vadd[9].D)} {3300.}
(assert (<= (+ (* sc_19 10.1) of_19) 3300.))
; 
; <=  {((sc.vadd[9].D*10.1)+of.vadd[9].D)} {0.0001}
(assert (>= (+ (* sc_19 10.1) of_19) 0.0001))
; 
; >=  {((sc.vadd[9].A*0.)+of.vadd[9].A)} {3300.}
(assert (<= (+ (* sc_21 0.) of_21) 3300.))
; 
; <=  {((sc.vadd[9].A*0.)+of.vadd[9].A)} {0.0001}
(assert (>= (+ (* sc_21 0.) of_21) 0.0001))
(declare-fun slbot_24 () Real)
(declare-fun sltop_24 () Real)
; 
; =  {(((sc.vadd[9].OUT2*0.)+of.vadd[9].OUT2)+sl.min.vadd[9].OUT2)} {0.}
(assert (= (+ (+ (* sc_24 0.) of_24) slbot_24) 0.))
; 
; =  {(((sc.vadd[9].OUT2*1.)+of.vadd[9].OUT2)+sl.max.vadd[9].OUT2)} {5.}
(assert (= (+ (+ (* sc_24 1.) of_24) sltop_24) 5.))
(declare-fun slbot_22 () Real)
(declare-fun sltop_22 () Real)
; 
; =  {(((sc.vadd[9].B*0.)+of.vadd[9].B)+sl.min.vadd[9].B)} {0.0001}
(assert (= (+ (+ (* sc_22 0.) of_22) slbot_22) 0.0001))
; 
; =  {(((sc.vadd[9].B*12.616)+of.vadd[9].B)+sl.max.vadd[9].B)} {3300.}
(assert (= (+ (+ (* sc_22 12.616) of_22) sltop_22) 3300.))
(declare-fun slbot_23 () Real)
(declare-fun sltop_23 () Real)
; 
; =  {(((sc.vadd[9].OUT*0.)+of.vadd[9].OUT)+sl.min.vadd[9].OUT)} {-824.99995}
(assert (= (+ (+ (* sc_23 0.) of_23) slbot_23) -824.99995))
; 
; =  {(((sc.vadd[9].OUT*12.616)+of.vadd[9].OUT)+sl.max.vadd[9].OUT)} {1649.999975}
(assert (= (+ (+ (* sc_23 12.616) of_23) sltop_23) 1649.999975))
(declare-fun slbot_24 () Real)
(declare-fun sltop_24 () Real)
; 
; =  {(((sc.vadd[9].OUT2*0.)+of.vadd[9].OUT2)+sl.min.vadd[9].OUT2)} {0.}
(assert (= (+ (+ (* sc_24 0.) of_24) slbot_24) 0.))
; 
; =  {(((sc.vadd[9].OUT2*1.)+of.vadd[9].OUT2)+sl.max.vadd[9].OUT2)} {5.}
(assert (= (+ (+ (* sc_24 1.) of_24) sltop_24) 5.))
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
(declare-fun sc_31 () Real)
(declare-fun of_31 () Real)
(assert (= 0. 0))
(assert (= of_29 0))
; 
; =  {sc.vadd[11].A} {(1*sc.vadd[11].B)}
(assert (= sc_28 (* 1 sc_29)))
; 
; =  {sc.vadd[11].A} {(1*sc.vadd[11].C)} {(1*sc.vadd[11].D)}
(assert (and (= sc_28 (* 1 sc_27)) (= sc_28 (* 1 sc_26))))
(assert (= (- (+ of_28 0) (+ 0 0)) 0))
(assert (= 0. 0))
; 
; =  {sc.vadd[11].OUT} {(sc.vadd[11].A*1)}
(assert (= sc_30 (* sc_28 1)))
; 
; =  {of.vadd[11].OUT} {0}
(assert (= of_30 0.))
(assert (= 0. 0))
(assert (= of_29 0))
; 
; =  {sc.vadd[11].A} {(1*sc.vadd[11].B)}
(assert (= sc_28 (* 1 sc_29)))
; 
; =  {sc.vadd[11].A} {(1*sc.vadd[11].C)} {(1*sc.vadd[11].D*1)}
(assert (and (= sc_28 (* 1 sc_27)) (= sc_28 (* (* 1 sc_26) 1))))
(assert (= (- (+ of_28 0) (+ 0 0)) 0))
(assert (= 0. 0))
; 
; =  {sc.vadd[11].OUT2} {(sc.vadd[11].A*1)}
(assert (= sc_31 (* sc_28 1)))
(assert (= of_31 0))
(assert (= 0. 0))
; 
; =  {sc.vadd[11].OUT2_0} {(sc.vadd[11].A*1)}
(assert (= sc_25 (* sc_28 1)))
; 
; =  {of.vadd[11].OUT2_0} {0}
(assert (= of_25 0.))
(declare-fun slbot_30 () Real)
(declare-fun sltop_30 () Real)
; 
; =  {(((sc.vadd[11].OUT*0.)+of.vadd[11].OUT)+sl.min.vadd[11].OUT)} {5e-05}
(assert (= (+ (+ (* sc_30 0.) of_30) slbot_30) 5e-05))
; 
; =  {(((sc.vadd[11].OUT*12.616)+of.vadd[11].OUT)+sl.max.vadd[11].OUT)} {1650.}
(assert (= (+ (+ (* sc_30 12.616) of_30) sltop_30) 1650.))
; 
; >=  {((sc.vadd[11].A*0.)+of.vadd[11].A)} {3300.}
(assert (<= (+ (* sc_28 0.) of_28) 3300.))
; 
; <=  {((sc.vadd[11].A*0.)+of.vadd[11].A)} {0.0001}
(assert (>= (+ (* sc_28 0.) of_28) 0.0001))
(declare-fun slbot_29 () Real)
(declare-fun sltop_29 () Real)
; 
; =  {(((sc.vadd[11].B*0.)+of.vadd[11].B)+sl.min.vadd[11].B)} {0.0001}
(assert (= (+ (+ (* sc_29 0.) of_29) slbot_29) 0.0001))
; 
; =  {(((sc.vadd[11].B*50.464)+of.vadd[11].B)+sl.max.vadd[11].B)} {3300.}
(assert (= (+ (+ (* sc_29 50.464) of_29) sltop_29) 3300.))
(declare-fun slbot_30 () Real)
(declare-fun sltop_30 () Real)
; 
; =  {(((sc.vadd[11].OUT*0.)+of.vadd[11].OUT)+sl.min.vadd[11].OUT)} {5e-05}
(assert (= (+ (+ (* sc_30 0.) of_30) slbot_30) 5e-05))
; 
; =  {(((sc.vadd[11].OUT*12.616)+of.vadd[11].OUT)+sl.max.vadd[11].OUT)} {1650.}
(assert (= (+ (+ (* sc_30 12.616) of_30) sltop_30) 1650.))
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
(declare-fun sc_38 () Real)
(declare-fun of_38 () Real)
(assert (= 0. 0))
(assert (= of_33 0))
(assert (= 0. 0))
(assert (= of_36 0))
; 
; =  {sc.vadd[6].A} {(1*sc.vadd[6].B)}
(assert (= sc_35 (* 1 sc_36)))
; 
; =  {sc.vadd[6].A} {(1*sc.vadd[6].C)} {(1*sc.vadd[6].D)}
(assert (and (= sc_35 (* 1 sc_34)) (= sc_35 (* 1 sc_33))))
(assert (= (- (+ of_35 0) (+ 0 0)) 0))
(assert (= 0. 0))
; 
; =  {sc.vadd[6].OUT} {(sc.vadd[6].A*1)}
(assert (= sc_37 (* sc_35 1)))
; 
; =  {of.vadd[6].OUT} {0}
(assert (= of_37 0.))
(assert (= 0. 0))
(assert (= of_33 0))
(assert (= 0. 0))
(assert (= 0. 0))
(assert (= of_36 0))
; 
; =  {sc.vadd[6].A} {(1*sc.vadd[6].B)}
(assert (= sc_35 (* 1 sc_36)))
; 
; =  {sc.vadd[6].A} {(1*sc.vadd[6].C)} {(1*sc.vadd[6].D*1)}
(assert (and (= sc_35 (* 1 sc_34)) (= sc_35 (* (* 1 sc_33) 1))))
(assert (= (- (+ of_35 0) (+ 0 0)) 0))
(assert (= 0. 0))
; 
; =  {sc.vadd[6].OUT2} {(sc.vadd[6].A*1)}
(assert (= sc_38 (* sc_35 1)))
(assert (= of_38 0))
(assert (= 0. 0))
; 
; =  {sc.vadd[6].OUT2_0} {(sc.vadd[6].A*1)}
(assert (= sc_32 (* sc_35 1)))
; 
; =  {of.vadd[6].OUT2_0} {0}
(assert (= of_32 0.))
; 
; >=  {((sc.vadd[6].OUT2_0*0.256)+of.vadd[6].OUT2_0)} {3300.}
(assert (<= (+ (* sc_32 0.256) of_32) 3300.))
; 
; <=  {((sc.vadd[6].OUT2_0*0.256)+of.vadd[6].OUT2_0)} {0.}
(assert (>= (+ (* sc_32 0.256) of_32) 0.))
(declare-fun slbot_33 () Real)
(declare-fun sltop_33 () Real)
; 
; =  {(((sc.vadd[6].D*0.)+of.vadd[6].D)+sl.min.vadd[6].D)} {0.0001}
(assert (= (+ (+ (* sc_33 0.) of_33) slbot_33) 0.0001))
; 
; =  {(((sc.vadd[6].D*12.616)+of.vadd[6].D)+sl.max.vadd[6].D)} {3300.}
(assert (= (+ (+ (* sc_33 12.616) of_33) sltop_33) 3300.))
; 
; >=  {((sc.vadd[6].A*0.)+of.vadd[6].A)} {3300.}
(assert (<= (+ (* sc_35 0.) of_35) 3300.))
; 
; <=  {((sc.vadd[6].A*0.)+of.vadd[6].A)} {0.0001}
(assert (>= (+ (* sc_35 0.) of_35) 0.0001))
(declare-fun slbot_38 () Real)
(declare-fun sltop_38 () Real)
; 
; =  {(((sc.vadd[6].OUT2*0.)+of.vadd[6].OUT2)+sl.min.vadd[6].OUT2)} {0.}
(assert (= (+ (+ (* sc_38 0.) of_38) slbot_38) 0.))
; 
; =  {(((sc.vadd[6].OUT2*1.)+of.vadd[6].OUT2)+sl.max.vadd[6].OUT2)} {5.}
(assert (= (+ (+ (* sc_38 1.) of_38) sltop_38) 5.))
(declare-fun slbot_36 () Real)
(declare-fun sltop_36 () Real)
; 
; =  {(((sc.vadd[6].B*0.)+of.vadd[6].B)+sl.min.vadd[6].B)} {0.0001}
(assert (= (+ (+ (* sc_36 0.) of_36) slbot_36) 0.0001))
; 
; =  {(((sc.vadd[6].B*9.26)+of.vadd[6].B)+sl.max.vadd[6].B)} {3300.}
(assert (= (+ (+ (* sc_36 9.26) of_36) sltop_36) 3300.))
(declare-fun slbot_37 () Real)
(declare-fun sltop_37 () Real)
; 
; =  {(((sc.vadd[6].OUT*0.)+of.vadd[6].OUT)+sl.min.vadd[6].OUT)} {-824.99995}
(assert (= (+ (+ (* sc_37 0.) of_37) slbot_37) -824.99995))
; 
; =  {(((sc.vadd[6].OUT*9.26)+of.vadd[6].OUT)+sl.max.vadd[6].OUT)} {1649.999975}
(assert (= (+ (+ (* sc_37 9.26) of_37) sltop_37) 1649.999975))
(declare-fun slbot_38 () Real)
(declare-fun sltop_38 () Real)
; 
; =  {(((sc.vadd[6].OUT2*0.)+of.vadd[6].OUT2)+sl.min.vadd[6].OUT2)} {0.}
(assert (= (+ (+ (* sc_38 0.) of_38) slbot_38) 0.))
; 
; =  {(((sc.vadd[6].OUT2*1.)+of.vadd[6].OUT2)+sl.max.vadd[6].OUT2)} {5.}
(assert (= (+ (+ (* sc_38 1.) of_38) sltop_38) 5.))
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
(declare-fun sc_44 () Real)
(declare-fun of_44 () Real)
(declare-fun sc_45 () Real)
(declare-fun of_45 () Real)
(assert (= 0. 0))
(assert (= of_40 0))
(assert (= 0. 0))
(assert (= of_43 0))
; 
; =  {sc.vadd[3].A} {(1*sc.vadd[3].B)}
(assert (= sc_42 (* 1 sc_43)))
; 
; =  {sc.vadd[3].A} {(1*sc.vadd[3].C)} {(1*sc.vadd[3].D)}
(assert (and (= sc_42 (* 1 sc_41)) (= sc_42 (* 1 sc_40))))
(assert (= (- (+ of_42 0) (+ 0 0)) 0))
(assert (= 0. 0))
; 
; =  {sc.vadd[3].OUT} {(sc.vadd[3].A*1)}
(assert (= sc_44 (* sc_42 1)))
; 
; =  {of.vadd[3].OUT} {0}
(assert (= of_44 0.))
(assert (= 0. 0))
(assert (= of_40 0))
(assert (= 0. 0))
(assert (= 0. 0))
(assert (= of_43 0))
; 
; =  {sc.vadd[3].A} {(1*sc.vadd[3].B)}
(assert (= sc_42 (* 1 sc_43)))
; 
; =  {sc.vadd[3].A} {(1*sc.vadd[3].C)} {(1*sc.vadd[3].D*1)}
(assert (and (= sc_42 (* 1 sc_41)) (= sc_42 (* (* 1 sc_40) 1))))
(assert (= (- (+ of_42 0) (+ 0 0)) 0))
(assert (= 0. 0))
; 
; =  {sc.vadd[3].OUT2} {(sc.vadd[3].A*1)}
(assert (= sc_45 (* sc_42 1)))
(assert (= of_45 0))
(assert (= 0. 0))
; 
; =  {sc.vadd[3].OUT2_0} {(sc.vadd[3].A*1)}
(assert (= sc_39 (* sc_42 1)))
; 
; =  {of.vadd[3].OUT2_0} {0}
(assert (= of_39 0.))
; 
; >=  {((sc.vadd[3].OUT2_0*0.124)+of.vadd[3].OUT2_0)} {3300.}
(assert (<= (+ (* sc_39 0.124) of_39) 3300.))
; 
; <=  {((sc.vadd[3].OUT2_0*0.124)+of.vadd[3].OUT2_0)} {0.}
(assert (>= (+ (* sc_39 0.124) of_39) 0.))
(declare-fun slbot_40 () Real)
(declare-fun sltop_40 () Real)
; 
; =  {(((sc.vadd[3].D*0.)+of.vadd[3].D)+sl.min.vadd[3].D)} {0.0001}
(assert (= (+ (+ (* sc_40 0.) of_40) slbot_40) 0.0001))
; 
; =  {(((sc.vadd[3].D*12.616)+of.vadd[3].D)+sl.max.vadd[3].D)} {3300.}
(assert (= (+ (+ (* sc_40 12.616) of_40) sltop_40) 3300.))
; 
; >=  {((sc.vadd[3].A*0.)+of.vadd[3].A)} {3300.}
(assert (<= (+ (* sc_42 0.) of_42) 3300.))
; 
; <=  {((sc.vadd[3].A*0.)+of.vadd[3].A)} {0.0001}
(assert (>= (+ (* sc_42 0.) of_42) 0.0001))
(declare-fun slbot_45 () Real)
(declare-fun sltop_45 () Real)
; 
; =  {(((sc.vadd[3].OUT2*0.)+of.vadd[3].OUT2)+sl.min.vadd[3].OUT2)} {0.}
(assert (= (+ (+ (* sc_45 0.) of_45) slbot_45) 0.))
; 
; =  {(((sc.vadd[3].OUT2*1.)+of.vadd[3].OUT2)+sl.max.vadd[3].OUT2)} {5.}
(assert (= (+ (+ (* sc_45 1.) of_45) sltop_45) 5.))
(declare-fun slbot_43 () Real)
(declare-fun sltop_43 () Real)
; 
; =  {(((sc.vadd[3].B*0.)+of.vadd[3].B)+sl.min.vadd[3].B)} {0.0001}
(assert (= (+ (+ (* sc_43 0.) of_43) slbot_43) 0.0001))
; 
; =  {(((sc.vadd[3].B*10.1)+of.vadd[3].B)+sl.max.vadd[3].B)} {3300.}
(assert (= (+ (+ (* sc_43 10.1) of_43) sltop_43) 3300.))
(declare-fun slbot_44 () Real)
(declare-fun sltop_44 () Real)
; 
; =  {(((sc.vadd[3].OUT*0.)+of.vadd[3].OUT)+sl.min.vadd[3].OUT)} {-824.99995}
(assert (= (+ (+ (* sc_44 0.) of_44) slbot_44) -824.99995))
; 
; =  {(((sc.vadd[3].OUT*12.616)+of.vadd[3].OUT)+sl.max.vadd[3].OUT)} {1649.999975}
(assert (= (+ (+ (* sc_44 12.616) of_44) sltop_44) 1649.999975))
(declare-fun slbot_45 () Real)
(declare-fun sltop_45 () Real)
; 
; =  {(((sc.vadd[3].OUT2*0.)+of.vadd[3].OUT2)+sl.min.vadd[3].OUT2)} {0.}
(assert (= (+ (+ (* sc_45 0.) of_45) slbot_45) 0.))
; 
; =  {(((sc.vadd[3].OUT2*1.)+of.vadd[3].OUT2)+sl.max.vadd[3].OUT2)} {5.}
(assert (= (+ (+ (* sc_45 1.) of_45) sltop_45) 5.))
(declare-fun sc_46 () Real)
(declare-fun of_46 () Real)
(declare-fun sc_47 () Real)
(declare-fun of_47 () Real)
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
(assert (= 0. 0))
(assert (= of_50 0))
; 
; =  {sc.vadd[1].A} {(1*sc.vadd[1].B)}
(assert (= sc_49 (* 1 sc_50)))
; 
; =  {sc.vadd[1].A} {(1*sc.vadd[1].C)} {(1*sc.vadd[1].D)}
(assert (and (= sc_49 (* 1 sc_48)) (= sc_49 (* 1 sc_47))))
(assert (= (- (+ of_49 0) (+ 0 0)) 0))
(assert (= 0. 0))
; 
; =  {sc.vadd[1].OUT} {(sc.vadd[1].A*1)}
(assert (= sc_51 (* sc_49 1)))
; 
; =  {of.vadd[1].OUT} {0}
(assert (= of_51 0.))
(assert (= 0. 0))
(assert (= of_50 0))
; 
; =  {sc.vadd[1].A} {(1*sc.vadd[1].B)}
(assert (= sc_49 (* 1 sc_50)))
; 
; =  {sc.vadd[1].A} {(1*sc.vadd[1].C)} {(1*sc.vadd[1].D*1)}
(assert (and (= sc_49 (* 1 sc_48)) (= sc_49 (* (* 1 sc_47) 1))))
(assert (= (- (+ of_49 0) (+ 0 0)) 0))
(assert (= 0. 0))
; 
; =  {sc.vadd[1].OUT2} {(sc.vadd[1].A*1)}
(assert (= sc_52 (* sc_49 1)))
(assert (= of_52 0))
(assert (= 0. 0))
; 
; =  {sc.vadd[1].OUT2_0} {(sc.vadd[1].A*1)}
(assert (= sc_46 (* sc_49 1)))
; 
; =  {of.vadd[1].OUT2_0} {0}
(assert (= of_46 0.))
; 
; >=  {((sc.vadd[1].OUT2_0*0.)+of.vadd[1].OUT2_0)} {3300.}
(assert (<= (+ (* sc_46 0.) of_46) 3300.))
; 
; <=  {((sc.vadd[1].OUT2_0*0.)+of.vadd[1].OUT2_0)} {0.}
(assert (>= (+ (* sc_46 0.) of_46) 0.))
; 
; >=  {((sc.vadd[1].A*0.)+of.vadd[1].A)} {3300.}
(assert (<= (+ (* sc_49 0.) of_49) 3300.))
; 
; <=  {((sc.vadd[1].A*0.)+of.vadd[1].A)} {0.0001}
(assert (>= (+ (* sc_49 0.) of_49) 0.0001))
(declare-fun slbot_52 () Real)
(declare-fun sltop_52 () Real)
; 
; =  {(((sc.vadd[1].OUT2*0.)+of.vadd[1].OUT2)+sl.min.vadd[1].OUT2)} {0.}
(assert (= (+ (+ (* sc_52 0.) of_52) slbot_52) 0.))
; 
; =  {(((sc.vadd[1].OUT2*1.)+of.vadd[1].OUT2)+sl.max.vadd[1].OUT2)} {5.}
(assert (= (+ (+ (* sc_52 1.) of_52) sltop_52) 5.))
(declare-fun slbot_50 () Real)
(declare-fun sltop_50 () Real)
; 
; =  {(((sc.vadd[1].B*0.)+of.vadd[1].B)+sl.min.vadd[1].B)} {0.0001}
(assert (= (+ (+ (* sc_50 0.) of_50) slbot_50) 0.0001))
; 
; =  {(((sc.vadd[1].B*0.84)+of.vadd[1].B)+sl.max.vadd[1].B)} {3300.}
(assert (= (+ (+ (* sc_50 0.84) of_50) sltop_50) 3300.))
(declare-fun slbot_51 () Real)
(declare-fun sltop_51 () Real)
; 
; =  {(((sc.vadd[1].OUT*0.)+of.vadd[1].OUT)+sl.min.vadd[1].OUT)} {5e-05}
(assert (= (+ (+ (* sc_51 0.) of_51) slbot_51) 5e-05))
; 
; =  {(((sc.vadd[1].OUT*0.84)+of.vadd[1].OUT)+sl.max.vadd[1].OUT)} {1650.}
(assert (= (+ (+ (* sc_51 0.84) of_51) sltop_51) 1650.))
(declare-fun slbot_52 () Real)
(declare-fun sltop_52 () Real)
; 
; =  {(((sc.vadd[1].OUT2*0.)+of.vadd[1].OUT2)+sl.min.vadd[1].OUT2)} {0.}
(assert (= (+ (+ (* sc_52 0.) of_52) slbot_52) 0.))
; 
; =  {(((sc.vadd[1].OUT2*1.)+of.vadd[1].OUT2)+sl.max.vadd[1].OUT2)} {5.}
(assert (= (+ (+ (* sc_52 1.) of_52) sltop_52) 5.))
(declare-fun sc_53 () Real)
(declare-fun of_53 () Real)
(declare-fun sc_54 () Real)
(declare-fun of_54 () Real)
; 
; =  {sc.input.V[2].O} {sc.input.V[2].X}
(assert (= sc_54 sc_53))
; 
; =  {of.input.V[2].O} {of.input.V[2].X}
(assert (= of_54 of_53))
; 
; >=  {((sc.input.V[2].X*9.26)+of.input.V[2].X)} {5.}
(assert (<= (+ (* sc_53 9.26) of_53) 5.))
; 
; <=  {((sc.input.V[2].X*9.26)+of.input.V[2].X)} {0.}
(assert (>= (+ (* sc_53 9.26) of_53) 0.))
; 
; >=  {((sc.input.V[2].O*9.26)+of.input.V[2].O)} {5.}
(assert (<= (+ (* sc_54 9.26) of_54) 5.))
; 
; <=  {((sc.input.V[2].O*9.26)+of.input.V[2].O)} {0.}
(assert (>= (+ (* sc_54 9.26) of_54) 0.))
(declare-fun sc_55 () Real)
(declare-fun of_55 () Real)
(declare-fun sc_56 () Real)
(declare-fun of_56 () Real)
; 
; =  {sc.input.V[8].O} {sc.input.V[8].X}
(assert (= sc_56 sc_55))
; 
; =  {of.input.V[8].O} {of.input.V[8].X}
(assert (= of_56 of_55))
; 
; >=  {((sc.input.V[8].X*0.)+of.input.V[8].X)} {5.}
(assert (<= (+ (* sc_55 0.) of_55) 5.))
; 
; <=  {((sc.input.V[8].X*0.)+of.input.V[8].X)} {0.}
(assert (>= (+ (* sc_55 0.) of_55) 0.))
; 
; >=  {((sc.input.V[8].O*0.)+of.input.V[8].O)} {5.}
(assert (<= (+ (* sc_56 0.) of_56) 5.))
; 
; <=  {((sc.input.V[8].O*0.)+of.input.V[8].O)} {0.}
(assert (>= (+ (* sc_56 0.) of_56) 0.))
(declare-fun sc_57 () Real)
(declare-fun of_57 () Real)
(declare-fun sc_58 () Real)
(declare-fun of_58 () Real)
; 
; =  {sc.input.V[7].O} {sc.input.V[7].X}
(assert (= sc_58 sc_57))
; 
; =  {of.input.V[7].O} {of.input.V[7].X}
(assert (= of_58 of_57))
; 
; >=  {((sc.input.V[7].X*0.)+of.input.V[7].X)} {5.}
(assert (<= (+ (* sc_57 0.) of_57) 5.))
; 
; <=  {((sc.input.V[7].X*0.)+of.input.V[7].X)} {0.}
(assert (>= (+ (* sc_57 0.) of_57) 0.))
; 
; >=  {((sc.input.V[7].O*0.)+of.input.V[7].O)} {5.}
(assert (<= (+ (* sc_58 0.) of_58) 5.))
; 
; <=  {((sc.input.V[7].O*0.)+of.input.V[7].O)} {0.}
(assert (>= (+ (* sc_58 0.) of_58) 0.))
(declare-fun sc_59 () Real)
(declare-fun of_59 () Real)
(declare-fun sc_60 () Real)
(declare-fun of_60 () Real)
; 
; =  {sc.input.V[13].O} {sc.input.V[13].X}
(assert (= sc_60 sc_59))
; 
; =  {of.input.V[13].O} {of.input.V[13].X}
(assert (= of_60 of_59))
; 
; >=  {((sc.input.V[13].X*0.124)+of.input.V[13].X)} {5.}
(assert (<= (+ (* sc_59 0.124) of_59) 5.))
; 
; <=  {((sc.input.V[13].X*0.124)+of.input.V[13].X)} {0.}
(assert (>= (+ (* sc_59 0.124) of_59) 0.))
; 
; >=  {((sc.input.V[13].O*0.124)+of.input.V[13].O)} {5.}
(assert (<= (+ (* sc_60 0.124) of_60) 5.))
; 
; <=  {((sc.input.V[13].O*0.124)+of.input.V[13].O)} {0.}
(assert (>= (+ (* sc_60 0.124) of_60) 0.))
(declare-fun sc_61 () Real)
(declare-fun of_61 () Real)
(declare-fun sc_62 () Real)
(declare-fun of_62 () Real)
; 
; =  {sc.input.V[12].O} {sc.input.V[12].X}
(assert (= sc_62 sc_61))
; 
; =  {of.input.V[12].O} {of.input.V[12].X}
(assert (= of_62 of_61))
; 
; >=  {((sc.input.V[12].X*0.256)+of.input.V[12].X)} {5.}
(assert (<= (+ (* sc_61 0.256) of_61) 5.))
; 
; <=  {((sc.input.V[12].X*0.256)+of.input.V[12].X)} {0.}
(assert (>= (+ (* sc_61 0.256) of_61) 0.))
; 
; >=  {((sc.input.V[12].O*0.256)+of.input.V[12].O)} {5.}
(assert (<= (+ (* sc_62 0.256) of_62) 5.))
; 
; <=  {((sc.input.V[12].O*0.256)+of.input.V[12].O)} {0.}
(assert (>= (+ (* sc_62 0.256) of_62) 0.))
(declare-fun sc_63 () Real)
(declare-fun of_63 () Real)
(declare-fun sc_64 () Real)
(declare-fun of_64 () Real)
; 
; =  {sc.input.V[9].O} {sc.input.V[9].X}
(assert (= sc_64 sc_63))
; 
; =  {of.input.V[9].O} {of.input.V[9].X}
(assert (= of_64 of_63))
; 
; >=  {((sc.input.V[9].X*0.)+of.input.V[9].X)} {5.}
(assert (<= (+ (* sc_63 0.) of_63) 5.))
; 
; <=  {((sc.input.V[9].X*0.)+of.input.V[9].X)} {0.}
(assert (>= (+ (* sc_63 0.) of_63) 0.))
; 
; >=  {((sc.input.V[9].O*0.)+of.input.V[9].O)} {5.}
(assert (<= (+ (* sc_64 0.) of_64) 5.))
; 
; <=  {((sc.input.V[9].O*0.)+of.input.V[9].O)} {0.}
(assert (>= (+ (* sc_64 0.) of_64) 0.))
(declare-fun sc_65 () Real)
(declare-fun of_65 () Real)
(declare-fun sc_66 () Real)
(declare-fun of_66 () Real)
; 
; =  {sc.input.V[0].O} {sc.input.V[0].X}
(assert (= sc_66 sc_65))
; 
; =  {of.input.V[0].O} {of.input.V[0].X}
(assert (= of_66 of_65))
; 
; >=  {((sc.input.V[0].X*10.1)+of.input.V[0].X)} {5.}
(assert (<= (+ (* sc_65 10.1) of_65) 5.))
; 
; <=  {((sc.input.V[0].X*10.1)+of.input.V[0].X)} {0.}
(assert (>= (+ (* sc_65 10.1) of_65) 0.))
; 
; >=  {((sc.input.V[0].O*10.1)+of.input.V[0].O)} {5.}
(assert (<= (+ (* sc_66 10.1) of_66) 5.))
; 
; <=  {((sc.input.V[0].O*10.1)+of.input.V[0].O)} {0.}
(assert (>= (+ (* sc_66 10.1) of_66) 0.))
(declare-fun sc_67 () Real)
(declare-fun of_67 () Real)
(declare-fun sc_68 () Real)
(declare-fun of_68 () Real)
; 
; =  {sc.input.V[11].O} {sc.input.V[11].X}
(assert (= sc_68 sc_67))
; 
; =  {of.input.V[11].O} {of.input.V[11].X}
(assert (= of_68 of_67))
; 
; >=  {((sc.input.V[11].X*12.616)+of.input.V[11].X)} {5.}
(assert (<= (+ (* sc_67 12.616) of_67) 5.))
; 
; <=  {((sc.input.V[11].X*12.616)+of.input.V[11].X)} {0.}
(assert (>= (+ (* sc_67 12.616) of_67) 0.))
; 
; >=  {((sc.input.V[11].O*12.616)+of.input.V[11].O)} {5.}
(assert (<= (+ (* sc_68 12.616) of_68) 5.))
; 
; <=  {((sc.input.V[11].O*12.616)+of.input.V[11].O)} {0.}
(assert (>= (+ (* sc_68 12.616) of_68) 0.))
(declare-fun sc_69 () Real)
(declare-fun of_69 () Real)
(declare-fun sc_70 () Real)
(declare-fun of_70 () Real)
; 
; =  {sc.input.V[10].O} {sc.input.V[10].X}
(assert (= sc_70 sc_69))
; 
; =  {of.input.V[10].O} {of.input.V[10].X}
(assert (= of_70 of_69))
; 
; >=  {((sc.input.V[10].X*0.)+of.input.V[10].X)} {5.}
(assert (<= (+ (* sc_69 0.) of_69) 5.))
; 
; <=  {((sc.input.V[10].X*0.)+of.input.V[10].X)} {0.}
(assert (>= (+ (* sc_69 0.) of_69) 0.))
; 
; >=  {((sc.input.V[10].O*0.)+of.input.V[10].O)} {5.}
(assert (<= (+ (* sc_70 0.) of_70) 5.))
; 
; <=  {((sc.input.V[10].O*0.)+of.input.V[10].O)} {0.}
(assert (>= (+ (* sc_70 0.) of_70) 0.))
(declare-fun sc_71 () Real)
(declare-fun of_71 () Real)
(declare-fun sc_72 () Real)
(declare-fun of_72 () Real)
; 
; =  {sc.input.V[15].O} {sc.input.V[15].X}
(assert (= sc_72 sc_71))
; 
; =  {of.input.V[15].O} {of.input.V[15].X}
(assert (= of_72 of_71))
; 
; >=  {((sc.input.V[15].X*1.)+of.input.V[15].X)} {5.}
(assert (<= (+ (* sc_71 1.) of_71) 5.))
; 
; <=  {((sc.input.V[15].X*1.)+of.input.V[15].X)} {0.}
(assert (>= (+ (* sc_71 1.) of_71) 0.))
; 
; >=  {((sc.input.V[15].O*1.)+of.input.V[15].O)} {5.}
(assert (<= (+ (* sc_72 1.) of_72) 5.))
; 
; <=  {((sc.input.V[15].O*1.)+of.input.V[15].O)} {0.}
(assert (>= (+ (* sc_72 1.) of_72) 0.))
(declare-fun sc_73 () Real)
(declare-fun of_73 () Real)
(declare-fun sc_74 () Real)
(declare-fun of_74 () Real)
; 
; =  {sc.input.V[6].O} {sc.input.V[6].X}
(assert (= sc_74 sc_73))
; 
; =  {of.input.V[6].O} {of.input.V[6].X}
(assert (= of_74 of_73))
; 
; >=  {((sc.input.V[6].X*0.)+of.input.V[6].X)} {5.}
(assert (<= (+ (* sc_73 0.) of_73) 5.))
; 
; <=  {((sc.input.V[6].X*0.)+of.input.V[6].X)} {0.}
(assert (>= (+ (* sc_73 0.) of_73) 0.))
; 
; >=  {((sc.input.V[6].O*0.)+of.input.V[6].O)} {5.}
(assert (<= (+ (* sc_74 0.) of_74) 5.))
; 
; <=  {((sc.input.V[6].O*0.)+of.input.V[6].O)} {0.}
(assert (>= (+ (* sc_74 0.) of_74) 0.))
(declare-fun sc_75 () Real)
(declare-fun of_75 () Real)
(declare-fun sc_76 () Real)
(declare-fun of_76 () Real)
; 
; =  {sc.input.V[14].O} {sc.input.V[14].X}
(assert (= sc_76 sc_75))
; 
; =  {of.input.V[14].O} {of.input.V[14].X}
(assert (= of_76 of_75))
; 
; >=  {((sc.input.V[14].X*0.595238095238)+of.input.V[14].X)} {5.}
(assert (<= (+ (* sc_75 0.595238095238) of_75) 5.))
; 
; <=  {((sc.input.V[14].X*0.595238095238)+of.input.V[14].X)} {0.}
(assert (>= (+ (* sc_75 0.595238095238) of_75) 0.))
; 
; >=  {((sc.input.V[14].O*0.595238095238)+of.input.V[14].O)} {5.}
(assert (<= (+ (* sc_76 0.595238095238) of_76) 5.))
; 
; <=  {((sc.input.V[14].O*0.595238095238)+of.input.V[14].O)} {0.}
(assert (>= (+ (* sc_76 0.595238095238) of_76) 0.))
(declare-fun sc_77 () Real)
(declare-fun of_77 () Real)
(declare-fun sc_78 () Real)
(declare-fun of_78 () Real)
; 
; =  {sc.input.V[16].O} {sc.input.V[16].X}
(assert (= sc_78 sc_77))
; 
; =  {of.input.V[16].O} {of.input.V[16].X}
(assert (= of_78 of_77))
; 
; >=  {((sc.input.V[16].X*1.)+of.input.V[16].X)} {5.}
(assert (<= (+ (* sc_77 1.) of_77) 5.))
; 
; <=  {((sc.input.V[16].X*1.)+of.input.V[16].X)} {0.}
(assert (>= (+ (* sc_77 1.) of_77) 0.))
; 
; >=  {((sc.input.V[16].O*1.)+of.input.V[16].O)} {5.}
(assert (<= (+ (* sc_78 1.) of_78) 5.))
; 
; <=  {((sc.input.V[16].O*1.)+of.input.V[16].O)} {0.}
(assert (>= (+ (* sc_78 1.) of_78) 0.))
(declare-fun sc_79 () Real)
(declare-fun of_79 () Real)
(declare-fun sc_80 () Real)
(declare-fun of_80 () Real)
; 
; =  {sc.input.V[3].O} {sc.input.V[3].X}
(assert (= sc_80 sc_79))
; 
; =  {of.input.V[3].O} {of.input.V[3].X}
(assert (= of_80 of_79))
; 
; >=  {((sc.input.V[3].X*0.049504950495)+of.input.V[3].X)} {5.}
(assert (<= (+ (* sc_79 0.049504950495) of_79) 5.))
; 
; <=  {((sc.input.V[3].X*0.049504950495)+of.input.V[3].X)} {0.}
(assert (>= (+ (* sc_79 0.049504950495) of_79) 0.))
; 
; >=  {((sc.input.V[3].O*0.049504950495)+of.input.V[3].O)} {5.}
(assert (<= (+ (* sc_80 0.049504950495) of_80) 5.))
; 
; <=  {((sc.input.V[3].O*0.049504950495)+of.input.V[3].O)} {0.}
(assert (>= (+ (* sc_80 0.049504950495) of_80) 0.))
(declare-fun sc_81 () Real)
(declare-fun of_81 () Real)
(declare-fun sc_82 () Real)
(declare-fun of_82 () Real)
; 
; =  {sc.input.V[4].O} {sc.input.V[4].X}
(assert (= sc_82 sc_81))
; 
; =  {of.input.V[4].O} {of.input.V[4].X}
(assert (= of_82 of_81))
; 
; >=  {((sc.input.V[4].X*0.)+of.input.V[4].X)} {5.}
(assert (<= (+ (* sc_81 0.) of_81) 5.))
; 
; <=  {((sc.input.V[4].X*0.)+of.input.V[4].X)} {0.}
(assert (>= (+ (* sc_81 0.) of_81) 0.))
; 
; >=  {((sc.input.V[4].O*0.)+of.input.V[4].O)} {5.}
(assert (<= (+ (* sc_82 0.) of_82) 5.))
; 
; <=  {((sc.input.V[4].O*0.)+of.input.V[4].O)} {0.}
(assert (>= (+ (* sc_82 0.) of_82) 0.))
(declare-fun sc_83 () Real)
(declare-fun of_83 () Real)
(declare-fun sc_84 () Real)
(declare-fun of_84 () Real)
; 
; =  {sc.input.V[5].O} {sc.input.V[5].X}
(assert (= sc_84 sc_83))
; 
; =  {of.input.V[5].O} {of.input.V[5].X}
(assert (= of_84 of_83))
; 
; >=  {((sc.input.V[5].X*0.)+of.input.V[5].X)} {5.}
(assert (<= (+ (* sc_83 0.) of_83) 5.))
; 
; <=  {((sc.input.V[5].X*0.)+of.input.V[5].X)} {0.}
(assert (>= (+ (* sc_83 0.) of_83) 0.))
; 
; >=  {((sc.input.V[5].O*0.)+of.input.V[5].O)} {5.}
(assert (<= (+ (* sc_84 0.) of_84) 5.))
; 
; <=  {((sc.input.V[5].O*0.)+of.input.V[5].O)} {0.}
(assert (>= (+ (* sc_84 0.) of_84) 0.))
(declare-fun sc_85 () Real)
(declare-fun of_85 () Real)
(declare-fun sc_86 () Real)
(declare-fun of_86 () Real)
; 
; =  {sc.input.V[1].O} {sc.input.V[1].X}
(assert (= sc_86 sc_85))
; 
; =  {of.input.V[1].O} {of.input.V[1].X}
(assert (= of_86 of_85))
; 
; >=  {((sc.input.V[1].X*0.00990805326569)+of.input.V[1].X)} {5.}
(assert (<= (+ (* sc_85 0.00990805326569) of_85) 5.))
; 
; <=  {((sc.input.V[1].X*0.00990805326569)+of.input.V[1].X)} {0.}
(assert (>= (+ (* sc_85 0.00990805326569) of_85) 0.))
; 
; >=  {((sc.input.V[1].O*0.00990805326569)+of.input.V[1].O)} {5.}
(assert (<= (+ (* sc_86 0.00990805326569) of_86) 5.))
; 
; <=  {((sc.input.V[1].O*0.00990805326569)+of.input.V[1].O)} {0.}
(assert (>= (+ (* sc_86 0.00990805326569) of_86) 0.))
(declare-fun sc_87 () Real)
(declare-fun of_87 () Real)
(declare-fun sc_88 () Real)
(declare-fun of_88 () Real)
; 
; =  {sc.input.V[17].O} {sc.input.V[17].X}
(assert (= sc_88 sc_87))
; 
; =  {of.input.V[17].O} {of.input.V[17].X}
(assert (= of_88 of_87))
; 
; >=  {((sc.input.V[17].X*1.)+of.input.V[17].X)} {5.}
(assert (<= (+ (* sc_87 1.) of_87) 5.))
; 
; <=  {((sc.input.V[17].X*1.)+of.input.V[17].X)} {0.}
(assert (>= (+ (* sc_87 1.) of_87) 0.))
; 
; >=  {((sc.input.V[17].O*1.)+of.input.V[17].O)} {5.}
(assert (<= (+ (* sc_88 1.) of_88) 5.))
; 
; <=  {((sc.input.V[17].O*1.)+of.input.V[17].O)} {0.}
(assert (>= (+ (* sc_88 1.) of_88) 0.))
(declare-fun sc_89 () Real)
(declare-fun of_89 () Real)
(declare-fun sc_90 () Real)
(declare-fun of_90 () Real)
; 
; =  {sc.input.V[18].O} {sc.input.V[18].X}
(assert (= sc_90 sc_89))
; 
; =  {of.input.V[18].O} {of.input.V[18].X}
(assert (= of_90 of_89))
; 
; >=  {((sc.input.V[18].X*1.)+of.input.V[18].X)} {5.}
(assert (<= (+ (* sc_89 1.) of_89) 5.))
; 
; <=  {((sc.input.V[18].X*1.)+of.input.V[18].X)} {0.}
(assert (>= (+ (* sc_89 1.) of_89) 0.))
; 
; >=  {((sc.input.V[18].O*1.)+of.input.V[18].O)} {5.}
(assert (<= (+ (* sc_90 1.) of_90) 5.))
; 
; <=  {((sc.input.V[18].O*1.)+of.input.V[18].O)} {0.}
(assert (>= (+ (* sc_90 1.) of_90) 0.))
(declare-fun sc_91 () Real)
(declare-fun of_91 () Real)
(declare-fun sc_92 () Real)
(declare-fun of_92 () Real)
; 
; =  {sc.input.V[19].O} {sc.input.V[19].X}
(assert (= sc_92 sc_91))
; 
; =  {of.input.V[19].O} {of.input.V[19].X}
(assert (= of_92 of_91))
; 
; >=  {((sc.input.V[19].X*0.0396322130628)+of.input.V[19].X)} {5.}
(assert (<= (+ (* sc_91 0.0396322130628) of_91) 5.))
; 
; <=  {((sc.input.V[19].X*0.0396322130628)+of.input.V[19].X)} {0.}
(assert (>= (+ (* sc_91 0.0396322130628) of_91) 0.))
; 
; >=  {((sc.input.V[19].O*0.0396322130628)+of.input.V[19].O)} {5.}
(assert (<= (+ (* sc_92 0.0396322130628) of_92) 5.))
; 
; <=  {((sc.input.V[19].O*0.0396322130628)+of.input.V[19].O)} {0.}
(assert (>= (+ (* sc_92 0.0396322130628) of_92) 0.))
(declare-fun sc_93 () Real)
(declare-fun of_93 () Real)
(declare-fun sc_94 () Real)
(declare-fun of_94 () Real)
(declare-fun sc_95 () Real)
(declare-fun of_95 () Real)
(assert (= of_94 0))
(assert (= of_93 0))
; 
; =  {sc.itov[7].Y} {(sc.itov[7].K*sc.itov[7].X)}
(assert (= sc_95 (* sc_94 sc_93)))
; 
; =  {of.itov[7].Y} {0}
(assert (= of_95 0.))
(declare-fun slbot_93 () Real)
(declare-fun sltop_93 () Real)
; 
; =  {(((sc.itov[7].X*0.)+of.itov[7].X)+sl.min.itov[7].X)} {0.0001}
(assert (= (+ (+ (* sc_93 0.) of_93) slbot_93) 0.0001))
; 
; =  {(((sc.itov[7].X*1.)+of.itov[7].X)+sl.max.itov[7].X)} {10.}
(assert (= (+ (+ (* sc_93 1.) of_93) sltop_93) 10.))
(declare-fun slbot_95 () Real)
(declare-fun sltop_95 () Real)
; 
; =  {(((sc.itov[7].Y*0.)+of.itov[7].Y)+sl.min.itov[7].Y)} {0.0001}
(assert (= (+ (+ (* sc_95 0.) of_95) slbot_95) 0.0001))
; 
; =  {(((sc.itov[7].Y*9.26)+of.itov[7].Y)+sl.max.itov[7].Y)} {3300.}
(assert (= (+ (+ (* sc_95 9.26) of_95) sltop_95) 3300.))
; 
; >=  {((sc.itov[7].K*9.26)+of.itov[7].K)} {330.}
(assert (<= (+ (* sc_94 9.26) of_94) 330.))
; 
; <=  {((sc.itov[7].K*9.26)+of.itov[7].K)} {1.}
(assert (>= (+ (* sc_94 9.26) of_94) 1.))
(declare-fun slbot_95 () Real)
(declare-fun sltop_95 () Real)
; 
; =  {(((sc.itov[7].Y*0.)+of.itov[7].Y)+sl.min.itov[7].Y)} {0.0001}
(assert (= (+ (+ (* sc_95 0.) of_95) slbot_95) 0.0001))
; 
; =  {(((sc.itov[7].Y*9.26)+of.itov[7].Y)+sl.max.itov[7].Y)} {3300.}
(assert (= (+ (+ (* sc_95 9.26) of_95) sltop_95) 3300.))
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
(declare-fun sc_99 () Real)
(declare-fun of_99 () Real)
(declare-fun sc_100 () Real)
(declare-fun of_100 () Real)
(declare-fun sc_101 () Real)
(declare-fun of_101 () Real)
(assert (= of_100 0))
(assert (= of_99 0))
; 
; =  {sc.itov[4].Y} {(sc.itov[4].K*sc.itov[4].X)}
(assert (= sc_101 (* sc_100 sc_99)))
; 
; =  {of.itov[4].Y} {0}
(assert (= of_101 0.))
(declare-fun slbot_99 () Real)
(declare-fun sltop_99 () Real)
; 
; =  {(((sc.itov[4].X*0.)+of.itov[4].X)+sl.min.itov[4].X)} {0.0001}
(assert (= (+ (+ (* sc_99 0.) of_99) slbot_99) 0.0001))
; 
; =  {(((sc.itov[4].X*1.)+of.itov[4].X)+sl.max.itov[4].X)} {10.}
(assert (= (+ (+ (* sc_99 1.) of_99) sltop_99) 10.))
(declare-fun slbot_101 () Real)
(declare-fun sltop_101 () Real)
; 
; =  {(((sc.itov[4].Y*0.)+of.itov[4].Y)+sl.min.itov[4].Y)} {0.0001}
(assert (= (+ (+ (* sc_101 0.) of_101) slbot_101) 0.0001))
; 
; =  {(((sc.itov[4].Y*12.616)+of.itov[4].Y)+sl.max.itov[4].Y)} {3300.}
(assert (= (+ (+ (* sc_101 12.616) of_101) sltop_101) 3300.))
; 
; >=  {((sc.itov[4].K*12.616)+of.itov[4].K)} {330.}
(assert (<= (+ (* sc_100 12.616) of_100) 330.))
; 
; <=  {((sc.itov[4].K*12.616)+of.itov[4].K)} {1.}
(assert (>= (+ (* sc_100 12.616) of_100) 1.))
(declare-fun slbot_101 () Real)
(declare-fun sltop_101 () Real)
; 
; =  {(((sc.itov[4].Y*0.)+of.itov[4].Y)+sl.min.itov[4].Y)} {0.0001}
(assert (= (+ (+ (* sc_101 0.) of_101) slbot_101) 0.0001))
; 
; =  {(((sc.itov[4].Y*12.616)+of.itov[4].Y)+sl.max.itov[4].Y)} {3300.}
(assert (= (+ (+ (* sc_101 12.616) of_101) sltop_101) 3300.))
; 
; =  {sc.input.V[17].O} {sc.vgain[8].X}
(assert (= sc_88 sc_4))
; 
; =  {of.input.V[17].O} {of.vgain[8].X}
(assert (= of_88 of_4))
; 
; =  {sc.vadd[1].OUT2} {sc.output.V[0].X}
(assert (= sc_52 sc_16))
; 
; =  {of.vadd[1].OUT2} {of.output.V[0].X}
(assert (= of_52 of_16))
; 
; =  {sc.vgain[8].P} {sc.vadd[11].B}
(assert (= sc_7 sc_29))
; 
; =  {of.vgain[8].P} {of.vadd[11].B}
(assert (= of_7 of_29))
; 
; =  {sc.input.V[9].O} {sc.vadd[11].A}
(assert (= sc_64 sc_28))
; 
; =  {of.input.V[9].O} {of.vadd[11].A}
(assert (= of_64 of_28))
; 
; =  {sc.input.V[15].O} {sc.vgain[0].X}
(assert (= sc_72 sc_8))
; 
; =  {of.input.V[15].O} {of.vgain[0].X}
(assert (= of_72 of_8))
; 
; =  {sc.input.V[13].O} {sc.vadd[3].OUT2_0}
(assert (= sc_60 sc_39))
; 
; =  {of.input.V[13].O} {of.vadd[3].OUT2_0}
(assert (= of_60 of_39))
; 
; =  {sc.input.V[14].O} {sc.vgain[0].Y}
(assert (= sc_76 sc_9))
; 
; =  {of.input.V[14].O} {of.vgain[0].Y}
(assert (= of_76 of_9))
; 
; =  {sc.input.V[11].O} {sc.itov[4].K}
(assert (= sc_68 sc_100))
; 
; =  {of.input.V[11].O} {of.itov[4].K}
(assert (= of_68 of_100))
; 
; =  {sc.input.V[8].O} {sc.vadd[9].OUT2_0}
(assert (= sc_56 sc_18))
; 
; =  {of.input.V[8].O} {of.vadd[9].OUT2_0}
(assert (= of_56 of_18))
; 
; =  {sc.input.V[12].O} {sc.vadd[6].OUT2_0}
(assert (= sc_62 sc_32))
; 
; =  {of.input.V[12].O} {of.vadd[6].OUT2_0}
(assert (= of_62 of_32))
; 
; =  {sc.input.V[2].O} {sc.itov[7].K}
(assert (= sc_54 sc_94))
; 
; =  {of.input.V[2].O} {of.itov[7].K}
(assert (= of_54 of_94))
; 
; =  {sc.input.V[3].O} {sc.vgain[2].Y}
(assert (= sc_80 sc_1))
; 
; =  {of.input.V[3].O} {of.vgain[2].Y}
(assert (= of_80 of_1))
; 
; =  {sc.itov[7].Y} {sc.vadd[6].B}
(assert (= sc_95 sc_36))
; 
; =  {of.itov[7].Y} {of.vadd[6].B}
(assert (= of_95 of_36))
; 
; =  {sc.vadd[11].OUT} {sc.itov[10].K}
(assert (= sc_30 sc_97))
; 
; =  {of.vadd[11].OUT} {of.itov[10].K}
(assert (= of_30 of_97))
; 
; =  {sc.input.V[19].O} {sc.vgain[5].Y}
(assert (= sc_92 sc_13))
; 
; =  {of.input.V[19].O} {of.vgain[5].Y}
(assert (= of_92 of_13))
; 
; =  {sc.vadd[3].OUT2} {sc.vgain[5].Z}
(assert (= sc_45 sc_14))
; 
; =  {of.vadd[3].OUT2} {of.vgain[5].Z}
(assert (= of_45 of_14))
; 
; =  {sc.vadd[3].OUT2} {sc.vgain[8].Z}
(assert (= sc_45 sc_6))
; 
; =  {of.vadd[3].OUT2} {of.vgain[8].Z}
(assert (= of_45 of_6))
; 
; =  {sc.input.V[1].O} {sc.vgain[8].Y}
(assert (= sc_86 sc_5))
; 
; =  {of.input.V[1].O} {of.vgain[8].Y}
(assert (= of_86 of_5))
; 
; =  {sc.vgain[0].P} {sc.vadd[1].B}
(assert (= sc_11 sc_50))
; 
; =  {of.vgain[0].P} {of.vadd[1].B}
(assert (= of_11 of_50))
; 
; =  {sc.input.V[7].O} {sc.vadd[6].A}
(assert (= sc_58 sc_35))
; 
; =  {of.input.V[7].O} {of.vadd[6].A}
(assert (= of_58 of_35))
; 
; =  {sc.vadd[9].OUT2} {sc.vgain[0].Z}
(assert (= sc_24 sc_10))
; 
; =  {of.vadd[9].OUT2} {of.vgain[0].Z}
(assert (= of_24 of_10))
; 
; =  {sc.vadd[9].OUT2} {sc.itov[7].X}
(assert (= sc_24 sc_93))
; 
; =  {of.vadd[9].OUT2} {of.itov[7].X}
(assert (= of_24 of_93))
; 
; =  {sc.vadd[9].OUT2} {sc.vgain[2].Z}
(assert (= sc_24 sc_2))
; 
; =  {of.vadd[9].OUT2} {of.vgain[2].Z}
(assert (= of_24 of_2))
; 
; =  {sc.input.V[0].O} {sc.vadd[9].D}
(assert (= sc_66 sc_19))
; 
; =  {of.input.V[0].O} {of.vadd[9].D}
(assert (= of_66 of_19))
; 
; =  {sc.input.V[10].O} {sc.vadd[9].A}
(assert (= sc_70 sc_21))
; 
; =  {of.input.V[10].O} {of.vadd[9].A}
(assert (= of_70 of_21))
; 
; =  {sc.itov[10].Y} {sc.vadd[9].B}
(assert (= sc_98 sc_22))
; 
; =  {of.itov[10].Y} {of.vadd[9].B}
(assert (= of_98 of_22))
; 
; =  {sc.input.V[16].O} {sc.vgain[2].X}
(assert (= sc_78 sc_0))
; 
; =  {of.input.V[16].O} {of.vgain[2].X}
(assert (= of_78 of_0))
; 
; =  {sc.input.V[18].O} {sc.vgain[5].X}
(assert (= sc_90 sc_12))
; 
; =  {of.input.V[18].O} {of.vgain[5].X}
(assert (= of_90 of_12))
; 
; =  {sc.itov[4].Y} {sc.vadd[3].D}
(assert (= sc_101 sc_40))
; 
; =  {of.itov[4].Y} {of.vadd[3].D}
(assert (= of_101 of_40))
; 
; =  {sc.input.V[4].O} {sc.vadd[1].OUT2_0}
(assert (= sc_82 sc_46))
; 
; =  {of.input.V[4].O} {of.vadd[1].OUT2_0}
(assert (= of_82 of_46))
; 
; =  {sc.vadd[6].OUT2} {sc.itov[10].X}
(assert (= sc_38 sc_96))
; 
; =  {of.vadd[6].OUT2} {of.itov[10].X}
(assert (= of_38 of_96))
; 
; =  {sc.vadd[6].OUT2} {sc.itov[4].X}
(assert (= sc_38 sc_99))
; 
; =  {of.vadd[6].OUT2} {of.itov[4].X}
(assert (= of_38 of_99))
; 
; =  {sc.input.V[5].O} {sc.vadd[1].A}
(assert (= sc_84 sc_49))
; 
; =  {of.input.V[5].O} {of.vadd[1].A}
(assert (= of_84 of_49))
; 
; =  {sc.input.V[6].O} {sc.vadd[3].A}
(assert (= sc_74 sc_42))
; 
; =  {of.input.V[6].O} {of.vadd[3].A}
(assert (= of_74 of_42))
; 
; =  {sc.vgain[2].P} {sc.vadd[3].B}
(assert (= sc_3 sc_43))
; 
; =  {of.vgain[2].P} {of.vadd[3].B}
(assert (= of_3 of_43))
; 
; =  {sc.vgain[5].P} {sc.vadd[6].D}
(assert (= sc_15 sc_33))
; 
; =  {of.vgain[5].P} {of.vadd[6].D}
(assert (= of_15 of_33))
(assert (<= (* sc_17 0.001) 1.))
; 
; =  {sc.vadd[1].OUT2} {sc.output.V[0].O} {sc.vadd[6].OUT2} {sc.vadd[3].OUT2} {sc.vadd[9].OUT2}
(assert (and (and (and (= sc_52 sc_17) (= sc_52 sc_38)) (= sc_52 sc_45)) (= sc_52 sc_24)))
(assert (= __minima__ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (* (ite (>= sltop_36 0) sltop_36 (- sltop_36)) 1.) (* (ite (>= slbot_14 0) slbot_14 (- slbot_14)) 1.)) (* (ite (>= sltop_96 0) sltop_96 (- sltop_96)) 1.)) (* (ite (>= sltop_14 0) sltop_14 (- sltop_14)) 1.)) (* (ite (>= slbot_44 0) slbot_44 (- slbot_44)) 1.)) (* (ite (>= slbot_16 0) slbot_16 (- slbot_16)) 1.)) (* (ite (>= slbot_10 0) slbot_10 (- slbot_10)) 1.)) (* (ite (>= slbot_3 0) slbot_3 (- slbot_3)) 1.)) (* (ite (>= slbot_2 0) slbot_2 (- slbot_2)) 1.)) (* (ite (>= sltop_10 0) sltop_10 (- sltop_10)) 1.)) (* (ite (>= slbot_36 0) slbot_36 (- slbot_36)) 1.)) (* (ite (>= sltop_22 0) sltop_22 (- sltop_22)) 1.)) (* (ite (>= slbot_96 0) slbot_96 (- slbot_96)) 1.)) (* (ite (>= slbot_99 0) slbot_99 (- slbot_99)) 1.)) (* (ite (>= sltop_2 0) sltop_2 (- sltop_2)) 1.)) (* (ite (>= sltop_15 0) sltop_15 (- sltop_15)) 1.)) (* (ite (>= sltop_24 0) sltop_24 (- sltop_24)) 1.)) (* (ite (>= slbot_95 0) slbot_95 (- slbot_95)) 1.)) (* (ite (>= sltop_51 0) sltop_51 (- sltop_51)) 1.)) (* (ite (>= slbot_98 0) slbot_98 (- slbot_98)) 1.)) (* (ite (>= slbot_45 0) slbot_45 (- slbot_45)) 1.)) (* (ite (>= slbot_6 0) slbot_6 (- slbot_6)) 1.)) (* (ite (>= slbot_38 0) slbot_38 (- slbot_38)) 1.)) (* (ite (>= sltop_45 0) sltop_45 (- sltop_45)) 1.)) (* (ite (>= slbot_23 0) slbot_23 (- slbot_23)) 1.)) (* (ite (>= sltop_17 0) sltop_17 (- sltop_17)) 1.)) (* (ite (>= sltop_3 0) sltop_3 (- sltop_3)) 1.)) (* (ite (>= sltop_40 0) sltop_40 (- sltop_40)) 1.)) (* (ite (>= slbot_7 0) slbot_7 (- slbot_7)) 1.)) (* (ite (>= sltop_99 0) sltop_99 (- sltop_99)) 1.)) (* (ite (>= slbot_29 0) slbot_29 (- slbot_29)) 1.)) (* (ite (>= slbot_22 0) slbot_22 (- slbot_22)) 1.)) (* (ite (>= sltop_23 0) sltop_23 (- sltop_23)) 1.)) (* (ite (>= sltop_52 0) sltop_52 (- sltop_52)) 1.)) (* (ite (>= sltop_101 0) sltop_101 (- sltop_101)) 1.)) (* (ite (>= slbot_11 0) slbot_11 (- slbot_11)) 1.)) (* (ite (>= slbot_101 0) slbot_101 (- slbot_101)) 1.)) (* (ite (>= sltop_11 0) sltop_11 (- sltop_11)) 1.)) (* (ite (>= slbot_37 0) slbot_37 (- slbot_37)) 1.)) (* (ite (>= sltop_7 0) sltop_7 (- sltop_7)) 1.)) (* (ite (>= sltop_38 0) sltop_38 (- sltop_38)) 1.)) (* (ite (>= sltop_44 0) sltop_44 (- sltop_44)) 1.)) (* (ite (>= slbot_15 0) slbot_15 (- slbot_15)) 1.)) (* (ite (>= slbot_17 0) slbot_17 (- slbot_17)) 1.)) (* (ite (>= sltop_29 0) sltop_29 (- sltop_29)) 1.)) (* (ite (>= slbot_24 0) slbot_24 (- slbot_24)) 1.)) (* (ite (>= sltop_98 0) sltop_98 (- sltop_98)) 1.)) (* (ite (>= sltop_16 0) sltop_16 (- sltop_16)) 1.)) (* (ite (>= slbot_52 0) slbot_52 (- slbot_52)) 1.)) (* (ite (>= slbot_51 0) slbot_51 (- slbot_51)) 1.)) (* (ite (>= sltop_95 0) sltop_95 (- sltop_95)) 1.)) (* (ite (>= slbot_93 0) slbot_93 (- slbot_93)) 1.)) (* (ite (>= slbot_30 0) slbot_30 (- slbot_30)) 1.)) (* (ite (>= sltop_97 0) sltop_97 (- sltop_97)) 1.)) (* (ite (>= slbot_43 0) slbot_43 (- slbot_43)) 1.)) (* (ite (>= slbot_50 0) slbot_50 (- slbot_50)) 1.)) (* (ite (>= sltop_93 0) sltop_93 (- sltop_93)) 1.)) (* (ite (>= sltop_30 0) sltop_30 (- sltop_30)) 1.)) (* (ite (>= sltop_50 0) sltop_50 (- sltop_50)) 1.)) (* (ite (>= sltop_37 0) sltop_37 (- sltop_37)) 1.)) (* (ite (>= sltop_6 0) sltop_6 (- sltop_6)) 1.)) (* (ite (>= sltop_43 0) sltop_43 (- sltop_43)) 1.)) (* (ite (>= slbot_33 0) slbot_33 (- slbot_33)) 1.)) (* (ite (>= sltop_33 0) sltop_33 (- sltop_33)) 1.)) (* (ite (>= slbot_40 0) slbot_40 (- slbot_40)) 1.)) (* (ite (>= slbot_97 0) slbot_97 (- slbot_97)) 1.))))
(check-sat)
