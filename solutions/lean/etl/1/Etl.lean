import Std.Data.HashMap

namespace Etl

def g(x: Nat × (List Char)): List (Char × Nat) :=
  let ⟨n, l⟩ := x
  match l with
  | [] => []
  | m :: ms => (Char.toLower m, n) :: g ⟨n, ms⟩

def f(l: List (Nat × (List Char))): List (Char × Nat) :=
  match l with
  | [] => []
  | x :: xs => g x ++ f xs

def h (l: List (Char × Nat)): Std.HashMap Char Nat :=
  match l with
  | [] => (∅: Std.HashMap Char Nat)
  | ⟨c, n⟩ :: xs => h xs |>.insert c n

def transform (legacy : Std.HashMap Nat (List Char)) : Std.HashMap Char Nat :=
  Std.HashMap.toList legacy |> f |> h

end Etl
