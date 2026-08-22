namespace NthPrime

def isqrt (n : Nat) (left : Nat) (right : Nat) : Nat :=
  if left >= right then left else
  let middle := (left + right + 1) / 2
  if n / middle >= middle then isqrt n middle right else isqrt n left (middle - 1)

def isPrime (p : Nat) : Bool :=
  if p == 0 || p == 1 then false else
  let ds := List.range ((isqrt p 0 p) - 1) |> List.map (fun i ↦ i + 2)
  List.all ds (fun i ↦ p % i != 0)


partial def nextPrime (p : Nat) : Nat :=
  if isPrime p then p else nextPrime (p + 1)


def prime (n : Nat) : Option Nat :=
  if n < 1 then none else if n == 1 then some 2 else
  match prime (n - 1) with
  | none => none
  | some p => nextPrime (p + 1)

end NthPrime
