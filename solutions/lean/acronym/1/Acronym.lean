namespace Acronym
def f (c : Char) : Bool :=
  Char.isWhitespace c || c == '-' || c == '_'
def h (s : String.Slice) : String :=
  match s.toString.toList.head? with
  | none => ""
  | some x => x.toUpper.toString
def abbreviate (phrase : String) : String :=
  String.join $ (phrase.split f).toList.map (h)
end Acronym
