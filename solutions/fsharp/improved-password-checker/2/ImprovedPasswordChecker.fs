module ImprovedPasswordChecker

open System

[<Flags>]
type PasswordError =
    | LessThan12Characters = 1
    | MissingUppercaseLetter = 2
    | MissingLowercaseLetter = 4
    | MissingDigit = 8
    | MissingSymbol = 16

/// Validate the given password against the rules defined in the instructions. If it meets all
/// of the rules, return a result indicating success; otherwise return a result indicating
/// failure with an error value indicating all of the rules that were violated.
let rec check_aux (password: string) (n: int) (r: Result<string, PasswordError>) : Result<string, PasswordError> =
    let single =
        match n with
        | 0 -> Ok password
        | 1 ->
            if String.length password < 12 then
                Error PasswordError.LessThan12Characters
            else
                Ok password
        | 2 ->
            if String.exists (fun c -> 'A' <= c && c <= 'Z') password |> not then
                Error PasswordError.MissingUppercaseLetter
            else
                Ok password
        | 3 ->
            if String.exists (fun c -> 'a' <= c && c <= 'z') password |> not then
                Error PasswordError.MissingLowercaseLetter
            else
                Ok password
        | 4 ->
            if String.exists (fun c -> '0' <= c && c <= '9') password |> not then
                Error PasswordError.MissingDigit
            else
                Ok password
        | 5 ->
            if String.exists (fun c -> "!@#$%^&*".Contains(c)) password |> not then
                Error PasswordError.MissingSymbol
            else
                Ok password
        | _ -> Ok password

    let nr =
        match single, r with
        | Error e, Error e' -> Error(e ||| e')
        | Error e, _ -> single
        | _, Error e' -> r
        | _, _ -> single

    if n = 0 then nr else check_aux password (n - 1) nr

let checkPassword (password: string) : Result<string, PasswordError> = check_aux password 5 (Ok password)

/// Return a list of human-readable phrases indicating the meaning of the given result value.
let getStatusPhrases (result: Result<string, PasswordError>) : string list =
    match result with
    | Ok _ -> []
    | Error e ->
        if e.HasFlag(PasswordError.LessThan12Characters) then
            [ "12 characters" ]
        else
            []
        @ if e.HasFlag(PasswordError.MissingUppercaseLetter) then
              [ "uppercase letter" ]
          else
              []
        @ if e.HasFlag(PasswordError.MissingLowercaseLetter) then
              [ "lowercase letter" ]
          else
              []
        @ if e.HasFlag(PasswordError.MissingDigit) then
              [ "digit" ]
          else
              []
        @ if e.HasFlag(PasswordError.MissingSymbol) then
              [ "symbol" ]
          else
              []
