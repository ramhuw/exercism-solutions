function sortquantity!(qty)
    ans = sortperm(qty, rev=true)
    qty[:] = qty[ans]
    ans
end

function sortcustomer(cust, srtperm)
    cust[srtperm]
end

function production_schedule!(cust, qty)
    ans2 = sortperm(qty, rev=true)
    qty[:] = qty[ans2]
    (cust[ans2], invperm(ans2))
end
