function transform(ch)
    if ch == '-'
        "_"
    elseif ch == ' '
        ""
    elseif isuppercase(ch)
        "-" * lowercase(ch)
    elseif isdigit(ch)
        ""
    elseif ch >= 'α' && ch <= 'ω'
        "?"
    else
        string(ch)
    end
end

function clean(str)
    join([transform(ch) for ch in str])
end
