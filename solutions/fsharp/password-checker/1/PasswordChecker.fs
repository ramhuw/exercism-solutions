module PasswordChecker

type PasswordError =
    | LessThan12Characters
    | MissingUppercaseLetter
    | MissingLowercaseLetter
    | MissingDigit
    | MissingSymbol

/// Validate the given password against the rules defined in the instructions. If it meets all
/// of the rules, return a result indicating success; otherwise return a result indicating
/// failure and an error indicating which rule was violated.
let checkPassword (password: string) : Result<string, PasswordError> =
    match password with
    | s when String.length s < 12 -> Error LessThan12Characters
    | s when String.exists (fun c -> 'A' <= c && c <= 'Z') s |> not -> Error MissingUppercaseLetter
    | s when String.exists (fun c -> 'a' <= c && c <= 'z') s |> not -> Error MissingLowercaseLetter
    | s when String.exists (fun c -> '0' <= c && c <= '9') s |> not -> Error MissingDigit
    | s when String.exists (fun c -> "!@#$%^&*".Contains(c)) s |> not -> Error MissingSymbol
    | _ -> Ok password

/// Return a human-readable message indicating the meaning of the given result value.
let getStatusMessage (result: Result<string, PasswordError>) : string =
    match result with
    | Error LessThan12Characters -> "Error: does not have at least 12 characters"
    | Error MissingUppercaseLetter -> "Error: does not have at least one uppercase letter"
    | Error MissingLowercaseLetter -> "Error: does not have at least one lowercase letter"
    | Error MissingDigit -> "Error: does not have at least one digit"
    | Error MissingSymbol -> "Error: does not have at least one symbol"
    | Ok _ -> "OK"
