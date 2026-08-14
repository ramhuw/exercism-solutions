class RemoteControlCar
{
    // TODO: define the constructor for the 'RemoteControlCar' class
    public int speed;
    public int batteryDrain;

    public RemoteControlCar(int speed, int batteryDrain)
    {
        this.speed = speed;
        this.batteryDrain = batteryDrain;
    }
    public int battery = 100;
    public int distance = 0;
    public bool BatteryDrained()
    {
        return battery < batteryDrain;
    }

    public int DistanceDriven()
    {
        return distance;
    }

    public void Drive()
    {
        if (battery >= batteryDrain)
        {
            distance += speed;
            battery -= batteryDrain;
        }
    }

    public static RemoteControlCar Nitro()
    {
        return new RemoteControlCar(50, 4);
    }
}

class RaceTrack
{
    // TODO: define the constructor for the 'RaceTrack' class
    private int distance;
    public RaceTrack(int distance)
    {
        this.distance = distance;
    }
    public bool TryFinishTrack(RemoteControlCar car)
    {
        while (car.DistanceDriven() < this.distance)
        {
            if (car.BatteryDrained())
            {
                return false;
            } else
            {
                car.Drive();
            }
        }
        return true;
    }
}
