module LogLevels

let message (logLine: string): string =
    logLine.Split(':').[1].Trim() in
    

let logLevel(logLine: string): string = 
    let s = logLine.Split(':').[0].Trim() in
    let n = s.Length in
    s[1..n-2].ToLower()
let reformat(logLine: string): string = 
    let a = message logLine in
    let b = logLevel logLine in
    sprintf "%s (%s)" a b