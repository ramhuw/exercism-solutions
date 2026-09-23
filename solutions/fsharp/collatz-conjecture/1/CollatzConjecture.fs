module CollatzConjecture

let rec step_aux n l = 
    match n with
    | 1 -> l
    | i when i % 2 = 0 -> step_aux (n / 2) (l + 1)
    | i -> step_aux (3 * n + 1) (l + 1)
let steps (number: int): int option = 
    match number with
    | n when n <= 0 -> None
    | n -> step_aux n 0 |> Some