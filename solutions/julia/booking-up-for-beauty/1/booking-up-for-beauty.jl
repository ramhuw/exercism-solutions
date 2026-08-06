function schedule_appointment(appointment::String)
    DateTime(appointment, dateformat"m/d/yyyy H:M:S")
end

function has_passed(appointment::DateTime)
    appointment <= Dates.now()
end

function is_afternoon_appointment(appointment::DateTime)
    hour(appointment) >= 12 && hour(appointment) < 18
end

function describe(appointment::DateTime)
    Dates.format(appointment, dateformat"\Yo\u hav\e an a\p\point\m\ent on E, U d, yyyy at HH:MM")
end

function anniversary_date()
    Date(year(now()), 9, 15)
end
