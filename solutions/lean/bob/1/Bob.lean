namespace Bob

def response (heyBob : String) : String :=
  let hey := heyBob.toList.filter (fun c => !c.isWhitespace)
  if hey.isEmpty then "Fine. Be that way!" else
    let isQuestion := hey.getLast? == some '?'
    let letters := hey.filter (fun c => c.isAlpha)
    let isYell := !letters.isEmpty && letters.all (fun c => c.toUpper == c)
    match isQuestion, isYell with
    | true, true => "Calm down, I know what I'm doing!"
    | true, false => "Sure."
    | false, true => "Whoa, chill out!"
    | _, _ => "Whatever."
end Bob
