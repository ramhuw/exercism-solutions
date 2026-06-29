let count_char (word: string) (c: char): int =
    String.fold_left (fun acc s -> if s = c then acc + 1 else acc) 0 word
let is_isogram (word: string) : bool =
    let abc = List.init 26 (fun i -> Char.chr (Char.code 'a' + i)) in
    List.for_all (fun c -> count_char (String.lowercase_ascii word) c <= 1) abc

