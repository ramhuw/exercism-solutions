let rec f (isbn : int list) (i : int) (result : int) : int = 
  match isbn with
  | [] -> result mod 11
  | x :: xs -> f xs (i - 1) (result + x * i)

let rec v (cs : char list) : bool = 
  match cs with
  | x :: y :: xs -> x <> 'X' && v (y :: xs)
  | _ -> true
let is_valid (isbn : string) : bool =
  String.for_all (fun c -> c = 'X' || c = '-' || (Char.code c >= Char.code '0' && Char.code c <= Char.code '9')) isbn && (
  let b : char list = List.init (String.length isbn) (fun i -> isbn.[i]) |> List.filter (fun c -> c = 'X' || (Char.code c >= Char.code '0' && Char.code c <= Char.code '9')) in
  List.length b = 10 && v b && (
    let l = List.init 10 (fun i -> if List.nth b i = 'X' then 10 else Char.code (List.nth b i) - Char.code '0') in
    f l 10 0 = 0
  ))