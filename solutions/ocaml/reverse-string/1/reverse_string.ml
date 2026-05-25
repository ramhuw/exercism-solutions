let rec reverse_string s =
    match s with
    | "" -> ""
    | _ -> (reverse_string (String.sub s 1 (String.length s - 1))) ^ String.make 1 s.[0]