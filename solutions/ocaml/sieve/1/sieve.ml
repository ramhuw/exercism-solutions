let rec sieve (arr : int list) : int list = 
  if List.is_empty arr
  then []
  else (List.hd arr) :: (sieve (List.filter (fun a -> a mod (List.hd arr) <> 0) (List.tl arr)))

let rec range (a : int) (b : int) : int list = 
  if a > b
  then []
  else a :: range (a + 1) b
let primes n = range 2 n |> sieve