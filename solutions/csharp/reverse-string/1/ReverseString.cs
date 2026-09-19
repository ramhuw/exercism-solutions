public static class ReverseString
{
    public static string Reverse(string input)
    {
        if (input == null)
        {
            return "";
        }
        return new string(input.Reverse().ToArray());
    }
}