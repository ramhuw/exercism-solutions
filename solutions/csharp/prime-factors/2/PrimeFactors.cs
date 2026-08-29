public static class PrimeFactors
{
    public static long[] Factors(long number)
    {
        var fs = new List<long>();
        long p = 2;
        var n = number;
        while (n != 1)
        {
            while (n % p != 0)
            {
                p += 1;
                if (p * p > n)
                {
                    p = n;
                }
            }
            while (n % p == 0)
            {
                n /= p;
                fs.Add(p);
            }
        }
        return [.. fs];
    }
}