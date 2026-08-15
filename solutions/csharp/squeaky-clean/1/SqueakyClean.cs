using System.Text;

public static class Identifier
{
    public static string Clean(string identifier)
    {
        var ans = new StringBuilder(identifier);
        ans.Replace(' ', '_');
        ans.Replace("\0", "CTRL");
        for (var i = 0; i < ans.Length; i++)
        {
            if (ans[i] == '-' && i + 1 < ans.Length)
            {
                ans[i+1] = char.ToUpper(ans[i+1]);
            }
        }
        var s = ans.ToString();
        return new string(s.Where(c => char.IsLetter(c) || c == '_').Where(c => c > 'ω' || c < 'α').ToArray());
    }
}
