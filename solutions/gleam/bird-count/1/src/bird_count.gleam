pub fn today(days: List(Int)) -> Int {
  case days {
    [x, ..] -> x
    [] -> 0
  }
}

pub fn increment_day_count(days: List(Int)) -> List(Int) {
  case days {
    [x, ..rest] -> [x + 1, ..rest]
    [] -> [1]
  }
}

pub fn has_day_without_birds(days: List(Int)) -> Bool {
  case days {
    [x, ..] if x == 0 -> True
    [_, ..rest] -> has_day_without_birds(rest)
    [] -> False
  }
}

pub fn total(days: List(Int)) -> Int {
  case days {
    [x, ..rest] -> x + total(rest)
    [] -> 0
  }
}

pub fn busy_days(days: List(Int)) -> Int {
  case days {
    [] -> 0
    [x, ..rest] if x >= 5 -> 1 + busy_days(rest)
    [_, ..rest] -> busy_days(rest)
  }
}
