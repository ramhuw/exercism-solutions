open Base

module Int_map = Map.M(Int)
type school = string list Int_map.t

let empty_school = Map.empty (module Int)

let add (st : string) (gr : int) (sc : school) =
  Map.update sc gr ~f:(function
    | None -> [st]
    | Some names -> (st :: names))

let grade (gr : int) (sc : school) =
    match Map.find sc gr with 
    | None -> []
    | Some names -> names
let sorted (sc : school) =
    Map.map sc ~f:(
        fun names -> List.sort names ~compare:String.compare
    )

let roster (sc : school) : string list =
    Map.fold (sorted sc) ~init:[] ~f:(fun ~key:_ ~data:v acc -> List.append acc v)
