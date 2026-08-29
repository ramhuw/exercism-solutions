public static class SquareRoot
{
    public static int Root(int number)
    {
        var left = 0;
        var right = number;
        while (left < right)
        {
            var middle = (left + right + 1) / 2;
            if (number / middle >= middle)
            {
                left = middle;
            }
            else
            {
                right = middle - 1;
            }
        }
        return left;
    }
}
