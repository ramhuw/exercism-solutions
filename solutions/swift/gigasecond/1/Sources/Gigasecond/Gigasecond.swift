import Foundation

func gigasecond(from: Date) -> Date {
  return from.advanced(by: TimeInterval.init(1_000_000_000))
}
