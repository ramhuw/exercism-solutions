namespace SumOfMultiples

def sum (factors : List UInt64) (limit : UInt64) : UInt64 :=
  List.range (limit - 1).toNat |> List.map (fun i ↦ i + 1) |> List.filter (fun n ↦ List.any factors (fun d ↦ n % d.toNat == 0)) |> List.foldl (fun acc a ↦ acc + a) 0 |>.toUInt64

end SumOfMultiples
