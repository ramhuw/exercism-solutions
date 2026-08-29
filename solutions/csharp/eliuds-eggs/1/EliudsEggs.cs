public static class EliudsEggs
{
    public static int EggCount(int encodedCount)
    {
        var ans = 0;
        var e = encodedCount;
        while (e != 0)
        {
            ans += e & 1;
            e >>= 1;
        }
        return ans;
    }
}
