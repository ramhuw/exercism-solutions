type item = {
    weight : int;
    value : int;
}

let rec update (items: item list) (result: int array) =
  match items with
  | [] -> ()
  | i::is ->
    let () = update is result in
    for j = Array.length result - 1 downto 0  do
      if j + i.weight <= Array.length result - 1 && result.(j) <> -1 then
        result.(j+i.weight) <- max result.(j+i.weight) (result.(j) + i.value)
    done


let maximum_value (items: item list) (capacity: int): int =
  let result = Array.init (capacity+1) (fun i -> if i = 0 then 0 else -1) in
  let () = update items result in
  let ans = ref 0 in
  let () = for i = 0 to capacity do
    if !ans < result.(i) then
      ans := result.(i)
  done
  in !ans
