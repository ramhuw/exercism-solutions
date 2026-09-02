let rec length_tco (l : 'a list) (n : int) = 
  match l with
  | [] -> n
  | _ :: tl -> length_tco tl (n + 1)

let length l = 
  length_tco l 0

let rec reverse_tco (l : 'a list) (r : 'a list) : 'a list =
  match l with
  | [] -> r
  | x :: xs -> reverse_tco xs (x :: r)

let reverse l =
  reverse_tco l []

let rec map_tco (f : 'a -> 'b) (l : 'a list) (r : 'b list) : 'b list = 
  match l with
  | [] -> reverse r
  | x :: xs -> map_tco f xs ((f x) :: r)

let map ~f l =
  map_tco f l []

let rec filter_tco (f : 'a -> bool) (l : 'a list) (r : 'a list) : 'a list =
  match l with
  | [] -> reverse r
  | x :: xs -> 
    if f x then
      filter_tco f xs (x :: r)
    else
      filter_tco f xs r

let filter ~f l =
  filter_tco f l []

let rec fold_tco (init : 'acc) (f : 'acc -> 'a -> 'acc) (l : 'a list) : 'acc =
  match l with
  | [] -> init
  | x :: xs -> fold_tco (f init x) f xs

let fold ~init ~f l =
  fold_tco init f l

let rec append_tco (l : 'a list) (m : 'a list)  : 'a list = 
  match l with
  | [] -> m
  | x :: xs -> append_tco xs (x :: m)

let append l m =
  append_tco (reverse l) m

let rec concat_tco (l : 'a list list) (r : 'a list) : 'a list = 
  match l with
  | [] -> r
  | xs :: xss -> concat_tco xss (append r xs)

let concat l =
  concat_tco l []
