
let f (c : char) : int = 
  match Char.lowercase_ascii c with
  | 'a' | 'e' | 'i' | 'o' | 'u' | 'l' | 'n' | 'r' | 's' | 't' -> 1
  | 'd' | 'g' -> 2
  | 'b' | 'c' | 'm' | 'p' -> 3
  | 'f' | 'h' | 'v' | 'w' | 'y' -> 4
  | 'k' -> 5
  | 'j' | 'x' -> 8
  | 'q' | 'z' -> 10
  | _ -> 0

let score (s : string) : int = 
  s |> String.to_seq |> Seq.map f |> Seq.fold_left (fun acc -> fun a -> acc + a) 0
