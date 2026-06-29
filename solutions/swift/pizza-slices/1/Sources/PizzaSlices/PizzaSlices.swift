import Foundation

func sliceSize(diameter: Double?, slices: Int?) -> Double? {
  guard let diameter = diameter else {
    return nil
  }
  guard let slices = slices else {
    return nil
  }
  if slices <= 0 {
    return nil
  }
  return Double.pi * pow(diameter / 2, 2) / Double(slices)
}

func biggestSlice(
  diameterA: String, slicesA: String,
  diameterB: String, slicesB: String
) -> String {
  let s1 = sliceSize(diameter: Double(diameterA), slices: Int(slicesA)) ?? -1
  let s2 = sliceSize(diameter: Double(diameterB), slices: Int(slicesB)) ?? -1
  if s1 > s2 {
    return "Slice A is bigger"
  }
  if s1 < s2 {
    return "Slice B is bigger"
  } else {
    return "Neither slice is bigger"
  }
}
