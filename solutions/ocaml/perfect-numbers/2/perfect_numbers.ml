let classify n = 
  if n <= 0 then Error "Classification is only possible for positive integers." else 
    let s = (List.fold_left (fun acc a -> acc + a + if a <> 1 && a * a <> n then n / a else 0) 0 (List.filter (fun x -> n mod x = 0) ((List.take_while (fun i -> i * i <= n) (List.init (n-1) (fun i -> (i+1))))))) in
    if s = n then Ok "perfect" else
      if s < n then Ok "deficient" else Ok "abundant"