let rec f (l : char list) (r : char list) : bool =
    match r with
    | [] -> List.is_empty l
    | x :: xs -> 
        match x with
        | '(' | '[' | '{' -> f (x :: l) xs
        | ')' -> not (List.is_empty l) && List.hd l = '(' && f (List.tl l) xs
        | ']' -> not (List.is_empty l) && List.hd l = '[' && f (List.tl l) xs
        | '}' -> not (List.is_empty l) && List.hd l = '{' && f (List.tl l) xs
        | _ -> f l xs
let are_balanced s =
    f [] (s |> String.to_seq |> List.of_seq)
