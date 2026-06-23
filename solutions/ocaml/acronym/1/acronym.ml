let acronym s = 
  let x = String.split_on_char ' ' s 
  in let y = List.map (fun a -> String.split_on_char '-' a) x
  in let z = List.flatten y
  in let l = List.map (fun a -> String.split_on_char '_' a) z
  in let z = List.flatten l
  in let w = List.map (fun a -> Char.uppercase_ascii a.[0]) (List.filter (fun a -> String.length a <> 0) z)  
  in String.init (List.length w) (List.nth w)