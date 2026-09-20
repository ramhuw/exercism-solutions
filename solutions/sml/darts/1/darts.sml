fun score (x: real, y: real): int =
  let 
    val r2 = x * x + y * y 
  in
    if r2 > 100.0 then 0
    else if r2 > 25.0 then 1
    else if r2 > 1.0 then 5
    else 10
  end
