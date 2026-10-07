module Acronym

ab_aux : List Char -> List Char -> Bool -> List Char
ab_aux [] r _ = reverse r
ab_aux (x::xs) r True = if x >= 'a' && x <= 'z' || x >= 'A' && x <= 'Z' then ab_aux xs ((toUpper x)::r) False else ab_aux xs r True
ab_aux (x::xs) r False = if x == ' ' || x == '-' || x == '_' then ab_aux xs r True else ab_aux xs r False

export
abbreviate : String -> String
abbreviate s = pack $ ab_aux (unpack s) [] True
