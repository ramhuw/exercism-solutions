type base = int

let rec pow (a : base) (b : int) : int =
    if b = 0 then
        1
    else
        let p = pow a (b / 2) in
        if b mod 2 = 1 then
            p * p * a
        else 
            p * p

let rec from_base (from : base) (digits : int list) (result : int) : int option = 
    match digits with
    | [] -> Some result
    | d :: ds ->
        if d >= from || d < 0 then
            None
        else
            from_base from ds (result + d * (pow from (List.length digits - 1)))

let rec to_target (i : int) (target : base) : int list =
    if i < target then
        [i]
    else
        (to_target (i / target) target) @ [i mod target]

let convert_bases ~from ~digits ~target =
    if from <= 1 || target <= 1 then
        None
    else 
        match from_base from digits 0 with
        | None -> None
        | Some i -> Some (to_target i target)