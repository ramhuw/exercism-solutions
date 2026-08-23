namespace Triangle

def equilateral (sides : List Float) : Bool :=
  if h : sides.length >= 3 then (sides[0] > 0.0) && (sides[0] == sides[1]) && (sides[1] == sides[2]) else false

def istriangle (sides : List Float) : Bool :=
  if h : sides.length >= 3 then sides[0] > 0.0 && sides[1] >= 0 && sides[2] >= 0 && sides[0] + sides[1] > sides[2] && sides[1] + sides[2] > sides[0] && sides[0] + sides[2] > sides[1] else false

def isosceles (sides : List Float) : Bool :=
  if h : sides.length >= 3 then istriangle sides && (sides[0] == sides[1] || sides[0] == sides[2] || sides[1] == sides[2]) else false


def scalene (sides : List Float) : Bool :=
  istriangle sides && not (isosceles sides)

end Triangle
