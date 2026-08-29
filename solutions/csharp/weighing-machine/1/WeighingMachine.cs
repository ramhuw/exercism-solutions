class WeighingMachine(int precision)
{
    // TODO: define the 'Precision' property
    public int Precision
    {
        get
        {
            return precision;
        }
    }

    // TODO: define the 'Weight' property
    private double _weight = 0;
    public double Weight
    {
        get
        {
            return _weight;
        }
        set
        {
            if (value < 0)
            {
                throw new ArgumentOutOfRangeException();
            }
            _weight = value;
        }
    }

    // TODO: define the 'TareAdjustment' property
    public double TareAdjustment
    {
        get;
        set;
    } = 5.0;

    // TODO: define the 'DisplayWeight' property
    public string DisplayWeight
    {
        get
        {
            return Math.Round(Weight - TareAdjustment, Precision).ToString($"F{Precision}") + " kg";
        }
    }
}
