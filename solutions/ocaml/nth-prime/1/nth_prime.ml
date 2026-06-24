let rec fn (n : int) (ps : int list) (q : int) : int =
  if List.length ps = n then List.nth ps 0 else 
  if List.for_all (fun p -> q mod p <> 0) ps then fn n (q :: ps) (q + 1) else fn n ps (q + 1)
let nth_prime n = if n <= 0 then Error "there is no zeroth prime" else Ok (fn n [] 2)
