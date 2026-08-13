function isisogram(s)
    ss = replace(lowercase(s), r"[^a-z]" => "")
    length(Set(ss)) == length(ss)
end
