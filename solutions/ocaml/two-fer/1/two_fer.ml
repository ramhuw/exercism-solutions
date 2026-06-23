let two_fer s =
  let ans = match s with
            | Some c -> c
            | None -> "you"
  in Printf.sprintf "One for %s, one for me." ans
