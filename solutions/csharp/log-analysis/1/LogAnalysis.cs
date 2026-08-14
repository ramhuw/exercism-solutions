using Xunit.Sdk;

public static class LogAnalysis 
{
    // TODO: define the 'SubstringAfter()' extension method on the `string` type
    public static string SubstringAfter(this string logLine, string delimiter)
    {
        return logLine[(logLine.IndexOf(delimiter)+delimiter.Length)..];
    }

    // TODO: define the 'SubstringBetween()' extension method on the `string` type
    public static string SubstringBetween(this string logLine, string left, string right)
    {
        return logLine[(logLine.IndexOf(left) + left.Length)..logLine.IndexOf(right)];
    }
    
    // TODO: define the 'Message()' extension method on the `string` type
    public static string Message(this string logLine)
    {
        return logLine.Split(": ")[1];
    }

    // TODO: define the 'LogLevel()' extension method on the `string` type
    public static string LogLevel(this string logLine)
    {
        return logLine.Split(": ")[0].Trim('[').Trim(']');
    }
}