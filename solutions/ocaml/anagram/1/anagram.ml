let f (a : string) = 
  let x = String.lowercase_ascii a
  in let y = List.init (String.length x) (String.get x) 
  in List.sort compare y

let anagrams a arr =
    List.filter (fun b -> f a = f b && String.lowercase_ascii a <> String.lowercase_ascii b) arr