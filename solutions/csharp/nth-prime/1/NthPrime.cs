public static class NthPrime
{
    public static int Prime(int nth)
    {
        var primes = new List<int>();
        var p = 2;
        for (var i = 0; i < nth; i++)
        {
            while (primes.Any(q => p % q == 0))
            {
                p++;
            }
            primes.Add(p++);
        }
        return p - 1;
    }
}