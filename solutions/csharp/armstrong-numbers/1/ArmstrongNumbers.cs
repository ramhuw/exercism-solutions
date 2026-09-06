public static class ArmstrongNumbers
{
    public static bool IsArmstrongNumber(int number)
    {
        if (number < 0)
        {
            return false;
        }
        var n = number;
        var digits = new List<int>();
        var l = 0;
        do
        {
            digits.Add(n % 10);
            n /= 10;
            l += 1;
        } while (n != 0);
        var ans = 0;
        foreach (var d in digits)
        {
            ans += (int)Math.Pow(d, l);
        }
        return ans == number;
    }
}