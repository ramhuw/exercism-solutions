public class LogLevels {
    
    public static String message(String logLine) {
        return logLine.split(": ")[1].strip();
    }

    public static String logLevel(String logLine) {
        var raw = logLine.split(": ")[0];
        return raw.substring(1, raw.length() - 1).toLowerCase();
    }

    public static String reformat(String logLine) {
        return String.format("%s (%s)", message(logLine), logLevel(logLine));
    }
}
