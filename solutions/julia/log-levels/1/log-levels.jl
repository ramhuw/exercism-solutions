function message(msg)
    join(split(msg)[2:end], " ")
end

function log_level(msg)
    lowercase(split(msg)[1][2:end-2])
end

function reformat(msg)
    m = message(msg)
    l = log_level(msg)
    "$m ($l)"
end
