let rec collatz_conjecture n = 
  if n < 1 then Error "Only positive integers are allowed" else 
    if n == 1 then Ok 0 else
      if n mod 2 == 0 then match (collatz_conjecture (n / 2)) with
      | Ok x -> Ok (x + 1)
      | Error e -> Error e
      else
        match collatz_conjecture (3 * n + 1) with
      | Ok x -> Ok (x + 1)
      | Error e -> Error e