open Base

type node = {
    value : int;
    left : node option;
    right : node option;
}

type bst = node option
let empty : bst = None

let value t = match t with
  | None -> Error ""
  | Some n -> Ok n.value

let left t = match t with
  | None -> Error ""
  | Some n -> Ok n.left

let right t = match t with
  | None -> Error ""
  | Some n -> Ok n.right

let rec insert x t = match t with
  | None -> Some { value = x; left = None; right = None }
  | Some n -> 
    let v = n.value in
      if x <= v then Some { value = v; left = insert x n.left; right = n.right } else 
        Some { value = v; left = n.left; right = insert x n.right}

let rec to_list t = match t with
        | None -> []
        | Some n -> List.concat [to_list n.left; [n.value]; to_list n.right]

