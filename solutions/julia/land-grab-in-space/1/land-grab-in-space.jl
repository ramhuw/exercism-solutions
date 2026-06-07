# define the Coord type
struct Coord
    x::UInt16
    y::UInt16
end

# define the Plot keyword type
@kwdef struct Plot
    bottom_left::Coord
    top_right::Coord
end

function is_claim_staked(claim::Plot, register::Set{Plot})
    return claim in register
end

function stake_claim!(claim::Plot, register::Set{Plot})
    if is_claim_staked(claim, register)
        return false
    else
        push!(register, claim)
        return true
    end
end

function get_longest_side(claim::Plot)
    a = claim.bottom_left
    b = claim.top_right
    return max(b.x - a.x, b.y - a.y)
end

function get_claim_with_longest_side(register::Set{Plot})
    side = 0
    for claim in register
        side = max(side, get_longest_side(claim))
    end
    return Set(claim for claim in register if get_longest_side(claim) == side)
end
