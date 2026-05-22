let rec ls (n : int) : int list = match n with
  | n when n < 10 -> [n]
  | _ -> (n mod 10) :: ls (n / 10)

let rec pow (a : int) (b : int) : int = match b with
  | 0 -> 1
  | _ -> a * pow a (b-1)

let validate (n : int): bool = n = (List.fold_left (+) 0 (List.map (fun x -> pow x (List.length (ls n))) (ls n)))