pub type Player {
  Black
  White
}
import gleam/result
pub type Game {
  Game(
    white_captured_stones: Int,
    black_captured_stones: Int,
    player: Player,
    error: String,
  )
}
fn change_player(game: Game) -> Game {
  let new_player = case game.player {
    White -> Black
    Black -> White
  }
  Game(..game, player: new_player)
}
pub fn apply_rules(
  game: Game,
  rule1: fn(Game) -> Result(Game, String),
  rule2: fn(Game) -> Game,
  rule3: fn(Game) -> Result(Game, String),
  rule4: fn(Game) -> Result(Game, String),
) -> Game {
  case Ok(game) |> result.try(rule1) |> result.map(rule2) |> result.try(rule3) |> result.try(rule4) {
    Ok(g) -> g |> change_player()
    Error(e) -> Game(..game, error: e)
  }
}
