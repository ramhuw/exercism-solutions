"""
    ispangram(input)

Return `true` if `input` contains every alphabetic character (case insensitive).

"""
function ispangram(input)
    length(Set(replace(lowercase(input), r"[^a-z]" => ""))) == 26
end

