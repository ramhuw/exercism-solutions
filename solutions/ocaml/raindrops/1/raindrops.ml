let raindrop n =
    let d3 : string = if n mod 3 = 0 then "Pling" else "" in
    let d5 : string = if n mod 5 = 0 then "Plang" else "" in
    let d7 : string = if n mod 7 = 0 then "Plong" else "" in
    let ans = d3 ^ d5 ^ d7 in
    if ans = "" then string_of_int n else ans