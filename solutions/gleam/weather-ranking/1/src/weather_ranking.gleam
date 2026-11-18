import gleam/float
import gleam/list
import gleam/order.{type Order}

pub type City {
  City(name: String, temperature: Temperature)
}

pub type Temperature {
  Celsius(Float)
  Fahrenheit(Float)
}

pub fn fahrenheit_to_celsius(f: Float) -> Float {
  { f -. 32.0 } *. 5.0 /. 9.0
}

pub fn compare_temperature(left: Temperature, right: Temperature) -> Order {
  let l = case left {
    Celsius(c) -> c
    Fahrenheit(f) -> fahrenheit_to_celsius(f)
  }
  let r = case right {
    Celsius(c) -> c
    Fahrenheit(f) -> fahrenheit_to_celsius(f)
  }
  float.compare(l, r)
}

pub fn sort_cities_by_temperature(cities: List(City)) -> List(City) {
  list.sort(cities, by: fn(city1, city2) {
    compare_temperature(city1.temperature, city2.temperature)
  })
}
