function get_vector_of_wagons(args...)
    collect(args)
end

function fix_vector_of_wagons(each_wagons_id, missing_wagons)
    [each_wagons_id[3]; missing_wagons; each_wagons_id[4:end]; each_wagons_id[1:2]]
end

function add_missing_stops(route, stops...)
    merge(route, Dict("stops" => [last(stop) for stop in stops]))
end

function extend_route_information(route; more_route_information...)
    newRoute = Dict([first(info) => last(info) for info in more_route_information])
    merge(route, newRoute)
end
