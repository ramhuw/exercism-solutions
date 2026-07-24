function is_valid_command(msg)
    occursin(r"^Chatbot"i, msg)
end

function remove_emoji(msg)
    replace(msg, r"emoji\S*" => "")
end

function check_phone_number(number)
    occursin(r"^\(\+\d{2}\) \d{3}-\d{3}-\d{3}$", number) ? "Thanks! You can now download me to your phone." : "Oops, it seems like I can't reach out to $number" 
end

function getURL(msg)
    ms = eachmatch(r"\S+(\.\S+)+", msg)
    [m.match for m in ms]
end

function nice_to_meet_you(str)
    m = match(r"(\S+), (\S+)", str)
    c = m.captures
    "Nice to meet you, $(c[2]) $(c[1])"
end
