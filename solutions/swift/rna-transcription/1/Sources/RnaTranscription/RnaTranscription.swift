func toRna(_ dna: String) -> String {
  // Write your code for the 'Rna Transcription' exercise in this file.
  return String(Array(dna).map(t))
}

func t(_ c: Character) -> Character {
  return switch c {
    case "C": "G"
    case "G": "C"
    case "T": "A"
    case "A": "U"
    default: c
  }
}
