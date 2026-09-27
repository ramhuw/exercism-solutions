let rec encode_aux (s : char list) (p : char option) (n : int) (r : string): string =
    match s with 
    | [] -> 
        (match p with
        | None -> r
        | Some prev -> 
            if n = 1 then
                r ^ (String.make 1 prev)
            else
                r ^ (Int.to_string n) ^ (String.make 1 prev))
    | c :: cs ->
        (match p with
        | None -> encode_aux cs (Some c) 1 r
        | Some prev -> 
            if prev = c then
                encode_aux cs p (n+1) r
            else
                if n = 1 then
                    encode_aux cs (Some c) 1 (r ^ (String.make 1 prev))
                else
                    encode_aux cs (Some c) 1 (r ^ (Int.to_string n) ^ (String.make 1 prev)))

let encode s =
    encode_aux (s |> String.to_seq |> List.of_seq ) None 0 ""

let to_digit (c : char) : int option =
    if Char.code c >= Char.code '0' && Char.code c <= Char.code '9' then
        Some (Char.code c - Char.code '0')
    else
        None


let rec decode_aux (s : char list) (n : int) (r : string) : string =
    match s with
    | [] -> r
    | c :: cs -> 
        (match to_digit c with
        | None -> decode_aux cs 0 (r ^ String.make (max n 1) c)
        | Some d -> decode_aux cs (n * 10 + d) r)

let decode s =
    decode_aux (s |> String.to_seq |> List.of_seq) 0 ""
