public static class CollatzConjecture
{
    public static int Steps(int number)
    {
        if (number < 1)
        {
            throw new ArgumentOutOfRangeException();
        }
        var n = number;
        var ans = 0;
        while (n != 1)
        {
            ans += 1;
            if (n % 2 == 0)
            {
                n /= 2;
            } else
            {
                n = 3 * n + 1;
            }
        }
        return ans;
    }
}