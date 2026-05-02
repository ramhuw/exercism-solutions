namespace RnaTranscription

def singleToRna (d: Char) : Char :=
  match d with
  | 'G' => 'C'
  | 'C' => 'G'
  | 'T' => 'A'
  | 'A' => 'U'
  | _ => d

def listToRna (dna: List Char) : List Char :=
  match dna with
  | [] => dna
  | h :: tail => (singleToRna h) :: listToRna tail

def toRna (dna : String) : String :=
  String.ofList $ listToRna $ dna.toList
end RnaTranscription
