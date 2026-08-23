namespace HighScores

def latestList (scores : List Nat) : Nat :=
  Id.run do
    let mut x := 0
    for s in scores do
      x := s
    return x

def latestArray (scores : Array Nat) : Nat :=
  Id.run do
    let mut x := 0
    for s in scores do
      x := s
    return x


def personalBestList (scores : List Nat) : Nat :=
  Id.run do
    let mut x := 0
    for s in scores do
      x := max x s
    return x

def personalBestArray (scores : Array Nat) : Nat :=
  Id.run do
    let mut x := 0
    for s in scores do
      x := max x s
    return x

def personalTopThreeList (scores : List Nat) : List Nat :=
  if List.length scores <= 3 then List.reverse <| List.mergeSort scores else
  List.reverse <| List.mergeSort (List.drop (List.length scores - 3) (List.mergeSort scores))

def personalTopThreeArray (scores : Array Nat) : Array Nat :=
  (personalTopThreeList <| (personalTopThreeList <| scores.toList)).toArray

end HighScores
