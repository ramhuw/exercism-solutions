public static class BinarySearch
{
    public static int Find(int[] input, int value)
    {
        var left = 0;
        var right = input.Length - 1;
        while (left < right)
        {
            var middle = (left + right + 1) / 2;
            if (input[middle] <= value)
            {
                left = middle;
            }
            else
            {
                right = middle - 1;
            }
        }
        return input[left] == value ? left : -1;
    }
}