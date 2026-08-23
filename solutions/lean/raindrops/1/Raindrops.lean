namespace Raindrops

def convert (number : Nat) : String :=
  if number % 3 != 0 && number % 5 != 0 && number % 7 != 0 then toString number else
  let a := if number % 3 == 0 then "Pling" else ""
  let b := if number % 5 == 0 then "Plang" else ""
  let c:= if number % 7 == 0 then "Plong" else ""
  a ++ b ++ c
end Raindrops
