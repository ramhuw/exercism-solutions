namespace PerfectNumbers

def Positive := { x : Nat // x > 0 }

inductive Classification where
| perfect
| deficient
| abundant
deriving BEq, Repr

def sum (n : Nat) : Nat :=
  if n == 1 then 0 else
  let candidate := List.range n |> List.map (fun i ↦ i + 1) |> List.takeWhile (fun i ↦ i * i <= n) |> List.filter (fun i ↦ n % i == 0)
  List.foldl (fun acc i ↦ acc + i + if i == 1 || i * i == n then 0 else (n / i)) 0 candidate

def classify (number : Positive) : Classification :=
  let ⟨n, _⟩ := number
  let s := sum n
  if s == n then Classification.perfect else if s < n then Classification.deficient else Classification.abundant


end PerfectNumbers
