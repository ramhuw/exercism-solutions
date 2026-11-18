import gleam/option.{type Option}

pub fn two_fer(name: Option(String)) -> String {
  let n = case name {
    option.None -> "you"
    option.Some(x) -> x
  }
  "One for " <> n <> ", one for me."
}
