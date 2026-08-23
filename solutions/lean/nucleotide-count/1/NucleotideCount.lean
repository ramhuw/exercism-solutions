namespace NucleotideCount

/-
  Define a function `nucleotideCounts` that takes a `String`.

  This function should return `Option α`, where `α` is a type that represents the counts for each nucleotide.
  Those counts are accessed using `[]` on constructors of a type `Nucleotide` that you must also define.

  Refer to the test file for more information.
-/

structure Count where
  A : Nat
  C : Nat
  G : Nat
  T : Nat
deriving Repr

inductive Nucleotide where
  | A
  | C
  | T
  | G

instance : GetElem Count Nucleotide Nat (fun _ _ => True) where
  getElem count nucleotide _ :=
    match nucleotide with
    | .A => count.A
    | .C => count.C
    | .G => count.G
    | .T => count.T

def add (x1 : Option Count) (x2 : Option Count) : Option Count :=
  match x1, x2 with
  | some n1, some n2 =>
  some {
    A := n1.A + n2.A,
    C := n1.C + n2.C,
    G := n1.G + n2.G,
    T := n1.T + n2.T
  }
  | _, _ => none

def counts (l : List Char) : Option Count :=
  match l with
  | [] => some { A := 0, C := 0, G := 0, T := 0 }
  | c :: cs =>
    let n : Option Count :=
      match c with
      | 'A' => some { A:=1, C:=0, G:=0, T:=0 }
      | 'C' => some { A:=0, C:=1, G:=0, T:=0 }
      | 'G' => some { A:=0, C:=0, G:=1, T:=0 }
      | 'T' => some { A:=0, C:=0, G:=0, T:=1 }
      | _ => none
    add n (counts cs)

def nucleotideCounts (s : String) : Option Count :=
  counts s.toList


end NucleotideCount
