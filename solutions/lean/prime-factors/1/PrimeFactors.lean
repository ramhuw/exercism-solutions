namespace PrimeFactors

partial def primeSearch (value: Nat) (d: Nat) : Nat :=
  if d ≥ value || d ∣ value then d else primeSearch value (d + 1)

partial def factors (value : Nat) : List Nat :=
  match value with
  | 0 | 1 => []
  | _ =>
      let p := primeSearch value 2
      p :: factors (value / p)

end PrimeFactors
