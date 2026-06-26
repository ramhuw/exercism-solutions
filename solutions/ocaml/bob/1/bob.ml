let response_for s =
    if List.for_all Char.Ascii.is_white (List.of_seq (String.to_seq s)) then "Fine. Be that way!" else
    let letters = List.filter (fun c -> Char.Ascii.is_letter c) (List.of_seq (String.to_seq s)) in
    let all_capital = List.for_all (fun c -> Char.Ascii.is_upper c) letters in
    let end_with_qu = List.nth (List.filter (fun c -> not (Char.Ascii.is_white c)) (List.of_seq (String.to_seq s))) (List.length (List.filter (fun c -> not (Char.Ascii.is_white c)) (List.of_seq (String.to_seq s))) - 1) = '?' in
    if all_capital && letters <> [] then
        if end_with_qu then "Calm down, I know what I'm doing!" else "Whoa, chill out!"
    else if end_with_qu then "Sure." else "Whatever."