namespace Hamming

def distance (strand1 : String) (strand2 : String) : Option Nat :=
  if String.length strand1 != String.length strand2 then none else
  some (List.length (List.filter (fun (a, b) ↦ a != b) (List.zip (String.toList strand1) (String.toList strand2))))

end Hamming
