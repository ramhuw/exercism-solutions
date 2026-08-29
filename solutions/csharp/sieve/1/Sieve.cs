public static class Sieve
{
    public static int[] Primes(int limit)
    {
        var primes = new List<int>();
        var d = new bool[limit + 1];
        for (var i = 0; i <= limit; i++)
        {
            if (i == 0 || i == 1)
            {
                d[i] = false;
            }
            else
            {
                d[i] = true;
            }
        }
        for (var p = 2; p <= limit; p++)
        {
            if (d[p])
            {
                primes.Add(p);
                for (var q = 2 * p; q <= limit; q += p)
                {
                    d[q] = false;
                }
            }
        }
        return primes.ToArray();
    }
}