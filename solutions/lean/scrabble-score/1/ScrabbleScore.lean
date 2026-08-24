namespace ScrabbleScore

def m (c : Char) : Int :=
  if ['A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T'].contains c then 1 else if ['D', 'G'].contains c then 2 else if ['B', 'C', 'M', 'P'].contains c then 3 else if ['F', 'H', 'V', 'W', 'Y'].contains c then 4 else if c == 'K' then 5 else if ['J', 'X'].contains c then 8 else if ['Q', 'Z'].contains c then 10 else 0

def score (word : String) : Int :=
  word |>.toList |>.filter Char.isAlpha |>.map Char.toUpper |>.map m |>.foldl Int.add 0

end ScrabbleScore
