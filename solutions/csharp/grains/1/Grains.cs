public static class Grains
{
    public static ulong Square(int n)
    {
        if (n <= 0 || n > 64)
        {
            throw new ArgumentOutOfRangeException();
        }
        else
        {
            return (ulong)Math.Pow(2, n - 1);
        }
    }

    public static ulong Total()
    {
        var ans = (ulong)0;
        var p = (ulong)1;
        for (var i = 0; i < 64; i++)
        {
            ans += p;
            p *= (ulong)2;
        }
        return ans;
    }
}