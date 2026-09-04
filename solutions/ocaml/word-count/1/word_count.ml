let is_spliter (c : char) : bool =
    not (Char.code c >= Char.code 'A' && Char.code c <= Char.code 'Z' || Char.code c >= Char.code 'a' && Char.code c <= Char.code 'z' || Char.code c >= Char.code '0' && Char.code c <= Char.code '9' || c = '\'')

let rec tokenizer (chars : char list) (tokens : string list) (buffer : char list) : string list =
    match chars with
    | [] -> 
        let b = buffer |> List.to_seq |> Seq.drop_while (fun c -> c = '\'') |> List.of_seq in
        if List.length b = 0 then
            tokens |> List.rev
        else
            (b |> List.rev |> List.to_seq |> String.of_seq |> String.lowercase_ascii) :: tokens |> List.rev
    | c :: cc ->
        if is_spliter c then
            let b = buffer |> List.to_seq |> Seq.drop_while (fun c -> c = '\'') |> List.of_seq in
            if List.length b <> 0 then
                tokenizer cc ((b |> List.rev |> List.to_seq |> String.of_seq |> String.lowercase_ascii) :: tokens) []
            else
                tokenizer cc tokens []
        else
            if c = '\'' && buffer = [] then
                tokenizer cc tokens buffer
            else
                tokenizer cc tokens (c :: buffer)

open Base

let rec parser (ss : string list) : int Map.M(String).t = 
    match ss with
    | [] -> Map.empty (module String)
    | s :: ss -> 
        Map.update (parser ss)  s
            ~f:(fun v -> 
                match v with
                | None -> 1
                | Some n -> n + 1)

let word_count (s : string) =
    let chars = String.to_list s in
    let tokens = tokenizer chars [] [] in
    parser tokens