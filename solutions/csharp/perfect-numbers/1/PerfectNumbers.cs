public enum Classification
{
    Perfect,
    Abundant,
    Deficient
}

public static class PerfectNumbers
{
    public static Classification Classify(int number)
    {
        if (number <= 0)
        {
            throw (new ArgumentOutOfRangeException());
        }
        else if (number == 1)
        {
            return Classification.Deficient;
        }
        var i = 1;
        var ans = 0;
        while (i * i < number)
        {
            if (number % i == 0)
            {
                ans += i + number / i;
            }
            i += 1;
        }
        if (i * i == number)
        {
            ans += i;
        }
        ans -= number;
        if (ans == number)
        {
            return Classification.Perfect;
        }
        else if (ans < number)
        {
            return Classification.Deficient;
        }
        else
        {
            return Classification.Abundant;
        }
    }
}
