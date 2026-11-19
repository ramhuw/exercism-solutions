// Please define the Usd type
pub type Usd
// Please define the Eur type
pub type Eur
// Please define the Jpy type
pub type Jpy
// Please define the Money type
pub opaque type Money(t) {
  Money(Int)
}
pub fn dollar(amount: Int) -> Money(Usd) {
  Money(amount)
}

pub fn euro(amount: Int) -> Money(Eur) {
  Money(amount)
}

pub fn yen(amount: Int) -> Money(Jpy) {
  Money(amount)
}

pub fn total(prices: List(Money(currency))) -> Money(currency) {
  case prices {
    [] -> Money(0)
    [Money(x), ..xs] -> {
      let Money(f) = total(xs)
      Money(x + f)
    }
  }
}
