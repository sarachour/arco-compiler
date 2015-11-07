
;(declare-datatypes (Int,Int) (Pair (mk-pair (name Int) (inst Int)) ) )

; each kind of instance is
(declare-const a_0 Int)
(declare-const b_0 Int)
(declare-const b_1 Int)
(declare-const x1x4 Int)

(declare-const b1x_2_b0y Bool)
(declare-const b0x_2_b1y Bool)

; bind elements to instances
(
  assert (
    or (= a_0 3) (
    or (= a_0 5)  (
    or (= a_0 7) (= a_0 0)
    )
    )
    )
)

; bind element to instances
(
  assert (
    or (= b_0 2) (
    or (= b_0 4) (= b_0 5)
    )
    )
)

; bind element to instances
(
  assert (
    or (= b_1 2) (
    or (= b_1 4) (= b_1 5)
    )
    )
)

; at least one element is an instance
(assert
  (or (= b_1 2) (= b_0 2))
)

(assert
  (or (= b_0 2) (= b_0 2))
)

(assert
  (= a_0 3)
)

; no element is double assigned
(assert
  (not (= b_0 b_1) )
)

; a_1.X is connected to a_0.Y


(assert (
  or (
    and b1x_2_b0y (and (= b_1 4) (= b_0 2))
  ) (
    and b0x_2_b1y (and (= b_1 2) (= b_0 4))
  )
)
)

(check-sat)
(get-model)
