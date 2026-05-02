namespace TwoFer
def nameGetter (name : Option String) : String :=
  match name with
  | none => "you"
  | some n => n
def twoFer (name : Option String) : String :=
  "One for " ++ nameGetter name ++ ", one for me."
end TwoFer


