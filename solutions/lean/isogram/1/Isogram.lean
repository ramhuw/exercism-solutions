namespace Isogram

def isIsogram (phrase : String) : Bool :=
  let chars := phrase.toList
  |> List.filter (fun c ↦ c.isAlpha) |> List.map (fun c ↦ c.toLower) |> List.mergeSort
  (List.splitBy (fun a b ↦ a == b) chars).length == chars.length

end Isogram
