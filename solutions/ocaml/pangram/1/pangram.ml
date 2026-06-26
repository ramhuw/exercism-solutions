let is_pangram s =
    let l = String.lowercase_ascii s in
    let ab = List.init 26 (fun i -> Char.chr (Char.code 'a' + i)) in
    List.for_all (fun c -> String.contains l c) ab