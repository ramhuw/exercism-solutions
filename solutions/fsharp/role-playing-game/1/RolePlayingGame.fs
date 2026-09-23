module RolePlayingGame

type Player =
    { Name: string option
      Level: int
      Health: int
      Mana: int option }

let introduce (player: Player) : string =
    match player.Name with
    | Some n -> n
    | None -> "Mighty Magician"

let revive (player: Player) : Player option =
    match player.Health with
    | 0 when player.Level >= 10 ->
        Some
            { player with
                Health = 100
                Mana = Some 100 }
    | 0 -> Some { player with Health = 100 }
    | _ -> None

let castSpell (manaCost: int) (player: Player) : Player * int =
    match player.Mana with
    | Some m when m >= manaCost ->
        ({ player with
            Mana = Some(m - manaCost) },
         2 * manaCost)
    | None ->
        ({ player with
            Health = max 0 (player.Health - manaCost) }),
        0
    | _ -> (player, 0)
