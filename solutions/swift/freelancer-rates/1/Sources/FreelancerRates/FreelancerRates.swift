func dailyRateFrom(hourlyRate: Int) -> Double {
  return Double(hourlyRate) * 8
}

func monthlyRateFrom(hourlyRate: Int, withDiscount discount: Double) -> Double {
  return (dailyRateFrom(hourlyRate: hourlyRate) * 22 - discount).rounded(.toNearestOrAwayFromZero)
}

func workdaysIn(budget: Double, hourlyRate: Int, withDiscount discount: Double) -> Double {
  ((budget + discount) / dailyRateFrom(hourlyRate: hourlyRate)).rounded(.down)
}
