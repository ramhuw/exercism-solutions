function print_name_badge(id, name, department)
    a = ismissing(id) ? "" : "[$id] - "
    c = isnothing(department) ? " - OWNER" : " - $(uppercase(department))"
    a * name * c
end

function salaries_no_id(ids, salaries)
    n = length(ids)
    sum([salaries[i] for i in 1:n if ismissing(ids[i])], init=0)
end
