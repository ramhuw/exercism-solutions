

let age_on planet sec =
    let p = match planet with
            | "Earth" -> 1.0
            | "Mercury" -> 0.2408467
            | "Venus" -> 0.61519726
            | "Mars" -> 1.8808158
            | "Jupiter" -> 11.862615
            | "Saturn" -> 29.447498
            | "Uranus" -> 84.016846
            | "Neptune" -> 164.79132
            | _ -> 0.0
in if p = 0.0 then Error "not a planet" else Ok (float_of_int sec /. 31557600.0 /. p)
