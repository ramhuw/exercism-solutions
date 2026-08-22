namespace Grains

def grains (square : Int) : Option Nat :=
  if square < 1 || square > 64 then none else
    let p: Nat := (square - 1).toNat
    some (2^p)

def totalGrains : Nat :=
  let l := List.map (fun i ↦ 2^i) (List.range 64)
  List.foldl (fun acc a ↦ acc + a) 0 l

end Grains
