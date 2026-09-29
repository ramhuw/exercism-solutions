import gleam/int
import gleam/option.{type Option, None, Some}

pub type Player {
  Player(name: Option(String), level: Int, health: Int, mana: Option(Int))
}

pub fn introduce(player: Player) -> String {
  case player.name {
    Some(x) -> x
    None -> "Mighty Magician"
  }
}

pub fn revive(player: Player) -> Option(Player) {
  let mana = case player.level {
    i if i >= 10 -> Some(100)
    _ -> player.mana
  }
  case player.health {
    0 -> Some(Player(..player, health: 100, mana: mana))
    _ -> None
  }
}

pub fn cast_spell(player: Player, cost: Int) -> #(Player, Int) {
  case player.mana {
    None -> #(Player(..player, health: int.max(0, player.health - cost)), 0)
    Some(m) if m >= cost -> #(Player(..player, mana: Some(m - cost)), 2 * cost)
    _ -> #(player, 0)
  }
}
