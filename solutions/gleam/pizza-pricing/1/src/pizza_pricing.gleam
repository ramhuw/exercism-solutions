import gleam/list

// TODO: please define the Pizza custom type
pub type Pizza {
  Margherita
  Caprese
  Formaggio
  ExtraSauce(Pizza)
  ExtraToppings(Pizza)
}

pub fn pizza_price(pizza: Pizza) -> Int {
  case pizza {
    Margherita -> 7
    Caprese -> 9
    Formaggio -> 10
    ExtraSauce(p) -> 1 + pizza_price(p)
    ExtraToppings(p) -> 2 + pizza_price(p)
  }
}

pub fn order_price_aux(order: List(Pizza), acc: Int) -> Int {
  case order {
    [] -> acc
    [order, ..rest] -> order_price_aux(rest, acc + pizza_price(order))
  }
}

pub fn order_price(order: List(Pizza)) -> Int {
  let add = case list.length(order) {
    1 -> 3
    2 -> 2
    _ -> 0
  }
  add + order_price_aux(order, 0)
}
