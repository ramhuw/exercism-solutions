namespace EliudsEggs

partial def eggCount (number : Nat) : Nat :=
  match number with
  | 0 => 0
  | _ => (number &&& 1) + eggCount (number >>> 1)

end EliudsEggs
