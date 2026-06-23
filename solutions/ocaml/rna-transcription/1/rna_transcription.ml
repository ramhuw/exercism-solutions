type dna = [ `A | `C | `G | `T ]
type rna = [ `A | `C | `G | `U ]

let f (x : dna) : rna =
  match x with
    | `G -> `C
    | `C -> `G
    | `T -> `A
    | `A -> `U

let to_rna (d : dna list) : rna list = List.map f d

