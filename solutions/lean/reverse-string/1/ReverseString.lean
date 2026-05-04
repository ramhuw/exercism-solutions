namespace ReverseString

partial def reverse (value : String) : String :=
  if value.length <= 1
    then value
    else String.ofList ((reverse (String.ofList value.toList.tail!)).toList ++ [value.toList.head!])

end ReverseString
