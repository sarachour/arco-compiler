(declare-const sc_A Real)
(declare-const of_A Real)
(declare-const slack_min_A Real)
(declare-const slack_max_A Real)

(declare-const sc_B Real)
(declare-const of_B Real)
(declare-const slack_min_B Real)
(declare-const slack_max_B Real)

(declare-const sc_C Real)
(declare-const of_C Real)
(declare-const slack_min_C Real)
(declare-const slack_max_C Real)

(declare-const sc_A2 Real)
(declare-const of_A2 Real)
(declare-const slack_min_A2 Real)
(declare-const slack_max_A2 Real)

(declare-const sc_B2 Real)
(declare-const of_B2 Real)
(declare-const slack_min_B2 Real)
(declare-const slack_max_B2 Real)

(declare-const sc_C2 Real)
(declare-const of_C2 Real)
(declare-const slack_min_C2 Real)
(declare-const slack_max_C2 Real)

(declare-const sc_D Real)
(declare-const of_D Real)
(declare-const slack_min_D Real)
(declare-const slack_max_D Real)



(assert (= (+ (+ (* 1.0 sc_A) of_A) slack_max_A) 0.01))
(assert (= (+ (+ (* 0.0 sc_A) of_A) slack_min_A) 0.0001))

(assert (= (+ (+ (* 1.0 sc_B) of_B) slack_max_B) 0.02))
(assert (= (+ (+ (* 0.0 sc_B) of_B) slack_min_B) 0.0001))

(assert (= (+ (+ (* 1.0 sc_C) of_C) slack_max_C) 0.0002))
(assert (= (+ (+ (* 0.0 sc_C) of_C) slack_min_C) 0.00000001))

(assert (= (* sc_A sc_B) sc_C))

(assert (< (+ sc_A sc_B) 2))
(assert (= 0 of_C))

(assert (= 0 of_A))
(assert (= 0 of_B))


(assert (= (+ (+ (* 1.0 sc_A2) of_A2) slack_max_A2) 0.01))
(assert (= (+ (+ (* 0.0 sc_A2) of_A2) slack_min_A2) 0.0001))

(assert (= (+ (+ (* 1.0 sc_B2) of_B2) slack_max_B2) 0.02))
(assert (= (+ (+ (* 0.0 sc_B2) of_B2) slack_min_B2) 0.0001))

(assert (= (+ (+ (* 1.0 sc_C2) of_C2) slack_max_C2) 0.0002))
(assert (= (+ (+ (* 0.0 sc_C2) of_C2) slack_min_C2) 0.00000001))

(assert (= (* sc_A2 sc_B2) sc_C2))

(assert (< (+ sc_A2 sc_B2) 2))
(assert (= 0 of_C2))

(assert (= 0 of_A2))
(assert (= 0 of_B2))

(assert (= sc_C2 sc_C))
(assert (= sc_D sc_C))
(assert (= of_D (+ of_C of_C2)))

(assert (= (+ (+ (* 2.0 sc_D) of_D) slack_max_D) 0.0004))
(assert (= (+ (+ (* 0.0 sc_D) of_D) slack_min_D) 0.00000002))


(minimize
(+
  (* (+ slack_min_D slack_max_D) 8)
  (+ 
    (+
      (+
        (+ slack_max_A slack_min_A) 
        (* (+ slack_min_C slack_max_C) 4)
      )
      (+ slack_max_B slack_min_B)
    )
    (+
      (+
        (+ slack_max_A2 slack_min_A2) 
        (* (+ slack_min_C2 slack_max_C2) 4)
      )
      (+ slack_max_B2 slack_min_B2)
    )
  )
)
)
(check-sat)
(get-model)
