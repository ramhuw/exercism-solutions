let rec egg_count number =
  if number = 0 then 0 else (number land 1) + (egg_count (number lsr 1))
