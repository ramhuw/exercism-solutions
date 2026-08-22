let classify n = 
  if n <= 0 then Error "Classification is only possible for positive integers." else 
    let s = List.fold_left (fun acc a -> acc + a) 0 (List.filter (fun x -> n mod x = 0) (List.init (n-1) (fun i -> i+1))) in
    if s = n then Ok "perfect" else
      if s < n then Ok "deficient" else Ok "abundant"