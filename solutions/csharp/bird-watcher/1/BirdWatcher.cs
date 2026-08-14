class BirdCount
{
    private int[] birdsPerDay;

    public BirdCount(int[] birdsPerDay)
    {
        this.birdsPerDay = birdsPerDay;
    }

    public static int[] LastWeek()
    {
        return new[] { 0, 2, 5, 3, 7, 8, 4};
    }

    public int Today()
    {
        return this.birdsPerDay.Last();
    }

    public void IncrementTodaysCount()
    {
        birdsPerDay[birdsPerDay.Length - 1] += 1;
    }

    public bool HasDayWithoutBirds()
    {
        return birdsPerDay.Any(x=>x==0);
    }

    public int CountForFirstDays(int numberOfDays)
    {
        var ans = 0;
        for (var i = 0; i < numberOfDays; i++)
        {
            ans += birdsPerDay[i];
        }
        return ans;
    }

    public int BusyDays()
    {
        return birdsPerDay.Count(x => x >= 5);
    }
}
