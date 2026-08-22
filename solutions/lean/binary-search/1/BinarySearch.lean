namespace BinarySearch

def f (value : Int) (array : Array Int) (left : Nat) (right : Nat) (hl : left < array.size) (hr : right < array.size) : Option Nat :=
  if left >= right
    then
      if array[left] == value then some left else none
    else
      let middle := (left + right + 1) / 2
      if array[middle] <= value
        then f value array middle right (by omega) (by omega)
        else f value array left (middle - 1) (by omega) (by omega)


def find (value : Int) (array : Array Int) : Option Nat :=
  if h: array.size >= 1 then
    f value array 0 (array.size - 1) (by omega) (by omega)
    else none



end BinarySearch
