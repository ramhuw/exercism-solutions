function wordcount(sentence)
    d = Dict()
    for m in eachmatch(r"[A-Za-z0-9]+(?:'[A-Za-z0-9]+)*", sentence)
        word = lowercase(m.match)
        d[word] = get(d, word, 0) + 1
    end
    d
end
