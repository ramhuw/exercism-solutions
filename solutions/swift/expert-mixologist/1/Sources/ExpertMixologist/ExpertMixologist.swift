func timeToPrepare(drinks: [String]) -> Double {
  return drinks.map {
    drink in
    switch drink {
      case "beer", "soda", "water" : 0.5
      case "shot" : 1.0
      case "mixed drink" : 1.5
      case "fancy drink" : 2.5
      case "frozen drink" : 3.0
      default : 0
    }
  }.reduce(0, +)
}

func makeWedges(needed: Int, limes: [String]) -> Int {
  var ans = 0
  var amount = 0
  for lime in limes {
    if amount >= needed {
      break
    }
    switch lime {
      case "small" : amount += 6
      case "medium" : amount += 8
      case "large" : amount += 10
      default : amount += 0
    }
    ans += 1
  }
  return ans
}

func finishShift(minutesLeft: Int, remainingOrders: [[String]]) -> [[String]] {
  var m = Double(minutesLeft)
  for i in 0..<(remainingOrders.count) {
    if m < 0 {
      return Array(remainingOrders[i...])
    }
    m -= timeToPrepare(drinks: remainingOrders[i])
  }
  return []
}

func orderTracker(orders: [(drink: String, time: String)]) -> (
  beer: (first: String, last: String, total: Int)?, soda: (first: String, last: String, total: Int)?
) {
  var beer: (first: String, last: String, total: Int)? = nil
  var soda: (first: String, last: String, total: Int)? = nil
  for order in orders {
    if order.drink == "beer" {
      if beer == nil {
        beer = (first: order.time, last: order.time, total: 1)
      } else {
        beer?.last = order.time
        beer?.total += 1
      }
    }
    if order.drink == "soda" {
      if soda == nil {
        soda = (first: order.time, last: order.time, total: 1)
      } else {
        soda?.last = order.time
        soda?.total += 1
      }
    }
  }
  return (beer, soda)
}
