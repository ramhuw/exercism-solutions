let rec sum (b: bool) (l: int list): int =
  match l with
  | [] -> 0
  | x::xs ->
    if b then
      x + sum (not b) xs
        else
          if x * 2 > 9 then x * 2 - 9 + sum (not b) xs
            else x * 2 + sum (not b) xs
let valid s =
  let chars = s |> String.to_seq |> List.of_seq in
  if List.for_all (fun c -> c = ' ' || c = '\t' || c = 'n' || Char.code c >= Char.code '0' && Char.code c <= Char.code '9') chars then
    let filtered = chars |> List.filter (fun c -> Char.code c >= Char.code '0' && Char.code c <= Char.code '9')  |> List.rev in
    if List.length filtered <= 1
    then false
    else
      let digits = filtered |> List.map (fun c -> Char.code c - Char.code '0') in
      sum true digits mod 10 = 0
    else false
