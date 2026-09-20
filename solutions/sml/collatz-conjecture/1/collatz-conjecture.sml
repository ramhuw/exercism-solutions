fun h n = 
  if n = 1 then 0
  else if n mod 2 = 0 then 1 + h (n div 2)
  else 1 + h (3 * n + 1)
fun collatz n =
  if n <= 0 then NONE
  else SOME (h n)
