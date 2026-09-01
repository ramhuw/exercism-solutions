let number s =
    let chars = s |> String.to_seq |> List.of_seq in
    if not (List.for_all (fun c -> not (Char.code (Char.lowercase_ascii c) >= Char.code 'a' && Char.code (Char.lowercase_ascii c) <= Char.code 'z')) chars) then Error "letters not permitted" else
    if not (List.for_all (fun c -> Char.code c <= Char.code '9' && Char.code c >= Char.code '0' || c = '+' || c = ' ' || c = '.' || c = '-' || c = '(' || c = ')') chars) then Error "punctuations not permitted" else    let filtered = chars |> List.filter (fun c -> Char.code c >= Char.code '0' && Char.code c <= Char.code '9') in
    if List.length filtered = 11 && List.hd filtered  <> '1' then Error "11 digits must start with 1" else
        if List.length filtered > 11 then Error "must not be greater than 11 digits" else
            if List.length filtered < 10 then Error "must not be fewer than 10 digits" else
                let tail = if List.length filtered = 11 then List.tl filtered else filtered in
                if List.nth tail 0 = '0' then Error "area code cannot start with zero" else
                    if List.nth tail 0 = '1' then Error "area code cannot start with one" else
                        if List.nth tail 3 = '0' then Error "exchange code cannot start with zero" else 
                            if List.nth tail 3 = '1' then Error "exchange code cannot start with one" else
                                Ok (tail |> List.to_seq |> String.of_seq)
