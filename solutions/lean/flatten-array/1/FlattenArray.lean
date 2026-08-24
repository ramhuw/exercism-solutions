namespace FlattenArray

inductive Box (α : Type) : Type where
  | zero
  | one (value : α)
  | many (boxes : Array (Box α))

partial def f (box : Box Int) : List Int :=
  match box with
  | Box.zero => []
  | Box.one value => [value]
  | Box.many boxes =>
      match boxes.toList with
      | [] => []
      | b :: bs => (f b) ++ (f (Box.many bs.toArray))

def flatten (box : Box Int) : Array Int :=
  box |> f |>.toArray

end FlattenArray
