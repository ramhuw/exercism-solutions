pub type Nucleotide {
  Adenine
  Cytosine
  Guanine
  Thymine
}

pub fn encode_nucleotide(nucleotide: Nucleotide) -> Int {
  case nucleotide {
    Adenine -> 0
    Cytosine -> 1
    Guanine -> 2
    Thymine -> 3
  }
}

pub fn decode_nucleotide(nucleotide: Int) -> Result(Nucleotide, Nil) {
  case nucleotide {
    0 -> Ok(Adenine)
    1 -> Ok(Cytosine)
    2 -> Ok(Guanine)
    3 -> Ok(Thymine)
    _ -> Error(Nil)
  }
}

pub fn encode(dna: List(Nucleotide)) -> BitArray {
  case dna {
    [] -> <<>>
    [x, ..rest] -> <<encode_nucleotide(x):2, encode(rest):bits>>
  }
}
import gleam/result
pub fn decode(dna: BitArray) -> Result(List(Nucleotide), Nil) {
  case dna {
    <<0b00:2, rest:bits>> -> result.map(decode(rest), fn(x) {[Adenine, ..x]})
    <<0b01:2, rest:bits>> -> result.map(decode(rest), fn(x) {[Cytosine, ..x]})
    <<0b10:2, rest:bits>> -> result.map(decode(rest), fn(x) {[Guanine, ..x]})
    <<0b11:2, rest:bits>> -> result.map(decode(rest), fn(x) {[Thymine, ..x]})
    <<>> -> Ok([])
    _ -> Error(Nil)
  }
}
