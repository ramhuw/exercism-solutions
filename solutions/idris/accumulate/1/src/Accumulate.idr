module Accumulate

revAux : List a -> List a -> List a
revAux [] r = r
revAux (x :: xs) r = revAux xs (x :: r)

rev : List a -> List a
rev l = revAux l []

accumulateAux : (a -> b) -> List a -> List b -> List b
accumulateAux f [] r = rev r
accumulateAux f (x::xs) r = accumulateAux f xs ((f x) :: r)

export
accumulate : (a -> b) -> List a -> List b
accumulate f l = accumulateAux f l []
