module ListOps

let rec rev_aux l r =
    match l with
    | [] -> r
    | x :: xs -> rev_aux xs (x::r)
let reverse list = rev_aux list []
let rec foldl folder state list = 
    match list with
    | [] -> state
    | x :: xs -> foldl folder (folder state x) xs

let rec foldr folder state list = foldl folder state (reverse list)

let rec length_aux l n = 
    match l with
    | [] -> n
    | _ :: xs -> length_aux xs (n + 1)
let length list = length_aux list 0

let rec map_aux f l r = 
    match l with
    | [] -> reverse r
    | x :: xs -> map_aux f xs ((f x) :: r)
let map f list = map_aux f list []

let rec fil_aux f l r = 
    match l with
    | [] -> reverse r
    | x :: xs ->
        if f x then
            fil_aux f xs (x::r)
        else
            fil_aux f xs r
let filter f list = fil_aux f list []

let rec ap_aux xs ys = 
    match ys with 
    | [] -> reverse xs
    | y :: ys -> ap_aux (y :: xs) ys
let append xs ys = ap_aux (reverse xs) ys

let concat xs = foldl (fun acc a -> append acc a) [] xs