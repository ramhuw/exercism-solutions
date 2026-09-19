using System.Text;

public static class Raindrops
{
    public static string Convert(int number)
    {
        var a = number % 3 == 0;
        var b = number % 5 == 0;
        var c = number % 7 == 0;
        if (!a && !b && !c)
        {
            return number.ToString();
        }
        var ans = new StringBuilder();
        if (a)
        {
            ans.Append("Pling");
        }
        if (b)
        {
            ans.Append("Plang");
        }
        if (c)
        {
            ans.Append("Plong");
        }
        return ans.ToString();
    }
}