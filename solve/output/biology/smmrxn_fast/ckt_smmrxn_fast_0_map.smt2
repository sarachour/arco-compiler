(set-logic QF_NRA)
(declare-fun __minima__ () Real)
(declare-fun sc_0 () Real)
(assert (> sc_0 1e-08))
(declare-fun of_0 () Real)
(declare-fun sc_1 () Real)
(assert (> sc_1 1e-08))
(declare-fun of_1 () Real)
; 
; =  {sc.input.I[0].O} {sc.input.I[0].X}
(assert (= sc_1 sc_0))
; 
; =  {of.input.I[0].O} {of.input.I[0].X}
(assert (= of_1 of_0))
; 
; >=  {((sc.input.I[0].X*1.)+of.input.I[0].X)} {10.}
(assert (<= (+ (* sc_0 1.) of_0) 10.))
; 
; <=  {((sc.input.I[0].X*1.)+of.input.I[0].X)} {0.}
(assert (>= (+ (* sc_0 1.) of_0) 0.))
; 
; >=  {((sc.input.I[0].O*1.)+of.input.I[0].O)} {10.}
(assert (<= (+ (* sc_1 1.) of_1) 10.))
; 
; <=  {((sc.input.I[0].O*1.)+of.input.I[0].O)} {0.}
(assert (>= (+ (* sc_1 1.) of_1) 0.))
(declare-fun sc_2 () Real)
(assert (> sc_2 1e-08))
(declare-fun of_2 () Real)
(declare-fun sc_3 () Real)
(assert (> sc_3 1e-08))
(declare-fun of_3 () Real)
; 
; =  {sc.input.I[1].O} {sc.input.I[1].X}
(assert (= sc_3 sc_2))
; 
; =  {of.input.I[1].O} {of.input.I[1].X}
(assert (= of_3 of_2))
; 
; >=  {((sc.input.I[1].X*1.)+of.input.I[1].X)} {10.}
(assert (<= (+ (* sc_2 1.) of_2) 10.))
; 
; <=  {((sc.input.I[1].X*1.)+of.input.I[1].X)} {0.}
(assert (>= (+ (* sc_2 1.) of_2) 0.))
; 
; >=  {((sc.input.I[1].O*1.)+of.input.I[1].O)} {10.}
(assert (<= (+ (* sc_3 1.) of_3) 10.))
; 
; <=  {((sc.input.I[1].O*1.)+of.input.I[1].O)} {0.}
(assert (>= (+ (* sc_3 1.) of_3) 0.))
(declare-fun sc_4 () Real)
(assert (> sc_4 1e-08))
(declare-fun of_4 () Real)
(declare-fun sc_5 () Real)
(assert (> sc_5 1e-08))
(declare-fun of_5 () Real)
; 
; =  {sc.output.V[2].O} {sc.output.V[2].X}
(assert (= sc_5 sc_4))
; 
; =  {of.output.V[2].O} {of.output.V[2].X}
(assert (= of_5 of_4))
(declare-fun slbot_4 () Real)
(declare-fun sltop_4 () Real)
; 
; =  {(((sc.output.V[2].X*0.)+of.output.V[2].X)+sl.min.output.V[2].X)} {0.0001}
(assert (= (+ (+ (* sc_4 0.) of_4) slbot_4) 0.0001))
; 
; =  {(((sc.output.V[2].X*0.11)+of.output.V[2].X)+sl.max.output.V[2].X)} {3300.}
(assert (= (+ (+ (* sc_4 0.11) of_4) sltop_4) 3300.))
(declare-fun slbot_5 () Real)
(declare-fun sltop_5 () Real)
; 
; =  {(((sc.output.V[2].O*0.)+of.output.V[2].O)+sl.min.output.V[2].O)} {0.0001}
(assert (= (+ (+ (* sc_5 0.) of_5) slbot_5) 0.0001))
; 
; =  {(((sc.output.V[2].O*0.11)+of.output.V[2].O)+sl.max.output.V[2].O)} {3300.}
(assert (= (+ (+ (* sc_5 0.11) of_5) sltop_5) 3300.))
(declare-fun sc_6 () Real)
(assert (> sc_6 1e-08))
(declare-fun of_6 () Real)
(declare-fun sc_7 () Real)
(assert (> sc_7 1e-08))
(declare-fun of_7 () Real)
; 
; =  {sc.output.V[0].O} {sc.output.V[0].X}
(assert (= sc_7 sc_6))
; 
; =  {of.output.V[0].O} {of.output.V[0].X}
(assert (= of_7 of_6))
(declare-fun slbot_6 () Real)
(declare-fun sltop_6 () Real)
; 
; =  {(((sc.output.V[0].X*0.)+of.output.V[0].X)+sl.min.output.V[0].X)} {0.0001}
(assert (= (+ (+ (* sc_6 0.) of_6) slbot_6) 0.0001))
; 
; =  {(((sc.output.V[0].X*0.11)+of.output.V[0].X)+sl.max.output.V[0].X)} {3300.}
(assert (= (+ (+ (* sc_6 0.11) of_6) sltop_6) 3300.))
(declare-fun slbot_7 () Real)
(declare-fun sltop_7 () Real)
; 
; =  {(((sc.output.V[0].O*0.)+of.output.V[0].O)+sl.min.output.V[0].O)} {0.0001}
(assert (= (+ (+ (* sc_7 0.) of_7) slbot_7) 0.0001))
; 
; =  {(((sc.output.V[0].O*0.11)+of.output.V[0].O)+sl.max.output.V[0].O)} {3300.}
(assert (= (+ (+ (* sc_7 0.11) of_7) sltop_7) 3300.))
(declare-fun sc_8 () Real)
(assert (> sc_8 1e-08))
(declare-fun of_8 () Real)
(declare-fun sc_9 () Real)
(assert (> sc_9 1e-08))
(declare-fun of_9 () Real)
; 
; =  {sc.output.V[1].O} {sc.output.V[1].X}
(assert (= sc_9 sc_8))
; 
; =  {of.output.V[1].O} {of.output.V[1].X}
(assert (= of_9 of_8))
(declare-fun slbot_8 () Real)
(declare-fun sltop_8 () Real)
; 
; =  {(((sc.output.V[1].X*0.)+of.output.V[1].X)+sl.min.output.V[1].X)} {0.0001}
(assert (= (+ (+ (* sc_8 0.) of_8) slbot_8) 0.0001))
; 
; =  {(((sc.output.V[1].X*0.15)+of.output.V[1].X)+sl.max.output.V[1].X)} {3300.}
(assert (= (+ (+ (* sc_8 0.15) of_8) sltop_8) 3300.))
(declare-fun slbot_9 () Real)
(declare-fun sltop_9 () Real)
; 
; =  {(((sc.output.V[1].O*0.)+of.output.V[1].O)+sl.min.output.V[1].O)} {0.0001}
(assert (= (+ (+ (* sc_9 0.) of_9) slbot_9) 0.0001))
; 
; =  {(((sc.output.V[1].O*0.15)+of.output.V[1].O)+sl.max.output.V[1].O)} {3300.}
(assert (= (+ (+ (* sc_9 0.15) of_9) sltop_9) 3300.))
(declare-fun sc_10 () Real)
(assert (> sc_10 1e-08))
(declare-fun of_10 () Real)
(declare-fun sc_11 () Real)
(assert (> sc_11 1e-08))
(declare-fun of_11 () Real)
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
(declare-fun sc_16 () Real)
(assert (> sc_16 1e-08))
(declare-fun of_16 () Real)
(declare-fun sc_17 () Real)
(assert (> sc_17 1e-08))
(declare-fun of_17 () Real)
; 
; =  {sc.mm[0].Xtot} {sc.mm[0].XY}
(assert (= sc_14 sc_16))
; 
; =  {sc.mm[0].X} {sc.mm[0].Xtot}
(assert (= sc_15 sc_14))
; 
; =  {of.mm[0].X} {(of.mm[0].Xtot-of.mm[0].XY)}
(assert (= of_15 (- of_14 of_16)))
; no offset
(assert (= of_10 0.))
; no offset
(assert (= 0. 0.))
; no offset
(assert (= of_13 0.))
; no offset
(assert (= of_15 0.))
; no offset
(assert (= of_17 0.))
; 
; =  {(sc.mm[0].kf*sc.mm[0].X*sc.mm[0].Y)} {(sc.mm[0].kr*1.)}
(assert (= (* (* sc_13 sc_15) sc_17) (* sc_10 1.)))
; 
; =  {sc.mm[0].XY} {(sc.mm[0].kf*sc.mm[0].X*sc.mm[0].Y)}
(assert (= sc_16 (* (* sc_13 sc_15) sc_17)))
; no offset
(assert (= of_16 0.))
; no offset
(assert (= 0. 0.))
; 
; =  {sc.mm[0].XY0} {(sc.mm[0].kf*sc.mm[0].X*sc.mm[0].Y)}
(assert (= sc_11 (* (* sc_13 sc_15) sc_17)))
; 
; =  {of.mm[0].XY0} {(0.-0.)}
(assert (= of_11 0.))
; 
; =  {sc.mm[0].Ytot} {sc.mm[0].XY}
(assert (= sc_12 sc_16))
; 
; =  {sc.mm[0].Y} {sc.mm[0].Ytot}
(assert (= sc_17 sc_12))
; 
; =  {of.mm[0].Y} {(of.mm[0].Ytot-of.mm[0].XY)}
(assert (= of_17 (- of_12 of_16)))
; 
; >=  {((sc.mm[0].kr*1.)+of.mm[0].kr)} {10.}
(assert (<= (+ (* sc_10 1.) of_10) 10.))
; 
; <=  {((sc.mm[0].kr*1.)+of.mm[0].kr)} {0.0001}
(assert (>= (+ (* sc_10 1.) of_10) 0.0001))
(declare-fun slbot_15 () Real)
(declare-fun sltop_15 () Real)
; 
; =  {(((sc.mm[0].X*0.)+of.mm[0].X)+sl.min.mm[0].X)} {-3299.9999}
(assert (= (+ (+ (* sc_15 0.) of_15) slbot_15) -3299.9999))
; 
; =  {(((sc.mm[0].X*0.15)+of.mm[0].X)+sl.max.mm[0].X)} {3300.}
(assert (= (+ (+ (* sc_15 0.15) of_15) sltop_15) 3300.))
(declare-fun slbot_16 () Real)
(declare-fun sltop_16 () Real)
; 
; =  {(((sc.mm[0].XY*0.)+of.mm[0].XY)+sl.min.mm[0].XY)} {0.}
(assert (= (+ (+ (* sc_16 0.) of_16) slbot_16) 0.))
; 
; =  {(((sc.mm[0].XY*0.11)+of.mm[0].XY)+sl.max.mm[0].XY)} {3300.}
(assert (= (+ (+ (* sc_16 0.11) of_16) sltop_16) 3300.))
(declare-fun slbot_17 () Real)
(declare-fun sltop_17 () Real)
; 
; =  {(((sc.mm[0].Y*0.)+of.mm[0].Y)+sl.min.mm[0].Y)} {-3299.9999}
(assert (= (+ (+ (* sc_17 0.) of_17) slbot_17) -3299.9999))
; 
; =  {(((sc.mm[0].Y*0.11)+of.mm[0].Y)+sl.max.mm[0].Y)} {3300.}
(assert (= (+ (+ (* sc_17 0.11) of_17) sltop_17) 3300.))
; 
; >=  {((sc.mm[0].XY0*0.)+of.mm[0].XY0)} {3300.}
(assert (<= (+ (* sc_11 0.) of_11) 3300.))
; 
; <=  {((sc.mm[0].XY0*0.)+of.mm[0].XY0)} {0.}
(assert (>= (+ (* sc_11 0.) of_11) 0.))
; 
; >=  {((sc.mm[0].Ytot*0.11)+of.mm[0].Ytot)} {3300.}
(assert (<= (+ (* sc_12 0.11) of_12) 3300.))
; 
; <=  {((sc.mm[0].Ytot*0.11)+of.mm[0].Ytot)} {0.0001}
(assert (>= (+ (* sc_12 0.11) of_12) 0.0001))
; 
; >=  {((sc.mm[0].Xtot*0.15)+of.mm[0].Xtot)} {3300.}
(assert (<= (+ (* sc_14 0.15) of_14) 3300.))
; 
; <=  {((sc.mm[0].Xtot*0.15)+of.mm[0].Xtot)} {0.0001}
(assert (>= (+ (* sc_14 0.15) of_14) 0.0001))
; 
; >=  {((sc.mm[0].kf*1.)+of.mm[0].kf)} {10.}
(assert (<= (+ (* sc_13 1.) of_13) 10.))
; 
; <=  {((sc.mm[0].kf*1.)+of.mm[0].kf)} {0.0001}
(assert (>= (+ (* sc_13 1.) of_13) 0.0001))
(declare-fun sc_18 () Real)
(assert (> sc_18 1e-08))
(declare-fun of_18 () Real)
(declare-fun sc_19 () Real)
(assert (> sc_19 1e-08))
(declare-fun of_19 () Real)
; 
; =  {sc.input.V[2].O} {sc.input.V[2].X}
(assert (= sc_19 sc_18))
; 
; =  {of.input.V[2].O} {of.input.V[2].X}
(assert (= of_19 of_18))
; 
; >=  {((sc.input.V[2].X*0.15)+of.input.V[2].X)} {3300.}
(assert (<= (+ (* sc_18 0.15) of_18) 3300.))
; 
; <=  {((sc.input.V[2].X*0.15)+of.input.V[2].X)} {0.}
(assert (>= (+ (* sc_18 0.15) of_18) 0.))
; 
; >=  {((sc.input.V[2].O*0.15)+of.input.V[2].O)} {3300.}
(assert (<= (+ (* sc_19 0.15) of_19) 3300.))
; 
; <=  {((sc.input.V[2].O*0.15)+of.input.V[2].O)} {0.}
(assert (>= (+ (* sc_19 0.15) of_19) 0.))
(declare-fun sc_20 () Real)
(assert (> sc_20 1e-08))
(declare-fun of_20 () Real)
(declare-fun sc_21 () Real)
(assert (> sc_21 1e-08))
(declare-fun of_21 () Real)
; 
; =  {sc.input.V[0].O} {sc.input.V[0].X}
(assert (= sc_21 sc_20))
; 
; =  {of.input.V[0].O} {of.input.V[0].X}
(assert (= of_21 of_20))
; 
; >=  {((sc.input.V[0].X*0.11)+of.input.V[0].X)} {3300.}
(assert (<= (+ (* sc_20 0.11) of_20) 3300.))
; 
; <=  {((sc.input.V[0].X*0.11)+of.input.V[0].X)} {0.}
(assert (>= (+ (* sc_20 0.11) of_20) 0.))
; 
; >=  {((sc.input.V[0].O*0.11)+of.input.V[0].O)} {3300.}
(assert (<= (+ (* sc_21 0.11) of_21) 3300.))
; 
; <=  {((sc.input.V[0].O*0.11)+of.input.V[0].O)} {0.}
(assert (>= (+ (* sc_21 0.11) of_21) 0.))
(declare-fun sc_22 () Real)
(assert (> sc_22 1e-08))
(declare-fun of_22 () Real)
(declare-fun sc_23 () Real)
(assert (> sc_23 1e-08))
(declare-fun of_23 () Real)
; 
; =  {sc.input.V[1].O} {sc.input.V[1].X}
(assert (= sc_23 sc_22))
; 
; =  {of.input.V[1].O} {of.input.V[1].X}
(assert (= of_23 of_22))
; 
; >=  {((sc.input.V[1].X*0.)+of.input.V[1].X)} {3300.}
(assert (<= (+ (* sc_22 0.) of_22) 3300.))
; 
; <=  {((sc.input.V[1].X*0.)+of.input.V[1].X)} {0.}
(assert (>= (+ (* sc_22 0.) of_22) 0.))
; 
; >=  {((sc.input.V[1].O*0.)+of.input.V[1].O)} {3300.}
(assert (<= (+ (* sc_23 0.) of_23) 3300.))
; 
; <=  {((sc.input.V[1].O*0.)+of.input.V[1].O)} {0.}
(assert (>= (+ (* sc_23 0.) of_23) 0.))
; 
; =  {sc.input.I[0].O} {sc.mm[0].kr}
(assert (= sc_1 sc_10))
; 
; =  {of.input.I[0].O} {of.mm[0].kr}
(assert (= of_1 of_10))
; 
; =  {sc.mm[0].Y} {sc.output.V[0].X}
(assert (= sc_17 sc_6))
; 
; =  {of.mm[0].Y} {of.output.V[0].X}
(assert (= of_17 of_6))
; 
; =  {sc.mm[0].X} {sc.output.V[1].X}
(assert (= sc_15 sc_8))
; 
; =  {of.mm[0].X} {of.output.V[1].X}
(assert (= of_15 of_8))
; 
; =  {sc.input.V[2].O} {sc.mm[0].Xtot}
(assert (= sc_19 sc_14))
; 
; =  {of.input.V[2].O} {of.mm[0].Xtot}
(assert (= of_19 of_14))
; 
; =  {sc.input.I[1].O} {sc.mm[0].kf}
(assert (= sc_3 sc_13))
; 
; =  {of.input.I[1].O} {of.mm[0].kf}
(assert (= of_3 of_13))
; 
; =  {sc.input.V[1].O} {sc.mm[0].XY0}
(assert (= sc_23 sc_11))
; 
; =  {of.input.V[1].O} {of.mm[0].XY0}
(assert (= of_23 of_11))
; 
; =  {sc.mm[0].XY} {sc.output.V[2].X}
(assert (= sc_16 sc_4))
; 
; =  {of.mm[0].XY} {of.output.V[2].X}
(assert (= of_16 of_4))
; 
; =  {sc.input.V[0].O} {sc.mm[0].Ytot}
(assert (= sc_21 sc_12))
; 
; =  {of.input.V[0].O} {of.mm[0].Ytot}
(assert (= of_21 of_12))
(assert (<= (* sc_5 0.001) 0.1))
; 
; =  {sc.mm[0].XY} {sc.output.V[2].O}
(assert (= sc_16 sc_5))
(assert (= __minima__ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (ite (>= slbot_16 0.) slbot_16 (- slbot_16)) (ite (>= sltop_4 0.) sltop_4 (- sltop_4))) (ite (>= sltop_7 0.) sltop_7 (- sltop_7))) (ite (>= slbot_15 0.) slbot_15 (- slbot_15))) (ite (>= slbot_17 0.) slbot_17 (- slbot_17))) (ite (>= sltop_8 0.) sltop_8 (- sltop_8))) (ite (>= sltop_15 0.) sltop_15 (- sltop_15))) (ite (>= sltop_5 0.) sltop_5 (- sltop_5))) (ite (>= slbot_4 0.) slbot_4 (- slbot_4))) (ite (>= slbot_9 0.) slbot_9 (- slbot_9))) (ite (>= sltop_9 0.) sltop_9 (- sltop_9))) (ite (>= sltop_16 0.) sltop_16 (- sltop_16))) (ite (>= slbot_5 0.) slbot_5 (- slbot_5))) (ite (>= slbot_6 0.) slbot_6 (- slbot_6))) (ite (>= sltop_17 0.) sltop_17 (- sltop_17))) (ite (>= sltop_6 0.) sltop_6 (- sltop_6))) (ite (>= slbot_7 0.) slbot_7 (- slbot_7))) (ite (>= slbot_8 0.) slbot_8 (- slbot_8)))))
(check-sat)
