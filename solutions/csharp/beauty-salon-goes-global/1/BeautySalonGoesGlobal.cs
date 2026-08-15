using System.Globalization;
using System.Runtime.InteropServices;

public enum Location
{
    NewYork,
    London,
    Paris
}

public enum AlertLevel
{
    Early,
    Standard,
    Late
}

public static class Appointment
{
    public static DateTime ShowLocalTime(DateTime dtUtc)
    {
        return dtUtc.ToLocalTime();
    }

    public static DateTime Schedule(string appointmentDateDescription, Location location)
    {
        if (RuntimeInformation.IsOSPlatform(OSPlatform.OSX) || RuntimeInformation.IsOSPlatform(OSPlatform.Linux))
        {
            switch (location)
            {
                case Location.NewYork:
                    return TimeZoneInfo.ConvertTimeToUtc(DateTime.Parse(appointmentDateDescription), TimeZoneInfo.FindSystemTimeZoneById("America/New_York"));
                case Location.London:
                    return TimeZoneInfo.ConvertTimeToUtc(DateTime.Parse(appointmentDateDescription), TimeZoneInfo.FindSystemTimeZoneById("Europe/London"));
                case Location.Paris:
                    return TimeZoneInfo.ConvertTimeToUtc(DateTime.Parse(appointmentDateDescription), TimeZoneInfo.FindSystemTimeZoneById("Europe/Paris"));
            }
        }
        else
        {
            switch (location)
            {
                case Location.NewYork:
                    return TimeZoneInfo.ConvertTimeToUtc(DateTime.Parse(appointmentDateDescription), TimeZoneInfo.FindSystemTimeZoneById("Eastern Standard Time"));
                case Location.London:
                    return TimeZoneInfo.ConvertTimeToUtc(DateTime.Parse(appointmentDateDescription), TimeZoneInfo.FindSystemTimeZoneById("GMT Standard Time"));
                case Location.Paris:
                    return TimeZoneInfo.ConvertTimeToUtc(DateTime.Parse(appointmentDateDescription), TimeZoneInfo.FindSystemTimeZoneById("W. Europe Standard Time"));
            }
        }
        return DateTime.Now;
    }

    public static DateTime GetAlertTime(DateTime appointment, AlertLevel alertLevel)
    {
        switch (alertLevel)
        {
            case AlertLevel.Early:
                return appointment - TimeSpan.FromDays(1);
            case AlertLevel.Standard:
                return appointment - TimeSpan.FromMinutes(105);
            case AlertLevel.Late:
                return appointment - TimeSpan.FromMinutes(30);
        }
        return DateTime.Now;
    }

    public static bool HasDaylightSavingChanged(DateTime dt, Location location)
    {
        var zone = RuntimeInformation.IsOSPlatform(OSPlatform.OSX) || RuntimeInformation.IsOSPlatform(OSPlatform.Linux) ? location switch
        {
            Location.NewYork => TimeZoneInfo.FindSystemTimeZoneById("America/New_York"),
            Location.London => TimeZoneInfo.FindSystemTimeZoneById("Europe/London"),
            Location.Paris => TimeZoneInfo.FindSystemTimeZoneById("Europe/Paris"),
            _ => TimeZoneInfo.Utc
        } : location switch
        {
            Location.NewYork => TimeZoneInfo.FindSystemTimeZoneById("Eastern Standard Time"),
            Location.London => TimeZoneInfo.FindSystemTimeZoneById("GMT Standard Time"),
            Location.Paris => TimeZoneInfo.FindSystemTimeZoneById("W. Europe Standard Time"),
            _ => TimeZoneInfo.Utc
        };
        bool now = zone.IsDaylightSavingTime(dt);
        bool before = zone.IsDaylightSavingTime(dt - TimeSpan.FromDays(7));

        return now != before;
    }

    public static DateTime NormalizeDateTime(string dtStr, Location location)
    {
        CultureInfo culture = location switch
    {
        Location.London => new CultureInfo("en-GB"),
        Location.NewYork => new CultureInfo("en-US"),
        Location.Paris => new CultureInfo("fr-FR"),
        _ => CultureInfo.InvariantCulture
    };

    return DateTime.TryParse(
        dtStr,
        culture,
        DateTimeStyles.None,
        out DateTime result
    )
        ? result
        : DateTime.MinValue;
    }
}
