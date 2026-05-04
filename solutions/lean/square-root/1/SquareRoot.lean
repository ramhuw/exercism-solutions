namespace SquareRoot

partial def sq (r : Nat) (s : Nat) : Nat :=
  if s^2 == r
    then s
    else sq r (s + 1)

def squareRoot (radicand : Nat) : Nat :=
  sq radicand 1

end SquareRoot
