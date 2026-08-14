static class AssemblyLine
{
    public static double SuccessRate(int speed)
    {
        if (speed == 0)
        {
            return 0.0;
        } else if (1 <= speed && speed <= 4)
        {
            return 1.0;
        } else if (5 <= speed && speed <= 8)
        {
            return 0.9;
        } else if (speed == 9)
        {
            return 0.8;
        } else
        {
            return 0.77;
        }
    }
    
    public static double ProductionRatePerHour(int speed)
    {
        return speed * 221.0 * AssemblyLine.SuccessRate(speed);
    }

    public static int WorkingItemsPerMinute(int speed)
    {
        return (int)(AssemblyLine.ProductionRatePerHour(speed)) / 60;
    }
}
