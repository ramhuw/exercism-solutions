function rationalize(successes, trials)
    successes .// trials
end

function probabilities(successes, trials)
    successes ./ trials
end

function checkmean(successes, trials)
    ras = rationalize(successes, trials)
    ra = sum(ras) // length(ras)
    rs = probabilities(successes, trials)
    r = sum(rs) / length(rs)
    float(ra) == r ? true : ra
end

function checkprob(successes, trials)
    ras = rationalize(successes, trials)
    ra = prod(ras)
    rs = probabilities(successes, trials)
    r = prod(rs)
    float(ra) == r ? true : ra
end
