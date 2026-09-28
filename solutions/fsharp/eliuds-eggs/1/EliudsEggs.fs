module EliudsEggs

let rec eggCountAux n r =
    match n with
    | 0 -> r
    | _ when n % 2 = 1 -> eggCountAux (n / 2) (r + 1)
    | _ -> eggCountAux (n / 2) r

let eggCount n = 
    eggCountAux n 0
