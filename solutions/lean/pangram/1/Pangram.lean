namespace Pangram

def isPangram (sentence : String) : Bool :=
  (sentence.toList |>.filter (fun c ↦ c.isAlpha) |>.map (fun c ↦ c.toLower) |>.mergeSort |>.splitBy (fun a b ↦ a == b) |>.length) == 26


end Pangram
