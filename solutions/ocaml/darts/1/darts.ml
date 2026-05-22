let score (x: float) (y: float): int = let n : float = x ** 2.0 +. y ** 2.0 in
  if n > 100.0 then 0 else
    if n > 25.0 then 1 else
      if n > 1.0 then 5 else 10
