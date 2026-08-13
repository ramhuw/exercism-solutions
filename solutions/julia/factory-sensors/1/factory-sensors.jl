function humiditycheck(pct_humidity)
    pct_humidity > 70 && throw(ErrorException(string(pct_humidity)))
    pct_humidity <= 70 && @info "humidity level check passed: $pct_humidity%"
end

function temperaturecheck(temperature)
    isnothing(temperature) && throw(ArgumentError("sensor is broken"))
    temperature > 500 && throw(DomainError(temperature))
    temperature <= 500 && @info "temperature check passed: $temperature °C"
end

# define MachineError here
struct MachineError <: Exception end

function machinemonitor(pct_humidity, temperature)
    flag = false
    try
        humiditycheck(pct_humidity)
    catch e
        if e isa ErrorException
            @error "humidity level check failed: $(e.msg)%"
            flag = true
        end
    end
    try
        temperaturecheck(temperature)
    catch e
        if e isa ArgumentError
            @warn e.msg
            flag = true
        elseif e isa DomainError
            @error "overheating detected: $(e.val) °C"
            flag = true
        end
    end
    flag && throw(MachineError())
end
