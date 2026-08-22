let sum l n = 
  List.fold_left (fun acc a -> acc + a) 0 (List.filter (fun x -> List.exists (fun y -> y <> 0 && x mod y = 0) l) (List.init (n-1) (fun i -> i + 1)))