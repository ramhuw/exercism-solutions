module TisburyTreasureHunt

let getCoordinate (line: string * string) : string = snd line

let convertCoordinate (coordinate: string) : int * char =
    (int coordinate[0] - int '0', coordinate[1])

let compareRecords (azarasData: string * string) (ruisData: string * (int * char) * string) : bool =
    let (a, (b, c), d) = ruisData in snd azarasData = b.ToString() + c.ToString()

let createRecord
    (azarasData: string * string)
    (ruisData: string * (int * char) * string)
    : (string * string * string * string) =
    if compareRecords azarasData ruisData then
        let (a, b) = azarasData in
        let (c, (d, e), f) = ruisData in
        (b, c, f, a)
    else
        ("", "", "", "")
