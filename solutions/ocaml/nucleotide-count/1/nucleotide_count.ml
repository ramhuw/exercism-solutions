open Base

let empty = Map.empty (module Char)

let rec count_nucleotide (s : string) (c : char) : (int, char) result =
  match c with
  | 'A' | 'T' | 'C' | 'G' ->
  (if String.length s = 0 then Ok 0 else
    match count_nucleotide (String.sub s ~pos:1 ~len:(String.length s - 1)) c with
    | Ok ps -> (match s.[0] with
      | 'A' | 'C' | 'T' | 'G' -> (if Char.equal s.[0] c then Ok (1 + ps) else Ok ps)
      | _ -> Error s.[0])
    | Error e -> Error e)
  | _ -> Error c

let rec count_nucleotides s =
  if String.length s = 0 then Ok empty else
    match count_nucleotides (String.sub s ~pos:1 ~len: (String.length s - 1)) with
    | Error e -> Error e
    | Ok mm -> (
      match s.[0] with
      | 'A' | 'T' | 'C' | 'G' -> (
         Ok (Map.update mm s.[0] ~f:(
          fun c -> match c with
          | None -> 1
          | Some cx -> cx + 1
        )
      ))
      | _ -> Error s.[0]
 )
    
  

