import gleam/string

// Please define the TreasureChest type
pub opaque type TreasureChest(t) {
  Chest(password: String, contents: t)
}
pub fn create(
  password: String,
  contents: treasure,
) -> Result(TreasureChest(treasure), String) {
  case password |> string.length < 8 {
    True -> Error("Password must be at least 8 characters long")
    False -> Ok(Chest(password, contents))
  }
}

pub fn open(
  chest: TreasureChest(treasure),
  password: String,
) -> Result(treasure, String) {
  case chest.password == password {
    True -> Ok(chest.contents)
    False -> Error("Incorrect password")
  }
}
