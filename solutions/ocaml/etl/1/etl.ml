let rec t (i: int) (l: char list) : (char * int) list =
    match l with
    | [] -> []
    | x :: xs -> (Char.lowercase_ascii x, i) :: (t i xs)


let rec f l = 
    match l with
    | [] -> []
    | (i, x) :: xs -> (t i x) @ (f xs)

let transform l = List.sort compare (f l)
    
