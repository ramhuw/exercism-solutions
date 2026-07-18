typealias ChangeClosure = @Sendable ((String, String, String)) -> (String, String, String)

//let flip: ChangeClosure = TODO: Please define the flip closure
//
let flip: ChangeClosure = {
  sss in 
  (sss.1, sss.0, sss.2)
}
//
//let rotate: ChangeClosure = TODO: Please define the rotate closure
let rotate: ChangeClosure = {
  sss in (sss.1, sss.2, sss.0)
}

func makeShuffle(
  flipper: @escaping ((String, String, String)) -> (String, String, String),
  rotator: @escaping ((String, String, String)) -> (String, String, String)
) -> ([UInt8], (String, String, String)) -> (String, String, String) {
  return {
    (bits: [UInt8], sss: (String, String, String)) -> (String, String, String) in 
    var sss = sss
    for i in (0..<8).reversed() {
      if bits[i] == 0 {
        sss = flipper(sss)
      } else {
        sss = rotator(sss)
      }
    }
    return sss
  }
}
