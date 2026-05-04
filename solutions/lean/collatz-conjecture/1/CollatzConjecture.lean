namespace CollatzConjecture

def Positive := { x : Nat // 0 < x }



partial def steps (n : Positive) : Nat :=
  if n.val == 1
    then 0
    else if h0 : n.val % 2 = 0
          then
            have h : n.val / 2 > 0 := by
              simp
              have h1 := n.property
              omega
            steps ⟨ n.val / 2, h ⟩ + 1
          else
            have h : n.val * 3 + 1 > 0 := by
              omega
            steps ⟨ n.val * 3 + 1, h ⟩ + 1

end CollatzConjecture
