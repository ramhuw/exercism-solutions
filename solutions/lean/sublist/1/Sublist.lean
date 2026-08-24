namespace Sublist

inductive Classification where
  | sublist | superlist | equal | unequal
  deriving BEq, Repr

def isEqual (listOne listTwo : List Nat) : Bool :=
  match listOne, listTwo with
  | [], [] => true
  | x::xs, y::ys => x == y && isEqual xs ys
  | _, _ => false

def startsWith (listOne listTwo : List Nat) : Bool :=
  match listOne, listTwo with
  | [], _ => true
  | x::xs, y::ys => x == y && startsWith xs ys
  | _, _ => false

partial def isSublist (listOne listTwo : List Nat) : Bool :=
  match listOne, listTwo with
  | [], _ => true
  | _, _::ys =>
      startsWith listOne listTwo || isSublist listOne ys
  | _, _ => false

def sublist (listOne listTwo : List Nat) : Classification :=
  if isEqual listOne listTwo then Classification.equal else if isSublist listOne listTwo then Classification.sublist else if isSublist listTwo listOne then Classification.superlist else Classification.unequal

end Sublist
