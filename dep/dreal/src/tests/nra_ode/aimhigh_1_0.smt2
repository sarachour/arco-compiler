(set-logic QF_NRA_ODE)
(declare-fun y () Real)
(declare-fun x () Real)
(declare-fun on () Real)
(declare-fun aim_height () Real)
(declare-fun y_0_0 () Real)
(declare-fun y_0_t () Real)
(declare-fun y_1_0 () Real)
(declare-fun y_1_t () Real)
(declare-fun x_0_0 () Real)
(declare-fun x_0_t () Real)
(declare-fun x_1_0 () Real)
(declare-fun x_1_t () Real)
(declare-fun on_0_0 () Real)
(declare-fun on_0_t () Real)
(declare-fun on_1_0 () Real)
(declare-fun on_1_t () Real)
(declare-fun aim_height_0_0 () Real)
(declare-fun aim_height_0_t () Real)
(declare-fun aim_height_1_0 () Real)
(declare-fun aim_height_1_t () Real)
(declare-fun time_0 () Real)
(declare-fun time_1 () Real)
(declare-fun mode_0 () Real)
(declare-fun mode_1 () Real)
(define-ode flow_1 ((= d/dt[aim_height] 0.000000) (= d/dt[on] 0.000000) (= d/dt[x] 0.000000) (= d/dt[y] 0.000000)))
(define-ode flow_2 ((= d/dt[aim_height] 0.000000) (= d/dt[on] 0.000000) (= d/dt[x] 0.000000) (= d/dt[y] 0.000000)))
(assert (<= -10.000000 y_0_0))
(assert (<= y_0_0 10.000000))
(assert (<= -10.000000 y_0_t))
(assert (<= y_0_t 10.000000))
(assert (<= -10.000000 y_1_0))
(assert (<= y_1_0 10.000000))
(assert (<= -10.000000 y_1_t))
(assert (<= y_1_t 10.000000))
(assert (<= -10.000000 x_0_0))
(assert (<= x_0_0 10.000000))
(assert (<= -10.000000 x_0_t))
(assert (<= x_0_t 10.000000))
(assert (<= -10.000000 x_1_0))
(assert (<= x_1_0 10.000000))
(assert (<= -10.000000 x_1_t))
(assert (<= x_1_t 10.000000))
(assert (<= 0.000000 on_0_0))
(assert (<= on_0_0 1.000000))
(assert (<= 0.000000 on_0_t))
(assert (<= on_0_t 1.000000))
(assert (<= 0.000000 on_1_0))
(assert (<= on_1_0 1.000000))
(assert (<= 0.000000 on_1_t))
(assert (<= on_1_t 1.000000))
(assert (<= -50.000000 aim_height_0_0))
(assert (<= aim_height_0_0 50.000000))
(assert (<= -50.000000 aim_height_0_t))
(assert (<= aim_height_0_t 50.000000))
(assert (<= -50.000000 aim_height_1_0))
(assert (<= aim_height_1_0 50.000000))
(assert (<= -50.000000 aim_height_1_t))
(assert (<= aim_height_1_t 50.000000))
(assert (<= 0.000000 time_0))
(assert (<= time_0 10.000000))
(assert (<= 0.000000 time_1))
(assert (<= time_1 10.000000))
(assert (<= 1.000000 mode_0))
(assert (<= mode_0 2.000000))
(assert (<= 1.000000 mode_1))
(assert (<= mode_1 2.000000))
(assert (and (and (= on_0_0 0.000000) (= aim_height_0_0 0.000000)) (= mode_0 1.000000) (= [y_0_t x_0_t on_0_t aim_height_0_t] (integral 0. time_0 [y_0_0 x_0_0 on_0_0 aim_height_0_0] flow_1)) (= mode_0 1.000000) (forall_t 1.000000 [0.000000 time_0] (<= on_0_t 0.000000)) (<= on_0_t 0.000000) (<= on_0_0 0.000000) (forall_t 1.000000 [0.000000 time_0] (<= -50.000000 aim_height_0_t)) (<= -50.000000 aim_height_0_t) (<= -50.000000 aim_height_0_0) (forall_t 1.000000 [0.000000 time_0] (>= 50.000000 aim_height_0_t)) (>= 50.000000 aim_height_0_t) (>= 50.000000 aim_height_0_0) (= mode_1 2.000000) (= on_0_t 0.000000) (= aim_height_1_0 (- y_0_t (* x_0_t x_0_t))) (= on_1_0 1.000000) (= [y_1_t x_1_t on_1_t aim_height_1_t] (integral 0. time_1 [y_1_0 x_1_0 on_1_0 aim_height_1_0] flow_2)) (= mode_1 2.000000) (forall_t 2.000000 [0.000000 time_1] (>= on_1_t 1.000000)) (>= on_1_t 1.000000) (>= on_1_0 1.000000) (= mode_1 2.000000) (= aim_height_1_t 5.000000)))
(check-sat)
(exit)
