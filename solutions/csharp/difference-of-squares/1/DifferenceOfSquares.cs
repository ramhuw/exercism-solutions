public static class DifferenceOfSquares
{
    public static int CalculateSquareOfSum(int max)
    {
        var ans = 0;
        for (var i = 1; i <= max; i++)
        {
            ans += i;
        }
        return ans * ans;
    }

    public static int CalculateSumOfSquares(int max)
    {
        var ans = 0;
        for (var i = 1; i <= max; i++)
        {
            ans += i * i;
        }
        return ans;
    }

    public static int CalculateDifferenceOfSquares(int max)
    {
        return CalculateSquareOfSum(max) - CalculateSumOfSquares(max);
    }
}