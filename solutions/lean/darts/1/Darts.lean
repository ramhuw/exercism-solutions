namespace Darts

def score (x : Float) (y : Float) : Int :=
  let rr := x^2 + y^2
  if rr > 100 then 0
  else if rr > 25 then 1
  else if rr > 1 then 5
  else 10

end Darts
