public class Player
{
    private System.Random R = new System.Random();
    public int RollDie()
    {
        return this.R.Next(1, 19);
    }

    public double GenerateSpellStrength()
    {
        return this.R.NextDouble() * 100;
    }
}
