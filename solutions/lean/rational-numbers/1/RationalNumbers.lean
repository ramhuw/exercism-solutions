namespace RationalNumbers

/--
  Represents a fully reduced rational number.
  It is constructed from a numerator (`num`) and a denominator (`den`), both of type `Int`, and a proof that: `den > 0 ∧ Int.gcd num den = 1`.
-/
structure RationalNumber where
  num : Int
  den : Int
  h : den > 0 ∧ Int.gcd num den = 1
  deriving BEq, Repr

def RationalNumber.mk' (n d : Int) (hd : d ≠ 0) : RationalNumber :=
  let g := n.gcd d
  let sign := d.sign
  {
    num := sign * (n / g),
    den := sign * (d / g),
    h := by
      have h1 : sign * (d / g) > 0 := by
        if h11 : 0 < d
          then have h12 : sign = 1 := Int.sign_eq_one_iff_pos.mpr h11
               simp [h12]
               apply Int.ediv_pos_of_pos_of_dvd
               · exact h11
               · exact Int.natCast_nonneg g
               · exact Int.gcd_dvd_right n d
          else have h12 : 0 > d := by omega
               have h13 : sign = -1 := Int.sign_eq_neg_one_iff_neg.mpr h12
               simp [h13]
               apply Int.ediv_neg_of_neg_of_pos
               · omega
               · have h14 : g ≠ 0 := by exact Int.gcd_ne_zero_right hd
                 omega
      have h2 : (sign * (n / ↑g)).gcd (sign * (d / ↑g)) = 1 := by
        have h21 : sign * (d / ↑g) ≠ 0 := by
          omega
        have h22 : g = (sign*n).gcd (sign*d) := by
          if h23 : 0 < d
          then have h24 : sign = 1 := Int.sign_eq_one_iff_pos.mpr h23
               simp [h24]
               rfl
          else have h25 : 0 > d := by omega
               have h26 : sign = -1 := Int.sign_eq_neg_one_iff_neg.mpr h25
               simp [h26]
               rfl
        rw [h22]
        rw [← Int.mul_ediv_assoc]
        rw [← Int.mul_ediv_assoc]
        have h26 : sign * d ≠ 0 := by
          apply Int.mul_ne_zero ?_ hd
          exact (not_congr Int.sign_eq_zero_iff_zero).mpr hd
        exact Int.gcd_ediv_gcd_ediv_gcd_of_ne_zero_right h26
        rw [← h22]
        exact Int.gcd_dvd_right n d
        rw [← h22]
        exact Int.gcd_dvd_left n d
      exact ⟨h1, h2⟩




  }

def add (r1 r2 : RationalNumber) : RationalNumber :=
  let n1 := r1.num
  let n2 := r2.num
  let d1 := r1.den
  let d2 := r2.den
  let n := n1 * d2 + n2 * d1
  let d := d1 * d2
  have h1 : d1 > 0 := r1.h.left
  have h2 : d2 > 0 := r2.h.left
  have hd : d ≠ 0 := by
    unfold d
    refine Int.mul_ne_zero_iff.mpr ?_
    omega
  RationalNumber.mk' n d hd

def sub (r1 r2 : RationalNumber) : RationalNumber :=
  let n1 := r1.num
  let n2 := r2.num
  let d1 := r1.den
  let d2 := r2.den
  let n := n1 * d2 - n2 * d1
  let d := d1 * d2
  have h1 : d1 > 0 := r1.h.left
  have h2 : d2 > 0 := r2.h.left
  have hd : d ≠ 0 := by
    unfold d
    refine Int.mul_ne_zero_iff.mpr ?_
    omega
  RationalNumber.mk' n d hd

def mul (r1 r2 : RationalNumber) : RationalNumber :=
  let n1 := r1.num
  let n2 := r2.num
  let d1 := r1.den
  let d2 := r2.den
  let n := n1 * n2
  let d := d1 * d2
  have h1 : d1 > 0 := r1.h.left
  have h2 : d2 > 0 := r2.h.left
  have hd : d ≠ 0 := by
    unfold d
    refine Int.mul_ne_zero_iff.mpr ?_
    omega
  RationalNumber.mk' n d hd

def div (r1 r2 : RationalNumber) : RationalNumber :=
  if h : r2.num ≠ 0 then
    let n1 := r1.num
    let n2 := r2.num
    let d1 := r1.den
    let d2 := r2.den
    let n := n1 * d2
    let d := d1 * n2
    have h1 : d1 > 0 := r1.h.left
    have hd : d ≠ 0 := by
      unfold d
      refine Int.mul_ne_zero_iff.mpr ?_
      omega
    RationalNumber.mk' n d hd
  else RationalNumber.mk' 0 1 (by decide)

def abs (r : RationalNumber) : RationalNumber :=
  let n := r.num
  let d := r.den
  let hr := r.h
  have h : d ≠ 0 := by omega
  if n > 0 then r else RationalNumber.mk' (-n) d h

def exprational (r : RationalNumber) (n : Int) : RationalNumber :=
  if n = 0 then RationalNumber.mk' 1 1 (by decide) else
      let a : Int := r.num^(n.natAbs)
      let b : Int := r.den^(n.natAbs)
      let h := r.h
      if h1 : n >= 0
        then
          have hb : b ≠ 0 := by
            refine Int.pow_ne_zero ?_
            omega
          RationalNumber.mk' a b hb
        else
          if ha : a ≠ 0
            then RationalNumber.mk' b a ha
            else RationalNumber.mk' 0 1 (by decide)

def expreal (x : Int) (r : RationalNumber) : Float :=
  if r.num = 0 then 1 else
    if x = 0 then 0 else
      let xx := Float.ofInt x
      let yy := (Float.ofInt r.num) / (Float.ofInt r.den)
      xx^yy
end RationalNumbers
