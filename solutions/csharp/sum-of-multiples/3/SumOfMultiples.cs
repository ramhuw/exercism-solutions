public static class SumOfMultiples
{
    public static int Sum(IEnumerable<int> multiples, int max)
    {
        bool[] a = Enumerable.Repeat(false, max).ToArray();
        foreach (var x in multiples) {
            var y = x;
            while (y != 0 && y < max)
            {
                a[y] = true;
                y += x;
            }
        }
        var ans = 0;
        for (var i = 0; i < max; i++)
        {
            if (a[i])
            {
                ans += i;
            }
        }
        return ans;
    }
}